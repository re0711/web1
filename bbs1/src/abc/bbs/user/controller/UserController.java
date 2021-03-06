package abc.bbs.user.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import abc.bbs.user.pojo.User;
import abc.bbs.user.pojo.UserFan;
import abc.bbs.user.pojo.UserFanVo;
import abc.bbs.bbs.pojo.BbsQueryVo;
import abc.bbs.category.pojo.Category;
import abc.bbs.bbs.service.BbsService;
import abc.bbs.category.service.CategoryService;
import abc.bbs.user.service.UserService;

@Controller
public class UserController {

	@Autowired
	UserService userService;

	@Autowired
	BbsService bbsService;

	@Autowired
	CategoryService categoryService;

	Map result;

	@ModelAttribute
	void Init() {
		result = new HashMap<>();
	}

	@RequestMapping(value = "/toLogin.action")
	public String toLogin(Model model) {

		return "login";
	}

	@RequestMapping(value = "/login.action")
	public String login(Model model, User user, HttpSession session) {

		if (StringUtils.isEmpty(user.getUsername()) || StringUtils.isEmpty(user.getPassword())) {
			String msg = "Incorrect username or password";
			model.addAttribute("msg", msg);
			return "login";
		}

		List<User> list = userService.selectUserByTerm(user);
		if (list == null || list.size() <= 0) {
			String msg = "Incorrect username or password";
			model.addAttribute("msg", msg);
			return "login";
		}

		User loginUser = list.get(0);
		session.setAttribute("loginUser", loginUser);
		return "redirect:/index.action ";
	}

	@RequestMapping(value = "/logout.action")
	public String logout(HttpSession session) {
		session.setAttribute("loginUser", null);
		return "redirect:/index.action";
	}

	// 个人中心
	@RequestMapping(value = "/center.action")
	public String center(HttpSession session, Model model, Integer id) {
		List<Category> categoryList = categoryService.selectAllCategory();
		session.setAttribute("categoryList", categoryList);

		BbsQueryVo vo = bbsService.selectUserBbs(id);
		User user = userService.selectUserById(id);
		vo.setUser(user);

		model.addAttribute("bbsvo", vo);
		return "center";
	}

	@RequestMapping(value = "/userEdit.action")
	public String userEdit(HttpSession session, Integer id) {
		User user = userService.selectUserById(id);
		session.setAttribute("loginUser", user);
		return "userEdit";
	}

	// 注册或修改用户
	@RequestMapping(value = "/userSave.action")
	public String userSave(Model model, User user, MultipartFile photo1, HttpSession session) throws Exception {

		// 图片不为空，则添加图片
		if (!photo1.isEmpty()) {
			String picName = UUID.randomUUID().toString();
			String path = session.getServletContext().getRealPath("upload/");

			// 删除原先的图片（如果有的话）
			/*
			 * User loginUser = (User) session.getAttribute("loginUser"); if
			 * (loginUser.getPhoto() != null && loginUser.getPhoto() != "f.jpg")
			 * { new File(path + loginUser.getPhoto()).delete(); }
			 */

			// 获取文件名
			String oriName = photo1.getOriginalFilename();
			// 获取图片后缀
			String extName = oriName.substring(oriName.lastIndexOf("."));

			// 开始上传
			String url = path + picName + extName;
			photo1.transferTo(new File(url));

			user.setPhoto(picName + extName);
			/*result.put("error", 0);
			result.put("url", url);*/
		}

		// 传了id，那么一定是更新，否则就是注册
		if (user.getId() != null) {
			userService.updateUser(user);
			User u = (User) session.getAttribute("loginUser");
			return "redirect:/login.action?username=" + u.getUsername()+"&password="+u.getPassword();
		} else {
			String msg;
			if ((user.getUsername() == null || user.getUsername().trim().isEmpty())
					|| (user.getPassword() == null || user.getPassword().trim().isEmpty())) {
				msg = "用户名或密码不能为空！";
				model.addAttribute("msg", msg);
				return "regist";
			}
			userService.regist(user);
			return "redirect:/index.action";
		}
	}

	// 校验用户名是否重复
	@RequestMapping(value = "/validateUsername.action")
	public @ResponseBody String validateUsername(String username) {
		User userexp = new User();
		userexp.setUsername(username);
		List<User> list = userService.selectUserByTerm(userexp);
		if (list == null || list.size() <= 0) {
			return "O";
		}

		return "";
	}

	// 到注册页面
	@RequestMapping(value = "/toRegist.action")
	public String toRegist() {
		return "regist";
	}

	// 增或减粉丝数量
	@RequestMapping(value = "/funCount.action")
	public void funCount(UserFan fan) {
		userService.opratefunCount(fan);
	}

	// 是否关联(显示关注 或 已关注 按钮)
	@RequestMapping(value = "/getFollow.action")
	@ResponseBody
	public String getFollow(UserFan fan) {
		String status = userService.getFollow(fan);
		return status;
	}

	// 查看粉丝或关注
	@RequestMapping(value = "/showFanOrFollow.action")
	// 用户id fan follow
	public String showFanOrFollow(HttpSession session, Model model, Integer id, String type) {
		List<Category> categoryList = categoryService.selectAllCategory();
		session.setAttribute("categoryList", categoryList);
		UserFanVo vo = userService.showFanOrFollow(id, type);

		model.addAttribute("bbsvo", vo);
		model.addAttribute("type", type);
		return "followAndFan";
	}
	
	@RequestMapping(value = "/pic.action")
	public @ResponseBody String pic(MultipartFile photo1,HttpSession session) throws Exception {
		// 设置图片名称，不能重复，可以使用uuid
		String picName = UUID.randomUUID().toString();

		// 获取文件名
		String oriName = photo1.getOriginalFilename();
		// 获取图片后缀
		String extName = oriName.substring(oriName.lastIndexOf("."));
		String path = session.getServletContext().getRealPath("upload/");
		// 开始上传
		String url = path + picName + extName;
		photo1.transferTo(new File(url));
		
		return url;
	}
	
	@RequestMapping(value = "/pic2.action")
	public @ResponseBody Map pic2(MultipartFile photo1,HttpSession session) throws Exception {
		// 设置图片名称，不能重复，可以使用uuid
		String picName = UUID.randomUUID().toString();

		// 获取文件名
		String oriName = photo1.getOriginalFilename();
		// 获取图片后缀
		String extName = oriName.substring(oriName.lastIndexOf("."));
		String path = session.getServletContext().getRealPath("upload/");
		// 开始上传
		String url = path + picName + extName;
		photo1.transferTo(new File(url));
		 url = "upload/"+picName + extName;
		//5、返回map
		result.put("error", 0);
		result.put("url", url);

		return result;
	}

}

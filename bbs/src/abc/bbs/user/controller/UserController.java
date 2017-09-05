package abc.bbs.user.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

	private static final String User = null;

	@Autowired
	UserService userService;

	@Autowired
	BbsService bbsService;

	@Autowired
	CategoryService categoryService;

	@RequestMapping(value = "/toLogin.action")
	public String toLogin(Model model) {

		return "login";
	}

	@RequestMapping(value = "/login.action")
	public String login(Model model, User user, HttpSession session) {
		if (user.getUsername().trim() == "" || user.getPassword().trim() == "") {
			String msg = "用户名或密码不能为空";
			model.addAttribute("msg", msg);
			return "login";
		}

		List<User> list = userService.selectUserByTerm(user);
		if (list == null || list.size() <= 0) {
			String msg = "用户名或密码错误";
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
	public String userSave(Model model, User user, MultipartFile photo1,HttpSession session) throws Exception {

		//图片不为空，则添加图片
		if (!photo1.isEmpty()) {
			String picName = UUID.randomUUID().toString();
			String path = "f:/haha/img/";
			
			//删除原先的图片（如果有的话）
			User loginUser = (User)session.getAttribute("loginUser");
			if(loginUser.getPhoto()!=null&&loginUser.getPhoto()!="f.jpg"){
				new File(path+loginUser.getPhoto()).delete();
			}

			// 获取文件名
			String oriName = photo1.getOriginalFilename();
			// 获取图片后缀
			String extName = oriName.substring(oriName.lastIndexOf("."));
			
			// 开始上传
			photo1.transferTo(new File(path + picName + extName));

			user.setPhoto(picName + extName);
		}

		//传了id，那么一定是更新，否则就是注册
		if (user.getId() != null) {
			userService.updateUser(user);
			return "redirect:/center.action?id=" + user.getId();
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
	
	//增或减粉丝数量
	@RequestMapping(value = "/funCount.action")
	public void funCount(UserFan fan) {
		userService.opratefunCount(fan);
	}
	
	//是否关联(显示关注 或 已关注 按钮)？
	@RequestMapping(value = "/getFollow.action")
	@ResponseBody
	public String getFollow(UserFan fan) {
		String status = userService.getFollow(fan);		
		return status;
	}
	
	//查看粉丝或关注
	@RequestMapping(value = "/showFanOrFollow.action")
	//用户id fan follow
	public String showFanOrFollow(HttpSession session, Model model,Integer id,String type) {
		List<Category> categoryList = categoryService.selectAllCategory();
		session.setAttribute("categoryList", categoryList);
		UserFanVo vo =  userService.showFanOrFollow(id,type);
		
		model.addAttribute("bbsvo", vo);
		model.addAttribute("type",type);
		return "followAndFan";
	}

}

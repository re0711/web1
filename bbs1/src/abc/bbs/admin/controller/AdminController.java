package abc.bbs.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import abc.bbs.admin.service.AdminService;
import abc.bbs.category.pojo.Category;
import abc.bbs.user.pojo.User;
import abc.common.pojo.EasyUIResult;
import abc.common.utils.GodResult;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;

	@RequestMapping("/index.action")
	public String adminIndex() {
		return "admin/index";
	}

	@RequestMapping("/bbs-list.action")
	public String showPage() {
		return "admin/bbs-list";
	}

	@RequestMapping("/bbs/list.action")
	@ResponseBody
	public EasyUIResult showBbsList(Integer page, Integer rows) {
		EasyUIResult result = adminService.getBbsList(page, rows);
		return result;
	}

	@RequestMapping("/delete.action")
	@ResponseBody
	public GodResult delete(Integer[] ids) {
		GodResult result = adminService.deleteBbs(ids);
		return result;
	}

	@RequestMapping("/toLogin.action")
	public String toLogin() {
		return "admin/login";
	}

	@RequestMapping(value = "login.action")
	public String login(Model model, User user, HttpSession session) {
		if (StringUtils.isEmpty(user.getUsername()) || StringUtils.isEmpty(user.getPassword())) {
			String msg = "用户名或密码不能为空";
			model.addAttribute("msg", msg);
			return "admin/login";
		}

		List<User> list = adminService.login(user);
		if (list == null || list.size() <= 0) {
			String msg = "管理员用户名或密码错误";
			model.addAttribute("msg", msg);
			return "admin/login";
		}

		User loginUser = list.get(0);
		session.setAttribute("loginUser", loginUser);
		return "redirect:/admin/index.action ";
	}

	@RequestMapping(value = "category-list.action")
	public String showPage1() {
		return "admin/category-list";
	}

	@RequestMapping(value = "/bbs/category.action")
	@ResponseBody
	public EasyUIResult showCategory(Integer page, Integer rows) {
		EasyUIResult result = adminService.getCategoryList(page, rows);
		return result;
	}

	@RequestMapping(value = "saveCategory.action")
	@ResponseBody
	public GodResult saveCategory(Category category) {
		GodResult result = null;
		if (category.getId() == null) {
			result = adminService.addCategory(category);
		} else {
			result = adminService.updateCategory(category);
		}

		return result;
	}

}

package abc.bbs.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import abc.bbs.admin.service.AdminService;
import abc.common.pojo.EasyUIResult;
import abc.common.utils.GodResult;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("/index.action")
	public String adminIndex(){
		return "admin/index";
	}
	
	@RequestMapping("/bbs-list.action")
	public String showPage() {
		return "admin/bbs-list";
	}
	
	@RequestMapping("/bbs/list.action")
	@ResponseBody
	public EasyUIResult showBbsList(Integer page,Integer rows) {
		EasyUIResult result = adminService.getBbsList(page, rows);
		return result;
	}
	
	@RequestMapping("/delete.action")
	@ResponseBody
	public GodResult delete(Integer[] ids) {
		GodResult result = adminService.deleteBbs(ids);
		return result;
	}

}

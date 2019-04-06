package abc.bbs.bbs.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import abc.bbs.bbs.pojo.Bbs;
import abc.bbs.bbs.pojo.BbsQueryVo;
import abc.bbs.bbs.pojo.Comment;
import abc.bbs.bbs.service.BbsService;
import abc.bbs.category.pojo.Category;
import abc.bbs.category.service.CategoryService;
import abc.bbs.user.pojo.User;
import abc.common.utils.Page;

@Controller
public class BbsController {

	@Autowired
	BbsService bbsService;

	@Autowired
	CategoryService categoryService;

	// 首页
	@RequestMapping(value = "/index.action")
	public String index(Model model, HttpSession session) {

		List<Category> categoryList = categoryService.selectAllCategory();
		List<Bbs> bbsList = bbsService.selectAllBbs();
		session.setAttribute("categoryList", categoryList);
		model.addAttribute("bbsList", bbsList);

		return "index";
	}

	// 帖子详情
	@RequestMapping(value = "/bbs_detail.action")
	public String bbs_detail(Model model, Integer id) {
		Bbs bbs = bbsService.selectBbsById(id);// 帖子
		List<Comment> commentList = bbsService.selectCommentBybid(id);// 评论

		model.addAttribute("bbs", bbs);
		model.addAttribute("commentList", commentList);
		return "bbsDetail";
	}

	// 添加评论
	@RequestMapping(value = "/addComment.action")
	public String addComment(HttpSession session, Comment comment) {
		User loginUser = (User) session.getAttribute("loginUser");

		// 从当前登录用户获取id和用户名
		Integer id = loginUser.getId();
		String username = loginUser.getUsername();
		comment.setUserid(id);
		comment.setUsername(username);

		bbsService.insertComment(comment);

		Bbs bbs = bbsService.selectBbsById(comment.getBbsid());
		bbs.setLastreply(comment.getDate());
		bbsService.updateOrder(bbs);
		// =======添加消息=========================

		if (loginUser.getId() != bbs.getAuthorid()) {
			bbsService.addMessage(bbs, comment, id);

		}

		// 评论+1
		Integer bbsid = comment.getBbsid();// 获取评论的帖子id
		bbsService.addCommentCount(bbsid);
		// 返回帖子详情
		return "redirect:/bbs_detail.action?id=" + bbsid;
	}

	// 删除评论 参数为评论id和bbs的id
	@RequestMapping(value = "/delectComment.action")
	public String delectComment(Integer id, Integer bid) {
		bbsService.delectCommentByCid(id);

		// 评论数-1
		bbsService.reduceCommentCount(bid);
		return "redirect:/bbs_detail.action?id=" + bid;
	}

	// 切换板块
	@RequestMapping(value = "/switchCategory.action")
	public String switchCategory(Model model, Integer cid) {
		List<Bbs> bbsList = bbsService.selectBbsByCid(cid);
		model.addAttribute("bbsList", bbsList);
		model.addAttribute("cid", cid); // 板块切换class判断
		return "index";
	}

	// 到发帖页
	@RequestMapping(value = "/toCreateBbs.action")
	public String toCreateBbs(Model model, Integer cid) {
		model.addAttribute("cid", cid);
		return "bbsPub1";
	}

	// 发帖
	@RequestMapping(value = "/bbsPub.action")
	public String bbsPub(HttpSession session, Bbs bbs) {
		User loginUser = (User) session.getAttribute("loginUser");
		bbs.setAuthorid(loginUser.getId());

		bbsService.saveBbs(bbs);
		return "redirect:/switchCategory.action?cid="+bbs.getCategoryid();
	}

	// 删帖
	@RequestMapping(value = "/deleteBbs.action")
	public String deleteBbs(Integer bid) {

		bbsService.deleteBbsAndComment(bid);
		return "redirect:/index.action";
	}

	// 多条件查询
	@RequestMapping(value = "/searchBbs.action")
	public String searchBbs(Model model, BbsQueryVo vo) {
		Page<Bbs> page = bbsService.selectBbsByQueryVo(vo);

		model.addAttribute("page", page);
		// model.addAttribute("BbsqueryVo", vo);
		return "queryResult";
	}

}
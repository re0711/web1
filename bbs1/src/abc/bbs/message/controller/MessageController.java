package abc.bbs.message.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import abc.bbs.message.pojo.Message;
import abc.bbs.message.pojo.messageQueryVo;
import abc.bbs.message.service.MessageService;

@Controller
public class MessageController {

	@Autowired
	MessageService messageService;

	// 显示消息列表
	@RequestMapping(value = "/queryMesssage.action")
	public String queryMesssage(Model model, Integer uid) {
		List<messageQueryVo> messageList = messageService.selectMessageByUid(uid);
		model.addAttribute("messageList", messageList);

		return "message";
	}

	// 删除所有消息  成功的话返回ok
	@RequestMapping(value = "/deleteMessage.action")
	@ResponseBody
	public String deleteMessage(Integer id) {
		String status = messageService.deleteMessage(id);
		return status;
	}
	
	// 标记所有消息  成功的话返回ok
		@RequestMapping(value = "/remarkMessage.action")
		@ResponseBody
		public String remarkMessage(Integer id) {
			String status = messageService.remarkMessage(id);
			return status;
		}

	// 显示消息数量
	@RequestMapping(value = "/messageCount.action")
	@ResponseBody
	public Integer messageCount(Integer uid, Model model) {
		Integer count = messageService.selectMessageCount(uid);
		//model.addAttribute("messageCount", count);
		return count;
	}
}
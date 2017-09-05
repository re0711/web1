package abc.bbs.message.service;

import java.util.List;

import abc.bbs.message.pojo.Message;
import abc.bbs.message.pojo.messageQueryVo;

public interface MessageService {
	public void addMessage(Message message);
	
	public List<messageQueryVo> selectMessageByUid(Integer id);

	public String deleteMessage(Integer id);

	public Integer selectMessageCount(Integer uid);

	public String remarkMessage(Integer id);
		
}

package abc.bbs.message.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import abc.bbs.message.mapper.MessageMapper;
import abc.bbs.message.pojo.Message;
import abc.bbs.message.pojo.MessageExample;
import abc.bbs.message.pojo.MessageExample.Criteria;
import abc.bbs.message.pojo.messageQueryVo;

@Service
public class MessageServiceImpl implements MessageService {
	
	@Autowired
	MessageMapper messageMapper;
	
	public void addMessage(Message message){
		messageMapper.insert(message);
	}

	//获取所有消息列表
	public List<messageQueryVo> selectMessageByUid(Integer id) {
		
		List<messageQueryVo> list = messageMapper.selectMessageByUid(id);
		return list;
	}

	public String deleteMessage(Integer id) {
		MessageExample example = new MessageExample();
		Criteria criteria = example.createCriteria();
		criteria.andRecipientidEqualTo(id);
		
		messageMapper.deleteByExample(example);
		return "ok";
	}

	//个人收到信息的数量
	public Integer selectMessageCount(Integer uid) {
		MessageExample example = new MessageExample();
		Criteria criteria = example.createCriteria();
		criteria.andRecipientidEqualTo(uid);
		criteria.andReadtypeEqualTo(0);
		int count = messageMapper.countByExample(example);
		return count;
	}

	@Override
	public String remarkMessage(Integer id) {
		Message record = new Message();
		record.setReadtype(1);
		MessageExample example = new MessageExample();
		example.createCriteria().andRecipientidEqualTo(id);
		messageMapper.updateByExampleSelective(record, example );
		return "ok";
	}
}

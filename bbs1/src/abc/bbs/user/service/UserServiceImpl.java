package abc.bbs.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import abc.bbs.bbs.mapper.BbsMapper;
import abc.bbs.user.mapper.UserMapper;
import abc.bbs.user.pojo.User;
import abc.bbs.user.pojo.UserFan;
import abc.bbs.user.pojo.UserFanVo;
@Service
public class UserServiceImpl implements UserService {
	@Autowired
	UserMapper userMapper;
	
	@Autowired
	private BbsMapper bbsMapper;
	
	public User selectUserById(Integer id) {
		return userMapper.selectUserById(id);
	}

	public void updateUser(User user) {
		userMapper.updateUser(user);
	}

	public List<User> selectUserByTerm(User user) {
		if(null != user.getUsername()){
			user.setUsername(user.getUsername().trim());
		}if(null != user.getPassword()){
			user.setPassword(user.getPassword().trim());
		}
		
		userMapper.selectUserByTerm(user);
		return userMapper.selectUserByTerm(user);
	}

	public void regist(User user) {
		userMapper.insertUser(user);
	}

	//增或减粉丝数量
	public void opratefunCount(UserFan fan) {
		Integer aid = fan.getAid(); //被关注者id
		Integer bid = fan.getBid();//关注者id
		
		//type 1:增   0:减
		if(fan.getType()==1){
			userMapper.addFollow(fan);
			
			//被关注着增加粉丝数量
			userMapper.addFanCount(aid);
			//关注者增加关注者
			userMapper.addFollowCount(bid);
			
		}else if(fan.getType()==0){
			//删除前先查询
			Integer id = userMapper.getFollowId(fan);
			userMapper.reduceFollow(id);
			
			//被关注着减少粉丝数量
			userMapper.reduceFanCount(aid);
			//关注者增加关注者
			userMapper.reduceFollowCount(bid);
		}
	}

	public String getFollow(UserFan fan) {
		Integer id = userMapper.getFollowId(fan);
		if(id!=null){
			return "ok";
		}
		return "no";
	}

	//查看粉丝或关注 1:粉丝   0:关注
	public UserFanVo showFanOrFollow(Integer id, String type) {
		UserFanVo vo = new UserFanVo();
		User user = userMapper.selectUserById(id);
		vo.setUser(user);
		vo.setUserBbsCount(bbsMapper.selectCountByUid(id));
		//查找用户的粉丝
		if(type.equals("fan")){
			Integer bids[] =  userMapper.getFollowByAid(id);
			if(bids.length>0){
			List<User> list =  userMapper.getFollowUsers(bids);
			vo.setUserList(list);
			}
			//查找用户的关注者
		}else if(type.equals("follow")){
			Integer aids[] =  userMapper.getFanByBid(id);
			if(aids.length>0){
			List<User> list =  userMapper.getFan(aids);
			vo.setUserList(list);
			}
		}
		
		return vo;
	}

}

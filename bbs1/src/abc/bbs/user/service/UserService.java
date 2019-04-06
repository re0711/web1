package abc.bbs.user.service;

import java.util.List;

import abc.bbs.user.pojo.User;
import abc.bbs.user.pojo.UserFan;
import abc.bbs.user.pojo.UserFanVo;

public interface UserService {
	//public List<User> login(String username,String password);

	public User selectUserById(Integer id);
	
	public void updateUser(User user);
	
	public List<User> selectUserByTerm(User user);
	
	public void regist(User user);

	public void opratefunCount(UserFan fan);

	public String getFollow(UserFan fan);

	public UserFanVo showFanOrFollow(Integer id, String type);
	
}

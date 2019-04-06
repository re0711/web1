package abc.bbs.user.mapper;

import java.util.List;

import abc.bbs.user.pojo.User;
import abc.bbs.user.pojo.UserFan;

public interface UserMapper {
	
	//public List<User> selectUser(@Param("username") String username,@Param("password") String password);
	
	public User selectUserById(Integer id);
	
	public void updateUser(User user);

	public List<User> selectUserByTerm(User user);

	public void insertUser(User user);

	public void addFollow(UserFan fan);

	public void reduceFollow(Integer id);

	public void addFanCount(Integer aid);

	public void addFollowCount(Integer bid);

	public void reduceFanCount(Integer aid);

	public void reduceFollowCount(Integer bid);

	public Integer getFollowId(UserFan fan);

	public Integer[] getFollowByAid(Integer id);

	public List<User> getFollowUsers(Integer[] bids);

	public Integer[] getFanByBid(Integer id);

	public List<User> getFan(Integer[] aids);
}

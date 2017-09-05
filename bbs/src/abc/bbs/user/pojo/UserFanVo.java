package abc.bbs.user.pojo;

import java.util.List;

public class UserFanVo {
	private User user;
	private List<User> userList;
	private Integer userBbsCount;
	
	public Integer getUserBbsCount() {
		return userBbsCount;
	}
	public void setUserBbsCount(Integer userBbsCount) {
		this.userBbsCount = userBbsCount;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public List<User> getUserList() {
		return userList;
	}
	public void setUserList(List<User> userList) {
		this.userList = userList;
	}
}

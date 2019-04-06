package abc.bbs.admin.mapper;

import java.util.List;

import abc.bbs.user.pojo.User;

public interface AdminMapper {

	void deleteBbsByIds(Integer[] ids);


	List<User> login(User user);

}

package abc.bbs.admin.service;

import java.util.List;

import abc.bbs.category.pojo.Category;
import abc.bbs.user.pojo.User;
import abc.common.pojo.EasyUIResult;
import abc.common.utils.GodResult;

public interface AdminService {
	
	public EasyUIResult getBbsList(int page, int rows);
	
	public GodResult deleteBbs(Integer[] ids);

	public List<User> login(User user);

	public EasyUIResult getCategoryList(Integer page, Integer rows);

	public GodResult addCategory(Category category);

	public GodResult updateCategory(Category category);
}

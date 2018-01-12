package abc.bbs.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import abc.bbs.admin.mapper.AdminMapper;
import abc.bbs.bbs.mapper.BbsMapper;
import abc.bbs.bbs.pojo.Bbs;
import abc.bbs.category.mapper.CategoryMapper;
import abc.bbs.category.pojo.Category;
import abc.bbs.user.pojo.User;
import abc.common.pojo.EasyUIResult;
import abc.common.utils.GodResult;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private BbsMapper bbsMapper;

	@Autowired
	private CategoryMapper categoryMapper;

	@Autowired
	private AdminMapper adminMapper;

	public EasyUIResult getBbsList(int page, int rows) {
		List<Bbs> list = bbsMapper.adminGetAllBbs();

		PageHelper pageHelper = new PageHelper();
		pageHelper.startPage(page, rows);

		PageInfo<Bbs> pageInfo = new PageInfo<>(list);
		long total = pageInfo.getTotal();

		EasyUIResult result = new EasyUIResult();
		result.setTotal(total);
		result.setRows(list);

		return result;
	}

	public GodResult deleteBbs(Integer[] ids) {

		adminMapper.deleteBbsByIds(ids);
		return GodResult.ok();
	}

	public List<User> login(User user) {

		return adminMapper.login(user);
	}

	public EasyUIResult getCategoryList(Integer page, Integer rows) {
		List<Category> list = categoryMapper.selectAllCategory();

		PageHelper pageHelper = new PageHelper();
		pageHelper.startPage(page, rows);

		PageInfo<Category> pageInfo = new PageInfo<>(list);
		long total = pageInfo.getTotal();

		EasyUIResult result = new EasyUIResult();
		result.setTotal(total);
		result.setRows(list);

		return result;
	}

	@Override
	public GodResult addCategory(Category category) {
		categoryMapper.addCategory(category);
		return GodResult.ok();
	}

	public GodResult updateCategory(Category category) {
		
		categoryMapper.updateCategory(category);
		return GodResult.ok();
	}

}

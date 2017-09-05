package abc.bbs.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import abc.bbs.admin.mapper.AdminMapper;
import abc.bbs.bbs.mapper.BbsMapper;
import abc.bbs.bbs.pojo.Bbs;
import abc.common.pojo.EasyUIResult;
import abc.common.utils.GodResult;
@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private BbsMapper bbsMapper;
	
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

}

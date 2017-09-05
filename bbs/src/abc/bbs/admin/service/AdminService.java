package abc.bbs.admin.service;

import abc.common.pojo.EasyUIResult;
import abc.common.utils.GodResult;

public interface AdminService {
	
	public EasyUIResult getBbsList(int page, int rows);
	
	public GodResult deleteBbs(Integer[] ids);
}

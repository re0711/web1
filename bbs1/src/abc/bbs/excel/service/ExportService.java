package abc.bbs.excel.service;

import java.util.List;

import abc.bbs.excel.pojo.Export;

public interface ExportService {
	//excel导出user的信息
	public List<Export> findUser();
}

package abc.bbs.excel.mapper;

import java.util.List;

import abc.bbs.excel.pojo.Export;

public interface ExportMapper {
	//导出User的信息
	public List<Export> findUser();
}

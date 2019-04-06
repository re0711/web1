package abc.bbs.excel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import abc.bbs.excel.mapper.ExportMapper;
import abc.bbs.excel.pojo.Export;
@Service
public class ExportServiceImpl implements ExportService{
	@Autowired
	ExportMapper exportMapper;
	
	@Override
	public List<Export> findUser() {
		// TODO Auto-generated method stub
		return exportMapper.findUser();
	}

}

package abc.bbs.jfreechart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import abc.bbs.jfreechart.mapper.BbsJFreeChartMapper;
import abc.bbs.jfreechart.pojo.BbsJFreeChart;

@Service
public class BbsJFreeChartServiceImpl implements BbsJFreeChartService{
	@Autowired 
	private BbsJFreeChartMapper bbsJFreeChartMapper;

	@Override
	public List<BbsJFreeChart> findBbsByCategory() {
		// TODO Auto-generated method stub
		return bbsJFreeChartMapper.findBbsByCategory();
	}

	@Override
	public List<BbsJFreeChart> findBbsByCategoryAndYear() {
		// TODO Auto-generated method stub
		return bbsJFreeChartMapper.findBbsByYearAndCategory();
	}
}

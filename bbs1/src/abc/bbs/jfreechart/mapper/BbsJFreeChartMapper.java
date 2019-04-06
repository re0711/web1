package abc.bbs.jfreechart.mapper;

import java.util.List;

import abc.bbs.jfreechart.pojo.BbsJFreeChart;

public interface BbsJFreeChartMapper {
	//根据模块查询帖子
	public List<BbsJFreeChart> findBbsByCategory();
	//根据模块和年份查询帖子
	public List<BbsJFreeChart> findBbsByYearAndCategory();
	
}

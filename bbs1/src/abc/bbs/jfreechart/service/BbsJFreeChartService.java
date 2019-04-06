package abc.bbs.jfreechart.service;

import java.util.List;

import abc.bbs.jfreechart.pojo.BbsJFreeChart;

public interface BbsJFreeChartService {
	//根据模块查询帖子
	public List<BbsJFreeChart> findBbsByCategory();
	//跟据模块和年份查询帖子
	public List<BbsJFreeChart> findBbsByCategoryAndYear();
}

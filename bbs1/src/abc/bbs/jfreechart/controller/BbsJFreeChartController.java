package abc.bbs.jfreechart.controller;

import java.awt.Color;
import java.awt.Font;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.AxisLocation;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.ValueAxis;
import org.jfree.chart.labels.ItemLabelAnchor;
import org.jfree.chart.labels.ItemLabelPosition;
import org.jfree.chart.labels.StandardCategoryItemLabelGenerator;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.renderer.category.BarRenderer3D;
import org.jfree.chart.servlet.ServletUtilities;
import org.jfree.chart.title.LegendTitle;
import org.jfree.chart.title.TextTitle;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DatasetUtilities;
import org.jfree.ui.TextAnchor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;



import abc.bbs.jfreechart.pojo.BbsJFreeChart;
import abc.bbs.jfreechart.service.BbsJFreeChartService;



@Controller
@RequestMapping("/chart")
public class BbsJFreeChartController {
	@Autowired 
	BbsJFreeChartService bbsJFreeChartService;

	/**
	 * 按模块统计帖子数量
	 */
	@RequestMapping("/BBSCategoryChart.action")
	public String queryBbsByCategory(HttpServletResponse response,HttpSession session
			,Model model) {
		
		try {
			//按模块统计查询到的帖子数量
			List<BbsJFreeChart> bbsByCategories = bbsJFreeChartService.findBbsByCategory();
			
			DefaultCategoryDataset dataset = new DefaultCategoryDataset();
			for (BbsJFreeChart bbsJFreeChart : bbsByCategories) {
				dataset.addValue(bbsJFreeChart.getCount(),"模块帖子数量统计",bbsJFreeChart.getCategoryName());
			}
			
			JFreeChart chart = ChartFactory.createBarChart3D("模块帖子数量统计",// 图形名称
					"",// 分类名称，为横坐标名称
					"帖子数量(个)",// 值名称，为纵坐标名称
					dataset,// 数据集合
					PlotOrientation.VERTICAL,// 垂直显示
					false,// 是否显示图例
					false,// 是否使用工具提示
					false);// 是否使用url

			// 在柱上显示数值
			CategoryPlot plot = chart.getCategoryPlot();

			BarRenderer3D renderer = new BarRenderer3D();

			// 设置柱的颜色
			// renderer.setSeriesPaint(0, Color.decode("#ff0000"));

			renderer.setBaseItemLabelGenerator(new StandardCategoryItemLabelGenerator());
			renderer.setBaseItemLabelsVisible(true);
			// 默认的数字显示在柱子中，通过如下两句可调整数字的显示
			// 注意：此句很关键，若无此句，那数字的显示会被覆盖，给人数字没有显示出来的问题
			renderer.setBasePositiveItemLabelPosition(new ItemLabelPosition(
					ItemLabelAnchor.OUTSIDE12, TextAnchor.BASELINE_LEFT));
			renderer.setItemLabelAnchorOffset(10D);
			// 设置每个地区所包含的平行柱的之间距离
			// renderer.setItemMargin(0.3);
			plot.setRenderer(renderer);

			// 解决乱码：配置字体
			Font xfont = new Font("宋体", Font.PLAIN, 12);// X轴
			Font yfont = new Font("宋体", Font.PLAIN, 12);// Y轴
			Font kfont = new Font("宋体", Font.PLAIN, 12);// 底部
			Font titleFont = new Font("宋体", Font.BOLD, 25); // 图片标题
			// 图形的绘制结构对象,对于饼图不适用
			//CategoryPlot plot = chart.getCategoryPlot();

			// 图片标题
			chart.setTitle(new TextTitle(chart.getTitle().getText(), titleFont));

			// 底部
			LegendTitle legendTitle = chart.getLegend();
			if (legendTitle != null) {
				legendTitle.setItemFont(kfont);
			}

			// X 轴
			CategoryAxis domainAxis = plot.getDomainAxis();
			domainAxis.setLabelFont(xfont);// 轴标题
			domainAxis.setTickLabelFont(xfont);// 轴数值
			domainAxis.setTickLabelPaint(Color.BLUE); // 字体颜色
			// domainAxis.setCategoryLabelPositions(CategoryLabelPositions.UP_45);

			// Y 轴
			ValueAxis rangeAxis = plot.getRangeAxis();
			rangeAxis.setLabelFont(yfont);
			rangeAxis.setLabelPaint(Color.BLUE); // 字体颜色
			rangeAxis.setTickLabelFont(yfont);

			response.setContentType("image/png");
			
			String jfreechart_filename = ServletUtilities.saveChartAsPNG(chart, 900, 500, null, session);
			
			model.addAttribute("jfreechart_filename", jfreechart_filename);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "jfreechart/BBSJFreeChart";
	}
	/**
	 * 按照年份并且带有模块分类的统计图
	 */
	@RequestMapping("/BBSYearCategoryChart")
	public String queryBbsByYearAndCategory(HttpServletResponse response,
			HttpSession session,Model model) {
		try {
		List<BbsJFreeChart> bbsJFreeCharts=bbsJFreeChartService.findBbsByCategoryAndYear();
		Set<String> years=new HashSet<>();
		Set<String> categoryNames=new HashSet<>();
		for (BbsJFreeChart bbsJFreeChart : bbsJFreeCharts) {
			years.add(bbsJFreeChart.getDt());
			categoryNames.add(bbsJFreeChart.getCategoryName());
		}
		//年份
		
		String[] columnKeys = new String[years.size()];
		int i=0;
		for(String year:years) {
			columnKeys[i] = year;
			i++;
		}
		//Arrays.sort(columnKeys);
		//模板分类
		String[] rowKeys = new String[categoryNames.size()];
		int j=0;
		for(String categoryName:categoryNames) {
			rowKeys[j] = categoryName;
			j++;
		}
		/*String[] rowKeys = {"日韩", "欧美"};
		String[] columnKeys = {"2011", "2015", "2017"};
		double[][] data = new double[][] {
		     {1,0,1},//日韩2011,2015,2017
		     {0,1,4}};//欧美2011,2015,2017
		     
		     2011 日韩 1
		     2015 欧美 1
		     2017 日韩 1
		     2017 欧美 4
		     
		     2011 日韩 1  2011 欧美 0
		     2015 日韩  0  2015 欧美 1
		     2017 日韩 1	2015 欧美4*/	
		     
		double[][] data = new double[categoryNames.size()][years.size()];
		for(int m=0;m<categoryNames.size();m++) {//日韩、欧美
			for(int n=0;n<bbsJFreeCharts.size();n++) {
				if(bbsJFreeCharts.get(n).getCategoryName().equals(rowKeys[m])) {
					for(int o=0;o<years.size();o++) {
						if(bbsJFreeCharts.get(n).getDt().equals(columnKeys[o])) {
							data[m][o]=bbsJFreeCharts.get(n).getCount();
						}
					}
				}else {
					continue;
				}
			}
		}

		CategoryDataset dataset = DatasetUtilities.createCategoryDataset(rowKeys, columnKeys, data); 
		 
		JFreeChart chart = ChartFactory.createBarChart3D("帖子量统计图", 
		                   "帖子",
		                   "数量",
		                   dataset,//数据集合
		                   PlotOrientation.VERTICAL,//垂直显示
		                   true,//是否显示图例
		                   true,//是否使用工具提示
		                   false);//是否使用url
		 
		 CategoryPlot plot = chart.getCategoryPlot();
		 //设置网格背景颜色
		 plot.setBackgroundPaint(Color.white);
		 //设置网格竖线颜色
		 plot.setDomainGridlinePaint(Color.pink);
		 //设置网格横线颜色
		 plot.setRangeGridlinePaint(Color.pink);
		 
		 //显示每个柱的数值，并修改该数值的字体属性
		 
		 BarRenderer3D renderer = new BarRenderer3D();
		 renderer.setBaseItemLabelGenerator(
				 new StandardCategoryItemLabelGenerator());
		 renderer.setBaseItemLabelsVisible(true);
		 //默认的数字显示在柱子中，通过如下两句可调整数字的显示
		 //注意：此句很关键，若无此句，那数字的显示会被覆盖，给人数字没有显示出来的问题
		 renderer.setBasePositiveItemLabelPosition(
				 new ItemLabelPosition(ItemLabelAnchor.OUTSIDE12, TextAnchor.BASELINE_LEFT));
		 renderer.setItemLabelAnchorOffset(10D);
		 //设置每个地区所包含的平行柱的之间距离
		 //renderer.setItemMargin(0.3);
		 plot.setRenderer(renderer);
		
		 //设置地区、销量的显示位置
		 //将下方的“肉类”放到上方
		 plot.setDomainAxisLocation(AxisLocation.TOP_OR_RIGHT);
		 //将默认放在左边的“销量”放到右方
		 plot.setRangeAxisLocation(AxisLocation.BOTTOM_OR_RIGHT);
		 
		 //解决乱码
		 //配置字体
		 Font xfont = new Font("宋体", Font.PLAIN, 12);// X轴
		 Font yfont = new Font("宋体", Font.PLAIN, 12);// Y轴
		 Font kfont = new Font("宋体", Font.PLAIN, 12);// 底部
		 Font titleFont = new Font("宋体", Font.BOLD, 25); // 图片标题
		 
		 // 图片标题
		 chart.setTitle(new TextTitle(chart.getTitle().getText(), titleFont));
		 
		// 底部
		LegendTitle legendTitle = chart.getLegend();
		if (legendTitle != null) {
			legendTitle.setItemFont(kfont);
		}

		// X 轴
		CategoryAxis domainAxis = plot.getDomainAxis();
		domainAxis.setLabelFont(xfont);// 轴标题
		domainAxis.setTickLabelFont(xfont);// 轴数值
		domainAxis.setTickLabelPaint(Color.BLUE); // 字体颜色
		// domainAxis.setCategoryLabelPositions(CategoryLabelPositions.UP_45);
	
		// Y 轴
		ValueAxis rangeAxis = plot.getRangeAxis();
		rangeAxis.setLabelFont(yfont);
		rangeAxis.setLabelPaint(Color.BLUE); // 字体颜色
		rangeAxis.setTickLabelFont(yfont);
		
		response.setContentType("image/png");
		
		String jfreechart_filename = ServletUtilities.saveChartAsPNG(chart, 900, 500, null, session);
		System.out.println(jfreechart_filename);
		
		model.addAttribute("jfreechart_filename", jfreechart_filename);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return "jfreechart/BBSJFreeChart";
	}

}

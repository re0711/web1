package abc.bbs.jfreechart.pojo;

public class BbsJFreeChart {
	
	private int count;//模块下帖子的数量
	private String categoryName;//模块名称
	private String dt;//年份
	
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getDt() {
		return dt;
	}
	public void setDt(String dt) {
		this.dt = dt;
	}
	@Override
	public String toString() {
		return "BbsJFreeChart [count=" + count + ", categoryName=" + categoryName + ", dt=" + dt + "]";
	}	
	
}

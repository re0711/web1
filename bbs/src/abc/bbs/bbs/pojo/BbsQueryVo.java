package abc.bbs.bbs.pojo;

import java.util.List;

import abc.bbs.user.pojo.User;

public class BbsQueryVo {
	private List<Bbs> bbsList;
	
	private Bbs bbs;
	
	private User user;
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<Bbs> getBbsList() {
		return bbsList;
	}

	public void setBbsList(List<Bbs> bbsList) {
		this.bbsList = bbsList;
	}

	public Integer getUserBbsCount() {
		return userBbsCount;
	}

	public void setUserBbsCount(Integer userBbsCount) {
		this.userBbsCount = userBbsCount;
	}

	private Integer userBbsCount;
	
	//当前页
		private Integer page;
		//每页数
		private Integer size = 10; 
		//开始行
		private Integer startRow = 0;


	public Integer getPage() {
			return page;
		}

		public void setPage(Integer page) {
			this.page = page;
		}

		public Integer getSize() {
			return size;
		}

		public void setSize(Integer size) {
			this.size = size;
		}

		public Integer getStartRow() {
			return startRow;
		}

		public void setStartRow(Integer startRow) {
			this.startRow = startRow;
		}

	
	public Bbs getBbs() {
		return bbs;
	}

	public void setBbs(Bbs bbs) {
		this.bbs = bbs;
	}

}

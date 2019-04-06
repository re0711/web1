package abc.bbs.excel.pojo;

public class ExportUser {
	 private String username;
	 private String signature;
	 private Integer age;
	 private String sex;
	 private Integer followCount;
	 private Integer fanCount;
	 private byte[] preface;
	 public ExportUser() {
		// TODO Auto-generated constructor stub
	}
	 //"用户姓名", "用户签名", "用户年龄", "用户性别", "关注数量", "粉丝数量", "用户头像"
    
	public ExportUser(String username,String signature,Integer age,String sex,
			Integer followCount,Integer fanCount,byte[] preface) {
		this.age=age;
		this.sex=sex;
		this.signature=signature;
		this.username=username;
		this.fanCount=fanCount;
		this.followCount=followCount;
		this.preface=preface;
	}

		public String getSignature() {
			return signature;
		}

		public void setSignature(String signature) {
			this.signature = signature;
		}

		public String getUsername() {
			return username;
		}

		public void setUsername(String username) {
			this.username = username;
		}

		public Integer getAge() {
			return age;
		}

		public void setAge(Integer age) {
			this.age = age;
		}

		public Integer getFollowCount() {
			return followCount;
		}

		public void setFollowCount(Integer followCount) {
			this.followCount = followCount;
		}

		public Integer getFanCount() {
			return fanCount;
		}

		public void setFanCount(Integer fanCount) {
			this.fanCount = fanCount;
		}

		public String getSex() {
			return sex;
		}

		public void setSex(String sex) {
			this.sex = sex;
		}

		public byte[] getPreface() {
			return preface;
		}

		public void setPreface(byte[] preface) {
			this.preface = preface;
		}
		
}

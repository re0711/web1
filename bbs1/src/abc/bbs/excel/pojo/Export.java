package abc.bbs.excel.pojo;

public class Export {
	 private String signature;
	 private String photo;
	 private String username;
	 private Integer age;
	 private Integer gender;
	 private Integer followCount;
	 private Integer fanCount;
	 private String sex;
	 private byte[] preface;
	 public Export() {
		// TODO Auto-generated constructor stub
	}
	
	public String getSignature() {
		return signature;
	}
	public void setSignature(String signature) {
		this.signature = signature;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
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

	public byte[] getPreface() {
		return preface;
	}

	public void setPreface(byte[] preface) {
		this.preface = preface;
	}

	public Integer getGender() {
		return gender;
	}

	public void setGender(Integer gender) {
		this.gender = gender;
	}
	 public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}
	 
}	

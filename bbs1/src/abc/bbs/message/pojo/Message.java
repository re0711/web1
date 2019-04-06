package abc.bbs.message.pojo;

import java.util.Date;

public class Message {
    private Integer id;

    private Integer type;  //2 回复  2删帖 3@
    //接受者id
    private Integer recipientid;

    private Integer sponsorid;

    private String content;

    private Integer categoryid;

    private Integer bbsid;

    private Date date;
    
    private Integer readtype;  //0 未读 1 已读

    public Integer getReadtype() {
		return readtype;
	}

	public void setReadtype(Integer readtype) {
		this.readtype = readtype;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getRecipientid() {
        return recipientid;
    }

    public void setRecipientid(Integer recipientid) {
        this.recipientid = recipientid;
    }

    public Integer getSponsorid() {
        return sponsorid;
    }

    public void setSponsorid(Integer sponsorid) {
        this.sponsorid = sponsorid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Integer getCategoryid() {
        return categoryid;
    }

    public void setCategoryid(Integer categoryid) {
        this.categoryid = categoryid;
    }

    public Integer getBbsid() {
        return bbsid;
    }

    public void setBbsid(Integer bbsid) {
        this.bbsid = bbsid;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
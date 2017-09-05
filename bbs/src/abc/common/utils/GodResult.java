package abc.common.utils;

import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

//响应结构
public class GodResult implements Serializable{


    // 响应业务状态
    private Integer status;

    // 响应消息
    private String msg;

    // 响应中的数据
    private Object data;

    public static GodResult build(Integer status, String msg, Object data) {
        return new GodResult(status, msg, data);
    }

    public static GodResult ok(Object data) {
        return new GodResult(data);
    }

    public static GodResult ok() {
        return new GodResult(null);
    }

    public GodResult() {

    }

    public static GodResult build(Integer status, String msg) {
        return new GodResult(status, msg, null);
    }

    public GodResult(Integer status, String msg, Object data) {
        this.status = status;
        this.msg = msg;
        this.data = data;
    }

    public GodResult(Object data) {
        this.status = 200;
        this.msg = "OK";
        this.data = data;
    }

//    public Boolean isOK() {
//        return this.status == 200;
//    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

   
}

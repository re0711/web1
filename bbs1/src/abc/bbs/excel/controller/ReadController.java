package abc.bbs.excel.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import abc.bbs.excel.pojo.ExportUser;
import abc.common.utils.ExcelRead;
import abc.common.utils.ExcelUtil;

@Controller
@RequestMapping("/read")
public class ReadController {
	
	//读取Excel到数据库
	@RequestMapping("/readExcel.action")
	public ModelAndView readExcel(@RequestParam(value="excelFile")
		MultipartFile file,HttpServletRequest request,HttpSession session) {
	    ModelAndView mv = new ModelAndView();  
	    //判断文件是否为空  
	    if(file == null){  
	        mv.addObject("msg", "failed");  
	        mv.setViewName("excel_result");  
	        return mv;  
	    }  
	               String name = file.getOriginalFilename();  
	    long size = file.getSize();  
	    if(name == null || ExcelUtil.EMPTY.equals(name) && size==0){  
	        mv.addObject("msg", "failed");  
	        mv.setViewName("excel_result");  
	        return mv;  
	    }  
	    //读取Excel数据到List中  
	    List<ArrayList<String>> list = null;
		try {
			list = new ExcelRead().readExcel(file);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
	               //list中存的就是excel中的数据，可以根据excel中每一列的值转换成你所需要的值（从0开始），如：  
	    ExportUser user = null;  
	    List<ExportUser> listUser = new ArrayList<ExportUser>();  
	  //"用户姓名", "用户签名", "用户年龄", "用户性别",
	    for(ArrayList<String> arr:list){                        
	        user= new ExportUser();                         
	        user.setUsername(arr.get(0));//每一行的第一个单元格
	        user.setSignature(arr.get(1));
	        user.setSignature(arr.get(2));
	        user.setSignature(arr.get(3));
	        user.setSignature(arr.get(4));
	        listUser.add(user);  
	    }  
	/*    if(userService.saveBatchInsert(listUser)){  
	        mv.addObject("msg", "success");  
	    }else{  
	        mv.addObject("msg", "failed");  
	    }                     
	    mv.setViewName("excel_result"); */ 
	    return mv;  
	}
}

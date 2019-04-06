package abc.bbs.excel.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import abc.bbs.excel.pojo.Export;
import abc.bbs.excel.pojo.ExportUser;
import abc.bbs.excel.service.ExportService;
import abc.common.utils.ExportExcel;
@Controller
@RequestMapping("/export")
public class ExportController {
	/**
	 * Excel导出
	 */
	@Autowired
	ExportService exportService;
	
	@RequestMapping("/exportExcel.action")
	public void exportExcel(HttpServletResponse response,HttpServletRequest request) {
		
        response.setContentType("octets/stream");
        response.addHeader("Content-Disposition",
                "attachment;filename=userInfo.xls");
   
        ExportExcel<ExportUser> ex = new ExportExcel<ExportUser>();
        
        List<Export> exports=exportService.findUser();
     
        String[] headers = { "用户姓名", "用户签名", "用户年龄", "用户性别", "关注数量", "粉丝数量",
                "用户头像" };
        Collection<ExportUser> dataset = new ArrayList<ExportUser>();
        try {
        	for (Export export : exports) {
        		String pa = request.getServletContext().getRealPath(export.getPhoto());
        		BufferedInputStream bis = new BufferedInputStream(
                        new FileInputStream(new File(request.getServletContext()
            	                .getRealPath(export.getPhoto()))));
        		 byte[] buf = new byte[bis.available()];
        		 export.setPreface(buf);
        		 if(export.getGender()==1) {
        			 export.setSex("男");
        		 }else {
        			 export.setSex("女");
        		 }
                 while ((bis.read(buf)) != -1) {
                     // 将图片数据存放到缓冲数组中
                 }
                 dataset.add(new ExportUser(export.getUsername(),export.getSignature(),export.getAge()
                		 ,export.getSex(),export.getFollowCount(),export.getFanCount(),export.getPreface()));
        	}
            OutputStream out = response.getOutputStream();
            ex.exportExcel(headers, dataset, out);
            out.close();
            System.out.println("excel导出成功！");
        } catch (FileNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
	}
}

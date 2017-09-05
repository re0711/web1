package abc.bbs.bbs.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import abc.bbs.user.pojo.User;

public class BbsInterceptor implements HandlerInterceptor{

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
	
			User user = (User) request.getSession().getAttribute("loginUser");

			if(null == user){
				String msg = "请登录后在发帖！";
				request.setAttribute("msg", msg);
				response.sendRedirect(request.getContextPath() + "/toLogin.action");//项目名
				return false;
			}
		
		return true;
	}

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}
}

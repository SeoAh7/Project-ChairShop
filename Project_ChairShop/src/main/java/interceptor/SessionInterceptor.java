package interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import vo.MemberVo;

public class SessionInterceptor extends HandlerInterceptorAdapter{

	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		
		MemberVo user = (MemberVo) session.getAttribute("user");
		
		//로그인 안된 경우
		if(session.getAttribute("user")==null) {
			
			response.sendRedirect("../member/login_form.do");
			
		}else {
				
			//로그인한 유저가 관리자가 아닐경우
			if(!user.getM_id().equals("admin")) {
				
				response.sendRedirect("../?reason=not_admin");
			}
			
		}
		
		return super.preHandle(request, response, handler);
	}

}

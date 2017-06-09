package kr.fishingboat.common.logger;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoggerInterceptor extends HandlerInterceptorAdapter {
	protected Log log = LogFactory.getLog(LoggerInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if( !request.getRequestURI().startsWith(request.getContextPath()+ "/main")
				&& !request.getRequestURI().startsWith(request.getContextPath()+ "/community")
				&& !request.getRequestURI().startsWith(request.getContextPath()+ "/member")
				&& !request.getRequestURI().startsWith(request.getContextPath()+ "/civil")
				&& !request.getRequestURI().startsWith(request.getContextPath()+ "/side")
				&& !request.getRequestURI().startsWith(request.getContextPath()+ "/common")){
			HttpSession session = request.getSession();
			@SuppressWarnings("rawtypes")
			Map mberInfo = (Map) session.getAttribute("mberInfo");
			
			if(mberInfo == null){
				response.sendRedirect(request.getContextPath() + "/member/openLoginView.do");
			} else {
				System.out.println("************************** 세션 처리 값 확인 START *****************");
				System.out.println("* USR_ID	[ " + mberInfo.get("USR_ID").toString() + "		] *");
				System.out.println("* NAM		[ " + mberInfo.get("NAM").toString() + "		] *");
				System.out.println("* USR_EMAIL	[ " + mberInfo.get("USR_EMAIL").toString() + "	] *");
				System.out.println("* REG_DAT	[ " + mberInfo.get("REG_DAT").toString() + "	] *");
				System.out.println("* PHONE		[ " + mberInfo.get("PHONE").toString() + "		] *");
				System.out.println("************************** 세션 처리 값 확인 END *****************");
			}
		}
		
		if (log.isDebugEnabled()) {
			log.debug("======================================          START         ======================================");
			log.debug(" Request URI \t:  " + request.getRequestURI());
		}
		return super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		if (log.isDebugEnabled()) {
			log.debug("======================================           END          ======================================\n");
		}
	}
}

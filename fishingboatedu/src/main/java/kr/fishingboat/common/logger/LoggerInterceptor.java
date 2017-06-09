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
		if( !request.getRequestURI().startsWith(request.getContextPath() + "/common")
			&& !request.getRequestURI().startsWith(request.getContextPath() + "/member")
			&& !request.getRequestURI().startsWith(request.getContextPath() + "/main")
			&& !request.getRequestURI().startsWith(request.getContextPath()+ "/application")
			&& !request.getRequestURI().startsWith(request.getContextPath()+ "/report")
			&& !request.getRequestURI().startsWith(request.getContextPath()+ "/community")){
			HttpSession session = request.getSession();
			@SuppressWarnings("rawtypes")
			Map mberInfo = (Map) session.getAttribute("mberInfo");
			
			if(mberInfo == null){
				response.sendRedirect(request.getContextPath() + "/member/openEduLoginView.do");
			} else {
				System.out.println("************************** �꽭�뀡 泥섎━ 媛� �솗�씤 START *****************");
				System.out.println("* SEQ			[ " + mberInfo.get("SEQ").toString() + "		] *");
				System.out.println("* EDU_NUM		[ " + mberInfo.get("EDU_NUM").toString() + "	] *");
				System.out.println("* EDU_NAM		[ " + mberInfo.get("EDU_NAM").toString() + "	] *");
				System.out.println("* EDU_REG_DAT	[ " + mberInfo.get("EDU_REG_DAT").toString() + "	] *");
				System.out.println("************************** �꽭�뀡 泥섎━ 媛� �솗�씤 END *****************");
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

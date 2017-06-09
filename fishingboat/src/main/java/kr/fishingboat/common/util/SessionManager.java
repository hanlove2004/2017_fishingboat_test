package kr.fishingboat.common.util;

import java.util.Collection;
import java.util.Enumeration;
import java.util.Hashtable;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

public class SessionManager implements HttpSessionBindingListener {

	private static SessionManager sessionManager = null;

	// 로그인한 접속자를 담기위한 해시테이블
	@SuppressWarnings("rawtypes")
	private static Hashtable loginUsers = new Hashtable();
	
	
	

	/*
	 * 싱글톤 패턴 사용
	 */
	public static synchronized SessionManager getInstance() {
		if (sessionManager == null) {
			sessionManager = new SessionManager();
		}
		return sessionManager;
	}

	/*
	 * 이 메소드는 세션이 연결되을때 호출된다.(session.setAttribute("login", this)) Hashtable에
	 * 세션과 접속자 아이디를 저장한다.
	 */
	@SuppressWarnings("unchecked")
	public void valueBound(HttpSessionBindingEvent event) {
		// session값을 put한다.
		loginUsers.put(event.getSession(), event.getName());
		//System.out.println(event.getName() + "님이 로그인 하셨습니다.");
		//System.out.println("현재 접속자 수 : " + getUserCount());
	}

	/*
	 * 이 메소드는 세션이 끊겼을때 호출된다.(invalidate) Hashtable에 저장된 로그인한 정보를 제거해 준다.
	 */
	public void valueUnbound(HttpSessionBindingEvent event) {
		// session값을 찾아서 없애준다.
		loginUsers.remove(event.getSession());
		//System.out.println("  " + event.getName() + "님이 로그아웃 하셨습니다.");
		//System.out.println("현재 접속자 수 : " + getUserCount());
	}

	/*
	 * 로그인을 완료한 사용자의 아이디를 세션에 저장하는 메소드
	 * 
	 * @param session 세션 객체
	 * 
	 * @param userID 사용자 아이디
	 */
	public void setSession(HttpSession session, String userId) {
		// 이순간에 Session Binding이벤트가 일어나는 시점
		// name값으로 userId, value값으로 자기자신(HttpSessionBindingListener를 구현하는
		// Object)
		session.setAttribute(userId, this);// login에 자기자신을 집어넣는다.
	}
	
	public HttpSession getSession(String userId) {
		// 이순간에 Session Binding이벤트가 일어나는 시점
		// name값으로 userId, value값으로 자기자신(HttpSessionBindingListener를 구현하는
		// Object)
		
		
		
		@SuppressWarnings("rawtypes")
		Enumeration e = loginUsers.keys();
		HttpSession session = null;
		while (e.hasMoreElements()) {
			session = (HttpSession) e.nextElement();
			
			if (loginUsers.get(session).equals(userId)) {
				break;
			}
		}
		
		return session;
	}

	/*
	 * 입력받은 아이디를 해시테이블에서 삭제.
	 * 
	 * @param userID 사용자 아이디
	 * 
	 * @return void
	 */
	public void removeSession(String userId) {
		@SuppressWarnings("rawtypes")
		Enumeration e = loginUsers.keys();
		HttpSession session = null;
		while (e.hasMoreElements()) {
			session = (HttpSession) e.nextElement();
			
			//System.out.println(loginUsers.get(session));
			
			if (loginUsers.get(session).equals(userId)) {
				// 세션이 invalidate될때 HttpSessionBindingListener를
				// 구현하는 클레스의 valueUnbound()함수가 호출된다.
				session.invalidate();
			}
		}
	}

	/*
	 * 사용자가 입력한 ID, PW가 맞는지 확인하는 메소드
	 * 
	 * @param userID 사용자 아이디
	 * 
	 * @param userPW 사용자 패스워드
	 * 
	 * @return boolean ID/PW가 일치하는 지 여부
	 */
	public boolean isValid(String userId, String userPw) {

		/*
		 * 이부분에 Database 로직이 들어간다.
		 */
		return true;
	}

	/*
	 * 해당 아이디의 동시 사용을 막기위해서 이미 사용중인 아이디인지를 확인한다.
	 * 
	 * @param userID 사용자 아이디
	 * 
	 * @return boolean 이미 사용 중인 경우 true, 사용중이 아니면 false
	 */
	public boolean isUsing(String userID) {
		return loginUsers.containsValue(userID);
	}

	/*
	 * 현재 접속중인 모든 사용자리스트를 리턴
	 * 
	 * @return list
	 */
	@SuppressWarnings("rawtypes")
	public Collection getUsers() {
		Collection collection = loginUsers.values();
		return collection;
	}

	/*
	 * 현재 접속한 총 사용자 수
	 * 
	 * @return int 현재 접속자 수
	 */
	public int getUserCount() {
		return loginUsers.size();
	}

}

package com.ly;

import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;

import org.nutz.mvc.ActionContext;
import org.nutz.mvc.ActionFilter;
import org.nutz.mvc.View;
import org.nutz.mvc.view.ForwardView;

public class LoginFilter implements ActionFilter {

	public View match(HttpServletRequest request, Method method) {
		String url = "/page/front/login.jsp";
		System.out.println("进入了过滤器了！！！:" + request.getRequestURI()
				+ "--------method:" + method);
		ForwardView v1 = new ForwardView(url);
		if (request.getRequestURI().equals("/jiu/sys/menu/buyerBack.do")
				&& request.getSession().getAttribute("kh") == null) {
			request.setAttribute("yzcw", "请登陆网站！");
			return v1;
		}
		// request.getRequestDispatcher(url)
		// .forward(request, response);
		// if (go.equals("no")) {
		// UTF8JsonView v=new org.nutz.mvc.view.UTF8JsonView(new JsonFormat() );
		// v.setData("dd");//json 格式
		// return v;
		// }
		return null;
	}


	public View match(ActionContext arg0) {
		// TODO Auto-generated method stub
		return null;
	}
}

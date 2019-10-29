<%@page import="java.util.Map"%>
<%
	String cmng_id = "null";
	String cmng_name = "null";
	String com_no = "null";
	String com_name = "null";
	String dept_name = "null";
	if (null != request.getSession().getAttribute("sMap")) {
		Map<String, Object> sMap = (Map<String, Object>) request.getSession().getAttribute("sMap");
		cmng_id = (String) sMap.get("cmng_id");
		cmng_name = (String) sMap.get("cmng_name");
		com_no = (String) sMap.get("com_no");
		com_name = (String) sMap.get("com_name");
		dept_name = (String) sMap.get("dept_name");
	}
%>
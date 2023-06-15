<%@page import="member.model.MemberBean"%>
<script>
    var url = "${url}";
    var msg = "${msg}";
    alert(msg);
    
    if(url != null){
    	location.href = url;
    }else{
    	history.go(-1);
    }
</script>

<%
	MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
	session.setAttribute("loginInfo", loginInfo);
%>
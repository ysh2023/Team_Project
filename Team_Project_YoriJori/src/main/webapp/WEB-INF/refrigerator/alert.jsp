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
	session.getAttribute("loginInfo");
%>
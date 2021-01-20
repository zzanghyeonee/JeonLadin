<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 자바빈 클래스 import --%>      
<%-- DAO import --%>   
<%@ page import="User.UserDAO" %> 

    
<html>
<head>
    <title>회원정보 수정처리</title>
</head>
<body>
    
    <jsp:useBean id="memberBean" class = "User.User" />
    <jsp:setProperty name="memberBean" property="*"/>  
    <%
        // 세션에서 아이디를 가져와 MemberBean에 세팅한다.
        String id = (String)session.getAttribute("userID");
        memberBean.setUserID(id);
    
        // 수정할 회원정보를 담고있는 MemberBean을 DAO로 전달하여 회원정보 수정을 한다.
        UserDAO dao = UserDAO.getInstance();
        dao.updateMember(memberBean);
    %>
    
    <br><br>
    <font size="5" color="gray">회원정보가 수정되었습니다.</font>
    <br><br>
    <input type="button" value="메인으로" onclick="location.href='main.jsp' "/>
    
</body>
</html>



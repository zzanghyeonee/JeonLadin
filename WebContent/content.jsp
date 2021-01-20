<%@page import="java.util.regex.Pattern"%>

<%@page import="java.util.ArrayList"%>

<%@page import="User.MemberVO"%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

 
<%@ page import="java.sql.*" %>  
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 
<html>
 
<head>
 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 
<title>게시글 조회</title>    

    <style type="text/css">
        table {
	border: 3px solid #34495e; 
	width:666px
	}
	
	td,th{
	border:1px solid #34495e ; 
	text-align: center; 
	padding:5px
	}
	
	h2{
	text-align: center;
	}
	
	#btn{
	border-top-left-radius: 5px; 
	border-bottom-left-radius: 5px;
	border-top-right-radius: 5px; 
	border-bottom-right-radius: 5px;
	background-color: #34495e; 
	color: white;  
	padding: 5px;
	}
    </style>
    
<jsp:useBean id="dao" class="User.JDBC_memberDAO" />


</head>
 
<%
 

 
    try {
       
        request.setCharacterEncoding("UTF-8");
       
        String bn = request.getParameter("bn");
 
        ArrayList<MemberVO> list = dao.getMemberlist(bn);
        

        //연결   
 
         
 
        for(MemberVO vo : list){
 
%>

 
<body>                                           
 
    <h1>게시글 조회</h1>                    
 
 
 
    <table border="1">                            <!-- border은 테두리를 표시하는 속성입니다. -->
 
        <tr>                                 
 
            <th>책이름</th>                    
 
            <td><%=vo.getBn() %></td>
 
            <th>출판사</th>
 
            <td><%=vo.getPub() %></td>
 
            <th>작성자</th>
 
            <td><%=vo.getName() %></td>
 
            <th>희망가격</th>
 
            <td><%=vo.getAge() %></td>
 
            <th>이메일</th>
 
            <td><%=vo.getReq() %></td>
 
  
        </tr>
 
        <tr>
 
            <th colspan="2">제목</th>                     <!-- colspan은 행병합 속성입니다. -->
 
            <td colspan="6"><%= vo.getBn()%></td>
 
        </tr>
 
        <tr>
 
            <th colspan="2">내용</th>                    

            <td width="200" height="100" colspan="6"><%= vo.getCont()%></td>
 
        </tr>
 
    </table>
 
    <a href="delete.jsp?bn= <%= vo.getBn() %> " >게시글삭제</a>
 
    <a href="memberSelect.jsp">목록으로</a>
 
<%      
 
        }
 
 
    }catch (Exception e) {
 
        out.println(e.getMessage());
 
        e.printStackTrace();
 
    }
 
%>
 
</body>
 
</html>

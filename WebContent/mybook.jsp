<%@page import="User.MemberVO"%>
<%@ page import="User.UserDAO"%>
<%@page import="java.util.ArrayList"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"


    pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC


 "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>


<head>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>내가 쓴 글</title>


<style>

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


<script>


    function idDelete(delID){

        //alert(delID);


        location.href = "delete.jsp?bn=" + encodeURI(delID);   //get방식으로 삭제할아이디를 넘김

    }
    
    function getInfo(getID){

        //alert(delID);


        location.href = "content.jsp?bn=" + encodeURI(getID);   //get방식으로 삭제할아이디를 넘김

    }
    
    
    
    
    function searchCheck(frm){

        //검색  

        if(frm.keyWord.value ==""){

            alert("검색 단어를 입력하세요.");

            frm.keyWord.focus();

            return;

        }

        frm.submit();      


    }


</script>


</head>


<body>


    <!--


        1. dao객체 선언한다.


        2. dao쪽의 select하는 메소드를 호출하여 그 결과를 리턴하여 테이블에 예쁘게 출력한다.


    -->

    <jsp:useBean id="dao" class="User.JDBC_memberDAO" />
    

    <%

    request.setCharacterEncoding("UTF-8");


    String name = request.getParameter("userName");

    
    ArrayList<MemberVO> list = dao.getMembarlist(name);
    
    

    //ArrayList<MemberVO> list = dao.getMemberlist();

    %>
   
    <h2>내가 쓴 책 목록</h2>

    <table style="margin-left: auto; margin-right: auto; ">


        <tr bgcolor="#34495e">                                               


        <th style="color:white">책이름</th>
        <th style="color:white">출판사</th>
        <th style="color:white">작성자</th>
        <th style="color:white">희망가격</th>
        <th style="color:white">&nbsp;</th>


        </tr>


    <%


    for(MemberVO vo : list){


    %>

        <tr>
        

            <td> <a href="content.jsp?bn=<%=vo.getBn()%>"><%=vo.getBn()%> </a> </td>
            
           
            <td><%=vo.getPub() %></td>
            
            
            <td><%=vo.getName() %></td>


            <td><%=vo.getAge() %></td>


            <td><input type="button" value="삭제" onclick="idDelete('<%=vo.getBn() %>');"></td>

        </tr>              


    <%


    }


     %>


     <tr>  


        <td colspan="7"> <br/>


            <form name="serach" method ="post">


            <select name="keyField">


                <option value="0"> ----선택----</option>


                <option value="bn">책이름</option>


                <option value="name">작성자</option>


                <option value="pub">출판사</option>  


            </select>


            <input type="text" name="keyWord" />


            <input id="btn" type="button" value="검색" onclick="searchCheck(form)" />

            </form>

        </td>      


    </tr>


     <!-- ------------------------------------------------------------------------------ -->


     <tr>

        <td colspan="7"><p align="right"><a href="memberSelect.jsp">[전체목록]</a> | <a href="MemberForm.html">[책등록]</a> | <a href="main.jsp">[메인화면]</a> </p></td>


     </tr>

    </table>  

</body>

</html>
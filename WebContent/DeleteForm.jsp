<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <title>탈퇴 화면</title>
    
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
    
    <script type="text/javascript">
        // 비밀번호 미입력시 경고창
        function checkValue(){
            if(!document.deleteform.password.value){
                alert("비밀번호를 입력하지 않았습니다.");
                return false;
            }
        }
    </script>
    
</head>
<body>
 
    <br><br>
    <b><font size="6" color="gray">내 정보</font></b>
    <br><br><br>
 
    <form name="deleteform" method="post" action="DeleteAction.jsp"
        onsubmit="return checkValue()">
 
        <table>
            <tr>
                <td style="color:white" bgcolor="#34495e">비밀번호</td>
                <td><input type="password" name="userPassword" maxlength="50"></td>
            </tr>
        </table>
        
        <br> 
        <input type="button" value="취소" onclick="location.href='userInformation.jsp'">
        <input type="submit" value="탈퇴" /> 
    </form>
</body>
</html>



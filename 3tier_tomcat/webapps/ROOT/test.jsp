<%-- test.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%!                                                      
int a=100;
int b=60;
%>
<% 
    int c;
    c = a+b;
%>
<html>
    <head>
        <title> jsp 테스트 </title>
    </head>
    <body>
            a=<%=a%><br>                              
            b=<%=b%><br> 
            a+b=<%=c%><br>
    </body>
</html>

<%@page import="java.sql.Connection"%>
<%@page import="connectsql.RequestSQL"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<sql:query var="subjects" dataSource="jdbc/POOLCONN">
    SELECT Name, Telephone, Email FROM contact
</sql:query>
    
<% 
    int countDel = 0;
    int countEdit = 0;
    int rowNumb = 1;
%>

<% 
    Connection con;
    con = RequestSQL.getDbConnection();
    ArrayList<String> result;
    result = RequestSQL.doRequestRowNum(con, "SELECT Id FROM contact");
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contacts</title>
    </head>
    <body>
        <form action="add.htm" method="POST">
            <table>
                <tr>
                    <td>Id:</td>
                    <td><input type="text" name="id" /></td>
                </tr>
                <tr>
                    <td>Name:</td>
                    <td><input type="text" name="name" /></td>
                </tr>
                <tr>
                    <td>Telephone:</td>
                    <td><input type="text" name="telephone" /></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><input type="text" name="email" /></td>
                </tr>
                <tr>
                    <td><button name="submit" >Add Contact</button></td>
                </tr>
            </table>
            
        </form>
        <table border="1">
            <tr>
                <th>№</th>
                <c:forEach var="columnName" items="${subjects.columnNames}">
                    <th><c:out value="${columnName}"/></th>
                </c:forEach>
                <th>Action</th>    
            </tr>
            <c:forEach var="row" items="${subjects.rowsByIndex}">
                <tr>
                    <td><% out.print(rowNumb++); %></td>
                    <c:forEach var="column" items="${row}">
                        <td><c:out value="${column}"/></td>
                    </c:forEach>
                    <td>
                        <form action="delete.htm" method="post">
                            <button name="rownumberdel" value="<% out.print(result.get(countDel++)); %>">Delete</button>
                            
                        </form>
                        <form action="edit.htm" method="post"> 
                            <button name="rownumberedit" value="<% out.print(result.get(countEdit++)); %>">Edit</button>
                        </form>
                    </td>    
                </tr>
            </c:forEach>
        </table>
    </body>
</html>

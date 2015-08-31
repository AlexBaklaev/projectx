<%@page import="java.util.SortedSet"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.sql.Connection"%>
<%@page import="connectsql.RequestSQL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<sql:query var="subjects" dataSource="jdbc/POOLCONN">
    SELECT Name, Telephone, Email FROM contact
</sql:query>
<%
    int rowNumb = 1;
    int id = 0;
    Connection con;
    con = RequestSQL.getDbConnection();
    SortedSet<Integer> result;
    result = RequestSQL.doRequestRowNum(con, "SELECT Id FROM contact");
    id = result.last();
    Iterator iteratorDelete = result.iterator();
    Iterator iteratorEdit = result.iterator();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="/css/fontstyle.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="/css/fontstyle.css">
        <title>Contacts</title>
    </head>
    <body>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" ></script>
        <script>
            $(function () {
                $('#getAjax').click(function () {
                    var val = document.getElementById('getAjax').value;
                    $('#result').load("ajax.htm", {ajaxdel: val});
                });
            });
        </script>

        <script>
            function empty_name() {
                var txt = document.getElementById('name').value;
                if (txt === '') {
                    alert('Необходимо заполнить поле Name!');
                    return false;
                }
                return true;
            }
        </script>
        <table border="0">
            <col width="300" valign="top">
            <col width="600" valign="top">
            <tr>
                <td valign="top">
                    <form onsubmit="return empty_name()" action="add.htm" method="POST">
                        <table border="0">
                            <tr>
                                <td style="background: #E9F0FC"><b>Name: </b></td>
                                <td><input type="text" name="name" id="name"/></td>
                            </tr>
                            <tr>
                                <td style="background: #E9F0FC"><b>Telephone: </b></td>
                                <td><input type="text" name="telephone" /></td>
                            </tr>
                            <tr>
                                <td style="background: #E9F0FC"><b>Email: </b></td>
                                <td><input type="text" name="email" /></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <br/>
                                    <div align="right"><button name="id" value="<% out.print(id + 1);%>">Add Contact</button></div>
                                </td>
                            </tr>

                        </table>

                    </form>
                </td>
                <td>
                    <table border="0">
                        <col width="10" valign="top">
                        <col width="200" valign="top">
                        <col width="150" valign="top">
                        <col width="200" valign="top">
                        <tr valign="top">
                            <th style="background: #E9F0FC">№</th>
                                <c:forEach var="columnName" items="${subjects.columnNames}">
                                <th style="background: #E9F0FC"><c:out value="${columnName}"/></th>
                                </c:forEach>
                            <th style="background: #E9F0FC">Action</th>
                        </tr>
                        <c:forEach var="row" items="${subjects.rowsByIndex}">
                            <tr>
                                <td><% out.print(rowNumb++); %></td>
                                <c:forEach var="column" items="${row}">
                                    <td><c:out value="${column}"/></td>
                                </c:forEach>
                                <td>
                                    <form action="edit.htm" method="POST"> 
                                        <button name="rownumberedit" value="<% out.print(iteratorEdit.next());%>">Edit</button>
                                    </form>
                                    <form action="delete.htm" method="POST">
                                        <button name="rownumberdel" value="<% out.print(iteratorDelete.next()); %>">Delete</button>
                                    </form>
                                </td>    
                            </tr>
                        </c:forEach>
                    </table>
                </td>
            </tr>
        </table>

        <!--<button id="getAjax" value="AJAX">Ajax Request</button>
        <div class="myfont" id="result">Hello Everyone!!!</div>-->
    </body>
</html>

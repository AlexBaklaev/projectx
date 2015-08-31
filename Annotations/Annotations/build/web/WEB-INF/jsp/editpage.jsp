<%@page import="java.util.ArrayList"%>
<%@page import="connectsql.RequestSQL"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="subjects" dataSource="jdbc/POOLCONN">
    SELECT Name, Telephone, Email FROM contact
    WHERE Id = ${rowNum}
</sql:query>

<%
    ArrayList<String> inputTypeName = new ArrayList();
    inputTypeName.add("name");
    inputTypeName.add("telephone");
    inputTypeName.add("email");

    ArrayList<String> headerOfField = new ArrayList();
    headerOfField.add("Name: ");
    headerOfField.add("Telephone: ");
    headerOfField.add("Email: ");

    int counterList = 0;
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Contact</title>
    </head>
    <body>
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
        <form onsubmit="return empty_name()" action="redaction.htm" method="POST">
            <table border="0">
                <c:forEach var="row" items="${subjects.rowsByIndex}">
                    <tr>
                        <c:forEach var="column" items="${row}">
                            <td style="background: #E9F0FC">
                                <b><% out.print(headerOfField.get(counterList)); %></b>
                            </td>
                            <td style="background: #E9F0FC">
                                <input type="text" id="<% out.print(inputTypeName.get(counterList)); %>" name="<% out.print(inputTypeName.get(counterList++));%>" value="<c:out value="${column}"/>" />
                            </td>
                        </c:forEach>
                        <td><button name="Id" value="${rowNum}" >Submit</button></td>
                    </tr>
                </c:forEach>
            </table>
        </form>
    </body>
</html>

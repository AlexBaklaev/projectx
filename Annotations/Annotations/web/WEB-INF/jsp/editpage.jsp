<%@page import="java.util.ArrayList"%>
<%@page import="connectsql.RequestSQL"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<% 
    Connection con;
    con = RequestSQL.getDbConnection();
    ArrayList<String> resp;
    resp = RequestSQL.doRequestEditPage(con, "SELECT * FROM contact WHERE Id = 5");
  
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Contact</title>
    </head>
    <body>
        
        <form action="redaction.htm" method="POST">
            <table>
                <tr>
                    <td>Id:</td>
                    <td><input type="text" name="id" value="<% out.print(resp.get(0)); %>" /></td>
                    <td>Name:</td>
                    <td><input type="text" name="name" value="<% out.print(resp.get(1)); %>" /></td>
                    <td>Telephone:</td>
                    <td><input type="text" name="telephone" value="<% out.print(resp.get(2)); %>" /></td>
                    <td>Email:</td>
                    <td><input type="text" name="email" value="<% out.print(resp.get(3)); %>" /></td>
                    <td><button name="submit">Edit</button></td>
                </tr>
            </table>
        </form>
    </body>
</html>

package controller;

import connectsql.RequestSQL;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HelloController {
    
    Connection con;
           
    @RequestMapping(value = "/add.htm", method = RequestMethod.POST)
    public String onSubmitAdd(@RequestParam("id") String id,
                           @RequestParam("name") String name,
                           @RequestParam("telephone") String telephone,
                           @RequestParam("email") String email) throws 
            ClassNotFoundException, SQLException {
                
        String req = "INSERT INTO contact VALUES ('" + id + "','" + name + "','" + telephone + "','" + email + "')";
        con = RequestSQL.getDbConnection();
        RequestSQL.doRequestUpdate(con, req);
            
        return "index";
    }
    
    @RequestMapping(value = "/delete.htm", method = RequestMethod.POST)
    public String onSubmitDelete(@RequestParam("rownumberdel") int rownumber) throws 
            ClassNotFoundException, SQLException {
                
        String req = "DELETE FROM contact WHERE Id = " + rownumber;
        con = RequestSQL.getDbConnection();
        RequestSQL.doRequestUpdate(con, req);
            
        return "index";
    }
    
    @RequestMapping(value = "/edit.htm", method = RequestMethod.POST)
    public String onSubmitEdit(@RequestParam("rownumberedit") int rownumber) throws
            ClassNotFoundException, SQLException {
        
        ArrayList<String> resultRequest;
        String req = "SELECT * FROM contact WHERE Id = " + rownumber;
        con = RequestSQL.getDbConnection();
        resultRequest = RequestSQL.doRequestEditPage(con, req);
                
        return "editpage";
    }
    
    @RequestMapping(value = "/redaction.htm", method = RequestMethod.POST)
    public String onSubmitRedact(@RequestParam("id") String id,
                           @RequestParam("name") String name,
                           @RequestParam("telephone") String telephone,
                           @RequestParam("email") String email) throws 
            ClassNotFoundException, SQLException {
                
        String req = "UPDATE contact SET Id = '" + id + "', Name = '" + name + "', Telephone = '"
                                                 + telephone + "', email = '" + email + "' WHERE Id = '" + id + "'";
        con = RequestSQL.getDbConnection();
        RequestSQL.doRequestUpdate(con, req);
            
        return "index";
    }
}

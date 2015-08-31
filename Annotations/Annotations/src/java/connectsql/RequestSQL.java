package connectsql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.SortedSet;
import java.util.TreeSet;

public class RequestSQL {

    public static Connection getDbConnection() throws ClassNotFoundException, SQLException {
        Connection connection = null;
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/mynewdatabase",
                "root", "root");
        return connection;
    }

    public static void doRequestUpdate(Connection conn, String request) throws SQLException {
        Statement stmt = null;
        ResultSet rs = null;

        try {
            stmt = conn.createStatement();
            stmt.executeUpdate(request);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
        }
    }

    public static ResultSet doRequestSelect(Connection conn, String request) throws SQLException {
        Statement stmt = null;
        ResultSet rs = null;
        try {
            stmt = conn.createStatement();
            rs = stmt.executeQuery(request);

            return rs;
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
        }
    }

    public static SortedSet doRequestRowNum(Connection conn, String request) throws SQLException {
        Statement stmt = null;
        ResultSet rs = null;
        SortedSet<Integer> setRows = new TreeSet();
        try {
            stmt = conn.createStatement();
            rs = stmt.executeQuery(request);
            while (rs.next()) {
                setRows.add(rs.getInt("Id"));
            }
            return setRows;
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
        }
    }

    public static ArrayList doRequestEditPage(Connection conn, String request) throws SQLException {
        Statement stmt = null;
        ResultSet rs = null;
        ArrayList<String> arrayString = new ArrayList();
        try {
            stmt = conn.createStatement();
            rs = stmt.executeQuery(request);
            while (rs.next()) {
                arrayString.add(rs.getString("Id"));
                arrayString.add(rs.getString("Name"));
                arrayString.add(rs.getString("Telephone"));
                arrayString.add(rs.getString("Email"));
            }
            return arrayString;
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
        }
    }
}

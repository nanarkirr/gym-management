
package org.example.gymmanagement.helper;


import org.apache.log4j.Logger;
import org.example.gymmanagement.dao.ResultSetMapper;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DBUtil {

    private static final Logger logger = org.apache.log4j.Logger
            .getLogger(DBUtil.class);

    private static Connection con = null;

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/alpesh", "root", "root");
        } catch (Exception e) {
            logger.error("Failed to connect to database " + e.getMessage());
        }
        return con;
    }

    public void execute(String query, Object... params) {
        Connection con = getConnection();
        PreparedStatement pstm = null;
        try {
            pstm = con.prepareStatement(query);
            for (int i = 0; i < params.length; i++) {
                pstm.setObject(i + 1, params[i]);
            }
            int n = pstm.executeUpdate();
        } catch (SQLException e) {
            log(e, query);
        } finally {
            close(pstm, con);
        }
    }

    public <T> List<T> executeQuery(String query,
                                    ResultSetMapper<T> resultSetMapper, Object... params) {

        Connection con = getConnection();

        PreparedStatement pstm = null;
        ResultSet rs = null;
        List<T> resultObjectList = new ArrayList<T>();
        try {
            pstm = con.prepareStatement(query);
            for (int i = 0; i < params.length; i++) {
                pstm.setObject(i + 1, params[i]);
            }
            rs = pstm.executeQuery();
            int index = 0;
            while (rs.next()) {
                T resultObject = resultSetMapper.mapRow(rs, index++);
                resultObjectList.add(resultObject);
            }

        } catch (SQLException e) {
            log(e, query);
        } finally {
            close(rs, pstm, con);
        }
        return resultObjectList;
    }

    public void executeInsert(String query, Object... params) {
        Connection con = getConnection();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        try {
            pstm = con.prepareStatement(query);
            for (int i = 0; i < params.length; i++) {
                pstm.setObject(i + 1, params[i]);
            }
            pstm.executeUpdate();

        } catch (SQLException e) {
            log(e, query);
        } finally {
            close(rs, pstm, con);
        }
    }

    public void close(Connection con) {
        if (con != null) {
            try {
                con.close();
            } catch (Exception e) {
                logger.error("ERROR_ON_CLOSING_DB_CONNECTION", e);
            }
        }
    }

    public void close(PreparedStatement stmt) {
        if (stmt != null) {
            try {
                stmt.close();
            } catch (Exception e) {
                logger.error("ERROR_ON_CLOSING_DB_PREPARED_STATEMENT", e);
            }
        }
    }

    public void close(ResultSet rs) {
        if (rs != null) {
            try {
                rs.close();
            } catch (Exception e) {
                logger.error("ERROR_ON_CLOSING_DB_STATEMENT", e);
            }
        }
    }

    public void close(ResultSet rs, PreparedStatement pstm, Connection con) {
        close(rs);
        close(pstm);
        close(con);
    }

    public void close(PreparedStatement pstm, Connection con) {
        close(pstm);
        close(con);
    }

    public void log(SQLException e, String query) {
        logger.error("ERROR_ON_EXECUTING_SQL_QUERY_FOR_" + query, e);
    }

}

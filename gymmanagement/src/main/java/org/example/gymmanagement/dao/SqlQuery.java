package org.example.gymmanagement.dao;

public class SqlQuery {

    public static String INSERT_PARTICIPANT = "insert into participant(name,email,phone,bid) values(?,?,?,?)";
    public static String UPDATE_PARTICIPANT = "update participant set name=?,phone=?,email=?, bid=? where pid=?";
    public static String SELECT_PARTICIPANT = "select * from participant";
    public static String DELETE_PARTICIPANT = "delete from participant where pid=?";

    public static String INSERT_BATCH = "insert into batch values(?,?)";
    public static String UPDATE_BATCH = "update batch set bname=? where bid=?";
    public static String SELECT_BATCH = "select * from batch";
    public static String DELETE_BATCH = "delete from  batch  where bid=?";

    public static String REMOVE_BATCH_REFERENCE = "update participant set bid=? where bid=?";
}

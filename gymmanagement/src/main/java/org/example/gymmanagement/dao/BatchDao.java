package org.example.gymmanagement.dao;


import org.example.gymmanagement.helper.DBUtil;
import org.example.gymmanagement.model.Batch;
import org.example.gymmanagement.model.Participant;

import java.sql.*;
import java.util.List;
import java.util.Vector;

public class BatchDao {

    private final DBUtil dbUtil;

    public BatchDao(DBUtil dbUtil) {
        this.dbUtil = dbUtil;
    }

    public void insert_batch(int bid, String bname) {
        dbUtil.executeInsert(SqlQuery.INSERT_BATCH, bid, bname);
    }

    public void update_batch(int bid, String bname) {
        dbUtil.execute(SqlQuery.UPDATE_BATCH, bname, bid);
    }

    public List<Batch> getBatch() {
        return dbUtil.executeQuery(SqlQuery.SELECT_BATCH,
                (rs, index) -> getBatch(rs));
    }

    public void delete_batch(int bid) {
        dbUtil.execute(SqlQuery.REMOVE_BATCH_REFERENCE, null,bid);
        dbUtil.execute(SqlQuery.DELETE_BATCH, bid);
    }

    public static Batch getBatch(ResultSet rs) throws SQLException {
        Batch batch = new Batch();
        batch.setBid(rs.getInt("bid"));
        batch.setbName(rs.getString("bname"));
        return batch;
    }
}

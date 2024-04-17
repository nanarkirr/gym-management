package org.example.gymmanagement.dao;


import org.example.gymmanagement.helper.DBUtil;
import org.example.gymmanagement.model.Participant;

import java.sql.*;
import java.util.List;
import java.util.Vector;

public class ParticipantDao {

    private final DBUtil dbUtil;

    public ParticipantDao(DBUtil dbUtil) {
        this.dbUtil = dbUtil;
    }

    public void insert_participant(String name, String email, String phone, int bid) {
        dbUtil.executeInsert(SqlQuery.INSERT_PARTICIPANT, name, email, phone, bid);
    }

    public void update_participant(int pid, String name, String email, String phone, int bid) {
        dbUtil.execute(SqlQuery.UPDATE_PARTICIPANT, name, email, phone, bid, pid);
    }

    public List<Participant> getParticipant() {
        return dbUtil.executeQuery(SqlQuery.SELECT_PARTICIPANT,
                (rs, index) -> getParticipant(rs));
    }

    public static Participant getParticipant(ResultSet rs) throws SQLException {
        Participant participant = new Participant();
        participant.setPid(rs.getInt("pid"));
        participant.setName(rs.getString("name"));
        participant.setEmail(rs.getString("email"));
        participant.setPhone(rs.getString("phone"));
        participant.setBid(rs.getInt("bid"));
        return participant;
    }

    public void delete_participant(int pid) {
        dbUtil.execute(SqlQuery.DELETE_PARTICIPANT, pid);
    }
}

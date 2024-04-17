package org.example.gymmanagement.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

public interface ResultSetMapper<T> {
    T mapRow(ResultSet rs, int index) throws SQLException;
}

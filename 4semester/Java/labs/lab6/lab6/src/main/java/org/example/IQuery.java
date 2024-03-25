package org.example;

import java.sql.ResultSet;

public interface IQuery {
    public ResultSet ExecuteQuery(String sql);
}

package name.ruslan.rating.dao;

import java.sql.Connection;
import java.sql.SQLException;

// ConnectionHelper
// сделать дополнительно м-ды begin и end
public class TransactionHelper {
	
    private Connection connection = ConnectionPool.getInstance().getConnection();
    //
    public void beginTransaction(AbstractDAO ... daos){
        try {
            connection.setAutoCommit(false);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        for (AbstractDAO dao : daos) {
            dao.setConnection(connection);
        }
    }
    public  void endTransaction(){
        try {
            connection.setAutoCommit(true);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        ConnectionPool.getInstance().releaseConnection(connection);
    }
    public void commit() {
        try {
            connection.commit();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void rollback(){
        try {
            connection.rollback();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
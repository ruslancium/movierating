package name.ruslan.rating.dao;

import java.util.List;
import java.util.Optional;

import name.ruslan.rating.dbentity.Entity;
import name.ruslan.rating.exception.DAOException;
import name.ruslan.rating.pool.ProxyConnection;

public abstract class AbstractDAO<K, T extends Entity> {

    protected ProxyConnection connection;

    AbstractDAO(ProxyConnection connection) {
        this.connection = connection;
    }
 
    public abstract List<T> selectAll() throws DAOException;
    
    public abstract Optional<T> selectEntityByKey(K key) throws DAOException; 
    
    
    
}

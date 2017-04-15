package name.ruslan.rating.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import name.ruslan.rating.dbentity.User;
import name.ruslan.rating.exception.DAOException;
import name.ruslan.rating.pool.ProxyConnection;

public class UserDAO extends AbstractDAO<String, User> {

    private static final String SQL_SELECT_ALL_USERS =
            "SELECT login, email, registration_date, rating FROM user";




    public UserDAO(ProxyConnection connection) {
        super(connection);
    }

    @Override
    public List<User> selectAll() throws DAOException {
        List<User> userList = new ArrayList();
        try (Statement statement = connection.createStatement()) {
            ResultSet resultSet = statement.executeQuery(SQL_SELECT_ALL_USERS);
            while (resultSet.next()) {
                User user = new User();
                user.setLogin(resultSet.getString("login"));
                user.setEmail(resultSet.getString("email"));
                user.setRegistrationDate(resultSet.getDate("registration_date"));
                user.setRating(resultSet.getInt("rating"));
                user.setRole(resultSet.getString("role"));                
                userList.add(user);
            }

        } catch (SQLException e) {
            throw new DAOException("Fail when select all users from db: ", e);
        }

        return userList;
    }

    @Override
    public Optional<User> selectEntityByKey(String key) throws DAOException {
        User user = null;
        try (PreparedStatement statement = connection.prepareStatement(SQL_SELECT_USER)) {
            statement.setString(1, key);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                user = new User();
                user.setLogin(resultSet.getString("login"));
                user.setEmail(resultSet.getString("email"));
                user.setRegistrationDate(resultSet.getDate("registration_date"));
                user.setRating(resultSet.getInt("rating"));
                user.setRole(resultSet.getString("role"));
                user.setBirthDate(resultSet.getDate("birth_date"));
                user.setCountry(resultSet.getString("country"));
            }
        } catch (SQLException e) {
            throw new DAOException("Fail when select user by key = " + key + " from db: ", e);
        }
        return Optional.ofNullable(user);
    }

    /**
     * Selects user password by login.
     *
     * @param login the user login
     * @return the optional object for selected password
     * @throws DAOException in the case of the problem while working with the database
     */
    public Optional<String> selectPassword(String login) throws DAOException {
        String password = null;
        try (PreparedStatement statement = connection.prepareStatement(SQL_SELECT_PASSWORD)) {
            statement.setString(1, login);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                password = resultSet.getString("password");
            }
        } catch (SQLException e) {
            throw new DAOException("Fail when select password by login = " + login + " from db: ", e);
        }
        return Optional.ofNullable(password);
    }

    /**
     * Selects user status by login.
     *
     * @param login the user login
     * @return the selected status or {@code null} if it doesn't exist
     * @throws DAOException in the case of the problem while working with the database
     */
    public String selectStatus(String login) throws DAOException {
        String status = null;
        try (PreparedStatement statement = connection.prepareStatement(SQL_SELECT_STATUS)) {
            statement.setString(1, login);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                status = resultSet.getString("status");
            }
        } catch (SQLException e) {
            throw new DAOException("Fail when select status by login = " + login + " from db: ", e);
        }
        return status;
    }

    /**
     * Selects user role by login.
     *
     * @param login the user login
     * @return the optional object for user role
     * @throws DAOException in the case of the problem while working with the database
     */
    public Optional<String> selectRole(String login) throws DAOException {
        String role = null;
        try (PreparedStatement statement = connection.prepareStatement(SQL_SELECT_ROLE)) {
            statement.setString(1, login);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                role = resultSet.getString("role");
            }
        } catch (SQLException e) {
            throw new DAOException("Fail when select role by login = " + login + " from db: ", e);
        }
        return Optional.ofNullable(role);
    }

    /**
     * Selects email by itself.
     *
     * @param email the user email
     * @return the optional object for the user email
     * @throws DAOException in the case of the problem while working with the database
     */
    public Optional<String> selectEmailByItself(String email) throws DAOException {
        String currEmail = null;
        try (PreparedStatement statement = connection.prepareStatement(SQL_SELECT_EMAIL_BY_ITSELF)) {
            statement.setString(1, email);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                currEmail = resultSet.getString("email");
            }
        } catch (SQLException e) {
            throw new DAOException("Fail when select email = " + email + " from db: ", e);
        }
        return Optional.ofNullable(currEmail);
    }

    /**
     * Selects login by email.
     *
     * @param email the user email
     * @return the optional object for the user login
     * @throws DAOException in the case of the problem while working with the database
     */
    public Optional<String> selectLoginByEmail(String email) throws DAOException {
        String login = null;
        try (PreparedStatement statement = connection.prepareStatement(SQL_SELECT_LOGIN_BY_EMAIL)) {
            statement.setString(1, email);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                login = resultSet.getString("login");
            }
        } catch (SQLException e) {
            throw new DAOException("Fail when select login by email = " + email + " from db: ", e);
        }
        return Optional.ofNullable(login);
    }

    /**
     * Updates account activation hash by login.
     *
     * @param login the user login
     * @param hash  the new hash value
     * @throws DAOException in the case of the problem while working with the database
     */
    public void updateActivationHash(String login, String hash) throws DAOException {
        try (PreparedStatement statement = connection.prepareStatement(SQL_UPDATE_ACTIVATION_HASH)) {
            statement.setString(1, hash);
            statement.setString(2, login);
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new DAOException("Fail when update activation hash by login = " + login + " in db: ", e);
        }
    }

    /**
     * Selects user login by itself.
     *
     * @param login the login
     * @return the optional object for the selected login
     * @throws DAOException tin the case of the problem while working with the database
     */
    public Optional<String> selectLogin(String login) throws DAOException {
        String existLogin = null;
        try (PreparedStatement statement = connection.prepareStatement(SQL_SELECT_LOGIN)) {
            statement.setString(1, login);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                existLogin = resultSet.getString("login");
            }
        } catch (SQLException e) {
            throw new DAOException("Fail when select login = " + login + " from db: ", e);
        }
        return Optional.ofNullable(existLogin);
    }

    /**
     * Selects account activation hash by login.
     *
     * @param login the user login
     * @return the optional object for selected hash string
     * @throws DAOException in the case of the problem while working with the database
     */
    public Optional<String> selectActivationHash(String login) throws DAOException {
        String hash = null;
        try (PreparedStatement statement = connection.prepareStatement(SQL_SELECT_ACTIVATION_HASH)) {
            statement.setString(1, login);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                hash = resultSet.getString("account_activation_hash");
            }
        } catch (SQLException e) {
            throw new DAOException("Fail when select activation hash by login =  " + login + " from db: ", e);
        }
        return Optional.ofNullable(hash);
    }

    /**
     * Updates user status by login.
     *
     * @param login the user login
     * @param status the new status value
     * @throws DAOException in the case of the problem while working with the database
     */
    public boolean updateStatus(String login, String status) throws DAOException {
        boolean success;
        try (PreparedStatement statement = connection.prepareStatement(SQL_UPDATE_STATUS)) {
            statement.setString(1, status);
            statement.setString(2, login);
            success = statement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new DAOException("Fail when set active status by login = " + login + " in db: ", e);
        }
        return success;
    }

    /**
     * Updates user password by login.
     *
     * @param login    the login
     * @param password the password
     * @throws DAOException the dao exception
     */
    public boolean updatePassword(String login, String password) throws DAOException {
        boolean success;
        try (PreparedStatement statement = connection.prepareStatement(SQL_UPDATE_PASSWORD)) {
            statement.setString(1, password);
            statement.setString(2, login);
            success = statement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new DAOException("Fail when update password by login = " + login + " in db: ", e);
        }
        return success;
    }

    public String insert(User user) throws DAOException {
        try (PreparedStatement statement = connection.prepareStatement(SQL_INSERT_USER,
                PreparedStatement.RETURN_GENERATED_KEYS)) {
            statement.setString(1, user.getLogin());
            statement.setString(2, user.getPassword());
            statement.setString(3, user.getEmail());            
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new DAOException("Fail when insert user = " + user + " into db: ", e);
        }
        return user.getLogin();
    }

    public boolean delete(String key) throws DAOException {
        boolean success;
        try (PreparedStatement statement = connection.prepareStatement(SQL_DELETE_USER)) {
            statement.setString(1, key);
            success = (statement.executeUpdate() > 0);
        } catch (SQLException e) {
            throw new DAOException("Fail when delete user = " + key + " from db: ", e);
        }
        return success;
    }

    public boolean update(User user) throws DAOException {
        boolean success;
        try (PreparedStatement statement = connection.prepareStatement(SQL_UPDATE_USER)) {
            statement.setString(6, user.getCountry());
            statement.setString(8, user.getLogin());
            success = statement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new DAOException("Fail when update user = " + user + " in db: ", e);
        }
        return success;
    }

    /**
     * Updates user rating by login.
     *
     * @param login  the user login
     * @param rating the new rating value
     * @return {@code true} if rating has been updated, {@code false} - otherwise.
     * @throws DAOException in the case of the problem while working with the database
     */
    public boolean updateUserRating(String login, int rating) throws DAOException {
        boolean success;
        try (PreparedStatement statement = connection.prepareStatement(SQL_UPDATE_USER_RATING)) {
            statement.setInt(1, rating);
            statement.setString(2, login);
            success = statement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new DAOException("Fail when update rating of user = " + login + " in db: ", e);
        }
        return success;
    }

    /**
     * Selects user rating by login.
     *
     * @param login the user login
     * @return the optional object for selected rating
     * @throws DAOException in the case of the problem while working with the database
     */
    public Optional<Integer> selectUserRating(String login) throws DAOException {
        Integer rating = null;
        try (PreparedStatement statement = connection.prepareStatement(SQL_SELECT_USER_RATING)) {
            statement.setString(1, login);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                rating = resultSet.getInt("rating");
            }
        } catch (SQLException e) {
            throw new DAOException("Fail when select rating of user = " + login + " from db: ", e);
        }
        return Optional.ofNullable(rating);
    }
}

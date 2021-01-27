/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.UserDTO;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.apache.commons.codec.digest.DigestUtils;
/**
 *
 * @author Admin
 */
public class UserDAO {

    public UserDTO checkLogin(String userID, String password) throws SQLException, NoSuchAlgorithmException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            conn = utils.MyUtils.getConn();
            if (conn != null) {
                String sql = "SELECT [userID],[fullName],[password],[status],[roleID]\n"
                        + "FROM [Assignment2_BachDuyHoang].[dbo].[tblUSers]\n"
                        + "WHERE userID = ? and [password] = ? and [status] = 'new'";
                ps = conn.prepareStatement(sql);
                ps.setString(1, userID);
                ps.setString(2, DigestUtils.sha256Hex(password));
                rs = ps.executeQuery();
                if (rs.next()) {
                    user = new UserDTO(rs.getString("userID"), rs.getString("fullName"), "", rs.getString("roleID"));
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return user;
    }

    public boolean createAccount(UserDTO user) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = utils.MyUtils.getConn();
            if (conn != null) {
                String sql = "insert tblUSers([userID],[fullName],[password],[status],[roleID])\n"
                        + "values (?,?,?,?,?)";
                ps = conn.prepareStatement(sql);
                ps.setString(1, user.getUserID());
                ps.setString(2, user.getName());
                ps.setString(3, DigestUtils.sha256Hex(user.getPassword()));
                ps.setString(4, "new");
                ps.setString(5, "us");

                return ps.executeUpdate() > 0;
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return false;
    }
    
    public boolean checkAccountExist(String userID) throws SQLException, NoSuchAlgorithmException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            conn = utils.MyUtils.getConn();
            if (conn != null) {
                String sql = "SELECT [userID],[fullName],[password],[status],[roleID]\n"
                        + "FROM [Assignment2_BachDuyHoang].[dbo].[tblUSers]\n"
                        + "WHERE userID = ?";
                ps = conn.prepareStatement(sql);
                ps.setString(1, userID);
                rs = ps.executeQuery();
                if (rs.next()) {
                    return rs.getString(1).length() > 0;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return false;
    }
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.QuestionDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class QuestionDAO {

    private int SIZE_PAGE = 20;

    public List<QuestionDTO> getListPagingAdmin(String searchName, String searchCategory, int min, int max, int page) throws SQLException {
        List<QuestionDTO> listProduct = null;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = utils.MyUtils.getConn();
            if (conn != null) {
                String sql = "SELECT TOP (1000) [questionID],[questionContent],[ans1],[ans2],[ans3],[ans4],[correctAns],[createDate],[subjectID],[status]\n"
                        + "FROM [Assignment2_BachDuyHoang].[dbo].[tblQuestions]"
                        + "WHERE productName like ? and price between ? and ?  and categoryID like ? \n"
                        + "ORDER BY createDate\n"
                        + "OFFSET ? ROWS FETCH NEXT 20\n"
                        + "ROWS ONLY";
                ps = conn.prepareStatement(sql);
                ps.setString(1, "%" + searchName + "%");
                ps.setInt(2, min);
                ps.setInt(3, max);
                ps.setString(4, "%" + searchCategory + "%");
                ps.setInt(5, (page - 1) * SIZE_PAGE);
                rs = ps.executeQuery();
                while (rs.next()) {
                    if (listProduct == null) {
                        listProduct = new ArrayList<>();
                    }

                }

            }

        } catch (Exception e) {
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

        return listProduct;
    }

    public int countPage(String searchName, String searchCategory, int min, int max) throws SQLException {
        int countPage = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = utils.MyUtils.getConn();
            if (conn != null) {
                String sql = "SELECT COUNT([productID])\n"
                        + "FROM [Assignment1_BachDuyHoang].[dbo].[tblProducts]\n"
                        + "WHERE productName like ? and price between ? and ? and active = '1'  and quantity > 0 and categoryID like ?";
                ps = conn.prepareStatement(sql);
                ps.setString(1, "%" + searchName + "%");
                ps.setInt(2, min);
                ps.setInt(3, max);
                ps.setString(4, "%" + searchCategory + "%");
                rs = ps.executeQuery();

                if (rs.next()) {
                    int result = rs.getInt(1);

                    if ((result % SIZE_PAGE) != 0) {
                        countPage = result / SIZE_PAGE + 1;
                    } else {
                        countPage = result / SIZE_PAGE;
                    }
                }
                return countPage;
            }

        } catch (Exception e) {
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

        return countPage;
    }
    
    public List<QuestionDTO> getListQuestion() throws SQLException{
        List<QuestionDTO> list = null;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            conn = utils.MyUtils.getConn();
            if (conn != null) {
                String sql = "";
                ps = conn.prepareStatement(sql);
                rs = ps.executeQuery();
                
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
        
        return list;
    }
}

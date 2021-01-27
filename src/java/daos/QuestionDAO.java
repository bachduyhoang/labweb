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

    private final int SIZE_PAGE = 20;

    public List<QuestionDTO> getListPagingAdmin(String searchName, String searchSubject, String status, int page) throws SQLException {
        List<QuestionDTO> listProduct = null;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = utils.MyUtils.getConn();
            if (conn != null) {
                String sql = "SELECT [questionID],[questionContent],[ans1],[ans2],[ans3],[ans4],[correctAns],[createDate],[subjectID],[status]\n"
                        + "FROM [Assignment2_BachDuyHoang].[dbo].[tblQuestions]\n"
                        + "WHERE subjectID like ? and questionContent like ? and [status] like ?\n"
                        + "ORDER BY questionID\n"
                        + "OFFSET ? ROWS FETCH NEXT 20\n"
                        + "ROW ONLY";
                ps = conn.prepareStatement(sql);
                ps.setString(1, "%" + searchName + "%");
                ps.setString(2, "%" + searchSubject + "%");
                ps.setString(3, "%" + status + "%");
                ps.setInt(4, (page - 1) * SIZE_PAGE);

                rs = ps.executeQuery();
                while (rs.next()) {
                    if (listProduct == null) {
                        listProduct = new ArrayList<>();
                    }
                    QuestionDTO question = new QuestionDTO(rs.getString("questionID"), rs.getString("questionContent"),
                            rs.getString("ans1"), rs.getString("ans2"), rs.getString("ans3"), rs.getString("ans4"),
                            rs.getString("correctAns"), rs.getString("subjectID"), rs.getDate("createDate"), rs.getBoolean("status"));
                    listProduct.add(question);
                }
            }

        } catch (Exception e) {
            System.out.println(e.toString());
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

    public int countPage(String searchName, String searchSubject, String status) throws SQLException {
        int countPage = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = utils.MyUtils.getConn();
            if (conn != null) {
                String sql = "SELECT COUNT([questionID])\n"
                        + "FROM [Assignment2_BachDuyHoang].[dbo].[tblQuestions]\n"
                        + "WHERE subjectID like ? and questionContent like ? and [status] like ?";
                ps = conn.prepareStatement(sql);
                ps.setString(1, "%" + searchName + "%");
                ps.setString(2, "%" + searchSubject + "%");
                ps.setString(3, "%" + status + "%");
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
            System.out.println(e.toString());
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

    public List<QuestionDTO> getListQuestion() throws SQLException {
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

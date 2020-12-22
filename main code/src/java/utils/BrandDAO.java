/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import beans.Brand;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Hung
 */
public class BrandDAO {
    public static List<Brand> queryBrand(Connection conn) throws SQLException {
        String sql = "Select * from Brand a ";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
 
        ResultSet rs = pstm.executeQuery();
        List<Brand> list = new ArrayList<Brand>();
        while (rs.next()) {
            int id = rs.getInt("id");
            String name = rs.getString("name");
            String description = rs.getString("description");
            String logo = rs.getString("logo");
            String manufacturer= rs.getString("manufacturer");
            
            Brand brand = new Brand();
            brand.setId(id);
            brand.setName(name);
            brand.setDescription(description);
            brand.setLogo(logo);
            brand.setManufacturer(manufacturer);
            list.add(brand);
        }
        return list;
    } 
    
    public static Brand findBrand(Connection conn, int id) throws SQLException {
        String sql = "Select * from Brand a where a.id=?";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
 
        ResultSet rs = pstm.executeQuery();
 
        while (rs.next()) {
            String name = rs.getString("name");
            String description = rs.getString("description");
            String logo = rs.getString("logo");
            String manufacturer= rs.getString("manufacturer");            
            
            Brand brand = new Brand();
            brand.setId(id);
            brand.setName(name);
            brand.setDescription(description);
            brand.setLogo(logo);
            brand.setManufacturer(manufacturer);            
            return brand;
        }
        return null;
    }

    public static void insertBrand(Connection conn, Brand brand) throws SQLException {
        String sql = "Insert into Brand(name, logo, manufacturer, description) values (?,?,?,?)";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
 
        pstm.setString(1, brand.getName());
        pstm.setString(2, brand.getLogo());
        pstm.setString(3, brand.getManufacturer());
        pstm.setString(4, brand.getDescription());
 
        pstm.executeUpdate();
    }    
    
    public static void updateBrand(Connection conn, Brand brand) throws SQLException {
        String sql = "Update Brand set name =?, logo =?, manufacturer =?, description =? where id=? ";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
 
        pstm.setInt(5, brand.getId());
        pstm.setString(1, brand.getName());
        pstm.setString(4, brand.getDescription());
        pstm.setString(3, brand.getManufacturer());
        pstm.setString(2, brand.getLogo());        
        
        pstm.executeUpdate();
    }    
    
    public static void deleteBrand(Connection conn, int id) throws SQLException {
        String sql = "Delete From Brand where id= ?";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
 
        pstm.setInt(1, id);
 
        pstm.executeUpdate();
    }            
}
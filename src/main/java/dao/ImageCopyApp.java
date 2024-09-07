package dao;

import javax.swing.*;

import context.DBConnect;

import java.awt.GridLayout;
import java.awt.Image;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.IOException;
import java.nio.file.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ImageCopyApp {
    public static void main(String[] args) {
        JFrame frame = new JFrame("Image Copy Example");
        JButton selectImageButton = new JButton("Chọn ảnh");

        selectImageButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                JFileChooser fileChooser = new JFileChooser();
                fileChooser.setMultiSelectionEnabled(true);
                int result = fileChooser.showOpenDialog(null);
                
                if (result == JFileChooser.APPROVE_OPTION) {
                    File[] selectedFiles = fileChooser.getSelectedFiles();
                    String destinationFolder = "src/main/webapp/Imgs/";

                    // Tạo thư mục 'Imgs' nếu chưa tồn tại
                    File dir = new File(destinationFolder);
                    if (!dir.exists()) {
                        dir.mkdirs();
                    }

                    try {
                        for (File selectedFile : selectedFiles) {
                            // Sao chép ảnh vào thư mục Imgs
                            Path sourcePath = selectedFile.toPath();
                            Path destinationPath = Paths.get(destinationFolder + selectedFile.getName());
                            Files.copy(sourcePath, destinationPath, StandardCopyOption.REPLACE_EXISTING);
                            
                            String nameIMG = selectedFile.getName();
                            System.out.println(nameIMG);
                            // Lưu tên ảnh vào cơ sở dữ liệu (hàm saveImageNameToDatabase)
                            saveImageNameToDatabase(0,nameIMG);
                        }

                        JOptionPane.showMessageDialog(null, "Các ảnh đã được sao chép vào thư mục Imgs và lưu tên vào cơ sở dữ liệu.");
                    } catch (IOException ex) {
                        ex.printStackTrace();
                        JOptionPane.showMessageDialog(null, "Đã xảy ra lỗi khi sao chép ảnh.");
                    }
                }
            }
        });

        frame.add(selectImageButton);
        frame.setSize(400, 200);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setVisible(true);
        frame.setLocationRelativeTo(null);
        
        
    }

     //Hàm này để lưu tên của ảnh vào cơ sở dữ liệu
    private static void saveImageNameToDatabase(int id,String imageName) {
        Connection conn = null;
        PreparedStatement ps = null;

        String query = "INSERT INTO ProductImage (product_id, image) VALUES (?, ?)";

        try {
            conn = DBConnect.getConnection(); // Giả sử DBConnect.getConnection() trả về đối tượng Connection đã kết nối
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ps.setString(2, imageName);
            ps.executeUpdate(); // Sử dụng PreparedStatement để thực hiện câu lệnh SQL

        } catch (java.sql.SQLException e) {
            e.printStackTrace();
        } finally {
            // Đóng các tài nguyên sau khi sử dụng
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (java.sql.SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
    public List<String> loadImagesFromDatabase(int productId) {
        List<String> images = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = "SELECT image FROM ProductImage WHERE product_id = ?";

        try {
            conn = DBConnect.getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, productId);
            rs = ps.executeQuery();

            while (rs.next()) {
                images.add(rs.getString("image"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return images;
    }
    
    public static void win() {
        JFrame frame = new JFrame("Image Display");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(800, 600);
        frame.setLayout(new GridLayout(0, 3)); // Bố cục lưới với 3 cột

        int productId = 1;

        ImageCopyApp imageDAO = new ImageCopyApp();
        List<String> images = imageDAO.loadImagesFromDatabase(productId);

        for (String imageName : images) {
            JLabel imageLabel = new JLabel();
            ImageIcon icon = new ImageIcon("src/main/java/Imgs/" + imageName);
            Image image = icon.getImage().getScaledInstance(200, 200, Image.SCALE_SMOOTH); // Điều chỉnh kích thước ảnh
            imageLabel.setIcon(new ImageIcon(image));
            frame.add(imageLabel);
        }

        frame.setVisible(true);
        frame.setLocationRelativeTo(null);
    }
}

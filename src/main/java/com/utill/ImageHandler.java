package com.utill;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.Part;

public class ImageHandler {
    
    public static String storeImage(Part filePart, String path, int uid) {
        try {
            // Validate input
            if (filePart == null || path == null || path.isEmpty()) {
                throw new IllegalArgumentException("File part or path cannot be null or empty");
            }
            
            path = CommonUtill.properties.getProperty("webAppDir") + path;
            
            String fileName = filePart.getSubmittedFileName();
            if (fileName == null || fileName.isEmpty()) {
                return null;
            }
            
            // Create directory if it doesn't exist
            File uploadDir = new File(path);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }
            
            // Generate a unique file name to prevent duplicates
            String fileExtension = fileName.substring(fileName.lastIndexOf("."));
            String newFileName = "user_" + uid + "_" + System.currentTimeMillis() + fileExtension;
            
            // Save the file
            String filePath = path + File.separator + newFileName;
            
            // Save the file using try-with-resources
            try (FileOutputStream fos = new FileOutputStream(filePath);
                 InputStream is = filePart.getInputStream()) {
                
                byte[] buffer = new byte[8192]; // Larger buffer for better performance
                int bytesRead;
                while ((bytesRead = is.read(buffer)) != -1) {
                    fos.write(buffer, 0, bytesRead);
                }
            }
            
            return newFileName;
            
        } catch (IOException e) {
            System.err.println("Error saving the file: " + e.getMessage());
            e.printStackTrace();
            return null;
        } catch (Exception e) {
            System.err.println("Unexpected error: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }
    
    // method to delete previous images
    public static boolean deleteImage(String path, String fileName) {
        if (path == null || fileName == null || path.isEmpty() || fileName.isEmpty()) {
            return false;
        }
        
        path = CommonUtill.properties.getProperty("webAppDir") + path;
        
        File fileToDelete = new File(path + File.separator + fileName);
        return fileToDelete.exists() && fileToDelete.delete();
    }
}

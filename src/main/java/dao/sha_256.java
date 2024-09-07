package dao;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.nio.charset.StandardCharsets;
import java.math.BigInteger;

public class sha_256 {

    public static String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hashedBytes = md.digest(password.getBytes(StandardCharsets.UTF_8));   
            BigInteger number = new BigInteger(1, hashedBytes);
            StringBuilder hexString = new StringBuilder(number.toString(16));
            while (hexString.length() < 64) {
                hexString.insert(0, '0');
            }
            return hexString.toString();

        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("Error: " + e.getMessage());
        }
    }

    public static void main(String[] args) {
        String password = "123";
        String password2 = "123";
        String hashedPassword = hashPassword(password);
        String hashedPassword2 = hashPassword(password2);
        System.out.println("Hashed Password: " + hashedPassword);
        System.out.println("Hashed Password: " + hashedPassword2);
    }
}


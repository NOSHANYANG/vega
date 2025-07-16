package util;

public class HexUtil {
    public static String byteToHex(byte[] bytes){
        StringBuilder sb = new StringBuilder();
        for (byte b : bytes){
            sb.append(String.format("%02x", b));
        }
        return sb.toString();
    }
}

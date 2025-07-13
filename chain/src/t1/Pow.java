package t1;

import java.security.MessageDigest;

/**
 * 实践 POW， 编写程序（编程语言不限）用自己的昵称 + nonce，不断修改nonce 进行 sha256 Hash 运算：
 * 直到满足 4 个 0 开头的哈希值，打印出花费的时间、Hash 的内容及Hash值。
 * 再次运算直到满足 5 个 0 开头的哈希值，打印出花费的时间、Hash 的内容及Hash值。
 */
public class Pow {
    public static void main(String[] args) throws Exception{
        exec("0000");
        exec("00000");
    }

    public static void exec(String endCondition) throws Exception{
        long nonce = 0L;
        String name = "Jerry";
        long start = System.currentTimeMillis();
        String value;
        String input;
        int count = 0;
        while (true){
            input = name + nonce;
            value = hash(input);
            count++;
            if (value.startsWith(endCondition)){
                break;
            }
            nonce++;
        }
        long end = System.currentTimeMillis();
        //单位秒
        System.out.println("第一次命中:"+((end - start) / 1000));
        System.out.println("hash值:"+input);
        System.out.println("hash内容:"+value);
        System.out.println("hash次数:"+count);
    }

    public static String hash(String input) throws Exception{
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        byte[] hashBytes = md.digest(input.getBytes());
        StringBuilder hexString = new StringBuilder();
        for (byte b : hashBytes){
            String hex = Integer.toHexString(0xff&b);
            if (hex.length() == 1){
                hexString.append('0');
            }
            hexString.append(hex);
        }
        return hexString.toString();
    }
}

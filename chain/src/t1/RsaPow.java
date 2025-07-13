package t1;

import java.security.*;

public class RsaPow {
    public static void main(String[] args) throws Exception{
        exec("0000");
    }

    public static KeyPair generateKeyPair()throws Exception{
        KeyPairGenerator rsa = KeyPairGenerator.getInstance("RSA");
        rsa.initialize(2048);
        return rsa.generateKeyPair();
    }

    public static void exec(String endCondition) throws Exception{
        KeyPair keyPair = generateKeyPair();
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

        String sign = sign(input, keyPair.getPrivate());
        System.out.println("私钥签名结果:"+sign);
        boolean verify = verify(sign, keyPair.getPublic());
        System.out.println("公钥验证结果:"+verify);
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

    public static String sign(String input, PrivateKey privateKey) throws Exception{
        Signature signature = Signature.getInstance("SHA256withRSA");
        signature.initSign(privateKey);
        signature.update(input.getBytes());
        byte[] sign = signature.sign();
        return new String(sign);
    }

    public static boolean verify(String sign,PublicKey publicKey)throws Exception{
        Signature signature = Signature.getInstance("SHA256withRSA");
        signature.initVerify(publicKey);
        signature.update(sign.getBytes());
        return signature.verify(sign.getBytes());
    }
}

package util;

import java.nio.charset.StandardCharsets;
import java.security.*;

public class RsaUtil {
    public static KeyPair generateRsaKeyPair() throws Exception{
        KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance("RSA");
        keyPairGenerator.initialize(2048);
        return keyPairGenerator.generateKeyPair();
    }

    public static byte[] sing(String data, PrivateKey privateKey) throws Exception{
        Signature signature = Signature.getInstance("SHA256withRSA");
        signature.initSign(privateKey);
        signature.update(data.getBytes(StandardCharsets.UTF_8));
        return signature.sign();
    }

    public static boolean verify(String data, byte[] signatureBytes, PublicKey publicKey) throws Exception{
        Signature signature = Signature.getInstance("SHA256withRSA");
        signature.initVerify(publicKey);
        signature.update(data.getBytes(StandardCharsets.UTF_8));
        return  signature.verify(signatureBytes);
    }
}

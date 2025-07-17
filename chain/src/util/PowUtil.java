package util;

import t1.ProofOfWorkResult;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;

public class PowUtil {
    public static ProofOfWorkResult findProofOfWork(String nickName, int zeroCount) throws Exception{
        String prefix = new String(new char[zeroCount]).replace('\0', '0');
        long nonce = 0;
        String content;
        String hash;
        MessageDigest digest = MessageDigest.getInstance("SHA-256");

        while (true){
            content = nickName + nonce;
            byte[] hashBytes = digest.digest(content.getBytes(StandardCharsets.UTF_8));
            hash = HexUtil.byteToHex(hashBytes);
            if (hash.startsWith(prefix)){
                return new ProofOfWorkResult(content,hash,nonce);
            }
            nonce++;
            if (nonce % 100000 == 0){
                System.out.println("已尝试"+nonce+"次...");
            }
        }
    }

    public static String hash256(String content) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] bytes = digest.digest(content.getBytes(StandardCharsets.UTF_8));
            return HexUtil.byteToHex(bytes);
        }catch (Exception e){
            throw new RuntimeException(e);
        }
    }
}

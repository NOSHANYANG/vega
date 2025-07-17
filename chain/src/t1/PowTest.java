package t1;

import util.PowUtil;
import util.RsaUtil;

import java.security.KeyPair;

public class PowTest {

    private static final String NICK_NAME = "Jerry";

    public static void main(String[] args) throws Exception {
        KeyPair keyPair = RsaUtil.generateRsaKeyPair();

        ProofOfWorkResult proofOfWork = PowUtil.findProofOfWork(NICK_NAME, 4);

        byte[] sign = RsaUtil.sign(proofOfWork.getContent(), keyPair.getPrivate());

        boolean verify = RsaUtil.verify(proofOfWork.getContent(), sign, keyPair.getPublic());

        System.out.println("公钥验证结果:"+verify);
    }
}

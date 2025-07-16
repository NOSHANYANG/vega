package t1;

import util.PowUtil;

public class RsaTest {

    private static final String NICK_NAME = "Jerry";
    public static void main(String[] args) throws Exception{
        System.out.println("寻找满足4个0开头的hash值");
        ProofOfWorkResult proofOfWork4 = PowUtil.findProofOfWork(NICK_NAME, 4);
        System.out.println("找到满足4个0开头的哈希值:");
        System.out.println("hash内容:"+proofOfWork4.getContent());
        System.out.println("hash值:"+proofOfWork4.getHash());

        System.out.println("寻找满足5个0开头的hash值");
        ProofOfWorkResult proofOfWork5 = PowUtil.findProofOfWork(NICK_NAME, 5);
        System.out.println("找到满足5个0开头的哈希值:");
        System.out.println("hash内容:"+proofOfWork5.getContent());
        System.out.println("hash值:"+proofOfWork5.getHash());
    }


}

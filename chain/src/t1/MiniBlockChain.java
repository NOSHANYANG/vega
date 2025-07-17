package t1;

import lombok.Getter;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Getter
public class MiniBlockChain {
    private List<Block> chain;

    public MiniBlockChain() {
        this.chain = new ArrayList<Block>();
        this.chain.add(initGenesisBlock());
    }

    private Block initGenesisBlock() {
        return new Block(0
                , System.currentTimeMillis()
                , new ArrayList<Transaction>(){{add(Transaction.getGenesisBlock());}}
                , "0");
    }

    public void addBlock(Block newBlock) {
        newBlock.setPreviousHash(getLatestBlock().getHash());
        newBlock.pow(4);
        chain.add(newBlock);
    }

    private Block getLatestBlock() {
        return chain.get(chain.size() - 1);
    }

    public void isChainValid(){
        for (int i = 1; i < getChain().size(); i++) {
            Block currentBlock = getChain().get(i);
            Block prevBlock = getChain().get(i - 1);

            if (!currentBlock.getHash().equals(currentBlock.calcHash())) {
                System.out.println("当前位置区块不合法:"+i);
                break;
            }

            if (!currentBlock.getPreviousHash().equals(prevBlock.getHash())){
                System.out.println("当前位置区块与前一个区块哈希不匹配:"+i);
                break;
            }
        }
        System.out.println("当前区块链有效");
    }

    public void printChain(){
        this.chain.forEach(System.out::println);
    }

    public static List<Transaction> getRandomTransaction(){
       return Stream.generate(Transaction::randomTransaction)
                .limit(10)
                .collect(Collectors.toList());
    }

    public static void main(String[] args) {
        MiniBlockChain miniBlockChain = new MiniBlockChain();

        for (int i = 0; i < 10; i ++){
            System.out.println("开始挖第"+(miniBlockChain.getChain().size()+1)+"个区块");
            miniBlockChain.addBlock(
                    new Block(miniBlockChain.getChain().size()+1
                            ,System.currentTimeMillis()
                            ,getRandomTransaction()
                            ,"0")
            );
        }
        miniBlockChain.isChainValid();
        miniBlockChain.printChain();

    }
}

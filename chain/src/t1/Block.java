package t1;

import lombok.Data;
import util.PowUtil;
import util.RsaUtil;

import java.util.List;
import java.util.stream.Collectors;

@Data
public class Block {
    private long index;
    private long timestamp;
    private List<Transaction> transactions;
    private long proof;
    private String previousHash;
    private String hash;

    public Block(int index, long timestamp, List<Transaction> transactions, String previousHash) {
        this.index = index;
        this.timestamp = timestamp;
        this.transactions = transactions;
        this.previousHash = previousHash;
        this.hash = calcHash();
    }

    public String calcHash() {
        String transContent = transactions.stream().map(Transaction::toString).collect(Collectors.joining(","));
        String data = index + Long.toString(timestamp) + transContent + previousHash + proof;
        return PowUtil.hash256(data);
    }

    public void pow(int difficulty) {
        String target = new String(new char[difficulty]).replace("\0", "0");
        while (!this.hash.startsWith(target)){
            this.proof++;
            this.hash = calcHash();
        }
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();

        sb.append("==================== Block ").append(index).append(" ====================\n");
        sb.append(String.format("%-12s: %d\n", "Index", index));
        sb.append(String.format("%-12s: %d\n", "Timestamp", timestamp));

        sb.append("Transactions:\n");
        if (transactions.isEmpty()) {
            sb.append("  (no transactions)\n");
        } else {
            for (Transaction tx : transactions) {
                sb.append("  ").append(tx.getSender()).append(" -> ").append(tx.getRecipient())
                        .append(": ").append(tx.getAmount()).append("\n");
            }
        }

        sb.append(String.format("%-12s: %d\n", "Proof", proof));
        sb.append(String.format("%-12s: %s\n", "PreviousHash", previousHash));
        sb.append(String.format("%-12s: %s\n", "Hash", hash));
        sb.append("-------------------------------------------------\n");

        return sb.toString();
    }
}

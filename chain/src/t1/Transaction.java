package t1;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.Arrays;
import java.util.List;
import java.util.Random;

@Data
@AllArgsConstructor
public class Transaction {
    private String sender;
    private String recipient;
    private long amount;
    private static final List<String> USERS = Arrays.asList(
            "Alice", "Bob", "Charlie", "David", "Eve", "Frank"
    );
    private static final Random RANDOM = new Random();

    public static Transaction getGenesisBlock(){
        return new Transaction("jerry","jerry",0);
    }

    public static Transaction randomTransaction(){
        String sender = USERS.get(new Random().nextInt(USERS.size()));
        String recipient = USERS.get(RANDOM.nextInt(USERS.size()));
        long amount = RANDOM.nextInt(1000) + 1;
        return new Transaction(sender, recipient, amount);
    }
}

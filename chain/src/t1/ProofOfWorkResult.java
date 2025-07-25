package t1;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ProofOfWorkResult {
    private String content;
    private String hash;
    private long nonce;
}

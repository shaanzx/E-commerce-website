package lk.ijse.ecommerce.tm;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class CustomerTM {
    private String id;
    private String name;
    private String address;
    private String email;
    private String contact;
    private String image; // Store Base64-encoded image as a String
}
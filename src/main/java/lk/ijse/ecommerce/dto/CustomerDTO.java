package lk.ijse.ecommerce.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class CustomerDTO {
    private String userId;
    private String username;
    private String address;
    private String email;
    private String telephone;
    private String password;
    private byte[] image;
}

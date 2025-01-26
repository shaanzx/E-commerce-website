package lk.ijse.ecommerce.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class CategoryDTO {
    private String id;
    private String name;
    private String description;
}

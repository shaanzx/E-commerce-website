    package lk.ijse.ecommerce.dto;

    import lombok.AllArgsConstructor;
    import lombok.Data;
    import lombok.NoArgsConstructor;

    @NoArgsConstructor
    @AllArgsConstructor
    @Data
    public class ProductDTO {
        private String id;
        private String name;
        private Double unitPrice;
        private int quantity;
        private String category;
        private byte[] image; // Change the image type to byte[]
    }
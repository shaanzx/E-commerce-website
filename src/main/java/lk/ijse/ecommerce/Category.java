package lk.ijse.ecommerce;

public class Category {
    private String categoryCode;
    private String categoryName;
    private String description;
    private String imageUrl;

    public Category(String categoryCode, String categoryName, String description, String imageUrl) {
        this.categoryCode = categoryCode;
        this.categoryName = categoryName;
        this.description = description;
        this.imageUrl = imageUrl;
    }

    // Getters and Setters
    public String getCategoryCode() {
        return categoryCode;
    }

    public void setCategoryCode(String categoryCode) {
        this.categoryCode = categoryCode;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }
}
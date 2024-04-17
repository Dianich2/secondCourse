package by.belstu.lab13.Repository.dbconstants;

public enum UserTableConstants {
    ID("id"),
    USERNAME("username"),
    PASSWORD("password"),
    ROLE("role");
    private String fieldName;
    private UserTableConstants(String fieldName) {
        this.fieldName = fieldName;
    }
    public String getFieldName() {
        return fieldName;
    }

}

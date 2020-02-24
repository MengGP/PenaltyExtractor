package penaltyextractor.dao;

// Класс представляющий водителя
public class Driver {

    private long id;
    private String fullName;

    public Driver(long id, String fullName) {
        this.id = id;
        this.fullName = fullName;
    } // end_construcrot

    // --- getters and setters
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }
    // --- end_getters_and_setters


} // end_class

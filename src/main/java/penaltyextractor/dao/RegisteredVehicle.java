package penaltyextractor.dao;

// Класс представляющий зарегистрированный автомобиль - имеющий гос номер и владельца
public class RegisteredVehicle {

    private long id;
    private String vehicleRegNumber;
    private long vehicleId;
    private long driverId;

    public RegisteredVehicle(long id, String vehicleRegNumber, long vehicleId, long driverId) {
        this.id = id;
        this.vehicleRegNumber = vehicleRegNumber;
        this.vehicleId = vehicleId;
        this.driverId = driverId;
    } // end_condtructor

    // --- getters and setters
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getVehicleRegNumber() {
        return vehicleRegNumber;
    }

    public void setVehicleRegNumber(String vehicleRegNumber) {
        this.vehicleRegNumber = vehicleRegNumber;
    }

    public long getVehicleId() {
        return vehicleId;
    }

    public void setVehicleId(long vehicleId) {
        this.vehicleId = vehicleId;
    }

    public long getDriverId() {
        return driverId;
    }

    public void setDriverId(long driverId) {
        this.driverId = driverId;
    }
    // --- end_getters_and_setters

} // end_class

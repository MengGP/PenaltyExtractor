package penaltyextractor.dao;

// Класс представляет запись о выданном штрафе
public class Penalty {

    private String date;
    private String driverName;
    private String vehicleRegNumber;
    private String vehicleMark;
    private String vehicleModel;
    private String penaltyClause;
    private int penaltyCost;

    public Penalty(String date, String driverName, String vehicleRegNumber, String vehicleMark, String vehicleModel, String penaltyClause, int penaltyCost) {
        this.date = date;
        this.driverName = driverName;
        this.vehicleRegNumber = vehicleRegNumber;
        this.vehicleMark = vehicleMark;
        this.vehicleModel = vehicleModel;
        this.penaltyClause = penaltyClause;
        this.penaltyCost = penaltyCost;
    } // end_constructor

    // --- setters and getters
    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getDriverName() {
        return driverName;
    }

    public void setDriverName(String driverName) {
        this.driverName = driverName;
    }

    public String getVehicleRegNumber() {
        return vehicleRegNumber;
    }

    public void setVehicleRegNumber(String vehicleRegNumber) {
        this.vehicleRegNumber = vehicleRegNumber;
    }

    public String getVehicleMark() {
        return vehicleMark;
    }

    public void setVehicleMark(String vehicleMark) {
        this.vehicleMark = vehicleMark;
    }

    public String getVehicleModel() {
        return vehicleModel;
    }

    public void setVehicleModel(String vehicleModel) {
        this.vehicleModel = vehicleModel;
    }

    public String getPenaltyClause() {
        return penaltyClause;
    }

    public void setPenaltyClause(String penaltyClause) {
        this.penaltyClause = penaltyClause;
    }

    public int getPenaltyCost() {
        return penaltyCost;
    }

    public void setPenaltyCost(int penaltyCost) {
        this.penaltyCost = penaltyCost;
    }
    // --- end_setters_and_getters


    @Override
    public String toString() {
        return getDate()
                + getDriverName()
                + getVehicleRegNumber()
                + getVehicleMark()
                + getVehicleModel()
                + getPenaltyClause()
                + getPenaltyCost();
    }
} // end_class

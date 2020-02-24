package penaltyextractor.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class dbHelperSpringJDBC {

    @Autowired
    JdbcTemplate jdbcTemplate;

    // получаем список всех водителей
    public List<Driver> readAllDrivers() {
        List<Driver> allDrivers = jdbcTemplate.query(
                "SELECT * FROM DRIVERS",
                new RowMapper<Driver>() {
                    @Override
                    public Driver mapRow(ResultSet rs, int rowNum) throws SQLException {
                        return new Driver(
                                rs.getLong("id"),
                                rs.getString("full_name")
                        );
                    }
                }

        );

        return allDrivers;
    }  // end_method

    // получем список всех зарегистрированный автомобилей
    public List<RegisteredVehicle> readAllRegisteredVehicles() {
        List<RegisteredVehicle> allRegisteredVehicles = jdbcTemplate.query(
                "SELECT * FROM REGISTERED_VEHICLES",
                new RowMapper<RegisteredVehicle>() {
                    @Override
                    public RegisteredVehicle mapRow(ResultSet rs, int rowNum) throws SQLException {
                        return new RegisteredVehicle(
                                rs.getLong("id"),
                                rs.getString("vehicles_reg_number"),
                                rs.getLong("vehicle_id"),
                                rs.getLong("driver_id")
                        );
                    }
                }
        );

        return allRegisteredVehicles;
    } // end_method

    // получаем список зарегистрированных автомобилей принадлежащих одному водителю
    public List<RegisteredVehicle> readRegisteredVehiclesFilterByDriver(String driverFullName) {
        String sqlQuery = "SELECT * FROM REGISTERED_VEHICLES "
                + "where driver_id IN "
                + "(SELECT id FROM DRIVERS "
                + "where FULL_NAME =? )";
        List<RegisteredVehicle> registeredVehiclesFilterByDriver = jdbcTemplate.query(
                sqlQuery,
                new RowMapper<RegisteredVehicle>() {
                    @Override
                    public RegisteredVehicle mapRow(ResultSet rs, int rowNum) throws SQLException {
                        return new RegisteredVehicle(
                                rs.getLong("id"),
                                rs.getString("vehicles_reg_number"),
                                rs.getLong("vehicle_id"),
                                rs.getLong("driver_id")
                        );
                    }
                },
                driverFullName
        );

        return registeredVehiclesFilterByDriver;
    } // end_method

} // end_class

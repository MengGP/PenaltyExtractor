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
                "SELECT * FROM DRIVERS " +
                "order by full_name",
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

    // получаем список штрафов по гос номеру
    public List<Penalty> readPenaltiesByRegNumber(String vehicleRegNumber) {
        String sqlQuery = "SELECT date, full_name, vehicles_reg_number,mark, model, clause, cost FROM " +
                    "(SELECT * FROM ISSUED_PENALTIES where REGISTERED_VEHICLE_ID IN " +
                        "(SELECT id FROM REGISTERED_VEHICLES where VEHICLES_REG_NUMBER   =? ) " +
		            ") as filtered_penalties, " +
                    "registered_vehicles, " +
                    "PENALTY_CATALOG, " +
                    "DRIVERS, " +
                    "vehicles " +
                "WHERE " +
                    "filtered_penalties.registered_vehicle_id = registered_vehicles.id AND " +
                    "filtered_penalties.PENALTY_ID = PENALTY_CATALOG.id AND " +
                    "DRIVERS.id IN (SELECT driver_id FROM REGISTERED_VEHICLES where id = filtered_penalties.registered_vehicle_id) AND " +
                    "VEHICLES.id IN (SELECT vehicle_id FROM REGISTERED_VEHICLES where id = filtered_penalties.registered_vehicle_id) " +
                "order by date desc; ";

        List<Penalty> penaltiesByRegNum = jdbcTemplate.query(
                sqlQuery,
                new RowMapper<Penalty>() {
                    @Override
                    public Penalty mapRow(ResultSet rs, int rowNum) throws SQLException {
                        return new Penalty(
                                rs.getString("date"),
                                rs.getString("full_name"),
                                rs.getString("vehicles_reg_number"),
                                rs.getString("mark"),
                                rs.getString("model"),
                                rs.getString("clause"),
                                rs.getInt("cost")
                        );
                    }
                },
                vehicleRegNumber
        );

        return penaltiesByRegNum;
    } // end_method

    // получаем список штрафов по водителю
    public List<Penalty> readPenaltiesByDriver(String driverFullName) {
        String sqlQuery = "SELECT date, full_name, vehicles_reg_number,mark, model, clause, cost FROM "+
                    "(SELECT * FROM ISSUED_PENALTIES where REGISTERED_VEHICLE_ID IN " +
                        "(SELECT id FROM REGISTERED_VEHICLES where driver_id IN " +
                            "(SELECT id FROM DRIVERS where FULL_NAME =? ) " +
                        ") " +
		            " ) as filtered_penalties, " +
                    "registered_vehicles, " +
                    "PENALTY_CATALOG, " +
                    "DRIVERS, "+
                    "vehicles "+
                "WHERE " +
                    "filtered_penalties.registered_vehicle_id = registered_vehicles.id AND " +
                    "filtered_penalties.PENALTY_ID = PENALTY_CATALOG.id AND " +
                    "DRIVERS.id IN (SELECT driver_id FROM REGISTERED_VEHICLES where id = filtered_penalties.registered_vehicle_id) AND " +
                    "VEHICLES.id IN (SELECT vehicle_id FROM REGISTERED_VEHICLES where id = filtered_penalties.registered_vehicle_id)" +
                "order by date desc;";

        List<Penalty> penaltiesByDriver = jdbcTemplate.query(
                sqlQuery,
                new RowMapper<Penalty>() {
                    @Override
                    public Penalty mapRow(ResultSet rs, int rowNum) throws SQLException {
                        return new Penalty(
                                rs.getString("date"),
                                rs.getString("full_name"),
                                rs.getString("vehicles_reg_number"),
                                rs.getString("mark"),
                                rs.getString("model"),
                                rs.getString("clause"),
                                rs.getInt("cost")
                        );
                    }
                },
                driverFullName
        );

        return penaltiesByDriver;
    }

} // end_class

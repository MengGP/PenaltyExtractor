package penaltyextractor.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import penaltyextractor.dao.Driver;
import penaltyextractor.dao.RegisteredVehicle;
import penaltyextractor.dao.dbHelperSpringJDBC;

import java.util.ArrayList;

@Controller
public class ActionPage {

    @Autowired
    dbHelperSpringJDBC dbHelperSpringJDBC;

    @RequestMapping("/")
    public String index(Model model) {
        actionPageGenerate(null, model);
        return "actionPage";
    }

    @RequestMapping("/actionPage")
    public String actionPageGenerate(
            @RequestParam(value = "driverForFilter", required = false) String driverForFilter,
            Model model) {

        // тестовый блок
        String tString = "It's a string ";
        String[] optionList = {
            "1 option 1", "11 option 2", "111 option 3", "2 option 4", "22 option 5", "3 option 6"
        };
        model.addAttribute("optionList", optionList);
        model.addAttribute("tString", tString);
        // ---

        // Получаем список водителей и передаем в список на форму
        ArrayList<Driver> drivers = (ArrayList<Driver>) dbHelperSpringJDBC.readAllDrivers();
        String[] optListDrivers = new String[ drivers.size() ];
        for (int i=0; i<drivers.size(); i++) {
            optListDrivers[i] = drivers.get(i).getFullName();
        }
        model.addAttribute("optListDrivers", optListDrivers);

        if ( driverForFilter == null ) {
            // Получаем список гос.номеров и передаем в список на форму
            ArrayList<RegisteredVehicle> registeredVehicles =
                    (ArrayList<RegisteredVehicle>) dbHelperSpringJDBC.readAllRegisteredVehicles();
            String[] optListRegNum = new String[registeredVehicles.size()];
            for (int i = 0; i < registeredVehicles.size(); i++) {
                optListRegNum[i] = registeredVehicles.get(i).getVehicleRegNumber();
            }
            model.addAttribute("optListRegNum", optListRegNum);
        } else {
            // Получаем список гос.номеров - автомобилей одного видителя - и передаем в список на форму
            ArrayList<RegisteredVehicle> registeredVehicles =
                    (ArrayList<RegisteredVehicle>) dbHelperSpringJDBC.readRegisteredVehiclesFilterByDriver(driverForFilter);
            String[] optListRegNum = new String[registeredVehicles.size()];
            for (int i = 0; i < registeredVehicles.size(); i++) {
                optListRegNum[i] = registeredVehicles.get(i).getVehicleRegNumber();
            }
            model.addAttribute("retDriverForFilter", driverForFilter);
            model.addAttribute("optListRegNum", optListRegNum);
        }

        return "actionPage";
    } // end_method

    @RequestMapping("/cleanActionPage")
    public String cleanActionPage(Model model) {
        actionPageGenerate(null, model);
        return "actionPage";
    }


} // end_class

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

/*
    Контроллер
        отвечающий за работы со страниццей запроса информации
 */
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

        // Получаем список водителей и передаем в список на форму
        ArrayList<Driver> drivers = (ArrayList<Driver>) dbHelperSpringJDBC.readAllDrivers();
        String[] optListDrivers = new String[ drivers.size() ];
        for (int i=0; i<drivers.size(); i++) {
            optListDrivers[i] = drivers.get(i).getFullName();
        }
        model.addAttribute("optListDrivers", optListDrivers);

        ArrayList<RegisteredVehicle> registeredVehicles;
        // Проверяем - если не задан водитель для фильтрации авто, выводим полный список, иначе фильтруем
        if (driverForFilter == null) driverForFilter="";
        if ( driverForFilter.length() == 0) {
            // Получаем список гос.номеров и передаем в список на форму
            registeredVehicles = (ArrayList<RegisteredVehicle>) dbHelperSpringJDBC.readAllRegisteredVehicles();
            }
        else {
            // Получаем список гос.номеров - автомобилей одного видителя - и передаем в список на форму
            registeredVehicles = (ArrayList<RegisteredVehicle>) dbHelperSpringJDBC.readRegisteredVehiclesFilterByDriver(driverForFilter);
            model.addAttribute("retDriverForFilter", driverForFilter);
        }

        String[] optListRegNum = new String[registeredVehicles.size()];
        for (int i = 0; i < registeredVehicles.size(); i++) {
            optListRegNum[i] = registeredVehicles.get(i).getVehicleRegNumber();
        }

        model.addAttribute("optListRegNum", optListRegNum);

        return "actionPage";
    } // end_method

    @RequestMapping("/cleanActionPage")
    public String cleanActionPage(Model model) {
        actionPageGenerate(null, model);
        return "actionPage";
    }


} // end_class

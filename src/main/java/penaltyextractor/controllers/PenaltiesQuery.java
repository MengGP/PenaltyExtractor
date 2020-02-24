package penaltyextractor.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import penaltyextractor.dao.Penalty;
import penaltyextractor.dao.TopPenalty;

import java.util.ArrayList;

/*
    Контроллер
        отвечает за выдачу информации по штрафам
 */
@Controller
public class PenaltiesQuery {

    @Autowired
    penaltyextractor.dao.dbHelperSpringJDBC dbHelperSpringJDBC;

    @RequestMapping("/penaltiesPage")
    public String penaltiesPageGenerate(
            @RequestParam(value = "driverForPenaltyQuery", required = false) String driverForPenaltyQuery,
            @RequestParam(value = "regNumForPenaltyQuery", required = false) String regNumForPenaltyQuery,
            Model model) {

        // если параметры поиска не заданы
        if ( (driverForPenaltyQuery.length() == 0) && (regNumForPenaltyQuery.length() == 0) )
            return "emptyResultPage";

        ArrayList<Penalty> penalties;

        // если задан гос номер автомобиля - ищем по автомобилю
        // иначе ищем по водителю
        if ( regNumForPenaltyQuery.length() > 0 ) {
            penalties = (ArrayList<Penalty>) dbHelperSpringJDBC.readPenaltiesByRegNumber(regNumForPenaltyQuery);
            model.addAttribute("regNumForPenaltyQuery", regNumForPenaltyQuery);
        }
        else {
            penalties = (ArrayList<Penalty>) dbHelperSpringJDBC.readPenaltiesByDriver(driverForPenaltyQuery);
            model.addAttribute("driverForPenaltyQuery", driverForPenaltyQuery);
        }

        // если результат запроса пустой - значит неверно задано условие
        if ( penalties.size() == 0 )
            return "emptyResultPage";

        model.addAttribute("penalties", penalties);

        return "penaltiesPage";
    } // end_method

    @RequestMapping("/topPenalties")
    public String topPegaltiesPageGenerate(Model model) {

        ArrayList<TopPenalty> topPenalties
                = (ArrayList<TopPenalty>) dbHelperSpringJDBC.readTopPenalties(5);
        model.addAttribute("topPenalties", topPenalties);

        return "topPenaltiesPage";
    } // end_method


} // end_class

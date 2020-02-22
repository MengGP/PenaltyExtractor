package penaltyextractor.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class StartPage {

    @RequestMapping("/")
    public String index(Model model) {
        startPageData(model);
        return "startPage";
    }

    @RequestMapping("/startPage")
    public String startPageData(Model model) {

        String tString = "It's a string ";

        String[] optionList = {
            "1 option 1",
            "11 option 2",
            "111 option 3",
            "2 option 4",
            "22 option 5",
            "3 option 6"
        };

        for (String iter : optionList) {
            System.out.println( iter );

        }
        System.out.println("");

        model.addAttribute("optionList", optionList);
        model.addAttribute("tString", tString);
        return "startPage";
    } // end_method


} // end_class

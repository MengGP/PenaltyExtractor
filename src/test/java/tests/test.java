package tests;

import org.junit.Test;

public class test {

    @Test
    public void penalyIssueGenerator() {

        // генерируем штрафы в sout
        for (int i=0; i<200; i++) {
            String str = "INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (";
            int tmp;
            str = str + i + ",";                                // добавляем id
            str = str + (int)((Math.random()*12)-1) + ",";      // добавляем penalty_id
            str = str + (int)((Math.random()*21)-1) + ",";      // добавляем registered_vehicle_id
            tmp = (int)((Math.random()*28)+1);
            str = str + "'2020-02-" + (tmp < 10 ? "0"+tmp : tmp) + " ";   // день
            tmp = (int)(Math.random()*24);
            str = str + (tmp < 10 ? "0"+tmp : tmp) + ":";   // час
            tmp = (int)(Math.random()*60);
            str = str + (tmp < 10 ? "0"+tmp : tmp) + ":";   // минута
            tmp = (int)(Math.random()*60);
            str = str + (tmp < 10 ? "0"+tmp : tmp) + "');";   // минута
            System.out.println(str);
        }

        System.out.println("--end--");

    }  // end_method


} // end_class

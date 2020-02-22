package penaltyextractor.boot;

import javafx.application.Application;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.context.annotation.ComponentScan;

import java.util.HashMap;

@SpringBootApplication
@ComponentScan( {
        "penaltyextractor.boot",
        "penaltyextractor.config",
        "penaltyextractor.controllers",
        "penaltyextractor.services"
} )

public class PenaltyExtractorApp{

    public static void main(String[] args) {
        // SpringApplication.run(PenaltyExtractorApp.class, args);

        HashMap<String,Object> props = new HashMap<>();
        props.put("server.port",8077);

        new SpringApplicationBuilder(PenaltyExtractorApp.class)
                .properties(props)
                .run(args);
    } // end_main



} // end_class

package penaltyextractor.boot;

import javafx.application.Application;
import org.flywaydb.core.Flyway;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;

import java.util.HashMap;

@SpringBootApplication
@ComponentScan( {
        "penaltyextractor.boot",
        "penaltyextractor.config",
        "penaltyextractor.controllers",
        "penaltyextractor.services"
} )
@PropertySource("classpath:/application.properties")
public class PenaltyExtractorApp implements CommandLineRunner {

    public static void main(String[] args) {
        // SpringApplication.run(PenaltyExtractorApp.class, args);

        HashMap<String,Object> props = new HashMap<>();
        props.put("server.port",8077);

        new SpringApplicationBuilder(PenaltyExtractorApp.class)
                .properties(props)
                .run(args);
    } // end_main

    @Bean
    public static PropertySourcesPlaceholderConfigurer propertyConfigurer() {
        return new PropertySourcesPlaceholderConfigurer();
    }

    @Override
    public void run(String... args) throws Exception {
        migrateDB();
    } // end_run

    // получем строку подключения к БД из файла properties для Flyway
    @Value("${spring.datasource.url}")
    String dbUrl;

    private void migrateDB() {
        Flyway flyway = Flyway.configure().dataSource(
                dbUrl,
                "sa",
                "")
                .load();
        flyway.migrate();
    }


} // end_class

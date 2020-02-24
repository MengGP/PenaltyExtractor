package penaltyextractor.boot;

import org.flywaydb.core.Flyway;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.PropertySource;
import penaltyextractor.dao.dbHelperSpringJDBC;

/*
    Гланый класс проекта
        - настройка и запуск Spring Boot сервлета
        - первоначальное наполнение БД средствами Flyway
 */

@SpringBootApplication
@ComponentScan( {
        "penaltyextractor.boot",
        "penaltyextractor.config",
        "penaltyextractor.controllers",
        "penaltyextractor.services"
} )
@PropertySource("classpath:/application.properties")
public class PenaltyExtractorApp implements CommandLineRunner {

    // получем строку подключения к БД из файла properties для Flyway
    @Value("${spring.datasource.url}")
    String dbUrl;

    @Bean
    public dbHelperSpringJDBC dbHelperSpringJDBC() {
        return new dbHelperSpringJDBC();
    } // end_bean

    // Запуск Spring Boot Application
    public static void main(String[] args) {
        SpringApplication.run(PenaltyExtractorApp.class, args);
    } // end_main

    // Задачи при старте
    @Override
    public void run(String... args) throws Exception {
        migrateDB();
    } // end_run

    // запуск миграции БД из sql-скрипта средсвами Flyway
    private void migrateDB() {
        Flyway flyway = Flyway.configure().dataSource(
                dbUrl,
                "sa",
                "")
                .load();
        flyway.migrate();
    } // end_method

} // end_class

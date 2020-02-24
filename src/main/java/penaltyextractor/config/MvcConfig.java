package penaltyextractor.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class MvcConfig implements WebMvcConfigurer  {

    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/").setViewName("actionPage");
        registry.addViewController("/actionPage").setViewName("actionPage");
        registry.addViewController("/penaltiesPage").setViewName("penaltiesPage");
        registry.addViewController("/emptyResultPage").setViewName("emptyResultPage");
        registry.addViewController("/topPenaltiesPage").setViewName("topPenalties");
        registry.addViewController("/error").setViewName("error");
    } // end_method

} // end_class

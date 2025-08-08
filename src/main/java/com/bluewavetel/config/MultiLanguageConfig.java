package com.bluewavetel.config;

import java.util.Locale;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

@Configuration
public class MultiLanguageConfig implements WebMvcConfigurer {
	
    /**
     * 메세지 소스를 생성한다.
     */
    // 지정한 시간마다 리소스 파일을 리로드하여 운영 환경에서도 서버 재배포 없이 업데이트된 리소스 파일을 사용할수있게 해주는 클래스
    // 리소스파일의 경로, 리소스파일의 인코딩타입, 리소스를 리로딩할 간격, 대신보여줄언어 4가지는 꼭 설정해야함

    // ReloadableResourceBundleMessageSource 를 사용할 경우
    // messageSource.setCacheSeconds(10); 과 같이 캐시를 등록하고, 파일이 변경되면 알아서 적용되도록 사용할 수
    // 있다.
    @Bean
    public ReloadableResourceBundleMessageSource messageSource() {
        ReloadableResourceBundleMessageSource source = new ReloadableResourceBundleMessageSource();
        // 메세지 프로퍼티파일의 위치와 이름을 지정한다.
        source.setBasename("classpath:/message/message");
        // 기본 인코딩을 지정한다.
        source.setDefaultEncoding("UTF-8");
        // 프로퍼티 파일의 변경을 감지할 시간 간격을 지정한다.
        source.setCacheSeconds(60);
        // 없는 메세지일 경우 예외를 발생시키는 대신 코드를 기본 메세지로 한다.
        source.setUseCodeAsDefaultMessage(true);
        
        return source;
    }

    /**
     * 변경된 언어 정보를 기억할 로케일 리졸버를 생성한다.
     * 여기서는 세션에 저장하는 방식을 사용한다.
     * @return
     */
    @Bean
    public SessionLocaleResolver localeResolver() {
        SessionLocaleResolver SessionLocaleResolver = new SessionLocaleResolver();
        SessionLocaleResolver.setDefaultLocale(Locale.KOREA);
        return new SessionLocaleResolver();
    }

    /**
     * 언어 변경을 위한 인터셉터를 생성한다.
     */
    @Bean
    public LocaleChangeInterceptor localeChangeInterceptor() {
        LocaleChangeInterceptor interceptor = new LocaleChangeInterceptor();
        interceptor.setParamName("lang");
        return interceptor;
    }

    /**
     * 인터셉터를 등록한다.
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(localeChangeInterceptor());
    }

}

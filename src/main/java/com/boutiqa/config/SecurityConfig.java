package com.boutiqa.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.session.HttpSessionEventPublisher;
import com.boutiqa.auth.UserDetailsServiceImpl;
import com.boutiqa.service.UserService;




@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{

	@Bean
    public UserDetailsService userDetailsService() {
        return new UserDetailsServiceImpl();
    }
	
	@Bean
	public UserService userService() {
		return new UserService();
	}

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    
    @Bean
    public HttpSessionEventPublisher httpSessionEventPublisher() {
        return new HttpSessionEventPublisher();
    }
    
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService()).passwordEncoder(passwordEncoder());
    } 
    
    @Override
    protected void configure(HttpSecurity http) throws Exception {
 
    	http
    	.sessionManagement()
		.sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED)
    	.maximumSessions(1)
    	.expiredUrl("/login?invalid-session=true");
    http
    		
            .formLogin()
                .loginPage("/showLogin")
                .loginProcessingUrl("/login")
                .failureUrl("/login")
                .permitAll()
                .defaultSuccessUrl("/home", true)
            .and()
            .csrf()
            .and()
            .authorizeRequests()
                .antMatchers("/").permitAll()
                .antMatchers("/css/**").permitAll()
                .antMatchers("/images/**").permitAll()
                .antMatchers("/js/**").permitAll()
                .antMatchers("/fonts/**").permitAll()
                .antMatchers("/upload").permitAll()
                .antMatchers(HttpMethod.GET, "/favicon.*").permitAll()
                .antMatchers(HttpMethod.GET, "/home").hasAnyRole("Admin","Consumer", "Seller")
                .antMatchers(HttpMethod.GET, "/login").permitAll()
                .antMatchers(HttpMethod.POST, "/login").permitAll()
                .antMatchers("/forgotPassword").permitAll()
                .antMatchers(HttpMethod.GET, "/recoverPassword").permitAll()
                .antMatchers(HttpMethod.GET, "/showConsumerProfile").hasRole("Consumer")
                .antMatchers(HttpMethod.GET, "/showConsumerAddress").hasRole("Consumer")
                .antMatchers(HttpMethod.GET, "/showConsumerPassword").hasRole("Consumer")
                .antMatchers(HttpMethod.POST, "/showConsumerProfile").hasRole("Consumer")
                .antMatchers(HttpMethod.POST, "/showConsumerAddress").hasRole("Consumer")
                .antMatchers(HttpMethod.POST, "/showConsumerPassword").hasRole("Consumer")
                .antMatchers(HttpMethod.POST, "/updateConsumerProfile").hasRole("Consumer")
                .antMatchers(HttpMethod.POST, "/updatePassword").hasAnyRole("Consumer", "Seller")
                .antMatchers(HttpMethod.GET, "/updatePassword").hasAnyRole("Consumer", "Seller")
                .antMatchers(HttpMethod.GET, "/userAdministration").hasAnyRole("Admin")
                .antMatchers(HttpMethod.POST, "/userAdministration").hasAnyRole("Admin")
                .antMatchers(HttpMethod.POST, "/userSearch").hasAnyRole("Admin")
                .antMatchers(HttpMethod.GET, "/userSearch").hasAnyRole("Admin")
                .antMatchers(HttpMethod.GET, "/userConsumerForm").hasAnyRole("Admin")
                .antMatchers(HttpMethod.POST, "/addConsumer").hasAnyRole("Admin")
                .antMatchers(HttpMethod.GET, "/addSellerForm").hasAnyRole("Admin")
                .antMatchers(HttpMethod.POST, "/addSeller").hasAnyRole("Admin")
                .antMatchers(HttpMethod.GET, "/editConsumer").hasAnyRole("Admin")
                .antMatchers(HttpMethod.GET, "/updateConsumer").hasAnyRole("Admin")
                .antMatchers(HttpMethod.POST, "/updateConsumer").hasAnyRole("Admin")
                .antMatchers(HttpMethod.GET, "/editSellerForm").hasAnyRole("Admin")
                .antMatchers(HttpMethod.GET, "/updateSeller").hasAnyRole("Admin")
                .antMatchers(HttpMethod.POST, "/updateSeller").hasAnyRole("Admin")
                .antMatchers(HttpMethod.GET, "/userSearch").hasAnyRole("Admin")
                .antMatchers(HttpMethod.GET, "/showSellerProfile").hasAnyRole("Seller")
                .antMatchers(HttpMethod.POST, "/showSellerProfile").hasAnyRole("Seller")
                .antMatchers(HttpMethod.GET, "/updateSellerProfile").hasAnyRole("Seller")
                .antMatchers(HttpMethod.POST, "/updateSellerProfile").hasAnyRole("Seller")
                .antMatchers(HttpMethod.GET, "/showSellerProducts").hasAnyRole("Seller")
                .antMatchers(HttpMethod.POST, "/showSellerProducts").hasAnyRole("Seller")
                .antMatchers(HttpMethod.GET, "/addProductForm").hasAnyRole("Seller")
                .antMatchers(HttpMethod.POST, "/addProduct").hasAnyRole("Seller")
                
            .and()
            .logout()
                .logoutSuccessUrl("/")
                .invalidateHttpSession(true);
    }
}

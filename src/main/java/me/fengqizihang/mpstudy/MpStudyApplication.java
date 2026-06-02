package me.fengqizihang.mpstudy;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@MapperScan("me.fengqizihang.mpstudy.mapper")
@SpringBootApplication
public class MpStudyApplication {

    public static void main(String[] args) {
        SpringApplication.run(MpStudyApplication.class, args);
    }

}

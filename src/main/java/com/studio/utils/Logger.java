package com.studio.utils;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
@Aspect
@Component
public class Logger {





        @Pointcut("execution(* com.studio.controller.UserController.*(..))")
        public void myPointCut(){}


        @Around("myPointCut()")
        public Object logging(ProceedingJoinPoint joinPoint) throws Throwable {
            Class<?> clazz = joinPoint.getTarget().getClass();
            org.slf4j.Logger logger = LoggerFactory.getLogger(clazz);
            logger.info("===start===");
            long startTime = System.currentTimeMillis();
            Object obj = joinPoint.proceed();
            long endTime = System.currentTimeMillis();
            logger.error("test error!");
            logger.debug("costTime:[{}ms]", endTime - startTime);
            logger.info("===end===");
            return  obj;
        }
        @Before("myPointCut()")
        public void beforeExecute(JoinPoint jp){
            String methodName = jp.getSignature().getName();
            String className = jp.getTarget().getClass().getName();
            org.slf4j.Logger log = LoggerFactory.getLogger(className);
            log.info("开始执行方法..."+methodName);
        }
        @After("myPointCut()")
        public void afterExecute(JoinPoint jp){
            String methodName = jp.getSignature().getName();
            String className = jp.getTarget().getClass().getName();
            org.slf4j.Logger log = LoggerFactory.getLogger(className);
            log.info("结束执行方法..."+methodName);
        }
    }





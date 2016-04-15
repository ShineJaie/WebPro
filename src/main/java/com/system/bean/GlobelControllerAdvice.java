package com.system.bean;

import org.apache.log4j.Logger;
import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * ע��ʹ��ע�� @ControllerAdvice ��������ȫ�� Controller ��Χ<br/>
 * ��Ӧ�õ����� @RequestMapping ��򷽷��ϵ� @ExceptionHandler, @InitBinder, @ModelAttribute<br/>
 * Created by admin on 2016/4/15.
 */
@ControllerAdvice
public class GlobelControllerAdvice {

    private static final Logger logger = Logger.getLogger(GlobelControllerAdvice.class);
    public static final String DEFAULT_ERROR_VIEW = "/error/500";

    /*@ModelAttribute
    public String author() {
        System.out.println("---> Ӧ�õ����� @RequestMapping ע�ⷽ��������ִ��֮ǰ�ѷ���ֵ���� Model");
        return "ShineJaie";
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        System.out.println("---> Ӧ�õ����� @RequestMapping ע�ⷽ��������ִ��֮ǰ��ʼ�����ݰ���");
    }*/

    @ExceptionHandler(Exception.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public ModelAndView processUnauthenticatedException(HttpServletRequest request, Exception e) throws Exception {
        // System.out.println("---> Ӧ�õ����� @RequestMapping ע��ķ����������׳� Exception �쳣ʱִ��");
        logger.error("---> HttpStatus error: " + e.getMessage());

        // If the exception is annotated with @ResponseStatus rethrow it and let
        // the framework handle it - like the OrderNotFoundException example
        // at the start of this post.
        // AnnotationUtils is a Spring Framework utility class.
        if (AnnotationUtils.findAnnotation(e.getClass(), ResponseStatus.class) != null) {
            throw e;
        }

        // Otherwise setup and send the user to a default error-view.
        ModelAndView mav = new ModelAndView();
        mav.addObject("exception", e);
        mav.addObject("url", request.getRequestURL());
        mav.setViewName(DEFAULT_ERROR_VIEW);
        return mav;
    }

}

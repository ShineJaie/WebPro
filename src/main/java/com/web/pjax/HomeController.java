package com.web.pjax;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller()
public class HomeController
{
	@RequestMapping(value = "/tiles/home", method = RequestMethod.GET)
	public String home()
	{
		return "home";
	}
	
	@RequestMapping(value = "/tiles/lorem_ipsum", method = RequestMethod.GET)
	public String loremIpsum()
	{
		return "lorem_ipsum";
	}
}

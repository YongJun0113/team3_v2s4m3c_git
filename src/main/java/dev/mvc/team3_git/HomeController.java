package dev.mvc.team3_git;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.ebook.EbookProcInter;

/**
 * Handles requests for the application home page.
 */

@Controller
public class HomeController {
  
  /*
  @RequestMapping(value = { "/", "/index.do" }, method = RequestMethod.GET)
  public String home(Locale locale, Model model) {

    return "index"; 
  }
  */
  
  /*
  @RequestMapping(value = { "/", "/index.do" }, method = RequestMethod.GET)
  public ModelAndView latest() {
    ModelAndView mav = new ModelAndView();
    
    mav.setViewName("index");
    return mav;
  }
  */

}

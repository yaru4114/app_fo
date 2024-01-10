package fo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class foController {

	@RequestMapping("/webapp/WEB-INF/fo/")
	public String start() {
		return "fo-main";
	}
}
   
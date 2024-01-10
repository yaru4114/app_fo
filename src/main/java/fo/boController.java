package fo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class boController {

	@RequestMapping("/webapp/WEB-INF/bo/")
	public String start() {
		return "bo-main";
	}
}
 
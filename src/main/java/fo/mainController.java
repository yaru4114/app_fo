package fo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class mainController {

	@RequestMapping("/webapp/WEB-INF/jsp/")
	public String start() {
		return "main";
	}
}
 
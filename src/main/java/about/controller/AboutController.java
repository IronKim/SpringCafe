package about.controller;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Component
@Controller
public class AboutController {

	@GetMapping(value="about/spring")
	public String hollys() {
		return "jsp/about/spring";
	}
}

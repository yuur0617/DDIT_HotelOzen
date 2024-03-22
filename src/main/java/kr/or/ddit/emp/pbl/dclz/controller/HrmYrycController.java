package kr.or.ddit.emp.pbl.dclz.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/emp/hrm/dclz/yryc")
public class HrmYrycController {

	@GetMapping
	public String yrycList() {
		return "emp/hrm/dclz/yrycList";
	}
	
	@GetMapping("vacation")
	public String vacationList() {
		return "emp/hrm/dclz/vacationList";
	}
}

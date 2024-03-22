package kr.or.ddit.emp.crm.cstmr.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.emp.crm.cstmr.service.EmpCRMCstmrService;
import kr.or.ddit.global.common.paging.BootstrapFormBasePaginationRenderer;
import kr.or.ddit.global.common.paging.PaginationInfo;
import kr.or.ddit.global.common.paging.PaginationRenderer;
import kr.or.ddit.global.vo.MberVO;

@Controller
@RequestMapping({"/emp/crm/cstmr", "/emp/crm/cstmr/*"})
public class EmpCRMCstmrRetrieveController {
	
	@Inject
	private EmpCRMCstmrService service;
	
	@GetMapping
	public String cstmrListUI() {
		return "emp/crm/cstmr/cstmrList";
	}
	
	@PostMapping(consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<MberVO> listData(
		@RequestParam(value="page", required = false, defaultValue = "1") int currentPage
	){

		List<MberVO> mberList = service.retrieveMemberList();
		
		return mberList;
	}
	
	@GetMapping(value = "/{cstNo}", produces = MediaType.APPLICATION_JSON_VALUE)
	public MberVO getOne(
		@PathVariable String cstNo
	) {
		return service.retrieveMember(cstNo);
	}
	
}

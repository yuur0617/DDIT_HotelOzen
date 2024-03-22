package kr.or.ddit.cstmr.recom.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.cstmr.recom.service.CstmrIntrcnRecomCarService;
import kr.or.ddit.cstmr.recom.service.CstmrRecomSbrsService;
import kr.or.ddit.global.security.MberUser;
import kr.or.ddit.global.security.MberVOWrapper;
import kr.or.ddit.global.vo.CarVO;
import kr.or.ddit.global.vo.MberVO;
import kr.or.ddit.global.vo.SbrsVO;
import kr.or.ddit.global.vo.ScrapVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/recom")
public class CstmrIntrcnRecomController {

	@Inject
	private CstmrIntrcnRecomCarService service;
	
	@Inject
	private CstmrRecomSbrsService serviceSbrs;

	@GetMapping
	public String getCurrentUser() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		MberVOWrapper principal = (MberVOWrapper) authentication.getPrincipal();
		MberVO realUser = principal.getMberUser();
		if (realUser == null) {
		}
		log.info("현재 로그인 되어 있는 사용자 : {}", realUser.getCstNo());
		String user = realUser.getCstNo();
		return user;
	}

	@GetMapping("recomCar")
	public String recomTrstSpot(Model model, @MberUser MberVO mber, Principal authentication1){
		log.info("현재 로그인한 사용자 : {}", authentication1.getName());
		String realUser = mber.getCstNo();
		List<CarVO> recomCarList = service.retrieveCar(realUser);
		log.info("recomCarList : {}",recomCarList);
		model.addAttribute("recomCarList",recomCarList);
		
//		-----
		ScrapVO checkScrap = new ScrapVO();
		checkScrap.setCstNo(mber.getCstNo());
		
		List<Integer> checkCarList = new ArrayList<>();
		for(CarVO carVO : recomCarList) {
			ScrapVO cstNoCarNo = new ScrapVO();
			cstNoCarNo.setCstNo(mber.getCstNo());
			cstNoCarNo.setScrapNo(carVO.getCarNo());
			
			int checkCar = service.checkCarScrap(cstNoCarNo);
			log.info("checkCarrr : {}", checkCar);
			
			checkCarList.add(checkCar);
		}
		
		model.addAttribute("checkCarList", checkCarList);

		return "cstmr/recom/recomCar";
	}

	@GetMapping("recomSbrs")
	public String recomSbrs(@MberUser MberVO mber, Model model, Principal authentication) {
		log.info("mber {}", mber.getCstNo());
		List<SbrsVO> recomSbrsList = serviceSbrs.retrieveSbrs(mber.getCstNo());
		log.info("recomSbrsList : {} ", recomSbrsList);
		model.addAttribute("recomSbrsList",recomSbrsList);
		
//		-----
		ScrapVO checkScrap = new ScrapVO();
		checkScrap.setCstNo(mber.getCstNo());
		
//		List<String> sbrsCdList = new ArrayList<>();
		List<Integer> checkSbrsList = new ArrayList<>();
		for(SbrsVO sbrsVO : recomSbrsList) {
//			sbrsCdList.add(sbrsVO.getSbrsCd());
			
			ScrapVO cstNoSbrsCd = new ScrapVO();
			cstNoSbrsCd.setCstNo(mber.getCstNo());
			cstNoSbrsCd.setScrapNo(sbrsVO.getSbrsCd());
			
			int checkSbrs = serviceSbrs.checkSbrsScrap(cstNoSbrsCd);
			log.info("checkSbrsss {}", checkSbrs);
			
			checkSbrsList.add(checkSbrs);
			log.info("checkSbrsListtt : {}", checkSbrsList);
		}
		
		model.addAttribute("checkSbrsList",checkSbrsList);
		
		return "cstmr/recom/recomSbrs";
	}
}
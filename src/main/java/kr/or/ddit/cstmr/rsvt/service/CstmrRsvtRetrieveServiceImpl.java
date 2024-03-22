package kr.or.ddit.cstmr.rsvt.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.global.vo.CstmrVO;
import kr.or.ddit.global.vo.MberVO;
import kr.or.ddit.global.vo.RsvtDetailsVO;
import kr.or.ddit.global.vo.RsvtVO;
import kr.or.ddit.global.vo.SetleVO;
import kr.or.ddit.mybatis.mappers.CstmrRsvtRetrieveMapper;
import kr.or.ddit.mybatis.mappers.MberMapper;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CstmrRsvtRetrieveServiceImpl implements CstmrRsvtRetrieveService{

	@Inject
	private CstmrRsvtRetrieveMapper dao;
	
	@Inject
	private MberMapper mdao;
	
	@Override
	public RsvtVO retrieveNberRsvt(CstmrVO cstmrVO) {
		
		return dao.selectNberRsvt(cstmrVO);
	}

	@Override
	public MberVO retrieveMber(String cstNo) {
		return mdao.select(cstNo);
	}

	@Override
	public List<RsvtDetailsVO> retrieveRsvtDetails(String rsvtNo) {
		return dao.selectRsvtDetailsList(rsvtNo);
	}

	@Override
	public List<RsvtVO> retrieveMberRsvt(String cstNo) {
		return dao.selectMberRsvtList(cstNo);
	}

	@Override
	public List<RsvtDetailsVO> retrieveEndRsvtDetails(String rsvtNo) {
		return dao.selectEndRsvtDetailsList(rsvtNo);
	}

	@Override
	public List<RsvtVO> retrieveMberEndRsvt(String cstNo) {
		return dao.selectMberEndRsvtList(cstNo);
	}

	@Override
	public List<RsvtDetailsVO> retrieveCancelRsvtDetails(String rsvtNo) {
		return dao.selectCancelRsvtDetailsList(rsvtNo);
	}

	@Override
	public List<RsvtVO> retrieveMberCancelRsvt(String cstNo) {
		return dao.selectMberCancelRsvtList(cstNo);
	}

	@Override
	public SetleVO retrieveSetle(String setelNo) {
		return dao.selectSetle(setelNo);
	}
	
	
}

package com.bid.fo.member.service;

import com.bid.common.model.BidMemberVO;

import com.bid.common.model.DocVO;
import com.bid.fo.member.dao.BidMemberDAO;
import com.bid.fo.member.model.LoginVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class BidMemberService {

    @Autowired
    BidMemberDAO memberDAO;

    public Map<String,Object> creMember(BidMemberVO vo) {

        Map<String,Object> resultMap = new HashMap<>();
        // 아이디 중복 체크
        if (memberDAO.idDuplicateCheck(vo.getBidMberId()) > 0) {
            // 아이디 중복
            resultMap.put("suceess", false);
            resultMap.put("message", "중복된 아이디 입니다.");
            return resultMap;
        }

        // 회원정보 입력
        memberDAO.creMember(vo);

        // 사업자등록증(업체) 입력

        // doc1 doc2 -> 차후 파라메터로 가져오기
        DocVO doc1 = new DocVO();
        doc1.setDocNo(vo.getBsnmRegistDocNo1());
        doc1.setDocFileNm("");
        doc1.setDocFileCours("");
        doc1.setDocFileRealCours("");
        doc1.setDocFileMg(10);
        doc1.setFrstRegisterId(vo.getBidMberId());
        doc1.setLastChangerId(vo.getBidMberId());
//
//        DocVO doc2 = new DocVO();
//        doc2.setDocNo(vo.getBsnmRegistDocNo2());
//        doc2.setFrstRegisterId(vo.getBidMberId());
//        doc2.setLastChangerId(vo.getBidMberId());
//
        memberDAO.creBsnmResistDoc(doc1);
//        memberDAO.creBsnmResistDoc(doc2);

        resultMap.put("suceess", true);
        resultMap.put("message", "가입 요청이 완료되었습니다. 가입 승인 후 이용 가능합니다.");

        return resultMap;
    }

    public Map<String,Object> login(LoginVO vo) {

        Map<String,Object> resultMap = new HashMap<>();

        BidMemberVO result = memberDAO.login(vo);

        // 회원 가입 승인 상태 판별 (요청 / 거절 / 정상)
        switch (result.getBidConfmSttusCode()) {
            case "01" :
                break;
            case "02" :
                break;
            case "03" :
                break;
        }

        // 회원 상태 판별 (정상 / 차단 / 승인대기)
        switch (result.getBidMberSttusCode()) {
            case "01" :
                break;
            case "02" :
                break;
            case "03" :
                break;
        }

        resultMap.put("result",result);

        return resultMap;
    }
}

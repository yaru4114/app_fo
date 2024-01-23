package com.bid.bo.member.service;

import com.bid.bo.member.dao.BdMemberDAO;
import com.bid.common.model.BidMemberVO;
import com.bid.common.model.DocVO;
import com.bid.common.model.SearchVO;
import com.bid.common.util.AesUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Slf4j
public class BdMemberService {
    @Autowired
    private BdMemberDAO bdMemberDAO;
    public Map<String, Object> getMemberList(SearchVO vo) {
        Map<String, Object> resultMap = new HashMap<>();

        List<BidMemberVO> resultList = bdMemberDAO.getMemberList(vo);

        resultMap.put("result", resultList);
        return resultMap;
    }

    public Map<String, Object> getMemberStatusCnt(SearchVO vo) {
        Map<String, Object> resultMap = new HashMap<>();
        List<String> paramList = vo.getStatusCode();

        for (String data : paramList) {
            int cnt = bdMemberDAO.getMemberStatusCnt(data);
            resultMap.put(data, cnt);
        }

        return resultMap;
    }

    public Map<String, Object> getMemberInfo(BidMemberVO vo) {
        Map<String, Object> resultMap = new HashMap<>();
        List<BidMemberVO> voList = bdMemberDAO.getMemberInfo(vo);

        for (BidMemberVO result :voList) {
            try {
                String decryptPw = AesUtil.decrypt(result.getBidMberSecretNo());
                result.setBidMberSecretNo(decryptPw);
            } catch (Exception e) {
                e.getStackTrace();
            }
        }

        resultMap.put("result", voList);
        return resultMap;
    }

    public Map<String, Object> chgMemberBlock(BidMemberVO vo) {
        Map<String, Object> resultMap = new HashMap<>();

        if (vo.getBidMberSttusCode().equals("정상")) {
            int bddtrCnt = bdMemberDAO.getMemberBddtrCnt(vo);
            if (bddtrCnt == 0) {
                bdMemberDAO.chgMemberBlock(vo);
                resultMap.put("status", "block");
                resultMap.put("success", true);
            } else {
                resultMap.put("success", false);
                resultMap.put("message", "차단이 불가능 합니다.");
            }
        } else {
            bdMemberDAO.chgMemberBlock(vo);
            resultMap.put("status", "release");
            resultMap.put("success", true);
        }

        return resultMap;
    }

    public Map<String, Object>  getApprovalList(SearchVO vo) {
        int totalCnt = bdMemberDAO.getApprovalCnt(vo);
        vo.calPaging(totalCnt);

        Map<String, Object> resultMap = new HashMap<>();

        List<BidMemberVO> resultList = bdMemberDAO.getApprovalList(vo);

        resultMap.put("result", resultList);
        resultMap.put("paging", vo);

        return resultMap;
    }

    public Map<String, Object> searchById(String bidMberId){
        Map<String, Object> resultMap = new HashMap<>();
        BidMemberVO result = bdMemberDAO.searchById(bidMberId);


        // 사업자 등록증 정보
        if (result.getBsnmRegistDocNo1() != -1) {
            DocVO doc1 = bdMemberDAO.getDocInfo(result.getBsnmRegistDocNo1());
            log.info("doc1 : {}", doc1);
            resultMap.put("doc1",doc1);
        }
        if (result.getBsnmRegistDocNo2() != -1) {
            DocVO doc2 = bdMemberDAO.getDocInfo(result.getBsnmRegistDocNo2());
            log.info("doc2 : {}", doc2);
            resultMap.put("doc2",doc2);
        }

        try {
            // 비밀번호 복호화
            result.setBidMberSecretNo(AesUtil.decrypt(result.getBidMberSecretNo()));

            resultMap.put("result",result);
            resultMap.put("success",true);

        } catch (Exception e) {
            e.getStackTrace();
            resultMap.put("success",false);
            resultMap.put("message","복호화 에러");
        }

        return resultMap;
    }

    public Map<String, Object> udtApproval(BidMemberVO vo) {
        Map<String, Object> resultMap = new HashMap<>();

        bdMemberDAO.udtApproval(vo);

        if (vo.getBidConfmSttusCode().equals("03")) {
            resultMap.put("message","승인되었습니다.");
        } else if (vo.getBidConfmSttusCode().equals("02")) {
            resultMap.put("message","가입 거절 처리 되었습니다.");
        }

        resultMap.put("success",true);

        return resultMap;
    }
}

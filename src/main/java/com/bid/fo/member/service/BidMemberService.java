package com.bid.fo.member.service;

import com.bid.common.dao.CommonDAO;
import com.bid.common.model.BidMemberVO;

import com.bid.common.model.DocVO;
import com.bid.common.model.FileVO;
import com.bid.common.util.FileUtil;
import com.bid.fo.member.dao.BidMemberDAO;
import com.bid.fo.member.model.LoginVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BidMemberService {

    @Autowired
    BidMemberDAO memberDAO;

    @Autowired
    CommonDAO commonDAO;

    @Autowired
    FileUtil fileUtil;

    public Map<String,Object> creMember(BidMemberVO vo, List<MultipartFile> fileList, HttpSession session) {

        Map<String,Object> resultMap = new HashMap<>();
        // 아이디 중복 체크
        if (memberDAO.idDuplicateCheck(vo.getBidMberId()) > 0) {
            // 아이디 중복
            resultMap.put("success", false);
            resultMap.put("message", "중복된 아이디 입니다.");
            return resultMap;
        }

        // 회원정보 입력
        memberDAO.creMember(vo);
        vo.setBsnmRegistDocNo2(vo.getBsnmRegistDocNo1() + 1);

        // 사업자등록증 입력
        fileUpload(fileList,vo);

        session.removeAttribute("terms");
        resultMap.put("success", true);
        resultMap.put("message", "가입 요청이 완료되었습니다. 가입 승인 후 이용 가능합니다.");

        return resultMap;
    }

    public Map<String,Object> login(LoginVO vo) {

        Map<String,Object> resultMap = new HashMap<>();

        BidMemberVO result = memberDAO.login(vo);

        // 계정 불일치
        if(result==null){
            resultMap.put("success",false);
            resultMap.put("message","계정 정보를 확인해주세요.");
            return resultMap;
        }

        // 투찰 취소 3회 초과 => 차단처리
//        int cancelCount = commonDAO.getBddtrCancelCnt(result);
//        if (cancelCount > 3) {
//            result.setBidMberSttusCode("02");
//        }

        // 회원 가입 승인 상태 판별 (요청 / 거절 / 정상)
        switch (result.getBidConfmSttusCode()) {
            case "01" :
                resultMap.put("success", false);
                resultMap.put("message", "관리자 승인 대기상태입니다.\n" +
                        "승인 후 로그인 가능합니다.\n" +
                        "고객센터에 문의해주세요.\n" +
                        "(02-6952-5095)");
                break;
            case "02" :
                resultMap.put("success", false);
                resultMap.put("message", "승인 거절된 계정입니다.\n" +
//                        "거절 사유 : " + "\n"+
                        "고객센터에 문의해주세요.\n" +
                        "(02-6952-5095)");
                break;
            case "03" :
                // 회원 상태 판별 (정상 / 차단 / 승인대기)
                switch (result.getBidMberSttusCode()) {
                    case "01" :
                        LoginVO loginUser = LoginVO.builder()
                                .userNo(result.getBidEntrpsNo())
                                .userId(result.getBidMberId())
                                .userNm(result.getEntrpsNm())
                                .build();

                        resultMap.put("success", true);
                        resultMap.put("loginUser",loginUser);
                        resultMap.put("message","정상 로그인 되었습니다.");
                        break;
                    case "02" :
                        resultMap.put("success", false);
                        resultMap.put("message", "투찰 취소 3회 초과로 로그인이 차단되었습니다.\n" +
                                "자세한 사항은 고객센터로 문의해주세요.\n" +
                                "(02-6952-5095)");
                        break;
                    case "03" :
                        resultMap.put("success", false);
                        resultMap.put("message", "관리자 승인 대기상태입니다.\n" +
                                "승인 후 로그인 가능합니다.\n" +
                                "고객센터에 문의해주세요.\n" +
                                "(02-6952-5095)");
                        break;
                }
                break;
        }
        return resultMap;
    }

    private void fileUpload(List<MultipartFile> fileList, BidMemberVO vo){
        if (fileList != null) {
            int count = 0;
            for (MultipartFile file : fileList) {
                String uldFileName = fileUtil.setTimestampedFileName(file);
                String folder = "/member/bsnmRegist/";

                FileVO fileVO = fileUtil.upload(file, folder, uldFileName);

                DocVO docVO = DocVO.builder()
                        .docNo(vo.getBsnmRegistDocNo1() + count)
                        .jobSeCode("MB")
                        .docFileMg(fileVO.getFILE_SIZE())
                        .docFileNm(fileVO.getORI_FILE_NAME())
                        .docFileCours(fileVO.getFILE_PATH())
                        .docFileRealCours(fileVO.getFULL_PATH())
                        .frstRegisterId(vo.getBidMberId())
                        .lastChangerId(vo.getBidMberId())
                        .build();

                memberDAO.creBsnmResistDoc(docVO);

                count++;
            }

        }
    }
}

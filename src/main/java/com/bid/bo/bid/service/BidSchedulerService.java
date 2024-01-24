package com.bid.bo.bid.service;

import com.bid.bo.bid.controller.BidNoticeController;
import com.bid.bo.bid.dao.BidSchedulerDao;
import com.bid.bo.bid.vo.BidBddprDtlVO;
import com.bid.bo.bid.vo.BidNoticeVO;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

/**
 입찰 공고 스케줄러
* @date : 2024-01-23
* @author  xyzp1539
** 작성규칙 **
* 1. Method는 void 타입으로
* 2. Method는 매개변수 사용 불가
**/
@Service
public class BidSchedulerService {
    private static Logger log = LoggerFactory.getLogger(BidSchedulerService.class);

    @Autowired
    private BidSchedulerDao bidSchedulerDao;
    /**
     입찰 공고 낙찰 패찰 유찰 스케쥴러
    * @date : 2024-01-23
    * @author  xyzp1539
    * @cron : 5분마다
    **/
    @Scheduled(cron = "0 */5 * * * * ")
    public void run() {
        log.info("##################### Scheduler Start ################### ");

        BidNoticeVO paramVo = new BidNoticeVO();
        paramVo.setGubun("start");

        // 입찰예정에서 투찰시작기간 되면 투찰중으로 변경
        List<BidNoticeVO> startList = bidSchedulerDao.getBidNoticeBddprList(paramVo);

        if(startList != null && startList.size() > 0) {
            log.info("입찰 예정중 투찰시작한 공고 count {} " , startList.size());

            for(BidNoticeVO vo : startList) {
                bidSchedulerDao.updateBidBddprStrart(vo);
            }
        } else {
            log.info("입찰 예정중 투찰시작한 공고 없음");
        }

        // 투찰기간 끝난 공고들 조회
        paramVo.setGubun("end");
        List<BidNoticeVO> endList = bidSchedulerDao.getBidNoticeBddprList(paramVo);

        if (endList != null && endList.size() > 0) {
            log.info("투찰기간 끝난 공고 count {}", endList.size());

            for (BidNoticeVO vo : endList) {
                // 투찰 업체들 중 최저가 업체 조회
                BidBddprDtlVO minPrVo = bidSchedulerDao.getBidBddprMinPremPriceComp(vo);

                if (minPrVo != null) {
                    // 1. 투찰 업체중 최저가 1업체만 낙찰 , 그외 패찰
                    bidSchedulerDao.bidBddprSuccessProc(minPrVo);
                    vo.setBidSttusCode("31"); // 낙찰
                    bidSchedulerDao.bidBasSuccessProc(vo);
                    bidSchedulerDao.bidScsbidDtlSuccessProc(minPrVo);

                    log.info("입찰업체번호 : {} , 입찰공고아이디 : {} , 프리미엄 가격 {} 낙찰!!", minPrVo.getBidEntrpsNo(), minPrVo.getBidPblancId(), minPrVo.getBddprPremiumPc());

                } else {
                    //2. 투찰 업체가 없으면 유찰
                    vo.setBidSttusCode("32"); // 유찰
                    bidSchedulerDao.bidBasSuccessProc(vo);

                    log.info("입찰공고아이디 : {} 유찰", vo.getBidPblancId());
                }
            }
        } else {
            log.info("투찰 기간 끝난 공고 없음");
        }

        log.info("##################### Scheduler End ################### ");
    }

}

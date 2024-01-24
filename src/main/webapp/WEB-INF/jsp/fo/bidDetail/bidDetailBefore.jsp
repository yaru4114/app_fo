<table class="tbl-v bid th-left">
	<caption>투찰정보 - 메탈구분, 브랜드, 아이템 상품명, 권역, 수량, 중량허용공차 제공</caption>
	<colgroup>
		<col style="width:20rem;">
		<col>
		<col style="width:20rem;">
		<col>
	</colgroup>
	<tbody>
		<tr>
			<th scope="row">메탈구분</th>
			<td>
				<div class="read">${bidBasInfo.metalCodeShort}</div>
			</td>
			<th scope="row">아이템 상품명</th>
			<td>
				<div class="read">${bidBasInfo.dspyGoodsNm}</div>
			</td>	
		</tr>
		<tr>
			<th scope="row">권역</th>
			<td>
				<div class="read">${bidBasInfo.dstrctLclsfCodeNm}</div>
			</td>
			<th scope="row">브랜드</th>
			<td>
				<div class="read">${bidBasInfo.brandGroupCodeNm}</div>
			</td>			                                
		</tr>
		<tr>
			<th scope="row">수량(개)</th>
			<td>
				<div class="read">${bidBasInfo.bidWt}</div>
			</td>
			<th scope="row">중량허용공차(±)</th>
			<td>
				<div class="read">${bidBasInfo.permWtRate}%</div>
			</td>
		</tr>
		<c:if test="${bidBasInfo.bidSttusCode == '12'}">
			<tr>
				<th scope="row">인도 조건</th>
				<td colspan="3"><span class="icon-info-txt">시작 전입니다.</span></td>
			</tr>
			<tr>
				<th scope="row">프리미엄 가격(USD/MT)</th>
				<td colspan="3"><span class="icon-info-txt">시작 전입니다.</span></td>
			</tr>
		</c:if>
		<c:if test="${bidBasInfo.bidSttusCode == '13'}">
			<tr class="bid-condition">
				<th class="fc-red" rowspan="2" scope="row">인도 조건</th>
				<td colspan="2">
					<div class="tb-select">
						<label for="shippingAddr">검색조건</label>
						<select name="shippingAddr" id="shippingAddr">
						  <option>옵션</option>
						  <option value="01" selected>서린상사 지정 보세창고 도착도 (FCA서린상사 지정 보세창고)</option>
						  <option value="02">기타 부산/인천 보세창고 상차도(FCA BUSAN/INCHEON)</option>
						  <option value="03">CIF INCHEON / CIF BUSAN</option>
						</select>                    
					</div>
				</td>
				<td colspan="1"><input class="input-lg" type="text" name="delyCndStdrPc" id="delyCndStdrPc" value="${bidBasInfo.delyCnd01StdrPc}" placeholder=""></td>
			</tr>
			<tr class="bid-condition bid-condition2">
				<td class="right-narrow" colspan="2">
					<div class="input-btn-wrap">
						<div class="r-info">+전환 프리미엄가</div>
						<div class="btns">
							<a href="#" class="btn-navy-md">인도조건창고 목록</a>
						</div>
					</div>
				</td>
				<td colspan="1"><input class="input-lg" type="text" name="delyCndPremiumPc" id="delyCndPremiumPc" value="${bidBasInfo.delyCnd01PremiumPc}" placeholder=""></td>                                
			</tr>			                            
			<tr>
				<th class="fc-red" rowspan="2" scope="row">프리미엄 가격(USD/MT)</th>
				<td class="bg-orange1" colspan="2">투찰 프리미엄 가격</td>
				<td class="bg-orange2" colspan="1">투찰 최종 가격</td>
			</tr>		
			<tr>
				<td class="center" colspan="2">
					<input class="input-md" type="text" name="premium" id="premium" value="100" placeholder="">/MT</td>
				<td class="center" colspan="1"><span>285,769,000</span> 원</td>                                  
			</tr>
		</c:if>
		<tr>
			<th class="multi" scope="row">인도 기한</th>
			<td class="multi" colspan="3">${bidBasInfo.delyBeginDe} ~ ${bidBasInfo.delyEndDe}<br>
				<span class="t-info">인도조건에서 제출한 인도지에 화물이 최종 입고된 기준으로 적용함.</span>
			</td>
		</tr>
		<tr>
			<th scope="row">가격지정기간</th>
			<td>
				<div class="read">${bidBasInfo.pcAppnBeginDe} ~ ${bidBasInfo.pcAppnEndDe}</div>
			</td>
			<th scope="row">가격지정방법</th>
			<td>
				<div class="read">${bidBasInfo.pcAppnMthCodeNm}</div>
			</td>
		</tr>
		<tr>
			<th scope="row">결제 조건</th>
			<td colspan="3">${bidBasInfo.setleCrncyCodeNm} ${bidBasInfo.setleMthCodeNm} ${bidBasInfo.setlePdCodeNm}</td>
		</tr>
		<tr>
			<th scope="row">기타 코멘트</th>
			<td colspan="3">${bidBasInfo.etcCn}</td>
		</tr>
		<c:if test="${bidBasInfo.bidSttusCode == '13'}">
			<tr>
				<th scope="row">입찰 참여 동의</th>
				<td colspan="3">
					<div class="checkbox-container">
						<label class="checkbox-label" for="agree_all">
							<input type="checkbox" name="agree_all" id="agree_all" value="" checked>
							<span class="checkbox-custom rectangular"></span>
						</label>
						<div class="input-title">상기&nbsp;내용에&nbsp;입찰&nbsp;동의합니다.</div>
					</div>   
				</td>
			</tr>
		</c:if>
	</tbody>
</table>
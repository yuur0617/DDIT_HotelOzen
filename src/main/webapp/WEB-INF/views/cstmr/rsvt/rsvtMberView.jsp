<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<link
	href="${pageContext.request.contextPath}/resources/css/cstmr/rsvt/rsvt.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/common/btn.css"
	rel="stylesheet">
<section>
	<div>
		<div class="center mt-5 mb-6">
			<ul class=" nav nav-tabs nav-tabs-bordered" role="tablist"
				style="height: 73px;">
				<li class="nav-item" role="presentation">
					<button class="nav-link active" data-bs-toggle="tab"
						data-bs-target="#rsvting" aria-selected="true" role="tab">예약진행중</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" data-bs-toggle="tab"
						data-bs-target="#rsvtEnd" tabindex="-1" aria-selected="false"
						role="tab">투숙완료</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" data-bs-toggle="tab"
						data-bs-target="#rsvtCancel" tabindex="-1" aria-selected="false"
						role="tab">예약취소</button>
				</li>
			</ul>
		</div>
		<div class="tab-content pt-2">
			<div id="rsvting" class="tab-pane fade active show" role="tabpanel">
				<c:choose>
					<c:when test="${not empty mberRsvtList}">
						<div class="center">
							<div class="accordion container mb-5" id="accordionExample">
								<c:forEach var="i" begin="0" end="${mberRsvtList.size()-1}">
									<div class="accordion-item mb-4">
										<h2 class="accordion-header" id="heading${i+1}">
											<button class="accordion-button" type="button"
												data-bs-toggle="collapse" data-bs-target="#collapse${i+1}"
												aria-expanded="true" aria-controls="collapse${i+1}">
												예약번호 ${mberRsvtList[i].rsvtNo}&nbsp;&nbsp; 성인
												${mberRsvtList[i].rsvtAdultCnt},&nbsp; 어린이
												${mberRsvtList[i].rsvtChildCnt}</button>
										</h2>
										<c:set var="rsvtRoomCnt"
											value="${mberRsvtList[i].rsvtRoomCnt}" />
										<c:set var="roomCnt" value="${rsvtRoomCnt - 1 }" />
										<c:forEach var="j" begin="0" end="${roomCnt}">
											<div class="accordion-collapse collapse show"
												id="collapse${i+1}" aria-labelledby="heading${i+1}"
												data-bs-parent="#accordionExample">
												<div class="accordion-body">
													<div class="d-flex mt-3 mb-3">
														<div class="rom-img container mx-0">
															<div class="swiper-container theme-slider"
																data-swiper='{"autoplay":true,"spaceBetween":5,"loop":true,"loopedSlides":5,"slideToClickedSlide":true}'>
																<div class="swiper-wrapper">
																	<div class="swiper-slide">
																		<img class="rounded-1 img-fluid"
																			src="${pageContext.request.contextPath}/resources/assets/img/room/${mberRsvtList[i].rsvtDetails[j].roomTypeVO.rmtTypeCd}/${mberRsvtList[i].rsvtDetails[j].roomTypeVO.rmtTypeCd}_1.jpg"
																			alt="" />
																	</div>
																	<div class="swiper-slide">
																		<img class="rounded-1 img-fluid"
																			src="${pageContext.request.contextPath}/resources/assets/img/room/${mberRsvtList[i].rsvtDetails[j].roomTypeVO.rmtTypeCd}/${mberRsvtList[i].rsvtDetails[j].roomTypeVO.rmtTypeCd}_2.jpg"
																			alt="" />
																	</div>
																	<div class="swiper-slide">
																		<img class="rounded-1 img-fluid"
																			src="${pageContext.request.contextPath}/resources/assets/img/room/${mberRsvtList[i].rsvtDetails[j].roomTypeVO.rmtTypeCd}/${mberRsvtList[i].rsvtDetails[j].roomTypeVO.rmtTypeCd}_3.jpg"
																			alt="" />
																	</div>
																</div>
																<div class="swiper-nav">
																	<div class="swiper-button-next swiper-button-white">
																	</div>
																	<div class="swiper-button-prev swiper-button-white">
																	</div>
																</div>
															</div>
														</div>
														<div class="mx-3 mt-2">
															<div class="mx-3 mb-3">
																<h5 class="mb-2">
																	${mberRsvtList[i].rsvtDetails[j].roomTypeVO.rmtNm}</h5>
																<h1 class="rsvt-title">
																	${mberRsvtList[i].rsvtDetails[j].roomTypeVO.rmtNmDetails}
																</h1>
															</div>
															<div>
																<table class="rs-table table">
																	<tr>
																		<th>호텔 및 객실</th>
																		<td>오젠호텔,
																			${mberRsvtList[i].rsvtDetails[j].roomTypeVO.rmtNmDetails}
																		</td>
																	</tr>
																	<tr>
																		<th>투숙날짜</th>

																		<td>${mberRsvtList[i].rsvtCheckinYmd}&nbsp;&nbsp;-&nbsp;&nbsp;${mberRsvtList[i].rsvtCheckoutYmd
																						}&nbsp;
																			(${mberRsvtList[i].rsvtDay}박)</td>
																	</tr>
																	<tr>
																		<th>예약인원</th>
																		<td>성인
																			${mberRsvtList[i].rsvtDetails[j].rsvtDtlAdultCnt} ,
																			어린이 ${mberRsvtList[i].rsvtDetails[j].rsvtDtlChildCnt}</td>
																	</tr>

																</table>
															</div>
														</div>
													</div>

												</div>
											</div>
										</c:forEach>
										<div class="right">
											<button type="submit" id="rsvtCancelBtn" class="btn btn-danger">예약취소</button>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</c:when>
					<c:when test="${empty mberRsvtList }">
						<h4 class="center">예약 진행 중인 내역이 없습니다.</h4>

					</c:when>
				</c:choose>
			</div>
			<div id="rsvtEnd" class="tab-pane fade" role="tabpanel">
				<c:choose>
					<c:when test="${not empty mberEndRsvtList}">
						<div class="center">
							<div class="accordion container mb-5" id="accordionExample">
								<c:forEach var="i" begin="0" end="${mberEndRsvtList.size()-1}">
									<div class="accordion-item mb-4">
										<h2 class="accordion-header" id="heading${i+1}">
											<button class="accordion-button" type="button"
												data-bs-toggle="collapse" data-bs-target="#collapse${i+1}"
												aria-expanded="true" aria-controls="collapse${i+1}">
												예약번호 ${mberEndRsvtList[i].rsvtNo}&nbsp;&nbsp; 성인
												${mberEndRsvtList[i].rsvtAdultCnt},&nbsp; 어린이
												${mberEndRsvtList[i].rsvtChildCnt}</button>
										</h2>
										<c:set var="rsvtRoomCnt"
											value="${mberEndRsvtList[i].rsvtRoomCnt}" />
										<c:set var="roomCnt" value="${rsvtRoomCnt - 1 }" />
										<c:forEach var="j" begin="0" end="${roomCnt}">
											<div class="accordion-collapse collapse show"
												id="collapse${i+1}" aria-labelledby="heading${i+1}"
												data-bs-parent="#accordionExample">
												<div class="accordion-body">
													<div class="d-flex mt-3 mb-3">
														<div class="rom-img container mx-0">
															<div class="swiper-container theme-slider"
																data-swiper='{"autoplay":true,"spaceBetween":5,"loop":true,"loopedSlides":5,"slideToClickedSlide":true}'>
																<div class="swiper-wrapper">
																	<div class="swiper-slide">
																		<img class="rounded-1 img-fluid"
																			src="${pageContext.request.contextPath}/resources/assets/img/room/${mberEndRsvtList[i].rsvtDetails[j].roomTypeVO.rmtTypeCd}/${mberEndRsvtList[i].rsvtDetails[j].roomTypeVO.rmtTypeCd}_1.jpg"
																			alt="" />
																	</div>
																	<div class="swiper-slide">
																		<img class="rounded-1 img-fluid"
																			src="${pageContext.request.contextPath}/resources/assets/img/room/${mberEndRsvtList[i].rsvtDetails[j].roomTypeVO.rmtTypeCd}/${mberEndRsvtList[i].rsvtDetails[j].roomTypeVO.rmtTypeCd}_2.jpg"
																			alt="" />
																	</div>
																	<div class="swiper-slide">
																		<img class="rounded-1 img-fluid"
																			src="${pageContext.request.contextPath}/resources/assets/img/room/${mberEndRsvtList[i].rsvtDetails[j].roomTypeVO.rmtTypeCd}/${mberEndRsvtList[i].rsvtDetails[j].roomTypeVO.rmtTypeCd}_3.jpg"
																			alt="" />
																	</div>
																</div>
																<div class="swiper-nav">
																	<div class="swiper-button-next swiper-button-white">
																	</div>
																	<div class="swiper-button-prev swiper-button-white">
																	</div>
																</div>
															</div>
														</div>
														<div class="mx-3 mt-2">
															<div class="mx-3 mb-3">
																<h5 class="mb-2">
																	${mberEndRsvtList[i].rsvtDetails[j].roomTypeVO.rmtNm}</h5>
																<h1 class="rsvt-title">
																	${mberEndRsvtList[i].rsvtDetails[j].roomTypeVO.rmtNmDetails}
																</h1>
															</div>
															<div>
																<table class="rs-table table">
																	<tr>
																		<th>호텔 및 객실</th>
																		<td>오젠호텔,
																			${mberEndRsvtList[i].rsvtDetails[j].roomTypeVO.rmtNmDetails}
																		</td>
																	</tr>
																	<tr>
																		<th>투숙날짜</th>

																		<td>${mberEndRsvtList[i].rsvtCheckinYmd}&nbsp;&nbsp;-&nbsp;&nbsp;${mberEndRsvtList[i].rsvtCheckoutYmd
																						}&nbsp;
																			(${mberEndRsvtList[i].rsvtDay}박)</td>
																	</tr>
																	<tr>
																		<th>예약인원</th>
																		<td>성인
																			${mberEndRsvtList[i].rsvtDetails[j].rsvtDtlAdultCnt}
																			, 어린이
																			${mberEndRsvtList[i].rsvtDetails[j].rsvtDtlChildCnt}</td>
																	</tr>

																</table>
															</div>
														</div>
													</div>

												</div>
											</div>
										</c:forEach>
									</div>
								</c:forEach>
							</div>
						</div>
					</c:when>
					<c:when test="${empty mberEndRsvtList }">
						<h4 class="center">투숙 완료 내역이 없습니다.</h4>

					</c:when>
				</c:choose>
			</div>
			<div id="rsvtCancel" class="tab-pane fade" role="tabpanel">
				<c:choose>
					<c:when test="${not empty mberCancelRsvtList}">


						<div class="center">
							<div class="accordion container mb-5" id="accordionExample">
								<c:forEach var="i" begin="0" end="${mberRsvtList.size()-1}">
									<div class="accordion-item mb-4">
										<h2 class="accordion-header" id="heading${i+1}">
											<button class="accordion-button" type="button"
												data-bs-toggle="collapse" data-bs-target="#collapse${i+1}"
												aria-expanded="true" aria-controls="collapse${i+1}">
												예약번호 ${mberCancelRsvtList[i].rsvtNo}&nbsp;&nbsp; 성인
												${mberCancelRsvtList[i].rsvtAdultCnt},&nbsp; 어린이
												${mberCancelRsvtList[i].rsvtChildCnt}</button>
										</h2>
										<c:set var="rsvtRoomCnt"
											value="${mberCancelRsvtList[i].rsvtRoomCnt}" />
										<c:set var="roomCnt" value="${rsvtRoomCnt - 1 }" />
										<c:forEach var="j" begin="0" end="${roomCnt}">
											<div class="accordion-collapse collapse show"
												id="collapse${i+1}" aria-labelledby="heading${i+1}"
												data-bs-parent="#accordionExample">
												<div class="accordion-body">
													<div class="d-flex mt-3 mb-3">
														<div class="rom-img container mx-0">
															<div class="swiper-container theme-slider"
																data-swiper='{"autoplay":true,"spaceBetween":5,"loop":true,"loopedSlides":5,"slideToClickedSlide":true}'>
																<div class="swiper-wrapper">
																	<div class="swiper-slide">
																		<img class="rounded-1 img-fluid"
																			src="${pageContext.request.contextPath}/resources/assets/img/room/${mberCancelRsvtList[i].rsvtDetails[j].roomTypeVO.rmtTypeCd}/${mberCancelRsvtList[i].rsvtDetails[j].roomTypeVO.rmtTypeCd}_1.jpg"
																			alt="" />
																	</div>
																	<div class="swiper-slide">
																		<img class="rounded-1 img-fluid"
																			src="${pageContext.request.contextPath}/resources/assets/img/room/${mberCancelRsvtList[i].rsvtDetails[j].roomTypeVO.rmtTypeCd}/${mberCancelRsvtList[i].rsvtDetails[j].roomTypeVO.rmtTypeCd}_2.jpg"
																			alt="" />
																	</div>
																	<div class="swiper-slide">
																		<img class="rounded-1 img-fluid"
																			src="${pageContext.request.contextPath}/resources/assets/img/room/${mberCancelRsvtList[i].rsvtDetails[j].roomTypeVO.rmtTypeCd}/${mberCancelRsvtList[i].rsvtDetails[j].roomTypeVO.rmtTypeCd}_3.jpg"
																			alt="" />
																	</div>
																</div>
																<div class="swiper-nav">
																	<div class="swiper-button-next swiper-button-white">
																	</div>
																	<div class="swiper-button-prev swiper-button-white">
																	</div>
																</div>
															</div>
														</div>
														<div class="mx-3 mt-2">
															<div class="mx-3 mb-3">
																<h5 class="mb-2">
																	${mberCancelRsvtList[i].rsvtDetails[j].roomTypeVO.rmtNm}</h5>
																<h1 class="rsvt-title">
																	${mberCancelRsvtList[i].rsvtDetails[j].roomTypeVO.rmtNmDetails}
																</h1>
															</div>
															<div>
																<table class="rs-table table">
																	<tr>
																		<th>호텔 및 객실</th>
																		<td>오젠호텔,
																			${mberCancelRsvtList[i].rsvtDetails[j].roomTypeVO.rmtNmDetails}
																		</td>
																	</tr>
																	<tr>
																		<th>투숙날짜</th>

																		<td>${mberCancelRsvtList[i].rsvtCheckinYmd}&nbsp;&nbsp;-&nbsp;&nbsp;${mberCancelRsvtList[i].rsvtCheckoutYmd
																						}&nbsp;
																			(${mberCancelRsvtList[i].rsvtDay}박)</td>
																	</tr>
																	<tr>
																		<th>예약인원</th>
																		<td>성인
																			${mberCancelRsvtList[i].rsvtDetails[j].rsvtDtlAdultCnt}
																			, 어린이
																			${mberCancelRsvtList[i].rsvtDetails[j].rsvtDtlChildCnt}</td>
																	</tr>

																</table>
															</div>
														</div>
													</div>

												</div>
											</div>
										</c:forEach>
									</div>
								</c:forEach>
							</div>
						</div>
					</c:when>
					<c:when test="${empty mberCancelRsvtList }">
						<h4 class="center">예약 취소 내역이 없습니다.</h4>
					</c:when>
				</c:choose>
			</div>
		</div>
	</div>
</section>
<script defer
	src="<c:url value='/resources/js/app/cstmr/rsvt/rsvtView.js'/>"></script>
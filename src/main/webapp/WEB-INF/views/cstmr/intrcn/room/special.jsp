<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<link href="${pageContext.request.contextPath}/resources/css/cstmr/intrcn/room/roomList.css" rel="stylesheet">

<section>
	<div>
		<div class="location-header mx-10">
			<div class="row">
				<h1 class="cstmr-title mx-5 col-sm-6">ROOM</h1>
				<div class=" col-sm-4 button-div">
					<a class="btn btn-outline-dark mx-5  rsvt-button" href="../" type="button">RESERVATION</a>
				</div>
			</div>
			<div class="room-meun-tab acco">
				<ul>
					<li><a id="standardMove" href="${pageContext.request.contextPath}/room/standard.do">STANDARD</a></li>
					<li><a id="deluxeMove" href="${pageContext.request.contextPath}/room/deluxe.do">DELUXE</a></li>
					<li><a id="suiteMove" href="${pageContext.request.contextPath}/room/suite.do">SUITE</a></li>
					<li class="current"><a id="specialMove" href="${pageContext.request.contextPath}/room/special.do">SPECIAL</a></li>
				</ul>
			</div>
			
			<!-- 스위트 더블 start-->
			<!-- 객실 이미지 -->
			<div class="row">
				<div class="col-sm-6">
					<div class="mt-6 mb-7 rom-img-wrapper container ">
						<div class="swiper-container theme-slider"
							data-swiper='{"autoplay":true,"spaceBetween":5,"loop":true,"loopedSlides":5,"slideToClickedSlide":true}'>
							<div class="swiper-wrapper">
								<div class="swiper-slide">
									<img class="rounded-1 rom-img"
										src="<c:url value='/resources/assets/img/room/SPA/SPA_1.jpg'/>"
										alt="" />
								</div>
								<div class="swiper-slide">
									<img class="rounded-1 rom-img"
										src="<c:url value='/resources/assets/img/room/SPA/SPA_2.jpg'/>"
										alt="" />
								</div>
								<div class="swiper-slide">
									<img class="rounded-1 rom-img"
										src="<c:url value='/resources/assets/img/room/SPA/SPA_3.jpg'/>"
										alt="" />
								</div>
								<div class="swiper-slide">
									<img class="rounded-1 rom-img"
										src="<c:url value='/resources/assets/img/room/SPA/SPA_4.jpg'/>"
										alt="" />
								</div>
							</div>
							<div class="swiper-nav">
								<div class="swiper-button-next swiper-button-dark"></div>
								<div class="swiper-button-prev swiper-button-dark"></div>
							</div>
						</div>
					</div>
				</div>
				<!-- 설명 -->
				<div class="col-sm-6">
					<div class="mt-7 mb-7 align-self-center">
						<table class="container room-table">
							<tr>
								<th colspan="10" class="roomType-e">SPA</th>
							</tr>
							<tr>
								<th colspan="5" class="roomType">스파</th>
								<td colspan="5" class="roomType icon-td">
									<i class="fas fa-wifi"></i>
									<i class="fas fa-tv"></i>
									<i class="fas fa-smoking-ban"></i>
								</td>
							</tr>

							<tr class="content">
								<th class="tr-pad">침대타입</th>
								<td colspan="4" class="tr-pad">더블 1개</td>
								<th class="tr-pad">투숙인원</th>
								<td colspan="4" class="tr-pad">2명</td>
							</tr>
							<tr class="content">
								<th class="tr-pad">체크인시간</th>
								<td colspan="4" class="bedCon tr-pad">15:00</td>
								<th class="tr-pad">체크아웃시간</th>
								<td colspan="4" class="tr-pad">11:00</td>
							</tr>
							<tr class="content">
								<th class="tr-pad">룸 구성</th>
								<td colspan="8" class="bedCon tr-pad">객실 | 화장실 | 야외스파 | 테라스 </td>
							</tr>
							<tr class="content">
								<th class="tr-pad">면적</th>
								<td colspan="4" class="tr-pad">48.37㎡</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<!-- 스위트 더블 end -->

			<!-- 스위트 트윈 start-->
			<!-- 객실 이미지 -->
			<div class="row">
				<div class="col-sm-6">
					<div class="mt-6 mb-7 rom-img-wrapper container ">
						<div class="swiper-container theme-slider"
							data-swiper='{"autoplay":true,"spaceBetween":5,"loop":true,"loopedSlides":5,"slideToClickedSlide":true}'>
							<div class="swiper-wrapper">
								<div class="swiper-slide">
									<img class="rounded-1 rom-img"
										src="<c:url value='/resources/assets/img/room/OND/OND_1.jpg'/>"
										alt="" />
								</div>
								<div class="swiper-slide">
									<img class="rounded-1 rom-img"
										src="<c:url value='/resources/assets/img/room/OND/OND_2.jpg'/>"
										alt="" />
								</div>
								<div class="swiper-slide">
									<img class="rounded-1 rom-img"
										src="<c:url value='/resources/assets/img/room/OND/OND_3.jpg'/>"
										alt="" />
								</div>
								<div class="swiper-slide">
									<img class="rounded-1 rom-img"
										src="<c:url value='/resources/assets/img/room/OND/OND_4.jpg'/>"
										alt="" />
								</div>
							</div>
							<div class="swiper-nav">
								<div class="swiper-button-next swiper-button-dark"></div>
								<div class="swiper-button-prev swiper-button-dark"></div>
							</div>
						</div>
					</div>
				</div>
				<!-- 설명 -->
				<div class="col-sm-6">
					<div class="mt-7 mb-7 align-self-center">
						<table class="container room-table">
							<tr>
								<th colspan="10" class="roomType-e">ON-DOL</th>
							</tr>
							<tr>
								<th colspan="5" class="roomType">온돌</th>
								<td colspan="5" class="roomType icon-td">
									<i class="fas fa-wifi"></i>
									<i class="fas fa-tv"></i>
									<i class="fas fa-smoking-ban"></i>
								</td>
							</tr>

							<tr class="content">
								<th class="tr-pad">침대타입</th>
								<td colspan="4" class="tr-pad">온돌(더블) 1개</td>
								<th class="tr-pad">투숙인원</th>
								<td colspan="4" class="tr-pad">2명</td>
							</tr>
							<tr class="content">
								<th class="tr-pad">체크인시간</th>
								<td colspan="4" class="bedCon tr-pad">15:00</td>
								<th class="tr-pad">체크아웃시간</th>
								<td colspan="4" class="tr-pad">11:00</td>
							</tr>
							<tr class="content">
								<th class="tr-pad">룸 구성</th>
								<td colspan="8" class="bedCon tr-pad">객실 | 화장실 | 테라스</td>
							</tr>
							<tr class="content">
								<th class="tr-pad">면적</th>
								<td colspan="4" class="tr-pad">36.00㎡</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<!-- 스위트 트윈 end -->

			<!-- 스위트 패밀리 start-->
			<!-- 객실 이미지 -->
			<div class="row">
				<div class="col-sm-6">
					<div class="mt-6 mb-7 rom-img-wrapper container ">
						<div class="swiper-container theme-slider"
							data-swiper='{"autoplay":true,"spaceBetween":5,"loop":true,"loopedSlides":5,"slideToClickedSlide":true}'>
							<div class="swiper-wrapper">
								<div class="swiper-slide">
									<img class="rounded-1 rom-img"
										src="<c:url value='/resources/assets/img/room/PTY/PTY_1.jpg'/>"
										alt="" />
								</div>
								<div class="swiper-slide">
									<img class="rounded-1 rom-img"
										src="<c:url value='/resources/assets/img/room/PTY/PTY_2.jpg'/>"
										alt="" />
								</div>
								<div class="swiper-slide">
									<img class="rounded-1 rom-img"
										src="<c:url value='/resources/assets/img/room/PTY/PTY_3.jpg'/>"
										alt="" />
								</div>
								<div class="swiper-slide">
									<img class="rounded-1 rom-img"
										src="<c:url value='/resources/assets/img/room/PTY/PTY_4.jpg'/>"
										alt="" />
								</div>
							</div>
							<div class="swiper-nav">
								<div class="swiper-button-next swiper-button-dark"></div>
								<div class="swiper-button-prev swiper-button-dark"></div>
							</div>
						</div>
					</div>
				</div>
				<!-- 설명 -->
				<div class="col-sm-6">
					<div class="mt-7 mb-7 align-self-center">
						<table class="container room-table">
							<tr>
								<th colspan="10" class="roomType-e">PARTY</th>
							</tr>
							<tr>
								<th colspan="5" class="roomType">파티</th>
								<td colspan="5" class="roomType icon-td">
									<i class="fas fa-wifi"></i>
									<i class="fas fa-tv"></i>
									<i class="fas fa-smoking-ban"></i>
								</td>
							</tr>

							<tr class="content">
								<th class="tr-pad">침대타입</th>
								<td colspan="4" class="tr-pad">싱글 2개, 더블 2개</td>
								<th class="tr-pad">투숙인원</th>
								<td colspan="4" class="tr-pad">6명</td>
							</tr>
							<tr class="content">
								<th class="tr-pad">체크인시간</th>
								<td colspan="4" class="bedCon tr-pad">15:00</td>
								<th class="tr-pad">체크아웃시간</th>
								<td colspan="4" class="tr-pad">11:00</td>
							</tr>
							<tr class="content">
								<th class="tr-pad">룸 구성</th>
								<td colspan="8" class="bedCon tr-pad">객실 | 거실 | 드레스룸 | 주방 | 샤워부스 | 화장실 | 테라스 </td>
							</tr>
							<tr class="content">
								<th class="tr-pad">면적</th>
								<td colspan="4" class="tr-pad">134.00㎡</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<!-- 스위트 패밀리 end -->
			<label class="mb-0">취소 규정</label>

			<div class="accordion container mb-5" style="padding-left: 0px;"
				id="accordionExample">
				<div class="">
					<h2 class="accordion-header" id="heading1">
						<button class="accordion-button font-gray" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapse1"
							aria-expanded="true" aria-controls="collapse1">[필독] 취소
							규정에 동의합니다.</button>
					</h2>
					<div class="accordion-collapse collapse show" id="collapse1"
						aria-labelledby="heading1" data-bs-parent="#accordionExample">
						<div class="">
							<div class="btn-refnd ">
								<table class=" font-gray">
									<tr>
										<th class="refnd-th">체크인 3일전</th>
										<td class="refnd-td">위약금 없이 취소 가능</td>
									</tr>
									<tr>
										<th class="refnd-th">체크인 1일전</th>
										<td class="refnd-td">위약금 50% 발생</td>
									</tr>
									<tr>
										<th class="refnd-th">체크인 당일</th>
										<td class="refnd-td">위약금 100% 발생 및 취소</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</div>
</section>

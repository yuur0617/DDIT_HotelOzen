<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<link href="${pageContext.request.contextPath}/resources/css/emp/pagingCss.css" rel="stylesheet">

<div class="col mb-3">
	<div class="card h-100">
		<div class="card-header">
			<div class="row flex-between-end">
				<nav style="--falcon-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%23748194'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
				  <ol class="breadcrumb">
				    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/emp/index.do">Home</a></li>
				    <li class="breadcrumb-item">호텔관리</li>
				    <li class="breadcrumb-item">주차관리</li>
				    <li class="breadcrumb-item active" aria-current="page">차량 조회</li>
				  </ol>
				</nav>
				
				<div id="parkingListTable">
					<div>
						<form id="searchForm" action="<c:url value='/emp/pms/parking/carList.do'/>">
							<input type="hidden" name="page" />
							<input type="hidden" name="searchWord" value="${simpleCondition.searchWord }"/>
						</form>
						<div class="row justify-content-end g-0" data-pg-role="searchUI" data-pg-target="#searchForm">
							<div class="col-auto col-sm-5 mb-3">
						        <div class="input-group">
						          <input class="form-control form-control-sm shadow-none search" 
						          		type="search" placeholder="Search..." aria-label="search" 
						          		name ="searchWord" value="${simpleCondition.searchWord }"/>
						          <div class="input-group-text bg-transparent">
						          	<span class="fa fa-search fs-10 text-600" data-pg-role="searchBtn"></span> <!-- 스타일 변경 -->
						          </div>
						        </div>
							</div>
						</div>
					</div>
					<div class="table-responsive scrollbar">
						<table class="table mb-0">
							<thead class="bg-oran">
								<tr>
									<th class="align-middle wdf" data-sort="no">번호</th>
									<th class="align-middle" data-sort="pkgNo">차량번호</th>
									<th class="align-middle" data-sort="pkgEntvhclTime">입차시간</th>
									<th class="align-middle" data-sort="pkgLvvhclTime">출차시간</th>
									<th class="align-middle" data-sort="pkgStayYn">투숙 여부</th>
									<th class="align-middle" data-sort="pkgAmnt">가격</th>
								</tr>
							</thead>
							<tbody class="list" id="listBody">
								
							</tbody>
						</table>
					</div>
					
					<!-- 페이징 -->
					<div class="card-footer d-flex justify-content-center paging-div-height" id="pagingArea">
					
					</div>
				</div>
				
			</div>
		</div>
	</div>
</div>

<script src="<c:url value='/resources/js/app/emp/pms/parking/carList.js'/>"></script>
<script src="<c:url value='/resources/js/app/common/paging.js'/>"></script>
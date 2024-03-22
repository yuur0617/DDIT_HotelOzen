<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags"  prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<link href="${pageContext.request.contextPath}/resources/css/emp/hrm/emply/empList.css" rel="stylesheet">

<div class="card header">

		
				
				
<!--         전체 직원, 퇴사자, 현재 출근 직원 조회 페이지-->

              <div class="card overflow-hidden">
              <div class="card">
              	<nav style="--falcon-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%23748194'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/emp/index.do">Home</a></li>
						<li class="breadcrumb-item active" aria-current="page">직원조회</li>
					</ol>
				</nav>
              </div>
                <div class="card-header p-0 scrollbar-overlay border-bottom" data-simplebar="init"><div class="simplebar-wrapper"><div class="simplebar-height-auto-observer-wrapper"><div class="simplebar-height-auto-observer"></div></div><div class="simplebar-mask"><div class="simplebar-offset"><div class="simplebar-content-wrapper" tabindex="0" role="region" aria-label="scrollable content"><div class="simplebar-content">
                  <ul class="nav nav-tabs border-0 tab-contact-details flex-nowrap" id="contact-details-tab" role="tablist">
                    <li class="nav-item text-nowrap" role="presentation"><a class="nav-link mb-0 d-flex align-items-center gap-1 py-3 px-x1 active" id="contact-timeline-tab" data-bs-toggle="tab" href="#timeline" role="tab" aria-controls="timeline" aria-selected="true">
                   <span class="fas fa-stream icon text-600"></span>  <!-- Font Awesome fontawesome.com -->
                        <h6 class="mb-0 text-600">전체 조회</h6>
                      </a></li>
                    <li class="nav-item text-nowrap" role="presentation"><a class="nav-link mb-0 d-flex align-items-center gap-1 py-3 px-x1" id="contact-tickets-tab" data-bs-toggle="tab" href="#tickets" role="tab" aria-controls="tickets" aria-selected="false" tabindex="-1">
                        <span class="fas fa-ticket-alt text-600"></span>
                        <h6 class="mb-0 text-600">출근 직원 조회</h6>
                      </a></li>
                    <li class="nav-item text-nowrap" role="presentation"><a class="nav-link mb-0 d-flex align-items-center gap-1 py-3 px-x1" id="contact-notes-tab" data-bs-toggle="tab" href="#notes" role="tab" aria-controls="notes" aria-selected="false" tabindex="-1">
                    <span class="fas fa-file-alt icon text-600"></span>
                        <h6 class="mb-0 text-600">퇴사자 조회</h6>
                      </a></li>
                  </ul>
                </div></div></div></div><div class="simplebar-placeholder"></div></div><div class="simplebar-track simplebar-horizontal" ><div class="simplebar-scrollbar"></div></div><div class="simplebar-track simplebar-vertical"><div class="simplebar-scrollbar"></div></div></div>
                <div class="tab-content">
                  <div class="card-body tab-pane active" id="timeline" role="tabpanel" aria-labelledby="contact-timeline-tab">
                    
                    
<!--                     전체직원조회 -->
               <div class="mb-3" id="allEmpList" data-list>
                <div class="card-header border-bottom border-200 px-0">
                	<div class="row flex-between-center gy-2 px-x1">총 직원 수: ${fn:length(hrmEmpList)} 명</div>
                  <div class="d-lg-flex justify-content-between">
                    <div class="row flex-between-center gy-2 px-x1">
 
                      <div class="col-auto">
                        <form>
                        <div class="d-flex">
                          <select class="form-select form-select-sm" aria-label="Bulk actions">
                            <option selected="">전체</option>
                            <option value="Abled">이름</option>
                            
                            <option value="Disabled">부서</option>
                          </select>
                		<div class="input-group">
                            <input class="form-control form-control-sm shadow-none search ms-2" type="search" placeholder="검색" aria-label="search">
                            <button class="btn btn-sm btn-outline-secondary border-300 hover-border-secondary">
                            <span class="fa fa-search fs--1"></span></button>
                          </div>
                        </div>
                        

                        </form>
                      </div>
                    </div>
                    <div class="border-bottom border-200 my-3"></div>
                    <div class="d-flex align-items-center justify-content-between justify-content-lg-end px-x1">
                     
                      <div class="d-none" id="retired-actions">
                        <div class="d-flex">
                          <select class="form-select form-select-sm" aria-label="Bulk actions" >
                            <option selected="">계정 상태 변경</option>
                            <option value="Abled">활성화</option>
                            <option value="Disabled">비활성화</option>
                            <option value="Delete">삭제</option>
                          </select>
                          <button class="btn btn-falcon-default btn-sm ms-2" type="button"><span class="bi-forward-fill"></span></button>
                        </div>
                      </div>
                      <div class="d-flex align-items-center" id="retired-replace-element">
                      <button class="btn btn-falcon-default btn-sm" type="button"><span class="fas fa-plus" data-fa-transform="shrink-3 down-2"></span><span class="d-none d-sm-inline-block ms-1">신규 직원 등록</span></button>
                        <button class="btn btn-falcon-default btn-sm mx-2" type="button"><span class="fas fa-external-link-alt" data-fa-transform="shrink-3"></span><span class="d-none d-sm-inline-block d-xl-none d-xxl-inline-block ms-1">Export</span></button>
                        <button class="btn btn-falcon-default btn-sm" type="button"><span class="fas fa-file-import" data--transform="shrink-3"></span><span class="d-none d-sm-inline-block d-xl-none d-xxl-inline-block ms-1">Import</span></button>
                        <div class="dropdown font-sans-serif ms-2">
                          <button class="btn btn-falcon-default text-600 btn-sm dropdown-toggle dropdown-caret-none" type="button" id="preview-dropdown" data-bs-toggle="dropdown" data-boundary="viewport" aria-haspopup="true" aria-expanded="false"><span class="fas fa-ellipsis-h fs--2"></span></button>
                          <div class="dropdown-menu dropdown-menu-end border py-2" aria-labelledby="preview-dropdown"><a class="dropdown-item" href="#!">View</a><a class="dropdown-item" href="#!">Export</a>
                            <div class="dropdown-divider"></div><a class="dropdown-item text-danger" href="#!">Remove</a>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="card-body p-0">
                  <div class="table-responsive scrollbar">
                    <table class="table table-sm fs--1 mb-0">
                      <thead class="text-800 bg-light">
                        <tr>
                          <th class="py-2 fs-0 pe-2" style="width: 28px;">
                            <div class="form-check d-flex align-items-center">
                              <input class="form-check-input" id="checkbox-bulk-tickets-select2" type="checkbox" data-bulk-select='{"body":"retired-body","actions":"retired-actions","replacedElement":"retired-replace-element"}'/>
                            </div>
                          </th>
                          <th class="sort align-middle ps-2" data-sort="rnum">순번</th>
                          <th class="sort align-middle pe-5" data-sort="empNm">이름</th>
                          <th class="sort align-middle pe-5" data-sort="empNo">사번</th>
                          <th class="sort align-middle pe-5" data-sort="empTel">전화번호</th>
                          <th class="sort align-middle pe-5" data-sort="empDept">부서명</th>
                          <th class="sort align-middle text-end" data-sort="empJbgd">직급</th>
                          <th class="sort align-middle text-end" data-sort="social">비고</th>
                        </tr>
                      </thead>
                      <tbody class="list" id="retired-body">

<c:if test="${not empty hrmEmpList }">
	<c:forEach items="${hrmEmpList }" var="hrmEmp" varStatus="vs">
		<tr>
			<td class="align-middle fs-0 py-3">
				<div class="form-check mb-0">
					<input class="form-check-input" type="checkbox" id="all-contact-0" data-bulk-select-row="data-bulk-select-row">
				</div>
			</td>
			<td class="align-middle rnum text-center">${hrmEmp.rnum }</td>
			<td class="align-middle empNm white-space-nowrap pe-5 ps-2">
				<div class="d-flex align-items-center gap-2 position-relative">
					<div class="avatar avatar-xl">
					<div class="avatar-name rounded-circle"><span>EW</span></div>
					</div>
<%-- 					<h6 class="mb-0"><a class="stretched-link text-900" href="${pageContext.request.contextPath}/emp/pbl/emply/view">${hrmEmp.empNm }</a></h6> --%>
					<h6 class="mb-0"><a class="stretched-link text-900" id="empView" data-bs-toggle="modal" data-bs-target="#empInfo${vs.index}" href="${pageContext.request.contextPath}/emp/pbl/emply/view">${hrmEmp.empNm }</a></h6>
				</div>
			</td>
			<td class="align-middle empNo">${hrmEmp.empNo }</td>
			<td class="align-middle empTel font-sans-serif white-space-nowrap">${hrmEmp.empTel }</td>
			<td class="align-middle empDept">${hrmEmp.empDept }</td>
			
			<c:if test="${hrmEmp.empJbgd eq '사원' }">
				<td class="align-middle empJbgd fs-0 text-end"><span class="badge bg-primary">${hrmEmp.empJbgd }</span>
<!-- 				<td class="align-middle empJbgd fs-0 text-end"><span class="badge bg-primary">STF</span> -->
			</c:if>
			<c:if test="${hrmEmp.empJbgd ne '사원'}">
				<td class="align-middle empJbgd fs-0 text-end"><span class="badge bg-danger">${hrmEmp.empJbgd }</span>
			</c:if>
			
			</td>
			<td class="align-middle social text-end ps-4">${hrmEmp.empBirth }
			</td>
		</tr>
		
<!-- 직원 상세 조회 모달	 -->
		
<div class="modal fade" id="empInfo${vs.index}" data-bs-keyboard="false" data-bs-backdrop="static" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg mt-6" role="document">
    <div class="modal-content border-0">
      <div class="position-absolute top-0 end-0 mt-3 me-3 z-1">
        <button class="btn-close btn btn-sm btn-circle d-flex flex-center transition-base" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body p-0">
        <div class="rounded-top-3 bg-body-tertiary py-3 ps-4 pe-6">
          <h4 class="mb-1" id="staticBackdropLabel">직원 상세 정보</h4>
<!--           <p class="fs-11 mb-0">Added by <a class="link-600 fw-semi-bold" href="#!">Antony</a></p> -->
        </div>
        <div class="p-4">
          <div class="row">
            <div class="col-lg-12">
              <div class="d-flex">
                <div class="flex-1">
                  
                  <div class="d-flex">
                  <div class="card-body bg-light">
                    <div class="card border rounded-3 bg-white dark__bg-1000 shadow-none">
                      <div class="bg-holder bg-card d-none d-sm-block d-xl-none" style=background-image:url(${pageContext.request.contextPath}/resources/assets/img/icons/spot-illustrations/corner-2.png);>
                      </div>
                      <!--/.bg-holder-->

                      <div class="card-body row g-0 flex-column flex-sm-row flex-xl-column z-index-1 align-items-center">
                        <div class="col-auto text-center me-sm-x1 me-xl-0"><img class="ticket-preview-avatar" src="${pageContext.request.contextPath}/resources/assets/img/team/5-thumb.png" alt="" /></div>
                        <div class="col-sm-8 col-md-6 col-lg-4 col-xl-12 ps-sm-1 ps-xl-0">
                          <p class="fw-semi-bold mb-0 text-800 text-center text-sm-start text-xl-center mb-3 mt-3 mt-sm-0 mt-xl-3">${hrmEmp.empNm}</p>
                          <div class="d-flex gap-2 justify-content-center">
                            <button class="btn btn-primary btn-sm px-2 text-nowrap w-50"><span class="fas fa-id-badge me-1" data-fa-transform="shrink-3 down-1"></span><span class="fs--2">${hrmEmp.empJbgd }</span></button>
                            <button class="btn btn-sm btn-falcon-default w-50"><span class="fas fa-landmark me-1" data-fa-transform="shrink-4"></span><span class="fs--2">${hrmEmp.empDept}</span></button>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="border rounded-3 p-x1 mt-3 bg-white row mx-0 g-0">
                    
                    	<div class="d-flex flex-wrap mb-4" style="height: 300px;">
							
						  <div class="p-2" style="width: 330px;"><h6 class="mb-1 false">이메일</h6><p class="mb-0 text-700 fs--1">${hrmEmp.empEml }</p></div>
						  <div class="p-2" style="width: 330px;"><h6 class="false mb-1">전화번호</h6><p class="mb-0 text-700 fs--1">${hrmEmp.empTel }</p></div>
						  <div class="p-2" style="width: 330px;"><h6 class="false mb-1">주소</h6><p class="mb-0 text-700 fs--1">${hrmEmp.empAddr }</p></div>
						  <div class="p-2" style="width: 330px;"><h6 class="false mb-1">자택 전화번호</h6><p class="mb-0 text-700 fs--1">${hrmEmp.empAddr }</p></div>
						  <div class="p-2" style="width: 330px;"><h6 class="false mb-1">생년월일</h6><p class="mb-0 text-700 fs--1">${hrmEmp.empBirth }</p></div>
						  <div class="p-2" style="width: 330px;"><h6 class="false mb-1">퇴사여부</h6><p class="mb-0 text-700 fs--1">${hrmEmp.empRtrmYn }</p></div>
						  <div class="p-2" style="width: 330px;"><h6 class="false mb-1">입사일</h6><p class="mb-0 text-700 fs--1">${hrmEmp.empJncmpYmd }</p></div>
						  <div class="p-2" style="width: 330px;"><h6 class="false mb-1">사번</h6><p class="mb-0 text-700 fs--1">${hrmEmp.empNo }</p></div>
						  <div class="p-2" style="width: 330px;"><h6 class="false mb-1">잔여연차</h6><p class="mb-0 text-700 fs--1">${hrmEmp.empAnnualLeave }</p></div>
					
<!-- 						  <div class="p-2 bg-300 border border-400">Flex item</div> -->
						</div>
                    
                     
                    </div>
                  </div>
                  
<!-- 				<div class="col-lg-12 col-xl-12 col-xxl-6 h-100" id="getThis" data-div-before="before"> -->
<!-- 					<div class="position-xl-sticky top-0"> -->
<!-- 						<div class="card"> -->
<!-- 							<div class="card-header d-flex align-items-center justify-content-between py-2"> -->
<!-- 								<button class="btn btn-falcon-default btn-sm" type="button"><span class="fas fa-arrow-left"></span></button> -->
<!-- 								<h6 class="mb-0">직원 상세 정보</h6> -->
<!-- 								<div class="dropdown font-sans-serif btn-reveal-trigger"> -->
<!-- 								<button class="btn btn-link text-600 btn-sm dropdown-toggle dropdown-caret-none btn-reveal" type="button" id="dropdown-contact-information" data-bs-toggle="dropdown" data-boundary="viewport" aria-haspopup="true" aria-expanded="false"><span class="fas fa-ellipsis-h fs--2"></span></button> -->
<!-- 								<div class="dropdown-menu dropdown-menu-end border py-2" aria-labelledby="dropdown-contact-information"><a class="dropdown-item" href="#!">-----</a><a class="dropdown-item" href="#!">Disabled</a> -->
<!-- 								  <div class="dropdown-divider"></div><a class="dropdown-item text-danger" href="#!">Delete</a> -->
<!-- 								</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
           
                  </div>
                  <hr class="my-4" />
                </div>
              </div>
              <div class="d-flex"><span class="fa-stack ms-n1 me-3"><i class="fas fa-circle fa-stack-2x text-200"></i><i class="fa-inverse fa-stack-1x text-primary fas fa-align-left" data-fa-transform="shrink-2"></i></span>
                <div class="flex-1">
                  <h5 class="mb-2 fs-9">상세 이력</h5>
                  <p class="text-break fs-10">ㅁㅁ대 졸업, @@직장이력....</p>
                </div>
              </div>
            </div>
            
          </div>
        </div>
      </div>
    </div>
  </div>
</div>		
			
<!-- 		직원상세 조회 모달 끝		 -->
		
	</c:forEach>
</c:if>
                      
                      
                      <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="all-contact-0" data-bulk-select-row="data-bulk-select-row">
                            </div>
                          </td>
                          <td class="align-middle rnum text-center">1</td>
                          <td class="align-middle empNm white-space-nowrap pe-5 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <div class="avatar-name rounded-circle"><span>EW</span></div>
                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="${pageContext.request.contextPath}/emp/pbl/emply/view">하하하</a></h6>
                            </div>
                          </td>
                          <td class="align-middle empNo">E230001</td>
                          <td class="align-middle empTel font-sans-serif white-space-nowrap"><a class="text-700" href="tel:+611800861302">+61 1800 861 302</a></td>
                          <td class="align-middle empDept">인사부</td>
                          <td class="align-middle empJbgd fs-0 text-end"><span class="badge badge rounded-pill badge-subtle-secondary">결근</span>
                          </td>
                          <td class="align-middle social text-end ps-4"><a href="#!">Facebook</a>
                          </td>
                        </tr>
        
                        <tr>
                        
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="all-contact-2" data-bulk-select-row="data-bulk-select-row">
                            </div>
                          </td>
                          <td class="align-middle rnum text-center">2</td>
                          <td class="align-middle empNm white-space-nowrap pe-5 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <img class="rounded-circle" src="${pageContext.request.contextPath}/resources/assets/img/team/1-thumb.png" alt="">

                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="${pageContext.request.contextPath}/emp/pbl/emply/view">Finley</a></h6>
                            </div>
                          </td>
                          <td class="align-middle empNo">E230002</td>
                          <td class="align-middle empTel">010-4211-4148</td>
                          <td class="align-middle empDept">하우스키핑부</td>
                          <td class="align-middle empJbgd fs-0 text-end"><span class="badge bg-danger">DPM</span>
                          </td>
                          <td class="align-middle social text-end ps-4"><a href="#!">Linkedin</a>
                          </td>
                        </tr>
                        
                        
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="all-contact-3" data-bulk-select-row="data-bulk-select-row">
                            </div>
                          </td>
                        <td class="align-middle rnum text-center">3</td>
                          <td class="align-middle empNm white-space-nowrap pe-5 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <div class="avatar-name rounded-circle"><span>김은대</span></div>
                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="${pageContext.request.contextPath}/emp/pbl/emply/view">김은대</a></h6>
                            </div>
                          </td>
                          <td class="align-middle empNo">E230001</td>
                          <td class="align-middle empTel">010-4444-3355</td>
                          <td class="align-middle empDept">프론트오피스부</td>
                          <td class="align-middle empJbgd fs-0 text-end"><span class="badge bg-primary">STF</span>
                          </td>
                          <td class="align-middle social text-end ps-4">Twitter
                          </td>
                        </tr>
                        
                        
                        
                        </tbody>
                    </table>
                    <div class="text-center d-none" id="contact-table-fallback">
                      <p class="fw-bold fs-1 mt-3">No contact found</p>
                    </div>
                  </div>
                </div>
                <div class="card-footer d-flex justify-content-center">
                  <button class="btn btn-sm btn-falcon-default me-1 disabled" type="button" title="Previous" data-list-pagination="prev" disabled=""><span class="fas fa-chevron-left"></span></button>
                  <ul class="pagination mb-0"></ul>
                  <button class="btn btn-sm btn-falcon-default ms-1" type="button" title="Next" data-list-pagination="next"><span class="fas fa-chevron-right"></span></button>
                </div>
              </div>
                 
          
<!--                     전제직원 조회 끝 -->

<!-- 전체 직원 조회 상세조회 모달 -->


<!-- 직원 상세 조회 모달 끝 -->









                  </div>
                  <div class="card-body tab-pane" id="tickets" role="tabpanel" aria-labelledby="contact-tickets-tab">
<!-- 출근직원 조회 -->

<div class="mb-3" id="dclzEmpList" data-list>
                <div class="card-header border-bottom border-200 px-0">
                <div class="row flex-between-center gy-2 px-x1">현재 출근 인원 수: ${fn:length(hrmEmpDclzList)} 명</div>
                  <div class="d-lg-flex justify-content-between">
                    <div class="row flex-between-center gy-2 px-x1">
                      <div class="col-auto pe-0">
<!--                         <h6 class="mb-0">Contacts</h6> -->
                      </div>
                      <div class="col-auto">
                        <form>
                        <div class="d-flex">
                          <select class="form-select form-select-sm" aria-label="Bulk actions">
                            <option selected="">전체</option>
                            <option value="Abled">이름</option>
                            <option value="Disabled">부서</option>
                          </select>
                		<div class="input-group">
                            <input class="form-control form-control-sm shadow-none search ms-2" type="search" placeholder="검색" aria-label="search">
                            <button class="btn btn-sm btn-outline-secondary border-300 hover-border-secondary">
                            <span class="fa fa-search fs--1"></span></button>
                          </div>
                        </div>
                        

                        </form>
                      </div>
                    </div>
                    <div class="border-bottom border-200 my-3"></div>
                    <div class="d-flex align-items-center justify-content-between justify-content-lg-end px-x1">
                     
                      <div class="d-none" id="table-contact-actions">
                        <div class="d-flex">
                          <select class="form-select form-select-sm" aria-label="Bulk actions">
                            <option selected="">계정 상태 변경</option>
                            <option value="Abled">활성화</option>
                            <option value="Disabled">비활성화</option>
                            <option value="Delete">삭제</option>
                          </select>
                          <button class="btn btn-falcon-default btn-sm ms-2" type="button">삭제</button>
                        </div>
                      </div>
                      <div class="d-flex align-items-center" id="table-contact-replace-element">
                      <button class="btn btn-falcon-default btn-sm" type="button"><span class="fas fa-plus" data-fa-transform="shrink-3 down-2"></span><span class="d-none d-sm-inline-block ms-1">신규 직원 등록</span></button>
                        <button class="btn btn-falcon-default btn-sm mx-2" type="button"><span class="fas fa-external-link-alt" data-fa-transform="shrink-3"></span><span class="d-none d-sm-inline-block d-xl-none d-xxl-inline-block ms-1">Export</span></button>
                        <button class="btn btn-falcon-default btn-sm" type="button"><span class="fas fa-file-import" data--transform="shrink-3"></span><span class="d-none d-sm-inline-block d-xl-none d-xxl-inline-block ms-1">Import</span></button>
                        <div class="dropdown font-sans-serif ms-2">
                          <button class="btn btn-falcon-default text-600 btn-sm dropdown-toggle dropdown-caret-none" type="button" id="preview-dropdown" data-bs-toggle="dropdown" data-boundary="viewport" aria-haspopup="true" aria-expanded="false"><span class="fas fa-ellipsis-h fs--2"></span></button>
                          <div class="dropdown-menu dropdown-menu-end border py-2" aria-labelledby="preview-dropdown"><a class="dropdown-item" href="#!">View</a><a class="dropdown-item" href="#!">Export</a>
                            <div class="dropdown-divider"></div><a class="dropdown-item text-danger" href="#!">Remove</a>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="card-body p-0">
                  <div class="table-responsive scrollbar">
                    <table class="table table-sm fs--1 mb-0">
                      <thead class="text-800 bg-light">
                        <tr>
                          <th class="py-2 fs-0 pe-2" style="width: 28px;">
                            <div class="form-check d-flex align-items-center">
                              <input class="form-check-input" id="checkbox-bulk-tickets-select" type="checkbox" data-bulk-select='{"body":"table-contact-body","actions":"table-contact-actions","replacedElement":"table-contact-replace-element"}'/>
                            </div>
                          </th>
                          <th class="sort align-middle ps-2" data-sort="name">이름</th>
                          <th class="sort align-middle pe-5" data-sort="phone-number">전화번호</th>
                          <th class="sort align-middle pe-5" data-sort="report">부서명</th>
                          <th class="sort align-middle text-end" data-sort="subscription">근태상태</th>
                          <th class="sort align-middle text-end" data-sort="social">비고</th>
                        </tr>
                      </thead>
                      <tbody class="list" id="table-contact-body">

                      <c:if test="${not empty hrmEmpDclzList }">
                      	<c:forEach items="${hrmEmpDclzList}" var="dclz">
	                      	<tr>
	                          <td class="align-middle fs-0 py-3">
	                            <div class="form-check mb-0">
	                              <input class="form-check-input" type="checkbox" id="all-contact-0" data-bulk-select-row="data-bulk-select-row">
	                            </div>
	                          </td>
	                          <td class="align-middle name white-space-nowrap pe-5 ps-2">
	                            <div class="d-flex align-items-center gap-2 position-relative">
	                         
	                              <h6 class="mb-0"><a class="stretched-link text-900" href="${pageContext.request.contextPath}/emp/pbl/emply/view">${dclz.empNm }</a></h6>
	                            </div>
	                          </td>
	                          <td class="align-middle phone-number font-sans-serif white-space-nowrap">${dclz.empTel }</td>
	                          <td class="align-middle report">${dclz.empDept }</td>
	                          <td class="align-middle subscription fs-0 text-end"><span class="badge badge rounded-pill badge-subtle-secondary">${dclz.dclz.dclzBgnDt }</span>
	                          </td>
	                          <td class="align-middle social text-end ps-4"><a href="#!">Facebook</a>
	                          </td>
	                        </tr>
                      	</c:forEach>
                      
                      </c:if>
                      
                      
                      
                      
                      
                      
                      <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="all-contact-0" data-bulk-select-row="data-bulk-select-row">
                            </div>
                          </td>
                          <td class="align-middle name white-space-nowrap pe-5 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <div class="avatar-name rounded-circle"><span>EW</span></div>
                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="${pageContext.request.contextPath}/emp/pbl/emply/view">Emma Watson</a></h6>
                            </div>
                          </td>
                          <td class="align-middle phone-number font-sans-serif white-space-nowrap"><a class="text-700" href="tel:+611800861302">+61 1800 861 302</a></td>
                          <td class="align-middle report"><a href="#!">Analysis of the Top Customers</a></td>
                          <td class="align-middle subscription fs-0 text-end"><span class="badge badge rounded-pill badge-subtle-secondary">결근</span>
                          </td>
                          <td class="align-middle social text-end ps-4"><a href="#!">Facebook</a>
                          </td>
                        </tr>
                        
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="all-contact-2" data-bulk-select-row="data-bulk-select-row">
                            </div>
                          </td>
                          <td class="align-middle name white-space-nowrap pe-5 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <img class="rounded-circle" src="${pageContext.request.contextPath}/resources/assets/img/team/1-thumb.png" alt="">

                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="${pageContext.request.contextPath}/emp/pbl/emply/view">Finley</a></h6>
                            </div>
                          </td>
                          <td class="align-middle phone-number font-sans-serif white-space-nowrap"><a class="text-700" href="tel:+611800861302">+61 1800 861 302</a></td>
                          <td class="align-middle report"><a href="#!">Performance of Agents</a></td>
                          <td class="align-middle subscription fs-0 text-end"><span class="badge badge rounded-pill badge-subtle-info">퇴근</span>
                          </td>
                          <td class="align-middle social text-end ps-4"><a href="#!">Linkedin</a>
                          </td>
                        </tr>
                        
                        
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="all-contact-3" data-bulk-select-row="data-bulk-select-row">
                            </div>
                          </td>
                          <td class="align-middle name white-space-nowrap pe-5 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <div class="avatar-name rounded-circle"><span>PG</span></div>
                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="${pageContext.request.contextPath}/emp/pbl/emply/view">Peter Gill</a></h6>
                            </div>
                          </td>
                          <td class="align-middle phone-number font-sans-serif white-space-nowrap"><a class="text-700" href="tel:+992536632566">+99 2536 632 566</a></td>
                          <td class="align-middle report"><a href="#!">Handling Time (on Average)</a></td>
                          <td class="align-middle subscription fs-0 text-end"><span class="badge badge rounded-pill badge-subtle-success">출근</span>
                          </td>
                          <td class="align-middle social text-end ps-4"><a href="#!">Twitter</a>
                          </td>
                        </tr>
                        
                        
                        
                        </tbody>
                    </table>
                    <div class="text-center d-none" id="contact-table-fallback">
                      <p class="fw-bold fs-1 mt-3">No contact found</p>
                    </div>
                  </div>
                </div>
                <div class="card-footer d-flex justify-content-center">
                  <button class="btn btn-sm btn-falcon-default me-1 disabled" type="button" title="Previous" data-list-pagination="prev" disabled=""><span class="fas fa-chevron-left"></span></button>
                  <ul class="pagination mb-0"></ul>
                  <button class="btn btn-sm btn-falcon-default ms-1" type="button" title="Next" data-list-pagination="next"><span class="fas fa-chevron-right"></span></button>
                </div>
              </div>
<!-- 출근직원 조회  -->





                  </div>
                  <div class="card-body tab-pane" id="notes" role="tabpanel" aria-labelledby="contact-notes-tab">
<!-- 퇴사자 조회 --> 
                 <div class="mb-3" id="retiredEmpList" data-list>
                <div class="card-header border-bottom border-200 px-0">
                <div class="row flex-between-center gy-2 px-x1">총 퇴사자 수: ${fn:length(hrmEmpRtrmList)} 명</div>
                  <div class="d-lg-flex justify-content-between">
                    <div class="row flex-between-center gy-2 px-x1">
 
                      <div class="col-auto">
                        <form>
                        <div class="d-flex">
                          <select class="form-select form-select-sm" aria-label="Bulk actions" data-list-filter="data-list-filter">
                            <option selected="">전체</option>
                            <option value="E230001">이름</option>
                            
                            <option value="E230002">부서</option>
                          </select>
                		<div class="input-group">
                            <input class="form-control form-control-sm shadow-none search ms-2" type="search" placeholder="검색" aria-label="search">
                            <button class="btn btn-sm btn-outline-secondary border-300 hover-border-secondary">
                            <span class="fa fa-search fs--1"></span></button>
                          </div>
                        </div>
                        

                        </form>
                      </div>
                    </div>
                    <div class="border-bottom border-200 my-3"></div>
                    <div class="d-flex align-items-center justify-content-between justify-content-lg-end px-x1">
                     
                      <div class="d-none" id="retired-actions">
                        <div class="d-flex">
                          <select class="form-select form-select-sm" aria-label="Bulk actions">
                            <option selected="">계정 상태 변경</option>
                            <option value="Abled">활성화</option>
                            <option value="Disabled">비활성화</option>
                            <option value="Delete">삭제</option>
                          </select>
                          <button class="btn btn-falcon-default btn-sm ms-2" type="button"><span class="bi-forward-fill"></span></button>
                        </div>
                      </div>
                      <div class="d-flex align-items-center" id="retired-replace-element">
                      <button class="btn btn-falcon-default btn-sm" type="button"><span class="fas fa-plus" data-fa-transform="shrink-3 down-2"></span><span class="d-none d-sm-inline-block ms-1">신규 직원 등록</span></button>
                        <button class="btn btn-falcon-default btn-sm mx-2" type="button"><span class="fas fa-external-link-alt" data-fa-transform="shrink-3"></span><span class="d-none d-sm-inline-block d-xl-none d-xxl-inline-block ms-1">Export</span></button>
                        <button class="btn btn-falcon-default btn-sm" type="button"><span class="fas fa-file-import" data--transform="shrink-3"></span><span class="d-none d-sm-inline-block d-xl-none d-xxl-inline-block ms-1">Import</span></button>
                        <div class="dropdown font-sans-serif ms-2">
                          <button class="btn btn-falcon-default text-600 btn-sm dropdown-toggle dropdown-caret-none" type="button" id="preview-dropdown" data-bs-toggle="dropdown" data-boundary="viewport" aria-haspopup="true" aria-expanded="false"><span class="fas fa-ellipsis-h fs--2"></span></button>
                          <div class="dropdown-menu dropdown-menu-end border py-2" aria-labelledby="preview-dropdown"><a class="dropdown-item" href="#!">View</a><a class="dropdown-item" href="#!">Export</a>
                            <div class="dropdown-divider"></div><a class="dropdown-item text-danger" href="#!">Remove</a>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="card-body p-0">
                  <div class="table-responsive scrollbar">
                    <table class="table table-sm fs--1 mb-0">
                      <thead class="text-800 bg-light">
                        <tr>
                          <th class="py-2 fs-0 pe-2" style="width: 28px;">
                            <div class="form-check d-flex align-items-center">
                              <input class="form-check-input" id="checkbox-bulk-tickets-select2" type="checkbox" data-bulk-select='{"body":"retired-body","actions":"retired-actions","replacedElement":"retired-replace-element"}'/>
                            </div>
                          </th>
                          <th class="sort align-middle ps-2" data-sort="rnum">순번</th>
                          <th class="sort align-middle pe-5" data-sort="empNm">이름</th>
                          <th class="sort align-middle pe-5" data-sort="empNo">사번</th>
                          <th class="sort align-middle pe-5" data-sort="empTel">전화번호</th>
                          <th class="sort align-middle pe-5" data-sort="empDept">부서명</th>
                          <th class="sort align-middle text-end" data-sort="empJbgd">직급</th>
                          <th class="sort align-middle text-end" data-sort="social">비고</th>
                        </tr>
                      </thead>
                      <tbody class="list" id="retired-body">

                      <c:if test="${not empty hrmEmpRtrmList }">
                      	<c:forEach items="${hrmEmpRtrmList }" var="rtrm">
                      		<tr>
	                          <td class="align-middle fs-0 py-3">
	                            <div class="form-check mb-0">
	                              <input class="form-check-input" type="checkbox" id="all-contact-0" data-bulk-select-row="data-bulk-select-row">
	                            </div>
	                          </td>
	                          <td class="align-middle rnum text-center">1</td>
	                          <td class="align-middle empNm white-space-nowrap pe-5 ps-2">
	                            <div class="d-flex align-items-center gap-2 position-relative">
	                              <div class="avatar avatar-xl">
	                                <div class="avatar-name rounded-circle"><span>EW</span></div>
	                              </div>
	                              <h6 class="mb-0"><a class="stretched-link text-900" href="${pageContext.request.contextPath}/emp/pbl/emply/view">${rtrm.empNm }</a></h6>
	                            </div>
	                          </td>
	                          <td class="align-middle empNo">${rtrm.empNo }</td>
	                          <td class="align-middle empTel font-sans-serif white-space-nowrap">${rtrm.empTel }</td>
	                          <td class="align-middle empDept">${rtrm.empDept }</td>
	                          <td class="align-middle empJbgd fs-0 text-end"><span class="badge badge rounded-pill badge-subtle-secondary">${rtrm.empJbgd }</span>
	                          </td>
	                          <td class="align-middle social text-end ps-4"><a href="#!">Facebook</a>
	                          </td>
                        </tr>
                      	
                      	</c:forEach>
                      </c:if>
                      
                      <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="all-contact-0" data-bulk-select-row="data-bulk-select-row">
                            </div>
                          </td>
                          <td class="align-middle rnum text-center">1</td>
                          <td class="align-middle empNm white-space-nowrap pe-5 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <div class="avatar-name rounded-circle"><span>EW</span></div>
                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="${pageContext.request.contextPath}/emp/pbl/emply/view">더미더미더미</a></h6>
                            </div>
                          </td>
                          <td class="align-middle empNo">E230001</td>
                          <td class="align-middle empTel font-sans-serif white-space-nowrap"><a class="text-700" href="tel:+611800861302">+61 1800 861 302</a></td>
                          <td class="align-middle empDept">인사부</td>
                          <td class="align-middle empJbgd fs-0 text-end"><span class="badge badge rounded-pill badge-subtle-secondary">결근</span>
                          </td>
                          <td class="align-middle social text-end ps-4"><a href="#!">Facebook</a>
                          </td>
                        </tr>
                        
                        <tr>
                        
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="all-contact-2" data-bulk-select-row="data-bulk-select-row">
                            </div>
                          </td>
                          <td class="align-middle rnum">2</td>
                          <td class="align-middle empNm white-space-nowrap pe-5 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <img class="rounded-circle" src="${pageContext.request.contextPath}/resources/assets/img/team/1-thumb.png" alt="">

                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="${pageContext.request.contextPath}/emp/pbl/emply/view">더미더미더미</a></h6>
                            </div>
                          </td>
                          <td class="align-middle empNo">E230002</td>
                          <td class="align-middle empTel">010-4211-4148</td>
                          <td class="align-middle empDept">하우스키핑부</td>
                          <td class="align-middle empJbgd fs-0 text-end"><span class="badge bg-danger">DPM</span>
                          </td>
                          <td class="align-middle social text-end ps-4"><a href="#!">Linkedin</a>
                          </td>
                        </tr>
                        
                        
                        <tr>
                          <td class="align-middle fs-0 py-3">
                            <div class="form-check mb-0">
                              <input class="form-check-input" type="checkbox" id="all-contact-3" data-bulk-select-row="data-bulk-select-row">
                            </div>
                          </td>
                        <td class="align-middle rnum">3</td>
                          <td class="align-middle empNm white-space-nowrap pe-5 ps-2">
                            <div class="d-flex align-items-center gap-2 position-relative">
                              <div class="avatar avatar-xl">
                                <div class="avatar-name rounded-circle"><span>김은대</span></div>
                              </div>
                              <h6 class="mb-0"><a class="stretched-link text-900" href="${pageContext.request.contextPath}/emp/pbl/emply/view">더미더미더미</a></h6>
                            </div>
                          </td>
                          <td class="align-middle empNo">E230001</td>
                          <td class="align-middle empTel">010-4444-3355</td>
                          <td class="align-middle empDept">프론트오피스부</td>
                          <td class="align-middle empJbgd fs-0 text-end"><span class="badge bg-primary">STF</span>
                          </td>
                          <td class="align-middle social text-end ps-4">Twitter
                          </td>
                        </tr>
                        
                        </tbody>
                    </table>
                    <div class="text-center d-none" id="contact-table-fallback">
                      <p class="fw-bold fs-1 mt-3">No contact found</p>
                    </div>
                  </div>
                </div>
                <div class="card-footer d-flex justify-content-center">
                  <button class="btn btn-sm btn-falcon-default me-1 disabled" type="button" title="Previous" data-list-pagination="prev" disabled=""><span class="fas fa-chevron-left"></span></button>
                  <ul class="pagination mb-0"></ul>
                  <button class="btn btn-sm btn-falcon-default ms-1" type="button" title="Next" data-list-pagination="next"><span class="fas fa-chevron-right"></span></button>
                </div>
              </div>

                 <!-- 퇴사자 조회 끝 -->  

                  </div>
                </div>
              </div>
           </div>


<!--           여기가 끝 -->
<script src="<c:url value='/resources/js/app/emp/hrm/emply/empList.js'/>"></script>
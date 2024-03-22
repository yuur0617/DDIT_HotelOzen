<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags"  prefix="spring"%>


 <div class="card mt-3" id="getThis" data-div-before="before">
 			<form id="thisForm" method="post" enctype="multipart/form-data">
                <div class="card-header bg-light">
                  <h5><span>[${empNt.empNtClassification}] ${empNt.empNtNm }</span></h5>
                </div>
                <div class="card-body">
                  <div class="d-md-flex d-xl-inline-block d-xxl-flex align-items-center justify-content-between mb-x1">
                    <div class="d-flex align-items-center gap-2">
                      <div class="avatar avatar-2xl">
                        <img class="rounded-circle" src="../../assets/img/../../assets/img/team/1-thumb.png" alt="" />

                      </div>
                      <p class="mb-0"><a class="fw-semi-bold mb-0 text-800" href="../../app/support-desk/contact-details.html">${empUser.empNm }</a><span class="fs--2 text-800 fw-normal mx-2">${empUser.empDept }</span><a class="mb-0 fs--1 d-block text-500" href="mailto:emma@watson.com">아무거나@이메일.com</a></p>
                    </div>
                    <p class="mb-0 fs--2 fs-sm--1 fw-semi-bold mt-2 mt-md-0 mt-xl-2 mt-xxl-0 ms-5">등록일 : ${empNt.empNtYmd }<span class="mx-1">|</span><span class="fst-italic"></span><span class="fas fa-star ms-2 text-warning"></span></p>
                  </div>
                  <div>
                  	<div class="col-xl-12">
                  	
<!--                   	<h6 class="mb-3 fw-semi-bold text-1000">신년인사</h6> -->
                    
                    <p class="mb-0">${empNt.empNtCn }</p>
                  	
                  	</div>
                    
                
                    <div class="p-x1 bg-light rounded-3 mt-3">
                      <div class="d-inline-flex flex-column">
                      		<c:forEach items="${empNt.atchList }" var="atc">
                      			<a href='<c:url value="/emp/empnotice/download/${atc.attNo}"/>'>${atc.atcEmpFileNm }</a>
                      		</c:forEach>
                      
<!--                         <div class="border p-2 rounded-3 d-flex bg-white dark__bg-1000 fs--1 mb-2"><span class="fs-1 far fa-image"></span><span class="ms-2 me-3">broken_tv_solve.jpg (873kb)</span><a class="text-300 ms-auto" href="#!" data-bs-toggle="tooltip" data-bs-placement="right" title="Download"><span class="fas fa-arrow-down"></span></a></div> -->
<!--                         <div class="border p-2 rounded-3 d-flex bg-white dark__bg-1000 fs--1"><span class="fs-1 fas fa-file-archive"></span><span class="ms-2 me-3">broken_tv_solve.zip (342kb)</span><a class="text-300 ms-auto" href="#!" data-bs-toggle="tooltip" data-bs-placement="right" title="Download"><span class="fas fa-arrow-down"></span></a></div> -->
                      </div>
                      <hr class="my-x1" />
                      <div class="row flex-between-center gx-4 gy-2">
                        <div class="col-auto">
                          <p class="fs--1 text-1000 mb-sm-0 font-sans-serif fw-medium mb-0"><span class="fas fa-link me-2"></span>2 files attached</p>
                        </div>
                        <div class="col-auto">
                          <button class="btn btn-falcon-default btn-sm"><span class="fas fa-file-download me-2"></span>Download all</button>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                
                <div class="collapse rounded-lg transition-none" id="previewMailForm">
                  <h5 class="mb-0 p-x1 bg-light">Reply</h5>
                  <div class="border border-top-0 border-200">
                    <input class="form-control border-0 rounded-0 outline-none px-x1" id="email-to" type="email" aria-describedby="email-from" placeholder="From" value="mike@support.com" />
                  </div>
                  <div class="border border-top-0 border-200">
                    <input class="form-control border-0 rounded-0 outline-none px-x1" id="email-from" type="email" aria-describedby="email-to" placeholder="To" value="emma@watson.com" />
                  </div>
                  <div class="border border-y-0 border-200">
                    <input class="form-control border-0 rounded-0 outline-none px-x1" id="email-subject" type="text" aria-describedby="email-subject" placeholder="Subject" />
                    <textarea class="tinymce d-none" name="content"></textarea>
                  </div>
                  <div class="px-x1 py-3 bg-light">
                    <div class="d-inline-flex flex-column">
                      <div class="border p-2 rounded-3 d-flex bg-white dark__bg-1000 fs--1 mb-2"><span class="fs-1 far fa-image"></span><span class="ms-2 me-3">broken_tv_solve.jpg (873kb)</span><a class="text-300 ms-auto" href="#!" data-bs-toggle="tooltip" data-bs-placement="right" title="Detach"><span class="fas fa-times"></span></a></div>
                      <div class="border p-2 rounded-3 d-flex bg-white dark__bg-1000 fs--1"><span class="fs-1 fas fa-file-archive"></span><span class="ms-2 me-3">broken_tv_solve.zip (342kb)</span><a class="text-300 ms-auto" href="#!" data-bs-toggle="tooltip" data-bs-placement="right" title="Detach"><span class="fas fa-times"></span></a></div>
                    </div>
                  </div>
                  <div class="d-flex align-items-center justify-content-between px-x1 py-3">
                    <div class="d-flex align-items-center">
                      <button class="btn btn-primary btn-sm px-4 me-2" type="submit">Send</button>
                      <input class="d-none" id="email-attachment" type="file" />
                      <label class="me-2 btn btn-light btn-sm mb-0 cursor-pointer" for="email-attachment" data-bs-toggle="tooltip" data-bs-placement="top" title="Attach files"><span class="fas fa-paperclip fs-1" data-fa-transform="down-2"></span></label>
                      <input class="d-none" id="email-image" type="file" accept="image/*" />
                      <label class="btn btn-light btn-sm mb-0 cursor-pointer" for="email-image" data-bs-toggle="tooltip" data-bs-placement="top" title="Attach images"><span class="fas fa-image fs-1" data-fa-transform="down-2"></span></label>
                    </div>
                    <div class="d-flex align-items-center">
                      <div class="dropdown font-sans-serif me-2 btn-reveal-trigger">
                        <button class="btn btn-link text-600 btn-sm dropdown-toggle btn-reveal dropdown-caret-none" id="email-options" type="button" data-bs-toggle="dropdown" data-boundary="viewport" aria-haspopup="true" aria-expanded="false"><span class="fas fa-ellipsis-v" data-fa-transform="down-2"></span></button>
                        <div class="dropdown-menu dropdown-menu-end border py-2" aria-labelledby="email-options"><a class="dropdown-item" href="#!">Print</a><a class="dropdown-item" href="#!">Check spelling</a><a class="dropdown-item" href="#!">Plain text mode</a>
                          <div class="dropdown-divider"></div><a class="dropdown-item" href="#!">Archive</a>
                        </div>
                      </div>
                      <button class="btn btn-light btn-sm" type="button" data-bs-toggle="tooltip" data-bs-placement="top" title="Delete" data-dismiss="collapse"><span class="fas fa-trash"></span></button>
                    </div>
                  </div>
                </div>
                <div class="card-footer bg-light" id="preview-footer">
                  <button onclick="fnGoList()" class="btn btn-falcon-default btn-sm fs--1" type="button" ><span class="fas fa-reply"></span><span class="d-none d-sm-inline-block ms-1">목록조회</span></button>
                  <button class="btn btn-falcon-default btn-sm fs--1" type="button" ><span class="far fa-edit"></span><span class="d-none d-sm-inline-block ms-1">수정하기</span></button>
                  <button data-emp-nt-no="${empNt.empNtNo }" id="delBtn" onclick="fnDelete()" class="btn btn-falcon-default btn-sm fs--1" type="button" ><span class="fas fa-trash"></span><span class="d-none d-sm-inline-block ms-1">삭제하기</span></button>
<!--                   <button class="btn btn-falcon-default btn-sm fs--1" type="button" data-bs-toggle="collapse" data-bs-target="#previewMailForm" aria-expanded="false" aria-controls="previewMailForm"><span class="fas fa-reply"></span><span class="d-none d-sm-inline-block ms-1">Reply</span></button> -->
<!--                   <button class="btn btn-falcon-default btn-sm fs--1 mx-2" type="button" data-bs-toggle="collapse" data-bs-target="#previewMailForm" aria-expanded="false" aria-controls="previewMailForm"><span class="fas fa-location-arrow"></span><span class="d-none d-sm-inline-block ms-1">Forward</span></button> -->
<!--                   <button class="btn btn-falcon-default btn-sm fs--1" type="button" data-bs-toggle="collapse" data-bs-target="#previewMailForm" aria-expanded="false" aria-controls="previewMailForm"><span class="fas fa-file-alt"></span><span class="d-none d-sm-inline-block ms-1">Add Note</span></button> -->
                </div>
              </div>
              
<!--               삭제확인 토스트 -->
              <div id="delCheck" style="display:none" class="toast show align-items-center" role="alert" data-bs-autohide="false" aria-live="assertive" aria-atomic="true">
				  <div class="d-flex">
				    <div class="toast-body">삭제하면 되돌릴 수 없습니다.</br> 그래도 삭제하시겠습니까?</div>
				    <button class="btn-close me-2 m-auto" type="button" data-bs-dismiss="toast" aria-label="Close"></button>
				  </div>
				  <div class="mt-2 p-3 border-top">
				    <button class="btn btn-primary btn-sm" type="button">삭제하기</button>
				    <button class="btn btn-secondary btn-sm ms-2" type="button" data-bs-dismiss="toast">닫기</button>
				  </div>
		      </form>
			</div>
			
			
			
<script>
const cPath = document.body.dataset.contextPath;
var url = `\${cPath}/emp/hrm/empnotice`

</script>

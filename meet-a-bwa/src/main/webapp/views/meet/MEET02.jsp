<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="test.com.meetboard.model.MeetBoardVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/meet-a-bwa/resources/css/common/common.css" />
<link rel="stylesheet" href="/meet-a-bwa/resources/css/common/header.css" />

<link rel="stylesheet" href="/meet-a-bwa/resources/css/main/main.css" />

<link rel="stylesheet" href="/meet-a-bwa/resources/css/meet/searchBar.css" />
<link rel="stylesheet" href="/meet-a-bwa/resources/css/meet/meet-detail.css" />
<link rel="stylesheet" href="/meet-a-bwa/resources/css/meet/feed.css" />
<link rel="stylesheet" href="/meet-a-bwa/resources/css/meet/post-detail.css" />
<link rel="stylesheet" href="/meet-a-bwa/resources/css/meet/post-writer.css" />
<link rel="stylesheet" href="/meet-a-bwa/resources/css/meet/post-update.css" />
<link rel="stylesheet" href="/meet-a-bwa/resources/css/meet/post-delete.css" />

<script src="/meet-a-bwa/resources/js/common/jquery-3.6.1.min.js"></script>
<script src="/meet-a-bwa/resources/js/common/header.js"></script>
<script src="/meet-a-bwa/resources/js/meet/delete-popup.js"></script>
<script src="/meet-a-bwa/resources/js/meet/post-write-popup.js"></script>


<title>모임 피드</title>
</head>
<body>

	<!--  START HEADER INCLUDE -->
	<jsp:include page="/views/common/header.jsp"></jsp:include>
	<!--  END HEADER INCLUDE -->

	<div id="bodyWrap">
		<div id="contentWrapRow">
			<aside class="meet-detail-aside">
				<div class="meet-profile-img">
					<img src="/meet-a-bwa/resources/img/sample/sample-img-01.png"
						alt="샘플 대표 이미지" />
				</div>
				<div class="meet-detail-aside-top">
					<h1 class="meet-deatil-aside-title">금요일은 소고기 먹는 날 날날날날날날</h1>
					<div class="heart-common">
						<img class="img-heart-filled"
							src="/meet-a-bwa/resources/img/heart-filled.svg" alt="좋아요 이미지" />
						<img class="img-heart-outlined blind"
							src="/meet-a-bwa/resources/img/heart-outlined.svg"
							alt="좋아요 테두리 이미지" /> <span>9789</span>
					</div>
				</div>
				<div class="meet-summary-info">
					<p>
						<a href="/meet-a-bwa/meet-member.do">멤버 22명</a>
					</p>
					<p>리더 팡근</p>
				</div>

				<div class="tagSection">
					<div class="loca_tag tag">
						<img src="/meet-a-bwa/resources/img/map.png" class="tag_img" /> <span
							class="location_name font_size_10">경안동</span>
					</div>
					<div class="cate_tag tag">
						<span class="category_name font_size_10">자전거</span>
					</div>
				</div>

				<!-- 로그인 전 -->
				<!-- <button type="button" class="btn-meet join"> -->
				<button type="button" class="blind">
					<a href="#">모임 가입하기</a>
				</button>

				<!-- 로그인 후 -->
				<button type="button" class="btn-meet join" onclick="writePopupShow()">
					글쓰기</button>
				<button type="button" class="btn-meet join">
					<a href="">액티비티 개설</a>
				</button>

				<a class="meet-detail-link" href="./meet-info-detail.html">모임
					자세히 보기</a>
			</aside>

			<section class="feedWrap">
				<article>
					<!--  START SEARCHBAR INCLUDE -->
					<jsp:include page="/views/common/searchBar.jsp"></jsp:include>
    				<!--  END SEARCHBAR INCLUDE -->
					<div class="meet-notification">
						<div class="notification-title">
							<h3>공지</h3>
							<a href="./post-detail.html">
								<p>공지내용 공지내용 공지내용 공지내용 공지내용공지내용 공지내용 공지내용 공지내용 공지내용공지내용 공지내용
									공지내용 공지내용 공지내용공지내용 공지내용 공지내용 공지내용 공지내용</p>
							</a>
						</div>
					</div>
					<!-- end meet-notification -->

					<div class="all-feed">
					
						<c:choose>
						<c:when test="${ empty vos }">
							<div class="feed-empty">
				                <h1>현재 모임에 작성된 글이 없어요!</h1>
				                <p>모임에 글을 작성해 소통해봐요!</p>
				            </div>
						</c:when>
						<c:when test="${ not empty vos }">
						<c:forEach var="vo" items="${ vos }">
						<div class="feed">
							<div class="feed-profile">
								<div class="user-info">
									<div>
										<img src="/meet-a-bwa/resources/img/loopy.svg" alt="프로필 이미지" />
									</div>
									<p class="user-nickname">${ vo.user_name }</p>
									<p class="write-date">${ vo.board_date }</p>
								</div>

								<div class="post-more-select">
									<img class="img-more" src="/meet-a-bwa/resources/img/more.svg" alt="" />

									<ul class="post-option-list" idx="${ vo.board_no }">
										<li class="post-option-item" data-popup-open="update">수정하기</li>
										<li class="post-option-item" data-popup-open="delete">
											삭제하기</li>
									</ul>
								</div>
							</div>
							<div class="feed-post">
								<a href="b_selectOne.do?board_no=${ vo.board_no }">
									<p>${ vo.board_content }</p>
								</a>
							</div>
							<div class="feed-options">
								<p>
									<a href="#">댓글</a>
								</p>
							</div>
						</div>
						<!-- end one feed -->
						</c:forEach>
						</c:when>
						</c:choose>
					</div>
					<!-- end all feed -->
				</article>
			</section>
			<aside class="meet-right-aside">
          <div class="right-summary-list" id="event-summary-list">
            <div class="right-summary-list-top">
              <h1>모임 내 액티비티</h1>
              <p><a href="#">+</a></p>
            </div>
            <ul class="right-summary-list-contents">
              <li>
                <a href="">액티비티1</a>
              </li>
              <li>
                <a href="">액티비티2</a>
              </li>
              <li>
                <a href="">액티비티3</a>
              </li>
              <li>
                <a href="">액티비티4</a>
              </li>
              <li>
                <a href="">액티비티5</a>
              </li>
              <li>
                <a href="">액티비티6</a>
              </li>
            </ul>
          </div>
          <div class="right-summary-list" id="vote-summary-list">
            <div class="right-summary-list-top">
              <h1>투표</h1>
              <p><a href="/meet-a-bwa/m_vote_create.do">+</a></p>
            </div>
            <ul class="right-summary-list-contents">
              <li>
                <a href="">투표 1</a>
              </li>
              <li>
                <a href="">투표 2</a>
              </li>
              <li>
                <a href="">투표 3</a>
              </li>
              <li>
                <a href="">투표 4</a>
              </li>
              <li>
                <a href="">투표 5</a>
              </li>
            </ul>
          </div>
        </aside>
		</div>
	</div>
</body>

<!-- ==================================== -->
<!-- 글쓰기 view 팝업 -->
<!-- ==================================== -->
<div class="write-popup-layer">
	<div class="popup-box">
		<div class="popup-top">
        	<h1>글쓰기</h1>
        </div>
        <div class="popup-writer">
          	<form action="b_insertOK.do" method="post" class="popup-writer">
            	<input name="board_title" type="text" placeholder="제목" />
	            <textarea
	              name="board_content"
	              id="content"
	              placeholder="내용을 입력하세요."
	            ></textarea>
	            
	            <div class="popup-btn-group">
		         	<button type="button" class="btn-cancel" onclick="writePopupHide()">취소</button>
		          	<button type="submit" class="btn-submit">게시</button>
		        </div>
          	</form>
        </div>
	</div>
</div>

<!-- ==================================== -->
<!-- 글 업데이트 view 팝업 -->
<!-- ==================================== -->
<div class="update-popup-layer" data-popup="update">
	<div class="popup-box">
		<div class="popup-top">
        	<h1>글 수정</h1>
        </div>
        <div class="popup-writer" id="popup-update">
            	<input name="update_title" id="update_title" type="text" placeholder="제목" value="${ vo.board_title }"/>
	            <textarea
	              name="update_content"
	              id="update_content"
	              placeholder="내용을 입력하세요."
	            >${ vo.board_content }</textarea>
	            
	            <div class="popup-btn-group">
		         	<button type="button" class="btn-cancel" data-popup-close="update">취소</button>
		          	<button type="submit" class="btn-submit-update">게시</button>
		        </div>
        </div>
	</div>
</div>

<!-- *******************  -->
<!-- delete popup SECTION -->
<!-- *******************  -->
  <div class="delete-popup-layer" data-popup="delete">
    <div class="delete-popup-wrap">
      <img src="/meet-a-bwa/resources/img/worry.svg" alt="" />
      <h1>정말 삭제 하시겠습니까?</h1>

      <div class="btn-group">
        <button id="btn-delete" class="btn-delete" data-popup-close="delete">삭제</button>
        <button class="btn-cancel" data-popup-close="delete">취소</button>
      </div>
    </div>
  </div>
</html>
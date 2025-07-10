<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- Bootstrap JS -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<div class="jumbotron text-center">
    <h1>데이터 분석 SW엔지니어 양성과정</h1>
    <p>게시글 상세 보기</p>
</div>

<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading">데이터분석과정 게시판</div>
        <div class="panel-body">
            <table class="table table-bordered table-striped">
                <tr>
                    <th>제목</th>
                    <td>${board.title}</td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td>${board.writer}</td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td style="white-space: pre-line;">${board.content}</td>
                </tr>
                <tr>
                    <th>작성일</th>
                    <td>
                        <fmt:formatDate value="${board.indate}" pattern="yyyy-MM-dd HH:mm"/>
                    </td>
                </tr>
                <tr>
                    <th>조회수</th>
                    <td>${board.bcnt}</td>
                </tr>
            </table>
            <div class="text-right">
                <button class="btn btn-primary" onclick="location.href='/web/'">목록으로</button>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript">
	// 여기가 js 작성하는 공간
	
	// 비동기 통신 사용하자
	
	
	// 요청할 url : count
	// 보내줘야할 데이터 : bnum
	// 성공했을때, 화면에 조회수를 1증가시킨 상태로 변경
	
	
	$(function () {

		const bnum = "{board.bnum}";
		
            $.ajax({
            	// 1. 요청 url
            	// /web/ --> Context path를 동적으로 꺼내오고 싶다면
            	// core 태그 사용해서 데이터 꺼내서 변수 생성하기
                url: '/web/count',
                // 2. 전송할 데이터 지정
                // 랜더링 순서 : JSP -> .java -> .class -> .html(js도 이때 랜더링 된다)
                data : {bnum:'${board.bnum}'},
                // 3. 성공했을 때 실행함수
                success: () =>{
                    // 3-1. id가 bcnt인 태그를 가져오가ㅣ
                    let bcnt = $('#bcnt').text();
                    console.log(bcnt);
                    // 3-2. 해당하는 태그 안족에 있는 글자를 가져와서 +1 증가시키기.
                    $('#bcnt').text(Number(bcnt)+1);
                },
                // 4. 실패했을 대 실행함수
                error: (e) => {
                    console.log(e);
                }
            });
        });

</script>

</body>
</html>

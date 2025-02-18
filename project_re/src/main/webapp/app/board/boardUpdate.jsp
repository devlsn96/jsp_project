<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<style>
	        .container {
	            max-width: 1100px;
	            margin: 0 auto;
	            padding: 20px;
	        }
	        input, textarea {
	            width: 100%;
	            padding: 10px;
	            margin-top: 10px;
	            box-sizing: border-box;
	        }
	        .button-container {
	            margin-top: 20px;
	            text-align: center;
	        }
	        .btn-submit {
	            background-color: #28a745;
	            color: white;
	            padding: 10px 20px;
	            border: none;
	            border-radius: 4px;
	            cursor: pointer;
	        }
	        .btn-submit:hover {
	            background-color: #218838;
	        }
	</style>
</head>
<body>
	<div class="container">
	    <h2>게시글 수정</h2>
	
	    <form action="${pageContext.request.contextPath}/board/UpdateBoard.bo" method="post">
	        <input type="hidden" name="boardid" value="${board.boardid}">
	
	        <!-- 수정할 게시글 제목 -->
	        <label for="title">제목</label>
	        <input type="text" id="title" name="title" value="${board.title}" required>
	
	        <!-- 수정할 게시글 내용 -->
	        <label for="content">내용</label>
	        <textarea id="content" name="content" rows="10">${board.content}</textarea>
	
	        <!-- 수정 완료 버튼 -->
	        <div class="button-container">
	            <button type="submit" class="btn-submit">수정 완료</button>
	        </div>
	    </form>
	</div>
</body>
</html>
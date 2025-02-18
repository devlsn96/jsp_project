<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 상세 보기</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 20px;
        }
        .content-container {
            width: 70%;
            margin: 0 auto;
            padding: 20px;
            background-color: white;
            border: 1px solid #ddd;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #35C5F0; /* 헤더 색상 */
            color: white; /* 헤더 글자 색상 */
        }
        .field-label {
            font-weight: bold;
        }
        .field-value {
            margin-bottom: 10px;
        }
        .content-value {
            height: 300px; /* 내용 칸의 높이 증가 */
            vertical-align: top; /* 내용 상단 정렬 */
            overflow-y: auto; /* 내용이 길 경우 스크롤 가능 */
        }
        .link-container {
            text-align: right; /* 오른쪽 정렬 */
            margin-top: 20px; /* 위쪽 여백 */
        }
        .link-container a {
            color: #35C5F0; /* 링크 색상 */
            text-decoration: none; /* 링크 밑줄 제거 */
            padding: 5px 10px; /* 패딩 추가 */
            border: 1px solid #35C5F0; /* 테두리 색상 */
            border-radius: 5px; /* 테두리 둥글게 */
            transition: background-color 0.3s, color 0.3s; /* 부드러운 전환 효과 */
        }
        .link-container a:hover {
            background-color: #35C5F0; /* hover 시 배경 색상 */
            color: white; /* hover 시 글자 색상 */
        }
    </style>
</head>
<body>

<div class="content-container">
    <h2>게시글 상세 보기</h2>
    <c:set var="board" value="${requestScope.boardDetail}" />
    
    <table>
        <tr>
            <th class="field-label">제목</th>
            <td class="field-value">${board.title}</td> <!-- 제목 -->
        </tr>
        <tr>
            <th class="field-label">작성자</th>
            <td class="field-value">${board.userID}</td> <!-- 작성자 -->
        </tr>
        <tr>
            <th class="field-label">내용</th>
            <td class="content-value">${board.content}</td> <!-- 내용 칸만 크게 -->
        </tr>
    </table>
    
    <div class="link-container">
        <a href="/board/BoardList.no">목록</a> <!-- 목록 링크 -->
    </div>
</div>

</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>주문 완료</title>
    <style>
        .complete-message {
            text-align: center;
            margin-top: 100px;
        }
        .complete-message h2 {
            font-size: 24px;
            color: #333;
        }
        .complete-message p {
            font-size: 18px;
            margin-top: 20px;
        }
        .btn-confirm {
            display: inline-block;
            margin-top: 30px;
            padding: 10px 20px;
            background-color: #007bff; /* 파란색 배경 */
            color: white; /* 흰색 글씨 */
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
    </style>
    <script>
        function goToIndex() {
            // 메인 페이지로 이동
            window.location.href = "/index.jsp";
        }
    </script>
</head>
<body>
    <div class="complete-message">
        <h2>주문이 완료되었습니다!</h2>
        
        <button class="btn-confirm" onclick="goToIndex()">확인</button>
    </div>
</body>
</html>

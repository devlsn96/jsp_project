<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="chat.dao.ChatDAO"%>
<%@page import="chat.dao.ChatDTO"%>
<%@ page import="java.util.*" %>
<html>
<head>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 20px;
            overflow-x: hidden; /* 가로 스크롤 숨기기 */
        }
        
        
        
        .chat-message {
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
            word-wrap: break-word; /* 긴 단어가 줄바꿈 되도록 설정 */
            max-width: 90%; /* 메시지 박스의 최대 너비 */
        }
        
        .chat-message.sender {
            background-color: #40C4FF;
            text-align: left;
            margin-left: auto; /* 보낸 메시지는 오른쪽 정렬 */
        }
        
        .chat-message.receiver {
            background-color: #E0F2F1;
            text-align: left;
            margin-right: auto; /* 받은 메시지는 왼쪽 정렬 */
        }

        .chat-empty, .chat-error {
            text-align: center;
            color: #666;
            font-style: italic;
        }
        
        .chat-header {
            text-align: center;
            margin-bottom: 20px;
        }

        .chat-header h2 {
            margin: 0;
            color: #333;
        }
    </style>
    <script>
        window.onload = function() {
            // 함수 호출
            loadMessages();
        };

        function sendMessage() {
            var message = document.getElementById('message').value;
            var sendID = document.getElementById('sendID').value;
            var userID = document.getElementById('userID').value;

            var xhr = new XMLHttpRequest();
            xhr.open('POST', 'sendMessage.jsp', true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

            xhr.onload = function() {
                loadMessages(userID);  // 메시지 전송 후 채팅창 업데이트
            };

            xhr.send('userID=' + encodeURIComponent(userID) + '&sendID=' + encodeURIComponent(sendID) + '&message=' + encodeURIComponent(message));
            
            document.getElementById('message').value = '';  // 입력 필드 초기화
        }

        function loadMessages(userID) {
            var xhr = new XMLHttpRequest();
            xhr.open('POST', 'getMessages.jsp', true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xhr.onload = function() {
                var chatbox = document.getElementById('chatbox');
                chatbox.innerHTML = xhr.responseText;  // 채팅창에 메시지 표시
                
                // 스크롤을 맨 아래로 이동
                chatbox.scrollTop = chatbox.scrollHeight;
            };
            xhr.send('userID=' + encodeURIComponent(userID));
        }
    </script>
</head>
<body>

            <!-- 채팅 메시지가 여기에 표시됨 -->
            <%
                String userID = request.getParameter("userID");
            	
            	String loginID = (String) session.getAttribute("user_id");
        		System.out.println("loginID: " +userID);

                // Null 또는 빈 문자열 또는 undefined 상태인 경우를 체크
                if (userID != null && !userID.isEmpty()) {
                    // 정상적으로 userID가 있는 경우 채팅 메시지 처리
                    List<ChatDTO> chat = new ChatDAO().getChatList(userID);
                    if (chat != null && !chat.isEmpty()) {
                        for (int i = 0; i < chat.size(); i++) {
                            // 보낸 사람과 받은 사람에 따라 메시지 스타일 다르게 설정
                            String messageClass = (chat.get(i).getSendID().equals(loginID)) ? "sender" : "receiver";
                            out.println("<div class='chat-message " + messageClass + "'>" 
                                        + chat.get(i).getSendID() + ": " + chat.get(i).getMessage() + "</div>");
                        }
                    } else {
                        // 메시지가 없는 경우
                        out.println("<div class='chat-empty'>채팅 메시지가 없습니다.</div>");
                    }
                } else {
                    // userID가 null이거나 빈 문자열일 때
                    out.println("<div class='chat-error'>채팅방 ID가 제공되지 않았습니다.</div>");
                }
            %>
        </div>
    </div>
</body>
</html>

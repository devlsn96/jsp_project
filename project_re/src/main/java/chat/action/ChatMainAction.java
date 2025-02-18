package chat.action;

import chat.dao.ChatDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class ChatMainAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
        ActionForward forward = new ActionForward();
        ChatDAO cdao = new ChatDAO();
        
        // 세션에서 user_id 값 가져오기
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("user_id");
        
        System.out.println("user_id : " + userId);

        // userId 값을 request 객체에 저장
        request.setAttribute("userId", userId);
        
        // chatmain.jsp로 포워딩
        forward.setPath("/chat/chatmain.jsp");
        forward.setRedirect(false); // forward 이동
        
        return forward;
    }
}
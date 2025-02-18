/**
 * 회원가입 폼 value 확인하는 자바스크립트
 */
function sendit() {
    // 태그 호출
    let frm = document.joinForm;
    // 입력값 가져오기
    let user_id = frm.user_id;
    let password = frm.password;
    let password_re = frm.password_re;
    let name = frm.name;
    let email = frm.email;
    let nickname = frm.nickname;
    let tel = frm.tel;
    
    let validation = function val() {
        // 아이디 빈값 처리
        if (user_id.value == "") {
            alert("아이디를 입력해주세요");
            user_id.focus();
            return false;
        }
        // 아이디 영문자만 허용 체크
		const idPattern = /^[a-zA-Z0-9]+$/; // 영문자와 숫자만 허용하는 정규 표현식
		       if (!idPattern.test(user_id.value)) {
		           alert("아이디는 영문자와 숫자만 입력 가능합니다.");
		           user_id.focus();
		           return false;
		       }
        // 비밀번호 빈값 처리
        if (password.value == "") {
            alert("비밀번호를 입력해주세요");
            password.focus();
            return false;
        }
        // 비밀번호 길이 및 형식 체크
        if (password.value.length < 8 || !/(?=.*[a-zA-Z])(?=.*[0-9])/.test(password.value)) {
            alert("비밀번호는 8자리 이상이며 영문과 숫자를 포함해야 합니다.");
            password.focus();
            return false;
        }
        // 비밀번호 확인이 비밀번호와 일치하는지 체크
        if (password.value !== password_re.value) {
            alert("비밀번호가 일치하지 않습니다.");
            password_re.focus();
            return false;
        }
        // 이름 빈값 처리
        if (name.value == "") {
            alert("이름을 입력해주세요");
            name.focus();
            return false;
        }
        // 이메일 빈값 처리
        if (email.value == "") {
            alert("이메일을 입력해주세요");
            email.focus();
            return false;
        }
        // 이메일 형식 체크
        const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailPattern.test(email.value)) {
            alert("유효한 이메일 주소를 입력해주세요");
            email.focus();
            return false;
        }
        // 닉네임 빈값 처리
        if (nickname.value == "") {
            alert("닉네임을 입력해주세요");
            nickname.focus();
            return false;
        }
        // 닉네임 2 이상 20자 이하 처리
        if (nickname.value.length < 2 || nickname.value.length > 20) {
            alert("닉네임을 2자 이상 20자 이하로 입력해주세요");
            nickname.focus();
            return false;
        }
        // 휴대폰 번호 빈값 처리
        if (tel.value == "") {
            alert("휴대폰번호를 입력해주세요");
            tel.focus();
            return false;
        }
        // 휴대폰 번호 형식 체크 (숫자만 입력되었는지 확인)
        const telPattern = /^[0-9]+$/;
        if (!telPattern.test(tel.value)) {
            alert("휴대폰번호는 숫자만 입력해주세요");
            tel.focus();
            return false;
        }
        return true;
    }
    // 폼으로 전달
    if (validation()) {
        alert("회원가입이 완료되었습니다.");
        frm.submit();
    } 		else {
		       return false; // 검증 실패 시 제출 중단
		   }
}

let idCheckInProgress = false; // 중복 체크 진행 상태 플래그

function checkId() {
    const user_id = document.querySelector('#user_id').value.trim();

    // 아이디가 입력되지 않았을 때 처리
    if (user_id === "") {
        alert("아이디를 입력해주세요.");
        document.querySelector('#user_id').focus();
        return; // 중복확인 요청 중단
    }

    // 아이디 영문자와 숫자만 허용 체크
    const idPattern = /^[a-zA-Z0-9]+$/; // 영문자와 숫자만 허용하는 정규 표현식
    if (!idPattern.test(user_id)) {
        alert("아이디는 영문자와 숫자만 입력 가능합니다.");
        document.querySelector('#user_id').focus();
        return; // 중복확인 요청 중단
    }

    // 중복 확인 요청이 진행 중인지 확인
    if (idCheckInProgress) {
        alert("중복 확인 요청이 이미 진행 중입니다.");
        return; // 중복 확인 요청이 이미 진행 중이면 중단
    }

    idCheckInProgress = true; // 중복 확인 요청 시작

	// 아이디 중복확인 요청, post방식으로 /user/UserCheckId.us에서 로직처리
	const xhr = new XMLHttpRequest();
	xhr.open('POST', '/user/UserCheckId.us', true);
	xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");	
	xhr.onreadystatechange = function () {
    	if (xhr.readyState === 4) {
        	idCheckInProgress = false; // 요청 완료, 플래그 초기화
            if (xhr.status === 200) {
                // 서버에서 반환된 결과를 alert으로 표시
                alert(xhr.responseText);
            } 
    	}
	}
	xhr.send("user_id=" + encodeURIComponent(user_id));
}
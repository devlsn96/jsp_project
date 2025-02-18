const writeBt = document.querySelector('.header-upper__writeBt');
const writeMenu = document.querySelector('.header-upper__lists');

// 버튼 클릭 시 메뉴 열기 및 닫기
writeBt.addEventListener("click", (event) => {
  event.stopPropagation(); // 클릭 이벤트가 상위로 전파되지 않도록
  writeMenu.classList.toggle('openWriteMenu'); // 메뉴를 열거나 닫기
});

// 외부 클릭 시 메뉴 닫기
window.addEventListener("click", (event) => {
  if (!writeMenu.contains(event.target) && event.target !== writeBt) {
    writeMenu.classList.remove('openWriteMenu');
  }
});

// 디버깅용 콘솔 로그
console.log(writeBt, writeMenu);

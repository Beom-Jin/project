// ===================== 쿠키 관리 =====================
function setCookie(name, value, days) {
  const date = new Date();
  date.setDate(date.getDate() + days);
  document.cookie = `${name}=${value}; expires=${date.toUTCString()}; path=/`;
}

function getCookie(name) {
  const value = `; ${document.cookie}`;
  const parts = value.split(`; ${name}=`);
  if (parts.length === 2) return parts.pop().split(";").shift();
  return null;
}

// ===================== 팝업 닫기 =====================
function closePopup(id) {
  const popup = document.getElementById(id);
  if (!popup) return;

  popup.classList.add("hidden");

  // 오늘 하루 보지 않기 체크 시 쿠키 저장
  const checkbox = popup.querySelector("input[type='checkbox']");
  if (checkbox && checkbox.checked) {
    setCookie(id + "_hide", "true", 1);
  }
}

// ===================== 페이지 로드 시 팝업 표시 =====================
window.addEventListener("DOMContentLoaded", () => {
  // 중앙 공지 팝업
  if (!getCookie("popupNotice_hide")) {
    document.getElementById("popupNotice").classList.remove("hidden");
  }

  // 광고 팝업
  if (!getCookie("popupAd_hide")) {
    document.getElementById("popupAd").classList.remove("hidden");
  }
});

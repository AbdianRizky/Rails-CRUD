var btnUser = document.getElementById("user-btn");
var menuUser = document.getElementById("user-menu");

btnUser.addEventListener("click", (e) => {
  e.preventDefault();
  // console.log(menuUser.classList.contains("hidden"));
  if (menuUser.classList.contains("hidden")) {
    menuUser.classList.remove("hidden");
  } else {
    menuUser.classList.add("hidden");
  }
});

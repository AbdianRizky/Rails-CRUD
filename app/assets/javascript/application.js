var btnUser = document.getElementById("user-btn");
var menuUser = document.getElementById("user-menu");
var btnDelete = document.getElementById("delete-btn");
var modalDelete = document.getElementById("delete-modal");
var closeModalDelete = document.getElementById("close-modal-btn");

btnUser.addEventListener("click", (e) => {
  e.preventDefault();
  // console.log(menuUser.classList.contains("hidden"));
  if (menuUser.classList.contains("hidden")) {
    menuUser.classList.remove("hidden");
  } else {
    menuUser.classList.add("hidden");
  }
});

btnDelete.addEventListener("click", (e) => {
  e.preventDefault();
  console.log(modalDelete.classList.contains("hidden"));
  if (modalDelete.classList.contains("hidden")) {
    modalDelete.classList.remove("hidden");
  }
});

closeModalDelete.addEventListener("click", (e) => {
  e.preventDefault();
  modalDelete.classList.add("hidden");
});

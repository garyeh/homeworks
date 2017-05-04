document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  const submitFavorite = (e) => {
    e.preventDefault();
    const input = document.querySelector(".favorite-input");
    const favorite = input.value;
    input.value = "";

    const li = document.createElement("li");
    li.textContent = favorite;
    document.getElementById("sf-places").appendChild(li);
  };

  document.querySelector(".favorite-submit")
    .addEventListener("click", submitFavorite);



  // adding new photos

  const showPhotoForm = (e) => {
     const photoForm = document.querySelector(".photo-form-container");
     if (photoForm.className === "photo-form-container") {
       photoForm.className = "photo-form-container hidden";
     } else {
       photoForm.className = "photo-form-container";
     }
   };

  document.querySelector(".photo-show-button")
     .addEventListener("click", showPhotoForm);

  const submitPhoto = (e) => {
    e.preventDefault();
    const input = document.querySelector(".photo-url-input");
    const url = input.value;
    input.value = "";

    const img = document.createElement("img");
    const li = document.createElement("li");
    img.src = url;
    li.appendChild(img);

    document.querySelector(".dog-photos").appendChild(li);
  }

  document.querySelector(".photo-url-submit")
    .addEventListener("click", submitPhoto);

});

var photo = document.getElementById("choco");
photo.style.border = "4px solid black";

function changeToGif() {
  var photo = document.getElementById("choco");
  console.log("click happened, here is the event:");

  if (photo.src.indexOf("giphy.gif") != -1) {
    photo.src = "choco.jpg";
  } else if (photo.src.indexOf("choco.jpg") != -1) {
    photo.src = "giphy.gif";
  } else {
    console.log('Checks not working!');
  }
  console.log(photo.src);
}
var button = document.getElementById("animate");
button.addEventListener("click", changeToGif);
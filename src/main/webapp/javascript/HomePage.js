const locations = [
  "assets/yellow-car-gas-station_23-2150697544.avif",
  "assets/blue-jeep-photo-shooting-sunset_114579-4043.jpg",
 
];

let currentIndex = 0;
let intervalId = null;

function Imgchange() {
  const imgElement = document.getElementById("imageSlider");
  if (imgElement) {
    imgElement.src = locations[currentIndex];
  }
}

function startImageChange() {
  if (intervalId) {
    clearInterval(intervalId);
  }
  Imgchange();
  intervalId = setInterval(() => {
    currentIndex = (currentIndex + 1) % locations.length;
    Imgchange();
  }, 1000);
}

function stopImageChange() {
  if (intervalId) {
    clearInterval(intervalId);
    intervalId = null;
  }
}

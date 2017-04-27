// Simple Timeout

// window.setTimeout(function () {
//   alert('HAMMERTIME');
// }, 5000);

// Timeout Plus Closure

const hammerTime = (time) => {
  window.setTimeout(function () {
    alert(`${time} is hammertime!`);
  }, time * 1000);
};

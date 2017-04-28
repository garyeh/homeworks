document.addEventListener("DOMContentLoaded", function(){
  let canvas = document.getElementById('mycanvas');
  let ctx = canvas.getContext('2d');

  // Rectangle
  ctx.fillStyle = 'rgb(0,200,0)';
  ctx.fillRect(0, 0, 50, 50);

  // Circle
  ctx.beginPath();
  ctx.arc(150, 150, 50, 0, 2 * Math.PI);
  ctx.strokeStyle = 'black';
  ctx.lineWidth = 5;
  ctx.stroke();
  ctx.fillStyle = 'rgb(200,0,0)';
  ctx.fill();

  // Triangle
  ctx.beginPath();
  ctx.moveTo(300, 300);
  ctx.lineTo(375, 250);
  ctx.lineTo(375, 350);
  ctx.fillStyle = 'rgb(0,0,200)';
  ctx.fill();
});

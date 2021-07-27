'use strict'
document.addEventListener('DOMContentLoaded', function() {
 
  // // HTMLCollection を「配列」に「置換」
  const imageList = document.querySelectorAll('#images li img');
  const imageCount = imageList.length;
  let imageArray = [];
  for (let i = 0; i < imageCount; i++) {
    imageArray.push(imageList[i]);
  }
  let currentIndex = 0;

  console.log(imageArray)
});
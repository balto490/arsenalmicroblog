
// // Email Modal

$(document).ready(function(){

// $("#close").click(modalClose);

// $("#login").click(modalOpen);
   


// function modalOpen() {
//   document.getElementById("cover").style.display = "block";
//   document.getElementById("modal").style.display = "block";
//   setTimeout(function(){
//     document.getElementById("cover").style.opacity = 1;
//     document.getElementById("modal").style.opacity = 1;
//   },1); // wait just 1/1000 of a sec for style.display to finish
// }
// function modalClose() {
//   // document.getElementById("cover").style.opacity = 0;
//   document.getElementById("modal").style.opacity = 0;
//   setTimeout(function(){
//     //document.getElementById("cover").style.display = "none";
//     document.getElementById("modal").style.display = "none";
//   },1000); // match the css 1s transition
// }


$(".userbutton").click(function(){
    profileDivAppear(); 
    setTimeout(postDivAppear, 500);
});

var profileDivAppear = function(){
  $("#slideprofile").show()
  $("#slideprofile").animate({
    left: "33%"
  },500);
}

var postDivAppear = function(){
  $("#slidepost").show()
  $("#slidepost").animate({
    left: "66%"
  },500);
}

});


// $.ajax({
//       url : "/login",
//       type : "post",
//       data : { data_value: JSON.stringify(arr) },
// });

// $.ajax({
//       url : "/login",
//       type : "get",
//       data : { data_value: JSON.stringify(arr) },
// });

// }
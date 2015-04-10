$(document).ready(function(){
  $('.slider-nav').slick({
  centerMode: true,
  centerPadding: '40px',
  slidesToShow: 8,
  autoplay: false,
  autoplaySpeed: 1000,

  responsive: [
    {
      breakpoint: 768,
      settings: {
        arrows: false,
        centerMode: true,
        centerPadding: '40px',
        slidesToShow: 3
      }
    },
    {
      breakpoint: 480,
      settings: {
        arrows: false,
        centerMode: true,
        centerPadding: '40px',
        slidesToShow: 1
      }
    }
  ]
});
});


// $('.slider-nav').slick({
//   slidesToShow: 8,
//   slidesToScroll: 5,
//   autoplay: true,
//   arrows: true,
//   autoplaySpeed: 1000,
//   asNavFor: '.slider-for',
//   dots: false,
//   centerMode: true,
//   focusOnSelect: true
// });

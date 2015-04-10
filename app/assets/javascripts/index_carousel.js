$(document).ready(function(){
  $('.slider-nav').slick({
  centerPadding: '40px',
  slidesToShow: 5,
  autoplay: false,
  autoplaySpeed: 1000,

  responsive: [
    {
      breakpoint: 768,
      settings: {
        arrows: false,
        centerPadding: '40px',
        slidesToShow: 1
      }
    },
    {
      breakpoint: 480,
      settings: {
        arrows: false,
        centerPadding: '40px',
        slidesToShow: 1
      }
    }
  ]
});
});

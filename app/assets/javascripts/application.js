// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require_tree .

$(function(){ $(document).foundation(); });

$(function() {
  $('.flash').delay(1500).fadeOut(600);
});

$('.search-trigger').click(function(e){
	e.preventDefault();
	$('.search').toggleClass('triggered');
});

$('.edit a').on('click', function(e){
  e.preventDefault();
  var number = $(this).attr('name');
  $('.edit-' + number).hide();
  $('.delete-' + number).hide();
  $('.review-body-' + number).hide();
  $('.review-form-' + number).fadeIn();
  $('.cancel-' + number).fadeIn();
});

$('.cancel a').on('click', function(e){
  e.preventDefault();
  var number = $(this).attr('name');
  $('.cancel-' + number).hide();
  $('.review-form-' + number).hide();
  $('.delete-' + number).fadeIn();
  $('.edit-' + number).fadeIn();
  $('.review-body-' + number).fadeIn();
});

$('.vote-up a').on('click', function(){
  var number = $(this).attr('num');
  var movieId = $(this).attr('movie_id');
  var reviewId = $(this).attr('review_id');
  var voteType = $(this).parent().attr('class');
  var body = $('.review-body-' + number).text();
  var votes = $('.votes-' + number).text();
  var plusVotes = parseInt(votes) + 1;

  var votesRequest = $.ajax({
    method: "PUT",
    url: '/movies/' + movieId + '/reviews/' + reviewId,
    data: review = { body: body, votes: plusVotes, vote_type: voteType }
  });
  votesRequest.done(function(msg) {
    $('.votes-' + number).text(plusVotes);
  });
  votesRequest.fail(function(msg) {
    alert('You\'ve already vote')
  });
});

$('.vote-down a').on('click', function(){
  var number = $(this).attr('num');
  var movieId = $(this).attr('movie_id');
  var reviewId = $(this).attr('review_id');
  var voteType = $(this).parent().attr('class');
  var body = $('.review-body-' + number).text();
  var votes = $('.votes-' + number).text();
  var plusVotes = parseInt(votes) - 1;

  var votesRequest = $.ajax({
    method: "PUT",
    url: '/movies/' + movieId + '/reviews/' + reviewId,
    data: review = { body: body, votes: plusVotes, vote_type: voteType }
  });
  votesRequest.done(function(msg) {
    $('.votes-' + number).text(plusVotes);
  });
  votesRequest.fail(function(msg) {
    alert('You\'ve already vote')
  });
});


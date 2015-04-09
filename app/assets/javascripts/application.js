//= require jquery
//= require jquery_ujs
//= require foundation
//= require_tree .

$(function() { $(document).foundation(); });

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
    method: 'PUT',
    url: '/movies/' + movieId + '/reviews/' + reviewId,
    data: { body: body, votes: plusVotes, vote_type: voteType }
  });
  votesRequest.done(function() {
    $('.votes-' + number).text(plusVotes);
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
    method: 'PUT',
    url: '/movies/' + movieId + '/reviews/' + reviewId,
    data: { body: body, votes: plusVotes, vote_type: voteType }
  });
  votesRequest.done(function() {
    $('.votes-' + number).text(plusVotes);
  });
});

// AUTOCOMPLETE MOVIE TITLE
$('#movie_title').keyup(function() {
  var movieTitle = $(this).val();
  $('#titles-list-container').show();
  var titlesRequest = $.ajax({
    method: 'GET',
    url: '/autocomplete',
    data: { q: movieTitle }
  });
  titlesRequest.done(function(movieTitles) {
    var data = JSON.parse(movieTitles);
    $('#titles-list').replaceWith('<ul id="titles-list"></ul>');
    for (i = 0; i < data.length; i++) {
      $('#titles-list').append('<li><a class="title" href="#">' + data[i] + '</a><li>');
    }
    $('.title').on('click', function(e) {
      e.preventDefault();
      $('#titles-list-container').hide();
      var selectedTitle = $(this).text();
      $('#titles-list').replaceWith('<ul id="titles-list"></ul>');
      $('#movie_title').val(selectedTitle);
    });
  });
})

$('#movie-submit').on('focusin',function() {
  $('#titles-list-container').hide();
  $('#titles-list').replaceWith('<ul id="titles-list"></ul>');
});

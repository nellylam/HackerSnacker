$(document).ready(function() {
  var topStoriesRef = new Firebase('https://hacker-news.firebaseio.com/v0/topstories');
  topStoriesRef.on('value', function(snapshot){
    var topStories = snapshot.val();
    getTopStories(topStories);
  }, function(errorObject){
    console.log("The read failed" + errorObject.code);
  });

  function getTopStories(retrievedStories){
    var topstories = [];
    for(var i in retrievedStories){
      var storyRef = new Firebase("https://hacker-news.firebaseio.com/v0/item/" + retrievedStories[i]);
      storyRef.on('value', function(snapshot){
        story = snapshot.val();
        getVariables(story);
      });
    }
  }

  function getVariables (storyRaw) {
    var title = storyRaw["title"];
    var url = storyRaw["url"];
    var author = storyRaw["by"];
    var id = storyRaw["id"];

    renderStory(title, author, url, id);
  }

  function renderStory (title, author, url, id) {
    $story_div = buildStoryTemplate(title, author, url, id);
    $('.newsfeed_js').append($story_div).css( { 'display': 'block' } );

  }

  function buildStoryTemplate(title, author, url, id){
    var story_template = $.trim($('#story_template').html());
    var $storytemplate = $(story_template);
    $storytemplate.find('.title').text(title);
    $storytemplate.find('.author').text(author);
    $storytemplate.find('.url').attr('href', url);
    $storytemplate.find('.hn_story_id').text(id);
    return $storytemplate;
  }

  $('.newsfeed_js').on('click', 'button', function(e){
    e.preventDefault();
    var $el = $(e.target);
    var id = $el.parent().parent().children('.hn_story_id').text();
    newStory(id);
  });

  function newStory (id) {
    $.ajax({
      url: '/story',
      type: 'POST',
      data: {story_id: id}
    }).done(alert('done')).fail(alert('fail'));
  }
});

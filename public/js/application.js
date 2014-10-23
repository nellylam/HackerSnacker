$(document).ready(function() {
  var topStoriesRef = new Firebase('https://hacker-news.firebaseio.com/v0/topstories');
  topStoriesRef.on('value', function(snapshot){
    console.log(snapshot.val());
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

    renderStory(title,author,url);
  }

  function renderStory (title, author, url) {
    $story_div = buildStoryTemplate(title, author, url);
    $('.newsfeed_js').append($story_div).css( { 'display': 'block' } );

  }

  function buildStoryTemplate(title, author, url){
    var story_template = $.trim($('#story_template').html());
    var $storytemplate = $(story_template);
    $storytemplate.find('.title').text(title);
    $storytemplate.find('.author').text(author);
    $storytemplate.find('.url').attr('href', url);
    return $storytemplate;
  }

});

(function Controller (){

})
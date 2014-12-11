require 'firebase'
# require 'dotenv'
# Dotenv.load

module HackerNews

  class Client
    require 'firebase/request'
    require 'firebase/response'

    # auth_key = ENV['AUTH_KEY']

    # BASE_URI = "https://hacker-news.firebaseio.com/v0/"
    MY_FIREBASE = Firebase::Client.new("https://hacker-news.firebaseio.com/v0/")

    def top_stories
      top_stories_ids = MY_FIREBASE.get("topstories")
      p top_stories_ids.body # [2434234, 2423432...]
      get_all_stories(top_stories_ids.body)
    end

    def get_all_stories(story_ids_list)
      stories = []
      story_ids_list.each do |story_id|
        stories << get_story(story_id)
      end
      stories
    end

    def get_story(id)
      one_story_response = MY_FIREBASE.get("item/#{id}")
      one_story = one_story_response.body
      create_story(one_story)
    end

    def create_story(story_json)
      Story.create( title: story_json["title"],
                    author: story_json["by"],
                    url: story_json["url"],
                    hacker_news_id: story_json["id"] )
    end

  end
end

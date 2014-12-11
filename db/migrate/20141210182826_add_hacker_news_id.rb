class AddHackerNewsId < ActiveRecord::Migration
  def change
    add_column :stories, :hacker_news_id, :string
  end
end

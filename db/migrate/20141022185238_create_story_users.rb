class CreateStoryUsers < ActiveRecord::Migration
  def change
    create_table :story_users do |t|
      t.references :user
      t.references :story

      t.timestamps
    end
  end
end

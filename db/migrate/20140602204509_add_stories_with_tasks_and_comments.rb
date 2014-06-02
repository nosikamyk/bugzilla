class AddStoriesWithTasksAndComments < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :name
      t.text :description
      t.string :type
      t.string :status
      t.references :user, index: true
      t.references :project, index: true
    end
    create_table :tasks do |t|
      t.string :name
      t.references :story, index: true
    end
    create_table :comments do |t|
      t.string :text
      t.references :story, index: true
    end
  end
end

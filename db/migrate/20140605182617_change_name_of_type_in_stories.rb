class ChangeNameOfTypeInStories < ActiveRecord::Migration
  def change
    rename_column :stories, :type, :stories_type
  end
end

class AddIndexesToMember < ActiveRecord::Migration
  def change
    add_index :members, :user_id
    add_index :members, :project_id
  end
end

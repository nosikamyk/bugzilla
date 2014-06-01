class AddMembersToProjects < ActiveRecord::Migration
  def change
    create_table :members do |members|
      members.belongs_to :user
      members.belongs_to :project
    end
    remove_column :projects, :user_id
  end
end

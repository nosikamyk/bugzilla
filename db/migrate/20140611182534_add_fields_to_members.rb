class AddFieldsToMembers < ActiveRecord::Migration
  def change
    add_column :members, :member_email, :string
    add_column :members, :member_name, :string
  end
end

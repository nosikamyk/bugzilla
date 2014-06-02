class AddConfirmationTokenAndMenagerFlagToMembers < ActiveRecord::Migration
  def change
    add_column :members, :confirmation_token, :string
    add_column :members, :confirmed, :boolean
    add_column :members, :manager, :boolean
  end
end

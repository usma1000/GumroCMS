class AddCommentsToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :comments, :string
  end
end

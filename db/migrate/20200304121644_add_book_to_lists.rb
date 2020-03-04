class AddBookToLists < ActiveRecord::Migration[5.2]
  def change
    add_column :lists, :each, :string
  end
end

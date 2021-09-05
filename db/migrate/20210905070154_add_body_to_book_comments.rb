class AddBodyToBookComments < ActiveRecord::Migration[5.2]
  def change
    add_column :book_comments, :body, :text
  end
end

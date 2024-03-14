class AddTitleAndAuthorNameInBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books,:author_name,:string
    rename_column :books, :bookname, :title
  end
end

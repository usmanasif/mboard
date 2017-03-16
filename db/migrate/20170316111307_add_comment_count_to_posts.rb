class AddCommentCountToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :comments_count, :int, default: 0
  end
end

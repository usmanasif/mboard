class Comment < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  belongs_to :post, counter_cache: true

  validates_presence_of :body, :author_id, :post_id
end

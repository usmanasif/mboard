class Post < ActiveRecord::Base
  belongs_to :author, class_name: 'User'

  validates_presence_of :title, :body, :author_id
end

class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :validatable

  validates_presence_of :first_name, :last_name

  has_many :posts, foreign_key: :author_id

  def name
    "#{first_name} #{last_name}"
  end

  def initials
    "#{first_name[0]}#{last_name[0]}".upcase
  end
end

class Comment < ActiveRecord::Base
  belongs_to :project

  validates :body, presence: true, length: {minimum: 3}
end

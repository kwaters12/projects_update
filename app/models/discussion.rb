class Discussion < ActiveRecord::Base

  scope :recent, -> {order("created_at DESC")}
  scope :top_3_likes, -> { order("like_counter DESC").limit(3)}
  def self.generate_random_discussions(number_of_discussions = 50)
    number_of_discussions.times do
      random_title = (0...rand(60)).map {('a'..'z').to_a[rand(26)]}.join
      Discussion.create(title: random_title, body: "Go Flames Go!! 
        Go Flames Go!! Go Flames Go!!")
    end
  end
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  include PgSearch::Model
  multisearchable against: :name
  has_many :galleries,dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :active_relationships, class_name: "Follower", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Follower", foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :followers
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
         def self.to_csv
          attributes = %w{id name email}
      
          CSV.generate(headers: true) do |csv|
            csv << attributes
      
            all.find_each do |user|
              csv << attributes.map{ |attr| user.send(attr) }
            end
          end
        end
  def follow(other_user)
    following << other_user unless self == other_user
  end

  def unfollow(other_user)
    following.delete(other_user)
  end

  def following?(other_user)
    following.include?(other_user)
  end
  
end

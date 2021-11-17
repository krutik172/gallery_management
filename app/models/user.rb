class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  include PgSearch::Model
 multisearchable against: :name
  has_many :galleries,dependent: :destroy
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
      
        
  
end

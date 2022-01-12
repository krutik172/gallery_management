class Gallery < ApplicationRecord
    include PgSearch::Model
    belongs_to :user
    has_many :likes, dependent: :destroy
    mount_uploader :image, ImageUploader
    validate :image_size_validation
    validates :image, presence: true
    validates :title, presence: true

    pg_search_scope :search, :against =>[:title, :image]
    # multisearchable against: [:title, :image]
    # searchable do
    #     text :title,:image, :user_id
    # end
    
    

    private
        def image_size_validation
            errors[:image] << "should be less than 2MB" if image.size > 2.0.megabytes
        end

        
end

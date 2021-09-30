class Gallery < ApplicationRecord

    belongs_to :user
    mount_uploader :image, ImageUploader
    validate :image_size_validation
    validates :image, presence: true
    validates :title, presence: true

    private
        def image_size_validation
            errors[:image] << "should be less than 1MB" if image.size > 1.0.megabytes
        end
        
end

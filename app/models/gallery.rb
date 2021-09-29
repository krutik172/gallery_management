class Gallery < ApplicationRecord

    belongs_to :user
    mount_uploader :image, ImageUploader
    validate :image_size_validation
    validates :image, presence: true
    validates :title, presence: true

    private
        def image_size_validation
            errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
        end
        
end

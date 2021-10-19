class Gallery < ApplicationRecord
   
    belongs_to :user
    mount_uploader :image, ImageUploader
    validate :image_size_validation
    validates :image, presence: true
    validates :title, presence: true

    searchable do
        text :title,:image, :user_id
    end

    private
        def image_size_validation
            errors[:image] << "should be less than 2MB" if image.size > 2.0.megabytes
        end

        
end

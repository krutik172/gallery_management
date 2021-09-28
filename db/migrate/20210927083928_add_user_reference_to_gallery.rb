class AddUserReferenceToGallery < ActiveRecord::Migration[6.1]
  def change
    add_reference :galleries, :user, foreign_key: true
  end
end

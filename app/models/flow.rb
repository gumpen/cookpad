class Flow < ApplicationRecord
  belongs_to :recipe, dependent: :destroy
  mount_uploader :image, ImageUploader
end

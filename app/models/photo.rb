class Photo < ApplicationRecord
    belongs_to :user
    mount_uploader :image, ImageUploader
    has_many :photo_tag_relations, dependent: :destroy
    has_many :tags, through: :photo_tag_relations, dependent: :destroy
end

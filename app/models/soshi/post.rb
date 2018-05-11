module Soshi
  class Post < ApplicationRecord
    belongs_to :category
    acts_as_paranoid
    acts_as_taggable

    validates :title, presence: true
    validates :body, presence: true
    validates :description, presence: true

    has_attached_file :image,
      styles: { ogp: "1200x630#", small: "400x210#", thumbnail: "200x105#" },
      default_style: :ogp,
      url: "/uploads/:hash",
      hash_secret: "longSecretString",
      default_url: "/default-ogp-image.png"
    validates_attachment :image, presence: true, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

    enum status: {draft: 0, published: 1}

    def published!
      self.update(status: 1, published_at: Time.current)
    end

    def draft!
      self.update(status: 0, published_at: nil)
    end
  end
end

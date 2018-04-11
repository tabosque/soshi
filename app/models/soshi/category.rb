module Soshi
  class Category < ApplicationRecord
    has_many :posts

    validates :name, presence: true, uniqueness: { case_sensitive: false }
    SLUG_REGEX = /\A[a-zA-Z0-9\-_]+\z/
    validates :slug,
      presence: true,
      format: {with: SLUG_REGEX},
      uniqueness: { case_sensitive: false }

    def to_param
      slug
    end
  end
end

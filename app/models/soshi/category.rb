module Soshi
  class Category < ApplicationRecord
    has_many :posts
    CUSTOM_PROHIBITED_WORDS = []

    validates :name, presence: true, uniqueness: { case_sensitive: false }
    SLUG_REGEX = /\A[a-zA-Z0-9\-_]+\z/
    validates :slug,
      presence: true,
      format: {with: SLUG_REGEX},
      uniqueness: { case_sensitive: false }
    validate :slug_cannot_be_assigned_prohibited_words

    def to_param
      slug
    end

    def slug_cannot_be_assigned_prohibited_words
      prohibited_words = ['posts', 'categories', 'tags'] + CUSTOM_PROHIBITED_WORDS
      errors.add(:slug, "に「#{slug}」は使用できません。") if prohibited_words.include?(slug)
    end
  end
end

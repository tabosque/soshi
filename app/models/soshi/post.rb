module Soshi
  class Post < ApplicationRecord
    belongs_to :category
    acts_as_paranoid
    acts_as_taggable

    validates :title, presence: true
    validates :body, presence: true
    validates :description, presence: true
  end
end

module Soshi
  class Post < ApplicationRecord
    belongs_to :category
    acts_as_paranoid

    validates :title, presence: true
    validates :body, presence: true
  end
end

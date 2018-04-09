module Soshi
  class Post < ApplicationRecord
    acts_as_paranoid

    validates :title, presence: true
    validates :body, presence: true
  end
end

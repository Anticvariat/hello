# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user

  validates :body, presence: true, length: { minimum: 5, maximum: 80 }
end

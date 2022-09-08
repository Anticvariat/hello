# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :article
  validates :body, presence: true, length: { minimum: 10 }
  validates :author_id, presence: true
end

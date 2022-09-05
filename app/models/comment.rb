class Comment < ApplicationRecord
  belongs_to :article
  validates :commenter, presence: true
  validates :body, presence: true, length: { minimum: 10 }
  validates :author_id, presence: true
end

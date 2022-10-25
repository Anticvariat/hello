# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :avatar
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  VALID_STATUSES = %w[public draft].freeze

  validates :status, inclusion: { in: VALID_STATUSES }

  def draft?
    status == 'draft'
  end
end

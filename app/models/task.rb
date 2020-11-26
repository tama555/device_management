class Task < ApplicationRecord
  belongs_to :user
  belongs_to :device
  has_many :comments, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :department
end

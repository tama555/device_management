class Device < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :rent_histories

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :device_class
  belongs_to_active_hash :inspection_interval


end

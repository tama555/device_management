class Device < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :device_class
  belongs_to_active_hash :inspection_interval


end

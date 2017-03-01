  class DailyInvoice < ApplicationRecord
    has_one :lunch_detail
    #belongs_to :user
    validates_presence_of :restaurant_name
    validates_presence_of :amount
    validates_presence_of :date
    has_attached_file :image
    validates_attachment :image, :content_type => { :content_type => ["image/jpeg","image/gif","image/png"] }
    #accepts_nested_attributes_for :lunch_details
  end

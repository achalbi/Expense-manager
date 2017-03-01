  class LunchDetail < ApplicationRecord
    has_one :daily_invoice
    #belongs_to :daily_invoice
    belongs_to :user

  end

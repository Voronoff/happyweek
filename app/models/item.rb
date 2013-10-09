class Item < ActiveRecord::Base
  belongs_to :deal
  validates :deal_id, :presence => {:message => 'Item must be assigned to a deal.'}
end
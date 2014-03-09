class Comment < ActiveRecord::Base
  belongs_to :comment
#    accepts_nested_attributes_for :reject_if => proc { |attrs| attrs['user_id'].blank? }
end

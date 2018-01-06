class Review < ApplicationRecord
  belongs_to :product, :dependent => :destroy
end

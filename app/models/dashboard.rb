class Dashboard < ActiveRecord::Base

	validates :carousel_info, presence: true

end
class DownloadInfoJob < ApplicationJob
	queue_as :default
 
  def self.perform
  	puts 'i like to sleep'
  	sleep 2
  end
end
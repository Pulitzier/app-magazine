class DownloadInfoJob < ApplicationJob
	queue_as :default
 
  def self.perform(seconds)
  	puts 'i like to sleep'
  	sleep(seconds)
  end
end
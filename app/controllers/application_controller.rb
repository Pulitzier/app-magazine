class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
	def call_rake(task, options = {})
	  options[:rails_env] ||= Rails.env
	  args = options.map { |n, v| "#{n.to_s.upcase}='#{v}'" }
	  system "rake #{task} #{args.join(' ')} --trace 2>&1 &"
	end
	
end

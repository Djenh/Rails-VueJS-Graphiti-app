class ApplicationController < ActionController::Base
	include Graphiti::Rails
	include Graphiti::Responders

	register_exception Graphiti::Errors::RecordNotFound,
		status: 404

	rescue_from Exception do |e|
	    handle_exception(e, show_raw_error: Rails.env.development?)
	end

	protect_from_forgery
end

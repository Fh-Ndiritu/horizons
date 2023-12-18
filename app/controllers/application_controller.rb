class ApplicationController < ActionController::Base
    before_action :authenticate_user!, :check_mobile

    private 

    def check_mobile 
      @is_mobile ||= /iphone|android|blackberry|mobile/.match?(request.user_agent.to_s.downcase)
  end

end

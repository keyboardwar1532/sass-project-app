class HomeController < ApplicationController
  skip_before_action :authenticate_tenant!, :only => [ :index ]

  def index
  	if current_user
  	  if session[:tenant_id]
  	  	Ternant.set_current_tenant session[:tenant_id]
  	  else
  	  	Ternant.set_current_tenant current_user.tenants.first
  	  end

  	  @tenant = Ternant.current_tenant
  	  params[:tenant_id] = @tenant.id
  	end
  end
end

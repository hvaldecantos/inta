class UserSessionVarsController < ApplicationController
  def mi_vista
    session[:mi_vista] = params[:mi_vista]
    render :json => {"response" => "OK"}
  end
end
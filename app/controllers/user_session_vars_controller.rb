class UserSessionVarsController < ApplicationController
  def mi_vista
    cookies[:mi_vista] = (params[:mi_vista] == '1')
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end
end
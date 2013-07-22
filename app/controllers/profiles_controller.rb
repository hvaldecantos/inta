class ProfilesController < ApplicationController
  
  before_filter :correct_user

  def edit
    @profile = Profile.find(params[:id])
    # @profile = Profile.where(user_id: params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    # @profile = Profile.where(user_id: params[:id])

    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to(:back, :notice => 'Perfil actualizado exitosamente.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @profile.errors, :status => :unprocessable_entity }
      end
    end
  end

  private
    def correct_user
      # @user = User.find(params[:id])
      @user = Profile.find(params[:id]).user
      redirect_to(root_path, :notice => 'No puede modificar el perfil de otro usuario.') unless (current_user == @user)
    end
end

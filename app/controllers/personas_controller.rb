class PersonasController < ApplicationController
  
  before_filter :correct_user

  def edit
    @persona = Persona.find(params[:id])
  end

  def update
    @persona = Persona.find(params[:id])

    respond_to do |format|
      if @persona.update_attributes(params[:persona])
        format.html { redirect_to(edit_persona_path(@persona.id), :notice => 'Persona actualizado exitosamente.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @persona.errors, :status => :unprocessable_entity }
      end
    end
  end

  private
    def correct_user
      @user = Persona.find(params[:id]).user
      redirect_to(root_path, :notice => 'No puede modificar el perfil de otro usuario.') unless (current_user == @user)
    end
end

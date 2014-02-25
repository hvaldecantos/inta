class AnalisisPrezafrasController < ApplicationController
  # GET /analisis_prezafras
  # GET /analisis_prezafras.json
  def index
    @analisis_prezafras = AnalisisPrezafra.all

    respond_to do |format|
      format.html { render  resolve_view }
      format.json { render json: @analisis_prezafras }
    end
  end

  # GET /analisis_prezafras/1
  # GET /analisis_prezafras/1.json
  def show
    @analisis_prezafra = AnalisisPrezafra.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @analisis_prezafra }
    end
  end

  # GET /analisis_prezafras/new
  # GET /analisis_prezafras/new.json
  def new
    @analisis_prezafra = AnalisisPrezafra.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @analisis_prezafra }
    end
  end

  # GET /analisis_prezafras/1/edit
  def edit
    @analisis_prezafra = AnalisisPrezafra.find(params[:id])
  end

  # POST /analisis_prezafras
  # POST /analisis_prezafras.json
  def create
    @analisis_prezafra = AnalisisPrezafra.new(params[:analisis_prezafra])

    respond_to do |format|
      if @analisis_prezafra.save
        format.html { redirect_to @analisis_prezafra, notice: 'Analisis prezafra was successfully created.' }
        format.json { render json: @analisis_prezafra, status: :created, location: @analisis_prezafra }
      else
        format.html { render action: "new" }
        format.json { render json: @analisis_prezafra.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /analisis_prezafras/1
  # PUT /analisis_prezafras/1.json
  def update
    @analisis_prezafra = AnalisisPrezafra.find(params[:id])

    respond_to do |format|
      if @analisis_prezafra.update_attributes(params[:analisis_prezafra])
        format.html { redirect_to @analisis_prezafra, notice: 'Analisis prezafra was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @analisis_prezafra.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /analisis_prezafras/1
  # DELETE /analisis_prezafras/1.json
  def destroy
    @analisis_prezafra = AnalisisPrezafra.find(params[:id])
    @analisis_prezafra.destroy

    respond_to do |format|
      format.html { redirect_to analisis_prezafras_url }
      format.json { head :no_content }
    end
  end

  private

    def resolve_view
      view_name = action_name
      if(current_user.has_role?(:laboratorista) and (action_name == "index")) then
        view_name = "#{action_name}_laboratorista"
      end
    end

end

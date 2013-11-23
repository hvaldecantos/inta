class AnalisisRsdsController < ApplicationController

  load_and_authorize_resource
  
  # GET /analisis_rsds
  # GET /analisis_rsds.json
  def index
    @analisis_rsds = AnalisisRsd.order("fecha_ingreso DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @analisis_rsds }
    end
  end

  # GET /analisis_rsds/1
  # GET /analisis_rsds/1.json
  def show
    @analisis_rsd = AnalisisRsd.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @analisis_rsd }
    end
  end

  # GET /analisis_rsds/new
  # GET /analisis_rsds/new.json
  def new
    @analisis_rsd = AnalisisRsd.new
    @analisis_rsd.laboratorista_id = current_user.persona.id

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @analisis_rsd }
    end
  end

  # GET /analisis_rsds/1/edit
  def edit
    @analisis_rsd = AnalisisRsd.find(params[:id])
  end

  # POST /analisis_rsds
  # POST /analisis_rsds.json
  def create
    @analisis_rsd = AnalisisRsd.new(params[:analisis_rsd])

    respond_to do |format|
      if @analisis_rsd.save
        format.html { redirect_to @analisis_rsd, notice: 'Analisis rsd was successfully created.' }
        format.json { render json: @analisis_rsd, status: :created, location: @analisis_rsd }
      else
        format.html { render action: "new" }
        format.json { render json: @analisis_rsd.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /analisis_rsds/1
  # PUT /analisis_rsds/1.json
  def update
    @analisis_rsd = AnalisisRsd.find(params[:id])

    respond_to do |format|
      if @analisis_rsd.update_attributes(params[:analisis_rsd])
        format.html { redirect_to @analisis_rsd, notice: 'Analisis rsd was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @analisis_rsd.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /analisis_rsds/1
  # DELETE /analisis_rsds/1.json
  def destroy
    @analisis_rsd = AnalisisRsd.find(params[:id])
    @analisis_rsd.destroy

    respond_to do |format|
      format.html { redirect_to analisis_rsds_url }
      format.json { head :no_content }
    end
  end
end

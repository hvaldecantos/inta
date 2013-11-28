class AnalisisRsdsController < ApplicationController

  load_and_authorize_resource
  skip_authorize_resource :only => [:reporte_general, :reporte_histograma, :reporte_mapas]

  # GET /analisis_rsds
  # GET /analisis_rsds.json
  def index
    @analisis_rsds = AnalisisRsd.paginate(:page => params[:page], :per_page => 20).order('fecha_ingreso DESC')

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
    @analisis_rsd.fecha_ingreso = Date.today

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

  def reporte_general
    @resultado = {}

    sql1 = "SELECT count(CASE WHEN (incidencia >= 0) THEN 1 ELSE null END) as total,
                  count(CASE WHEN (incidencia = 0) THEN 1 ELSE null END) as si,
                  count(CASE WHEN (incidencia > 0) THEN 1 ELSE null END) as no
           FROM analisis_rsds;"
    @resultado["general"] = ActiveRecord::Base.connection.execute(sql1)    

    sql2 = "SELECT  count(CASE WHEN (agente_id = 60) THEN 1 ELSE null END) as simoca,
                    count(CASE WHEN (agente_id = 58) THEN 1 ELSE null END) as monteros,
                    count(CASE WHEN (agente_id = 59) THEN 1 ELSE null END) as aguilares
            FROM analisis_rsds;;"
    
    @resultado["cantidad_por_agencia"] = ActiveRecord::Base.connection.execute(sql2)
    
  end

  def reporte_histograma
    sql = "SELECT count(*) FROM analisis_rsds WHERE analizado = true"
    @total_de_muestras = ActiveRecord::Base.connection.execute(sql).values[0][0].to_i

    sql = "SELECT count(CASE WHEN (incidencia >= 0) THEN 1 ELSE null END) as total,
             count(CASE WHEN (incidencia = 0) THEN 1 ELSE null END),
             count(CASE WHEN (incidencia > 0 AND incidencia <= 25) THEN 1 ELSE null END),
             count(CASE WHEN (incidencia > 25 AND incidencia <= 50) THEN 1 ELSE null END),
             count(CASE WHEN (incidencia > 50 AND incidencia <= 75) THEN 1 ELSE null END),
             count(CASE WHEN (incidencia > 75 AND incidencia <= 100) THEN 1 ELSE null END) 
          FROM analisis_rsds;"
    
    @resultado = ActiveRecord::Base.connection.execute(sql)

    sql = " SELECT comunas_municipios.nombre,
                   count(CASE WHEN (incidencia = 0) THEN 1 ELSE null END) as no, 
                   count(CASE WHEN (incidencia > 0) THEN 1 ELSE null END) as si, 
                   count(*) as total
            FROM analisis_rsds, comunas_municipios
            WHERE analisis_rsds.comuna_municipio_id = comunas_municipios.id AND analizado = true
            GROUP BY comuna_municipio_id, comunas_municipios.nombre
            ORDER BY total;"
    
    @porcomunas = ActiveRecord::Base.connection.execute(sql)
    
    @hash = []
    @porcomunas.values.each do |c|
      @hash << { y: c[0].to_s, a: c[1].to_i, b: c[2].to_i }
    end
  end

  def reporte_mapas
  end

  def reporte_por_agencia
    sql = "SELECT count(*) FROM analisis_rsds WHERE analizado = true AND agente_id IN (58, 59, 60);"
    @total_de_muestras = ActiveRecord::Base.connection.execute(sql).values[0][0].to_i

    sql = " SELECT CASE WHEN (agente_id=58) THEN 'Monteros' ELSE
                    CASE WHEN (agente_id=60) THEN 'Simoca' ELSE 
                      CASE WHEN (agente_id=59) THEN 'Aguilares' ELSE null END END END as agencia,
                    count(CASE WHEN (incidencia = 0) THEN 1 ELSE null END) as no, 
                    count(CASE WHEN (incidencia > 0) THEN 1 ELSE null END) as si,
                    count(*) as total
            FROM analisis_rsds WHERE analizado = true AND agente_id IN (58, 59, 60)
            GROUP BY agente_id
            ORDER BY total;"
    
    @poragencia = ActiveRecord::Base.connection.execute(sql)
    
    @hash = []
    @poragencia.values.each do |c|
      @hash << { y: c[0].to_s, a: c[1].to_i, b: c[2].to_i }
    end
  end
end

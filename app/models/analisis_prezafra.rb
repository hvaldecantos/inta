class AnalisisPrezafra < ActiveRecord::Base
  attr_accessible :agente_id, :brix_pct, :estado, :fecha_analisis, :fecha_extraccion, :fecha_ingreso, :fecha_inicio, :identificacion, :laboratorista_id, :lonlat, :lectura_polar, :observaciones, :parcela_id, :peso_muestra, :peso_tallo, :pol_pct_cania, :pol_pct_jugo, :productor_id, :promotor_id, :pureza_pct, :rto_pct, :cania_variedad_id

  belongs_to :agente, class_name: "Persona"
  belongs_to :promotor, class_name: "Persona"
  belongs_to :laboratorista, class_name: "Persona"
  belongs_to :productor
  belongs_to :cania_variedad

  after_create :generar_ticket
  after_create :establecer_identificacion
  before_save :establecer_fecha_inicio

  attr_accessor :longitude, :latitude
  attr_accessible :longitude, :latitude

  validates :longitude, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }, allow_blank: true
  validates :latitude, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }, allow_blank: true

  validate :fecha_extraccion_vs_fecha_inicio
  validate :fecha_ingreso_vs_fecha_inicio
  validate :fecha_analisis_vs_fecha_inicio
  validate :fecha_ingreso_vs_fecha_extraccion
  validate :fecha_analisis_vs_fecha_extraccion
  validate :fecha_analisis_vs_fecha_ingreso

  before_save :update_lonlat
  after_initialize :load_up_longitude_latitude

  def fecha_extraccion_vs_fecha_inicio
    if fecha_extraccion.nil? then return end
    if(fecha_extraccion < fecha_inicio) then
      errors.add(:fecha_extraccion, "no puede ser anterior a la fecha de inicio #{I18n.localize(fecha_inicio)}.")
    end
  end

  def fecha_ingreso_vs_fecha_inicio
    if fecha_ingreso.nil? then return end
    if(fecha_ingreso < fecha_inicio) then
      errors.add(:fecha_ingreso, "no puede ser anterior a la fecha de inicio #{I18n.localize(fecha_inicio)}.")
    end
  end

  def fecha_analisis_vs_fecha_inicio
    if fecha_analisis.nil? then return end
    if(fecha_analisis < fecha_inicio) then
      errors.add(:fecha_analisis, "no puede ser anterior a la fecha de inicio #{I18n.localize(fecha_inicio)}.")
    end
  end

  def fecha_ingreso_vs_fecha_extraccion
    if fecha_ingreso.nil? ||  fecha_extraccion.nil? then return end
    if(fecha_ingreso < fecha_extraccion) then
      errors.add(:fecha_ingreso, "no puede ser anterior a la fecha de extracción #{I18n.localize(fecha_extraccion)}.")
    end
  end

  def fecha_analisis_vs_fecha_extraccion
    if fecha_analisis.nil? ||  fecha_extraccion.nil? then return end
    if(fecha_analisis < fecha_extraccion) then
      errors.add(:fecha_analisis, "no puede ser anterior a la fecha de extracción #{I18n.localize(fecha_extraccion)}.")
    end
  end

  def fecha_analisis_vs_fecha_ingreso
    if fecha_analisis.nil? ||  fecha_ingreso.nil? then return end
    if(fecha_analisis < fecha_ingreso) then
      errors.add(:fecha_analisis, "no puede ser anterior a la fecha de ingreso #{I18n.localize(fecha_ingreso)}.")
    end
  end

  def load_up_longitude_latitude
    if not lonlat.nil?
      self.longitude = lonlat.lon
      self.latitude = lonlat.lat
    end
  end

  def update_lonlat
    if longitude.present? || latitude.present?
      long = longitude || self.lonlat.longitude
      lat = latitude || self.lonlat.latitude
      self.lonlat = RGeo::Geographic.spherical_factory(srid: 4326).point(long, lat)
    end
  end

  def longitud_latitud
    "#{lonlat.lon} #{lonlat.lat}" unless lonlat.nil?
  end

  def self.estados
    %w(Iniciado Ingresado Analizado Entregado)
  end

  def AnalisisPrezafra.generar_identificador(numero, fecha)
    numero = numero % 1000000
    fecha.year.to_s.gsub(/-/,'') + ("%06d" % numero) + "PZ"
  end

  def establecer_identificacion
    self.identificacion = AnalisisPrezafra.generar_identificador(self.id, self.fecha_inicio)
    self.save
  end

  def generar_ticket
    # TODO
  end

  def establecer_fecha_inicio
    self.fecha_inicio ||= Date.today
  end

  def datos_completos? user
    if user.has_role? :laboratorista then
      (fecha_ingreso.nil? || fecha_analisis.nil? || peso_muestra.nil? || peso_tallo.nil? || 
           cania_variedad_id.nil? || brix_pct.nil? || lectura_polar.nil? || laboratorista_id.nil? || 
           (estado!="Analizado" && estado!="Entregado") )
    else
      (fecha_extraccion.nil? || productor_id.nil? || promotor_id.nil? || lonlat.nil?)
    end
  end

end

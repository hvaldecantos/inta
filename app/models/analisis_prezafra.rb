class AnalisisPrezafra < ActiveRecord::Base
  attr_accessible :agente_id, :brix_pct, :estado, :fecha_analisis, :fecha_extraccion, :fecha_ingreso, :fecha_inicio, :identificacion, :laboratorista_id, :latlon, :lectura_polar, :observaciones, :parcela_id, :peso_muestra, :peso_tallo, :pol_pct_cania, :pol_pct_jugo, :productor_id, :promotor_id, :pureza_pct, :rto_pct, :variedad_id

  belongs_to :agente, class_name: "Persona"
  belongs_to :promotor, class_name: "Persona"
  belongs_to :laboratorista, class_name: "Persona"
  belongs_to :productor
  belongs_to :cania_variedad, :foreign_key => :variedad_id

  after_create :generar_ticket
  after_create :establecer_identificacion
  before_save :establecer_fecha_inicio
  
  def self.estados
    %w(Iniciado Ingresado Analizado Entregado)
  end

  def AnalisisPrezafra.generar_identificador(numero)
    numero = numero % 1000000
    Date.today.to_s.gsub(/-/,'') + " " + ("%06d" % numero) + "PZ"
  end

  def establecer_identificacion
    self.identificacion = AnalisisPrezafra.generar_identificador(self.id)
    self.save
  end

  def generar_ticket
    # TODO
  end

  def establecer_fecha_inicio
    self.fecha_inicio ||= Date.today
  end

end

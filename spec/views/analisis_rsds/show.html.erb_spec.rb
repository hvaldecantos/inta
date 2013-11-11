require 'spec_helper'

describe "analisis_rsds/show" do
  before(:each) do
    @analisis_rsd = assign(:analisis_rsd, stub_model(AnalisisRsd,
      :cania_variedad_id => 1,
      :membrana => "Membrana",
      :parcela_id => 2,
      :paraje_id => 3,
      :departamento_id => 4,
      :comuna_municipio_id => 5,
      :localidad_id => 6,
      :productor_id => 7,
      :procedencia_id => 8,
      :agente_id => 9,
      :promotor_id => 10,
      :laboratorista_id => 11,
      :incidencia => 1.5,
      :analizado => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Membrana/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/4/)
    rendered.should match(/5/)
    rendered.should match(/6/)
    rendered.should match(/7/)
    rendered.should match(/8/)
    rendered.should match(/9/)
    rendered.should match(/10/)
    rendered.should match(/11/)
    rendered.should match(/1.5/)
    rendered.should match(/false/)
  end
end

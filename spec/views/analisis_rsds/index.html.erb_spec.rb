require 'spec_helper'

describe "analisis_rsds/index" do
  before(:each) do
    assign(:analisis_rsds, [
      stub_model(AnalisisRsd,
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
      ),
      stub_model(AnalisisRsd,
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
      )
    ])
  end

  it "renders a list of analisis_rsds" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Membrana".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => 7.to_s, :count => 2
    assert_select "tr>td", :text => 8.to_s, :count => 2
    assert_select "tr>td", :text => 9.to_s, :count => 2
    assert_select "tr>td", :text => 10.to_s, :count => 2
    assert_select "tr>td", :text => 11.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end

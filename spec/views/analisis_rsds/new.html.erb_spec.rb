require 'spec_helper'

describe "analisis_rsds/new" do
  before(:each) do
    assign(:analisis_rsd, stub_model(AnalisisRsd,
      :variedad_id => 1,
      :membrana => "MyString",
      :parcela_id => 1,
      :paraje_id => 1,
      :departamento_id => 1,
      :comuna_municipio_id => 1,
      :localidad_id => 1,
      :productor_id => 1,
      :procedencia_id => 1,
      :agente_id => 1,
      :promotor_id => 1,
      :laboratorista_id => 1,
      :incidencia => 1.5,
      :analizado => false
    ).as_new_record)
  end

  it "renders new analisis_rsd form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", analisis_rsds_path, "post" do
      assert_select "input#analisis_rsd_variedad_id[name=?]", "analisis_rsd[variedad_id]"
      assert_select "input#analisis_rsd_membrana[name=?]", "analisis_rsd[membrana]"
      assert_select "input#analisis_rsd_parcela_id[name=?]", "analisis_rsd[parcela_id]"
      assert_select "input#analisis_rsd_paraje_id[name=?]", "analisis_rsd[paraje_id]"
      assert_select "input#analisis_rsd_departamento_id[name=?]", "analisis_rsd[departamento_id]"
      assert_select "input#analisis_rsd_comuna_municipio_id[name=?]", "analisis_rsd[comuna_municipio_id]"
      assert_select "input#analisis_rsd_localidad_id[name=?]", "analisis_rsd[localidad_id]"
      assert_select "input#analisis_rsd_productor_id[name=?]", "analisis_rsd[productor_id]"
      assert_select "input#analisis_rsd_procedencia_id[name=?]", "analisis_rsd[procedencia_id]"
      assert_select "input#analisis_rsd_agente_id[name=?]", "analisis_rsd[agente_id]"
      assert_select "input#analisis_rsd_promotor_id[name=?]", "analisis_rsd[promotor_id]"
      assert_select "input#analisis_rsd_laboratorista_id[name=?]", "analisis_rsd[laboratorista_id]"
      assert_select "input#analisis_rsd_incidencia[name=?]", "analisis_rsd[incidencia]"
      assert_select "input#analisis_rsd_analizado[name=?]", "analisis_rsd[analizado]"
    end
  end
end

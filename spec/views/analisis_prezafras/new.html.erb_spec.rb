require 'spec_helper'

describe "analisis_prezafras/new" do
  before(:each) do
    assign(:analisis_prezafra, stub_model(AnalisisPrezafra,
      :identificacion => "MyString",
      :productor_id => 1,
      :parcela_id => 1,
      :agente_id => 1,
      :promotor_id => 1,
      :laboratorista_id => 1,
      :latlon => "",
      :peso_muestra => 1.5,
      :peso_tallo => 1.5,
      :variedad_id => 1,
      :brix_pct => 1.5,
      :lectura_polar => 1.5,
      :pol_pct_jugo => 1.5,
      :pureza_pct => 1.5,
      :pol_pct_cania => 1.5,
      :rto_pct => 1.5,
      :estado => "MyString",
      :observaciones => "MyString"
    ).as_new_record)
  end

  it "renders new analisis_prezafra form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", analisis_prezafras_path, "post" do
      assert_select "input#analisis_prezafra_identificacion[name=?]", "analisis_prezafra[identificacion]"
      assert_select "input#analisis_prezafra_productor_id[name=?]", "analisis_prezafra[productor_id]"
      assert_select "input#analisis_prezafra_parcela_id[name=?]", "analisis_prezafra[parcela_id]"
      assert_select "input#analisis_prezafra_agente_id[name=?]", "analisis_prezafra[agente_id]"
      assert_select "input#analisis_prezafra_promotor_id[name=?]", "analisis_prezafra[promotor_id]"
      assert_select "input#analisis_prezafra_laboratorista_id[name=?]", "analisis_prezafra[laboratorista_id]"
      assert_select "input#analisis_prezafra_latlon[name=?]", "analisis_prezafra[latlon]"
      assert_select "input#analisis_prezafra_peso_muestra[name=?]", "analisis_prezafra[peso_muestra]"
      assert_select "input#analisis_prezafra_peso_tallo[name=?]", "analisis_prezafra[peso_tallo]"
      assert_select "input#analisis_prezafra_variedad_id[name=?]", "analisis_prezafra[variedad_id]"
      assert_select "input#analisis_prezafra_brix_pct[name=?]", "analisis_prezafra[brix_pct]"
      assert_select "input#analisis_prezafra_lectura_polar[name=?]", "analisis_prezafra[lectura_polar]"
      assert_select "input#analisis_prezafra_pol_pct_jugo[name=?]", "analisis_prezafra[pol_pct_jugo]"
      assert_select "input#analisis_prezafra_pureza_pct[name=?]", "analisis_prezafra[pureza_pct]"
      assert_select "input#analisis_prezafra_pol_pct_cania[name=?]", "analisis_prezafra[pol_pct_cania]"
      assert_select "input#analisis_prezafra_rto_pct[name=?]", "analisis_prezafra[rto_pct]"
      assert_select "input#analisis_prezafra_estado[name=?]", "analisis_prezafra[estado]"
      assert_select "input#analisis_prezafra_observaciones[name=?]", "analisis_prezafra[observaciones]"
    end
  end
end

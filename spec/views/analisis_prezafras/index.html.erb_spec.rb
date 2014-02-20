require 'spec_helper'

describe "analisis_prezafras/index" do
  before(:each) do
    assign(:analisis_prezafras, [
      stub_model(AnalisisPrezafra,
        :identificacion => "Identificacion",
        :productor_id => 1,
        :parcela_id => 2,
        :agente_id => 3,
        :promotor_id => 4,
        :laboratorista_id => 5,
        :latlon => "",
        :peso_muestra => 1.5,
        :peso_tallo => 1.5,
        :variedad_id => 6,
        :brix_pct => 1.5,
        :lectura_polar => 1.5,
        :pol_pct_jugo => 1.5,
        :pureza_pct => 1.5,
        :pol_pct_cania => 1.5,
        :rto_pct => 1.5,
        :estado => "Estado",
        :observaciones => "Observaciones"
      ),
      stub_model(AnalisisPrezafra,
        :identificacion => "Identificacion",
        :productor_id => 1,
        :parcela_id => 2,
        :agente_id => 3,
        :promotor_id => 4,
        :laboratorista_id => 5,
        :latlon => "",
        :peso_muestra => 1.5,
        :peso_tallo => 1.5,
        :variedad_id => 6,
        :brix_pct => 1.5,
        :lectura_polar => 1.5,
        :pol_pct_jugo => 1.5,
        :pureza_pct => 1.5,
        :pol_pct_cania => 1.5,
        :rto_pct => 1.5,
        :estado => "Estado",
        :observaciones => "Observaciones"
      )
    ])
  end

  it "renders a list of analisis_prezafras" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Identificacion".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "Estado".to_s, :count => 2
    assert_select "tr>td", :text => "Observaciones".to_s, :count => 2
  end
end

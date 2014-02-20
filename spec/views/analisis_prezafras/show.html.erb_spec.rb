require 'spec_helper'

describe "analisis_prezafras/show" do
  before(:each) do
    @analisis_prezafra = assign(:analisis_prezafra, stub_model(AnalisisPrezafra,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Identificacion/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/4/)
    rendered.should match(/5/)
    rendered.should match(//)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/6/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/Estado/)
    rendered.should match(/Observaciones/)
  end
end

require 'spec_helper'

describe "cania_variedades/show" do
  before(:each) do
    @cania_variedad = assign(:cania_variedad, stub_model(CaniaVariedad,
      :nombre => "Nombre",
      :descripcion => "Descripcion"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nombre/)
    rendered.should match(/Descripcion/)
  end
end

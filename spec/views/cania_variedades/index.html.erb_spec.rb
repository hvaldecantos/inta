require 'spec_helper'

describe "cania_variedades/index" do
  before(:each) do
    assign(:cania_variedades, [
      stub_model(CaniaVariedad,
        :nombre => "Nombre",
        :descripcion => "Descripcion"
      ),
      stub_model(CaniaVariedad,
        :nombre => "Nombre",
        :descripcion => "Descripcion"
      )
    ])
  end

  it "renders a list of cania_variedades" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nombre".to_s, :count => 2
    assert_select "tr>td", :text => "Descripcion".to_s, :count => 2
  end
end

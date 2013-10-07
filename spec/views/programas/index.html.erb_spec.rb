require 'spec_helper'

describe "programas/index" do
  before(:each) do
    assign(:programas, [
      stub_model(Programa,
        :nombre => "Nombre",
        :descripcion => "Descripcion"
      ),
      stub_model(Programa,
        :nombre => "Nombre",
        :descripcion => "Descripcion"
      )
    ])
  end

  it "renders a list of programas" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nombre".to_s, :count => 2
    assert_select "tr>td", :text => "Descripcion".to_s, :count => 2
  end
end

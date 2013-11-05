require 'spec_helper'

describe "productores/index" do
  before(:each) do
    assign(:productores, [
      stub_model(Productor,
        :nombre => "Nombre",
        :apellido => "Apellido",
        :dni => "Dni",
        :departamento_id => 1,
        :comuna_municipio_id => 2,
        :agencia => "Agencia",
        :email_extensionista => "Email Extensionista"
      ),
      stub_model(Productor,
        :nombre => "Nombre",
        :apellido => "Apellido",
        :dni => "Dni",
        :departamento_id => 1,
        :comuna_municipio_id => 2,
        :agencia => "Agencia",
        :email_extensionista => "Email Extensionista"
      )
    ])
  end

  it "renders a list of productores" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nombre".to_s, :count => 2
    assert_select "tr>td", :text => "Apellido".to_s, :count => 2
    assert_select "tr>td", :text => "Dni".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Agencia".to_s, :count => 2
    assert_select "tr>td", :text => "Email Extensionista".to_s, :count => 2
  end
end

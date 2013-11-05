require 'spec_helper'

describe "productores/show" do
  before(:each) do
    @productor = assign(:productor, stub_model(Productor,
      :nombre => "Nombre",
      :apellido => "Apellido",
      :dni => "Dni",
      :departamento_id => 1,
      :comuna_municipio_id => 2,
      :agencia => "Agencia",
      :email_extensionista => "Email Extensionista"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nombre/)
    rendered.should match(/Apellido/)
    rendered.should match(/Dni/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Agencia/)
    rendered.should match(/Email Extensionista/)
  end
end

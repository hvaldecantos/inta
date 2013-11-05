require 'spec_helper'

describe "productores/edit" do
  before(:each) do
    @productor = assign(:productor, stub_model(Productor,
      :nombre => "MyString",
      :apellido => "MyString",
      :dni => "MyString",
      :departamento_id => 1,
      :comuna_municipio_id => 1,
      :agencia => "MyString",
      :email_extensionista => "MyString"
    ))
  end

  it "renders the edit productor form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", productor_path(@productor), "post" do
      assert_select "input#productor_nombre[name=?]", "productor[nombre]"
      assert_select "input#productor_apellido[name=?]", "productor[apellido]"
      assert_select "input#productor_dni[name=?]", "productor[dni]"
      assert_select "input#productor_departamento_id[name=?]", "productor[departamento_id]"
      assert_select "input#productor_comuna_municipio_id[name=?]", "productor[comuna_municipio_id]"
      assert_select "input#productor_agencia[name=?]", "productor[agencia]"
      assert_select "input#productor_email_extensionista[name=?]", "productor[email_extensionista]"
    end
  end
end

require 'spec_helper'

describe "productores/new" do
  before(:each) do
    assign(:productor, stub_model(Productor,
      :nombre => "MyString",
      :apellido => "MyString",
      :dni => "MyString",
      :departamento_id => 1,
      :comuna_municipio_id => 1,
      :agencia => "MyString",
      :email_extensionista => "MyString"
    ).as_new_record)
  end

  it "renders new productor form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", productores_path, "post" do
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

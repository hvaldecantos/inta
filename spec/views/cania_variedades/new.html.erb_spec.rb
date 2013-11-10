require 'spec_helper'

describe "cania_variedades/new" do
  before(:each) do
    assign(:cania_variedad, stub_model(CaniaVariedad,
      :nombre => "MyString",
      :descripcion => "MyString"
    ).as_new_record)
  end

  it "renders new cania_variedad form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", cania_variedades_path, "post" do
      assert_select "input#cania_variedad_nombre[name=?]", "cania_variedad[nombre]"
      assert_select "input#cania_variedad_descripcion[name=?]", "cania_variedad[descripcion]"
    end
  end
end

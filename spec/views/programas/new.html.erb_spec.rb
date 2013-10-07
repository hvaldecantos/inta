require 'spec_helper'

describe "programas/new" do
  before(:each) do
    assign(:programa, stub_model(Programa,
      :nombre => "MyString",
      :descripcion => "MyString"
    ).as_new_record)
  end

  it "renders new programa form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", programas_path, "post" do
      assert_select "input#programa_nombre[name=?]", "programa[nombre]"
      assert_select "input#programa_descripcion[name=?]", "programa[descripcion]"
    end
  end
end

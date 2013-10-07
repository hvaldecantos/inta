require 'spec_helper'

describe "programas/edit" do
  before(:each) do
    @programa = assign(:programa, stub_model(Programa,
      :nombre => "MyString",
      :descripcion => "MyString"
    ))
  end

  it "renders the edit programa form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", programa_path(@programa), "post" do
      assert_select "input#programa_nombre[name=?]", "programa[nombre]"
      assert_select "input#programa_descripcion[name=?]", "programa[descripcion]"
    end
  end
end

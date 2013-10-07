require 'spec_helper'

describe "programas/show" do
  before(:each) do
    @programa = assign(:programa, stub_model(Programa,
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

require 'spec_helper'

describe "AnalisisPrezafras" do
  describe "GET /analisis_prezafras" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get analisis_prezafras_path
      response.status.should be(200)
    end
  end
end

require "spec_helper"

describe "Routes for paginas estaticas" do
  describe "When named routes are translated to a controller action" do
    it "should translate inicio_path to paginas_estaticas#inicio" do
      expect(:get => root_path).to route_to(:controller => "paginas_estaticas", :action => "inicio")
    end
    it "should translate acerca_path to paginas_estaticas#acerca" do
      expect(:get => acerca_path).to route_to(:controller => "paginas_estaticas", :action => "acerca")
    end
    it "should translate ayuda_path to paginas_estaticas#ayuda" do
      expect(:get => ayuda_path).to route_to(:controller => "paginas_estaticas", :action => "ayuda")
    end
    it "should translate contacto_path to paginas_estaticas#contacto" do
      expect(:get => contacto_path).to route_to(:controller => "paginas_estaticas", :action => "contacto")
    end
  end

  describe "When named routes are translated to the right uri" do
    it 'should translate inicio_path to /inicio URI' do
      root_path.should == '/'
    end
    it 'should translate paginas_estaticas_acerca_path to /paginas_estaticas/acerca URI' do
      acerca_path.should == '/acerca'
    end
    it 'should translate paginas_estaticas_ayuda_path to /paginas_estaticas/ayuda URI' do
      ayuda_path.should == '/ayuda'
    end
    it 'should translate paginas_estaticas_contacto_path to /paginas_estaticas/contacto URI' do
      contacto_path.should == '/contacto'
    end
    
  end
end

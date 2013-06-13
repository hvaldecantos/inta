require "spec_helper"

describe "Routes for paginas estaticas" do
  describe "When named routes are translated to a controller action" do
    it "should translate paginas_estaticas_inicio_path to paginas_estaticas#inicio" do
      expect(:get => paginas_estaticas_inicio_path).to route_to(:controller => "paginas_estaticas", :action => "inicio")
    end
    it "should translate paginas_estaticas_acerca_path to paginas_estaticas#acerca" do
      expect(:get => paginas_estaticas_acerca_path).to route_to(:controller => "paginas_estaticas", :action => "acerca")
    end
    it "should translate paginas_estaticas_ayuda_path to paginas_estaticas#ayuda" do
      expect(:get => paginas_estaticas_ayuda_path).to route_to(:controller => "paginas_estaticas", :action => "ayuda")
    end
    it "should translate paginas_estaticas_contacto_path to paginas_estaticas#contacto" do
      expect(:get => paginas_estaticas_contacto_path).to route_to(:controller => "paginas_estaticas", :action => "contacto")
    end
  end

  describe "When named routes are translated to the right uri" do
    it 'should translate paginas_estaticas_inicio_path to /paginas_estaticas/inicio URI' do
      paginas_estaticas_inicio_path.should == '/paginas_estaticas/inicio'
    end
    it 'should translate paginas_estaticas_acerca_path to /paginas_estaticas/acerca URI' do
      paginas_estaticas_acerca_path.should == '/paginas_estaticas/acerca'
    end
    it 'should translate paginas_estaticas_ayuda_path to /paginas_estaticas/ayuda URI' do
      paginas_estaticas_ayuda_path.should == '/paginas_estaticas/ayuda'
    end
    it 'should translate paginas_estaticas_contacto_path to /paginas_estaticas/contacto URI' do
      paginas_estaticas_contacto_path.should == '/paginas_estaticas/contacto'
    end
    
  end
end

require 'spec_helper'

describe "Paginas Estaticas" do
  
  describe "Pagina de Inicio" do
    it "should have the content 'INTA'" do
      visit '/paginas_estaticas/inicio'
      page.should have_content('INTA')
    end
  end

  describe "Pagina de Ayuda" do
    it "should have the content 'Ayuda'" do
      visit '/paginas_estaticas/ayuda'
      page.should have_content('Ayuda')
    end
  end

  describe "Pagina Acerca" do
    it "should have the content 'Acerca'" do
      visit '/paginas_estaticas/acerca'
      page.should have_content('Acerca')
    end
  end
end
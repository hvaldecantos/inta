require 'spec_helper'

describe "Paginas Estaticas" do
  
  describe "Pagina de Inicio" do
    it "should have the content 'INTA'" do
      visit '/paginas_estaticas/inicio'
      page.should have_content('INTA')
    end

    it "should have the right title" do
      visit '/paginas_estaticas/inicio'
      page.should have_title "Sitio Web INTA Famaillá | Inicio"
    end
  end

  describe "Pagina de Ayuda" do
    it "should have the content 'Ayuda'" do
      visit '/paginas_estaticas/ayuda'
      page.should have_content('Ayuda')
    end

    it "should have the right title" do
      visit '/paginas_estaticas/ayuda'
      page.should have_title "Sitio Web INTA Famaillá | Ayuda"
    end
  end

  describe "Pagina Acerca" do
    it "should have the content 'Acerca'" do
      visit '/paginas_estaticas/acerca'
      page.should have_content('Acerca')
    end

    it "should have the right title" do
      visit '/paginas_estaticas/acerca'
      page.should have_title "Sitio Web INTA Famaillá | Acerca"
    end
  end
end
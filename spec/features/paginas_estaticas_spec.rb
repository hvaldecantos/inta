require 'spec_helper'

describe "Paginas Estaticas" do
  
  describe "Pagina de Inicio" do
    it "should have the h1 'INTA'" do
      visit '/paginas_estaticas/inicio'
      page.should have_selector('h1', text: 'INTA')
    end

    it "should have the right title" do
      visit '/paginas_estaticas/inicio'
      page.should have_title "Sitio Web INTA Famaillá | Inicio"
    end
  end

  describe "Pagina de Ayuda" do
    it "should have the h1 'Ayuda'" do
      visit '/paginas_estaticas/ayuda'
      page.should have_selector('h1', text: 'Ayuda')
    end

    it "should have the right title" do
      visit '/paginas_estaticas/ayuda'
      page.should have_title "Sitio Web INTA Famaillá | Ayuda"
    end
  end

  describe "Pagina Acerca" do
    it "should have the h1 'Acerca'" do
      visit '/paginas_estaticas/acerca'
      page.should have_selector('h1', text: 'Acerca')
    end

    it "should have the right title" do
      visit '/paginas_estaticas/acerca'
      page.should have_title "Sitio Web INTA Famaillá | Acerca"
    end
  end

  describe "Pagina de Contacto" do
    it "should have the h1 'Contacto'" do
      visit '/paginas_estaticas/contacto'
      page.should have_selector('h1', text: 'Contacto')
    end

    it "should have the right title" do
      visit '/paginas_estaticas/contacto'
      page.should have_title "Sitio Web INTA Famaillá | Contacto"
    end
  end
end
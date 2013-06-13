require 'spec_helper'

describe "Paginas Estaticas" do
  
  let(:base_title) { "Sitio Web INTA Famaillá" }

  describe "Pagina de Inicio" do
    it "should have the h1 'INTA'" do
      visit root_path
      page.should have_selector('h1', text: 'INTA')
    end

    it "should have the right title" do
      visit root_path
      page.should have_title "#{base_title} | Inicio"
    end
  end

  describe "Pagina de Ayuda" do
    it "should have the h1 'Ayuda'" do
      visit ayuda_path
      page.should have_selector('h1', text: 'Ayuda')
    end

    it "should have the right title" do
      visit ayuda_path
      page.should have_title "#{base_title} | Ayuda"
    end
  end

  describe "Pagina Acerca" do
    it "should have the h1 'Acerca'" do
      visit acerca_path
      page.should have_selector('h1', text: 'Acerca')
    end

    it "should have the right title" do
      visit acerca_path
      page.should have_title "#{base_title} | Acerca"
    end
  end

  describe "Pagina de Contacto" do
    it "should have the h1 'Contacto'" do
      visit contacto_path
      page.should have_selector('h1', text: 'Contacto')
    end

    it "should have the right title" do
      visit contacto_path
      page.should have_title "#{base_title} | Contacto"
    end
  end
end
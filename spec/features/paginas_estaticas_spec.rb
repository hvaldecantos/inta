require 'spec_helper'

describe "Paginas Estaticas" do

  subject { page }

  let(:base_title) { "Sitio Web INTA Famaillá" }

  describe "Pagina de Inicio" do
    before { visit root_path }
    it { should have_selector('h1', text: 'INTA')}
    it { should have_title "#{base_title} | Inicio"}
  end

  describe "Pagina de Ayuda" do
    before { visit ayuda_path }
    it { should have_selector('h1', text: 'Ayuda') }
    it { should have_title "#{base_title} | Ayuda" }
  end

  describe "Pagina Acerca" do
    before { visit acerca_path }
    it { should have_selector('h1', text: 'Acerca') }
    it { should have_title "#{base_title} | Acerca" }
  end

  describe "Pagina Contacto" do
    before { visit contacto_path }
    it { should have_selector('h1', text: 'Contacto') }
    it { should have_title "#{base_title} | Contacto" }
  end
  
end
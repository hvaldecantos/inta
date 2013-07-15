require 'spec_helper'

describe "Paginas Estaticas" do

  describe "Links on the layout" do
    let(:user) { FactoryGirl.create(:user) }
    it "should have right links before user is logged" do
      visit root_path
      click_link "Acerca"
      page.should have_title full_title("Acerca")
      click_link "Contacto"
      page.should have_title full_title("Contacto")
      click_link "Ayuda"
      page.should have_title full_title("Ayuda")
      click_link "Entrar"
      page.should have_title full_title("Autenticación")
      click_link "Inicio"
      page.should have_title full_title("Inicio")
    end
    it "should have right links after user is logged" do
      visit root_path
      click_link "Entrar"
      fill_in "Email", with: user.email
      fill_in "Contraseña", with: user.password  # fill_in I18n.t('activerecord.attributes.user.password'), with: user.password  
      click_button "Autenticar"
      click_link "Inicio" # Link Inicio points now to menu page
      page.should have_title full_title("Menu")
    end
  end

  subject { page }

  describe "Pagina de Inicio" do
    before { visit root_path }
    it { should have_selector('h1', text: 'INTA')}
    it { should have_title full_title("Inicio")}
  end

  describe "Pagina de Ayuda" do
    before { visit ayuda_path }
    it { should have_selector('h1', text: 'Ayuda') }
    it { should have_title full_title("Ayuda") }
  end

  describe "Pagina Acerca" do
    before { visit acerca_path }
    it { should have_selector('h1', text: 'Acerca') }
    it { should have_title full_title("Acerca") }
  end

  describe "Pagina Contacto" do
    before { visit contacto_path }
    it { should have_selector('h1', text: 'Contacto') }
    it { should have_title full_title("Contacto") }
  end
  
  describe "Pagina Menu" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      visit new_user_session_path
      fill_in "Email", with: user.email
      fill_in "Contraseña", with: user.password  # fill_in I18n.t('activerecord.attributes.user.password'), with: user.password  
      click_button "Autenticar"
      visit menu_path
    end
    it { should have_selector('h1', text: 'Menu') }
    it { should have_title full_title("Menu") }
  end
end

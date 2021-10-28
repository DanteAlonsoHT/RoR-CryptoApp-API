require 'rails_helper'

RSpec.describe 'home/index', type: :system do
  describe 'Analizando elementos renderizados en la ruta raíz' do
    before do
      visit root_path
    end
    it 'Analizando botón para Calcular rendimientos existente' do
      expect(page).to have_button 'Calcular rendimientos'
    end

    it 'Analizando botón para exportar a archivo CSV' do
      expect(page).to have_button 'Exportar CSV'
    end

    it 'Analizando botón para exportar a archivo XLS' do
      expect(page).to have_button 'Exportar EXCEL'
    end

    it 'Analizando botón para exportar a archivo JSON' do
      expect(page).to have_button 'Exportar JSON'
    end
  end
end

RSpec.describe 'home/index', type: :view do
  describe 'Analizando elementos renderizados en la ruta raíz' do
    before(:each) do
      assign(:root_path, [])
    end
    it 'Analizando fila 1 existente, contador es 1' do
      render
      assert_select 'tr>td', text: '1'.to_s, count: 1
    end

    it 'Analizando fila 2 existente, contador es 1' do
      render
      assert_select 'tr>td', text: '2'.to_s, count: 1
    end

    it 'Analizando fila 4 no existente, contador es 0' do
      render
      assert_select 'tr>td', text: '4'.to_s, count: 0
    end

    it "Analizando columna '#' existente, contador es 1" do
      render
      assert_select 'th', text: '#'.to_s, count: 1
    end

    it "Analizando columna 'PRICE(USD)' existente, contador es 1" do
      render
      assert_select 'th', text: 'PRICE(USD)'.to_s, count: 1
    end
  end
end

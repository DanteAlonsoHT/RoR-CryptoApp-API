require 'rails_helper'

RSpec.describe '/', type: :request do
  describe 'Método GET hacia una ruta raíz:' do
    it 'Ir hacia la ruta raíz' do
      get root_path
      expect(response).to be_successful
    end
  end
end

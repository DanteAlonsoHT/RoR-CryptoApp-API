require 'rails_helper'

RSpec.describe ApplicationCable::Connection, type: :channel do
  describe 'Testear la conexión del canal-cable' do
    it 'Probar si conexión responder a conexiones' do
      expect { connect '/cable' }.to_not have_rejected_connection
    end
  end

  describe 'Testear el funcionamiento del canal-cable' do
    before do
      connect '/cable'
    end
    it 'HTTPRequest contiene un Test' do
      expect(connection.request.to_s.include?('TestRequest')).to eq true
    end

    it 'Conexión exitosa mediante GET' do
      expect(connection.request.method).to eq 'GET'
    end

    it 'Se encuentran valores para el entorno conectado' do
      expect(connection.env['REQUEST_METHOD']).to eq 'GET'
    end

    it 'Puerto 80 es usado por el cable' do
      expect(connection.env['SERVER_PORT']).to eq '80'
    end
  end
end

require 'test_helper'

class CryptoValueChannelTest < ActionCable::Channel::TestCase
  test 'subscribes and stream for room' do
    subscribe room: 'CryptoValueChannel'

    # You can access the Channel object via `subscription` in tests
    assert subscription.confirmed?
    assert_has_stream 'crypto_value'
  end
end

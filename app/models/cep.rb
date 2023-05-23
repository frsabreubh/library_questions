require 'net/http'

class CEP
  attr_reader :logradouro, :bairro, :localidade, :uf

  END_POINT = "https://viacep.com.br/ws"
  FORMAT = "json"

  def initialize(cep)
    hash_locate = find_locate_by_cep(cep)
    address_data(hash_locate)
  end

  def address
    "#{@logradouro} / #{@bairro} / #{@localidade} - #{@uf}"
  end

  private

  def address_data(hash_locate)
    @logradouro = hash_locate['logradouro']
    @bairro = hash_locate['bairro']
    @localidade = hash_locate['localidade']
    @uf = hash_locate['uf']
  end

  def find_locate_by_cep(cep)
    ActiveSupport::JSON.decode(
      Net::HTTP.get(
        URI("#{END_POINT}/#{cep}/#{FORMAT}/")
      )
    )
  end  
end
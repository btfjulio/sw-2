class Store < ApplicationRecord
  STORES = [
    { name: 'Netshoes', base_url: 'https://www.netshoes.com.br/suplementos?campaign=compadi' },
    { name: 'Corpo Perfeito', base_url: 'https://www.lojacorpoperfeito.com.br' }
  ]

  validates :name, :base_url, presence: true
  has_many :supplements
end

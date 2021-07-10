FactoryBot.define do
  factory :user do
    name { 'Whey' }
    link { 'https://www.maromba.com.br/whey-1111' }
    flavor { 'Baunilha' }
    external_id { '1111' }
    brand_name { 'Marombinha' }
  end
end

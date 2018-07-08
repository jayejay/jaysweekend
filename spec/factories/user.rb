FactoryBot.define do
  factory :user do
    name 'Hans'
    surname 'ImGlück'
    email { "#{name}.#{surname}@test.de" }
    password 'test123'
    bank_code '21352240'
  end
end
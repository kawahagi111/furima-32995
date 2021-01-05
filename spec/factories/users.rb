FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { 'test@example' }
    password              { 'h00000' }
    password_confirmation { password }
    last_name             { 'た' }
    first_name            { 'い' }
    last_name_kana        { 'タ' }
    first_name_kana       { 'イ' }
    birthday              { '1999-02-18' }
  end
end

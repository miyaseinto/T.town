FactoryBot.define do

  factory :user do
    name                  {"総務課"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    sequence(:email) {"soumu@taiji.town"}
  end

end
FactoryBot.define do
  factory :user do
    password              { '00000000' }
    password_confirmation { '00000000' }
    sequence(:email, %w[soumu@taiji.town jyuumin@taiji.town sanken@taiji.town kyouiku@taiji.town guest@example.com].cycle)
    sequence(:name, %w[総務課 住民福祉課 産業建設課 教育委員会 町民].cycle)
  end
end

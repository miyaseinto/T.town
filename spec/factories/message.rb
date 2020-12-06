FactoryBot.define do
  factory :message do
    content{"hoge"}
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/images/test.jpg')) }
    user
  end

end
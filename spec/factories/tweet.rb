FactoryBot.define do
  factory :tweet do
    name{"hoge"}
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')) }
    text{"hello!"}
    user
  end

end
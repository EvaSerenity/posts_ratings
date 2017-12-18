class SampleDataService

  def self.perform
    ips = []
    50.times { ips << Faker::Internet.ip_v4_address }
    users = []
    100.times { users << UseCases::CreateUser.new(Faker::Name.name).perform.user}
    posts = []
    2000.times do
      posts << UseCases::CreatePost
                   .new(Faker::Lorem.word,
                        Faker::Lorem.paragraph,
                        users.sample,
                        ips.sample)
                   .perform
                   .post
    end

    3000.times do
      UseCases::CreateRating
          .new(posts.sample.id,
               Faker::Number.between(1, 5))
          .perform
    end
  end
end
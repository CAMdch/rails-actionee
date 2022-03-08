namespace :recommendation do
  desc "Enriching all users with Clearbit (async)"
  task auto_creation: :environment do
    Company.all.each do |company|
      RecommendationJob.perform_later(company.symbol)
    end
    # rake task will return when all jobs are _enqueued_ (not done).
  end
end

namespace :stock do
  desc "Enriching all users with Clearbit (async)"
  task auto_creation: :environment do
      Company.all.each do |company|
        StockJob.perform_later(company.symbol)
        puts company.symbol
      end
    # rake task will return when all jobs are _enqueued_ (not done).
  end
end

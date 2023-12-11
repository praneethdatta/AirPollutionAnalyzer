Sidekiq::Cron::Job.create(
  name: 'Air Pollution Import Job - Every Hour',
  # cron: '0 * * * *', # Run every hour
  cron: '* * * * *', # runs every minute
  klass: 'AirPollutionImportWorker'
)

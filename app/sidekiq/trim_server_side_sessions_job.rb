class TrimServerSideSessionsJob
  include Sidekiq::Job

  urgency :low

  def perform(*args)
    cutoff_period = (ENV['SESSION_DAYS_TRIM_THRESHOLD']).to_i.days.ago
    ServerSideSession
      .where('updated_at < ?', cutoff_period)
      .delete_all
  end
end

class Ticket < Sequel::Model
  STATUSES = %w(new open closed)

  def self.status(name)
    STATUSES.index(name)
  end

  def human_status
    STATUSES[status]
  end
end

class Ticket < Sequel::Model
  STATUSES = %w(new open closed)

  def self.status(name)
    STATUSES.index(name)
  end
end

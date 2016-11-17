Pakyow::App.mutable :ticket do
  model Ticket

  action :create do |attributes|
    Ticket.create(attributes)
  end

  query :active do
    Ticket.exclude(status: Ticket.status('closed')).all
  end

  query :closed do
    Ticket.where(status: Ticket.status('closed')).all
  end
end

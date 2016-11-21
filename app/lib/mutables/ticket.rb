Pakyow::App.mutable :ticket do
  model Ticket

  action :create do |attributes|
    Ticket.create(attributes)
  end

  action :update do |id, attributes|
    Ticket.find(id: id).update(attributes)
  end

  action :destroy do |id|
    Ticket.find(id: id).destroy
  end

  query :active do
    Ticket
    .exclude(status: Ticket.status('closed'))
    .order(Sequel.desc(:id))
    .all
  end

  query :closed do
    Ticket
    .where(status: Ticket.status('closed'))
    .order(Sequel.asc(:id))
    .all
  end
end

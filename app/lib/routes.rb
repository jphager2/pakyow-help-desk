Pakyow::App.routes do
  get '/' do
    active = data(:ticket).active
    closed = data(:ticket).closed

    view.scope(:ticket).bind(Ticket.new(status: Ticket.status('new')))
    view.scope(:'active-ticket').mutate(:list, with: active).subscribe
    view.scope(:'closed-ticket').mutate(:list, with: closed).subscribe
  end

  restful :ticket, 'tickets' do
    create do
      data(:ticket).create(params[:ticket])

      redirect '/'
    end
  end
end

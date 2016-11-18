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
    end

    delete :delete, ':ticket_id' do
      data(:ticket).destroy(params[:ticket_id])
    end

    put :open, ':ticket_id/open' do
      data(:ticket).update(
        params[:ticket_id], status: Ticket.status('open')
      )

      redirect '/'
    end

    put :close, ':ticket_id/close' do
      data(:ticket).update(
        params[:ticket_id], status: Ticket.status('closed')
      )

      redirect '/'
    end
  end
end

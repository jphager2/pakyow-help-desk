Pakyow::App.bindings do
  scope :ticket do
    restful :ticket
  end

  scope :'active-ticket' do
    binding :status do
      part :class do |klass|
        other = Ticket::STATUSES - [bindable.human_status]
        other.each { |status| klass.deny(status) }
        klass.ensure(bindable.human_status)
      end
      
      part :content do
        bindable.human_status.capitalize
      end
    end

    binding :'open-link' do
      part :action do |action|
        path = router.group(:ticket).path(:open, ticket_id: bindable.id)
        action.set(path)
      end
      part :method do |method|
        method.set('PUT')
      end
      part :style do |style|
        if bindable.human_status == "open"
          style.set({ display: 'none' })
          style
        end
      end
    end

    binding :'close-link' do
      part :action do |action|
        path = router.group(:ticket).path(:close, ticket_id: bindable.id)
        action.set(path)
      end
      part :method do |method|
        method.set('PUT')
      end
    end
  end

  scope :'closed-ticket' do
    binding :'delete-link' do
      part :action do |action|
        path = router.group(:ticket).path(:remove, ticket_id: bindable.id)
        action.set(path)
      end
      part :method do |method|
        method.set('DELETE')
      end
    end
  end
end

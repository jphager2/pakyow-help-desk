Pakyow::App.bindings do
  scope :ticket do
    restful :ticket
  end

  scope :'active-ticket' do
    binding :status do
      part :class do |klass|
        # How can I make sure that the old status is removed?
        klass.ensure(bindable.human_status)
      end
      
      part :content do
        # How can I use the api to build the attr data into the payload?
        bindable.human_status.capitalize
      end
    end

    binding :'open-link' do
      part :action do |action|
        path = router.group(:ticket).path(:open, ticket_id: bindable.id)
        action.ensure(path)
      end
      part :method do |method|
        method.ensure('PUT')
      end
      part :style do |style|
        if bindable.human_status == "open"
          # How can I use the api to build the attr data into the payload?
          #style.update(display: 'none')
          [['display', 'none']]
        end
      end
    end

    binding :'close-link' do
      part :action do |action|
        path = router.group(:ticket).path(:close, ticket_id: bindable.id)
        action.ensure(path)
      end
      part :method do |method|
        method.ensure('PUT')
      end
    end
  end

  scope :'closed-ticket' do
    binding :'delete-link' do
      part :action do |action|
        path = router.group(:ticket).path(:remove, ticket_id: bindable.id)
        action.ensure(path)
      end
      part :method do |method|
        method.ensure('DELETE')
      end
    end
  end
end

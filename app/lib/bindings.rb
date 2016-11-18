Pakyow::App.bindings do
  scope :ticket do
    restful :ticket
  end

  scope :'active-ticket' do
    binding :status do
      part :class do |klass|
        klass.ensure(bindable.human_status)
      end
      
      part :content do
        bindable.human_status.capitalize
      end
    end

    binding :'open-link' do
      part :action do
        router.group(:ticket).path(:open, ticket_id: bindable.id)
      end
      part :method do
        'PUT'
      end
      part :style do
        if bindable.human_status == "open"
          [["display", "none"]]
        end
      end
    end

    binding :'close-link' do
      part :action do
        router.group(:ticket).path(:close, ticket_id: bindable.id)
      end
      part :method do
        'PUT'
      end
    end
  end

  scope :'closed-ticket' do
    binding :'delete-link' do
      part :action do
        router.group(:ticket).path(:delete, ticket_id: bindable.id)
      end
      part :method do
        'DELETE'
      end
    end
  end
end

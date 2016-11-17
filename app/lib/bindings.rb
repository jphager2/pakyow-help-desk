Pakyow::App.bindings do
  scope :ticket do
    restful :ticket
  end

  scope :'active-ticket' do
    binding :status do
      part :class do |klass|
        klass.ensure(bindable.status)
      end
    end
  end
end

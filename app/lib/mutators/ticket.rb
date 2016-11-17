Pakyow::App.mutators :'active-ticket' do
  mutator :list do |view, tickets|
    view.apply(tickets)
  end
end

Pakyow::App.mutators :'closed-ticket' do
  mutator :list do |view, tickets|
    view.apply(tickets)
  end
end

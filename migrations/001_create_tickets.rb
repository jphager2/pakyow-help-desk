Sequel.migration do
  up do
    create_table :tickets do
      primary_key :id
      String :title
      String :description, text: true
      Integer :status
    end
  end

  down do
    drop_table :tickets
  end
end



Sequel.migration do
  change do
    create_table :entries do
      primary_key :id
      String :text
      String :email
      String :uuid
      DateTime :create_date
    end
  end
end

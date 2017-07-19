class Client
  attr_reader(:name, :stylist_id)

  # initialize method.
  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @stylist_id = attributes.fetch(:stylist_id)
  end

  # loops fetching all the clients in the database.
  define_singleton_method(:all) do
    returned_clients = DB.exec('SELECT * FROM clients;')
    clients = []
    returned_clients.each do |client|
      name = client.fetch('name')
      stylist_id = client.fetch('stylist_id').to_i
      clients.push(Client.new(name: name, stylist_id: stylist_id))
    end
    clients
  end

  # find data through the database.
  define_singleton_method(:find) do |id|
    result = DB.exec("SELECT * FROM clients WHERE id = #{id};")
    name = result.first.fetch('name')
    Client.new(name: name, id: id)
  end

  # save method.
  define_method(:save) do
    result = DB.exec("INSERT INTO clients (name, stylist_id) VALUES ('#{@name}', #{@stylist_id});")
  end

  # compare method.
  define_method(:==) do |another_client|
    name.==(another_client.name).&(stylist_id.==(another_client.stylist_id))
  end

  # update method.
  define_method(:update) do |attributes|
    @name = attributes.fetch(:name, @name)
    @id = id
    DB.exec("UPDATE clients SET name = '#{@name}' WHERE id = #{@id};")
  end

  # delete function.
  define_method(:delete) do
    DB.exec("DELETE FROM clients WHERE id = #{stylist};")
  end
end

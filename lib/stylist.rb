class Stylist
  attr_reader(:name, :id)

  # initialize method.
  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  # fetches all the names of the stylist's available.
  define_singleton_method(:all) do
    returned_stylists = DB.exec('SELECT * FROM stylists;')
    stylists = []
    returned_stylists.each do |stylist|
      name = stylist.fetch('name')
      id = stylist.fetch('id').to_i
      stylists.push(Stylist.new(name: name, id: id))
    end
    stylists
  end

  # finds all the data.
  # define_singleton_method(:find) do |id|
  #   result = DB.exec("SELECT * FROM stylists WHERE id = #{id};")
  #   name = result.first.fetch('name')
  #   Stylist.new(name: name, id: id)
  # end

  #find again.
  define_singleton_method(:find) do |id|
    found_stylist = nil
    Stylist.all().each() do |stylist|
      if stylist.id().==(id)
        found_stylist = stylist
      end
    end
    found_stylist
  end

  #client side
  define_method(:clients) do
    stylist_clients = []
    clients = DB.exec("SELECT * FROM clients WHERE stylist_id = #{self.id()};")
    clients.each() do |client|
      name = client.fetch("name")
      stylist_id = client.fetch("stylist_id").to_i()
      stylist_clients.push(Client.new({:name => name, :stylist_id => stylist_id}))
    end
    stylist_clients
  end

  # method which will save my data.
  define_method(:save) do
    result = DB.exec("INSERT INTO stylists (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first.fetch('id').to_i
  end

  # method which compares two objects and if similiar will save as one.
  define_method(:==) do |another_stylist|
    self.name().==(another_stylist.name).&(self.id().==(another_stylist.id))
  end

  # method to update our objects.
  define_method(:update) do |attributes|
    @name = attributes.fetch(:name, @name)
    @id = id
    DB.exec("UPDATE stylists SET name = '#{@name}' WHERE id = #{@id};")
  end

  # delete function.
  define_method(:delete) do
    DB.exec("DELETE FROM stylists WHERE id = #{id};")
  end
end

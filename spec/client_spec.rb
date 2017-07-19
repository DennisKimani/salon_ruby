require('spec_helper')

describe(Client) do
  # initialize method for the client.
  # describe(:initialize) do
  #   it('is initialized with a name') do
  #     client = Client.new(name: 'Lucy', id: nil)
  #     expect(client).to(be_an_instance_of(Client))
  #   end
  #   it('can be initialized with its database ID') do
  #     client = Client.new(name: 'Lucy', id: 1)
  #     expect(client).to(be_an_instance_of(Client))
  #   end
  # end

  # displays all of the clients name.
  # describe('.all') do
  #   it('starts off with no movies') do
  #     expect(Client.all).to(eq([]))
  #   end
  # end

  # save function.
  describe('#save') do
    it('adds a client to the array of saved clients') do
      test_client = Client.new(name: 'Lucy', stylist_id: 1)
      test_client.save
      expect(Client.all).==([test_client])
    end
  end

  # displays the name of client.
  describe('#name') do
    it('lets you read the names out') do
      test_client = Client.new(name: 'Lucy', stylist_id: 1)
      expect(test_client.name).to(eq('Lucy'))
    end
  end

  # calls the stylist id.
  describe('#stylist_id') do
    it('lets you read the stylist ID out') do
      test_client = Client.new(name: 'Hannah', stylist_id: 1)
      expect(test_client.stylist_id).to(eq(1))
    end
  end

  # finds the client through the id.
  # describe('.find') do
  #   it('returns a client by its ID number') do
  #     test_client = Client.new(name: 'John', id: nil)
  #     test_client.save
  #     test_client2 = Client.new(name: 'Wanja', id: nil)
  #     test_client2.save
  #     expect(Client.find(test_client2.id)).to(eq(test_client2))
  #   end
  # end

  # compares the info for both the info  entered and that stored.
  describe('#==') do
    it('is the same client if it has the same name and stylist ID') do
      client = Client.new(name: 'Vivian', stylist_id: 1)
      client2 = Client.new(name: 'Vivian', stylist_id: 1)
      expect(client).to(eq(client2))
    end
  end

  # updates the existing client.
  # describe('#update') do
  #   it('updates the client in the database') do
  #     client = Client.new(name: 'George', id: nil)
  #     client.save
  #     client.update(name: 'Kimani')
  #     expect(client.name).to(eq('Kimani'))
  #   end
  # end

  # delete function
  # describe('#delete') do
  #   it('delete the client in the database') do
  #     client = Client.new(name: 'John', id: nil)
  #     client.save
  #     client2 = Client.new(name: 'Lucy', id: nil)
  #     client2.save
  #     client.delete
  #     expect(Client.all).to(eq([client2]))
  #   end
  # end
end

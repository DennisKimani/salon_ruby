require('spec_helper')

describe(Stylist) do
  # all the stylist available.
  describe('.all') do
    it('starts off with no stylists') do
      expect(Stylist.all).to(eq([]))
    end
  end

  # finds all the stylists with the ID.
  describe('.find') do
    it('returns a stylist by its ID number') do
      test_stylist = Stylist.new(name: 'Dennis', id: nil)
      test_stylist.save
      test_stylist2 = Stylist.new(name: 'Lucy', id: nil)
      test_stylist2.save
      expect(Stylist.find(test_stylist2.id)).to(eq(test_stylist2))
    end
  end

  #calls the clients details.
  describe("#clients") do
    it("returns an array of clients for that stylist") do
      test_stylist = Stylist.new({:name => "Dennis", :id => nil})
      test_stylist.save()
      test_client = Client.new({:name => "Lucy", :stylist_id => test_stylist.id()})
      test_client.save()
      test_client2 = Client.new({:name => "John", :stylist_id => test_stylist.id()})
      test_client2.save()
      expect(test_stylist.clients()).to(eq([test_client, test_client2]))
    end
  end

  # tells you the name.
  describe('#name') do
    it('tells you its name') do
      stylist = Stylist.new(name: 'Grace', id: nil)
      expect(stylist.name).to(eq('Grace'))
    end
  end

  # tells the id of the stylist.
  describe('#id') do
    it('sets its ID when you save it') do
      stylist = Stylist.new(name: 'John', id: nil)
      stylist.save
      expect(stylist.id).to(be_an_instance_of(Fixnum))
    end
  end

  # object with same name and id are saved as one.
  describe('#==') do
    it('is the same stylist if it has the same name and id') do
      stylist = Stylist.new(name: 'Dennis', id: nil)
      stylist2 = Stylist.new(name: 'Dennis', id: nil)
      expect(stylist).to(eq(stylist2))
    end
  end

  # function to update the existing stylists.
  describe('#update') do
    it('lets you update stylist in the database') do
      stylist = Stylist.new(name: 'Lucy', id: nil)
      stylist.save
      stylist.update(name: 'John')
      expect(stylist.name).to(eq('John'))
    end
  end

  # delete the stylist work
  describe('#delete') do
    it('lets you delete a stylist from the database') do
      stylist = Stylist.new(name: 'Wilson', id: nil)
      stylist.save
      stylist2 = Stylist.new(name: 'Cynthia', id: nil)
      stylist2.save
      stylist.delete
      expect(Stylist.all).to(eq([stylist2]))
    end
  end
end

class City < ActiveRecord::Base
	validates :name, :presence  => true, :uniqueness => { :case_sensitive => false }
	has_many	:storages

	scope :active, where(:active => true)

	def self.load_cities(fileName)
		lines = File.readlines(fileName)
		lines.each do |line|
			curCity = City.new(name: line)
			curCity.save!
		end
	end

	def self.find_city(some_name)
		where("name LIKE ?", "#{some_name}%").first
	end

	def self.cities_for(client)
		#Find all cities for current client
		City.find_all_by_id(Storage.select(:id).where(:client_id => client))
	end
end

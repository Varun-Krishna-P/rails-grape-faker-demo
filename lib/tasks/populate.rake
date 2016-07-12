namespace :db do
	desc 'Erase and fill database'	
	task :populate => :environment do
		require 'faker'
		 require 'populator'
		[Employee].each(&:delete_all)
		
		Employee.populate 10 do |employee|
			employee.name = Faker::Name.name
			employee.address = Faker::Address.street_address
			employee.age = Faker::Number.number(2)
			employee.city = Faker::Address.city
			employee.salary = Faker::Number.decimal(3, 2)
			employee.date_of_birth = Faker::Date.between(2.years.ago, Date.today)
			employee.country =  Faker::Address.country
		end
	end
end
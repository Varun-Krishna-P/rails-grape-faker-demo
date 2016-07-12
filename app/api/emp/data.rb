module Emp
	class Data < Grape::API

		resource :employee_data do
			desc "List all Employees"

			get do
				Employee.all
			end

			desc 'create a employee'
			params do
				requires :name, type: String
				requires :address, type: String
				requires :age, type: Integer
			end
			post do
				Employee.create!({
					name: params[:name],
					address: params[:address],
					age: params[:age],
					salary: params[:salary],
					date_of_birth: params[:date_of_birth],
					city: params[:city],
					country: params[:country],
					
					})
			end
		end
	end
end
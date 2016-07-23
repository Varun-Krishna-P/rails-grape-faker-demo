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

			desc 'destroy employee'
			params do
				requires :id, type: String
			end
			delete ':id' do
				Employee.find(params[:id]).destroy!
			end

			desc 'update an employee'
			params do
				requires :id, type: String
				requires :address, type: String
				requires :name, type: String
				requires :age, type: Integer
			end
			put ':id' do
				Employee.find(params[:id]).update({
					address: params[:address],
					name: params[:name],
					age: params[:age],
					salary: params[:salary],
					date_of_birth: params[:date_of_birth],
					city: params[:city],
					country: params[:country]
				})
			end
		end
	end
end
require 'rails_helper'

describe API::V1::PeopleController do

  describe 'POST #create' do
    context 'when everything is valid' do
      it 'create a person' do
        post :create, person: { name: 'Eric Liu', date_of_birth: '1987-12-11' }

        @people = Person.all

        expect(@people.count).to eq(1)
      end
    end
  end

end

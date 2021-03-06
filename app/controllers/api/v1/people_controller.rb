module API
  module V1

    class PeopleController < ApplicationController
      before_action :set_person, only: [:show, :update, :destroy]

      # GET /people
      def index
        @people = Person.all

        render json: @people
      end

      # POST /people
      def create
        @person = Person.new(person_params)

        if @person.save
          @people = Person.all
          render 'index', status: :created, location: api_v1_people_url
        else
          render json: @person.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /people/1
      def update
        if @person.update(person_params)
          render json: @person
        else
          render json: @person.errors, status: :unprocessable_entity
        end
      end

      # DELETE /people/1
      def destroy
        @person.destroy

        @people = Person.all
        render 'index', status: :created, location: api_v1_people_url
      end

      private

        # Use callbacks to share common setup or constraints between actions.
        def set_person
          @person = Person.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def person_params
          params.require(:person).permit(:name, :date_of_birth)
        end
    end

  end
end

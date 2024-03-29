class ReservationsController < ApplicationController
  before_action :find_recipe, except: [ :cancel_reservation, :honored_reservation, :your_reservations, :back_recipe_to_reservation]

  def create
    @reservation = @recipe.reservations.new(reservation_params)
    @reservation.user_id = current_user.id
    @reservation.price = @recipe.price
    if @reservation.persons == nil || @reservation.persons == 0
      @reservation.persons = 1
    end

    @recipe.update_attributes(no_people: @recipe.no_people - @reservation.persons)

    @reservation.final_price = @reservation.persons * @recipe.price
    @reservation.save

    if @reservation.save
      redirect_to recipe_path(@recipe)
    end
  end

  def cancel_reservation
    reservation = Reservation.find(params[:id])
    recipe = Recipe.find(reservation.recipe_id)
    recipe.update_attributes(no_people: recipe.no_people + reservation.persons)
    reservation.update_attributes(cancel_reservation: true)
    flash[:cancel_reservation] = "Reservation was successfully canceled!"
    redirect_to root_path
  end

  def honored_reservation
    reservation = Reservation.find(params[:id])
    recipe = Recipe.find(reservation.recipe_id)
    recipe.update_attributes(no_people: recipe.no_people + reservation.persons)
    reservation.update_attributes(honored_reservation: true)
    flash[:honored_reservation] = "Reservation was successfully honored!"
    redirect_to recipe_path(recipe.id)
  end

  def your_reservations
    @own_reservations = current_user.reservations 
  end

  def back_recipe_to_reservation
    reservation = Reservation.find(params[:id])
    recipe = Recipe.find(reservation.recipe_id)
    redirect_to recipe_path(recipe.id)
  end

  private
  def find_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def reservation_params
    params.require(:reservation).permit(:first_name, :last_name, :persons, :time, :message)
  end
end

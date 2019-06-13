class AddCancelReservationToReservations < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :cancel_reservation, :boolean
  end
end

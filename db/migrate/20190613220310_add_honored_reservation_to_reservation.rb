class AddHonoredReservationToReservation < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :honored_reservation, :boolean
  end
end

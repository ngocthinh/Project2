class AddUserIdToParticipates < ActiveRecord::Migration[5.0]
  def change
    add_reference :participates, :user, foreign_key: true
  end
end

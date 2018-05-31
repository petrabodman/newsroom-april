class AddSubscriberAndStripeIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :subscriber, :boolean
    add_column :users, :stripeid, :string
  end
end

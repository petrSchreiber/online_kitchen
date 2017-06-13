require 'date'

class AddExpirationSupportToMachines < ActiveRecord::Migration
  def up
    add_column :machines, :expirable, :boolean, :default => true
    add_column :machines, :expiration, :date
    add_column :machines, :expiration_extension_count, :int, :default => 0

    Machine.find_each do |machine|
      machine.expirable ||= true
      machine.expiration ||= Date.today + 31.days
      machine.expiration_extension_count ||= 0
      machine.save!
    end

    add_column :users, :expiration_extension_limit, :int, :default => 2
    User.find_each do |user|
      user.expiration_extension_limit = 2
    end
  end

  def down
    remove_column :machines, :expirable
    remove_column :machines, :expiration
    remove_column :machines, :expiration_prolonged

    remove_column :users, :expiration_extension_limit
  end
end


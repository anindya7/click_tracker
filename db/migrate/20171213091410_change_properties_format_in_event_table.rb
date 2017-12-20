class ChangePropertiesFormatInEventTable < ActiveRecord::Migration[5.1]
  def up
    change_column :ahoy_events, :properties, 'jsonb USING CAST(properties AS jsonb)'
  end
  def down
    change_column :ahoy_events, :properties, 'jsonb USING CAST(properties AS jsonb)'
  end
end

class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.references :member, index: true
      t.references :group, index: true

      t.timestamps
    end
  end
end

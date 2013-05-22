class CreateRoles < ActiveRecord::Migration
  def up
    create_table :roles do |t|
      t.string :name

      t.timestamps
    end
    
    create_table :roles_users, :force => true do |t|
      t.references :role, :user
    end
    
    Role.create(name: 'Admin')
    Role.create(name: 'User')
    Role.create(name: 'Developer')
    Role.create(name: 'Manager')
  end
  
  def down
    drop_table :roles_users
    drop_table :roles
  end
end
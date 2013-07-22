class CreateProfileForEachExistingUser < ActiveRecord::Migration
  def up
    execute "INSERT INTO profiles(nombre, user_id, created_at, updated_at) 
             SELECT name as nombre, id as user_id, created_at, updated_at FROM users ORDER BY id;"
  end

  def down
    execute "UPDATE users SET name = profiles.nombre FROM profiles WHERE users.id = profiles.user_id"
  end
end

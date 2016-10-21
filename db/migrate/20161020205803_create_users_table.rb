class CreateUsersTable < ActiveRecord::Migration[5.0]

def up
	create_table :users do |t|
		t.string :first_name
		t.string :last_name
		t.string :city
		t.string :state
		t.string :email
		t.string :username
		t.string :password
	end
	
  	create_table :blogs do |x|
		x.integer :user_id
		x.text :blog_post
		x.string :title
		x.datetime :created_at
	end
end

def down
	drop_table :users
	drop_table :blogs
end

end
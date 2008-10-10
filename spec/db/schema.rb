ActiveRecord::Schema.define(:version => 1) do
   create_table :test_models, :force => true do |t|     
     t.datetime :created_at
   end
end

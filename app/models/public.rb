class Public < ActiveRecord::Base
  self.abstract_class = true
  establish_connection(
      :adapter => 'mysql2',
      :encoding => 'utf8',
      :pool => 5,
      :username => 'root',
      :password => 'Vv7Nn23',
      :database => 'ecpmain_staging',
      :host => 'tecpdb1',
      :port => 3306
  )
end

class Corporation < Public
  self.table_name = 'corporations'
  self.inheritance_column = :_type_disabled
end

class Individual < Public
  self.table_name = 'individuals'
  self.inheritance_column = :_type_disabled

end


  
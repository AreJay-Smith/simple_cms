class AdminUser < ActiveRecord::Base

#Tell model that there is another table name
#self.table_name = "admin_users"
has_and_belongs_to_many :pages
has_many :section_edits
has_many :sections, :through => :section_edits
end

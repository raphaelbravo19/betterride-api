class Organization < ApplicationRecord
    has_many :users
    #def Supervisors
    #    User.availables.by_role("S")
    #end
    #def Operators
    #    User.availables.by_role("O")
    #end
end

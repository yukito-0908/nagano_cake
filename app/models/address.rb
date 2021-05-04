class Address < ApplicationRecord
   belongs_to :customer
    def full_name
        self.address + self.name + self.postal_code
    end
end

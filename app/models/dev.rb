class Dev < ActiveRecord::Base
      has_many :freebies
      has_many :companies, through: :freebies

      def received_one?(item_name)
         self.freebies.find_by_item_name(item_name) ? true : false
      end
      def give_away(dev, freebie)
            if self == freebie.dev
                  freebie.update(dev_id: dev.id)
            end
      end
end



# Dev#give_away(dev, freebie)
# accepts a Dev instance and a Freebie instance, changes the freebie's dev to be the given dev; your code should only make the change if the freebie belongs to the dev who's giving it away
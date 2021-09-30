class Company < ActiveRecord::Base
      has_many :freebies
      has_many :devs, through: :freebies

      def give_freebie(dev_id:, item_name:, value:)
            self.freebies << Freebie.create(dev_id: dev_id, item_name: item_name, value: value)
      end

      def oldest_company
            Company.order('founding_year').first
      end
end
#Dev.first.finda('item_name: "Enron Cup", value: 35, company_id: 4, dev_id: 1')
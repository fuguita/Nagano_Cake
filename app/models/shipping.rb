class Shipping < ApplicationRecord

    belongs_to :customer

    def shipping_display
      '〒' + postal_code + '' + address + '' + name
    end

end

Spree::Address.class_eval do

  attr_accessible :street_number
  validates :street_number, presence: true

  def to_s
    "#{full_name}, #{address1} #{street_number}, #{zipcode} #{city}"
  end

end

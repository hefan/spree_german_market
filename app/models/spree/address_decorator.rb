Spree::Address.class_eval do

  validates :street_number, presence: true

  def to_s
    "#{full_name}, #{address1} #{street_number}, #{zipcode} #{city}"
  end

end

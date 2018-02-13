namespace :dev do
  task fake: :environment do
    Restaurant.destroy_all
    3.times do |i|
      restaurant = Restaurant.new(name: FFaker::Name.name,
        opening_hours: FFaker::Time.date,
        address: FFaker::Address.street_address,
        description: FFaker::Lorem.paragraph,
        tel: FFaker::PhoneNumber.phone_number
      )

      # Dir.glob("#{Rails.root}/lib/assets/images/*.jpg").map do |pic|
      #   File.open(pic) do |f|
      #     restaurant.image = f
      #   end
      # end

      pic = Dir.glob("#{Rails.root}/lib/assets/images/*.jpg")
      restaurant.image = File.open(pic[rand(3)])
      restaurant.save!
    end
    puts "have created fake restaurants"
  end
end
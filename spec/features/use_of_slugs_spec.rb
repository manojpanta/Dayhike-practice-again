require 'rails_helper'

describe "user sees one song" do

  it "on song show page with song attributes" do
    trip_1 = Trip.create(name: "My Heart Will Go On", start_date: '02/03/2019', end_date: '02/03/2019')
    trip_2 = Trip.create(name: "Beauty and the Beast", start_date: '02/03/2019', end_date: '02/03/2019')

    visit trip_path(trip_1.slug)
    expect(current_path).to eq("/trips/#{trip_1.slug}")

    expect(page).to have_content(trip_1.name)
  end

  it "use of slug in users path can be seen" do
    user = User.create(username: "My Heart Wilaql Go On", email: 'manoj', password: 'manoj')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user.slug)
    expect(current_path).to eq("/users/#{user.slug}")

    expect(page).to have_content(user.username)
  end

end

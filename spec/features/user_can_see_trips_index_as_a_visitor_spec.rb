require 'rails_helper'
describe 'visitor visiting trips index' do
  it 'can show all the trips names' do
    trip = Trip.create(name: 'trip1', start_date: '02/03/13', end_date: '02/03/13')
    trip1 = Trip.create(name: 'this is new trip', start_date: '02/02/13', end_date: '02/03/13')

    visit trips_path
    expect(page).to have_content(trip.name)
    expect(page).to have_content(trip1.name)

  end

  it 'can show trip show page when clicked on trip name' do
    trip = Trip.create(name: 'trip1', start_date: '02/03/13', end_date: '02/03/13')
    trip1 = Trip.create(name: 'this is new trip', start_date: '02/02/13', end_date: '02/03/13')

    visit trips_path
    click_on trip.name

    expect(current_path).to eq(trip_path(trip))
  end

  it 'can show all the trails included in that trip and trails details when trip show' do
    trip = Trip.create(name: 'trip1', start_date: '02/03/13', end_date: '02/03/13')

    trail1 = trip.trails.create(name: 'first trail', address: 'denver', length: 5)
    trail2 = trip.trails.create(name: 'second trail', address: 'lakewood', length: 5)

    visit trip_path(trip)

    expect(page).to have_content(trail1.name)
    expect(page).to have_content(trail1.address)
    expect(page).to have_content(trail1.length)

    expect(page).to have_content(trail2.name)
    expect(page).to have_content(trail2.address)
    expect(page).to have_content(trail2.length)
  end

  it "shows total distance to travel in a trip by adding length of all the trails' length" do
    trip = Trip.create(name: 'trip1', start_date: '02/03/13', end_date: '02/03/13')

    trail1 = trip.trails.create(name: 'first trail', address: 'denver', length: 5)
    trail2 = trip.trails.create(name: 'second trail', address: 'lakewood', length: 5)

    visit trip_path(trip)

    expect(page).to have_content("Total Hiking Distance: #{trail1.length + trail2.length}")
  end

  it "shows average hiking distance of all trails in that trip" do
    trip = Trip.create(name: 'trip1', start_date: '02/03/13', end_date: '02/03/13')

    trail1 = trip.trails.create(name: 'first trail', address: 'denver', length: 5)
    trail2 = trip.trails.create(name: 'second trail', address: 'lakewood', length: 5)
    trail3 = trip.trails.create(name: 'second trail', address: 'lakewood', length: 5)
    trail4 = trip.trails.create(name: 'second trail', address: 'lakewood', length: 5)

    visit trip_path(trip)

    expect(page).to have_content("Average Hiking Distance: #{(trail1.length + trail2.length + trail3.length + trail4.length)/4}")
  end

  it "shows longest hiking distance of all trails in that trip" do
    trip = Trip.create(name: 'trip1', start_date: '02/03/13', end_date: '02/03/13')

    trail1 = trip.trails.create(name: 'first trail', address: 'denver', length: 5)
    trail2 = trip.trails.create(name: 'second trail', address: 'lakewood', length: 15)
    trail3 = trip.trails.create(name: 'second trail', address: 'lakewood', length: 25)
    trail4 = trip.trails.create(name: 'second trail', address: 'lakewood', length: 35)

    visit trip_path(trip)

    expect(page).to have_content("Longest Hiking Distance: #{trail4.length}")
  end

  it "shows shortest hiking distance of all trails in that trip" do
    trip = Trip.create(name: 'trip1', start_date: '02/03/13', end_date: '02/03/13')

    trail1 = trip.trails.create(name: 'first trail', address: 'denver', length: 5)
    trail2 = trip.trails.create(name: 'second trail', address: 'lakewood', length: 15)
    trail3 = trip.trails.create(name: 'second trail', address: 'lakewood', length: 25)
    trail4 = trip.trails.create(name: 'second trail', address: 'lakewood', length: 35)

    visit trip_path(trip)

    expect(page).to have_content("Shortest Hiking Distance: #{trail1.length}")
  end

  it "can take me to trial show page from trip show page when clicked on trail's name" do
    trip = Trip.create(name: 'trip1', start_date: '02/03/13', end_date: '02/03/13')

    trail = trip.trails.create(name: 'first trail', address: 'denver', length: 5)

    visit trip_path(trip)
    click_on trail.name

    expect(current_path).to eq(trail_path(trail))
  end

  it 'tril show page shows name address and total length of every hiking trip that includes this trail' do
    trip = Trip.create(name: 'trip1', start_date: '02/03/13', end_date: '02/03/13')

    trail = trip.trails.create(name: 'first trail', address: 'denver', length: 5)
    trail2 = trip.trails.create(name: 'second trail', address: 'denver', length: 10)


    visit trail_path(trail)

    expect(page).to have_content(trail.name)
    expect(page).to have_content(trail.address)

    expect(page).to have_content("Total hiking distance for #{trip.name}: #{trip.total_hiking_distance}")
  end

  it 'trail show page shows total number of trips where this trail is included ' do
    trail = Trail.create(name: 'first trail', address: 'denver', length: 5)

    trip1 = trail.trips.create(name: 'trip1', start_date: '02/03/13', end_date: '02/03/13')
    trip2 = trail.trips.create(name: 'trip2', start_date: '02/03/13', end_date: '02/03/13')


    visit trail_path(trail)

    expect(page).to have_content("Total Number of Trips where this trail is included: #{trail.trips.count}")
  end
end

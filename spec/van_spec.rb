require './lib/van'
require './lib/bike_container'
require './lib/garage'


describe Van do 

	let(:van) { Van.new(:capacity => 50) }
	let(:dockingstation) { DockingStation.new }
	let(:broken_bike1) { Bike.new.break! }
	let(:dockingstation) { DockingStation.new }
	let(:garage) { Garage.new }
	

	it "should allow setting default capacity on initialising" do
		expect(van.capacity).to eq(50)
	end

	it "should collect broken bikes from docking station" do
		dockingstation.dock(broken_bike1)
		van.collect_broken_bikes_from(dockingstation)
		expect(van.bikes).to eq [broken_bike1]
		expect(dockingstation.broken_bikes).to eq []
	end

	
	it "should release broken bikes to garage" do
		dockingstation.dock(broken_bike1)
		van.collect_broken_bikes_from(dockingstation)
		van.release_broken_bikes_to(garage)
		expect(van.bikes).to eq []
		expect(garage.bikes).to eq [broken_bike1]
	end


	end
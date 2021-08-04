require "station"

describe Station do
  
  let(:station) { Station.new("Angel", 1) }

  it "has a name" do
    expect(station.name).to eq("Angel")
  end
  it "has a zone" do
    expect(station.zone).to eq (1)
  end
end
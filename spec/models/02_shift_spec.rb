describe 'Shift' do
  before do
    @prince = Shift.create(designation: "mona")
  end

  after do 
    clean_database
  end

  it 'has a name' do
    expect(Shift.find_by(designation: "mona")).to eq(@prince)
  end

end
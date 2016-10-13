describe 'Employee' do
  before do
    @employee = Employee.create(name: "Forever")
  end

  after do 
    clean_database
  end

  it 'has a name' do
    expect(Employee.where(name: "Forever").first).to eq(@employee)
  end

end
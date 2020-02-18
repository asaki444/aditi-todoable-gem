
RSpec.describe TODOABLE do
  it "has a version number" do
    expect(TODOABLE::VERSION).not_to be nil
  end

  describe "#initialize" do
     it "should create a successful response token" do  
       username = ENV.fetch('USERNAME')
       password = ENV.fetch('PASSWORD')
       code = TODOABLE.initialize(username,password)
       expect(code).not_to be nil
     end
   end


end

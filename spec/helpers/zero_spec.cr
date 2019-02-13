require "./../spec_helper"

describe Zero do
  it "fills the number up to an 5 character long string" do
    Zero.fill(1).should eq "00001"
    Zero.fill(11).should eq "00011"
    Zero.fill(111).should eq "00111"
    Zero.fill(1111).should eq "01111"
    Zero.fill(11111).should eq "11111"
  end
end

require 'rubygems'
require 'bundler'
require 'rspec'
require_relative './../enumerable_fun'

describe "enumerable" do
  it "responds to cool methods" do
    expect(Array.new.respond_to?(:injekt)).to be_truthy
    expect(Hash.new.respond_to?(:injekt)).to be_truthy
  end
  
  it "matches the default implementation of inject" do 
    a = [1,2,3].inject([]) {|acc,i| acc << i+i }
    b = [1,2,3].injekt([]) {|acc,i| acc << i+i }

    expect(b).to eq(a)
  end


  it "charts as well as it maps" do
    actual = [1,2,3].chart { |x| x+x }
    expect = [1,2,3].map { |x| x+x }

    expect(actual).to eq( expect)
  end


  it "does an enny?" do 
    bools = [true,false].enny? {|x|x}
    neg_bools = [false,false].enny? {|x|x}
    ints = [1,2,3].enny? {|x| x > 2 }
    expect(bools).to be_truthy
    expect(neg_bools).to be_falsey
    expect(ints).to be_truthy
  end

  it "does an enny? - sans block" do 
    bools = [true,false].enny?
    expect(bools).to be_truthy
  end

  it "tells us everything" do 
    same = [true,true].everything? {|x|x} 
    expect(same).to be_truthy

    diffs = [true,false].everything? {|x|x}
    expect(diffs).to be_falsey

    ints = [1,2,3,4].everything? {|x| x < 5}
    expect(ints).to be_truthy
  end

  it "tells us everything - sans block" do 
    same = [true,true].everything?
    expect(same).to be_truthy
  end


end


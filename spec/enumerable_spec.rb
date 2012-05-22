require 'rubygems'
require 'bundler'
require 'rspec'
require_relative './../enumerable_fun'

describe "enumerable" do
  it "responds to cool methods" do
    Array.new.respond_to?(:injekt).should be_true    
    Hash.new.respond_to?(:injekt).should be_true    
  end
  
  it "matches the default implementation of inject" do 
    a = [1,2,3].inject([]) {|acc,i| acc << i+i }
    b = [1,2,3].injekt([]) {|acc,i| acc << i+i }
   # a.should eq([1,4,9]) 
    b.should eq(a)
  end


  it "charts as well as it maps" do
    actual = [1,2,3].chart { |x| x+x }
    expect = [1,2,3].map { |x| x+x }

    actual.should eq( expect)
  end


  it "does an enny?" do 
    bools = [true,false].enny? {|x|x}
    neg_bools = [false,false].enny? {|x|x}
    ints = [1,2,3].enny? {|x| x > 2 }
    bools.should be_true
    neg_bools.should be_false
    ints.should be_true
  end

  it "does an enny? - sans block" do 
    bools = [true,false].enny?
    bools.should be_true
  end

  it "tells us everything" do 
    same = [true,true].everything? {|x|x} 
    same.should be_true

    diffs = [true,false].everything? {|x|x}
    diffs.should be_false

    ints = [1,2,3,4].everything? {|x| x < 5}
    ints.should be_true
  end

  it "tells us everything - sans block" do 
    same = [true,true].everything?
    same.should be_true
  end


end


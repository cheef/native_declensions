require File.dirname(__FILE__) + '/spec_helper'

class TestModel < ActiveRecord::Base
  native_declensions :singular => {:i => "i_declension", :r => "r_declension", :d => "d_declension", :v => "v_declension", :t => "t_declension", :p => "p_declension"},
  :plural=> {:i => "i_declension", :r => "r_declension", :d => "d_declension", :v => "v_declension", :t => "t_declension", :p => "p_declension"},
  :gender => "feminine"
end

describe TestModel do

  before(:each) do
    @model = TestModel.new
  end
  
  describe "declension" do
    describe "class method" do
      describe "without params" do    
        it "should return i declension" do
          TestModel.declension.should == "i_declension"
        end  
      end

      describe "with params" do
        it "should return i declension" do
          TestModel.declension(:i).should == "i_declension"
        end

        it "should return t declension" do
          TestModel.declension(:t).should == "t_declension"
        end
      end
    end
    
    describe "instance method" do
      describe "without params" do    
        it "should return i declension" do
          @model.declension.should == "i_declension"
        end  
      end

      describe "with params" do
        it "should return i declension" do
          @model.declension(:i).should == "i_declension"
        end

        it "should return t declension" do
          @model.declension(:t).should == "t_declension"
        end
      end
    end
  end
  
  describe "by_gender" do
    describe "class method" do      
      it "should choose right gender" do
        TestModel.by_gender("word_in_masculan_gender", "word_in_feminine_gender", "word_in_neuter_gender").should == "word_in_feminine_gender"
      end
    end
    
    describe "instance method" do
      it "should choose right gender" do
        @model.by_gender("word_in_masculan_gender", "word_in_feminine_gender", "word_in_neuter_gender").should == "word_in_feminine_gender"
      end
    end
  end
end
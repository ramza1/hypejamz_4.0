require 'spec_helper'

describe InfoController do

  describe "GET 'about_us'" do
    it "should be successful" do
      get 'about_us'
      response.should be_success
    end
  end

  describe "GET 'privacy_policy'" do
    it "should be successful" do
      get 'privacy_policy'
      response.should be_success
    end
  end

  describe "GET 'terms_of_use'" do
    it "should be successful" do
      get 'terms_of_use'
      response.should be_success
    end
  end

  describe "GET 'developers'" do
    it "should be successful" do
      get 'developers'
      response.should be_success
    end
  end

  describe "GET 'download_mobile_app'" do
    it "should be successful" do
      get 'download_mobile_app'
      response.should be_success
    end
  end

end

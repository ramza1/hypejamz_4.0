require "spec_helper"

describe NoteUpdate do
  describe "update_followers" do
    let(:mail) { NoteUpdate.update_followers }

    it "renders the headers" do
      mail.subject.should eq("Update followers")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end

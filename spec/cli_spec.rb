require 'spec_helper'

describe Mygegegems::CLI do
  before(:all) do
    Mygegegems::DATA_PATH = File.join(source_root, 'mygegegems.yaml')
  end

  before do
    $stdout, $stderr = StringIO.new, StringIO.new
  end

  after do
    $stdout, $stderr = STDIN, STDERR
  end

  describe "#stat" do
    it "returns statics of your gems" do
      described_class.start(['stat'])
      expect($stdout.string).to eq ~<<-EOS
        As of 2014-07-11 (last: 2014-07-10)
        -----------------------------------
        3345 +  0 let_it_fall
        2225 +100 togglate
         762 +  2 emot
         354 + 14 gh-diff
         299 + 18 matreska
         297 + 30 tildoc
        -----------------------------------
        7282 +164 6 gems
      EOS
    end

    context "with target option" do
      it "returns statics of your gems" do
        described_class.start(['stat', '--target', 'last_month'])
        expect($stdout.string).to eq ~<<-EOS
          As of 2014-07-11 (last_month: 2014-06-30)
          -----------------------------------------
          3345 +123 let_it_fall
          2225 +225 togglate
           762 +162 emot
           354   -  gh-diff
           299 + 21 matreska
           297   -  tildoc
          -----------------------------------------
          7282 +531 6 gems
        EOS
      end
    end
  end
end

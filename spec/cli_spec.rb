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
        As of 2014-07-11 (last: \e[33m2014-07-10\e[0m)
        -----------------------------------
        3345 \e[33m+  0 \e[32mlet_it_fall\e[0m
        2225 \e[33m+100 \e[32mtogglate\e[0m
         762 \e[33m+  2 \e[32memot\e[0m
         354 \e[33m+ 14 \e[32mgh-diff\e[0m
         299 \e[33m+ 18 \e[32mmatreska\e[0m
         297 \e[33m+ 30 \e[32mtildoc\e[0m
        -----------------------------------
        7282 \e[33m+164 \e[32m6 gems\e[0m
      EOS
    end

    context "with target option" do
      it "returns statics of your gems" do
        described_class.start(['stat', '--target', 'last_month'])
        expect($stdout.string).to eq ~<<-EOS
          As of 2014-07-11 (last_month: \e[33m2014-06-30\e[0m)
          -----------------------------------------
          3345 \e[33m+123 \e[32mlet_it_fall\e[0m
          2225 \e[33m+225 \e[32mtogglate\e[0m
           762 \e[33m+162 \e[32memot\e[0m
           354  \e[33m -  \e[32mgh-diff\e[0m
           299 \e[33m+ 21 \e[32mmatreska\e[0m
           297  \e[33m -  \e[32mtildoc\e[0m
          -----------------------------------------
          7282 \e[33m+531 \e[32m6 gems\e[0m
        EOS
      end
    end
  end
end

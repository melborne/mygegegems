require 'spec_helper'

describe Mygegegems::Stat do
  before(:all) do
    Mygegegems::DATA_PATH = File.join(source_root, 'mygegegems.yaml')
  end

  describe ".latest" do
    it "returns latest data" do
      date, gems = described_class.latest
      expect(date.to_s).to eq '2014-07-11'
      expect(gems['emot']).to eq 762
    end
  end

  describe ".last" do
    it "returns last data(one before latest)" do
      date, gems = described_class.last
      expect(date.to_s).to eq '2014-07-10'
      expect(gems['emot']).to eq 760
    end
  end

  describe ".last_month" do
    it "returns last month's data" do
      date, gems = described_class.last_month
      expect(date.to_s).to eq '2014-06-30'
      expect(gems['emot']).to eq 600
    end
  end

  describe ".last_year" do
    it "returns last year's data" do
      date, gems = described_class.last_year
      expect(date).to be_nil
    end
  end

  describe ".diff" do
    it "raises an error with a wrong argument" do
      expect { described_class.diff(:newest) }.to raise_error(ArgumentError)
    end

    it "returns differences between last and latest" do
      (date1, date2), gems = described_class.diff(:last)
      expect(date1.to_s).to eq '2014-07-11'
      expect(date2.to_s).to eq '2014-07-10'
      expect(gems['emot']).to eq 2
      expect(gems['tildoc']).to eq 30
    end

    it "returns differences between last month and latest" do
      (date1, date2), gems = described_class.diff(:last_mon)
      expect(date1.to_s).to eq '2014-07-11'
      expect(date2.to_s).to eq '2014-06-30'
      expect(gems['emot']).to eq 162
      expect(gems['tildoc']).to be_nil
    end
  end

  describe ".total" do
    it "returns total stats" do
      total, diff_total, gems = described_class.total(:last)
      expect(total).to eq 7282
      expect(diff_total).to eq 164
      expect(gems).to eq 6
    end
  end
end

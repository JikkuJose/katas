require 'rspec'
require_relative 'job_list'

describe JobList do
  it "should return no jobs if input is empty" do
    expect(JobList.sequence("")).to eq []
  end

  it "shouldeturn an single job character if a single jobs was supplied" do
    expect(JobList.sequence("a =>")).to eq ['a']
  end

  it "shouldeturn multiple jobs characters if a multiple jobs were supplied" do
    jobs = "a => \nb => \nc =>"
    expect(JobList.sequence(jobs)).to eq %w[a b c]
  end

  it "should return ordered jobs with single dependency input" do
    jobs = "a =>\nb => c\nc =>"
    expect(JobList.sequence(jobs)).to eq %w[a c b]
  end

  it "should return ordered jobs with multiple dependency input" do
    jobs = "a =>\nb => c\nc => f\nd => a\ne => b\nf =>\n"
    expect(JobList.sequence(jobs)).to eq %w[a f c b d e]
  end

  it "should raise error on self depending jobs" do
    jobs = "a =>\nb =>\nc => c"
    expect { JobList.sequence(jobs) }.to raise_error InvalidJobs
  end

  it "should raise error on circular dependency" do
    jobs = "a =>\nb => c\nc => f\nd => a\ne =>\nf => b"
    expect { JobList.sequence(jobs) }.to raise_error InvalidJobs
  end
end

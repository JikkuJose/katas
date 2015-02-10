require 'minitest'
require 'minitest/reporters'
require_relative 'ordered_jobs'

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new({color: true})]

class OrderedJobsTest < Minitest::Test
  def test_empty_jobs
    assert_equal [], OrderedJobs.sequence("")
  end

  def test_single_job
    assert_equal ['a'], OrderedJobs.sequence("a =>")
  end

  def test_multiple_jobs
    jobs = "a => \nb => \nc =>"
    assert_equal %w[a b c], OrderedJobs.sequence(jobs)
  end

  def test_single_dependency
    jobs = "a =>\nb => c\nc =>"
    assert_equal %w[a c b], OrderedJobs.sequence(jobs)
  end

  def test_multiple_dependency
    jobs = "a =>\nb => c\nc => f\nd => a\ne => b\nf =>\n"
    assert_equal %w[a f c b d e], OrderedJobs.sequence(jobs)
  end

  def test_error_condition_on_self_depending_jobs
    jobs = "a =>\nb =>\nc => c"
    assert_raises InvalidJobs do
      OrderedJobs.sequence(jobs)
    end
  end

  def test_circular_dependency
    jobs = "a =>\nb => c\nc => f\nd => a\ne =>\nf => b"
    assert_raises InvalidJobs do
      OrderedJobs.sequence(jobs)
    end
  end
end

Minitest.autorun

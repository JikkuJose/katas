class InvalidJobs < StandardError; end

class JobList
  JOB_SEPARATOR = /\s\=\>\s?/

  def self.sequence(jobs)
    JobList.new(jobs).sequence
  end

  def initialize(jobs)
    @jobs = parse(jobs)
    fail InvalidJobs if invalid?
  end

  def sequence
    @jobs.flat_map { |job, _| dependency_graph(job) }.uniq
  end

  private

  def invalid?
    @jobs.any? { |dependent, parent| dependent == parent }
  end

  def dependency_graph(job)
    graph = []

    until job.nil?
      if graph.include?(job)
        fail InvalidJobs
      else
        graph.unshift(job)
        job = @jobs[job]
      end
    end

    graph
  end

  def parse(jobs)
    jobs.split(/\n/).each_with_object({}) do |job, hash|
      dependent, parent = job.split(JOB_SEPARATOR)
      hash[dependent] = parent
    end
  end
end

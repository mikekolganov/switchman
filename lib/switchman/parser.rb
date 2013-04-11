module Switchman
  class Parser
    attr_accessor :header

    def initialize(header)
      @header = header
    end

    def user_preferred_languages
      @user_preferred_languages ||= header.gsub(/\s+/, '').split(/,/).collect do |l|
        l += ';q=1.0' unless l =~ /;q=\d+\.\d+$/
          l.split(';q=')
      end.sort do |x,y|
        raise "Not correctly formatted" unless x.first =~ /^[a-z\-0-9]+$/i
        y.last.to_f <=> x.last.to_f
      end.collect do |l|
        l.first.downcase.gsub(/-[a-z0-9]+$/i) { |x| x.upcase }
      end
    rescue
      []
    end

    def preferred_language_from(array)
      (user_preferred_languages & array.collect { |i| i.to_s }).first
    end
  end
end
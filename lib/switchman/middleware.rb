module Switchman
  class Middleware
    def initialize(app, options = {})
      @app = app
      @languages = Array(options[:languages] || :en)
      @except    = options[:except] || []
    end

    def call(env)
      @env = env
      return @app.call(env) if prefixed_by?(@languages) or prefixed_by?(@except)
      [302, {'Location' => suggested_path}, []]
    end

    private

      def prefixed_by?(list)
        Regexp.new("^/(#{list.join('|')})(/|$)", 'i').match @env['REQUEST_PATH']
      end

      def suggested_path
        parser = Parser.new(@env['HTTP_ACCEPT_LANGUAGE'])
        preferred = parser.preferred_language_from(@languages)
        request_path = @env['REQUEST_PATH'].eql?('/') ? '' : @env['REQUEST_PATH']
        '/' + preferred + request_path
      end
  end
end
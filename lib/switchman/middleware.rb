module Switchman
  class Middleware
    def initialize(app, languages = ['en'])
      @app, @languages = app, Array(languages)
    end

    def call(env)
      regexp = Regexp.new("^/(#{@languages.join('|')})(/|$)", 'i')
      return @app.call(env) if regexp.match env['REQUEST_PATH']
      parser = Parser.new(env['HTTP_ACCEPT_LANGUAGE'])
      preferred = parser.preferred_language_from(@languages)
      request_path = env['REQUEST_PATH'].eql?('/') ? nil : env['REQUEST_PATH']
      [302, {'Location' => "/#{preferred}#{request_path}"}, []]
    end
  end
end
require 'babel/transpiler'

module Es6
    class Template < Tilt::Template
      def self.default_mime_type
        'application/javascript'
      end

      def self.engine_initialized?
        true
      end

      def initialize_engine
      end

      def prepare
      end

      def syntax
        :es6
      end

      def evaluate(context, locals, &block)
        logical_path = context.logical_path
        data = File.read(eval_file)

        result = Babel::Transpiler.transform(data, {
          'sourceMap' => context.es6_config.source_map,
          'sourceRoot' => source_root(logical_path),
          'filenameRelative' => filename_relative(logical_path)})

        # TODO: figure out who adding ; at the end of each js file
        result['code'] + "\n"
      end

      private

      def filename_regexp
        /[^\/]*$/
      end

      def filename_relative(logical_path)
        filename_regexp.match(logical_path)[0].to_s
      end

      def source_root(logical_path)
        logical_path.gsub(filename_regexp, '')
      end
    end
end
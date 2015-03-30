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
        filename_relative = /\/([^\/]*$)/.match(context.logical_path).try(:[], 1) || context.logical_path
        source_root = context.logical_path.gsub(filename_relative, '')
        data = File.read(eval_file)

        result = Babel::Transpiler.transform(data, {'sourceMap' => 'inline', 'sourceRoot' => source_root, 'filenameRelative' => filename_relative})
        result['code'] + "\n" # figure out who adding ; at the end of file
      end
    end
end
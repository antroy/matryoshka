require 'test/unit'
require 'fake_fileparser'

TEST_DIR = File.expand_path(File.dirname(__FILE__))

class TestDependencies < Test::Unit::TestCase
    def _test_fileparser(fileparser)
        deps = file_parser.get_dependencies File.join(TEST_DIR,'data')
    end
end



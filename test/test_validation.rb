require 'test/unit'
require 'matryoshka'

class TestDependencies < Test::Unit::TestCase
    def test_successful_validation
        data = {}
        assert Matryoshka::validate data

        data = {'git' => {'repo' => 'git@blah.blah:repo.git'}}
        assert Matryoshka::validate data

        data = {'git' => {'repo' => 'git@blah.blah:repo.git', 'ref' => '1.1'}}
        assert Matryoshka::validate data

        data = {
            'git' => {'repo' => 'git@blah.blah:repo.git', 'ref' => '1.1'},
            'stdlib' => {'repo' => 'git@blah.blah:repo.git', 'ref' => '1.1'}
        }

        assert Matryoshka::validate data
    end

    def test_failing_validation
        data = {'name' => ''}
        assert Matryoshka::validate data

        data = {'git' => {'repo' => 'git@blah.blah:repo.git'}}
        assert Matryoshka::validate data

        data = {'git' => {'repo' => 'git@blah.blah:repo.git', 'ref' => '1.1'}}
        assert Matryoshka::validate data

        data = {
            'git' => {'repo' => 'git@blah.blah:repo.git', 'ref' => '1.1'},
            'stdlib' => {'repo' => 'git@blah.blah:repo.git', 'ref' => '1.1'}
        }

        assert Matryoshka::validate data
    end
end




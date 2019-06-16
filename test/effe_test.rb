require 'test_helper'

class EffeTest < Minitest::Test
  include Effe::Effectful

  def test_that_it_has_a_version_number
    refute_nil ::Effe::VERSION
  end

  def test_it_returns_instance_of_aware_type
    assert_instance_of Effe::Aware, Effectful(2, [])
  end
end

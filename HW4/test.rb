
require 'Set_Game' 

#This test case tests the maintain_pool function
class TestMaintainPool
    def test_maintain_pool
        cards = []
        test_pool = []
        prepare_cards(cards, test_pool)
        test_pool.take(3)
        maintain_pool(cards, test_pool)
        assert_equal 12, test_pool.length
    end
end

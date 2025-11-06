module net2dev_addr::Sample6 {
    /*
    BITWISE

    | OR - If either binary value is 1 return 1, else 0
    & AND - If both binary values are 1 return 1, else 0
    ^ XOR - If binary values are different return 1, else 0

    value_a = 7
    value_b = 4

    7|4 = 7 
    7&4 = 4
    7^4 = 3 

    8 4 2 1
    0 1 1 1 = 7
    0 1 0 0 = 4
    0 0 1 1 = 3
    */

    fun bitwise_or(a: u64, b:u64): u64 {
        return a|b
    }

    fun bitwise_and(a: u64, b:u64): u64 {
        return a&b
    }

    fun bitwise_xor(a: u64, b:u64): u64 {
        return a^b
    }

    #[test_only]
    use std::debug::print;

    // #[test]
    fun test_bitwise(){
        let result = bitwise_or(7, 4);
        print(&result);
        let result = bitwise_and(7, 4);
        print(&result);
        let result = bitwise_xor(7, 4);
        print(&result);
    }

    /*
    BITSHIFT
    Only two operations, either shift to the left, or shift to the right.
    
    to the right  7 >> 2 = 1
    8  4  2 (1)
    0  1  1  1
    -> shifting to the right by two, we obtain 1
    
    to the left 7 << 2 = 28
    (16) 8  4  2  1
      1  1  1  
     -> shifting to the left by two, we obtain (16 + 8 + 4) = 28
    */

    fun bitshift_left(a: u64, times: u8): u64 {
        return a<<times
    }

    fun bitshift_right(a: u64, times: u8): u64 {
        return a>>times
    }

    // #[test]
    fun test_bitshift(){
        let result = bitshift_left(7,2);
        print(&result);
        let result = bitshift_right(7,2);
        print(&result);
    }
}
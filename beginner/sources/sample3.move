address net2dev_addr {
    module one {
        friend net2dev_addr::two;
        friend net2dev_addr::three;

        public(friend) fun get_value() : u64 {
            return 100
        }

        #[view]
        public fun get_prices() : u64 {
            return 30
        }
    }

    module two {
        use net2dev_addr::one::get_value;

        #[test_only]
        use std::debug::print;

        // #[test]
        fun test_function() {
            let result = get_value();
            print(&result);
        }
    }

    module three {
        use net2dev_addr::one::get_value;

        #[test_only]
        use std::debug::print;

        // #[test]
        fun test_function() {
            let result = get_value();
            print(&result);
        }
    }
}
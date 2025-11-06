module net2dev_addr::SignerDemo {
    use std::signer;
    use std::debug::print;
    use std::string::{String, utf8};

    const NOT_OWNER: u64 = 0;
    const OWNER: address = @net2dev_addr;

    fun check_owner(account: signer) {
        // Actual address
        let caller = signer::address_of(&account);
        // Reference to the address value
        let address_val = signer::borrow_address(&account);

        assert!(caller == OWNER, NOT_OWNER);
        print(&caller);

        print(&utf8(b"Owner Confirmed"));
        // Notice how i didn't have to pass &address_val here 
        print(address_val);
    }

    #[test(account = @net2dev_addr)]
    fun test_function(account: signer) {
        check_owner(account);
    }
}
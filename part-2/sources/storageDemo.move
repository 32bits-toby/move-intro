module net2dev_addr::StorageDemo {
    use std::signer;

    // Define resource -- StakePool is the resource
    struct StakePool has key, drop {
        amount: u64
    }

    // Create the resource and add it to a user's account
    fun add_user(account: &signer) {
        let amount: u64 = 0;
        move_to(account, StakePool {amount})
    }

    // Read from an accounts storage
    fun read_pool(account: address): u64 acquires StakePool {
        // Here notice that this function returns a u64, but you don't have to explicitly define the return.
        // borrow_global already handles the return.
        borrow_global<StakePool>(account).amount
    }

    fun stake(account: address) acquires StakePool {
        let entry = &mut borrow_global_mut<StakePool>(account).amount;
        *entry = *entry + 100;
    }
    
    fun unstake(account: address) acquires StakePool {
        let entry = &mut borrow_global_mut<StakePool>(account).amount;
        *entry = 0;
    }

    fun remove_user(account: &signer) acquires StakePool {
        // move_from holds some value, and move wouldn't allow us keep those values floating, 
        // If you're not doing anything with them you have to drop them (use the drop ability), 
        // else you must do something with them.
        move_from<StakePool>(signer::address_of(account));
    }

    fun confirm_user(account: address): bool {
        exists<StakePool>(account)
    }

    #[test_only]
    use std::debug::print;
    use std::string::{utf8};

    #[test(user = @0x123)]
    fun test_function(user: signer) acquires StakePool {
        add_user(&user);
        assert!(read_pool(signer::address_of(&user)) == 0, 1);
        print(&utf8(b"User Added Successfully!"));

        stake(signer::address_of(&user));
        assert!(read_pool(signer::address_of(&user)) == 100, 1);
        print(&utf8(b"User Staked 100 Tokens!"));

        unstake(signer::address_of(&user));
        assert!(read_pool(signer::address_of(&user)) == 0, 1);
        print(&utf8(b"User Unstaked Tokens!"));

        remove_user(&user);
        assert!(confirm_user(signer::address_of(&user)) == false, 1);
        print(&utf8(b"User Removed From StakePool"));
    }
}
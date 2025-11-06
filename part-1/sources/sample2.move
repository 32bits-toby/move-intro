// Here we'll be looking at
// - Primitive types (Addresses, boolean...)
// - Function visibility
// - Error handling

module net2dev_addr::Sample2 {

    const MY_ADDR: address = @net2dev_addr;

    fun confirm_value(number: u64) : bool {
        if (number > 0) 
            return true
        else 
            return false
    }

    fun confirm_choice(choice: bool) : (u64, bool) {
        if (choice) 
            return (1, choice)
        else 
            return (0, choice)
    }

    #[test_only]
    use std::debug::print;

    // #[test]
    fun test_function() {
        print(&@std);
        print(&MY_ADDR);

        let result = confirm_value(5);
        print(&result);

        let (result2, choice) = confirm_choice(true);
        print(&result2);
        print(&choice);
    }
}
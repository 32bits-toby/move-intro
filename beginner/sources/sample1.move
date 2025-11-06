module net2dev_addr::Sample1 {
    // Importing libraries 
    use std::debug::print;
    use std::string::{String, utf8};

    // Declaring a variable in the global module scope -- cannot be updated once deployed
    const ID: u64 = 100;

    // Declaring a function
    fun set_value() : u64 {
        let value_id: u64 = 200;
        // You cannot pass in a string direct e.g String = "my string"
        // you need to pass it as a utf8, then the b tells that it's a byte string.
        let string_val: String = utf8(b"net2dev");
        let string_byte: vector<u8> = b"this is a byte string";
        print(&value_id);
        print(&string_val);
        // This would return a byte value 0x...
        print(&string_byte);
        // We need to wrap it around with utf8 to get a human readable string.
        print(&utf8(string_byte));
        ID
    }

    // Defining an attribiute that will be assigned to the statement/object that i'll be writing below
    // The object i'll be defining down is entirely under this attribute
    // #[test]
    fun test_function() {
        let id_value = set_value();
        print(&id_value);
    }
}
module net2dev_addr::ReferenceDemo {
    use std::debug::print;

    // You can go from mutable → immutable.
    // You cannot go from immutable → mutable.

    /*
    Scenario 1
    Non-Reference to Immutable Reference
    */
    // value_a is a normal value of type u64.
    // &value_a borrows it as an immutable reference (&u64).
    // You can read from imm_refer, but you cannot change what it points to.
    fun scenario_1 (){
        // Non-Reference type
        let value_a = 10;
        //Store value_a as immutable ref
        let imm_refer: &u64 = &value_a;
        print(imm_refer);
    }

    /*
    Scenario 2
    Mutable to Immutable Reference
     - Immutable to Mutable is not possible!
    */
    // mut_refer borrows value_a as a mutable reference (&mut u64).
    // You then downgrade it to an immutable reference:
    // let imm_refer: &u64 = mut_refer;
    fun scenario_2 (){
        // Non-Reference Type
        let value_a = 10;
        //Store value_a as mutable ref
        let mut_refer: &mut u64 = &mut value_a;
        // Store Mutable into Immutable (Type Inference);
        let imm_refer: &u64 = mut_refer;
        print(imm_refer);
    }

    fun re_assign(value_a: &mut u64, value_b: &u64) {
        // Dereference and access the actual value being pointed to by value_a
        // Assign it the value of *value_b
        *value_a = *value_b;
        print(value_a)
    }

    fun scenario_3(){
        let value_a: &mut u64 = &mut 10;
        let value_b: &u64 = &20;
        re_assign(value_a, value_b)
    }


    #[test]
    fun test_function(){
        //scenario_1();
        //scenario_2();
        scenario_3();
    }
}
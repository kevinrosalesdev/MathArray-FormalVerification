--  Minimum package providing support for Unit testing

package Test_Assertions is
   Test_Assertion_Error : exception;

   procedure Assert_True  (Value : Boolean);
   --  Raises Assertion_Error when Value is False

   procedure Assert_False (Value : Boolean);
   --  Raises Assertion_Error when Value is True

   procedure Assert_True  (Value : Boolean; Message : String);
   --  Outputs Message and displays OK when Value is True.

   procedure Assert_False (Value : Boolean; Message : String);
   --  Outputs Message and displays OK when Value is False.

end Test_Assertions;

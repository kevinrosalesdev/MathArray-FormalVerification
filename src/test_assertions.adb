with Ada.Text_IO; use Ada.Text_IO;

package body Test_Assertions is
   Max        : constant := 50;
   Separators : constant String (1 .. 60) := (others => '.');

   -----------------
   -- Assert_True --
   -----------------

   procedure Assert_True  (Value : Boolean) is
   begin
      if not Value then
         raise Test_Assertion_Error;
      end if;
   end Assert_True;

   procedure Assert_True  (Value : Boolean; Message : String) is
   begin
      Put (Message);

      if Message'Length < Max then
         Put (Separators (1 .. Max - Message'Length));
      end if;

      if Value then
         Put_Line (" OK");

      else
         Put_Line (" FAILED (Assert_True)");
      end if;
   end Assert_True;

   ------------------
   -- Assert_False --
   ------------------

   procedure Assert_False (Value : Boolean) is
   begin
      if Value then
         raise Test_Assertion_Error;
      end if;
   end Assert_False;

   procedure Assert_False (Value : Boolean; Message : String) is
   begin
      Put (Message);

      if Message'Length < Max then
         Put (Separators (1 .. Max - Message'Length));
      end if;

      if not Value then
         Put_Line (" OK");

      else
         Put_Line (" FAILED (Assert_False)");
      end if;
   end Assert_False;

end Test_Assertions;

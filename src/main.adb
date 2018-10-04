with MathArray;        use MathArray;
with Ada.Text_IO;      use Ada.Text_IO;
with Test_Assertions;  use Test_Assertions;
with Ada.Assertions;   use Ada.Assertions;

procedure Main is
   res :Float:=0.0;
   procedure Test_logarithm is
      Msg   : constant String := "Test_logarithm";
      res :Float:=0.0;
   begin
      logarithm(10, 100.0 , res);
      Assert_True (res = 2.0, Msg & " with a integer result in base 10");
      logarithm(7, 1.0 , res);
      Assert_True (res = 0.0, Msg & "with a zero result");
      logarithm(2, 1024.0, res);
      Assert_True (res = 10.0, Msg & "with a integer result in base distinct to 10");
      logarithm(169, 4826809.0, res);
      Assert_True (res = 3.0, Msg & "with a integer result in base distinct to 10");
   exception
      when Assertion_Error =>
         Put_Line (Msg & " Failed (assertion)");
      when others =>
         Put_Line (Msg & " Failed (exception)");
   end Test_logarithm;
begin
   Put_Line ("********************* Test_Max");
   Test_logarithm;
end Main;

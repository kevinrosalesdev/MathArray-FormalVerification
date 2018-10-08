with MathArray;        use MathArray;
with Ada.Text_IO;      use Ada.Text_IO;
with Test_Assertions;  use Test_Assertions;
with Ada.Assertions;   use Ada.Assertions;
with Ada.Float_Text_IO;

use Ada.Float_Text_IO;

procedure Main is
   procedure Test_logarithm is
      Msg   : constant String := "Test_logarithm";
      res : Float := 0.0;
   begin
      logarithm(10, 100.0 , res);
      Assert_True (res = 2.0, Msg & " with a integer result in base 10");
      logarithm(7, 1.0 , res);
      Assert_True (res = 0.0, Msg & " with a zero result");
      logarithm(2, 1024.0, res);
      Assert_True (res = 10.0, Msg & " with a integer result in base distinct to 10");
      logarithm(169, 4826809.0, res);
      Assert_True (res = 3.0, Msg & " with a integer result in base distinct to 10");
   exception
      when Assertion_Error =>
         Put_Line (Msg & " Failed (assertion)");
      when others =>
         Put_Line (Msg & " Failed (exception)");
   end Test_logarithm;

   procedure Test_perpendicular_vec is
      Msg   : constant String := "Test_perpendicular_vec";
      v0 : vec(1..2);
      v1 : vec(1..2);
      v2 : vec(1..5);
      --v3 : vec(1..5);
   begin
      v0 := (2,4); v1 := (3,-7);
      Assert_True (perpendicular_vec(v0,v1)=False , Msg & " not perpendicular");
      v0 := (6,4); v1 := (-6, 9);
      Assert_True (perpendicular_vec(v0,v1), Msg & " perpendicular");
      v2 := (1,1,1,1,2);
      Assert_True (perpendicular_vec(v0,v2)=False, Msg & " with diferents lengths");
      --Assert_True (perpendicular_vec(v2,v3)=False, Msg & " with diferents lengths");
   exception
      when Assertion_Error =>
         Put_Line (Msg & " Failed (assertion)");
      when others =>
         Put_Line (Msg & " Failed (exception)");
   end Test_perpendicular_vec;

   procedure Test_derivative is
      Msg   : constant String := "Test_derivative";
      dv0 : vec(1..1);
      dv1 : vec(1..2) := (3,5);
      dv2 : vec(1..3) := (2,0,6);
      dv3 : vec(1..4) := (2,-6,0,10);
      dv4 : vec(1..5) := (10,0,6,-4,2);
      vecRes0 : vec(1..1);
      vecRes1 : vec(1..2);
      vecRes2 : vec(1..3);
      vecRes3 : vec(1..4);
      vecRes4 : vec(1..5);
   begin
      dv0 := (dv0'First => 2);
      vecRes0 := derivative(dv0);
      Assert_True (vecRes0(vecRes0'First) = 0, Msg & " with a function with only one coefficient (2).");
      vecRes1 := derivative(dv1);
      Assert_True (vecRes1 = (3,0), Msg & " with 3x + 5");
      vecRes2 := derivative(dv2);
      Assert_True (vecRes2 = (4,0,0), Msg & " with 2x^2 + 0x + 6");
      vecRes3 := derivative(dv3);
      Assert_True (vecRes3 = (6,-12,0,0), Msg & " with 2x^3 -6x^2 + 0x + 5");
      vecRes4 := derivative(dv4);
      Assert_True (vecRes4 = (40,0,12,-4,0), Msg & " with 10x^4 + 0x^3 + 6x^2 - 4x + 2");
   exception
      when Assertion_Error =>
         Put_Line (Msg & " Failed (assertion)");
      when others =>
         Put_Line (Msg & " Failed (exception)");
   end Test_derivative;

begin
   Put_Line ("********************* Test_Max");
   Test_logarithm;
   Test_perpendicular_vec;
   Test_derivative;
end Main;

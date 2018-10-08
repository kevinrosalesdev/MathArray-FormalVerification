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
      vecRes : vec(1..1);
   begin
      dv0 := (dv0'First => 2);
      vecRes := derivative(dv0);
      Assert_True (vecRes(vecRes'First) = 0, Msg & " with a function with only one coefficient (2).");
      Assert_True (derivative((3,5)) = (3,0), Msg & " with 3x + 5");
      Assert_True (derivative((2,0,6)) = (4,0,0), Msg & " with 2x^2 + 0x + 6");
      Assert_True (derivative((2,-6,0,10)) = (6,-12,0,0), Msg & " with 2x^3 -6x^2 + 0x + 5");
      Assert_True (derivative((10,0,6,-4,2)) = (40,0,12,-4,0), Msg & " with 10x^4 + 0x^3 + 6x^2 - 4x + 2");
   exception
      when Assertion_Error =>
         Put_Line (Msg & " Failed (assertion)");
      when others =>
         Put_Line (Msg & " Failed (exception)");
   end Test_derivative;

   procedure Test_derivative_x is
      Msg   : constant String := "Test_derivative_x";
      dv0 : vec(1..1);
      res0 : Integer;
   begin
      dv0 := (dv0'First => 2);
      res0 := derivative_x(dv0, 4);
      Assert_True (res0 = 0, Msg & " with a function with only one coefficient (2) in 4.");
      Assert_True (derivative_x((3,5), 2) = 3, Msg & " with 3x + 5 in 2");
      Assert_True (derivative_x((2,0,6), 0) = 0, Msg & " with 2x^2 + 0x + 6 in 0");
      Assert_True (derivative_x((2,-6,0,10), 5) = 90, Msg & " with 2x^3 -6x^2 + 0x + 5 in 5");
      Assert_True (derivative_x((10,0,6,-4,2), -3) = -1120, Msg & " with 10x^4 + 0x^3 + 6x^2 - 4x + 2 in -3");
   exception
      when Assertion_Error =>
         Put_Line (Msg & " Failed (assertion)");
      when others =>
         Put_Line (Msg & " Failed (exception)");
   end Test_derivative_x;

begin
   Put_Line ("********************* Test_Max");
   Test_logarithm;
   Test_perpendicular_vec;
   Test_derivative;
   Test_derivative_x;
end Main;

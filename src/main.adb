with MathArray;        use MathArray;
with Ada.Text_IO;      use Ada.Text_IO;
with Test_Assertions;  use Test_Assertions;
with Ada.Assertions;   use Ada.Assertions;
with Ada.Float_Text_IO;
use Ada.Float_Text_IO;

procedure Main is

   procedure Test_midpoint is
      Msg :constant String:="Test_midpoint";
      point1:vec :=(0,0,0);
      point2:vec :=(2,2,2);
      point3:vec:=(0,0);
      point4:vec:=(2,2);
      res:vec:=(0,0,0);
      res2:vec:=(0,0);
   begin
      res:=midpoint(point1,point2);
      Assert_True(res=(1,1,1),Msg & " with point 0,0,0 and point 2,2,2");
      point1:=(4,2,3);
      point2:=(2,4,3);
      res:=midpoint(point1,point2);
      Assert_True(res=(3,3,3),Msg & " with point 4,2,3 and point 2,4,3");
      point1:=(3,1,0);
      point2:=(2,4,3);
      res:=midpoint(point1,point2);
      Assert_True(res=(2,2,1),Msg & " with point 3,1,0 and point 2,4,3");
      point1:=(-4,2,-3);
      point2:=(2,-4,3);
      res:=midpoint(point1,point2);
      Assert_True(res=(-1,-1,0),Msg & " with point -4,2,-3 and point 2,-4,3");
      point1:=(-4,2,3);
      point2:=(-2,-4,3);
      res:=midpoint(point1,point2);
      Assert_True(res=(-3,-1,3),Msg & " with point -4,2,3 and point -2,-4,3");

      res2:=midpoint(point3,point4);
      Assert_True(res2=(1,1),Msg & " with point 0,0 and point 2,2");
      point3:=(4,2);
      point4:=(2,4);
      res2:=midpoint(point3,point4);
      Assert_True(res2=(3,3),Msg & " with point 4,2 and point 2,4");
      point3:=(-4,2);
      point4:=(2,-4);
      res2:=midpoint(point3,point4);
      Assert_True(res2=(-1,-1),Msg & " with point -4,2 and point 2,-4");
      point3:=(-4,2);
      point4:=(-2,4);
      res2:=midpoint(point3,point4);
      Assert_True(res2=(-3,3),Msg & " with point -4,2 and point -2,4");
   exception
      when Assertion_Error =>
         Put_Line (Msg & " Failed (assertion)");
      when others =>
         Put_Line (Msg & " Failed (exception)");
   end Test_midpoint;

--     procedure Test_module is
--        Msg   : constant String := "Test_module";
--        vec1:vec:=(0,0);
--        vec2:vec:=(0,0,0);
--        res:Float:=0.0;
--     begin
--        module(vec1,res);
--        Assert_True(res=0.0,Msg & " with vec 0,0");
--        vec1:=(1,0);
--        module(vec1,res);
--        Assert_True(res=1.0,Msg & " with vec 1,0");
--        vec1:=(0,1);
--        module(vec1,res);
--        Assert_True(res=1.0,Msg & " with vec 0,1");
--        vec1:=(3,-4);
--        module(vec1,res);
--        Assert_True(res=5.0,Msg & " with vec 3,-4");
--
--        module(vec2,res);
--        Assert_True(res=0.0,Msg & " with vec 0,0,0");
--        vec2:=(1,0,0);
--        module(vec2,res);
--        Assert_True(res=1.0,Msg & " with vec 1,0,0");
--        vec2:=(4,3,0);
--        module(vec2,res);
--        Assert_True(res=5.0,Msg & " with vec 4,3,0");
--        vec2:=(-4,-3,0);
--        module(vec2,res);
--        Assert_True(res=5.0,Msg & " with vec -4,-3,0");
--        vec2:=(-1,-2,2);
--        module(vec2,res);
--        Assert_True(res=3.0,Msg & " with vec -1,-2,2");
--     exception
--        when Assertion_Error =>
--           Put_Line (Msg & " Failed (assertion)");
--        when others =>
--           Put_Line (Msg & " Failed (exception)");
--     end Test_module;

   procedure Test_get is
      Msg   : constant String := "Test_get";
      bool:Boolean;
      vec1:vec(1..5);
      vec2:vec(1..2);
   begin
      vec1:=(1,2,3,4,5);
      vec2:=(-4,-1);
      get(vec1,3,bool);
      Assert_True (bool and then vec1(3)=0, Msg & " get successfully in the middle");
      get(vec1,1,bool);
      Assert_True (bool and then vec1(1)=0, Msg & " get successfully in the First element");
      get(vec1,5,bool);
      Assert_True (bool and then vec1(5)=0, Msg & " get successfully in the last element");
      get(vec1,10,bool);
      Assert_True (bool = False, Msg & " get fail");
      get(vec1,2,bool);
      Assert_True (bool and then vec1(2)=0, Msg & " get successfully");
      get(vec2,4,bool);
      Assert_True (bool = False, Msg & " get fail with two elements");
      get(vec2,-4,bool);
      Assert_True (bool and then vec2(1)=0, Msg & " get successfully with two elements");
   exception
      when Assertion_Error =>
         Put_Line (Msg & " Failed (assertion)");
      when others =>
         Put_Line (Msg & " Failed (exception)");
   end Test_get;

   procedure Test_perpendicular_vec is
      Msg   : constant String := "Test_perpendicular_vec";
      v0 : vec(1..2);
      v1 : vec(1..2);
   begin
      v0 := (2,4); v1 := (3,-7);
      Assert_True (perpendicular_vec(v0,v1)=False , Msg & " not perpendicular");
      v0 := (6,4); v1 := (-6, 9);
      Assert_True (perpendicular_vec(v0,v1), Msg & " perpendicular");
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
   exception
      when Assertion_Error =>
         Put_Line (Msg & " Failed (assertion)");
      when others =>
         Put_Line (Msg & " Failed (exception)");
   end Test_derivative;

--     procedure Test_derivative_x is
--        Msg   : constant String := "Test_derivative_x";
--        dv0 : vec(1..1);
--        res0 : Integer;
--     begin
--        dv0 := (dv0'First => 2);
--        res0 := derivative_x(dv0, 4);
--        Assert_True (res0 = 0, Msg & " with a function with only one coefficient (2) in 4.");
--        Assert_True (derivative_x((3,5), 2) = 3, Msg & " with 3x + 5 in 2");
--        Assert_True (derivative_x((2,0,6), 0) = 0, Msg & " with 2x^2 + 0x + 6 in 0");
--     exception
--        when Assertion_Error =>
--           Put_Line (Msg & " Failed (assertion)");
--        when others =>
--           Put_Line (Msg & " Failed (exception)");
--     end Test_derivative_x;

begin
   Put_Line ("********************* Test_Max");
   Test_midpoint;
   --Test_module;
   Test_get;
   Test_perpendicular_vec;
   Test_derivative;
   --Test_derivative_x;
end Main;

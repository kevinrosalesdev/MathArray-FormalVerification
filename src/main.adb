with MathArray;        use MathArray;
with Ada.Text_IO;      use Ada.Text_IO;
with Test_Assertions;  use Test_Assertions;
with Ada.Assertions;   use Ada.Assertions;
with Ada.Float_Text_IO;
use Ada.Float_Text_IO;
with Ada.Numerics.Elementary_Functions;
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
      point3:=(-3,2);
      point4:=(-2,7);
      res2:=midpoint(point3,point4);
      Assert_True(res2=(-2,4),Msg & " with point -3,2 and point -2,7");
   exception
      when Assertion_Error =>
         Put_Line (Msg & " Failed (assertion)");
      when others =>
         Put_Line (Msg & " Failed (exception)");
   end Test_midpoint;

   procedure Test_module is
      Msg   : constant String := "Test_module";
      vec1:vecFloat:=(0.0,0.0);
      vec2:vecFloat:=(0.0,0.0,0.0);
      res:Float:=0.0;
   begin
      module(vec1,res);
      Assert_True(res=0.0,Msg & " with vec 0.0,0.0");
      vec1:=(1.0,0.0);
      module(vec1,res);
      Assert_True(res=1.0,Msg & " with vec 1.0,0.0");
      vec1:=(0.0,1.0);
      module(vec1,res);
      Assert_True(res=1.0,Msg & " with vec 0.0,1.0");
      vec1:=(3.0,-4.0);
      module(vec1,res);
      Assert_True(res=5.0,Msg & " with vec 3.0,-4.0");
      vec1:=(1.1,-1.1);
      module(vec1,res);
      Assert_True(res=Ada.Numerics.Elementary_Functions.Sqrt((vec1(Vec1'First)**2)+(vec1(vec1'last)**2)),Msg & " with vec 1.1,-1.1");
      vec1:=(1.0,-4.0);
      module(vec1,res);
      Assert_True(res=Ada.Numerics.Elementary_Functions.Sqrt((vec1(Vec1'First)**2)+(vec1(vec1'last)**2)),Msg & " with vec 1.0,-4.0");
      vec1:=(3.0,-10.0);
      module(vec1,res);
      Assert_True(res=Ada.Numerics.Elementary_Functions.Sqrt((vec1(Vec1'First)**2)+(vec1(vec1'last)**2)),Msg & " with vec 3.0,-10.0");
      vec1:=(3.2,0.0);
      module(vec1,res);
      Assert_True(res=3.2,Msg & " with vec 3.2,0.0");

      module(vec2,res);
      Assert_True(res=0.0,Msg & " with vec 0.0,0.0,0.0");
      vec2:=(1.0,0.0,0.0);
      module(vec2,res);
      Assert_True(res=1.0,Msg & " with vec 1.0,0.0,0.0");
      vec2:=(4.0,3.0,0.0);
      module(vec2,res);
      Assert_True(res=5.0,Msg & " with vec 4.0,3.0,0.0");
      vec2:=(-4.0,-3.0,0.0);
      module(vec2,res);
      Assert_True(res=5.0,Msg & " with vec -4.0,-3.0,0.0");
      vec2:=(-1.0,-2.0,2.0);
      module(vec2,res);
      Assert_True(res=3.0,Msg & " with vec -1.0,-2.0,2.0");
      vec2:=(0.0,-2.1,0.0);
      module(vec2,res);
      Assert_True(res=2.1,Msg & " with vec 0.0,-2.1,0.0");
      vec2:=(-1.6,-2.04,2.6);
      module(vec2,res);
      Assert_True(res=Ada.Numerics.Elementary_Functions.Sqrt((vec2(Vec2'First)**2)+(vec2(Vec2'First+1)**2)+(vec2(vec2'last)**2)),Msg & " with vec -1.6,-2.04,2.6");
      vec2:=(31.0,-8.0,6.5);
      module(vec2,res);
      Assert_True(res=Ada.Numerics.Elementary_Functions.Sqrt((vec2(Vec2'First)**2)+(vec2(Vec2'First+1)**2)+(vec2(vec2'last)**2)),Msg & " with vec 31.0,-8.0,6.5");
      vec2:=(-123.4,7.00154,12.887);
      module(vec2,res);
      Assert_True(res=Ada.Numerics.Elementary_Functions.Sqrt((vec2(Vec2'First)**2)+(vec2(Vec2'First+1)**2)+(vec2(vec2'last)**2)),Msg & " with vec -123.4,7.00154,12.887");
   exception
      when Assertion_Error =>
         Put_Line (Msg & " Failed (assertion)");
      when others =>
         Put_Line (Msg & " Failed (exception)");
   end Test_module;

   procedure Test_get is
      Msg   : constant String := "Test_get";
      bool:Boolean;
      vec1:vec(1..5);
      vec2:vec(1..2);
      v0:vec(1..1);
   begin
      vec1:=(1,2,3,4,5);
      vec2:=(-4,-1);
      get(vec1,3,bool);
      Assert_True (bool and then vec1(3)=0, Msg & " get successfully in the middle");
      vec1:=(1,2,3,4,5);
      get(vec1,1,bool);
      Assert_True (bool and then vec1(1)=0, Msg & " get successfully in the First element");
      vec1:=(1,2,3,4,5);
      get(vec1,5,bool);
      Assert_True (bool and then vec1(5)=0, Msg & " get successfully in the last element");
      vec1:=(1,2,3,4,5);
      get(vec1,10,bool);
      Assert_True (bool = False, Msg & " get fail");
      vec1:=(1,2,3,4,5);
      get(vec1,2,bool);
      Assert_True (bool and then vec1(2)=0, Msg & " get successfully");
      get(vec2,4,bool);
      Assert_True (bool = False, Msg & " get fail with two elements");
      vec2:=(-4,-1);
      get(vec2,-4,bool);
      Assert_True (bool and then vec2(1)=0, Msg & " get successfully with two elements");
      vec1:=(4,4,4,4,4);
      get(vec1,4,bool);
      Assert_True(bool and then vec1(1)=0 and then (for all i in vec1'First+1 .. vec1'Last => vec1(i)=4 ), Msg & " get succesfully with the same element");
      vec1:=(0,4,4,4,4);
      get(vec1,4,bool);
      Assert_True (bool and then vec1(2)=0, Msg & " get successfully with zero");

      v0:=(v0'First => 2);
      get(v0,2,bool);
      Assert_True (bool and then v0(1)=0, Msg & " get successfully with one element");
      v0:=(v0'First => 2);
      get(v0,10,bool);
      Assert_True (bool=False and then v0(1)=2, Msg & " get successfully with one element");
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
      Assert_True (perpendicular_vec(v0,v1)=False , Msg & "not perpendicular (2,4),(3,-7)");
      v0 := (6,4); v1 := (-6, 9);
      Assert_True (perpendicular_vec(v0,v1), Msg & " perpendicular (6,4),(-6,9)");
      v0 := (0,4); v1 := (-6, 0);
      Assert_True (perpendicular_vec(v0,v1), Msg & " perpendicular (0,4),(-6,0)");
      v0 := (0,0); v1 := (0, 0);
      Assert_True (perpendicular_vec(v0,v1), Msg & " perpendicular (0,0),(0,0)");
      v0 := (1,4); v1 := (-4, 1);
      Assert_True (perpendicular_vec(v0,v1), Msg & " perpendicular (1,4),(-4,1)");
      v0 := (-1,4); v1 := (-4, 1);
      Assert_True (perpendicular_vec(v0,v1)=False, Msg & " not perpendicular (-1,4),(-4,1)");
      v0 := (-88,-57); v1 := (0, -136);
      Assert_True (perpendicular_vec(v0,v1)=False, Msg & " not perpendicular (-88,-57),(0,-136)");
      v0 := (-1,-1); v1 := (-6, -6);
      Assert_True (perpendicular_vec(v0,v1)=False, Msg & " not perpendicular (-1,-1),(-6,-6)");
      v0 := (0,0); v1 := (0, 0);
      Assert_True (perpendicular_vec(v0,v1), Msg & " perpendicular (0,0),(0,0)");
   exception
      when Assertion_Error =>
         Put_Line (Msg & " Failed (assertion)");
      when others =>
         Put_Line (Msg & " Failed (exception)");
   end Test_perpendicular_vec;

   procedure Test_derivative is
      Msg   : constant String := "Test_derivative";
      dv0 : vecFloat(5..5);
      vecRes : vecFloat(1..1);
      vecMillion: vecFloat(1..1000000);
      vecMillionRes:vecFloat(1..1000000);
   begin
      dv0 := (dv0'First => 2.0);
      vecRes := derivative(dv0);
      Assert_True (vecRes(vecRes'First) = 0.0, Msg & " with a function with only one coefficient (2).");
      Assert_True (derivative((3.0,5.0)) = (3.0,0.0), Msg & " with 3x + 5");
      Assert_True (derivative((0.0,5.0)) = (0.0,0.0), Msg & " with 0x + 5");
      Assert_True (derivative((0.0,0.0)) = (0.0,0.0), Msg & " with 0x + 0");
      Assert_True (derivative((1.0,5.0)) = (1.0,0.0), Msg & " with x + 5");
      Assert_True (derivative((0.0,0.0,0.0)) = (0.0,0.0,0.0), Msg & " with 0x^2 + 0x + 0");
      Assert_True (derivative((2.0,0.0,6.0)) = (4.0,0.0,0.0), Msg & " with 2x^2 + 0x + 6");
      Assert_True (derivative((2.0,1.0,6.0)) = (4.0,1.0,0.0), Msg & " with 2x^2 + 1x + 6");
      Assert_True (derivative((0.0,0.0,6.0)) = (0.0,0.0,0.0), Msg & " with 0x^2 + 0x + 6");
      Assert_True (derivative((4.0,0.0,6.0)) = (8.0,0.0,0.0), Msg & " with 4x^2 + 0x + 6");
      Assert_True (derivative((1.0,1.0,1.0)) = (2.0,1.0,0.0), Msg & " with 1x^2 + 1x + 1");
      Assert_True (derivative((0.5,1.0,1.0)) = (1.0,1.0,0.0), Msg & " with (1/2)x^2 + 1x + 1");
      Assert_True (derivative((0.0,0.0,0.0,0.0)) = (0.0,0.0,0.0,0.0), Msg & " with 0x^3 + 0x^2 + 0x+0");
      Assert_True (derivative((2.0,0.0,6.0,0.0)) = (6.0,0.0,6.0,0.0), Msg & " with 2x^3+ 0x^2 + 6x +0");
      Assert_True (derivative((2.0,1.0,6.0,0.0)) = (6.0,2.0,6.0,0.0), Msg & " with 2x^3 + 1x^2 + 6x+0");
      Assert_True (derivative((0.0,0.0,6.0,0.0)) = (0.0,0.0,6.0,0.0), Msg & " with 0x^3 + 0x^2 + 6x+8");
      Assert_True (derivative((4.0,0.0,6.0,0.0)) = (12.0,0.0,6.0,0.0), Msg & " with 4x^3 + 0x^2+ 6x+ 0");
      Assert_True (derivative((1.0,1.0,1.0,0.0)) = (3.0,2.0,1.0,0.0), Msg & " with 1x^3 + 1x^2 + 1x+0");
      Assert_True (derivative((2.5,1.0,1.0,0.0)) = (7.5,2.0,1.0,0.0), Msg & " with 2.5x^3 + 1x^2 + 1x+0");
      vecMillion:=(others =>0.0);
      vecMillionRes:=(others =>0.0);
      Assert_True(derivative(vecMillion)=vecMillionRes,Msg & " with 1 million elements with all 0");
      vecMillion:=(others =>1.0);

      for i in vecMillion'Range loop
         vecMillionRes(i):=Float(vecMillionRes'Length - (i - vecMillionRes'First + 1));
      end loop;

      Assert_True(derivative(vecMillion)=vecMillionRes,Msg & " with 1 million elements with all 1");
      vecMillion:=(others =>2.0);

      for i in vecMillion'Range loop
         vecMillionRes(i):=Float(vecMillionRes'Length - (i - vecMillionRes'First + 1))*2.0;
      end loop;

      Assert_True(derivative(vecMillion)=vecMillionRes,Msg & " with 1 million elements with all 2");
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
   Test_module;
   Test_get;
   Test_perpendicular_vec;
   Test_derivative;
   --Test_derivative_x;
end Main;

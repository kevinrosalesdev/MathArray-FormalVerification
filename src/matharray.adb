with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Elementary_Functions;
with Calculator; use Calculator;


package body MathArray with SPARK_Mode => On is

   function midpoint (point1 : vec; point2 : vec) return vec is
      result:vec (point1'Range):= (others => 0);
   begin
      for i in point1'Range loop
         result (i) := (point1(i)+point2(i))/2;
         pragma Loop_Invariant (for all j in result'First .. i =>
                                result (j) = (point1(j)+point2(j))/2);
      end loop;
      return result;
   end midpoint;
   
   procedure module (vec1 : vecFloat; res : out Float)is
   begin
      if vec1'Length = 2 then
         res:=Ada.Numerics.Elementary_Functions.Sqrt(abs(vec1(vec1'First)*vec1(vec1'First)) + abs(vec1(vec1'Last)*vec1(vec1'Last)));
      else
         res:=Ada.Numerics.Elementary_Functions.Sqrt(abs(vec1(vec1'First)*vec1(vec1'First)) + abs(vec1(vec1'First+1)*vec1(vec1'First+1)) + abs(vec1(vec1'Last)*vec1(vec1'Last)));
      end if;
   end module;
   
   function derivative (vec1 : vec) return vec is
      res : vec(vec1'Range) := (others => 0);
   begin
      for i in res'Range loop
         res(i) :=  vec1(i)*(res'Last - i);
      end loop;
      return res;
   end derivative;
--     
--     function derivative_x (vec1 : vec; point : Integer) return Integer is
--        res : Integer := 0;
--        fder : vec(vec1'Range);
--     begin
--        fder := derivative(vec1);
--        for i in fder'First..fder'Last-1 loop
--           res := res + fder(i)*(point**(vec1'Length-(i-vec1'First+2)));
--           pragma Loop_Invariant (res = res + fder(i)*(point**(vec1'Length-(i-vec1'First+2))));
--        end loop;
--        return res;
--     end derivative_x;
     
   procedure get(a:in out vec; x:Integer; bool:out Boolean)  is
      i:Integer:=a'First;
   begin
      bool := false;
      while  i <= a'Last loop
         if a(i)=x then
            a(i):=0;
            bool := True;
            exit;
         end if;
         pragma Loop_Variant(Increases => i);
         pragma Loop_Invariant(i in a'Range and then (for all j in a'First .. i =>
                                                     j in a'Range and then 
                                                     a(j) /= x));
         i:=i+1;
      end loop;
   end get;
   
   
   function perpendicular_vec (vec1 : vec; vec2 : vec) return Boolean is
   begin 
      return (vec1(vec1'First)*vec2(vec2'First))+(vec1(vec1'Last)*vec2(vec2'Last)) = 0;
   end perpendicular_vec;

end MathArray;

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Elementary_Functions;

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
   
   function derivative (vec1 : vecFloat) return vecFloat is
      res : vecFloat(vec1'Range) := (others => 0.0);
   begin
      for i in res'Range loop
         res(i) :=  vec1(i)*Float(res'Length - (i - res'First + 1));
      end loop;
      return res;
   end derivative;
--     
--     function derivative_x (vec1 : vecFloat; point : Integer) return Float is
--        res : Float := 0.0;
--        fder : vecFloat(vec1'Range);
--     begin
--        fder := derivative(vec1);
--        for i in fder'First..fder'Last-1 loop
--           res := res + fder(i)*Float(point**(vec1'Length-(i-vec1'First+2)));
--           pragma Loop_Invariant (res = res + fder(i)*Float(point**(vec1'Length-(i-vec1'First+2))));
--        end loop;
--        return res;
--     end derivative_x;
     
   procedure get(a:in out vec; x:Integer; bool:out Boolean)  is
   begin
      bool := false;
      for i in a'Range loop
         if a(i)=x then
            a(i):=0;
            bool := True;
            exit;
         end if;
         pragma Loop_Invariant((for all k in a'First..i => a(k) /= x) and then bool = false);
      end loop;
   end get;
   
   
   function perpendicular_vec (vec1 : vec; vec2 : vec) return Boolean is
   begin 
      return (vec1(vec1'First)*vec2(vec2'First))+(vec1(vec1'Last)*vec2(vec2'Last)) = 0;
   end perpendicular_vec;

end MathArray;

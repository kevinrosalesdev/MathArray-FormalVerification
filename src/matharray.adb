with Ada.Text_IO; use Ada.Text_IO;
package body MathArray with SPARK_Mode => On is

   function midpoint (point1 : vec; point2 : vec) return vec is
   begin
      return point1;
   end midpoint;
   
   procedure module (vec1 : vec; res : in out Float)is
   begin
      null;
   end module;
   
   function derivative (vec1 : vec) return vec is
   begin
      return vec1;
   end derivative;
   
   function derivative_x (vec1 : vec; point : Integer) return Integer is
   begin
      return 0;
   end derivative_x;
   
   procedure logarithm (base : Integer; x: Float; res:out Float) is
      --EN CUARENTENA(VERIFICACIÓN FORMAL)--> Si quieres verificar vuestros casos comentar este procedimiento
      function exp (base:Float; n:Integer) return Float is
         r:Float:=1.0;
      begin
         for i in reverse 1..n loop
            r := r*base;
            pragma Loop_Invariant (r = r'Loop_Entry*base);
         end loop;
         return r;
      end ;
      val:Float:=0.0;
      accurate:Integer:=10;
      reps,i:Integer:=0;
      bas:Integer:=base;
      num:Float:=x;
   begin
      while num /= 1.0 and then accurate >= 0 loop
         while num >= Float(bas) loop
            num := num/Float(bas);
            i := i+1;
            pragma Loop_Variant(Increases => i);
            pragma Loop_Invariant(num < num'Loop_Entry);
            -->Mejorar Invariante
         end loop;
         num := Float(exp(num,10));
         val := 10.0*(val+Float(i));
         accurate:=accurate-1;
         reps:=reps+1;
         pragma Loop_Variant(Increases => reps);
         pragma Loop_Variant(Decreases => accurate);
         -->Encontrar Invariante adecuada******
      end loop;
      res := val/Float(exp(10.0,reps));
   end logarithm;
   
   function perpendicular_vec (vec1 : vec; vec2 : vec) return Boolean is
      res:Integer:=0;
   begin 
      for i in vec1'First..vec1'Last loop
         res:=res + (vec2(i)*vec1(i));
         pragma Loop_Invariant(res = res'Loop_Entry + (vec1(i)*vec2(i)));
         ---> Mejorar invariante los casos que da es porque no ayudamos lo suficiente al verificador
      end loop;
      return res = 0;
   end perpendicular_vec;

end MathArray;

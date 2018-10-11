with Calculator; use Calculator;
with Ada.Numerics.Elementary_Functions;
use Ada.Numerics.Elementary_Functions;
package MathArray with SPARK_Mode => On is

   type vec is array(Natural range <>) of Integer;
   type vecFloat is array(Natural range <>) of Float;
   
--     function midpoint (point1 : vec; point2 : vec) return vec with
--       Pre => (point1'First = point2'First) and then (point1'Last = point2'Last) and then (point1'Length=3 or point1'Length=2)
--       and then (for all i in point1'Range => 
--                (if point1(i) > 0 and point2(i) > 0 then
--                     point1(i)  <= Integer'Last - point2(i))                
--              and (if point1(i) < 0 and point2(i) < 0 then                   
--                     point1(i) >= Integer'First - point2(i))),
--       Post=>midpoint'Result'Length=point1'Length and then (midpoint'Result'Length=3 or midpoint'Result'Length=2) and then 
--       (for all i in midpoint'Result'Range =>
--       midpoint'Result(i)=Add(point1(i),point2(i))/2);
--     --Return vector midpoint of both parameters.
   
   procedure module (vec1 : vecFloat; res : out Float) with 
     Pre=>(vec1'length=3 or vec1'Length=2) and then (for all i in vec1'Range =>
                                                         vec1(i)**2 <= Float'Last) and then (if vec1'Length = 2 then
                                                       Float'Last - vec1(vec1'First)**2 >= vec1(vec1'Last)**2)
                                                     else
                                                       Float'Last >= (vec1(vec1'First)**2 + vec1(vec1'First+1)**2 + vec1(vec1'Last)**2)),
     Post=>(if vec1'Length = 2 then                                          
              res=Ada.Numerics.Elementary_Functions.Sqrt(vec1(vec1'First)**2 + vec1(vec1'Last)**2)
            else
              res=Ada.Numerics.Elementary_Functions.Sqrt(vec1(vec1'First)**2 + vec1(vec1'First+1)**2 + vec1(vec1'Last)**2));
   
--     function derivative (vec1 : vec) return vec with
--       Global => null,
--       Depends => (derivative'Result => (vec1)),
--       Pre => vec1'Length > 0 and then 
--              (for all i in vec1'Range =>
--              vec1(i)*(vec1'Length-(i-vec1'First+1)) <= Integer'Last),
--       Post =>(for all i in derivative'Result'Range =>
--              derivative'Result(i) = vec1(i)*(vec1'Length-(i-vec1'First+1))) and then
--              (derivative'Result(derivative'Result'Last) = 0);
   --Return a derivative polynomial vec.
   
--     function derivative_x (vec1 : vec; point : Integer) return Integer with
--       Global => null,
--       Depends => (derivative_x'Result => (vec1, point)),
--       Pre => vec1'Length > 0 and then 
--              (for all i in derivative(vec1)'Range =>
--              point*(derivative(vec1)(i)**(vec1'Length-(i-vec1'First+2))) <= Integer'Last),
--       Post => vec1 = derivative(vec1) and then (if vec1'Length = 1 then
--                                                   derivative_x'Result = 0
--                                                 elsif vec1'Length = 2 then
--                                                   derivative_x'Result = derivative(vec1)(derivative(vec1)'Last-1));
                                                     
                                                     
   --Return the derivative of a function in point (polynomial vec).

   
--     procedure logarithm (base : Integer; x: Float; res: out Float) with
--       Global  => null,
--       Depends => (Res => (base, x)),
--       Pre => base > 1,
--       Post => res**base = x; 
   --> Esto lo tendríamos que ver porque la precisión del método no es exacta varía en un par de decimales
   --EN CUARENTENA(VERIFICACIÓN FORMAL)
   --Calculate the logarithm of x with base parameter and saves it in res.
   
--     function perpendicular_vec (vec1 : vec; vec2 : vec) return Boolean  with
--       Global  => null,
--       Depends => (perpendicular_vec'Result => (vec1, vec2)),
--       Pre => (vec1'First > 1 and then vec1'Last < 4) and then vec2'Length = vec1'Length ,
--       Post => (if perpendicular_vec'Result 
--     then 
--          (if vec1'Length = 2 
--             then vec1(vec1'First)*vec2(vec2'First)= vec1(vec1'First+1)*vec2(vec2'First+1) 
--               else (vec1(vec1'First)*vec2(vec2'First)) 
--                  + (vec1(vec1'First+1)*vec2(vec2'First+1)) +  (vec1(vec1'First+2)*vec2(vec2'First+2)) = 0)
--                  else 
--               (if vec1'Length = 2 
--             then vec1(vec1'First)*vec2(vec2'First) /= vec1(vec1'First+1)*vec2(vec2'First+1) 
--               else (vec1(vec1'First)*vec2(vec2'First)) 
--                     + (vec1(vec1'First+1)*vec2(vec2'First+1)) +  (vec1(vec1'First+2)*vec2(vec2'First+2)) /= 0)); 
   -->Cambiar a contras_case
   
end MathArray;

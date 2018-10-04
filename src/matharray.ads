package MathArray with SPARK_Mode => On is

   type vec is array(Integer range <>) of Integer;
   
   function midpoint (point1 : vec; point2 : vec) return vec;
   --Return vector midpoint of both parameters.
   
   procedure module (vec1 : vec; res : in out Float);
   --Calculate a vector module, which is saved in res. 
   
   procedure fibonacci (vec1 : in out vec);
   --Calculate fibonacci sequence, which is saved in vec1.
   
   function derivative (vec1 : vec) return vec;
   --Return a derivative polynomial vec.
   
   function derivative_x (vec1 : vec; point : Integer) return Integer;
   --Return the derivative of a function in point (polynomial vec).
   
   procedure logarithm (base : Integer; x: Integer; res: in out Integer);
   --Calculate the logarithm of x with base parameter and saves it in res.
   
   function perpendicular_vec (vec1 : vec; vec2 : vec) return Boolean;
   --Return true if both vecs are perpendicular between them.
   
end MathArray;

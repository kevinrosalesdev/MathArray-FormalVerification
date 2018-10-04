package body MathArray with SPARK_Mode => On is

   function midpoint (point1 : vec; point2 : vec) return vec is
   begin
      return point1;
   end midpoint;
   
   procedure module (vec1 : vec; res : in out Float)is
   begin
      null;
   end module;
   
   procedure fibonacci (vec1 : in out vec) is
   begin
      null;
   end fibonacci;
   
   function derivative (vec1 : vec) return vec is
   begin
      return vec1;
   end derivative;
   
   function derivative_x (vec1 : vec; point : Integer) return Integer is
   begin
      return 0;
   end derivative_x;
   
   procedure logarithm (base : Integer; x: Integer; res: in out Integer) is
   begin
      null;
   end logarithm;
   
   function perpendicular_vec (vec1 : vec; vec2 : vec) return Boolean is
   begin
      return true;
   end perpendicular_vec;

end MathArray;

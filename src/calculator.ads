package Calculator with SPARK_Mode => On is
   Last_Quotient  : Integer;
   Last_Remainder : Integer;

   function Add
     (First_Operand  : Integer;
      Second_Operand : Integer) return Integer
   --  Compute the addition of First_Operand plus Second_Operand
     with
       Global  => null,
       Depends => (Add'Result => (First_Operand, Second_Operand)),
       Pre  => (if First_Operand > 0 and Second_Operand > 0 then
                   First_Operand  <= Integer'Last - Second_Operand)                
            and (if First_Operand < 0 and Second_Operand < 0 then                   
                   First_Operand >= Integer'First - Second_Operand),
     
     Post => Add'Result = First_Operand+Second_Operand;
   --  Completa este contrato para que podamos verificar formalmente
   --  esta funcion.

--     procedure Subtract
--       (First_Operand  : Integer;
--        Second_Operand : Integer;
--        Result         : out Integer)
--     --  Using the function 'Add', compute the subtraction of First_Operand
--     --  plus Second_Operand
--     with
--         Global  => null,
--         Depends => (Result => (First_Operand,Second_Operand)),
--         Pre => Second_Operand > Integer'First, 
--         Post => Result = First_Operand-Second_Operand;
--     --  Completa este contrato para que podamos verificar formalmente
--     --  esta funcion.

   procedure Multiply
     (First_Operand  : Integer;
      Second_Operand : Integer;
      Result         : out Integer)
   --  Using the function 'Add' and a for-loop statement, compute the
   --  multiplication of First_Operand by Second_Operand
   with
        Global  => null,
       Depends => (Result => (First_Operand,Second_Operand)),
       Pre  => First_Operand in 1..Integer'Last/2-1 and then
       Second_Operand in 1..Integer'Last/-1,
        Post => Result = First_Operand*Second_Operand;
   --  Completa esta especificacion para que podamos verificar
   --  formalmente esta funcion.

--     procedure Divide
--       (Dividend  : Integer;
--        Divisor   : Integer;
--        Quotient  : in out Integer;
--        Remainder : in out Integer)
--     --  Using the function 'Add', the procedure 'Subtract' and a
--     --  while-loop-statement, compute the division of First_Operand
--     --  by Second_Operand and store the resulting Quotient and
--     --  Remainder in the global variables Last_Quotient and
--     --  Last_Remainder.
--     with
--         Global  => null,
--         Pre     => Divisor /= 0 and then Dividend > Integer'First 
--       and then Divisor > Integer'First and then Quotient > Integer'First,
--        Post    => Dividend/Divisor=Quotient;
--     --  Completa esta especificacion para que podamos verificar
--     --  formalmente esta funcion.
    
end Calculator;

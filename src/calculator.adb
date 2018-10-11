package body Calculator with SPARK_Mode => On is

   function Add
     (First_Operand  : Integer;
      Second_Operand : Integer) return Integer is
   begin
      return First_Operand+Second_Operand;
   end Add;

--     procedure Subtract
--       (First_Operand  : Integer;
--        Second_Operand : Integer;
--        Result         : out Integer) is
--     begin
--        Result := Add(First_Operand, -Second_Operand);
--     end Subtract;

--     procedure Multiply
--       (First_Operand  : Integer;
--        Second_Operand : Integer;
--        Result         : out Integer) is
--        A :Integer := First_Operand;
--        B:Integer:= Second_Operand;
--        res:Integer:=0;
--     begin
--        for i in 1..B loop
--           res := Add(A, res);
--           -->Problemas
--           pragma Loop_Invariant(res=A*i);
--        end loop;
--        Result := res;
--     end Multiply;

--     procedure Divide
--       (Dividend  : Integer;
--        Divisor   : Integer;
--        Quotient  : in out Integer;
--        Remainder : in out Integer) is
--        A :Integer := Dividend;
--        B:Integer:=Divisor;
--        signo1:Boolean:=False;
--        signo2:Boolean:=False;
--     begin
--        Remainder := A;
--        if Remainder /= 0 then
--           if B < 0 then
--              B := -B;
--              signo2 := true;
--           elsif Remainder < 0 then
--              Remainder := -Remainder;
--              A:=-A;
--              signo1 := true;
--           end if;
--           Quotient := 0;
--           while Remainder>=B loop
--              Subtract(Remainder,B,Remainder);
--              Quotient:=Quotient+1;
--              pragma Loop_Variant(Increases => Quotient);
--              pragma Loop_Variant(Decreases => Remainder);
--              pragma Loop_Invariant(Quotient > 0 and then (Quotient*B)+Remainder <= A);
--           end loop;
--           if signo1 xor signo2 then
--              Quotient := -Quotient;
--           else
--              Quotient := Quotient;
--           end if;
--        end if;
--     end Divide;

end Calculator;

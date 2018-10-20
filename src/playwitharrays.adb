with Ada.Text_IO;     use Ada.Text_IO;

package body playWithArrays with SPARK_Mode => On is

   function play (Table: T_Table; Table_2: T_Table) return T_Table is
      res : T_Table (Table'First .. Table'Last) := (others => 0);
   begin
      if (Table'Length - 1) = (Table_2'Length - 1) and Table'First = Table_2'First and
      res'First = 0  and Table'Last = Table_2'Last then

         if Table'First = Table'Last then
            res(0) := Table(0);

            return res;
         else
            for J in res'Range loop
               pragma Loop_Invariant (Table'First = Table_2'First );
               --pragma Loop_Invariant ();

               if J rem 2 = 0 then
                  res(J) := Table(J);
               else
                  res(J) := Table_2(J);
               end if;
            end loop;

         end if;

      end if;
         return res;
   end play;

   --Este metodo se podría hacer en una linea "return play(Table_2,Table);"
   --Pero haremos un bucle while para practicar las herramientas spark
   function playInverse (Table: T_Table; Table_2: T_Table) return T_Table is
      res : T_Table (Table'First .. Table'Last);
      Temp : Natural := Table'First;
   begin
      res := Table_2;
      while Temp <= Table'Last loop
         --controlamos la salida del bucle
         pragma Loop_Variant (Increases => Temp + 1);
         --le idicamos que los pares impares seran modificados.
         --pragma Loop_Variant
           --(for all Temp in res'Range =>
             -- (if Temp rem 2 /= 0 then res(T_Table)));


         if Temp rem 2 /= 0 then
            res(Temp) := Table(Temp);
         end if;
         Temp := Temp + 1;
      end loop;
      return res;

   end playInverse;


   function playArrayResultInverse (Table: T_Table; Table_2: T_Table) return T_Table is
      res : T_Table := play(Table,Table_2);
      def : T_Table (Table'First .. Table'Last) := (others => 0);
      begin
      if res'Length = def'Length and res'First = def'First then
         for J in def'First .. def'Last loop
            pragma Loop_Invariant (J>=0);
            def(J) := res(res'Last - J);
         end loop;
      end if;
      return def;
   end playArrayResultInverse;

end playWithArrays;

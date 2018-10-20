package playWithArrays with SPARK_Mode => On is
   type T_Table is array (Natural range <>) of Integer;

   function play (Table: T_Table; Table_2: T_Table) return T_Table
     with

       Pre => Table'Length > 0 and
       Table_2'Length > 0 and
       Table'Length = Table_2'Length and
       Table'First = Table_2'First and
       Table'Last = Table_2'Last and
       Table'First = 0,

     Post =>
       play'Result'First = Table'First
        and
          play'Result'Last = Table'Last
       and


       (for all J in play'Result'Range =>
            (if J rem 2 = 0 then
               play'Result(J) = Table(J)
            )

            or

          (if J rem 2 /= 0 then
               play'Result(J) = Table_2(J)
            )
       );




   function playInverse (Table: T_Table; Table_2: T_Table) return T_Table
     with
       Pre => Table'Length > 0 and
       Table_2'Length > 0 and
       Table'Length = Table_2'Length and
       Table'First = Table_2'First and
       Table'Last = Table_2'Last and
       Table'First = 0,

       Post =>
       playInverse'Result'First = Table'First
        and
          playInverse'Result'Last = Table'Last
       and


       (for all J in playInverse'Result'Range =>
            (if J rem 2 /= 0 then
               playInverse'Result(J) = Table(J)
            )

            or

          (if J rem 2 = 0 then
               playInverse'Result(J) = Table_2(J)
            )
       )


   ;


   function playArrayResultInverse (Table: T_Table; Table_2: T_Table) return T_Table
   with
       Pre => Table'Length > 0 and
       Table_2'Length > 0 and
       Table'Length = Table_2'Length and
       Table'First = Table_2'First and
       Table'Last = Table_2'Last and
       Table'First = 0,


          Post =>
       playArrayResultInverse'Result'First = Table'First
        and
          playArrayResultInverse'Result'Last = Table'Last
       and
             (
             (if playArrayResultInverse'Result'Last rem 2 = 0 then

                 (for all J in playArrayResultInverse'Result'Range =>
                       (if J rem 2 = 0 then
                             playArrayResultInverse'Result(J) = Table(Table'Last - J)
                        )

                   or

                     (if J rem 2 /= 0 then
                           playArrayResultInverse'Result(J) = Table_2(Table_2'Last - J)
                      )
                       )
              )
             or
               (if playArrayResultInverse'Result'Last rem 2 /= 0 then
                   (for all J in playArrayResultInverse'Result'Range =>
                         (if J rem 2 = 0 then
                               playArrayResultInverse'Result(J)= Table_2(Table_2'Last - J)
                          )
                     or
                       (if J rem 2 /= 0 then
                             playArrayResultInverse'Result(J) = Table(Table'Last - J)
                        )
                    )))

   ;



end playWithArrays;

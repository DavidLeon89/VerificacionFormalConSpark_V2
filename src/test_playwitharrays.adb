--  Anade mas tests para comprobar todas las combinaciones de
--  operadores positivos, negativos y el cero.

with Ada.Text_IO;     use Ada.Text_IO;
with Test_Assertions; use Test_Assertions;
with playWithArrays;      use playWithArrays;



procedure test_playwitharrays is

   procedure Test_play is
      Table1 : T_Table (0 .. 4) := (1, 2, 3, 4, 5);
      Table2 : T_Table (0 .. 4) := (5, 4, 3, 2, 1);
      Msg   : constant String := "Play1: Positive vector";
   begin
      Assert_True (play (Table1, Table2) = (1, 4, 3, 2, 5), Msg);
   exception
      when Test_Assertion_Error =>
         Put_Line (Msg & " Failed (assertion)");
      when others =>
         Put_Line (Msg & " Failed (exception)");
   end Test_play;


   procedure Test_play2 is
      Table1 : T_Table (0 .. 4) := (0,0,0,0,0);
      Table2 : T_Table (0 .. 4) := (-1,-1,-1,-1,-1);
      Msg   : constant String := "Play2: Positive vector";

   begin
      Assert_True (play (Table1, Table2) = (0,-1,0,-1,0), Msg);
   exception
      when Test_Assertion_Error =>
         Put_Line (Msg & " Failed (assertion)");
      when others =>
         Put_Line (Msg & " Failed (exception)");
   end Test_play2;


   procedure Test_play3 is
      Table1 : T_Table (0 .. 3) := (-1,-1,-1,-1);
      Table2 : T_Table (0 .. 3) := (0,0,0,0);
      Msg   : constant String := "Play3: Positive vector";

   begin
      Assert_True (play (Table1, Table2) = (-1,0,-1,0), Msg);
   exception
      when Test_Assertion_Error =>
         Put_Line (Msg & " Failed (assertion)");
      when others =>
         Put_Line (Msg & " Failed (exception)");
   end Test_play3;

   procedure Test_playInverse is
      Table1 : T_Table (0 .. 4) := (1, 2, 3, 4, 5);
      Table2 : T_Table (0 .. 4) := (5, 4, 3, 2, 1);
      Msg   : constant String := "playInverse1: Positive vector";
   begin
      Assert_True (playInverse (Table1, Table2) = (5,2,3,4,1), Msg);
   exception
      when Test_Assertion_Error =>
         Put_Line (Msg & " Failed (assertion)");
      when others =>
         Put_Line (Msg & " Failed (exception)");
   end Test_playInverse;


    procedure Test_playInverse2 is
      Table1 : T_Table (0 .. 4) := (0,0,0,0,0);
      Table2 : T_Table (0 .. 4) := (-1,-1,-1,-1,-1);
      Msg   : constant String := "playInverse2: Positive vector";
   begin
      Assert_True (playInverse (Table1, Table2) = (-1,0,-1,0,-1), Msg);
   exception
      when Test_Assertion_Error =>
         Put_Line (Msg & " Failed (assertion)");
      when others =>
         Put_Line (Msg & " Failed (exception)");
   end Test_playInverse2;


   procedure Test_playArrayResultInverse is
      Msg   : constant String := "PlayArrayResultInverse1: Positive vector";
      Table1 : T_Table (0 .. 2) := (1, 2, 3);
      Table2 : T_Table (0 .. 2) := (99, 100, 101);
   begin
      Assert_True (playArrayResultInverse (Table1, Table2) = (3,100,1), Msg);

   exception
      when Test_Assertion_Error =>
         Put_Line (Msg & " Failed (assertion)");
      when others =>
         Put_Line (Msg & " Failed (exception)");
   end Test_playArrayResultInverse;



   procedure Test_playArrayResultInverse2 is
      Table1 : T_Table (0 .. 4) := (0,0,0,0,0);
      Table2 : T_Table (0 .. 4) := (-1,-1,-1,-1,-1);
      Msg   : constant String := "Test_playArrayResultInverse2: Positive vector";
   begin
      Assert_True (playArrayResultInverse (Table1, Table2) = (0,-1,0,-1,0), Msg);
   exception
      when Test_Assertion_Error =>
         Put_Line (Msg & " Failed (assertion)");
      when others =>
         Put_Line (Msg & " Failed (exception)");
   end Test_playArrayResultInverse2;


   procedure Test_playArrayResultInverse3 is
      Table1 : T_Table (0 .. 3) := (-1,-1,-1,-1);
      Table2 : T_Table (0 .. 3) := (0,0,0,0);
      Msg   : constant String := "Test_playArrayResultInverse3: Positive vector";

   begin
      Assert_True (playArrayResultInverse (Table1, Table2) = (0,-1,0,-1), Msg);
   exception
      when Test_Assertion_Error =>
         Put_Line (Msg & " Failed (assertion)");
      when others =>
         Put_Line (Msg & " Failed (exception)");
   end Test_playArrayResultInverse3;


begin
   Put_Line ("********************* Test_playwitharrays");
   Test_play;
   Test_play2;
   Test_play3;
   Test_playInverse;
   Test_playInverse2;
   Test_playArrayResultInverse;
   Test_playArrayResultInverse2;
   Test_playArrayResultInverse3;
end test_playwitharrays;


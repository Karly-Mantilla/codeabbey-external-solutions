with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Strings.Unbounded;
with Ada.Strings;
with Ada.Strings.Maps;

use Ada.Text_IO;
use Ada.Integer_Text_IO;
use Ada.Strings;
use Ada.Strings.Unbounded;
use Ada.Strings.Maps;

procedure codeabby75 is
  subtype dices is Integer range 1..6;
  subtype dicecount is Integer range 0..5;
  type countgames is array (1..6) of dicecount;
  count      : Positive;
  result     : Unbounded_String;
  dice       : dices;
  this_game  : countgames := (others => 0);
  map_hyphen : constant Character_Mapping := To_Mapping(To_Sequence(To_Set('_')),To_Sequence(To_Set('-')));
    
  function score (this_game: countgames) return String is
    type scores is (pair, two_pairs, three, four, yacht, full_house, small_straight, big_straight, none);
    result     : scores := none;
    res_string : String(1..14);
    package Enum_IO is new Enumeration_IO(scores);      
  begin
    for i in this_game'Range loop
      if result /= pair and result /= three and this_game(i) = 2 then
    result := pair;
      elsif result = pair and this_game(i) = 2 then
    result := two_pairs;
      elsif result = three and this_game(i) = 2 then
    result := full_house;
      elsif result /= pair and this_game(i) = 3 then
    result := three;
      elsif result = pair and this_game(i) = 3 then
    result := full_house;
      elsif this_game(i) = 4 then
    result := four;
      elsif this_game(i) = 5 then
    result := yacht;
      end if;
    end loop;
    if this_game(6) = 0 and result = none then
      result := small_straight;
    elsif this_game(1) = 0 and result = none then
      result := big_straight;
    end if;
    Enum_IO.Put(res_string,result,Lower_Case);
    return res_string;
  end score;

begin
  Get(count);
  Skip_Line;
  for i in 1..count loop
    this_game := (others => 0);
    for n in 1..5 loop
      Get(dice);
      this_game(dice) := this_game(dice) + 1;
    end loop;
    Append(result,score(this_game));
    Trim(result,Right);
    Append(result," ");
  end loop;
  Translate(result,map_hyphen);
  Put_Line(To_String(result));
end codeabby75;
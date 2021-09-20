with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Strings;
with Ada.Strings.Unbounded;
with Ada.Strings.Unbounded.Text_IO;
with Ada.Containers.Vectors;
with Ada.Numerics.Generic_Elementary_Functions;

procedure codeabby51 is
    type rolls is array (Positive range <>) of Positive;
    type distributions is array (Natural range <>) of Natural;
    subtype faces is Integer range 2..12;
    subtype numbers is Integer range 1..5;
    subtype scores is Integer range 0..100;
    type meta_dices is record
        face : faces;
        number : numbers;
        name : Ada.Strings.Unbounded.Unbounded_String;
    score : scores := 100;
        distribution : distributions(1..60) := (others => 0);
    end record;

    function sort_by_score (L, R : meta_dices) return Boolean is
    begin
      return L.Score < R.Score;
    end sort_by_score;
    
    package dices is new Ada.Containers.Vectors(Index_Type => Positive, Element_Type => meta_dices);
    package sorting_dices is new dices.Generic_Sorting(sort_by_score);
    package math is new Ada.Numerics.Generic_Elementary_Functions(Float);
    type results is array (Positive range <>) of Ada.Strings.Unbounded.Unbounded_String;
    roll                : rolls(1..100);
    roll_distribution   : distributions(1..60) := (others => 0);
    curr_roll           : Positive;
    curr_face           : faces := 2;
    max_roll, min_roll  : Natural := 0;
    dice                : dices.Vector;
    curr_meta_dice      : meta_dices;
    curr_meta_dice_name : Ada.Strings.Unbounded.Unbounded_String;
    task_count          : constant Positive := 3;
    result              : results(1..task_count);
    result_line         : Ada.Strings.Unbounded.Unbounded_String;

    function get_min_dice (dice : meta_dices) return Positive is
    begin
        return 1 * dice.number;
    end get_min_dice;

    -- all possible number all possible numbers of other dice added
    -- http://www.spektrum.de/quiz/zwei-wuerfel-welches-ergebnis-wuerfelt-man-am-haeufigsten/614128
    -- http://www.schule-bw.de/unterricht/faecher/mathematik/3material/sek1/zufall/zweiwuerfel.pdf
    function get_dice_frequency_distribution(face : faces; number : numbers) return distributions is
        distribution   : distributions(1..60) := (others => 0);
        num_throws     : Positive  := face**number;
        curr_throw     : distributions(1..number) := (others => 1);
        sum_curr_throw : Natural := 0;
        overflow       : Boolean := True;
        count          : Natural := number;
    begin
        for i in 1..num_throws loop
            sum_curr_throw := 0;
            for j in 1..number loop
                sum_curr_throw := sum_curr_throw + curr_throw(j);
            end loop;
            distribution(sum_curr_throw) := distribution(sum_curr_throw) + 1;
            -- next iteration:
            overflow := True;
            count := number;
            while overflow loop
                if curr_throw(count) = face then
                    curr_throw(count) := 1;
                    overflow := True;
                elsif curr_throw(count) < face then
                    curr_throw(count) := curr_throw(count) + 1;
                    overflow := False;
                end if;
                count := count - 1;
                if count = 0 then
                    overflow := False;
                end if;
            end loop;
        end loop;

        return distribution;
    end get_dice_frequency_distribution;

    function get_measurment_frequency_distribution (roll : rolls) return distributions is
        distribution   : distributions(1..60) := (others => 0);
    begin
        for i in 1..roll'Length loop
            distribution(roll(i)) := distribution(roll(i)) + 1;
        end loop;
        return distribution;
    end get_measurment_frequency_distribution;
    
    procedure test_frequency_distribution (dice : in out dices.Vector; roll_distribution : in distributions) is
        length               : Positive := Positive(dices.Length(dice));
        roll_norm, dice_norm, roll_center_x, dice_center_x, roll_center_y, dice_center_y, roll_sum_mass, dice_sum_mass,
        roll_mass, dice_mass, roll_x, dice_x, roll_y, dice_y, dist_x, dist_y, vec_norm_length : Float := 0.0;
        use math;
    begin
        -- compare
        for i in 1..length loop
            -- compare dice(i).distribution with roll_distribution center of gravity
            -- initialize:
            roll_center_x := 0.0;
            dice_center_x := 0.0;
            roll_center_y := 0.0;
            dice_center_y := 0.0;
            roll_sum_mass := 0.0;
            dice_sum_mass := 0.0;
            roll_x := 0.0;
            dice_x := 0.0;
            roll_y := 0.0;
            dice_y := 0.0;
            for j in 1..roll_distribution'Length loop
                -- formular:
                -- center of gravity of a system of masspoints of mass mass(j)
                -- center_x = sum(mas(j) * x(j))/sum(mass(j))
                -- center_y = sum(mas(j) * y(j))/sum(mass(j))
                if roll_distribution(j) = 0 then
                    roll_mass := 0.0;
                else 
                    roll_mass := 1.0;
                end if;
                if dice(i).distribution(j) = 0 then
                    dice_mass := 0.0;
                else
                    dice_mass := 1.0;
                end if;
                -- normalize to 1
                roll_norm := Float(roll_distribution(j))/100.0;
                dice_norm := Float(dice(i).distribution(j))/(Float(dice(i).face) ** dice(i).number);
                -- calculate center of gravity
                roll_y := roll_y + roll_norm * roll_mass;
                dice_y := dice_y + dice_norm * dice_mass;
                roll_x := roll_x + Float(j) * roll_mass;
                dice_x := dice_x + Float(j) * dice_mass;
                roll_sum_mass := roll_sum_mass + roll_mass;
                dice_sum_mass := dice_sum_mass + dice_mass;
            end loop;
            -- calculate center of gravity, calculate nomalized length
            roll_center_x := roll_x / roll_sum_mass;
            roll_center_y := roll_y / roll_sum_mass;
            dice_center_x := dice_x / dice_sum_mass;
            dice_center_y := dice_y / dice_sum_mass;
            -- alter dice(i).score
            dist_x := abs(roll_center_x - dice_center_x);
            dist_y := abs(roll_center_y - dice_center_y);
            -- 33 is > the center of 5d12, this value is usefull for nomalisation in this case
            vec_norm_length := sqrt(dist_x ** 2 + dist_y ** 2)/33.0;
            if dice(i).score /= 0 then
                dice(i).score := dice(i).score - scores(100.0 * vec_norm_length);
            end if;
        end loop;
    end test_frequency_distribution;

    function get_max_dice (dice : meta_dices) return Positive is
    begin
        return dice.face * dice.number;
    end get_max_dice;

    function Natural_To_UString (number : Natural) return Ada.Strings.Unbounded.Unbounded_String is
        use Ada.Strings;
        result : Ada.Strings.Unbounded.Unbounded_String;
        side   : Trim_End := Both;
    begin
        -- initialize
        Ada.Strings.Unbounded.Set_Unbounded_String(Target => result, Source => Natural'Image(number));
        return Ada.Strings.Unbounded.Trim(Source => result, Side => side);
    end Natural_To_UString;

    procedure test_min_max (max_roll, min_roll : in natural; dice : in out dices.Vector ) is
        length              : Positive := Positive(dices.Length(dice));
    begin
        for i in 1..length loop
            if get_min_dice(dice(i)) > min_roll or get_max_dice(dice(i)) < max_roll then
                dice(i).score := 0;
             end if;
        end loop;
    end test_min_max;

    procedure set_dice_frequency_distribution (dice : in out dices.Vector) is
        length : Natural := Natural(dices.Length(dice));
    begin
        for i in 1..length loop
            dice(Natural(i)).distribution := get_dice_frequency_distribution(dice(Natural(i)).face,dice(Natural(i)).number);
        end loop;
    end set_dice_frequency_distribution;


 
begin
    for i in 1..5 loop
        -- initialize array of all possible combinations
        curr_face := 2;
        all_faces: loop
            ada.strings.unbounded.append(source => curr_meta_dice_name, 
                                        new_item => natural_to_ustring(i));
            ada.strings.unbounded.append(source => curr_meta_dice_name, new_item => "d");
            ada.strings.unbounded.append(source => curr_meta_dice_name, 
                                        new_item => natural_to_ustring(curr_face));
            curr_meta_dice.face := curr_face;
            curr_meta_dice.number := i;
            curr_meta_dice.name := curr_meta_dice_name;
            curr_meta_dice.distribution := get_dice_frequency_distribution(curr_face,i);
            dices.append(container => dice, new_item => curr_meta_dice);
            ada.strings.unbounded.set_unbounded_string(target => curr_meta_dice_name, source => "");
            exit all_faces when curr_face = 12;
            curr_face := curr_face + 2;
        end loop all_faces;
    end loop;
    for k in 1..task_count loop
        for i in 1..Positive(dices.Length(dice)) loop
            dice(i).score := 100;
        end loop;
        max_roll := 0;
        min_roll := 0;
        for i in 1..100 loop
            Ada.Integer_Text_IO.Get(curr_roll);
            roll(i) := curr_roll;
            if max_roll = 0 then
                -- initialize
                max_roll := curr_roll;
                min_roll := curr_roll;
            elsif max_roll < curr_roll then
                max_roll := curr_roll;
            elsif min_roll > curr_roll then
                min_roll := curr_roll;
            end if;
        end loop;
        Ada.Text_IO.Skip_Line;
        test_min_max(max_roll,min_roll,dice);
        -- now calculate the frequency_distribution of our 100 val sample
        roll_distribution := get_measurment_frequency_distribution(roll);
        -- after that compare and modify score
        test_frequency_distribution(dice,roll_distribution);
        -- last result should be that with highest score, sort the vector after score
        sorting_dices.Sort(dice);
        result(k) := dices.Last_Element(dice).name;
    end loop;
    for k in 1..task_count loop
        ada.strings.unbounded.append(source => result_line, new_item => result(k));
        ada.strings.unbounded.append(source => result_line, new_item => " ");
    end loop;
    Ada.Strings.Unbounded.Text_IO.Put_Line(result_line);
end codeabby51;
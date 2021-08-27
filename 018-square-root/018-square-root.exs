:- module jpchavesm.
:- interface.
:- import_module io.
:- pred main(io::di, io::uo) is det.
:- implementation.
:- import_module string, list, bool, int, float, char.

:- func approxRoot(int, int, float) = float.
approxRoot(Num, Steps, Approx) =
(
  if
    Approx1 = (Approx + float(Num) / Approx) / 2.0,
    Steps \= 0 
  then approxRoot(Num, Steps - 1, Approx1)
  else Approx
    
).

:- pred findRoots(list(string), string, string).
:- mode findRoots(in, in, out) is det.
findRoots([], FinalStr, strip(FinalStr)).
findRoots([Line | Tail], PartialStr, FinalStr) :-
(
  words_separator(char.is_whitespace, Line) = InputList,
  map(det_to_int, InputList) = NumList,
  det_index0(NumList, 0, Num),
  det_index0(NumList, 1, Steps),
  approxRoot(Num, Steps, 1.0) = Root,
  PartialStr1 = PartialStr ++ " " ++ from_float(Root),
  findRoots(Tail, PartialStr1, FinalStr)
).

main(!IO) :-
  io.stdin_stream(Stdin, !IO),
  read_lines(Stdin, [], !IO).

:- pred read_lines(io.text_input_stream::in,
  list(string)::in, io::di, io::uo) is det.

read_lines(InFile, FileContents, !IO) :-
  io.read_line_as_string(InFile, Result, !IO),
  (
    Result = ok(Line),
    FileContents1 = FileContents ++ [Line],
    read_lines(InFile, FileContents1, !IO)
  ;
    Result = eof,
    det_drop(1, FileContents, InputList),
    findRoots(InputList, "", Roots),
    io.print_line(Roots, !IO)
  ;
    Result = error(IOError),
    Msg = io.error_message(IOError),
    io.stderr_stream(Stderr, !IO),
    io.write_string(Stderr, Msg, !IO),
    io.set_exit_status(1, !IO)
  ).
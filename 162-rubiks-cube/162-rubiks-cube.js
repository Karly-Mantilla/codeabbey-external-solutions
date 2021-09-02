with (CodeAbbey.solution) {

    parseInput = function(data) {
          var rows = data.split("\n");
          input = {
              n: parseInt(rows.shift(), 10),
              command: rows[0]
          };
    }
  
      /**
          Rubick's Cube
  
          Notation for algorithms is as follows. Each move is denoted by up to four
          parts, "[levels]face[direction][times]". 
          face:                 Determines the perspective. Imagine the cube lies on the table
                                   on one side "D", another side "F" facing you. The other sides
                                  are then denoted by: "F" front, "B" back, "U" up, "D" down,
                                  "L" left, "R" right. Just for making the current move, imagine
                                  to look at the denoted face rather than "F". This is the
                                  chosen perspective.
          levels:             From the chosen perspective choose the appropriate levels
                                  downwards, 1 to width. So "1U" is the uppermost level, "2U" is
                                  the uppermost and the level below that, "2L" are the first and
                                  the second level from the left parallel, and so on. If level
                                  is omitted then "1" is assumed.
          direction:     A "+" means to rotate the chosen levels clockwise by 90°, a
                                  "-" means to rotate them counterclockwise by 90°. If direction
                                  is omitted then "+" is assumed. To be in line with standard
                                  notation you may use "'" instead of "-" as well.
          times:            Repeat the chosen rotation as often as denoted. If omitted "1"
                                  is assumed.
          Moves are separated by a blank space. Note that "direction" and "times"
          are just for abbreviation, you could describe any algorithm without them:
          for example "L-" is the same as "L3+" or "L L L". For small cubes "level"
          is superfluous as well, but is needed for    widths greater than three. Just
          for convenience, you can also abbreviate the full cube rotations. If "w"
          is the width of the cube then full rotations are "wR" = "wL-" = "X",
          "wU" = "wD-" = "Y", "wF" = "wB-" = "Z".
  
          Finally you can apply to additional commands "reset" and "shuffle" to 
          do exactly that...
  
          Regarding the output, for the initial cube the fields on each face are
          labeled as follows, "face[field][orientation]". For the front face fields
          are numbered 1 to width*width, starting with the field on the bottom left
          going right in the bottom row, then going one row up again starting at the
          left and so on. The other sides will have a similar numbering, but we have
          to orient them somewhow. So we cut the cube into a cross
           U
          LFRB
           D
          and do the numbering on each face in the same way as for the front face.
          For example, the classical cube would look like:
                   U7 U8 U9
                 U4 U5 U6
                           U1 U2 U3
      L7 L8 L9 F7 F8 F9 R7 R8 R9 B7 B8 B9
          L4 L5 L6 F4 F5 F6 R4 R5 R6 B4 B5 B6
          L1 L2 L3 F1 F2 F3 R1 R2 R3 B1 B2 B3
                           D7 D8 D9
                           D4 D5 D6
                           D1 D2 D3
          During the game the orientation of these labels can change: they can be
          rotated clockwise by 0, 90, 180 or 270 degree. This is denoted by an
          orientation digit 0, 1, 2, 3.
      **/
      var Cube = function(width) {
          var thisCube = this;
          this.width = width;
          var Sticker = function(face, row, col, orientation) {
              var thisSticker = this;
              this.face = (face == undefined) ? "" : face;
              this.row = (row == undefined) ? 0 : row;
              this.col = (col == undefined) ? 0 : col;
              this.orientation = (orientation == undefined) ? 0 : orientation;
              this.toString = function(level) {
                  if (level == undefined) level = 2;
                  var width = thisCube.width;
                  var s = thisSticker.face;
                  if (s.length > 0) {
                      if (level > 0) {
                          var n = ("" + width * width).length;
                          var serial = "" + (thisSticker.row * thisCube.width + thisSticker.col + 1);
                          while (serial.length < n) serial = "0" + serial;
                          s += serial;
                      }
                      if (level > 1) s += thisSticker.orientation;
                  }
                  return s;
              }
          }
          var Cubelet = function(x, y, z) {
              var thisCubelet = this;
              this.x = x;
              this.y = y;
              this.z = z;
              var initialize = function() {
                  var width = thisCube.width;
                  var faces = [];
                  faces["U"] = (y < width - 1) ? new Sticker() : new Sticker("U", z, x);
                  faces["L"] = (x > 0) ? new Sticker() : new Sticker("L", y, width - z - 1);
                  faces["F"] = (z > 0) ? new Sticker() : new Sticker("F", y, x);
                  faces["R"] = (x < width - 1) ? new Sticker() : new Sticker("R", y, z);
                  faces["B"] = (z < width - 1) ? new Sticker() : new Sticker("B", y, width - x - 1);
                  faces["D"] = (y > 0) ? new Sticker() : new Sticker("D", width - z - 1, x);
                  return faces;
              }
              this.faces = initialize();
              this.solved = function() {
                  var faces = initialize();
                  for (face in faces)
                      if (faces[face].toString() != thisCubelet.faces[face].toString()) return false;
                  return true;
              }
              var permute = function(permutation) {
                  var faces = permutation.split("");
                  thisCubelet.faces[faces[0]].orientation = (thisCubelet.faces[faces[0]].orientation + 1) % 4;
                  var tmp = thisCubelet.faces[faces[1]];
                  thisCubelet.faces[faces[1]] = thisCubelet.faces[faces[2]];
                  thisCubelet.faces[faces[2]] = thisCubelet.faces[faces[3]];
                  thisCubelet.faces[faces[3]] = thisCubelet.faces[faces[4]];
                  thisCubelet.faces[faces[4]] = tmp;
                   thisCubelet.faces[faces[5]].orientation = (thisCubelet.faces[faces[5]].orientation + 3) % 4;
              }
              this.clockwise = function(face) {
                  var tmp = null;
                  switch (face) {
                      case "U":    permute("UFRBLD"); break;
                      case "L":    permute("LFUBDR"); break;
                      case "F":    permute("FULDRB"); break;
                      case "R":    permute("RFDBUL"); break;
                      case "B":    permute("BURDLF"); break;
                      case "D":    permute("DFLBRU"); break;
                  }
              }
              this.counterclockwise = function(face) {
                  thisCubelet.clockwise(face);
                  thisCubelet.clockwise(face);
                  thisCubelet.clockwise(face);
              }
          }
          var cubelets = [];
          this.reset = function() {
              for (var x = 0; x < thisCube.width; x++) {
                  cubelets[x] = [];
                  for (var y = 0; y < thisCube.width; y++) {
                      cubelets[x][y] = [];
                      for (var z = 0; z < thisCube.width; z++)
                          cubelets[x][y][z] = new Cubelet(x, y, z);
                  }
              }
          }
          this.solved = function() {
              for (var x = 0; x < thisCube.width; x++) 
                  for (var y = 0; y < thisCube.width; y++) 
                      for (var z = 0; z < thisCube.width; z++)
                          if (!cubelets[x][y][z].solved()) return false;
              return true;
          }
          this.get = function(field, level) {
              var width = thisCube.width;
              var face = field.substr(0, 1);
              var i = parseInt(field.substr(1), 10) - 1;
              var row = Math.floor(i / width);
              var col = i % width;
              switch (face) {
                  case "U": return cubelets[col][width - 1][row].faces["U"].toString(level);
                  case "L": return cubelets[0][row][width - col - 1].faces["L"].toString(level);
                  case "F": return cubelets[col][row][0].faces["F"].toString(level);
                  case "R": return cubelets[width - 1][row][col].faces["R"].toString(level);
                  case "B": return cubelets[width - col - 1][row][width - 1].faces["B"].toString(level);
                  case "D": return cubelets[col][0][width - row - 1].faces["D"].toString(level);
              }
              return "";
          }
          this.find = function(field) {
              var face = field.substr(0, 1);
              var i = parseInt(field.substr(1), 10) - 1;
              var row = Math.floor(i / thisCube.width);
              var col = i % thisCube.width;
              var sticker = new Sticker(face, row, col).toString(1);
              for (var x = 0; x < thisCube.width; x++) 
                  for (var y = 0; y < thisCube.width; y++) 
                      for (var z = 0; z < thisCube.width; z++)
                          for (i = 0; i < 6; i++) {
                              face = "ULFRBD".charAt(i);
                              if (cubelets[x][y][z].faces[face].toString(1) == sticker)
                                  return new Cubelet(x, y, z).faces[face].toString(1);
                          }
              return false;
          }
          this.toString = function(level) {
              if (level == undefined) level = 2;
              var width = thisCube.width;
              var blank = " ";
              if (level > 0) blank += ("" + width * width).split().map(function(c){return " "}).join("");
              if (level > 1) blank += " ";
              var cross = [" U  ".split(""), "LFRB".split(""), " D  ".split("")];
              var s = "";
              for (var row = 0; row < 3 * width; row++) {
                  for (var col = 0; col < 4 * width; col++) {
                      var face = cross[Math.floor(row / width)][Math.floor(col / width)];
                      if (face == " ")
                          s += blank;
                      else {
                          var field = face + ((width - (row % width) - 1) * width + (col % width) + 1);
                          s += thisCube.get(field, level);
                      }
                      s += " ";
                  }
                  s += "\n";
              }
              return s;
          }
          this.clockwise = function(face, level) {
              var width = thisCube.width;
              var moves = [];
              for (var row = 0; row < width; row++)
                  for (var col = 0; col < width; col++) {
                      switch (face) {
                          case "U": moves.push({
                              cubelet: cubelets[col][width - level - 1][row],
                              to: [row, width - level - 1, width - col - 1]
                          }); break;
                          case "L": moves.push({
                              cubelet: cubelets[level][row][width - col - 1],
                              to: [level, width - col - 1, width - row - 1]
                          }); break;
                          case "F": moves.push({
                              cubelet: cubelets[col][row][level],
                              to: [row, width - col - 1, level]
                          }); break;
                          case "R": moves.push({
                              cubelet: cubelets[width - level - 1][row][col],
                              to: [width - level - 1, width - col - 1, row]
                          }); break;
                          case "B": moves.push({
                              cubelet: cubelets[width - col - 1][row][width - level - 1],
                              to: [width - row - 1, width - col - 1, width - level - 1]
                          }); break;
                          case "D": moves.push({
                              cubelet: cubelets[col][level][width - row - 1],
                              to: [row, level, col]
                          }); break;
                      }
                  }
              moves.forEach(function(move){
                  move.cubelet.clockwise(face);
                  cubelets[move.to[0]][move.to[1]][move.to[2]] = move.cubelet;
              });
          }
          this.counterclockwise = function(face, level) {
              thisCube.clockwise(face, level);
              thisCube.clockwise(face, level);
              thisCube.clockwise(face, level);
          }
          var parse = function(token) {
              var faces = "ULFRBDXYZ".split("");
              var i = -1;
              faces.forEach(function(c) { var j = token.indexOf(c); if (j > -1) i = j; });
              if (i < 0) return null;
              try {
                  var move = { levels: 1, face: token.charAt(i), direction: "+", times: 1 };
                  if (i > 0)
                      move.levels = parseInt(token.substr(0, i), 10);
                  i++;
                  if (i < token.length)
                      if (token.charAt(i) == '+' || token.charAt(i) == '-' | token.charAt(i) == '\'') {
                          move.direction = token.charAt(i);
                          i++;
                      }
                  if (i < token.length)
                      move.times = parseInt(token.substr(i), 10);
                  if (move.direction == "\'")
                      move.direction = "-";
                  if (move.times < 1 || move.levels < 1 || move.levels > thisCube.width)
                      return null;
                  return move;
              }
              catch(e) {}
              return null;
          }
          this.apply = function(command) {
              if (command == "reset") {
                  thisCube.reset();
                  return;
              }
              if (command == "shuffle") {
                  thisCube.shuffle();
                  return;
              }
              var tokens = command.split(" ");
              while (tokens.length > 0) {
                  var token = tokens.shift();
                  var move = parse(token);
                  if (move != null) {
                      if (move.face == "X") {
                          tokens.unshift(thisCube.width + "R" + move.direction + move.times);
                          continue;
                      }
                      if (move.face == "Y") {
                          tokens.unshift(thisCube.width + "U" + move.direction + move.times);
                          continue;
                      }
                      if (move.face == "Z") {
                          tokens.unshift(thisCube.width + "F" + move.direction + move.times);
                          continue;
                      }
                      if (move.direction == "-") {
                          tokens.unshift(move.levels + move.face + "+" + (3 * move.times));
                          continue;
                      }
                      while (move.times > 1) {
                          tokens.unshift(move.levels + move.face + move.direction + "1");
                          move.times--;
                      }
                      for (var level = 0; level < move.levels; level++)
                          thisCube.clockwise(move.face, level);
                  }
                  else
                      console.log("Cube: ignoring illegal command \"" + token + "\"!");
              }
          }
          this.shuffle = function() {
              var cmd = "";
              for (var i = 0; i < thisCube.width * thisCube.width * 10; i++) {
                  var blank = cmd.length == 0 ? "" : " ";
                  var face = "ULFRBD".charAt(Math.floor(Math.random() * 6));
                  var levels = Math.floor(Math.random() * thisCube.width);
                  cmd += blank + levels + face;
              }
              thisCube.apply(cmd);
          }
          this.reset();
      }
  
      solve = function() {
          var cube = new Cube(3);
          console.log(cube.toString(1));
          console.log(cube.solved());
          cube.apply(input.command);
          console.log(cube.toString(1));
          console.log(cube.solved());
          result = [];
          for (var i = 1; i <= 9; i++)
              result.push(cube.find("F" + i));
    }
  
    writeResult = function() {
      return result.map(function(field){ return field.substr(0, 1); }).join(" ");
    }
  
  }
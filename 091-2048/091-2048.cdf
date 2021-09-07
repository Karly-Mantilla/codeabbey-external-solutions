(*Mathematica v11 on RPi3*)

In[1]:= "2 2 4 2
4 2 2 4
2 2 2 2
2 4 2 2"//StringCases[#,NumberString]&//ToExpression//Partition[#,4]&
Out[1]= {{2,2,4,2},{4,2,2,4},{2,2,2,2},{2,4,2,2}}
In[2]:= board=%
Out[2]= {{2,2,4,2},{4,2,2,4},{2,2,2,2},{2,4,2,2}}
In[3]:= board//Grid
Out[3]= 2    2    4    2
4    2    2    4
2    2    2    2
2    4    2    2


(*First I check for any hyphens in the rows or columns. If they exist I move them to the far end of the direction in question. Then I examine matching senarios and act accordingly to produce the next step*)
Clear[columnDown]
columnDown[grid_List,column_Integer]:=Module[{hyphensOnTop,tempGrid1=grid,tempGrid2},
hyphensOnTop=Select[grid[[All,column]],IntegerQ]//ArrayPad[#,{4-Length[#],0}]&//#/. 0->"-"&;tempGrid1[[All,column]]=hyphensOnTop;tempGrid2=tempGrid1;
Which[Head[tempGrid1[[4,column]]]===Integer&&tempGrid1[[4,column]]==tempGrid1[[3,column]],tempGrid2[[4,column]]=tempGrid1[[4,column]]*2;If[tempGrid1[[2,column]]==tempGrid1[[1,column]],tempGrid2[[3,column]]=tempGrid1[[2,column]]*2;tempGrid2[[2,column]]="-";tempGrid2[[1,column]]="-",tempGrid2[[3,column]]=tempGrid1[[2,column]];tempGrid2[[2,column]]=tempGrid1[[1,column]];tempGrid2[[1,column]]="-"];tempGrid2,
Head[tempGrid1[[3,column]]]===Integer&&tempGrid1[[3,column]]==tempGrid1[[2,column]],tempGrid2[[3,column]]=tempGrid1[[2,column]]*2;tempGrid2[[2,column]]=tempGrid1[[1,column]];tempGrid2[[1,column]]="-";tempGrid2,
Head[tempGrid1[[2,column]]]===Integer&&tempGrid1[[2,column]]==tempGrid1[[1,column]],tempGrid2[[2,column]]=tempGrid1[[1,column]]*2;tempGrid2[[1,column]]="-";tempGrid2,1==1,tempGrid2]]

Clear[moveDown]
moveDown[grid_List]:=Fold[columnDown[#1,#2]&,grid,Range[4]]

moveDown[board]
Out[8]= {{-,-,-,-},{2,2,4,2},{4,4,2,4},{4,4,4,4}}
In[44]:= (*Clear[columnRight]
columnRight[grid_List,row_Integer]:=Module[{tempGrid=grid},Which[Head[grid[[row,4]]]===Integer&&grid[[row,4]]===grid[[row,3]],tempGrid[[row,4]]=grid[[row,4]]*2;If[grid[[row,2]]===grid[[row,1]],tempGrid[[row,3]]=grid[[row,2]]*2;tempGrid[[row,2]]="-";tempGrid[[row,1]]="-",tempGrid[[row,3]]=grid[[row,2]];tempGrid[[row,2]]=grid[[row,1]];tempGrid[[row,1]]="-"];tempGrid,
Head[grid[[row,3]]]===Integer&&grid[[row,3]]===grid[[row,2]],tempGrid[[row,3]]=grid[[row,2]]*2;tempGrid[[row,2]]=grid[[row,1]];tempGrid[[row,1]]="-";tempGrid,
Head[grid[[row,2]]]===Integer&&grid[[row,2]]===grid[[row,1]],tempGrid[[row,2]]=grid[[row,1]]*2;tempGrid[[row,1]]="-";tempGrid,1===1,tempGrid]]*)

Clear[columnRight]
columnRight[grid_List,row_Integer]:=Module[{hyphensOnTop,tempGrid1=grid,tempGrid2},
hyphensOnTop=Select[grid[[row,All]],IntegerQ]//ArrayPad[#,{4-Length[#],0}]&//#/. 0->"-"&;tempGrid1[[row,All]]=hyphensOnTop;tempGrid2=tempGrid1;
Which[Head[tempGrid1[[row,4]]]===Integer&&tempGrid1[[row,4]]==tempGrid1[[row,3]],tempGrid2[[row,4]]=tempGrid1[[row,4]]*2;If[tempGrid1[[row,2]]==tempGrid1[[row,1]],tempGrid2[[row,3]]=tempGrid1[[row,2]]*2;tempGrid2[[row,2]]="-";tempGrid2[[row,1]]="-",tempGrid2[[row,3]]=tempGrid1[[row,2]];tempGrid2[[row,2]]=tempGrid1[[row,1]];tempGrid2[[row,1]]="-"];tempGrid2,
Head[tempGrid1[[row,3]]]===Integer&&tempGrid1[[row,3]]==tempGrid1[[row,2]],tempGrid2[[row,3]]=tempGrid1[[row,2]]*2;tempGrid2[[row,2]]=tempGrid1[[row,1]];tempGrid2[[row,1]]="-";tempGrid2,
Head[tempGrid1[[row,2]]]===Integer&&tempGrid1[[row,2]]==tempGrid1[[row,1]],tempGrid2[[row,2]]=tempGrid1[[row,1]]*2;tempGrid2[[row,1]]="-";tempGrid2,1==1,tempGrid2]]

Clear[moveRight]
moveRight[grid_List]:=Fold[columnRight[#1,#2]&,grid,Range[4]]

moveRight[{{"-","-","-","-"},{2,2,4,2},{4,4,2,4},{4,4,4,4}}]
Out[48]= {{-,-,-,-},{-,4,4,2},{-,8,2,4},{-,-,8,8}}
In[50]:= {{"-","-","-","-"},{"-",4,4,2},{"-",8,2,4},{"-","-",8,8}}//moveDown
Out[50]= {{-,-,-,-},{-,-,4,2},{-,4,2,4},{-,8,8,8}}
In[66]:= Clear[columnUp]
columnUp[grid_List,column_Integer]:=Module[{hyphensOnTop,tempGrid1=grid,tempGrid2},
hyphensOnTop=Select[grid[[All,column]],IntegerQ]//ArrayPad[#,{0,4-Length[#]}]&//#/. 0->"-"&;tempGrid1[[All,column]]=hyphensOnTop;tempGrid2=tempGrid1;
Which[Head[tempGrid1[[1,column]]]===Integer&&tempGrid1[[1,column]]==tempGrid1[[2,column]],tempGrid2[[1,column]]=tempGrid1[[2,column]]*2;If[tempGrid1[[3,column]]==tempGrid1[[4,column]],tempGrid2[[2,column]]=tempGrid1[[3,column]]*2;tempGrid2[[3,column]]="-";tempGrid2[[4,column]]="-",tempGrid2[[2,column]]=tempGrid1[[3,column]];tempGrid2[[3,column]]=tempGrid1[[4,column]];tempGrid2[[4,column]]="-"];tempGrid2,
Head[tempGrid1[[2,column]]]===Integer&&tempGrid1[[2,column]]==tempGrid1[[3,column]],tempGrid2[[2,column]]=tempGrid1[[3,column]]*2;tempGrid2[[3,column]]=tempGrid1[[4,column]];tempGrid2[[4,column]]="-";tempGrid2,
Head[tempGrid1[[3,column]]]===Integer&&tempGrid1[[3,column]]==tempGrid1[[4,column]],tempGrid2[[3,column]]=tempGrid1[[4,column]]*2;tempGrid2[[4,column]]="-";tempGrid2,1==1,tempGrid2]]

Clear[moveUp]
moveUp[grid_List]:=Fold[columnUp[#1,#2]&,grid,Range[4]]

moveUp[{{"-","-","-","-"},{"-","-",4,2},{"-",4,2,4},{"-",8,8,8}}]//Grid
Out[70]= -    4    4    2
-    8    2    4
-    -    8    8
-    -    -    -


In[71]:= Clear[columnLeft]
columnLeft[grid_List,row_Integer]:=Module[{hyphensOnTop,tempGrid1=grid,tempGrid2},
hyphensOnTop=Select[grid[[row,All]],IntegerQ]//ArrayPad[#,{0,4-Length[#]}]&//#/. 0->"-"&;tempGrid1[[row,All]]=hyphensOnTop;tempGrid2=tempGrid1;
Which[Head[tempGrid1[[row,1]]]===Integer&&tempGrid1[[row,1]]==tempGrid1[[row,2]],tempGrid2[[row,1]]=tempGrid1[[row,2]]*2;If[tempGrid1[[row,3]]==tempGrid1[[row,4]],tempGrid2[[row,2]]=tempGrid1[[row,3]]*2;tempGrid2[[row,3]]="-";tempGrid2[[row,4]]="-",tempGrid2[[row,2]]=tempGrid1[[row,3]];tempGrid2[[row,3]]=tempGrid1[[row,4]];tempGrid2[[row,4]]="-"];tempGrid2,
Head[tempGrid1[[row,2]]]===Integer&&tempGrid1[[row,2]]==tempGrid1[[row,3]],tempGrid2[[row,2]]=tempGrid1[[row,3]]*2;tempGrid2[[row,3]]=tempGrid1[[row,4]];tempGrid2[[row,4]]="-";tempGrid2,
Head[tempGrid1[[row,3]]]===Integer&&tempGrid1[[row,3]]==tempGrid1[[row,4]],tempGrid2[[row,3]]=tempGrid1[[row,4]]*2;tempGrid2[[row,4]]="-";tempGrid2,1==1,tempGrid2]]

Clear[moveLeft]
moveLeft[grid_List]:=Fold[columnLeft[#1,#2]&,grid,Range[4]]

moveLeft[{{"-","-","-","-"},{"-","-",4,2},{"-",4,2,4},{"-",8,8,8}}]//Grid
Out[75]= -    -    -    -
4    2    -    -
4    2    4    -
16    8    -    -


In[79]:= (*Trying the functions on the example input*)
"2 2 4 2
4 2 2 4
2 2 2 2
2 4 2 2"//StringCases[#,NumberString]&//ToExpression//Partition[#,4]&
Out[79]= {{2,2,4,2},{4,2,2,4},{2,2,2,2},{2,4,2,2}}
In[80]:= exampleBoard=%
Out[80]= {{2,2,4,2},{4,2,2,4},{2,2,2,2},{2,4,2,2}}
In[93]:= "D R D L U"//StringCases[#,WordCharacter]&//#/.{"U"->moveUp,"D"->moveDown,"L"->moveLeft,"R"->moveRight}&//Fold[#2[#1]&,exampleBoard,#]&//Flatten//Select[#,IntegerQ]&//Sort//Counts
Out[93]= <|4->2,8->2,16->1|>

In[94]:= (*And now for the grand finale*)
"2 2 2 2
4 2 2 2
4 4 2 2
2 2 2 4"//StringCases[#,NumberString]&//ToExpression//Partition[#,4]&
Out[94]= {{2,2,2,2},{4,2,2,2},{4,4,2,2},{2,2,2,4}}
In[95]:= testBoard=%
Out[95]= {{2,2,2,2},{4,2,2,2},{4,4,2,2},{2,2,2,4}}
In[98]:= "R D U L R R D D R"//StringCases[#,WordCharacter]&//#/.{"U"->moveUp,"D"->moveDown,"L"->moveLeft,"R"->moveRight}&//Fold[#2[#1]&,testBoard,#]&//Flatten//Select[#,IntegerQ]&//Sort//Counts
Out[98]= <|4->2,8->2,16->1|>
Length: 7595

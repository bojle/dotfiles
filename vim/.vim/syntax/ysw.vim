" syntax file for ysw lang
"

syn keyword ysw_LHS X
syn keyword ysw_LHS Y
syn keyword ysw_LHS NPB
syn keyword ysw_LHS OP
syn keyword ysw_LHS CONSTVALID
syn keyword ysw_LHS CONST 
syn keyword ysw_LHS BYP_R0
syn keyword ysw_LHS BYP_R1
syn keyword ysw_LHS BYP_R2
syn keyword ysw_LHS BYP_R3
syn keyword ysw_LHS REN_R0
syn keyword ysw_LHS REN_R1
syn keyword ysw_LHS REN_R2
syn keyword ysw_LHS REN_R3
syn keyword ysw_LHS tregwen
syn keyword ysw_LHS XB_P
syn keyword ysw_LHS XB_I1
syn keyword ysw_LHS XB_I2
syn keyword ysw_LHS XB_NORTH
syn keyword ysw_LHS XB_EAST
syn keyword ysw_LHS XB_EAST
syn keyword ysw_LHS XB_WEST
syn keyword ysw_LHS XB_SOUTH

syn keyword ysw_RHS LOAD
syn keyword ysw_RHS INV
syn keyword ysw_RHS ALU_I
syn keyword ysw_RHS NOP
syn keyword ysw_RHS ADD
syn keyword ysw_RHS NORTH_I
syn keyword ysw_RHS SOUTH_I

syn match ysw_INSTNO /^\d$/

syn region ysw_BITSTRING start=/\VY\=\d,/ms=e+1 end=/\v(0|1)+/me=e oneline

" TODO: ysw_LHS part
"syn region ysw_EQV start=/Y=/ms=e+1 end=/\v(\s|,)/me=e 
"syn region ysw_EQV start=/\VCONST=/ms=e+1 end=/,/me=s-1 contains=ysw_LHS
"1
"Y=0 X=0,NPB=0,OP=LOAD,CONSTVALID=1,CONST=56,BYP_R0=1,BYP_R1=1,BYP_R2=1,BYP_R3=1,REN_R0=0,REN_R1=0,REN_R2=0,REN_R3=0,tregwen=0,XB_P=INV,XB_I1=INV,XB_I2=INV,XB_NORTH=INV,XB_EAST=INV,XB_WEST=INV,XB_SOUTH=ALU_I
"Y=0 X=1,0000000000000000000000000000000000000001111111111111111111111111
"Y=0 X=2,0000000000000000000000000000000000000001111111111111111111111111

highlight link ysw_LHS Type
highlight link ysw_RHS Constant
highlight link ysw_INSTNO Identifier
highlight link ysw_BITSTRING String
highlight link ysw_EQV Constant

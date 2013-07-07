 global partslists=#()
 global bits=#()
 global body=#()
 global prepartslists=#("SKY_BODY #{1..230, 235..250, 287..310, 312, 315, 321..336, 625..626, 629..630, 729..776, 961..968, 977..992, 1017..1024, 1057, 1059..1064, 1121..1144, 1162, 1169..1208, 1233..1288, 1361..1368, 1513..1520, 1689..1720, 1737..1744, 1809..1816, 1857..2034, 2061, 2063, 2065..2292, 2294..2296, 2299..2342, 2357, 2383..2390, 2447..2464, 2467..2550, 2559..2669, 2671..2694, 2697..2698, 2821..2822, 2825..2826, 2829..2874, 3491..3498, 3627..3646, 3667..3682, 3691..3694, 3699..3702, 3707..3710, 3807..3808, 3811..3858, 3891..3906, 3921..3936, 3945..3946, 3949..3954, 3957..3962, 3964..4292, 4294, 4297..4424, 4429..4430, 4433..4456, 4465..4566, 4569, 4571, 4573..4574, 4599..4602, 4607..4646, 4649..4650, 4653..4662, 4671..4922, 4955..6102, 6104, 6107..6108, 6117..6144, 6149..6156, 6209..6210, 6215..6218, 6235..6250, 6643..6690, 6875..6882, 6891..6900, 6903..6906, 6931..6938, 7035..7058, 7083..7122, 7147..7202, 7275..7282, 7427..7434, 7606..7634, 7651..7658, 7723..7730, 7771..7948, 7981..7995, 7997..8181, 8213..8232, 8245..8246, 8251..8252, 8361..8376, 8385..8464, 8473..8476, 8479..8567, 8598, 8601..8602, 8604..8606, 8743..8788, 9405..9412, 9541..9556, 9581..9596, 9605..9607, 9613..9616, 9621..9624, 9725..9772, 9805..9820, 9835..9850, 9863..9864, 9871..9872, 9875..9876, 9879..9880, 9883..10154, 10159..10164, 10167..10170, 10179..10188, 10191..10192, 10195..10202, 10243..10306, 10355..10370, 10379..10480, 10484, 10486..10488, 10513..10516, 10521..10560, 10563..10564, 10567..10576, 10585..10586, 10589..10836, 10869..12017, 12021..12022, 12031..12396, 12461..12468, 12485..12544}",
"SKY_BODY #{231..234, 251..286, 311, 313, 317..320, 337..624, 633..728, 777..960, 969..976, 993..1016, 1025..1056, 1065..1120, 1147..1149, 1151..1161, 1163..1168, 1209..1232, 1289..1360, 1369..1512, 1521..1688, 1721..1736, 1745..1808, 1817..1856, 2035..2042, 2045, 2049..2052, 2055..2058, 2060, 2343..2346, 2359..2382, 2391..2442, 2445..2446, 2551..2558, 2699, 2701..2756, 2759..2760, 2763..2798, 2801..2805, 2807..2820, 2827, 2875..3490, 3499..3626, 3643, 3645..3666, 3683..3690, 3695..3698, 3703..3706, 3711..3810, 3859..3890, 3901..3902, 3907..3920, 3937..3948, 3955..3956, 3959..3960, 3963..3964, 3967..3968, 3971..3972, 4295, 4461..4464, 4567..4570, 4572, 4575..4600, 4603..4606, 4637, 4647..4648, 4651..4652, 4663..4670, 4673..4674, 4677..4678, 4923..4954, 6103..6116, 6145..6148, 6165..6200, 6219, 6223..6234, 6242, 6251..6642, 6691..6874, 6883..6890, 6907..6930, 6939..6977, 6979..7034, 7059..7082, 7123..7146, 7203..7274, 7283..7426, 7435..7602, 7635..7650, 7659..7722, 7731..7770, 7949..7980, 8192, 8195..8196, 8206..8212, 8257..8296, 8301..8360, 8379..8380, 8383..8384, 8465..8472, 8583..8585, 8587..8588, 8591..8592, 8595, 8609..8610, 8612..8742, 8789..9404, 9413..9540, 9557..9580, 9597..9724, 9729..9730, 9733..9736, 9741..9744, 9749..9752, 9773..9806, 9809..9810, 9813..9816, 9819..9836, 9839..9842, 9851..9882, 9885..9886, 9889..9890, 9943..9944, 10029..10030, 10171..10174, 10177..10178, 10189..10190, 10203..10210, 10212..10218, 10235..10237, 10239, 10323..10326, 10333..10334, 10339..10354, 10371..10378, 10481..10520, 10525..10526, 10545..10568, 10573..10592, 10595..10596, 10599..10600, 10837..10868, 12017..12030, 12397..12460, 12469..12484, 12545..12624}")
plugin Modifier BsDismemberSkyrim
name:"BsDismember Skyrim"
classID:#(0x4e74ab, 0x6c2542b9)
--extends:Edit_Poly replaceUI:false version:2
(
  
	parameters main rollout:params
    (
	lbxCtrlList type:#stringTab tabSize:0 tabSizeVariable:true 
		--on lbxCtrlList tabChanged change tabIndex tabCount do
			--this.params.updateCtrlList()
		
	lbxCtrlList1 type:#stringTab tabSizeVariable:true 
 
		--on lbxCtrlList1 tabChanged change tabIndex tabCount do
			--this.params.updateCtrlList()
  
    )--end Paramaters
	
    rollout params "BsDismember Tool"
   (
   listBox lbxCtrlList "BodyParts: " items:#("SKY_AMULET","SKY_ARM,SKY_ARM_1","SKY_BACK","SKY_BLOODIED_DRAGON_HEADS",
	"SKY_BLOODIED_DRAGON_HEADS_1",
   "SKY_BLOODIED_DRAGON_HEADS_2",
   "SKY_BODY",
   "SKY_CALVES",
   "SKY_CHEST",
   "SKY_CHEST_1",
   "SKY_CIRCLET",
   "SKY_CIRCLETS_ACCESOARIES",
   "SKY_DECAPITATE",
   "SKY_DECAPITATED_HEAD",
   "SKY_DISABLE_EAR_HEADPART",
   "SKY_DISABLE_HAIR_HEADPART",
   "SKY_EARS",
   "SKY_FACE",
   "SKY_FACE_MOUTH",
   "SKY_FEET",
   "SKY_FOREARMS",
   "SKY_FX01",
   "SKY_GORE_COVERS_HEAD_NECK",
   "SKY_HAIR",
   "SKY_HAND",
   "SKY_HEAD",
   "SKY_HELMET",
   "SKY_LEG",
   "SKY_LEG_1",
   "SKY_LONG_HAIR",
   "SKY_MISC_FX",
   "SKY_MISC_FX_1",
   "SKY_NECK",
   "SKY_NECK_DECAPITATION_POINT",
  " SKY_OPEN_FACE_HELMET",
   "SKY_PELVIS",
   "SKY_PELVIS_1",
   "SKY_RING",
   "SKY_SHIELD",
   "SKY_SHOULDER",
   "SKY_TAIL") selection:0
   
   button setpart "set face to bodypart"
   button undosetpart "undo face to bodypart"
   button upassign "check assigned bodyparts"
   listBox lbxCtrlList1 "assigned BodyParts: " items:#() selection:0 
   button autoassign "auto assign parts (human)"

	  on setpart pressed  do
      (
		  --max modify mode
		  local selh=#(lbxCtrlList.selected)
		  modPanel.setCurrentObject $.baseObject
		  subobjectlevel=4
          pbits=#()
		  pbits=$.GetSelection 4
		  modPanel.setCurrentObject $.modifiers[#BsDismember_Skyrim]
		  append body selh[1]
		  append bits pbits
		  append partslists selh[1]
		  for is = 1 to partslists.count do
          (
			   lbxCtrlList1.items=append lbxCtrlList1.items partslists[is]
		  )
      )
	  
	  on upassign pressed do
	  (
		  for is = 1 to partslists.count do
          (
			   lbxCtrlList1.items=append lbxCtrlList1.items partslists[is]
		  )
	  )
	  
	  on undosetpart pressed  do
      (
	   lbxCtrlList1.items = deleteItem lbxCtrlList1.items lbxCtrlList1.selection
	  )
	  
	  on autoassign pressed  do
      (
		lbxCtrlList1.items=append lbxCtrlList1.items lbxCtrlList.items[7]
		  modPanel.setCurrentObject $.baseObject
		  subobjectlevel=4
		  sel=#{1..230, 235..250, 287..310, 312, 315, 321..336, 626, 729..776, 961..968, 977..992, 1017..1024, 1059..1060, 1063..1064, 1121..1144, 1169..1208, 1233..1288, 1361..1368, 1513..1520, 1537, 1539..1540, 1689..1720, 1737..1744, 1809..1816, 1857..2034, 2037..2038, 2065, 2067..2280, 2282..2292, 2296, 2299..2342, 2383..2390, 2447..2464, 2467..2550, 2559..2668, 2671..2672, 2675..2677, 2679..2694, 2698, 2821..2822, 2825..2826, 2829..2874, 3491..3498, 3627..3642, 3667..3682, 3811..3858, 3891..3898, 3903..3904, 3923..3924, 3927..3936, 3949..3950, 3957..3958, 3965..3966, 3969..3970, 3973..4028, 4031..4258, 4261..4290, 4292, 4297..4321, 4323..4424, 4433..4434, 4437..4456, 4465..4566, 4571, 4573..4574, 4601..4602, 4607..4634, 4639..4646, 4649..4650, 4653..4662, 4675..4676, 4679..4922, 4955..6102, 6117..6144, 6149..6164, 6201..6210, 6212..6218, 6221, 6235..6238, 6243..6250, 6539, 6643..6690, 6875..6882, 6891..6906, 6931..6938, 6973..6974, 6977..6978, 7035..7058, 7083..7122, 7147..7202, 7275..7282, 7427..7434, 7603..7634, 7651..7658, 7723..7730, 7771..7948, 7980..8190, 8193..8194, 8197..8204, 8213..8236, 8239..8256, 8297..8300, 8361..8376, 8385..8464, 8473..8582, 8585..8586, 8589..8590, 8592..8607, 8735..8736, 8739..8740, 8743..8788, 9405..9412, 9541..9556, 9581..9596, 9725..9729, 9731..9742, 9745..9748, 9753..9772, 9807..9808, 9837..9838, 9843..9850, 9883..9884, 9887, 9891..9942, 9945..10172, 10175..10202, 10211, 10219..10225, 10227..10234, 10238, 10240..10322, 10335..10338, 10355..10370, 10379..10436, 10439..10480, 10523..10524, 10529..10531, 10533..10534, 10541..10544, 10593..10594, 10597, 10601..10836, 10869..12016, 12031..12396, 12461..12468, 12485..12544}
		  $.SetSelection 4 sel
		  max select invert
		  sel1=$.GetSelection 4
		  append bits sel
		  append bits sel1
		  append partslists lbxCtrlList.items[7]
		  for is = 1 to partslists.count do
          (
			   lbxCtrlList1.items=append lbxCtrlList1.items partslists[is]
		  )
      )
	  
	  fn replaceChar str oChar rChar = 
    (
        tStr = ""
        for i=1 to str.count do
        (
            if str[i] == oChar then tStr += rChar
            else tStr += str[i] 
        )
        tStr
    )
	  
	  
	  on lbxCtrlList1 DoubleClicked items do
	  (
		  modPanel.setCurrentObject $.baseObject
		  subobjectlevel=4
		  --$.SetSelection 4 
		  pos=lbxCtrlList1.selection
		  big=bits[pos] as bitarray
		  $.SetSelection 4 big 
	  )
   
  )
  
)
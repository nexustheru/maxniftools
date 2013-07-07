rollout helpers2bone "Bones from helpers" width:162 height:630
(
	button btn4 "get bonehelpers" pos:[13,337] width:136 height:30
	groupBox grp1 "Max nif tools" pos:[5,9] width:149 height:94
	button btn5 "select/duplicate spline" pos:[11,26] width:136 height:30
	button btn6 "build nurb" pos:[11,62] width:136 height:30
	listBox lbx2 "selected items" pos:[9,109] width:141 height:12
	progressBar pb1 "ProgressBar" pos:[8,293] width:143 height:28 color:(color 30 10 190)
	button btn1 "create maxbones" pos:[13,378] width:136 height:30
	button btn3 "link max bones" pos:[13,417] width:136 height:30
	button btn2 "add ik solver" pos:[14,457] width:136 height:30
	button btn7 "add bsdismember" pos:[14,496] width:136 height:30
	button btn8 "add havok" pos:[14,535] width:136 height:30
	button btn9"export" pos:[14,576] width:136 height:30
	
	---------------------------------------------------------------
	on btn4 pressed  do
    (

		Obj= getCurrentSelection()
			for i = 1 to Obj.count do
			(  
				global parentbone=Obj[i]
				pb1.value=i+1
				lbx2.items =append lbx2.items parentbone.name
				--b=BoneSys.createBone endPos startPos1 [0,0,1]
			)
		
	)
---------------------------------------------------------------
	on btn6 pressed  do
    (
		spli= getCurrentSelection()
		for i = 1 to spli.count do
		(
			--spli[i+1].pos =[spli[i].pos.x,spli[i].pos.y,spli[i].pos.z*2]
			a = convertToNurbsCurve spli[i]
			b = convertToNurbsCurve spli[i+1]
			curveA = ((getNurbsSet a)[1])
			curveB = ((getNurbsSet b)[1])
            nS = nurbsSet()
            appendObject nS curveA
            appendObject nS curveB
            nRS = nurbsRuledSurface parent1:1 parent2:2
            appendObject nS nRS
            nN = nurbsNode nS
            transform nN curveA.nurbsID a.transform
            transform nN curveB.nurbsID b.transform
			global int res=i+1
			pb1.value=res
			delete a
			delete b
		)
		
		allLine_Source=#()
for obj in $* do (if classOf obj == Line then append allLine_Source obj)
for f = 1 to allLine_Source.count do
(
	delete allLine_Source[f]
)
	)	
---------------------------------------------------------------	
	on btn5 pressed  do
    (
	spli= getCurrentSelection()
		for i = 1 to spli.count do
		(
			maxOps.cloneNodes spli[i] cloneType:#copy newNodes:nnl

		)
	)
---------------------------------------------------------------
	on btn1 pressed do
	(
		Obj= getCurrentSelection()
			for i = 1 to Obj.count do
			( 
				local CurObj = Obj[i]
				child=CurObj.children;
				startPos=CurObj.pos
				for is=1 to child.count do
				(
				local CurObj2 = child[is]
				endPos=CurObj2.pos
				--endPos1=CurObj3.pos
				b=BoneSys.createBone startPos endPos [0,0,1]
				b.name=CurObj.name
				)
			)
	)
	
	

	
)createDialog helpers2bone
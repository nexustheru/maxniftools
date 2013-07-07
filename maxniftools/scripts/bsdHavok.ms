plugin Modifier HavokSkyrim
name:"Havok Skyrim"
classID:#(0x592c3b2f, 0x56bd3404)
--extends:Edit_Poly replaceUI:false version:2
(
  
	parameters main rollout:params
    (
	--lbxCtrlList type:#stringTab tabSize:0 tabSizeVariable:true 
		--on lbxCtrlList tabChanged change tabIndex tabCount do
			--this.params.updateCtrlList()
		
	--lbxCtrlList1 type:#stringTab tabSizeVariable:true 
 
		--on lbxCtrlList1 tabChanged change tabIndex tabCount do
			--this.params.updateCtrlList()
  
    )--end Paramaters
	
   rollout params "NiftoolsInfo"
   (
		
		button forum "Forum" width:130
		button Github "Github" width:130
		button Wiki "Wiki" width:130
		button Irc "Irc" width:130
		
		on forum pressed do
		(
			shellLaunch "http://niftools.sourceforge.net/forum/" "Niftools Forum"
		)
		on Github pressed do
		(
			shellLaunch "https://github.com/niftools" "Niftools Github"
		)
		on Wiki pressed do
		(
			shellLaunch "http://niftools.sourceforge.net/wiki/NifTools" "Niftools Wiki"
		)
		on Irc pressed do
		(
			shellLaunch "http://webchat.freenode.net/?channels=#niftools" "Niftools Irc"
		)
   )
	
   rollout param1 "Skyrim Havok Rigids"
   (
	   
	  button Rigid "Add Rigid/shape skeleton" width:130
       
	   on Rigid pressed do
	   (
		   local Obj= getCurrentSelection()
	       for i=1 to Obj.count do
	        (
			 select Obj[i]
			b=capsule()
			addmodifier b (Havok_Shape ()) ui:on
            b.modifiers[#Shape].shapeType = 2
			addmodifier b (Havok_Rigid_Body ()) ui:on
			modpanel.setcurrentobject b.modifiers[#Rigid_Body]
            b.modifiers[#Rigid_Body].Mass=0.05
			addmodifier b (Havok_Rag_Doll_Constraint ()) ui:on
			b.modifiers[#Rag_Doll].parentSpaceRotationLocked = off
			--b.modifiers[#Hinge].parent = $Box001
			--b.modifiers[#Hinge].parentSpaceRotation =Obj[i].translation
			--b.modifiers[#Hinge].parentSpaceTranslation = Obj[i].pos
			b.radius=4.044
            b.smooth=on
            b.sides=8	
            b.heighttype=0			
			b.transform=Obj[i].transform	 
            b.name="Ragdoll_" + Obj[i].name
			b.material = shell_material originalmaterial:$.material bakedMaterial:(standard wire:true) viewportMtlIndex:1
			b.wirecolor=red
			if Obj[i].children.count >0 then
			   (
               b.height=distance Obj[i] Obj[i].children[1]
			   )
               else
               (
               b.height=6.486
		       )	
	        )
		
	   )
	   
   )
   
   rollout param2 "Skyrim Havok collision"
   (
	   
	   fn getchildren p=
	   (
			   if (p.children != undefined) do 
			   (
				   spos=p.pos
				   for item in p.children do
				   (
					  cpos=item.pos
					  c=bonesys.createbone spos item.pos [0,0,1]
					  c.name=item.name
					   c.parent=item
					  getchildren item
				   )
			   )
		  
	   )
	   
	   button Maxskeleton "build max skeleton" width:130
	   
	    on Maxskeleton pressed do
	   (
		 Obj=getcurrentselection()
		 for i=1 to Obj.count do
		   (
		    getchildren Obj[i]  
		   )
	   )
	   
   )
   
   rollout param3 "Skyrim Havok shapes"
   (
	   
   )

)
#pragma once

//**************************************************************************/
// Copyright (c) 1998-2007 Autodesk, Inc.
// All rights reserved.
// 
// These coded instructions, statements, and computer programs contain
// unpublished proprietary information written by Autodesk, Inc., and are
// protected by Federal copyright law. They may not be disclosed to third
// parties or copied or duplicated in any form, in whole or in part, without
// the prior written consent of Autodesk, Inc.
//**************************************************************************/
// DESCRIPTION: Includes for Plugins
// AUTHOR: 
//***************************************************************************/


#include "resource.h"

//SIMPLE TYPE
#pragma once


#include <niflib.h>
#include <MatTexCollection.h>
#include <NIF_IO.h>
#include <obj\NiObject.h>
#include <obj\NiNode.h>
#include <obj\BSFadeNode.h>
#include <Ref.h>
#include <obj\NiObject.h>
#include <gen\Header.h>
#include <obj\NiTriShape.h>
#include <obj\NiProperty.h>
#include <obj\NiTriShapeData.h>
#include <obj\BSLightingShaderProperty.h>
#include <obj\BSShaderTextureSet.h>
#include <obj\BSShaderProperty.h>
#include <obj\NiParticleBomb.h>
#include <obj\NiParticleColorModifier.h>
#include <obj\NiParticleGrowFade.h>
#include <obj\NiParticleMeshes.h>
#include <obj\NiParticleMeshesData.h>
#include <obj\NiParticleMeshModifier.h>
#include <obj\NiParticleModifier.h>
#include <obj\NiParticleRotation.h>
#include <obj\NiParticles.h>
#include <obj\NiParticlesData.h>
#include <obj\NiParticleSystem.h>
#include <obj\NiParticleSystemController.h>
#include <obj\NiMaterialProperty.h>
#include <obj\BSDismemberSkinInstance.h>
#include <obj\NiSkinData.h>
#include <obj\NiSkinInstance.h>
#include <gen\BodyPartList.h>
#include <obj\NiSkinningLODController.h>
#include <obj\NiSkinningMeshModifier.h>
#include <obj\NiSkinPartition.h>
#include <obj\NiTriStrips.h>
#include <obj\NiTriStripsData.h>
#include <obj\NiSkinInstance.h>
#include <obj\BSLightingShaderProperty.h>
#include <obj\BSShaderProperty.h>
#include <obj\BSShaderLightingProperty.h>
#include <obj\BSShaderTextureSet.h>
#include <obj\NiShadeProperty.h>
#include <gen\enums.h>
#include <obj\NiAlphaProperty.h>
#include <obj\NiStencilProperty.h>
#include <obj\NiShadeProperty.h>
#include <obj\NiVertexColorProperty.h>
#include <obj\NiDitherProperty.h>
#include <obj\NiSpecularProperty.h>
#include <obj\NiTextureProperty.h>
#include <obj\Lighting30ShaderProperty.h>
#include <obj\BSShaderNoLightingProperty.h>
#include <obj\BSShaderPPLightingProperty.h>
#include <obj\BSShaderTextureSet.h>
#include <obj\BSLightingShaderProperty.h>
#include <obj\NIAVObject.h>
#include <obj\BSEffectShaderProperty.h>
#include <obj\BSEffectShaderPropertyColorController.h>
#include <obj\BSEffectShaderPropertyFloatController.h>
#include <obj/NiTimeController.h>
#include <obj/NiMultiTargetTransformController.h>
#include <obj/NiStringExtraData.h>
#include <obj/NiBillboardNode.h>
#include <float.h>
#include <dummy.h>
//#include <obj\NiObjectNET.h>
#include <obj\BSFadeNode.h>



#include "Max.h"
#include "istdplug.h"
#include "iparamb2.h"
#include "iparamm2.h"
#include "iparamm.h"

#include <assert.h>
#include "math.h"

#include "CS\BipedApi.h"

#include "simpobj.h"
#include "simpshp.h"
#include "simpspl.h"

//SIMPLE TYPE
#include "utilapi.h"
#include <impapi.h>
#include <resource.h>
#include <modstack.h>
#include <iskin.h>

#include <meshdelta.h>
#include "istdplug.h"
#include "MeshNormalSpec.h"

#include <stdio.h>
#include <direct.h>
#include <commdlg.h>
#include "splshape.h"
#include "imtl.h"
#include "dummy.h"
#include "istdplug.h"
#include "stdmat.h"
#include "gamma.h"
#include "helpsys.h"
#include "buildver.h"
#include "maxheap.h"
#include <maxheapdirect.h>
#include "meshadj.h"
#include "XTCObject.h"

#include <maxscript/maxscript.h>
#include <maxscript/compiler/parser.h>

#include <maxscrpt\maxscrpt.h>

using namespace Niflib;


extern TCHAR *GetString(int id);

extern HINSTANCE hInstance;

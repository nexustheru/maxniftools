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
// DESCRIPTION: Appwizard generated plugin
// AUTHOR: 
//***************************************************************************/

#include "maxniftools.h"

#define maxtoolsimporter_CLASS_ID	Class_ID(0xb66f21cc, 0xbe0a203b)


class maxtoolsimporter : public SceneImport {
	public:

		static HWND hParams;
		
		int				ExtCount();					// Number of extensions supported
		const TCHAR *	Ext(int n);					// Extension #n (i.e. "3DS")
		const TCHAR *	LongDesc();					// Long ASCII description (i.e. "Autodesk 3D Studio File")
		const TCHAR *	ShortDesc();				// Short ASCII description (i.e. "3D Studio")
		const TCHAR *	AuthorName();				// ASCII Author name
		const TCHAR *	CopyrightMessage();			// ASCII Copyright message
		const TCHAR *	OtherMessage1();			// Other message #1
		const TCHAR *	OtherMessage2();			// Other message #2
		unsigned int	Version();					// Version number * 100 (i.e. v3.01 = 301)
		void			ShowAbout(HWND hWnd);		// Show DLL's "About..." box
		int				DoImport(const TCHAR *name,ImpInterface *i,Interface *gi, BOOL suppressPrompts=FALSE);	// Import file
		
		//Constructor/Destructor
		maxtoolsimporter();
		~maxtoolsimporter();		

};



class maxtoolsimporterClassDesc : public ClassDesc2 
{
public:
	virtual int IsPublic() 							{ return TRUE; }
	virtual void* Create(BOOL /*loading = FALSE*/) 		{ return new maxtoolsimporter(); }
	virtual const TCHAR *	ClassName() 			{ return GetString(IDS_CLASS_NAME); }
	virtual SClass_ID SuperClassID() 				{ return SCENE_IMPORT_CLASS_ID; }
	virtual Class_ID ClassID() 						{ return maxtoolsimporter_CLASS_ID; }
	virtual const TCHAR* Category() 				{ return GetString(IDS_CATEGORY); }

	virtual const TCHAR* InternalName() 			{ return _T("maxtoolsimporter"); }	// returns fixed parsable name (scripter-visible name)
	virtual HINSTANCE HInstance() 					{ return hInstance; }					// returns owning module handle
	

};


ClassDesc2* GetmaxtoolsimporterDesc() { 
	static maxtoolsimporterClassDesc maxtoolsimporterDesc;
	return &maxtoolsimporterDesc; 
}




INT_PTR CALLBACK maxtoolsimporterOptionsDlgProc(HWND hWnd,UINT message,WPARAM wParam,LPARAM lParam) {
	static maxtoolsimporter *imp = NULL;

	switch(message) {
		case WM_INITDIALOG:
			imp = (maxtoolsimporter *)lParam;
			CenterWindow(hWnd,GetParent(hWnd));
			return TRUE;

		case WM_CLOSE:
			EndDialog(hWnd, 0);
			return 1;
	}
	return 0;
}


//--- maxtoolsimporter -------------------------------------------------------
maxtoolsimporter::maxtoolsimporter()
{

}

maxtoolsimporter::~maxtoolsimporter() 
{

}

int maxtoolsimporter::ExtCount()
{
	#pragma message(TODO("Returns the number of file name extensions supported by the plug-in."))
	return 1;
}

const TCHAR *maxtoolsimporter::Ext(int n)
{		
	#pragma message(TODO("Return the 'i-th' file name extension (i.e. \"3DS\")."))
	return _T("NIF");
}

const TCHAR *maxtoolsimporter::LongDesc()
{
	#pragma message(TODO("Return long ASCII description (i.e. \"Targa 2.0 Image File\")"))
	return _T("Netimmerse");
}
	
const TCHAR *maxtoolsimporter::ShortDesc() 
{			
	#pragma message(TODO("Return short ASCII description (i.e. \"Targa\")"))
	return _T("Nif format");
}

const TCHAR *maxtoolsimporter::AuthorName()
{			
	#pragma message(TODO("Return ASCII Author name"))
	return _T("Theru");
}

const TCHAR *maxtoolsimporter::CopyrightMessage() 
{	
	#pragma message(TODO("Return ASCII Copyright message"))
	return _T("");
}

const TCHAR *maxtoolsimporter::OtherMessage1() 
{		
	//TODO: Return Other message #1 if any
	return _T("");
}

const TCHAR *maxtoolsimporter::OtherMessage2() 
{		
	//TODO: Return other message #2 in any
	return _T("");
}

unsigned int maxtoolsimporter::Version()
{				
	#pragma message(TODO("Return Version number * 100 (i.e. v3.01 = 301)"))
	return 100;
}

void maxtoolsimporter::ShowAbout(HWND hWnd)
{			
	// Optional
}

void buildbone(NiNodeRef node,ImpInterface *im,Interface *gi)
{
ImpNode* rootnode = im->CreateNode(); 
rootnode->SetTransform(0,TOMATRIX3(node->GetLocalTransform()));
SimpleObject2* obj=(SimpleObject2*)gi->CreateInstance(GEOMOBJECT_CLASS_ID, BONE_OBJ_CLASSID );
rootnode->Reference(obj);
rootnode->GetINode()->SetBoneNodeOnOff( true, 0 ); 
rootnode->GetINode()->SetRenderable( false ); 
rootnode->GetINode()->ShowBone( 1 );
rootnode->SetName(node->GetName().c_str());
im->AddNodeToScene(rootnode);
}


void SetTriangles(Mesh& mesh, const vector<Triangle>& v)
{
   int n = v.size();
   int nm = mesh.getNumMaps();
   mesh.setNumFaces(n);
   mesh.setNumTVFaces(nm);
   for (int j=0; j<nm; ++j)
      mesh.setNumMapFaces(j+1, n, TRUE);
   for (int i=0; i<n; ++i) {
      const Triangle& t = v[i];
      Face& f = mesh.faces[i];
      f.setVerts(t.v1, t.v2, t.v3);
      f.Show();
      f.setEdgeVisFlags(EDGE_VIS, EDGE_VIS, EDGE_VIS);
      TVFace& tf = mesh.tvFace[i];
      tf.setTVerts(t.v1, t.v2, t.v3);
      for (int j=0; j<nm; ++j) {
         if (TVFace *tvFace = mesh.mapFaces(j+1))
            tvFace[i].setTVerts(t.v1, t.v2, t.v3);
      }
   }
}

NiObjectRef returnvec(const TCHAR *filename,ImpInterface *im,Interface *gi)
{
	    string filen=filename;
		NiObjectRef niObj1;
        niObj1 = ReadNifTree(filen.c_str());
		return niObj1;
}

Matrix3 TOMATRIX3(const Niflib::Matrix44 &tm, bool invert = false)
{
   Niflib::Vector3 pos; Niflib::Matrix33 rot; float scale;
   tm.Decompose(pos, rot, scale);
   Matrix3 m(rot.rows[0].data, rot.rows[1].data, rot.rows[2].data, Point3());
   if (invert) m.Invert();
   m.Scale(Point3(scale, scale, scale));
   m.SetTrans(Point3(pos.x, pos.y, pos.z));
   return m;
}

BSFadeNodeRef getskeletonrootnode(const TCHAR *filename,ImpInterface *im,Interface *gi)
{
	    NiObjectRef ob=returnvec(filename,im,gi);
		BSFadeNodeRef fnode = DynamicCast<BSFadeNode>(ob);
		return fnode;
}



NiNodeRef returnode(NiNodeRef niobj)
{
	NiNodeRef niparent=niobj;
	return niparent;
	if(niparent->GetChildren().size() > 0)
	{
       for(int i=0; i < niparent->GetChildren().size() ; i++)
	   {
		NiNodeRef nichild=DynamicCast<NiNode>(niparent->GetChildren()[i]);
		return nichild;
		if(nichild->GetChildren().size() > 0)
	    {
           for(int is=0; i < nichild->GetChildren().size() ; is++)
	       {
             NiNodeRef nigrandchild=DynamicCast<NiNode>(nichild->GetChildren()[is]);
			 return nigrandchild;
			 returnode(nigrandchild);
		   }
	    }
	  }
   }
}

void importMesh(const TCHAR *filename,ImpInterface *im,Interface *gi)
{
	    NiObjectRef ob=returnvec(filename,im,gi);
		NiNodeRef ninode = DynamicCast<NiNode>(ob);
		vector<NiAVObjectRef> niav=ninode->GetChildren();
		
		for(int is=0 ; is < niav.size(); is++)
		{
          if(niav[is]->GetType().GetTypeName()=="NiTriShape")
		  {
			NiTriShapeRef shape=DynamicCast<NiTriShape>(niav[is]);
            NiTriShapeDataRef data=shape->GetData();
			TriObject* tri = CreateNewTriObject();
		    Mesh& mesh=tri->GetMesh();
		    int num=data->GetVertexCount();
            vector<Point3>vertex;
            mesh.setNumVerts(num);
		    std::vector<Triangle> tris = data->GetTriangles();
		    for (int vert=0 ;vert < num ; vert++)
		    {
			Point3 vertp;
			Point3 facep;
			vertp.Set(data->GetVertices()[vert].x,data->GetVertices()[vert].y,data->GetVertices()[vert].z);
            mesh.setVert(vert,vertp);
		    } 
		    SetTriangles(mesh,tris);
            ImpNode* rootnode = im->CreateNode(); 
            rootnode->Reference(tri);
            Matrix3 tm; 
            tm.IdentityMatrix();      // Reset initial matrix to identity 
            tm.SetTrans(Point3(0,0,0));         // Add in the center point 
            rootnode->SetTransform(0, tm); 
            im->AddNodeToScene(rootnode); 
            rootnode->SetName(shape->GetName().c_str()); 
		  }
		 
    }
}

int maxtoolsimporter::DoImport(const TCHAR *filename,ImpInterface *i,Interface *gi, BOOL suppressPrompts)
{
	try
	{
	
	  return TRUE;
	}
	catch (exception* e)
    {
      MessageBox(NULL, e->what(), "Import Error", MB_OK);
      return FALSE;
    }
}
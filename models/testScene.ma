//Maya ASCII 2018 scene
//Name: testScene.ma
//Last modified: Thu, Feb 21, 2019 08:12:33 PM
//Codeset: 1252
requires maya "2018";
currentUnit -l meter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2018";
fileInfo "version" "2018";
fileInfo "cutIdentifier" "201706261615-f9658c4cfc";
fileInfo "osv" "Microsoft Windows 8 Business Edition, 64-bit  (Build 9200)\n";
fileInfo "license" "student";
createNode transform -s -n "persp";
	rename -uid "8B78C96F-467B-C6AF-EDB5-0AA3C2AEE981";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 3.4753409720079431 3.352818030915258 6.1531018943684233 ;
	setAttr ".r" -type "double3" -28.538352728610185 -1472.5999999989544 3.7753524029671935e-15 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "95E824C4-4B5A-E0D7-FF65-7089DF003FF6";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".ncp" 0.01;
	setAttr ".fcp" 1000;
	setAttr ".coi" 3.1685275162003719;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" -779.73033876640773 149.99999999999997 417.51106407233908 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
	setAttr ".ai_translator" -type "string" "perspective";
createNode transform -s -n "top";
	rename -uid "5F26DFB9-404E-A2BE-2269-EE83A82B84A3";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 1000.1 0 ;
	setAttr ".r" -type "double3" -89.999999999999986 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "5FC329C3-4D0C-0DAF-CAD8-84A49C46CF62";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".ncp" 0.01;
	setAttr ".fcp" 1000;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode transform -s -n "front";
	rename -uid "A75B9586-467D-421B-4CEE-E9B3515C265A";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 1000.1 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "41E1AA1F-4E3F-62EE-C32A-E89F10A56AA9";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".ncp" 0.01;
	setAttr ".fcp" 1000;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode transform -s -n "side";
	rename -uid "A07EC3D4-4665-AB0D-A00E-9092EC2F13AE";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1000.1 0 0 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "D0855E9F-4711-C7EA-55D3-61A886116C34";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".ncp" 0.01;
	setAttr ".fcp" 1000;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode transform -n "group1";
	rename -uid "77C87B9C-4E21-9AD5-66EB-B482371DECAD";
	setAttr ".t" -type "double3" -2.8567832005269684 0 3.4061761308392851 ;
	setAttr ".r" -type "double3" 0 -134.28365502539961 0 ;
createNode transform -n "group5" -p "group1";
	rename -uid "BC08BE5B-41EC-41C4-35BB-D484DA1995E9";
createNode transform -n "q" -p "group5";
	rename -uid "CA306BA6-45ED-43B6-38C3-049BE23EE009";
	addAttr -ci true -sn "DAVEHASH" -ln "DAVEHASH" -dt "string";
	addAttr -ci true -sn "DAVETAG" -ln "DAVETAG" -dt "string";
	addAttr -ci true -sn "DAVEBUILDING" -ln "DAVEBUILDING" -dt "string";
	addAttr -ci true -sn "DAVEROOM" -ln "DAVEROOM" -dt "string";
	addAttr -ci true -sn "DAVEHULLFLIPPED" -ln "DAVEHULLFLIPPED" -dt "string";
	setAttr ".t" -type "double3" 3.8688763393318379 4.5 2.054751705844668 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
	setAttr ".s" -type "double3" 0.025000000000000008 3 2 ;
	setAttr ".rp" -type "double3" 0 -1.5 0 ;
	setAttr ".sp" -type "double3" 0 -0.5 0 ;
	setAttr ".spt" -type "double3" 0 -1 0 ;
	setAttr ".DAVEHASH" -type "string" "CuyJTam4";
	setAttr ".DAVETAG" -type "string" "WALL";
	setAttr ".DAVEBUILDING" -type "string" "2";
	setAttr ".DAVEROOM" -type "string" "0";
	setAttr ".DAVEHULLFLIPPED" -type "string" "False";
createNode mesh -n "qShape" -p "q";
	rename -uid "EAACBA2F-4EC6-49CC-EC9E-67BC52072CAC";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "q1" -p "group5";
	rename -uid "F9194BF1-4EAC-9ED4-CAE6-89A934FA3189";
	addAttr -ci true -sn "DAVEHASH" -ln "DAVEHASH" -dt "string";
	addAttr -ci true -sn "DAVETAG" -ln "DAVETAG" -dt "string";
	addAttr -ci true -sn "DAVEBUILDING" -ln "DAVEBUILDING" -dt "string";
	addAttr -ci true -sn "DAVEROOM" -ln "DAVEROOM" -dt "string";
	addAttr -ci true -sn "DAVEHULLFLIPPED" -ln "DAVEHULLFLIPPED" -dt "string";
	setAttr ".t" -type "double3" 5.8688763393318384 4.5 2.0547517058446694 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
	setAttr ".s" -type "double3" 0.025000000000000008 3 2 ;
	setAttr ".rp" -type "double3" 0 -1.5 0 ;
	setAttr ".sp" -type "double3" 0 -0.5 0 ;
	setAttr ".spt" -type "double3" 0 -1 0 ;
	setAttr ".DAVEHASH" -type "string" "N4MS82Gv";
	setAttr ".DAVETAG" -type "string" "WALL";
	setAttr ".DAVEBUILDING" -type "string" "2";
	setAttr ".DAVEROOM" -type "string" "0";
	setAttr ".DAVEHULLFLIPPED" -type "string" "False";
createNode mesh -n "qShape1" -p "q1";
	rename -uid "3BD881AC-4292-2F55-D8F8-CD94FD32FA9B";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "q2" -p "group5";
	rename -uid "46546C25-4DA8-DDE0-2429-A791DC9D0C70";
	addAttr -ci true -sn "DAVEHASH" -ln "DAVEHASH" -dt "string";
	addAttr -ci true -sn "DAVETAG" -ln "DAVETAG" -dt "string";
	addAttr -ci true -sn "DAVEBUILDING" -ln "DAVEBUILDING" -dt "string";
	addAttr -ci true -sn "DAVEROOM" -ln "DAVEROOM" -dt "string";
	addAttr -ci true -sn "DAVEHULLFLIPPED" -ln "DAVEHULLFLIPPED" -dt "string";
	setAttr ".t" -type "double3" 2.8688763393318379 4.5 3.0547517058446694 ;
	setAttr ".s" -type "double3" 0.025 3 2 ;
	setAttr ".rp" -type "double3" 0 -1.5 0 ;
	setAttr ".sp" -type "double3" 0 -0.5 0 ;
	setAttr ".spt" -type "double3" 0 -1 0 ;
	setAttr ".DAVEHASH" -type "string" "-47JPMz6";
	setAttr ".DAVETAG" -type "string" "WALL";
	setAttr ".DAVEBUILDING" -type "string" "2";
	setAttr ".DAVEROOM" -type "string" "0";
	setAttr ".DAVEHULLFLIPPED" -type "string" "False";
createNode mesh -n "qShape2" -p "q2";
	rename -uid "7F5B7683-4CAE-35E2-66ED-99B9E391D105";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "q3" -p "group5";
	rename -uid "1BA363AD-4C6C-6BE8-9F38-E28E0A7F5148";
	addAttr -ci true -sn "DAVEHASH" -ln "DAVEHASH" -dt "string";
	addAttr -ci true -sn "DAVETAG" -ln "DAVETAG" -dt "string";
	addAttr -ci true -sn "DAVEBUILDING" -ln "DAVEBUILDING" -dt "string";
	addAttr -ci true -sn "DAVEROOM" -ln "DAVEROOM" -dt "string";
	addAttr -ci true -sn "DAVEHULLFLIPPED" -ln "DAVEHULLFLIPPED" -dt "string";
	setAttr ".t" -type "double3" 5.8688763393318384 4.5 6.0547517058446667 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
	setAttr ".s" -type "double3" 0.025000000000000008 3 2 ;
	setAttr ".rp" -type "double3" 0 -1.5 0 ;
	setAttr ".sp" -type "double3" 0 -0.5 0 ;
	setAttr ".spt" -type "double3" 0 -1 0 ;
	setAttr ".DAVEHASH" -type "string" "QFUHoXbJ";
	setAttr ".DAVETAG" -type "string" "WALL";
	setAttr ".DAVEBUILDING" -type "string" "2";
	setAttr ".DAVEROOM" -type "string" "0";
	setAttr ".DAVEHULLFLIPPED" -type "string" "False";
createNode mesh -n "qShape3" -p "q3";
	rename -uid "FDEFCD0F-48AB-8BC1-41DC-FBBC90A9822E";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "q4" -p "group5";
	rename -uid "F046047C-4A41-6D0F-F58C-3FB1D54F31B1";
	addAttr -ci true -sn "DAVEHASH" -ln "DAVEHASH" -dt "string";
	addAttr -ci true -sn "DAVETAG" -ln "DAVETAG" -dt "string";
	addAttr -ci true -sn "DAVEBUILDING" -ln "DAVEBUILDING" -dt "string";
	addAttr -ci true -sn "DAVEROOM" -ln "DAVEROOM" -dt "string";
	addAttr -ci true -sn "DAVEHULLFLIPPED" -ln "DAVEHULLFLIPPED" -dt "string";
	setAttr ".t" -type "double3" 6.8688763393318357 4.5 3.0547517058446698 ;
	setAttr ".r" -type "double3" 0 179.99999999999997 0 ;
	setAttr ".s" -type "double3" 0.025 3 2 ;
	setAttr ".rp" -type "double3" 0 -1.5 0 ;
	setAttr ".sp" -type "double3" 0 -0.5 0 ;
	setAttr ".spt" -type "double3" 0 -1 0 ;
	setAttr ".DAVEHASH" -type "string" "Psm22s4q";
	setAttr ".DAVETAG" -type "string" "WALL";
	setAttr ".DAVEBUILDING" -type "string" "2";
	setAttr ".DAVEROOM" -type "string" "0";
	setAttr ".DAVEHULLFLIPPED" -type "string" "False";
createNode mesh -n "qShape4" -p "q4";
	rename -uid "4B498F8D-4C75-0969-EE1F-0F8736736BC8";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "q5" -p "group5";
	rename -uid "BD0197B5-4AF5-DD58-645C-06AD9AF69E93";
	addAttr -ci true -sn "DAVEHASH" -ln "DAVEHASH" -dt "string";
	addAttr -ci true -sn "DAVETAG" -ln "DAVETAG" -dt "string";
	addAttr -ci true -sn "DAVEBUILDING" -ln "DAVEBUILDING" -dt "string";
	addAttr -ci true -sn "DAVEROOM" -ln "DAVEROOM" -dt "string";
	addAttr -ci true -sn "DAVEHULLFLIPPED" -ln "DAVEHULLFLIPPED" -dt "string";
	setAttr ".t" -type "double3" 3.8688763393318379 4.5 6.0547517058446667 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
	setAttr ".s" -type "double3" 0.025000000000000008 3 2 ;
	setAttr ".rp" -type "double3" 0 -1.5 0 ;
	setAttr ".sp" -type "double3" 0 -0.5 0 ;
	setAttr ".spt" -type "double3" 0 -1 0 ;
	setAttr ".DAVEHASH" -type "string" "aPZ5hrW5";
	setAttr ".DAVETAG" -type "string" "WALL";
	setAttr ".DAVEBUILDING" -type "string" "2";
	setAttr ".DAVEROOM" -type "string" "0";
	setAttr ".DAVEHULLFLIPPED" -type "string" "False";
createNode mesh -n "qShape5" -p "q5";
	rename -uid "D0BB15DE-4512-A6C0-D134-1CA206B752AF";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "q6" -p "group5";
	rename -uid "667642DC-4AC7-D2A1-DC46-0280EA2C5E53";
	addAttr -ci true -sn "DAVEHASH" -ln "DAVEHASH" -dt "string";
	addAttr -ci true -sn "DAVETAG" -ln "DAVETAG" -dt "string";
	addAttr -ci true -sn "DAVEBUILDING" -ln "DAVEBUILDING" -dt "string";
	addAttr -ci true -sn "DAVEROOM" -ln "DAVEROOM" -dt "string";
	addAttr -ci true -sn "DAVEHULLFLIPPED" -ln "DAVEHULLFLIPPED" -dt "string";
	setAttr ".t" -type "double3" 6.8688763393318357 4.5 5.0547517058446685 ;
	setAttr ".s" -type "double3" 0.025 3 2 ;
	setAttr ".rp" -type "double3" 0 -1.5 0 ;
	setAttr ".sp" -type "double3" 0 -0.5 0 ;
	setAttr ".spt" -type "double3" 0 -1 0 ;
	setAttr ".DAVEHASH" -type "string" "w4AXKpow";
	setAttr ".DAVETAG" -type "string" "WALL";
	setAttr ".DAVEBUILDING" -type "string" "2";
	setAttr ".DAVEROOM" -type "string" "0";
	setAttr ".DAVEHULLFLIPPED" -type "string" "False";
createNode mesh -n "qShape6" -p "q6";
	rename -uid "4B7E1DB6-46CD-671F-5BA2-0EABB33AA04D";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "doorWayq" -p "group5";
	rename -uid "B7761152-42E2-8EE4-366E-41B724C66E67";
	addAttr -ci true -sn "DAVEHASH" -ln "DAVEHASH" -dt "string";
	addAttr -ci true -sn "DAVETAG" -ln "DAVETAG" -dt "string";
	addAttr -ci true -sn "DAVEBUILDING" -ln "DAVEBUILDING" -dt "string";
	addAttr -ci true -sn "DAVEROOM" -ln "DAVEROOM" -dt "string";
	addAttr -ci true -sn "DAVEHULLFLIPPED" -ln "DAVEHULLFLIPPED" -dt "string";
	setAttr ".t" -type "double3" 2.8688763393318379 4.5 5.0547517058446694 ;
	setAttr ".s" -type "double3" 0.025 3 2 ;
	setAttr ".rp" -type "double3" 0 -1.5 0 ;
	setAttr ".sp" -type "double3" 0 -0.5 0 ;
	setAttr ".spt" -type "double3" 0 -1 0 ;
	setAttr ".DAVEHASH" -type "string" "VSENFzSt";
	setAttr ".DAVETAG" -type "string" "DOOR";
	setAttr ".DAVEBUILDING" -type "string" "2";
	setAttr ".DAVEROOM" -type "string" "0";
	setAttr ".DAVEHULLFLIPPED" -type "string" "False";
createNode mesh -n "doorWayqShape" -p "doorWayq";
	rename -uid "39743EE8-49CB-B055-62D0-509911908FEA";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 1 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 46 ".uvst[0].uvsp[0:45]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25 0.25 0.25 0.375 0.375 0.625 0.375 0.75 0.25 0.33749998
		 0.25 0.375 0.28749999 0.625 0.28749999 0.66250002 0.25 0.64375001 0.48124999 0.35624999
		 0.48124999 0.26875001 0.39375001 0.73125005 0.39375001 0.625 0.46250001 0.83750004
		 0.25 0.16249999 0.25 0.375 0.46250001 0.375 0.2 0.625 0.2 0.83125001 0.1 0.75 0.2
		 0.41875002 0.1 0.625 0.55000001 0.875 0.2 0.125 0.2 0.375 0.55000001 0.081249997
		 0.60000002 0.25 0.2 0.66874999 0.60000002 0 0 0 1 1 0 1 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 28 ".vt[0:27]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5 -0.5 0.5 0 0.5 0.5 0 -0.5 0.5 0.34999999
		 0.5 0.5 0.34999999 0.5 -0.5 0.34999999 -0.5 -0.5 0.34999999 -0.5 -0.5 -0.34999999
		 0.5 -0.5 -0.34999999 0.5 0.5 -0.34999999 -0.5 0.5 -0.34999999 -0.5 0.30000001 0.5
		 0.5 0.30000001 0.5 0.5 0.30000001 0.34999999 0.5 0.30000001 0 0.5 0.30000001 -0.34999999
		 0.5 0.30000001 -0.5 -0.5 0.30000001 -0.5 -0.5 0.30000001 -0.34999999 -0.5 0.30000001 0
		 -0.5 0.30000001 0.34999999;
	setAttr -s 52 ".ed[0:51]"  0 1 0 2 3 0 4 5 0 6 7 0 0 18 0 1 19 0 2 10 0
		 3 11 0 4 24 0 5 23 0 6 14 0 7 15 0 8 17 0 9 16 0 8 9 1 9 21 1 10 8 0 11 9 0 12 1 0
		 13 0 0 10 11 1 11 20 1 12 13 0 13 27 0 16 5 0 17 4 0 14 15 0 15 22 0 16 17 1 17 25 1
		 18 2 0 19 3 0 20 12 0 22 16 1 23 7 0 24 6 0 25 14 0 26 8 1 27 10 1 18 19 1 19 20 1
		 20 21 0 21 22 0 22 23 1 23 24 1 24 25 1 25 26 0 26 27 0 27 18 1 20 27 0 21 26 0 22 25 0;
	setAttr -s 26 -ch 104 ".fc[0:25]" -type "polyFaces" 
		f 4 39 31 -2 -31
		mu 0 4 30 31 3 2
		f 4 14 13 28 -13
		mu 0 4 15 16 26 29
		f 4 2 9 44 -9
		mu 0 4 4 5 35 38
		f 4 15 42 33 -14
		mu 0 4 17 33 34 27
		f 4 29 46 37 12
		mu 0 4 28 39 40 14
		f 4 20 17 -15 -17
		mu 0 4 19 20 16 15
		f 4 21 41 -16 -18
		mu 0 4 21 32 33 17
		f 4 -38 47 38 16
		mu 0 4 14 40 41 18
		f 4 1 7 -21 -7
		mu 0 4 2 3 20 19
		f 4 40 -22 -8 -32
		mu 0 4 31 32 21 3
		f 4 -23 18 -1 -20
		mu 0 4 23 22 9 8
		f 4 -39 48 30 6
		mu 0 4 18 41 30 2
		f 4 3 11 -27 -11
		mu 0 4 6 7 25 24
		f 4 -34 43 -10 -25
		mu 0 4 27 34 36 11
		f 4 -29 24 -3 -26
		mu 0 4 29 26 5 4
		f 4 45 -30 25 8
		mu 0 4 37 39 28 13
		f 4 0 5 -40 -5
		mu 0 4 0 1 31 30
		f 4 -19 -33 -41 -6
		mu 0 4 1 22 32 31
		f 4 -44 -28 -12 -35
		mu 0 4 36 34 25 10
		f 4 -45 34 -4 -36
		mu 0 4 38 35 7 6
		f 4 10 -37 -46 35
		mu 0 4 12 24 39 37
		f 4 -49 -24 19 4
		mu 0 4 30 41 23 0
		f 4 -42 49 -48 -51
		mu 0 4 42 32 41 43
		f 4 -43 50 -47 -52
		mu 0 4 34 44 45 39
		f 4 27 51 36 26
		mu 0 4 25 34 39 24
		f 4 23 -50 32 22
		mu 0 4 23 41 32 22;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "group6" -p "group1";
	rename -uid "6F8BC4CA-4D9B-196C-A613-5D884C495617";
createNode transform -n "w" -p "group6";
	rename -uid "CDF4B622-423E-8CEF-A839-628AB8169200";
	addAttr -ci true -sn "DAVEHASH" -ln "DAVEHASH" -dt "string";
	addAttr -ci true -sn "DAVETAG" -ln "DAVETAG" -dt "string";
	addAttr -ci true -sn "DAVEBUILDING" -ln "DAVEBUILDING" -dt "string";
	addAttr -ci true -sn "DAVEROOM" -ln "DAVEROOM" -dt "string";
	addAttr -ci true -sn "DAVEHULLFLIPPED" -ln "DAVEHULLFLIPPED" -dt "string";
	setAttr ".t" -type "double3" 6.9999999999999991 1.5 1 ;
	setAttr ".s" -type "double3" 0.025 3 2 ;
	setAttr ".rp" -type "double3" 0 -1.5 0 ;
	setAttr ".sp" -type "double3" 0 -0.5 0 ;
	setAttr ".spt" -type "double3" 0 -1 0 ;
	setAttr ".DAVEHASH" -type "string" "-ZkqO7kL";
	setAttr ".DAVETAG" -type "string" "WALL";
	setAttr ".DAVEBUILDING" -type "string" "2";
	setAttr ".DAVEROOM" -type "string" "1";
	setAttr ".DAVEHULLFLIPPED" -type "string" "False";
createNode mesh -n "wShape" -p "w";
	rename -uid "6E18DC74-4C9D-23F4-588E-BAAEF50A584B";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "w1" -p "group6";
	rename -uid "E5DB2166-4B3B-1C18-A996-8D9E8AA01304";
	addAttr -ci true -sn "DAVEHASH" -ln "DAVEHASH" -dt "string";
	addAttr -ci true -sn "DAVETAG" -ln "DAVETAG" -dt "string";
	addAttr -ci true -sn "DAVEBUILDING" -ln "DAVEBUILDING" -dt "string";
	addAttr -ci true -sn "DAVEROOM" -ln "DAVEROOM" -dt "string";
	addAttr -ci true -sn "DAVEHULLFLIPPED" -ln "DAVEHULLFLIPPED" -dt "string";
	setAttr ".t" -type "double3" 1.9999999999999989 1.5 7.105427357601002e-17 ;
	setAttr ".r" -type "double3" 0 -89.999999999999957 0 ;
	setAttr ".s" -type "double3" 0.025 3 2 ;
	setAttr ".rp" -type "double3" 0 -1.5 0 ;
	setAttr ".sp" -type "double3" 0 -0.5 0 ;
	setAttr ".spt" -type "double3" 0 -1 0 ;
	setAttr ".DAVEHASH" -type "string" "aEiXAKvB";
	setAttr ".DAVETAG" -type "string" "WALL";
	setAttr ".DAVEBUILDING" -type "string" "2";
	setAttr ".DAVEROOM" -type "string" "1";
	setAttr ".DAVEHULLFLIPPED" -type "string" "False";
createNode mesh -n "wShape1" -p "w1";
	rename -uid "50BF740A-47EA-960C-9CA6-F9AC5B011ABE";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "w2" -p "group6";
	rename -uid "53B280A4-4456-DD0A-B6F3-7C88B77A20E7";
	addAttr -ci true -sn "DAVEHASH" -ln "DAVEHASH" -dt "string";
	addAttr -ci true -sn "DAVETAG" -ln "DAVETAG" -dt "string";
	addAttr -ci true -sn "DAVEBUILDING" -ln "DAVEBUILDING" -dt "string";
	addAttr -ci true -sn "DAVEROOM" -ln "DAVEROOM" -dt "string";
	addAttr -ci true -sn "DAVEHULLFLIPPED" -ln "DAVEHULLFLIPPED" -dt "string";
	setAttr ".t" -type "double3" 6.9999999999999991 1.5 2.9999999999999996 ;
	setAttr ".s" -type "double3" 0.025 3 2 ;
	setAttr ".rp" -type "double3" 0 -1.5 0 ;
	setAttr ".sp" -type "double3" 0 -0.5 0 ;
	setAttr ".spt" -type "double3" 0 -1 0 ;
	setAttr ".DAVEHASH" -type "string" "nmL1V8IK";
	setAttr ".DAVETAG" -type "string" "WALL";
	setAttr ".DAVEBUILDING" -type "string" "2";
	setAttr ".DAVEROOM" -type "string" "1";
	setAttr ".DAVEHULLFLIPPED" -type "string" "False";
createNode mesh -n "wShape2" -p "w2";
	rename -uid "035EE8FF-4EF8-730A-E8A6-3A9CF2E25D4F";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "w3" -p "group6";
	rename -uid "CAA1EEE8-493E-9118-00E5-81A16BCEF90E";
	addAttr -ci true -sn "DAVEHASH" -ln "DAVEHASH" -dt "string";
	addAttr -ci true -sn "DAVETAG" -ln "DAVETAG" -dt "string";
	addAttr -ci true -sn "DAVEBUILDING" -ln "DAVEBUILDING" -dt "string";
	addAttr -ci true -sn "DAVEROOM" -ln "DAVEROOM" -dt "string";
	addAttr -ci true -sn "DAVEHULLFLIPPED" -ln "DAVEHULLFLIPPED" -dt "string";
	setAttr ".t" -type "double3" 3.9999999999999991 1.5 6 ;
	setAttr ".r" -type "double3" 0 -89.999999999999957 0 ;
	setAttr ".s" -type "double3" 0.025 3 2 ;
	setAttr ".rp" -type "double3" 0 -1.5 0 ;
	setAttr ".sp" -type "double3" 0 -0.5 0 ;
	setAttr ".spt" -type "double3" 0 -1 0 ;
	setAttr ".DAVEHASH" -type "string" "NKR4vwIr";
	setAttr ".DAVETAG" -type "string" "WALL";
	setAttr ".DAVEBUILDING" -type "string" "2";
	setAttr ".DAVEROOM" -type "string" "1";
	setAttr ".DAVEHULLFLIPPED" -type "string" "False";
createNode mesh -n "wShape3" -p "w3";
	rename -uid "06598131-4F21-EB19-BE6A-25BE38D62F49";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "w4" -p "group6";
	rename -uid "DFF5C31A-4ED4-51C9-D08B-498FBFDC04C3";
	addAttr -ci true -sn "DAVEHASH" -ln "DAVEHASH" -dt "string";
	addAttr -ci true -sn "DAVETAG" -ln "DAVETAG" -dt "string";
	addAttr -ci true -sn "DAVEBUILDING" -ln "DAVEBUILDING" -dt "string";
	addAttr -ci true -sn "DAVEROOM" -ln "DAVEROOM" -dt "string";
	addAttr -ci true -sn "DAVEHULLFLIPPED" -ln "DAVEHULLFLIPPED" -dt "string";
	setAttr ".t" -type "double3" 1 1.4999999999999996 0.99999999999999978 ;
	setAttr ".s" -type "double3" 0.025 3 2 ;
	setAttr ".rp" -type "double3" -2.4513724383723458e-16 -1.4999999999999996 0 ;
	setAttr ".sp" -type "double3" 0 -0.5 0 ;
	setAttr ".spt" -type "double3" 0 -1 0 ;
	setAttr ".DAVEHASH" -type "string" "ag62gPiL";
	setAttr ".DAVETAG" -type "string" "WALL";
	setAttr ".DAVEBUILDING" -type "string" "2";
	setAttr ".DAVEROOM" -type "string" "1";
	setAttr ".DAVEHULLFLIPPED" -type "string" "False";
createNode mesh -n "wShape4" -p "w4";
	rename -uid "70E3C759-4C12-2217-A6EE-579F04FB75F2";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "w5" -p "group6";
	rename -uid "8D549001-48DA-5547-5B0F-02B0271D8E21";
	addAttr -ci true -sn "DAVEHASH" -ln "DAVEHASH" -dt "string";
	addAttr -ci true -sn "DAVETAG" -ln "DAVETAG" -dt "string";
	addAttr -ci true -sn "DAVEBUILDING" -ln "DAVEBUILDING" -dt "string";
	addAttr -ci true -sn "DAVEROOM" -ln "DAVEROOM" -dt "string";
	addAttr -ci true -sn "DAVEHULLFLIPPED" -ln "DAVEHULLFLIPPED" -dt "string";
	setAttr ".t" -type "double3" 3.9999999999999991 1.5 6.3948846218409014e-16 ;
	setAttr ".r" -type "double3" 0 -89.999999999999957 0 ;
	setAttr ".s" -type "double3" 0.025 3 2 ;
	setAttr ".rp" -type "double3" 0 -1.5 0 ;
	setAttr ".sp" -type "double3" 0 -0.5 0 ;
	setAttr ".spt" -type "double3" 0 -1 0 ;
	setAttr ".DAVEHASH" -type "string" "ThhUXHbv";
	setAttr ".DAVETAG" -type "string" "WALL";
	setAttr ".DAVEBUILDING" -type "string" "2";
	setAttr ".DAVEROOM" -type "string" "1";
	setAttr ".DAVEHULLFLIPPED" -type "string" "False";
createNode mesh -n "wShape5" -p "w5";
	rename -uid "68EE1B67-4BF5-C66A-7F52-6DB2881C75CE";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "w6" -p "group6";
	rename -uid "98CC63BC-4E90-A523-4A51-61A8B3532355";
	addAttr -ci true -sn "DAVEHASH" -ln "DAVEHASH" -dt "string";
	addAttr -ci true -sn "DAVETAG" -ln "DAVETAG" -dt "string";
	addAttr -ci true -sn "DAVEBUILDING" -ln "DAVEBUILDING" -dt "string";
	addAttr -ci true -sn "DAVEROOM" -ln "DAVEROOM" -dt "string";
	addAttr -ci true -sn "DAVEHULLFLIPPED" -ln "DAVEHULLFLIPPED" -dt "string";
	setAttr ".t" -type "double3" 5.9999999999999991 1.5 7.105427357601002e-17 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
	setAttr ".s" -type "double3" 0.025000000000000008 3 2 ;
	setAttr ".rp" -type "double3" 0 -1.5 0 ;
	setAttr ".sp" -type "double3" 0 -0.5 0 ;
	setAttr ".spt" -type "double3" 0 -1 0 ;
	setAttr ".DAVEHASH" -type "string" "kwyMqJeP";
	setAttr ".DAVETAG" -type "string" "WALL";
	setAttr ".DAVEBUILDING" -type "string" "2";
	setAttr ".DAVEROOM" -type "string" "1";
	setAttr ".DAVEHULLFLIPPED" -type "string" "False";
createNode mesh -n "wShape6" -p "w6";
	rename -uid "876AA62C-4A12-C6F0-9EBD-CCAF9EA3AA25";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "w7" -p "group6";
	rename -uid "1F1CB2BF-46A8-AAE3-FDF4-E2AA764F45C2";
	addAttr -ci true -sn "DAVEHASH" -ln "DAVEHASH" -dt "string";
	addAttr -ci true -sn "DAVETAG" -ln "DAVETAG" -dt "string";
	addAttr -ci true -sn "DAVEBUILDING" -ln "DAVEBUILDING" -dt "string";
	addAttr -ci true -sn "DAVEROOM" -ln "DAVEROOM" -dt "string";
	addAttr -ci true -sn "DAVEHULLFLIPPED" -ln "DAVEHULLFLIPPED" -dt "string";
	setAttr ".t" -type "double3" 6.9999999999999991 1.5 4.9999999999999991 ;
	setAttr ".s" -type "double3" 0.025 3 2 ;
	setAttr ".rp" -type "double3" 0 -1.5 0 ;
	setAttr ".sp" -type "double3" 0 -0.5 0 ;
	setAttr ".spt" -type "double3" 0 -1 0 ;
	setAttr ".DAVEHASH" -type "string" "jd49gHuB";
	setAttr ".DAVETAG" -type "string" "WALL";
	setAttr ".DAVEBUILDING" -type "string" "2";
	setAttr ".DAVEROOM" -type "string" "1";
	setAttr ".DAVEHULLFLIPPED" -type "string" "False";
createNode mesh -n "wShape7" -p "w7";
	rename -uid "70DA5B90-4671-0F94-63F3-CC8F33E398C0";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "w8" -p "group6";
	rename -uid "CA1E6B5F-4173-5326-DAB3-80BEB38B0FCE";
	addAttr -ci true -sn "DAVEHASH" -ln "DAVEHASH" -dt "string";
	addAttr -ci true -sn "DAVETAG" -ln "DAVETAG" -dt "string";
	addAttr -ci true -sn "DAVEBUILDING" -ln "DAVEBUILDING" -dt "string";
	addAttr -ci true -sn "DAVEROOM" -ln "DAVEROOM" -dt "string";
	addAttr -ci true -sn "DAVEHULLFLIPPED" -ln "DAVEHULLFLIPPED" -dt "string";
	setAttr ".t" -type "double3" 6.0000000000000009 1.5 6 ;
	setAttr ".r" -type "double3" 0 -89.999999999999957 0 ;
	setAttr ".s" -type "double3" 0.025 3 2 ;
	setAttr ".rp" -type "double3" 0 -1.5 0 ;
	setAttr ".sp" -type "double3" 0 -0.5 0 ;
	setAttr ".spt" -type "double3" 0 -1 0 ;
	setAttr ".DAVEHASH" -type "string" "Z5o3GoS-";
	setAttr ".DAVETAG" -type "string" "WALL";
	setAttr ".DAVEBUILDING" -type "string" "2";
	setAttr ".DAVEROOM" -type "string" "1";
	setAttr ".DAVEHULLFLIPPED" -type "string" "False";
createNode mesh -n "wShape8" -p "w8";
	rename -uid "FEEF67EA-4621-88E0-9E97-E3AE0996116E";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "doorWayw" -p "group6";
	rename -uid "39EC9357-4E81-E4BC-E982-03ACB378A813";
	addAttr -ci true -sn "DAVEHASH" -ln "DAVEHASH" -dt "string";
	addAttr -ci true -sn "DAVETAG" -ln "DAVETAG" -dt "string";
	addAttr -ci true -sn "DAVEBUILDING" -ln "DAVEBUILDING" -dt "string";
	addAttr -ci true -sn "DAVEROOM" -ln "DAVEROOM" -dt "string";
	addAttr -ci true -sn "DAVEHULLFLIPPED" -ln "DAVEHULLFLIPPED" -dt "string";
	setAttr ".t" -type "double3" 0.99999999999999889 1.5 3 ;
	setAttr ".s" -type "double3" 0.025 3 2 ;
	setAttr ".rp" -type "double3" 0 -1.5 0 ;
	setAttr ".sp" -type "double3" 0 -0.5 0 ;
	setAttr ".spt" -type "double3" 0 -1 0 ;
	setAttr ".DAVEHASH" -type "string" "aPSx-fEO";
	setAttr ".DAVETAG" -type "string" "DOOR";
	setAttr ".DAVEBUILDING" -type "string" "2";
	setAttr ".DAVEROOM" -type "string" "1";
	setAttr ".DAVEHULLFLIPPED" -type "string" "False";
createNode mesh -n "doorWaywShape" -p "doorWayw";
	rename -uid "83710792-461C-0A9C-5B88-91A68344AF3C";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 1 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 46 ".uvst[0].uvsp[0:45]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25 0.25 0.25 0.375 0.375 0.625 0.375 0.75 0.25 0.33749998
		 0.25 0.375 0.28749999 0.625 0.28749999 0.66250002 0.25 0.64375001 0.48124999 0.35624999
		 0.48124999 0.26875001 0.39375001 0.73125005 0.39375001 0.625 0.46250001 0.83750004
		 0.25 0.16249999 0.25 0.375 0.46250001 0.375 0.2 0.625 0.2 0.83125001 0.1 0.75 0.2
		 0.41875002 0.1 0.625 0.55000001 0.875 0.2 0.125 0.2 0.375 0.55000001 0.081249997
		 0.60000002 0.25 0.2 0.66874999 0.60000002 0 0 0 1 1 0 1 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 28 ".vt[0:27]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5 -0.5 0.5 0 0.5 0.5 0 -0.5 0.5 0.34999999
		 0.5 0.5 0.34999999 0.5 -0.5 0.34999999 -0.5 -0.5 0.34999999 -0.5 -0.5 -0.34999999
		 0.5 -0.5 -0.34999999 0.5 0.5 -0.34999999 -0.5 0.5 -0.34999999 -0.5 0.30000001 0.5
		 0.5 0.30000001 0.5 0.5 0.30000001 0.34999999 0.5 0.30000001 0 0.5 0.30000001 -0.34999999
		 0.5 0.30000001 -0.5 -0.5 0.30000001 -0.5 -0.5 0.30000001 -0.34999999 -0.5 0.30000001 0
		 -0.5 0.30000001 0.34999999;
	setAttr -s 52 ".ed[0:51]"  0 1 0 2 3 0 4 5 0 6 7 0 0 18 0 1 19 0 2 10 0
		 3 11 0 4 24 0 5 23 0 6 14 0 7 15 0 8 17 0 9 16 0 8 9 1 9 21 1 10 8 0 11 9 0 12 1 0
		 13 0 0 10 11 1 11 20 1 12 13 0 13 27 0 16 5 0 17 4 0 14 15 0 15 22 0 16 17 1 17 25 1
		 18 2 0 19 3 0 20 12 0 22 16 1 23 7 0 24 6 0 25 14 0 26 8 1 27 10 1 18 19 1 19 20 1
		 20 21 0 21 22 0 22 23 1 23 24 1 24 25 1 25 26 0 26 27 0 27 18 1 20 27 0 21 26 0 22 25 0;
	setAttr -s 26 -ch 104 ".fc[0:25]" -type "polyFaces" 
		f 4 39 31 -2 -31
		mu 0 4 30 31 3 2
		f 4 14 13 28 -13
		mu 0 4 15 16 26 29
		f 4 2 9 44 -9
		mu 0 4 4 5 35 38
		f 4 15 42 33 -14
		mu 0 4 17 33 34 27
		f 4 29 46 37 12
		mu 0 4 28 39 40 14
		f 4 20 17 -15 -17
		mu 0 4 19 20 16 15
		f 4 21 41 -16 -18
		mu 0 4 21 32 33 17
		f 4 -38 47 38 16
		mu 0 4 14 40 41 18
		f 4 1 7 -21 -7
		mu 0 4 2 3 20 19
		f 4 40 -22 -8 -32
		mu 0 4 31 32 21 3
		f 4 -23 18 -1 -20
		mu 0 4 23 22 9 8
		f 4 -39 48 30 6
		mu 0 4 18 41 30 2
		f 4 3 11 -27 -11
		mu 0 4 6 7 25 24
		f 4 -34 43 -10 -25
		mu 0 4 27 34 36 11
		f 4 -29 24 -3 -26
		mu 0 4 29 26 5 4
		f 4 45 -30 25 8
		mu 0 4 37 39 28 13
		f 4 0 5 -40 -5
		mu 0 4 0 1 31 30
		f 4 -19 -33 -41 -6
		mu 0 4 1 22 32 31
		f 4 -44 -28 -12 -35
		mu 0 4 36 34 25 10
		f 4 -45 34 -4 -36
		mu 0 4 38 35 7 6
		f 4 10 -37 -46 35
		mu 0 4 12 24 39 37
		f 4 -49 -24 19 4
		mu 0 4 30 41 23 0
		f 4 -42 49 -48 -51
		mu 0 4 42 32 41 43
		f 4 -43 50 -47 -52
		mu 0 4 34 44 45 39
		f 4 27 51 36 26
		mu 0 4 25 34 39 24
		f 4 23 -50 32 22
		mu 0 4 23 41 32 22;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "w9" -p "group6";
	rename -uid "23538295-48A2-3472-AC60-35A8D3D20636";
	addAttr -ci true -sn "DAVEHASH" -ln "DAVEHASH" -dt "string";
	addAttr -ci true -sn "DAVETAG" -ln "DAVETAG" -dt "string";
	addAttr -ci true -sn "DAVEBUILDING" -ln "DAVEBUILDING" -dt "string";
	addAttr -ci true -sn "DAVEROOM" -ln "DAVEROOM" -dt "string";
	addAttr -ci true -sn "DAVEHULLFLIPPED" -ln "DAVEHULLFLIPPED" -dt "string";
	setAttr ".t" -type "double3" 1 1.4999999999999996 4.9999999999999991 ;
	setAttr ".s" -type "double3" 0.025 3 2 ;
	setAttr ".rp" -type "double3" -2.4513724383723458e-16 -1.4999999999999996 0 ;
	setAttr ".sp" -type "double3" 0 -0.5 0 ;
	setAttr ".spt" -type "double3" 0 -1 0 ;
	setAttr ".DAVEHASH" -type "string" "cRfIQ9al";
	setAttr ".DAVETAG" -type "string" "WALL";
	setAttr ".DAVEBUILDING" -type "string" "2";
	setAttr ".DAVEROOM" -type "string" "1";
	setAttr ".DAVEHULLFLIPPED" -type "string" "False";
createNode mesh -n "wShape9" -p "w9";
	rename -uid "E26906CC-4051-81AC-3B8F-F6B013A8957A";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "w10" -p "group6";
	rename -uid "4247D9CC-4993-47E2-631D-D894AF34C273";
	addAttr -ci true -sn "DAVEHASH" -ln "DAVEHASH" -dt "string";
	addAttr -ci true -sn "DAVETAG" -ln "DAVETAG" -dt "string";
	addAttr -ci true -sn "DAVEBUILDING" -ln "DAVEBUILDING" -dt "string";
	addAttr -ci true -sn "DAVEROOM" -ln "DAVEROOM" -dt "string";
	addAttr -ci true -sn "DAVEHULLFLIPPED" -ln "DAVEHULLFLIPPED" -dt "string";
	setAttr ".t" -type "double3" 2 1.4999999999999996 6 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
	setAttr ".s" -type "double3" 0.025000000000000008 3 2 ;
	setAttr ".rp" -type "double3" -2.4513724383723463e-16 -1.4999999999999996 0 ;
	setAttr ".rpt" -type "double3" 2.4513724383723439e-16 0 2.4513724383723463e-16 ;
	setAttr ".sp" -type "double3" 0 -0.5 0 ;
	setAttr ".spt" -type "double3" 0 -1 0 ;
	setAttr ".DAVEHASH" -type "string" "jLWvawwx";
	setAttr ".DAVETAG" -type "string" "WALL";
	setAttr ".DAVEBUILDING" -type "string" "2";
	setAttr ".DAVEROOM" -type "string" "1";
	setAttr ".DAVEHULLFLIPPED" -type "string" "False";
createNode mesh -n "wShape10" -p "w10";
	rename -uid "79116D46-400D-3232-221F-7B8B39B91733";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "group2";
	rename -uid "3D81B0F6-46D5-2603-3959-0586AD686437";
createNode transform -n "e" -p "group2";
	rename -uid "2F50E33B-4B59-621E-238E-96B96F7E884C";
	addAttr -ci true -sn "DAVEHASH" -ln "DAVEHASH" -dt "string";
	addAttr -ci true -sn "DAVETAG" -ln "DAVETAG" -dt "string";
	addAttr -ci true -sn "DAVEBUILDING" -ln "DAVEBUILDING" -dt "string";
	addAttr -ci true -sn "DAVEROOM" -ln "DAVEROOM" -dt "string";
	addAttr -ci true -sn "DAVEHULLFLIPPED" -ln "DAVEHULLFLIPPED" -dt "string";
	setAttr ".t" -type "double3" 0.9221492566869206 1.5 -3 ;
	setAttr ".s" -type "double3" 0.025 3 2 ;
	setAttr ".rp" -type "double3" 0 -1.5 0 ;
	setAttr ".sp" -type "double3" 0 -0.5 0 ;
	setAttr ".spt" -type "double3" 0 -1 0 ;
	setAttr ".DAVEHASH" -type "string" "tzWV5GP2";
	setAttr ".DAVETAG" -type "string" "WALL";
	setAttr ".DAVEBUILDING" -type "string" "0";
	setAttr ".DAVEROOM" -type "string" "1";
	setAttr ".DAVEHULLFLIPPED" -type "string" "False";
createNode mesh -n "eShape" -p "e";
	rename -uid "3BEE117C-498B-917F-076B-51BFABF37650";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "e1" -p "group2";
	rename -uid "FAFDCD94-4BF2-A4F6-3F00-D8B66EFA080E";
	addAttr -ci true -sn "DAVEHASH" -ln "DAVEHASH" -dt "string";
	addAttr -ci true -sn "DAVETAG" -ln "DAVETAG" -dt "string";
	addAttr -ci true -sn "DAVEBUILDING" -ln "DAVEBUILDING" -dt "string";
	addAttr -ci true -sn "DAVEROOM" -ln "DAVEROOM" -dt "string";
	addAttr -ci true -sn "DAVEHULLFLIPPED" -ln "DAVEHULLFLIPPED" -dt "string";
	setAttr ".t" -type "double3" 1.9221492566869203 1.5 -4 ;
	setAttr ".r" -type "double3" 0 450 0 ;
	setAttr ".s" -type "double3" 0.025 3 2 ;
	setAttr ".rp" -type "double3" 0 -1.5 0 ;
	setAttr ".sp" -type "double3" 0 -0.5 0 ;
	setAttr ".spt" -type "double3" 0 -1 0 ;
	setAttr ".DAVEHASH" -type "string" "XJRz6rhJ";
	setAttr ".DAVETAG" -type "string" "WALL";
	setAttr ".DAVEBUILDING" -type "string" "0";
	setAttr ".DAVEROOM" -type "string" "1";
	setAttr ".DAVEHULLFLIPPED" -type "string" "False";
createNode mesh -n "eShape1" -p "e1";
	rename -uid "1A27E598-4205-983A-534B-1098A7A83B65";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "e2" -p "group2";
	rename -uid "BAC8B77C-4399-F3F7-A346-01824EAFE4EC";
	addAttr -ci true -sn "DAVEHASH" -ln "DAVEHASH" -dt "string";
	addAttr -ci true -sn "DAVETAG" -ln "DAVETAG" -dt "string";
	addAttr -ci true -sn "DAVEBUILDING" -ln "DAVEBUILDING" -dt "string";
	addAttr -ci true -sn "DAVEROOM" -ln "DAVEROOM" -dt "string";
	addAttr -ci true -sn "DAVEHULLFLIPPED" -ln "DAVEHULLFLIPPED" -dt "string";
	setAttr ".t" -type "double3" 3.9221492566869198 1.5 -4 ;
	setAttr ".r" -type "double3" 0 450 0 ;
	setAttr ".s" -type "double3" 0.025 3 2 ;
	setAttr ".rp" -type "double3" 0 -1.5 0 ;
	setAttr ".sp" -type "double3" 0 -0.5 0 ;
	setAttr ".spt" -type "double3" 0 -1 0 ;
	setAttr ".DAVEHASH" -type "string" "bwfY8sF7";
	setAttr ".DAVETAG" -type "string" "WALL";
	setAttr ".DAVEBUILDING" -type "string" "0";
	setAttr ".DAVEROOM" -type "string" "1";
	setAttr ".DAVEHULLFLIPPED" -type "string" "False";
createNode mesh -n "eShape2" -p "e2";
	rename -uid "C43BB664-4505-FC1C-8CAA-3C9C22307D35";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "e3" -p "group2";
	rename -uid "A97C66FC-4BE8-3EB6-98A2-85A7AF51F1F5";
	addAttr -ci true -sn "DAVEHASH" -ln "DAVEHASH" -dt "string";
	addAttr -ci true -sn "DAVETAG" -ln "DAVETAG" -dt "string";
	addAttr -ci true -sn "DAVEBUILDING" -ln "DAVEBUILDING" -dt "string";
	addAttr -ci true -sn "DAVEROOM" -ln "DAVEROOM" -dt "string";
	addAttr -ci true -sn "DAVEHULLFLIPPED" -ln "DAVEHULLFLIPPED" -dt "string";
	setAttr ".t" -type "double3" 4.9221492566869198 1.5 -1 ;
	setAttr ".r" -type "double3" 0 360.00000000000006 0 ;
	setAttr ".s" -type "double3" 0.025 3 2 ;
	setAttr ".rp" -type "double3" 0 -1.5 0 ;
	setAttr ".sp" -type "double3" 0 -0.5 0 ;
	setAttr ".spt" -type "double3" 0 -1 0 ;
	setAttr ".DAVEHASH" -type "string" "vCmx9XuJ";
	setAttr ".DAVETAG" -type "string" "WALL";
	setAttr ".DAVEBUILDING" -type "string" "0";
	setAttr ".DAVEROOM" -type "string" "1";
	setAttr ".DAVEHULLFLIPPED" -type "string" "False";
createNode mesh -n "eShape3" -p "e3";
	rename -uid "4B65901C-4724-77D4-F2E3-5C9B234B7543";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "e4" -p "group2";
	rename -uid "DEE22CC8-4424-5EB9-5F5C-9BB4A1DA6AE4";
	addAttr -ci true -sn "DAVEHASH" -ln "DAVEHASH" -dt "string";
	addAttr -ci true -sn "DAVETAG" -ln "DAVETAG" -dt "string";
	addAttr -ci true -sn "DAVEBUILDING" -ln "DAVEBUILDING" -dt "string";
	addAttr -ci true -sn "DAVEROOM" -ln "DAVEROOM" -dt "string";
	addAttr -ci true -sn "DAVEHULLFLIPPED" -ln "DAVEHULLFLIPPED" -dt "string";
	setAttr ".t" -type "double3" 4.9221492566869198 1.5 -3 ;
	setAttr ".r" -type "double3" 0 540 0 ;
	setAttr ".s" -type "double3" 0.025 3 2 ;
	setAttr ".rp" -type "double3" 0 -1.5 0 ;
	setAttr ".sp" -type "double3" 0 -0.5 0 ;
	setAttr ".spt" -type "double3" 0 -1 0 ;
	setAttr ".DAVEHASH" -type "string" "UxS5ErIK";
	setAttr ".DAVETAG" -type "string" "WALL";
	setAttr ".DAVEBUILDING" -type "string" "0";
	setAttr ".DAVEROOM" -type "string" "1";
	setAttr ".DAVEHULLFLIPPED" -type "string" "False";
createNode mesh -n "eShape4" -p "e4";
	rename -uid "1D35B47F-4A4E-7DC6-8190-5EB4A427A853";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "e5" -p "group2";
	rename -uid "163497B5-4DBC-2B66-AA37-07AC3B6B7B9F";
	addAttr -ci true -sn "DAVEHASH" -ln "DAVEHASH" -dt "string";
	addAttr -ci true -sn "DAVETAG" -ln "DAVETAG" -dt "string";
	addAttr -ci true -sn "DAVEBUILDING" -ln "DAVEBUILDING" -dt "string";
	addAttr -ci true -sn "DAVEROOM" -ln "DAVEROOM" -dt "string";
	addAttr -ci true -sn "DAVEHULLFLIPPED" -ln "DAVEHULLFLIPPED" -dt "string";
	setAttr ".t" -type "double3" 3.9221492566869198 1.5 0 ;
	setAttr ".r" -type "double3" 0 450 0 ;
	setAttr ".s" -type "double3" 0.025 3 2 ;
	setAttr ".rp" -type "double3" 0 -1.5 0 ;
	setAttr ".sp" -type "double3" 0 -0.5 0 ;
	setAttr ".spt" -type "double3" 0 -1 0 ;
	setAttr ".DAVEHASH" -type "string" "lAJoDRjE";
	setAttr ".DAVETAG" -type "string" "WALL";
	setAttr ".DAVEBUILDING" -type "string" "0";
	setAttr ".DAVEROOM" -type "string" "1";
	setAttr ".DAVEHULLFLIPPED" -type "string" "False";
createNode mesh -n "eShape5" -p "e5";
	rename -uid "8AD5C25B-4859-CEC9-1A6B-C78A93C365EF";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "e6" -p "group2";
	rename -uid "A8610FD2-4D4A-2457-12BD-E3AC5DA405BC";
	addAttr -ci true -sn "DAVEHASH" -ln "DAVEHASH" -dt "string";
	addAttr -ci true -sn "DAVETAG" -ln "DAVETAG" -dt "string";
	addAttr -ci true -sn "DAVEBUILDING" -ln "DAVEBUILDING" -dt "string";
	addAttr -ci true -sn "DAVEROOM" -ln "DAVEROOM" -dt "string";
	addAttr -ci true -sn "DAVEHULLFLIPPED" -ln "DAVEHULLFLIPPED" -dt "string";
	setAttr ".t" -type "double3" 1.9221492566869203 1.5 0 ;
	setAttr ".r" -type "double3" 0 450 0 ;
	setAttr ".s" -type "double3" 0.025 3 2 ;
	setAttr ".rp" -type "double3" 0 -1.5 0 ;
	setAttr ".sp" -type "double3" 0 -0.5 0 ;
	setAttr ".spt" -type "double3" 0 -1 0 ;
	setAttr ".DAVEHASH" -type "string" "1_tCkeaY";
	setAttr ".DAVETAG" -type "string" "WALL";
	setAttr ".DAVEBUILDING" -type "string" "0";
	setAttr ".DAVEROOM" -type "string" "1";
	setAttr ".DAVEHULLFLIPPED" -type "string" "False";
createNode mesh -n "eShape6" -p "e6";
	rename -uid "9A4C8A87-4AB4-2356-D3CC-9CB00C1E04A3";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "doorWaye" -p "group2";
	rename -uid "369D4C9A-45EC-DA08-D78E-D9B9D5261080";
	addAttr -ci true -sn "DAVEHASH" -ln "DAVEHASH" -dt "string";
	addAttr -ci true -sn "DAVETAG" -ln "DAVETAG" -dt "string";
	addAttr -ci true -sn "DAVEBUILDING" -ln "DAVEBUILDING" -dt "string";
	addAttr -ci true -sn "DAVEROOM" -ln "DAVEROOM" -dt "string";
	addAttr -ci true -sn "DAVEHULLFLIPPED" -ln "DAVEHULLFLIPPED" -dt "string";
	setAttr ".t" -type "double3" 0.9221492566869206 1.5 -1 ;
	setAttr ".s" -type "double3" 0.025 3 2 ;
	setAttr ".rp" -type "double3" 0 -1.5 0 ;
	setAttr ".sp" -type "double3" 0 -0.5 0 ;
	setAttr ".spt" -type "double3" 0 -1 0 ;
	setAttr ".DAVEHASH" -type "string" "NO2LFqW0";
	setAttr ".DAVETAG" -type "string" "DOOR";
	setAttr ".DAVEBUILDING" -type "string" "0";
	setAttr ".DAVEROOM" -type "string" "1";
	setAttr ".DAVEHULLFLIPPED" -type "string" "False";
createNode mesh -n "doorWayeShape" -p "doorWaye";
	rename -uid "23145ECF-4437-12D1-CF13-AC877A1AB41F";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 1 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 46 ".uvst[0].uvsp[0:45]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25 0.25 0.25 0.375 0.375 0.625 0.375 0.75 0.25 0.33749998
		 0.25 0.375 0.28749999 0.625 0.28749999 0.66250002 0.25 0.64375001 0.48124999 0.35624999
		 0.48124999 0.26875001 0.39375001 0.73125005 0.39375001 0.625 0.46250001 0.83750004
		 0.25 0.16249999 0.25 0.375 0.46250001 0.375 0.2 0.625 0.2 0.83125001 0.1 0.75 0.2
		 0.41875002 0.1 0.625 0.55000001 0.875 0.2 0.125 0.2 0.375 0.55000001 0.081249997
		 0.60000002 0.25 0.2 0.66874999 0.60000002 0 0 0 1 1 0 1 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 28 ".vt[0:27]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5 -0.5 0.5 0 0.5 0.5 0 -0.5 0.5 0.34999999
		 0.5 0.5 0.34999999 0.5 -0.5 0.34999999 -0.5 -0.5 0.34999999 -0.5 -0.5 -0.34999999
		 0.5 -0.5 -0.34999999 0.5 0.5 -0.34999999 -0.5 0.5 -0.34999999 -0.5 0.30000001 0.5
		 0.5 0.30000001 0.5 0.5 0.30000001 0.34999999 0.5 0.30000001 0 0.5 0.30000001 -0.34999999
		 0.5 0.30000001 -0.5 -0.5 0.30000001 -0.5 -0.5 0.30000001 -0.34999999 -0.5 0.30000001 0
		 -0.5 0.30000001 0.34999999;
	setAttr -s 52 ".ed[0:51]"  0 1 0 2 3 0 4 5 0 6 7 0 0 18 0 1 19 0 2 10 0
		 3 11 0 4 24 0 5 23 0 6 14 0 7 15 0 8 17 0 9 16 0 8 9 1 9 21 1 10 8 0 11 9 0 12 1 0
		 13 0 0 10 11 1 11 20 1 12 13 0 13 27 0 16 5 0 17 4 0 14 15 0 15 22 0 16 17 1 17 25 1
		 18 2 0 19 3 0 20 12 0 22 16 1 23 7 0 24 6 0 25 14 0 26 8 1 27 10 1 18 19 1 19 20 1
		 20 21 0 21 22 0 22 23 1 23 24 1 24 25 1 25 26 0 26 27 0 27 18 1 20 27 0 21 26 0 22 25 0;
	setAttr -s 26 -ch 104 ".fc[0:25]" -type "polyFaces" 
		f 4 39 31 -2 -31
		mu 0 4 30 31 3 2
		f 4 14 13 28 -13
		mu 0 4 15 16 26 29
		f 4 2 9 44 -9
		mu 0 4 4 5 35 38
		f 4 15 42 33 -14
		mu 0 4 17 33 34 27
		f 4 29 46 37 12
		mu 0 4 28 39 40 14
		f 4 20 17 -15 -17
		mu 0 4 19 20 16 15
		f 4 21 41 -16 -18
		mu 0 4 21 32 33 17
		f 4 -38 47 38 16
		mu 0 4 14 40 41 18
		f 4 1 7 -21 -7
		mu 0 4 2 3 20 19
		f 4 40 -22 -8 -32
		mu 0 4 31 32 21 3
		f 4 -23 18 -1 -20
		mu 0 4 23 22 9 8
		f 4 -39 48 30 6
		mu 0 4 18 41 30 2
		f 4 3 11 -27 -11
		mu 0 4 6 7 25 24
		f 4 -34 43 -10 -25
		mu 0 4 27 34 36 11
		f 4 -29 24 -3 -26
		mu 0 4 29 26 5 4
		f 4 45 -30 25 8
		mu 0 4 37 39 28 13
		f 4 0 5 -40 -5
		mu 0 4 0 1 31 30
		f 4 -19 -33 -41 -6
		mu 0 4 1 22 32 31
		f 4 -44 -28 -12 -35
		mu 0 4 36 34 25 10
		f 4 -45 34 -4 -36
		mu 0 4 38 35 7 6
		f 4 10 -37 -46 35
		mu 0 4 12 24 39 37
		f 4 -49 -24 19 4
		mu 0 4 30 41 23 0
		f 4 -42 49 -48 -51
		mu 0 4 42 32 41 43
		f 4 -43 50 -47 -52
		mu 0 4 34 44 45 39
		f 4 27 51 36 26
		mu 0 4 25 34 39 24
		f 4 23 -50 32 22
		mu 0 4 23 41 32 22;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "group3";
	rename -uid "1C888EC3-4FC0-DB6B-13D7-139214EE46C1";
createNode transform -n "a" -p "group3";
	rename -uid "8155CB14-4444-60DF-E9B1-E9B9DFE3D997";
	addAttr -ci true -sn "DAVEHASH" -ln "DAVEHASH" -dt "string";
	addAttr -ci true -sn "DAVETAG" -ln "DAVETAG" -dt "string";
	addAttr -ci true -sn "DAVEBUILDING" -ln "DAVEBUILDING" -dt "string";
	addAttr -ci true -sn "DAVEROOM" -ln "DAVEROOM" -dt "string";
	addAttr -ci true -sn "DAVEHULLFLIPPED" -ln "DAVEHULLFLIPPED" -dt "string";
	setAttr ".t" -type "double3" 0.9221492566869206 4.5 -3 ;
	setAttr ".s" -type "double3" 0.025 3 2 ;
	setAttr ".rp" -type "double3" 0 -1.5 0 ;
	setAttr ".sp" -type "double3" 0 -0.5 0 ;
	setAttr ".spt" -type "double3" 0 -1 0 ;
	setAttr ".DAVEHASH" -type "string" "J4ap8gf_";
	setAttr ".DAVETAG" -type "string" "WALL";
	setAttr ".DAVEBUILDING" -type "string" "0";
	setAttr ".DAVEROOM" -type "string" "0";
	setAttr ".DAVEHULLFLIPPED" -type "string" "False";
createNode mesh -n "aShape" -p "a";
	rename -uid "40E0B2CF-4F3C-359A-27E9-FBB2BDC9B3F6";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "doorWaya" -p "group3";
	rename -uid "25E50AAC-4586-97FE-B866-488E7767F021";
	addAttr -ci true -sn "DAVEHASH" -ln "DAVEHASH" -dt "string";
	addAttr -ci true -sn "DAVETAG" -ln "DAVETAG" -dt "string";
	addAttr -ci true -sn "DAVEBUILDING" -ln "DAVEBUILDING" -dt "string";
	addAttr -ci true -sn "DAVEROOM" -ln "DAVEROOM" -dt "string";
	addAttr -ci true -sn "DAVEHULLFLIPPED" -ln "DAVEHULLFLIPPED" -dt "string";
	setAttr ".t" -type "double3" 0.9221492566869206 4.5 -1 ;
	setAttr ".s" -type "double3" 0.025 3 2 ;
	setAttr ".rp" -type "double3" 0 -1.5 0 ;
	setAttr ".sp" -type "double3" 0 -0.5 0 ;
	setAttr ".spt" -type "double3" 0 -1 0 ;
	setAttr ".DAVEHASH" -type "string" "CJxBn_xQ";
	setAttr ".DAVETAG" -type "string" "DOOR";
	setAttr ".DAVEBUILDING" -type "string" "0";
	setAttr ".DAVEROOM" -type "string" "0";
	setAttr ".DAVEHULLFLIPPED" -type "string" "False";
createNode mesh -n "doorWayaShape" -p "doorWaya";
	rename -uid "8B69FEA9-422E-C0C3-44A1-5BAD2A9590F2";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 1 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 46 ".uvst[0].uvsp[0:45]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25 0.25 0.25 0.375 0.375 0.625 0.375 0.75 0.25 0.33749998
		 0.25 0.375 0.28749999 0.625 0.28749999 0.66250002 0.25 0.64375001 0.48124999 0.35624999
		 0.48124999 0.26875001 0.39375001 0.73125005 0.39375001 0.625 0.46250001 0.83750004
		 0.25 0.16249999 0.25 0.375 0.46250001 0.375 0.2 0.625 0.2 0.83125001 0.1 0.75 0.2
		 0.41875002 0.1 0.625 0.55000001 0.875 0.2 0.125 0.2 0.375 0.55000001 0.081249997
		 0.60000002 0.25 0.2 0.66874999 0.60000002 0 0 0 1 1 0 1 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 28 ".vt[0:27]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5 -0.5 0.5 0 0.5 0.5 0 -0.5 0.5 0.34999999
		 0.5 0.5 0.34999999 0.5 -0.5 0.34999999 -0.5 -0.5 0.34999999 -0.5 -0.5 -0.34999999
		 0.5 -0.5 -0.34999999 0.5 0.5 -0.34999999 -0.5 0.5 -0.34999999 -0.5 0.30000001 0.5
		 0.5 0.30000001 0.5 0.5 0.30000001 0.34999999 0.5 0.30000001 0 0.5 0.30000001 -0.34999999
		 0.5 0.30000001 -0.5 -0.5 0.30000001 -0.5 -0.5 0.30000001 -0.34999999 -0.5 0.30000001 0
		 -0.5 0.30000001 0.34999999;
	setAttr -s 52 ".ed[0:51]"  0 1 0 2 3 0 4 5 0 6 7 0 0 18 0 1 19 0 2 10 0
		 3 11 0 4 24 0 5 23 0 6 14 0 7 15 0 8 17 0 9 16 0 8 9 1 9 21 1 10 8 0 11 9 0 12 1 0
		 13 0 0 10 11 1 11 20 1 12 13 0 13 27 0 16 5 0 17 4 0 14 15 0 15 22 0 16 17 1 17 25 1
		 18 2 0 19 3 0 20 12 0 22 16 1 23 7 0 24 6 0 25 14 0 26 8 1 27 10 1 18 19 1 19 20 1
		 20 21 0 21 22 0 22 23 1 23 24 1 24 25 1 25 26 0 26 27 0 27 18 1 20 27 0 21 26 0 22 25 0;
	setAttr -s 26 -ch 104 ".fc[0:25]" -type "polyFaces" 
		f 4 39 31 -2 -31
		mu 0 4 30 31 3 2
		f 4 14 13 28 -13
		mu 0 4 15 16 26 29
		f 4 2 9 44 -9
		mu 0 4 4 5 35 38
		f 4 15 42 33 -14
		mu 0 4 17 33 34 27
		f 4 29 46 37 12
		mu 0 4 28 39 40 14
		f 4 20 17 -15 -17
		mu 0 4 19 20 16 15
		f 4 21 41 -16 -18
		mu 0 4 21 32 33 17
		f 4 -38 47 38 16
		mu 0 4 14 40 41 18
		f 4 1 7 -21 -7
		mu 0 4 2 3 20 19
		f 4 40 -22 -8 -32
		mu 0 4 31 32 21 3
		f 4 -23 18 -1 -20
		mu 0 4 23 22 9 8
		f 4 -39 48 30 6
		mu 0 4 18 41 30 2
		f 4 3 11 -27 -11
		mu 0 4 6 7 25 24
		f 4 -34 43 -10 -25
		mu 0 4 27 34 36 11
		f 4 -29 24 -3 -26
		mu 0 4 29 26 5 4
		f 4 45 -30 25 8
		mu 0 4 37 39 28 13
		f 4 0 5 -40 -5
		mu 0 4 0 1 31 30
		f 4 -19 -33 -41 -6
		mu 0 4 1 22 32 31
		f 4 -44 -28 -12 -35
		mu 0 4 36 34 25 10
		f 4 -45 34 -4 -36
		mu 0 4 38 35 7 6
		f 4 10 -37 -46 35
		mu 0 4 12 24 39 37
		f 4 -49 -24 19 4
		mu 0 4 30 41 23 0
		f 4 -42 49 -48 -51
		mu 0 4 42 32 41 43
		f 4 -43 50 -47 -52
		mu 0 4 34 44 45 39
		f 4 27 51 36 26
		mu 0 4 25 34 39 24
		f 4 23 -50 32 22
		mu 0 4 23 41 32 22;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "a1" -p "group3";
	rename -uid "36342696-4E0B-C1EB-81C6-CCBA51B033EF";
	addAttr -ci true -sn "DAVEHASH" -ln "DAVEHASH" -dt "string";
	addAttr -ci true -sn "DAVETAG" -ln "DAVETAG" -dt "string";
	addAttr -ci true -sn "DAVEBUILDING" -ln "DAVEBUILDING" -dt "string";
	addAttr -ci true -sn "DAVEROOM" -ln "DAVEROOM" -dt "string";
	addAttr -ci true -sn "DAVEHULLFLIPPED" -ln "DAVEHULLFLIPPED" -dt "string";
	setAttr ".t" -type "double3" 4.9221492566869198 4.5 -1 ;
	setAttr ".r" -type "double3" 0 360.00000000000006 0 ;
	setAttr ".s" -type "double3" 0.025 3 2 ;
	setAttr ".rp" -type "double3" 0 -1.5 0 ;
	setAttr ".sp" -type "double3" 0 -0.5 0 ;
	setAttr ".spt" -type "double3" 0 -1 0 ;
	setAttr ".DAVEHASH" -type "string" "MmCjUKPz";
	setAttr ".DAVETAG" -type "string" "WALL";
	setAttr ".DAVEBUILDING" -type "string" "0";
	setAttr ".DAVEROOM" -type "string" "0";
	setAttr ".DAVEHULLFLIPPED" -type "string" "False";
createNode mesh -n "aShape1" -p "a1";
	rename -uid "AD7D3B34-46A3-577E-9974-9AA4977F1D4F";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "a2" -p "group3";
	rename -uid "769FC8EE-453A-8215-8B27-E9BA47A4E57A";
	addAttr -ci true -sn "DAVEHASH" -ln "DAVEHASH" -dt "string";
	addAttr -ci true -sn "DAVETAG" -ln "DAVETAG" -dt "string";
	addAttr -ci true -sn "DAVEBUILDING" -ln "DAVEBUILDING" -dt "string";
	addAttr -ci true -sn "DAVEROOM" -ln "DAVEROOM" -dt "string";
	addAttr -ci true -sn "DAVEHULLFLIPPED" -ln "DAVEHULLFLIPPED" -dt "string";
	setAttr ".t" -type "double3" 4.9221492566869198 4.5 -3 ;
	setAttr ".r" -type "double3" 0 540 0 ;
	setAttr ".s" -type "double3" 0.025 3 2 ;
	setAttr ".rp" -type "double3" 0 -1.5 0 ;
	setAttr ".sp" -type "double3" 0 -0.5 0 ;
	setAttr ".spt" -type "double3" 0 -1 0 ;
	setAttr ".DAVEHASH" -type "string" "wjrMaF1u";
	setAttr ".DAVETAG" -type "string" "WALL";
	setAttr ".DAVEBUILDING" -type "string" "0";
	setAttr ".DAVEROOM" -type "string" "0";
	setAttr ".DAVEHULLFLIPPED" -type "string" "False";
createNode mesh -n "aShape2" -p "a2";
	rename -uid "739AE244-4C16-E97E-F0D3-3399619F2A77";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "a3" -p "group3";
	rename -uid "574848D4-434E-FACE-1287-478D1CD2C1F2";
	addAttr -ci true -sn "DAVEHASH" -ln "DAVEHASH" -dt "string";
	addAttr -ci true -sn "DAVETAG" -ln "DAVETAG" -dt "string";
	addAttr -ci true -sn "DAVEBUILDING" -ln "DAVEBUILDING" -dt "string";
	addAttr -ci true -sn "DAVEROOM" -ln "DAVEROOM" -dt "string";
	addAttr -ci true -sn "DAVEHULLFLIPPED" -ln "DAVEHULLFLIPPED" -dt "string";
	setAttr ".t" -type "double3" 3.9221492566869198 4.5 -4 ;
	setAttr ".r" -type "double3" 0 450 0 ;
	setAttr ".s" -type "double3" 0.025 3 2 ;
	setAttr ".rp" -type "double3" 0 -1.5 0 ;
	setAttr ".sp" -type "double3" 0 -0.5 0 ;
	setAttr ".spt" -type "double3" 0 -1 0 ;
	setAttr ".DAVEHASH" -type "string" "UGhQVQ_2";
	setAttr ".DAVETAG" -type "string" "WALL";
	setAttr ".DAVEBUILDING" -type "string" "0";
	setAttr ".DAVEROOM" -type "string" "0";
	setAttr ".DAVEHULLFLIPPED" -type "string" "False";
createNode mesh -n "aShape3" -p "a3";
	rename -uid "42513ACF-46A5-E70F-264E-46AB03E639A4";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "a4" -p "group3";
	rename -uid "768FE247-4482-0C5C-D187-D2B7CC7CAA3E";
	addAttr -ci true -sn "DAVEHASH" -ln "DAVEHASH" -dt "string";
	addAttr -ci true -sn "DAVETAG" -ln "DAVETAG" -dt "string";
	addAttr -ci true -sn "DAVEBUILDING" -ln "DAVEBUILDING" -dt "string";
	addAttr -ci true -sn "DAVEROOM" -ln "DAVEROOM" -dt "string";
	addAttr -ci true -sn "DAVEHULLFLIPPED" -ln "DAVEHULLFLIPPED" -dt "string";
	setAttr ".t" -type "double3" 1.9221492566869203 4.5 -4 ;
	setAttr ".r" -type "double3" 0 450 0 ;
	setAttr ".s" -type "double3" 0.025 3 2 ;
	setAttr ".rp" -type "double3" 0 -1.5 0 ;
	setAttr ".sp" -type "double3" 0 -0.5 0 ;
	setAttr ".spt" -type "double3" 0 -1 0 ;
	setAttr ".DAVEHASH" -type "string" "bYLNOU17";
	setAttr ".DAVETAG" -type "string" "WALL";
	setAttr ".DAVEBUILDING" -type "string" "0";
	setAttr ".DAVEROOM" -type "string" "0";
	setAttr ".DAVEHULLFLIPPED" -type "string" "False";
createNode mesh -n "aShape4" -p "a4";
	rename -uid "907810A6-4435-11A2-4CEA-1B8CFB27DD77";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "a5" -p "group3";
	rename -uid "7164D459-47BD-06B3-3BFF-9B815F9411BB";
	addAttr -ci true -sn "DAVEHASH" -ln "DAVEHASH" -dt "string";
	addAttr -ci true -sn "DAVETAG" -ln "DAVETAG" -dt "string";
	addAttr -ci true -sn "DAVEBUILDING" -ln "DAVEBUILDING" -dt "string";
	addAttr -ci true -sn "DAVEROOM" -ln "DAVEROOM" -dt "string";
	addAttr -ci true -sn "DAVEHULLFLIPPED" -ln "DAVEHULLFLIPPED" -dt "string";
	setAttr ".t" -type "double3" 3.9221492566869198 4.5 0 ;
	setAttr ".r" -type "double3" 0 450 0 ;
	setAttr ".s" -type "double3" 0.025 3 2 ;
	setAttr ".rp" -type "double3" 0 -1.5 0 ;
	setAttr ".sp" -type "double3" 0 -0.5 0 ;
	setAttr ".spt" -type "double3" 0 -1 0 ;
	setAttr ".DAVEHASH" -type "string" "xfhoAfJ7";
	setAttr ".DAVETAG" -type "string" "WALL";
	setAttr ".DAVEBUILDING" -type "string" "0";
	setAttr ".DAVEROOM" -type "string" "0";
	setAttr ".DAVEHULLFLIPPED" -type "string" "False";
createNode mesh -n "aShape5" -p "a5";
	rename -uid "0C65D3D4-4A9F-E7C3-FF77-D58688C66D99";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "a6" -p "group3";
	rename -uid "9DFC40BF-4BB0-8814-1F47-C8A5BFE48E89";
	addAttr -ci true -sn "DAVEHASH" -ln "DAVEHASH" -dt "string";
	addAttr -ci true -sn "DAVETAG" -ln "DAVETAG" -dt "string";
	addAttr -ci true -sn "DAVEBUILDING" -ln "DAVEBUILDING" -dt "string";
	addAttr -ci true -sn "DAVEROOM" -ln "DAVEROOM" -dt "string";
	addAttr -ci true -sn "DAVEHULLFLIPPED" -ln "DAVEHULLFLIPPED" -dt "string";
	setAttr ".t" -type "double3" 1.9221492566869203 4.5 0 ;
	setAttr ".r" -type "double3" 0 450 0 ;
	setAttr ".s" -type "double3" 0.025 3 2 ;
	setAttr ".rp" -type "double3" 0 -1.5 0 ;
	setAttr ".sp" -type "double3" 0 -0.5 0 ;
	setAttr ".spt" -type "double3" 0 -1 0 ;
	setAttr ".DAVEHASH" -type "string" "10LlHZ1U";
	setAttr ".DAVETAG" -type "string" "WALL";
	setAttr ".DAVEBUILDING" -type "string" "0";
	setAttr ".DAVEROOM" -type "string" "0";
	setAttr ".DAVEHULLFLIPPED" -type "string" "False";
createNode mesh -n "aShape6" -p "a6";
	rename -uid "D3B1CF02-4BE2-851E-627E-62AB4519F382";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "group4";
	rename -uid "4173574F-4A67-245F-8EFC-71BAAE0F98E1";
createNode transform -n "s" -p "group4";
	rename -uid "308E9897-439F-E008-A008-0783B59650A3";
	addAttr -ci true -sn "DAVEHASH" -ln "DAVEHASH" -dt "string";
	addAttr -ci true -sn "DAVETAG" -ln "DAVETAG" -dt "string";
	addAttr -ci true -sn "DAVEBUILDING" -ln "DAVEBUILDING" -dt "string";
	addAttr -ci true -sn "DAVEROOM" -ln "DAVEROOM" -dt "string";
	addAttr -ci true -sn "DAVEHULLFLIPPED" -ln "DAVEHULLFLIPPED" -dt "string";
	setAttr ".t" -type "double3" 1.0000000000000002 1.500000000000004 1.2555634313473512 ;
	setAttr ".r" -type "double3" 0 360.00000000000006 0 ;
	setAttr ".s" -type "double3" 0.025 3 2 ;
	setAttr ".rp" -type "double3" 5.4392046422435666e-15 -1.500000000000004 0 ;
	setAttr ".rpt" -type "double3" -5.4747317790315677e-15 0 5.7638923806519843e-15 ;
	setAttr ".sp" -type "double3" 0 -0.5 0 ;
	setAttr ".spt" -type "double3" 5.6843418860808018e-15 -1.0000000000000047 0 ;
	setAttr ".DAVEHASH" -type "string" "TecUjAQe";
	setAttr ".DAVETAG" -type "string" "WALL";
	setAttr ".DAVEBUILDING" -type "string" "1";
	setAttr ".DAVEROOM" -type "string" "0";
	setAttr ".DAVEHULLFLIPPED" -type "string" "False";
createNode mesh -n "sShape" -p "s";
	rename -uid "C2C329B9-4FB4-DF5B-83FF-908CE36ECCB4";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "s1" -p "group4";
	rename -uid "11D43602-4BD8-3CEB-C33C-4F84994E33D8";
	addAttr -ci true -sn "DAVEHASH" -ln "DAVEHASH" -dt "string";
	addAttr -ci true -sn "DAVETAG" -ln "DAVETAG" -dt "string";
	addAttr -ci true -sn "DAVEBUILDING" -ln "DAVEBUILDING" -dt "string";
	addAttr -ci true -sn "DAVEROOM" -ln "DAVEROOM" -dt "string";
	addAttr -ci true -sn "DAVEHULLFLIPPED" -ln "DAVEHULLFLIPPED" -dt "string";
	setAttr ".t" -type "double3" 4 1.5 6.2555634313473574 ;
	setAttr ".r" -type "double3" 0 270.00000000000006 0 ;
	setAttr ".s" -type "double3" 0.025 3 2 ;
	setAttr ".rp" -type "double3" 0 -1.5 0 ;
	setAttr ".sp" -type "double3" 0 -0.5 0 ;
	setAttr ".spt" -type "double3" 0 -1 0 ;
	setAttr ".DAVEHASH" -type "string" "CBam9Usg";
	setAttr ".DAVETAG" -type "string" "WALL";
	setAttr ".DAVEBUILDING" -type "string" "1";
	setAttr ".DAVEROOM" -type "string" "0";
	setAttr ".DAVEHULLFLIPPED" -type "string" "False";
createNode mesh -n "sShape1" -p "s1";
	rename -uid "59784005-46E3-2F1D-F39B-78A4A7D5DC8C";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "s2" -p "group4";
	rename -uid "EC3F805B-4B43-B2E8-6D33-62B8923731FE";
	addAttr -ci true -sn "DAVEHASH" -ln "DAVEHASH" -dt "string";
	addAttr -ci true -sn "DAVETAG" -ln "DAVETAG" -dt "string";
	addAttr -ci true -sn "DAVEBUILDING" -ln "DAVEBUILDING" -dt "string";
	addAttr -ci true -sn "DAVEROOM" -ln "DAVEROOM" -dt "string";
	addAttr -ci true -sn "DAVEHULLFLIPPED" -ln "DAVEHULLFLIPPED" -dt "string";
	setAttr ".t" -type "double3" 6 1.5 0.27676771877515927 ;
	setAttr ".r" -type "double3" 0 450 0 ;
	setAttr ".s" -type "double3" 0.025 3 2 ;
	setAttr ".rp" -type "double3" 0 -1.5 0 ;
	setAttr ".sp" -type "double3" 0 -0.5 0 ;
	setAttr ".spt" -type "double3" 0 -1 0 ;
	setAttr ".DAVEHASH" -type "string" "ezzG5zzm";
	setAttr ".DAVETAG" -type "string" "WALL";
	setAttr ".DAVEBUILDING" -type "string" "1";
	setAttr ".DAVEROOM" -type "string" "0";
	setAttr ".DAVEHULLFLIPPED" -type "string" "False";
createNode mesh -n "sShape2" -p "s2";
	rename -uid "1CA61187-4320-4D94-A744-00BBE5E36D93";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "doorWays" -p "group4";
	rename -uid "8543AEC8-46C8-AF7E-7C07-199208E88091";
	addAttr -ci true -sn "DAVEHASH" -ln "DAVEHASH" -dt "string";
	addAttr -ci true -sn "DAVETAG" -ln "DAVETAG" -dt "string";
	addAttr -ci true -sn "DAVEBUILDING" -ln "DAVEBUILDING" -dt "string";
	addAttr -ci true -sn "DAVEROOM" -ln "DAVEROOM" -dt "string";
	addAttr -ci true -sn "DAVEHULLFLIPPED" -ln "DAVEHULLFLIPPED" -dt "string";
	setAttr ".t" -type "double3" 1 1.5 3.2555634313473569 ;
	setAttr ".s" -type "double3" 0.025 3 2 ;
	setAttr ".rp" -type "double3" 0 -1.5 0 ;
	setAttr ".sp" -type "double3" 0 -0.5 0 ;
	setAttr ".spt" -type "double3" 0 -1 0 ;
	setAttr ".DAVEHASH" -type "string" "rgRn_DIp";
	setAttr ".DAVETAG" -type "string" "DOOR";
	setAttr ".DAVEBUILDING" -type "string" "1";
	setAttr ".DAVEROOM" -type "string" "0";
	setAttr ".DAVEHULLFLIPPED" -type "string" "False";
createNode mesh -n "doorWaysShape" -p "doorWays";
	rename -uid "C5D179D3-4C0B-159A-6208-A2B485E51D5A";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 1 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 46 ".uvst[0].uvsp[0:45]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25 0.25 0.25 0.375 0.375 0.625 0.375 0.75 0.25 0.33749998
		 0.25 0.375 0.28749999 0.625 0.28749999 0.66250002 0.25 0.64375001 0.48124999 0.35624999
		 0.48124999 0.26875001 0.39375001 0.73125005 0.39375001 0.625 0.46250001 0.83750004
		 0.25 0.16249999 0.25 0.375 0.46250001 0.375 0.2 0.625 0.2 0.83125001 0.1 0.75 0.2
		 0.41875002 0.1 0.625 0.55000001 0.875 0.2 0.125 0.2 0.375 0.55000001 0.081249997
		 0.60000002 0.25 0.2 0.66874999 0.60000002 0 0 0 1 1 0 1 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 28 ".vt[0:27]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5 -0.5 0.5 0 0.5 0.5 0 -0.5 0.5 0.34999999
		 0.5 0.5 0.34999999 0.5 -0.5 0.34999999 -0.5 -0.5 0.34999999 -0.5 -0.5 -0.34999999
		 0.5 -0.5 -0.34999999 0.5 0.5 -0.34999999 -0.5 0.5 -0.34999999 -0.5 0.30000001 0.5
		 0.5 0.30000001 0.5 0.5 0.30000001 0.34999999 0.5 0.30000001 0 0.5 0.30000001 -0.34999999
		 0.5 0.30000001 -0.5 -0.5 0.30000001 -0.5 -0.5 0.30000001 -0.34999999 -0.5 0.30000001 0
		 -0.5 0.30000001 0.34999999;
	setAttr -s 52 ".ed[0:51]"  0 1 0 2 3 0 4 5 0 6 7 0 0 18 0 1 19 0 2 10 0
		 3 11 0 4 24 0 5 23 0 6 14 0 7 15 0 8 17 0 9 16 0 8 9 1 9 21 1 10 8 0 11 9 0 12 1 0
		 13 0 0 10 11 1 11 20 1 12 13 0 13 27 0 16 5 0 17 4 0 14 15 0 15 22 0 16 17 1 17 25 1
		 18 2 0 19 3 0 20 12 0 22 16 1 23 7 0 24 6 0 25 14 0 26 8 1 27 10 1 18 19 1 19 20 1
		 20 21 0 21 22 0 22 23 1 23 24 1 24 25 1 25 26 0 26 27 0 27 18 1 20 27 0 21 26 0 22 25 0;
	setAttr -s 26 -ch 104 ".fc[0:25]" -type "polyFaces" 
		f 4 39 31 -2 -31
		mu 0 4 30 31 3 2
		f 4 14 13 28 -13
		mu 0 4 15 16 26 29
		f 4 2 9 44 -9
		mu 0 4 4 5 35 38
		f 4 15 42 33 -14
		mu 0 4 17 33 34 27
		f 4 29 46 37 12
		mu 0 4 28 39 40 14
		f 4 20 17 -15 -17
		mu 0 4 19 20 16 15
		f 4 21 41 -16 -18
		mu 0 4 21 32 33 17
		f 4 -38 47 38 16
		mu 0 4 14 40 41 18
		f 4 1 7 -21 -7
		mu 0 4 2 3 20 19
		f 4 40 -22 -8 -32
		mu 0 4 31 32 21 3
		f 4 -23 18 -1 -20
		mu 0 4 23 22 9 8
		f 4 -39 48 30 6
		mu 0 4 18 41 30 2
		f 4 3 11 -27 -11
		mu 0 4 6 7 25 24
		f 4 -34 43 -10 -25
		mu 0 4 27 34 36 11
		f 4 -29 24 -3 -26
		mu 0 4 29 26 5 4
		f 4 45 -30 25 8
		mu 0 4 37 39 28 13
		f 4 0 5 -40 -5
		mu 0 4 0 1 31 30
		f 4 -19 -33 -41 -6
		mu 0 4 1 22 32 31
		f 4 -44 -28 -12 -35
		mu 0 4 36 34 25 10
		f 4 -45 34 -4 -36
		mu 0 4 38 35 7 6
		f 4 10 -37 -46 35
		mu 0 4 12 24 39 37
		f 4 -49 -24 19 4
		mu 0 4 30 41 23 0
		f 4 -42 49 -48 -51
		mu 0 4 42 32 41 43
		f 4 -43 50 -47 -52
		mu 0 4 34 44 45 39
		f 4 27 51 36 26
		mu 0 4 25 34 39 24
		f 4 23 -50 32 22
		mu 0 4 23 41 32 22;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "s3" -p "group4";
	rename -uid "D65D30C9-4E90-0B2F-461D-66AC2BDE74A8";
	addAttr -ci true -sn "DAVEHASH" -ln "DAVEHASH" -dt "string";
	addAttr -ci true -sn "DAVETAG" -ln "DAVETAG" -dt "string";
	addAttr -ci true -sn "DAVEBUILDING" -ln "DAVEBUILDING" -dt "string";
	addAttr -ci true -sn "DAVEROOM" -ln "DAVEROOM" -dt "string";
	addAttr -ci true -sn "DAVEHULLFLIPPED" -ln "DAVEHULLFLIPPED" -dt "string";
	setAttr ".t" -type "double3" 2 1.500000000000004 6.2555634313473512 ;
	setAttr ".r" -type "double3" 0 450 0 ;
	setAttr ".s" -type "double3" 0.025 3 2 ;
	setAttr ".rp" -type "double3" 5.4392046422435666e-15 -1.500000000000004 0 ;
	setAttr ".rpt" -type "double3" -5.4747317790315677e-15 0 5.7638923806519843e-15 ;
	setAttr ".sp" -type "double3" 0 -0.5 0 ;
	setAttr ".spt" -type "double3" 5.6843418860808018e-15 -1.0000000000000047 0 ;
	setAttr ".DAVEHASH" -type "string" "QsFiT9Bq";
	setAttr ".DAVETAG" -type "string" "WALL";
	setAttr ".DAVEBUILDING" -type "string" "1";
	setAttr ".DAVEROOM" -type "string" "0";
	setAttr ".DAVEHULLFLIPPED" -type "string" "False";
createNode mesh -n "sShape3" -p "s3";
	rename -uid "4AC40D77-4782-CD95-0927-82973904FBE4";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "s4" -p "group4";
	rename -uid "EB41E943-4EF1-A707-0934-E0891AFF7479";
	addAttr -ci true -sn "DAVEHASH" -ln "DAVEHASH" -dt "string";
	addAttr -ci true -sn "DAVETAG" -ln "DAVETAG" -dt "string";
	addAttr -ci true -sn "DAVEBUILDING" -ln "DAVEBUILDING" -dt "string";
	addAttr -ci true -sn "DAVEROOM" -ln "DAVEROOM" -dt "string";
	addAttr -ci true -sn "DAVEHULLFLIPPED" -ln "DAVEHULLFLIPPED" -dt "string";
	setAttr ".t" -type "double3" 1.0000000000000002 1.500000000000004 5.2555634313473512 ;
	setAttr ".r" -type "double3" 0 360.00000000000006 0 ;
	setAttr ".s" -type "double3" 0.025 3 2 ;
	setAttr ".rp" -type "double3" 5.4392046422435666e-15 -1.500000000000004 0 ;
	setAttr ".rpt" -type "double3" -5.4747317790315677e-15 0 5.7638923806519843e-15 ;
	setAttr ".sp" -type "double3" 0 -0.5 0 ;
	setAttr ".spt" -type "double3" 5.6843418860808018e-15 -1.0000000000000047 0 ;
	setAttr ".DAVEHASH" -type "string" "joJ37AUu";
	setAttr ".DAVETAG" -type "string" "WALL";
	setAttr ".DAVEBUILDING" -type "string" "1";
	setAttr ".DAVEROOM" -type "string" "0";
	setAttr ".DAVEHULLFLIPPED" -type "string" "False";
createNode mesh -n "sShape4" -p "s4";
	rename -uid "15EDEBC3-4D29-9B1E-5B3F-41A4559C9CDB";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "s5" -p "group4";
	rename -uid "DB7DD59E-40BF-EA23-5000-B29C8208AFBE";
	addAttr -ci true -sn "DAVEHASH" -ln "DAVEHASH" -dt "string";
	addAttr -ci true -sn "DAVETAG" -ln "DAVETAG" -dt "string";
	addAttr -ci true -sn "DAVEBUILDING" -ln "DAVEBUILDING" -dt "string";
	addAttr -ci true -sn "DAVEROOM" -ln "DAVEROOM" -dt "string";
	addAttr -ci true -sn "DAVEHULLFLIPPED" -ln "DAVEHULLFLIPPED" -dt "string";
	setAttr ".t" -type "double3" 7 1.5 1.2555634313473569 ;
	setAttr ".r" -type "double3" 0 360.00000000000006 0 ;
	setAttr ".s" -type "double3" 0.025 3 2 ;
	setAttr ".rp" -type "double3" 0 -1.5 0 ;
	setAttr ".sp" -type "double3" 0 -0.5 0 ;
	setAttr ".spt" -type "double3" 0 -1 0 ;
	setAttr ".DAVEHASH" -type "string" "ikSmg4tb";
	setAttr ".DAVETAG" -type "string" "WALL";
	setAttr ".DAVEBUILDING" -type "string" "1";
	setAttr ".DAVEROOM" -type "string" "0";
	setAttr ".DAVEHULLFLIPPED" -type "string" "False";
createNode mesh -n "sShape5" -p "s5";
	rename -uid "F14C6351-46C3-41BB-A377-EDA9C8ED1636";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "s6" -p "group4";
	rename -uid "A63D8A28-43F5-6300-6636-FA971D20CBEF";
	addAttr -ci true -sn "DAVEHASH" -ln "DAVEHASH" -dt "string";
	addAttr -ci true -sn "DAVETAG" -ln "DAVETAG" -dt "string";
	addAttr -ci true -sn "DAVEBUILDING" -ln "DAVEBUILDING" -dt "string";
	addAttr -ci true -sn "DAVEROOM" -ln "DAVEROOM" -dt "string";
	addAttr -ci true -sn "DAVEHULLFLIPPED" -ln "DAVEHULLFLIPPED" -dt "string";
	setAttr ".t" -type "double3" 7 1.5 3.2555634313473569 ;
	setAttr ".r" -type "double3" 0 360.00000000000006 0 ;
	setAttr ".s" -type "double3" 0.025 3 2 ;
	setAttr ".rp" -type "double3" 0 -1.5 0 ;
	setAttr ".sp" -type "double3" 0 -0.5 0 ;
	setAttr ".spt" -type "double3" 0 -1 0 ;
	setAttr ".DAVEHASH" -type "string" "9aJCixCi";
	setAttr ".DAVETAG" -type "string" "WALL";
	setAttr ".DAVEBUILDING" -type "string" "1";
	setAttr ".DAVEROOM" -type "string" "0";
	setAttr ".DAVEHULLFLIPPED" -type "string" "False";
createNode mesh -n "sShape6" -p "s6";
	rename -uid "01F2980B-4EF1-0F29-D998-0E87108C0372";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "s7" -p "group4";
	rename -uid "3885F5E0-49DC-DFCC-8A12-719192A70B76";
	addAttr -ci true -sn "DAVEHASH" -ln "DAVEHASH" -dt "string";
	addAttr -ci true -sn "DAVETAG" -ln "DAVETAG" -dt "string";
	addAttr -ci true -sn "DAVEBUILDING" -ln "DAVEBUILDING" -dt "string";
	addAttr -ci true -sn "DAVEROOM" -ln "DAVEROOM" -dt "string";
	addAttr -ci true -sn "DAVEHULLFLIPPED" -ln "DAVEHULLFLIPPED" -dt "string";
	setAttr ".t" -type "double3" 6 1.5 6.2555634313473574 ;
	setAttr ".r" -type "double3" 0 270.00000000000006 0 ;
	setAttr ".s" -type "double3" 0.025 3 2 ;
	setAttr ".rp" -type "double3" 0 -1.5 0 ;
	setAttr ".sp" -type "double3" 0 -0.5 0 ;
	setAttr ".spt" -type "double3" 0 -1 0 ;
	setAttr ".DAVEHASH" -type "string" "UwdHjBio";
	setAttr ".DAVETAG" -type "string" "WALL";
	setAttr ".DAVEBUILDING" -type "string" "1";
	setAttr ".DAVEROOM" -type "string" "0";
	setAttr ".DAVEHULLFLIPPED" -type "string" "False";
createNode mesh -n "sShape7" -p "s7";
	rename -uid "94698CAF-4070-5055-9ED7-DA882426BFF5";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "s8" -p "group4";
	rename -uid "EC665688-4B91-B10E-01B6-CD97A30CF5F0";
	addAttr -ci true -sn "DAVEHASH" -ln "DAVEHASH" -dt "string";
	addAttr -ci true -sn "DAVETAG" -ln "DAVETAG" -dt "string";
	addAttr -ci true -sn "DAVEBUILDING" -ln "DAVEBUILDING" -dt "string";
	addAttr -ci true -sn "DAVEROOM" -ln "DAVEROOM" -dt "string";
	addAttr -ci true -sn "DAVEHULLFLIPPED" -ln "DAVEHULLFLIPPED" -dt "string";
	setAttr ".t" -type "double3" 7 1.5 5.2555634313473574 ;
	setAttr ".r" -type "double3" 0 360.00000000000006 0 ;
	setAttr ".s" -type "double3" 0.025 3 2 ;
	setAttr ".rp" -type "double3" 0 -1.5 0 ;
	setAttr ".sp" -type "double3" 0 -0.5 0 ;
	setAttr ".spt" -type "double3" 0 -1 0 ;
	setAttr ".DAVEHASH" -type "string" "qhu07L2J";
	setAttr ".DAVETAG" -type "string" "WALL";
	setAttr ".DAVEBUILDING" -type "string" "1";
	setAttr ".DAVEROOM" -type "string" "0";
	setAttr ".DAVEHULLFLIPPED" -type "string" "False";
createNode mesh -n "sShape8" -p "s8";
	rename -uid "AF1A2306-4559-C53D-FDB2-8A82557ED46B";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "s9" -p "group4";
	rename -uid "5492F3A4-4C28-83EF-4C09-5E81A80D44A5";
	addAttr -ci true -sn "DAVEHASH" -ln "DAVEHASH" -dt "string";
	addAttr -ci true -sn "DAVETAG" -ln "DAVETAG" -dt "string";
	addAttr -ci true -sn "DAVEBUILDING" -ln "DAVEBUILDING" -dt "string";
	addAttr -ci true -sn "DAVEROOM" -ln "DAVEROOM" -dt "string";
	addAttr -ci true -sn "DAVEHULLFLIPPED" -ln "DAVEHULLFLIPPED" -dt "string";
	setAttr ".t" -type "double3" 4 1.5 0.32212718262889556 ;
	setAttr ".r" -type "double3" 0 270.00000000000006 0 ;
	setAttr ".s" -type "double3" 0.025 3 2 ;
	setAttr ".rp" -type "double3" 0 -1.5 0 ;
	setAttr ".sp" -type "double3" 0 -0.5 0 ;
	setAttr ".spt" -type "double3" 0 -1 0 ;
	setAttr ".DAVEHASH" -type "string" "ZbePWPkC";
	setAttr ".DAVETAG" -type "string" "WALL";
	setAttr ".DAVEBUILDING" -type "string" "1";
	setAttr ".DAVEROOM" -type "string" "0";
	setAttr ".DAVEHULLFLIPPED" -type "string" "False";
createNode mesh -n "sShape9" -p "s9";
	rename -uid "4D296735-40DB-5D49-D0BB-45B4041F65F5";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "s10" -p "group4";
	rename -uid "0B5EE913-4DDF-72D8-B7EA-94887B41A340";
	addAttr -ci true -sn "DAVEHASH" -ln "DAVEHASH" -dt "string";
	addAttr -ci true -sn "DAVETAG" -ln "DAVETAG" -dt "string";
	addAttr -ci true -sn "DAVEBUILDING" -ln "DAVEBUILDING" -dt "string";
	addAttr -ci true -sn "DAVEROOM" -ln "DAVEROOM" -dt "string";
	addAttr -ci true -sn "DAVEHULLFLIPPED" -ln "DAVEHULLFLIPPED" -dt "string";
	setAttr ".t" -type "double3" 2 1.5 0.31120519563133714 ;
	setAttr ".r" -type "double3" 0 270.00000000000006 0 ;
	setAttr ".s" -type "double3" 0.025 3 2 ;
	setAttr ".rp" -type "double3" 0 -1.5 0 ;
	setAttr ".sp" -type "double3" 0 -0.5 0 ;
	setAttr ".spt" -type "double3" 0 -1 0 ;
	setAttr ".DAVEHASH" -type "string" "cD1BJWkh";
	setAttr ".DAVETAG" -type "string" "WALL";
	setAttr ".DAVEBUILDING" -type "string" "1";
	setAttr ".DAVEROOM" -type "string" "0";
	setAttr ".DAVEHULLFLIPPED" -type "string" "False";
createNode mesh -n "sShape10" -p "s10";
	rename -uid "15343D68-47F4-7E3C-531B-96969275E3AA";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "building1Room1_flr";
	rename -uid "7AE11FBB-47F2-F6E5-FA8E-C1BCE42CC19E";
	addAttr -ci true -sn "DAVEPLANBUILDING" -ln "DAVEPLANBUILDING" -dt "string";
	addAttr -ci true -sn "DAVEPLANROOM" -ln "DAVEPLANROOM" -dt "string";
	addAttr -ci true -sn "DAVEROOMTAG" -ln "DAVEROOMTAG" -dt "string";
	addAttr -ci true -sn "DAVEHULLFLIPPED" -ln "DAVEHULLFLIPPED" -dt "string";
	setAttr ".DAVEPLANBUILDING" -type "string" "0";
	setAttr ".DAVEPLANROOM" -type "string" "0";
	setAttr ".DAVEROOMTAG" -type "string" "KITCHEN";
	setAttr ".DAVEHULLFLIPPED" -type "string" "False";
createNode mesh -n "building1Room1_flrShape" -p "building1Room1_flr";
	rename -uid "CE27611C-4CF7-4380-0FE9-288C468C1BE8";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "building1Room2_flr";
	rename -uid "88E16DE3-4F46-10D0-09B6-2BA2BB7D41CE";
	addAttr -ci true -sn "DAVEPLANBUILDING" -ln "DAVEPLANBUILDING" -dt "string";
	addAttr -ci true -sn "DAVEPLANROOM" -ln "DAVEPLANROOM" -dt "string";
	addAttr -ci true -sn "DAVEROOMTAG" -ln "DAVEROOMTAG" -dt "string";
	addAttr -ci true -sn "DAVEHULLFLIPPED" -ln "DAVEHULLFLIPPED" -dt "string";
	setAttr ".DAVEPLANBUILDING" -type "string" "0";
	setAttr ".DAVEPLANROOM" -type "string" "1";
	setAttr ".DAVEROOMTAG" -type "string" "KITCHEN";
	setAttr ".DAVEHULLFLIPPED" -type "string" "True";
createNode mesh -n "building1Room2_flrShape" -p "building1Room2_flr";
	rename -uid "63ED707E-4A68-8231-39BB-FAACCA13D2F9";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "building2Room1_flr";
	rename -uid "4C22A854-408A-EF9C-1372-0DB9205252A4";
	addAttr -ci true -sn "DAVEPLANBUILDING" -ln "DAVEPLANBUILDING" -dt "string";
	addAttr -ci true -sn "DAVEPLANROOM" -ln "DAVEPLANROOM" -dt "string";
	addAttr -ci true -sn "DAVEROOMTAG" -ln "DAVEROOMTAG" -dt "string";
	addAttr -ci true -sn "DAVEHULLFLIPPED" -ln "DAVEHULLFLIPPED" -dt "string";
	setAttr ".DAVEPLANBUILDING" -type "string" "1";
	setAttr ".DAVEPLANROOM" -type "string" "0";
	setAttr ".DAVEROOMTAG" -type "string" "KITCHEN";
	setAttr ".DAVEHULLFLIPPED" -type "string" "True";
createNode mesh -n "building2Room1_flrShape" -p "building2Room1_flr";
	rename -uid "2B4EA0E7-4EEC-FF60-2CE9-BD8C45D9BCAB";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "building3Room1_flr";
	rename -uid "43965A13-480D-370D-6D42-5BA7D1FFBF48";
	addAttr -ci true -sn "DAVEPLANBUILDING" -ln "DAVEPLANBUILDING" -dt "string";
	addAttr -ci true -sn "DAVEPLANROOM" -ln "DAVEPLANROOM" -dt "string";
	addAttr -ci true -sn "DAVEROOMTAG" -ln "DAVEROOMTAG" -dt "string";
	addAttr -ci true -sn "DAVEHULLFLIPPED" -ln "DAVEHULLFLIPPED" -dt "string";
	setAttr ".DAVEPLANBUILDING" -type "string" "2";
	setAttr ".DAVEPLANROOM" -type "string" "0";
	setAttr ".DAVEROOMTAG" -type "string" "KITCHEN";
	setAttr ".DAVEHULLFLIPPED" -type "string" "True";
createNode mesh -n "building3Room1_flrShape" -p "building3Room1_flr";
	rename -uid "853D7F6F-4AEC-4512-0E04-DEA59059B844";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "building3Room2_flr";
	rename -uid "8BC77E65-4B5E-49F2-2782-649A61DE89D5";
	addAttr -ci true -sn "DAVEPLANBUILDING" -ln "DAVEPLANBUILDING" -dt "string";
	addAttr -ci true -sn "DAVEPLANROOM" -ln "DAVEPLANROOM" -dt "string";
	addAttr -ci true -sn "DAVEROOMTAG" -ln "DAVEROOMTAG" -dt "string";
	addAttr -ci true -sn "DAVEHULLFLIPPED" -ln "DAVEHULLFLIPPED" -dt "string";
	setAttr ".DAVEPLANBUILDING" -type "string" "2";
	setAttr ".DAVEPLANROOM" -type "string" "1";
	setAttr ".DAVEROOMTAG" -type "string" "KITCHEN";
	setAttr ".DAVEHULLFLIPPED" -type "string" "True";
createNode mesh -n "building3Room2_flrShape" -p "building3Room2_flr";
	rename -uid "4D00D8D9-431D-DB84-1AFE-E8AD154C737C";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode lightLinker -s -n "lightLinker1";
	rename -uid "C4FA9601-4534-DF3B-AA09-A89FAB2F856C";
	setAttr -s 2 ".lnk";
	setAttr -s 2 ".slnk";
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "0766B6D5-46CD-D06C-BC9B-DD9447250C1A";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "6C6DBAA8-4490-7CF8-B15A-76A007F8A8EF";
createNode displayLayerManager -n "layerManager";
	rename -uid "17691DCB-4038-CCA3-F0AB-A9B3CCB2E7C5";
createNode displayLayer -n "defaultLayer";
	rename -uid "02E5B2C9-4374-94AD-44EB-8C9F079DC08E";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "8155F4AF-4530-AC27-6E2F-05BA94A979F0";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "2BF7DDD8-4769-DFF6-FFE9-5FB873DBA911";
	setAttr ".g" yes;
createNode script -n "uiConfigurationScriptNode";
	rename -uid "8632ECC2-4004-CB38-D67C-D8B5C3C0FC2F";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"top\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n"
		+ "            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n"
		+ "            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n"
		+ "            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"side\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n"
		+ "            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n"
		+ "            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n"
		+ "            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n"
		+ "            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n"
		+ "            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 1\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n"
		+ "            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n"
		+ "            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n"
		+ "            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 954\n            -height 726\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"ToggledOutliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"ToggledOutliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -docTag \"isolOutln_fromSeln\" \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 1\n            -showReferenceMembers 1\n"
		+ "            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n"
		+ "            -isSet 0\n            -isSetMember 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            -renderFilterIndex 0\n            -selectionOrder \"chronological\" \n            -expandAttribute 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" != $panelName) {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 0\n            -showReferenceMembers 0\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n"
		+ "            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -organizeByClip 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n"
		+ "                -showParentContainers 1\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n"
		+ "                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 1\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n"
		+ "                -showCurveNames 0\n                -showActiveCurveNames 0\n                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                -valueLinesToggle 1\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n"
		+ "                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -organizeByClip 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showParentContainers 1\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n"
		+ "                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n"
		+ "                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"timeEditorPanel\" (localizedPanelLabel(\"Time Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Time Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"sequenceEditorPanel\" (localizedPanelLabel(\"Camera Sequencer\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n"
		+ "                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph Hierarchy\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n"
		+ "                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n                -showConstraintLabels 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Editor\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"shapePanel\" (localizedPanelLabel(\"Shape Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tshapePanel -edit -l (localizedPanelLabel(\"Shape Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"posePanel\" (localizedPanelLabel(\"Pose Editor\")) `;\n\tif (\"\" != $panelName) {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n\t\tposePanel -edit -l (localizedPanelLabel(\"Pose Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" (localizedPanelLabel(\"Component Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"profilerPanel\" (localizedPanelLabel(\"Profiler Tool\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Profiler Tool\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"contentBrowserPanel\" (localizedPanelLabel(\"Content Browser\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Content Browser\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"nodeEditorPanel\" (localizedPanelLabel(\"Node Editor\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -connectNodeOnCreation 0\n                -connectOnDrop 0\n                -highlightConnections 0\n                -copyConnectionsOnPaste 0\n                -defaultPinnedState 0\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -crosshairOnEdgeDragging 0\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n"
		+ "                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -activeTab -1\n                -editorMode \"default\" \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-userCreated false\n\t\t\t\t-defaultImage \"vacantCell.xP:/\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"single\\\" -ps 1 100 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 1\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 954\\n    -height 726\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 1\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 954\\n    -height 726\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 5 -size 12 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "63E68E78-419A-CD26-F192-55A8324B5C64";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 120 -ast 1 -aet 200 ";
	setAttr ".st" 6;
createNode polyCreateFace -n "polyCreateFace1";
	rename -uid "49327006-41B2-6924-09BA-B8BB62468403";
	setAttr -s 5 ".v[0:4]" -type "float3"  4.9096494 3 0 4.9221492 3 
		-3.9875 0.92214918 3 -3.9875 0.93464929 3 -2 0.92214918 3 -0.0125;
	setAttr ".l[0]"  5;
	setAttr ".tx" 1;
createNode polyCreateFace -n "polyCreateFace2";
	rename -uid "BD49D469-43A3-5186-1456-9DB7C652DFD2";
	setAttr -s 5 ".v[0:4]" -type "float3"  0.93464929 0 -4 4.9346495 
		0 -4 4.9221492 0 -0.0125 0.93464929 0 0 0.93464929 0 -2;
	setAttr ".l[0]"  5;
	setAttr ".tx" 1;
createNode polyCreateFace -n "polyCreateFace3";
	rename -uid "119472AA-4F0C-0F82-EE76-F39600FA85B7";
	setAttr -s 6 ".v[0:5]" -type "float3"  1.0125 0 6.2555633 1.0125 
		0 4.2555633 1.0125 0 2.2555633 1 0 0.32370523 6.9875002 0 0.25556344 7 0 6.2430634;
	setAttr ".l[0]"  6;
	setAttr ".tx" 1;
createNode polyCreateFace -n "polyCreateFace4";
	rename -uid "88676CF7-4918-1862-4CDE-FEB541AC1097";
	setAttr -s 6 ".v[0:5]" -type "float3"  -6.3397937 3 4.0166035 -9.132638 
		3 6.8801713 -11.978529 3 4.0871062 -9.2031403 3 1.2414355 -8.9883728 3 1.4508988 
		-7.7713561 3 2.6378577;
	setAttr ".l[0]"  6;
	setAttr ".tx" 1;
createNode polyCreateFace -n "polyCreateFace5";
	rename -uid "BA824873-4504-0C25-4177-638C280CAF51";
	setAttr -s 6 ".v[0:5]" -type "float3"  -3.5637219 0 4.1310167 -7.7532091 
		0 8.4086924 -12.030664 0 4.2368813 -7.8413978 0 -0.058470841 -6.42729 0 1.3381724 
		-4.9955058 0 2.7345948;
	setAttr ".l[0]"  6;
	setAttr ".tx" 1;
createNode polyTriangulate -n "polyTriangulate1";
	rename -uid "740FAF8B-4B00-8270-8A85-1CB264E4AFFB";
	setAttr ".ics" -type "componentList" 1 "f[*]";
createNode polyTriangulate -n "polyTriangulate2";
	rename -uid "3E606F9C-4DC8-EC62-CAF8-E19C559957F2";
	setAttr ".ics" -type "componentList" 1 "f[*]";
createNode polyNormal -n "polyNormal1";
	rename -uid "F15E28B5-4B37-2BB6-400F-788960DE39E4";
	setAttr ".ics" -type "componentList" 1 "f[0:2]";
createNode polyTriangulate -n "polyTriangulate3";
	rename -uid "0B49B113-49F0-5032-2539-699F70D07703";
	setAttr ".ics" -type "componentList" 1 "f[*]";
createNode polyNormal -n "polyNormal2";
	rename -uid "8B3011B8-4417-A28F-7502-7E875328AC2F";
	setAttr ".ics" -type "componentList" 1 "f[0:3]";
createNode polyTriangulate -n "polyTriangulate4";
	rename -uid "EC898B2B-469C-58BF-EB14-8A9B250C87A5";
	setAttr ".ics" -type "componentList" 1 "f[*]";
createNode polyNormal -n "polyNormal3";
	rename -uid "D52F832F-45CF-C266-A9AC-9286AE794EBF";
	setAttr ".ics" -type "componentList" 1 "f[0:3]";
createNode polyTriangulate -n "polyTriangulate5";
	rename -uid "EC2EFC88-4861-3EF3-87DC-28950DB94306";
	setAttr ".ics" -type "componentList" 1 "f[*]";
createNode polyNormal -n "polyNormal4";
	rename -uid "6224BEF4-4B7F-3AA6-21C8-5393BB705716";
	setAttr ".ics" -type "componentList" 1 "f[0:3]";
select -ne :time1;
	setAttr ".o" 1;
	setAttr ".unw" 1;
select -ne :hardwareRenderingGlobals;
	setAttr ".otfna" -type "stringArray" 22 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surface" "Particles" "Particle Instance" "Fluids" "Strokes" "Image Planes" "UI" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Hair Systems" "Follicles" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 22 0 1 1 1 1 1
		 1 1 1 0 0 0 0 0 0 0 0 0
		 0 0 0 0 ;
	setAttr ".msaa" yes;
	setAttr ".fprt" yes;
select -ne :renderPartition;
	setAttr -s 2 ".st";
select -ne :renderGlobalsList1;
select -ne :defaultShaderList1;
	setAttr -s 4 ".s";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderingList1;
select -ne :initialShadingGroup;
	setAttr -s 53 ".dsm";
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultRenderGlobals;
	setAttr ".ren" -type "string" "arnold";
select -ne :defaultResolution;
	setAttr ".pa" 1;
select -ne :hardwareRenderGlobals;
	setAttr ".ctrs" 256;
	setAttr ".btrs" 512;
connectAttr "polyTriangulate1.out" "building1Room1_flrShape.i";
connectAttr "polyNormal1.out" "building1Room2_flrShape.i";
connectAttr "polyNormal2.out" "building2Room1_flrShape.i";
connectAttr "polyNormal3.out" "building3Room1_flrShape.i";
connectAttr "polyNormal4.out" "building3Room2_flrShape.i";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "polyCreateFace1.out" "polyTriangulate1.ip";
connectAttr "polyCreateFace2.out" "polyTriangulate2.ip";
connectAttr "polyTriangulate2.out" "polyNormal1.ip";
connectAttr "polyCreateFace3.out" "polyTriangulate3.ip";
connectAttr "polyTriangulate3.out" "polyNormal2.ip";
connectAttr "polyCreateFace4.out" "polyTriangulate4.ip";
connectAttr "polyTriangulate4.out" "polyNormal3.ip";
connectAttr "polyCreateFace5.out" "polyTriangulate5.ip";
connectAttr "polyTriangulate5.out" "polyNormal4.ip";
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "eShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "doorWayeShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "sShape7.iog" ":initialShadingGroup.dsm" -na;
connectAttr "sShape8.iog" ":initialShadingGroup.dsm" -na;
connectAttr "sShape6.iog" ":initialShadingGroup.dsm" -na;
connectAttr "sShape5.iog" ":initialShadingGroup.dsm" -na;
connectAttr "eShape5.iog" ":initialShadingGroup.dsm" -na;
connectAttr "eShape3.iog" ":initialShadingGroup.dsm" -na;
connectAttr "eShape4.iog" ":initialShadingGroup.dsm" -na;
connectAttr "eShape2.iog" ":initialShadingGroup.dsm" -na;
connectAttr "eShape1.iog" ":initialShadingGroup.dsm" -na;
connectAttr "eShape6.iog" ":initialShadingGroup.dsm" -na;
connectAttr "sShape2.iog" ":initialShadingGroup.dsm" -na;
connectAttr "sShape1.iog" ":initialShadingGroup.dsm" -na;
connectAttr "sShape9.iog" ":initialShadingGroup.dsm" -na;
connectAttr "sShape10.iog" ":initialShadingGroup.dsm" -na;
connectAttr "sShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "sShape4.iog" ":initialShadingGroup.dsm" -na;
connectAttr "sShape3.iog" ":initialShadingGroup.dsm" -na;
connectAttr "doorWaysShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "aShape4.iog" ":initialShadingGroup.dsm" -na;
connectAttr "aShape3.iog" ":initialShadingGroup.dsm" -na;
connectAttr "aShape2.iog" ":initialShadingGroup.dsm" -na;
connectAttr "aShape1.iog" ":initialShadingGroup.dsm" -na;
connectAttr "doorWayaShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "aShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "aShape6.iog" ":initialShadingGroup.dsm" -na;
connectAttr "aShape5.iog" ":initialShadingGroup.dsm" -na;
connectAttr "wShape4.iog" ":initialShadingGroup.dsm" -na;
connectAttr "wShape3.iog" ":initialShadingGroup.dsm" -na;
connectAttr "doorWaywShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "qShape3.iog" ":initialShadingGroup.dsm" -na;
connectAttr "wShape10.iog" ":initialShadingGroup.dsm" -na;
connectAttr "wShape9.iog" ":initialShadingGroup.dsm" -na;
connectAttr "qShape5.iog" ":initialShadingGroup.dsm" -na;
connectAttr "qShape2.iog" ":initialShadingGroup.dsm" -na;
connectAttr "doorWayqShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "qShape6.iog" ":initialShadingGroup.dsm" -na;
connectAttr "qShape4.iog" ":initialShadingGroup.dsm" -na;
connectAttr "qShape1.iog" ":initialShadingGroup.dsm" -na;
connectAttr "qShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "wShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "wShape2.iog" ":initialShadingGroup.dsm" -na;
connectAttr "wShape8.iog" ":initialShadingGroup.dsm" -na;
connectAttr "wShape7.iog" ":initialShadingGroup.dsm" -na;
connectAttr "wShape6.iog" ":initialShadingGroup.dsm" -na;
connectAttr "wShape5.iog" ":initialShadingGroup.dsm" -na;
connectAttr "wShape1.iog" ":initialShadingGroup.dsm" -na;
connectAttr "building1Room1_flrShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "building1Room2_flrShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "building2Room1_flrShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "building3Room1_flrShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "building3Room2_flrShape.iog" ":initialShadingGroup.dsm" -na;
// End of testScene.ma

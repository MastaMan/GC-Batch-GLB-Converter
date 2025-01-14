/*  
[INFO] 
NAME=Batch GLB Converter
VERSION=1.5.2
AUTHOR=MastaMan
DEV=https://3dground.net
HELP=
CLIENT=Eugen Zharnikov

[ABOUT]
Script for bulk conversion models to GLB=

[1.0.0]
* Initial release =

[1.0.1]
* Changed: Improved update system=

[1.0.2]
+ Added: JSON info=
+ Added: WebPreview with screenshots=

[1.0.3]
+ Added: Support Blender export=

[1.0.4]
- BugFix: Chain of fixes for prod computer=

[1.0.5]
+ Added: New options for check list=
- BugFix: Small fixes and improvements=

[1.0.6]
- BugFix: Small fixes=

[1.0.7]
+ Added: Support CoronaRaySwitchMtl=

[1.0.8]
+ Added: 3Ds Max version in JSON=
- BugFix: Can't receive ID=

[1.0.9]
+ Added: Context menu=
+ Added: QA GLB + Previews=
+ Added: Web image preview player=
+ Added: GreatCatalog website item preview by file id=
+ Added: Ability to remove all files depends with archive=
+ Added: Remember selection after reload listbox=
* Changed: Lot of refactoring=
- BugFix: Not updated listbox after remove unpacked folder=

[1.1.0]
+ Added: Copy Archive Path to context menu=

[1.1.1]
+ Added: Rendered custom HDRI for player=
+ Added: Downloader=
+ Added: Model Statuses=
+ Added: New buttons and workflow structure in UI=
* Changed: Simplified inteface=
* Changed: New web player=
* Changed: Fixes and stabilization=
- Removed: Split files=
- BugFix: QA=

[1.1.2]
+ Added: Uploader=

[1.1.3]
+ Added: normalizeUVWbyTiling function=
- Removed: Real World Dependency=

[1.1.4]
+ Added: Support Blender render insted screenshots=
+ Added: Builder for model-viewer=
+ Added: Function replaceToBlackEmptyBitmap for fix issue with missing filenames in bitmaps=
* Changed: Improved HDRI=
* Changed: GLB Cache Maps folder moved to extract folder=
* Changed: Save converted GLB scene to extract folder (for better debuggin)=
* Changed: normalizeUVWbyTiling impoved for better work with Bitmap instances=
- BugFix: Not reset scene after Batch Export=

[1.1.5]
+ Added: Message if no *.max files in checking archive and auto status Skip=
- BugFix: Blender render not installed necessary files after update=

[1.1.6]
+ Added: More options in JSONs like in Auto Moder=
- BugFix: No open some *.max files on Check Archive=
- BugFix: Open scenes withou -VRay or -Corona postfixes=

[1.1.7]
+ Added: Function neutralizeDoubleSided for fix issue with black materials=
* Changed: Decrase Exposure for model-viwer player=
* Changed: Tone mapping changed to ACES for model-viwer player=
- BugFix: Some JSON info not written=

[1.1.8]
* Changed: Upload URL=

[1.1.9]
+ Added: Bulk set status Approve or Skip=
- BugFix: AWS upload cmd line=
- BugFix: BLENDER_EVEE_NEXT instead Evee=

[1.2.0]
- BugFix: Glass materials conversion=

[1.2.1]
+ Added: Image Color Clamping for textures=
+ Added: Prod and Test urls for model downloader=
+ Added: Contrast Blender renders=
- BugFix: Opacity materials conversion=

[1.2.2]
+ Added: Unfreeze all when scene check=
+ Added: Unhide all when scene check=
- BugFix: Textures offset in normalizeUVWbyTiling=

[1.2.3]
- BugFix: Can export Skipped items=

[1.2.4]
+ Added: Kill Tex Tiling option for each scene=
+ Added: Skip statuses=
+ Added: Polys to Scene Info dialog=
+ Added: Comment to Scene Info dialog=
+ Added: Backface cull enable for all objects when open scene=
* Changed: Redesigned Scene Info dialog=
- BugFix: Poor baking Falloff=
- BugFix: Huge bump, clamp to 0.2=

[1.2.5]
+ Added: Quick Export button=
+ Added: Set visible maps after opening scene=
+ Added: Tooltips=

[1.2.6]
- BugFix: Alpha tiling=

[1.2.7]
+ Added: Set visible maps when pressing Save Scene=

[1.2.9]
+ Added: neutralizeBlendMtl funciton=
+ Added: neutralizeNoise funciton=
+ Added: neutralizeCoronaSkinMtl funciton=
+ Added: setVrayMtlFogColorToDiffuse funciton=
+ Added: Turn on doubleSided option in GLTF Material=
+ Added: Glass preset for changing standard (bad) glass=

[1.3.0]
+ Added: Setting Download Queue Quantity=

[1.3.1]
+ Added: Button Status: None=

[1.3.2]
+ Added: If not foudn blend file and status Approve displays [Not found Blender file] status=


[1.3.3]
- BugFix: Exception for Normal maps=

[1.3.4]
+ Added: Quotes for comments=
- BugFix: setVrayMtlFogColorToDiffuse func=

[1.3.5]
* Changed: Button names and positions=

[1.3.6]
* Changed: Web Player Exposure=

[1.3.7]
- Removed: Approve and Skip statuses from context menu=
- BugFix: Wrong Blend statuses in ini=

[1.3.8]
- Added: Statuses Approve, Skip, None to context menu with proper functionality=

[1.3.9]
* Changed: CRON url for prod=

[1.4.0]
+ Added: Logging funciton=

[1.4.1]
- BugFix: Small fixes=

[1.4.2]
- BugFix: Logging error=

[1.4.3]
- BugFix: Logging error=

[1.4.4]
+ Added: Write error log AWS in temp folder=
* Changed: Prod key=

[1.4.5]
* Changed: DotNet WebRequest to CURL for better stability=

[1.4.6]
+ Added: Support nested bitmap channel for renderMap=
+ Added: Support diffuse texture for CoronaSkinMtl=

[1.4.7]
* Imporved: AA for GLB web player=

[1.4.8]
+ Added: neutralizeCoronaMix funciton=
- BugFix: renderTargetMap gamma, 3Ds Max jpg format glitch=

[1.4.9]
+ Added: Bake AO Custom Scene option=

[1.5.0]
+ Added: Auto Convert (Test) option in context menu=
+ Added: Auto Convert: Explode Groups=
+ Added: Auto Convert: Reset XForm=
+ Added: Auto Convert: Remove lineIso for Turbosmooth=
+ Added: Auto Convert: Attach=
+ Added: Auto Convert: Set Pivot=
+ Added: Auto Convert: Center Scene=
+ Added: Auto Convert: Export withou AO but with Blender files=
+ Added: Save window positon for Skip Comment=
* Changed: QA GLB + Preview set as first item in context menu=
* Changed: Simplified UI=
- BugFix: Context menu items Appove and None for more then one selected in list=

[1.5.1]
+ Added: Final Export to context menu=
- Removed: Status None for context menu=

[1.5.2]
- BugFix: Fatal error with checked=

[FILES]
Install.mcr=
jpegoptim.exe=
convert.exe=
gltfpack.exe=
denoise.bat=
gltfpack.bat=
vdenoise.xml=
normalmap.exe=
xnormal.bat=
xnormal.xml=
lowes-viewer.zip=deleted
model-viewer.zip=
chrome-screenshot.bat=
chrome-preview.bat=
chrome.bat=deleted
archivate.bat=
blender-screenshot.bat=
blender-zoom-extends.py=
blender-import-glb.py=
blender-bg-import.bat=
blender-gen-ini.py=
blender-bg-run.bat=
download.bat=
get-max-render.bat=
sync-to-aws.bat=
blender-render.bat
blender-render.py=
clamp-colors.bat=
contrast.bat=
web-request.bat=
sketchup-convert.bat=
template.skp=

[SCRIPT]
*/

/*
	TODO: 
	Transluency -> Transmission

*/

struct getMaxDataWrapper (
	currentPath = getFileNamePath (getThisScriptFileName()),
		
	fn ver f = (
		local v = try ((getMaxFileVersionData f)[1]) catch ((maxVersion())[1])
		v = 2000 + ((v / 1000) - 2)
		return v as string
	),
	
	fn rend f = (
		local ini = f + ".ini"		
		local args = f + ";" + ini		
		local cmd = "get-max-render.bat \"" +  args + "\""
		local curDir = sysInfo.currentDir
		
		sysInfo.currentDir = currentPath		
		hiddenDosCommand cmd exitCode: &exitcode donotwait: false		
		sysInfo.currentDir = curDir
		
		local r = getINISetting ini "index" "render"
		deleteFile ini
		
		if (r == "") do r = "Scanline"
		
		return r
	)
)

struct QueryDeleteFiles (
	rQueryMessage = undefined,
	msg = "Do you realy want to delete selected files (+Generated files)?",
	title = "Confirm?",
	result = #no,
	fn show = (
		if (rQueryMessage != undefined) do try (DestroyDialog rQueryMessage) catch ()
		rollout rQueryMessage "" (		
			label lblMsg "" align: #left offset: [45, 20]
			checkbox cbxRemove "Remove archives?" align: #left offset: [42, 5]
			button btnYes "Yes" across: 2 width: 70 height: 25 align: #right offset: [160, 20]
			button btnNo "No" width: 70 height: 25 align: #right offset: [0, 20]
			dotNetControl pictureBox "System.Windows.Forms.PictureBox" width:32 height:32 pos: [12, 28]
			
			on rQueryMessage open do (
				local bg = (colorMan.getColor #background * 255) as color
				local i = dotNetClass "System.Drawing.SystemIcons"
				pictureBox.image = i.Question.ToBitmap()
				local clr = dotNetClass "System.Drawing.Color"
				pictureBox.BackColor = clr.FromArgb bg.r bg.g bg.b
				
				lblMsg.caption = this.msg
				rQueryMessage.title = this.title
			)
			
			on btnNo pressed do (
				this.result = #no
				try (DestroyDialog rQueryMessage) catch ()
			)
			
			on btnYes pressed do (
				this.result = #files
				if (cbxRemove.checked) do this.result = #files_archives
				try (DestroyDialog rQueryMessage) catch ()
			)
		)
		CreateDialog rQueryMessage width: 500 height: (112 + 20) modal: true
		
		return this.result
	)	
)

struct dateTime (
    n = (dotNetClass "System.DateTime").Now,
    y = n.year as string,
    d = n.day as string,
    m = n.month as string,
    hh = n.hour as string,
    mm = n.minute as string,
    ss = n.second as string,
	fn addZero p = (
		if (p.count == 1) do p = "0" + p
		return p
	),
	fn getDate = (
		return d + "." + m + "." + y
	),
	fn getTime = (
		return hh + ":" + mm + ":" + ss
	),
	fn getCurrent = (		
		return getDate() + " " + getTime()
	),
	fn getAsFileName = (
		return d + m + y + hh + mm + ss
	),
	on create do (
		d = addZero d
		m = addZero m
		hh = addZero hh
		mm = addZero mm
		ss = addZero ss
	)
)

fn getLogginFile = (
	local dt = dateTime()
	local dmy = dt.d + "." + dt.m + "." + dt.y
	local n = "GLB_Converter_" + dmy + ".ini"
	local f = @"C:\temp\" + n	
)

fn logging m = (
	local dt = dateTime()
	local dmy = dt.d + "." + dt.m + "." + dt.y
	local hms = dt.hh + ":" + dt.mm + ":" + dt.ss
	local t = "( " + dmy + " / " + hms + " ) ( " + timestamp() as string + " )|"
	
	local f = getLogginFile()
	
	local m = substituteString m "\n" " "
	local msg = " > " + m
	print msg
	setIniSetting f "LOG" t msg
)

struct JsonWrapper (
	/*
		Example:
		
		data = #(
			#("polygons", "10000"),
			#("vertex", "10000"),
			#("name", "Test"),
			#("render", "Corona"),
			#("renderVer", "12"),
			#("arrayValues", #(
				"val1",
				"val2"
			)),
			#("arrayOfJsons", #(
				#(
					#("var1", "value"),
					#("var2", "value2")
				),
				#(
					#("var3", "value3"),
					#("var4", "valuet")
				)
			)),
			#("xform", "yes")
		)
	*/
	
	fn getScriptVersion = (
		local s = getThisScriptFilename()
		return getINISetting s "INFO" "VERSION"
	),
	
	fn getScriptName = (
		local s = getThisScriptFilename()
		return getINISetting s "INFO" "NAME"
	),
	
	fn addData data k v = (
		k = k as string
		v = case classOf v of (
			undefined: ""
			UndefinedClass: ""
			Array: v
			default: v as string
		)
		
		for i in 1 to data.count where data[i][1] == k do (
			data[i][2] = v
			return false
		)
		
		append data #(k, v)
	),
	
	fn writeFileUTF8 o b = (
		local s = dotNetObject "System.IO.StreamWriter" (o) true ((dotNetClass "System.Text.Encoding").GetEncoding("UTF-8"))
		
		for l in b where l.count > 0 do s.WriteLine(dotNetObject "System.String" l)			
		s.Close()		
	),
	
	fn writeJson fname data = (	
		deleteFile fname
		
		-- Force add some data in the end
		addData data "date" ((dateTime()).getCurrent())
		addData data "scriptVersion" (getScriptVersion())
		addData data "scriptName" (getScriptName())
		
		local t = "\t"
		local n = "\n"
		local q = "\""
		
		local j = "{" + n
		for i in 1 to data.count do (
			local p = data[i]
			local comma = if (i != data.count) then ("," + n) else n
			j += t + q + p[1] + q + ": "
			
			local qq = q
			if (p[2] == "true" or p[2] == "false") do qq = ""
			
			case classOf p[2] of (
				String:  j += qq + p[2] + qq + comma
				Array: (					
					j += "[" + n
					for ii in 1 to p[2].count do (
						local z = p[2][ii]
						local comma2 = if (ii != p[2].count) then ("," + n) else n
						
						if (classOf z == Array) then (							
							j += t + t + "{" + n							
								for iii in 1 to z.count do (
									local pp = z[iii]
									local comma3 = if (iii != z.count) then ("," + n) else n
									
									j += t + t + t + q + pp[1] + q + ": \"" + pp[2] + q + comma3
								)
							j += t + t + "}" + comma2
						) else (
							j += t + t + q + z + q + comma2
						)
					)
					j += t + "]" + comma
				)
			)			
		)
		
		j += "}"
		
		local b = FilterString j "\n"
		
		writeFileUTF8 (fname) b
	)
)

struct GCModelSplitWrapper (
	folder = "",
	id = "",
	root = "",
	ptrnGC = #("GC-*-Corona.max", "GC-*-VRay.max"),
	ptrnExport = #("*.fbx", "*.obj", "*.mtl", "*.mat"),
	postfixOriginal = "-MaxOriginal",
	postfixMerger = "-MaxMerger",
	postfixExport = "-FBX-OBJ",
	currentPath = getFileNamePath (getThisScriptFileName()),
	maxDataMgr = getMaxDataWrapper(),
	j = JsonWrapper(),
	data = #(),
	
	fn archivate n o = (
		if (not doesDirectoryExist o) do return false
		
		local args = n + ";" + o
		args = substituteString args "/" @"\"
		
		local cmd = "archivate.bat \"" +  args + "\""
		
		local curDir = sysInfo.currentDir
		sysInfo.currentDir = currentPath
		
		hiddenDosCommand cmd exitCode: &exitcode donotwait: false
		
		sysInfo.currentDir = curDir
	),
	fn isMatch s pattern: #() = (
		for p in pattern do (
			if (MatchPattern s pattern: p ignoreCase: true) do return true
		)
		
		return false
	),	
	fn trim s tag: "- "= (
		return trimLeft (trimRight s tag) tag
	),
	fn getId = (
		local a = filterString folder @"\"
		return try (a[a.count]) catch ("0000")
	),
	fn getRoot = (
		local d = substring folder 1 (folder.count - id.count - 1)		
		d = d + @"Processed\"
		makeDir d all: true
		return d
	),
	fn isSplitted = (
		local s = true
		local postfixes = #(postfixOriginal, postfixMerger, postfixExport)
		for p in postfixes do (
			local f = root + id + p + ".zip"
			if (not doesFileExist f) do s = false
		)
		
		return s
	),
	fn writeIniSplitStatus = (
		makeDir root all: true
		local ini = root + id + ".ini"
		local postfixes = #(postfixOriginal, postfixMerger, postfixExport)
		for p in postfixes do (
			local f = root + id + p + ".zip"
			local status = if (doesFileExist f) then "Approve" else "Error"
			setINISetting ini "FILES" (trimLeft p "-") status
		)
	),
	fn getFilesRecursive r pattern: "*.*" = (
        local dd = getDirectories (r + "/*")
        local ff = getFiles (r + "/" + pattern)
        for i in dd do join ff (getFilesRecursive i pattern: pattern)
        
        return ff
    ),
	fn getOriginalFiles = (
		local files = getFiles (folder + "*.max")
		local o = #()
		
		for f in files do (
			local n = filenameFromPath f
			if (isMatch n pattern: ptrnGC) do continue
			append o f
		)
		
		return o
	),	
	fn getGCFiles = (
		local files = getFiles (folder + "*.max")
		local o = #()
		
		for f in files do (
			local n = filenameFromPath f
			if (isMatch n pattern: ptrnGC) do append o f			
		)
		
		return o
	),
	fn getOrignalName f = (
		local n = filenameFromPath f
		n = substituteString n "Author-" ""
		n = substituteString n "Original-Scene-" ""
		n = substituteString n "---" "-"
		n = substituteString n "--" "-"
		n = trim n
		return n
	),
	fn getExportName f = (
		local n = filenameFromPath f
		n = substituteString n "-fbx" ""
		n = substituteString n "-obj" ""
		n = trim n
		return n
	),
	fn getMergerName f = (
		local n = filenameFromPath f
		n = substituteString n "GC-repack-" ""
		n = substituteString n "GC-Repack-" ""
		n = substituteString n "GC-" ""
		n = substituteString n "---" "-"
		n = substituteString n "--" "-"
		n = trim n
		return n
	),
	fn copyMaps p = (
		local maps = folder + @"maps\*"
		local dest = p + @"maps\"
		makeDir dest all: true
		local cmd = "xcopy \"" + maps + "\" \"" + dest + "\" /E /I /C /Y"
		hiddenDosCommand cmd exitCode: &exitcode donotwait: false
	),	
	fn implode a tag: ","= (
		local o = ""
		for i in 1 to a.count do (
			o += a[i]
			if (i != a.count) do o += tag
		)
		return o
	),
	fn writeJsonVersionsAndRenders n files = (
		-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		data = #()
		local jj = root + n + ".json"
		local jsonVersionsAndRenders = #()
		for f in files do (
			local v = maxDataMgr.ver f
			local r = maxDataMgr.rend f
			
			append jsonVersionsAndRenders #(#(v, r))
		)
		
		j.addData data "versionsAndRenders" jsonVersionsAndRenders
		
		j.writeJson jj data
	),	
	fn writeIniVersionsAndRenders n files = (
		local ini = root + n + ".ini"
		local versions = #()
		local renders = #()
		
		for f in files do (
			local v = maxDataMgr.ver f
			local r = maxDataMgr.rend f
		
			local i = findItem versions v
			if (i != 0) then (
				appendIfUnique renders[i] r
			) else (
				append versions v
				append renders #(r)
			)
		)
		
		for i in 1 to versions.count do (
			local v = versions[i]
			local r = implode renders[i]
			setINISetting ini "versionsAndRenders" v r
		)
	),	
	fn createMaxOriginal = (
		local n = id + postfixOriginal
		local p = root + n + @"\"
		local zip = root + n + ".zip"		
		local files = getOriginalFiles()
		
		makeDir p all: true
		
		for f in files do (
			local origName = getOrignalName f
			copyFile f (p + origName)
			
			local v = maxDataMgr.ver f
			local r = maxDataMgr.rend f
		)
		
		copyMaps p		
		archivate zip p		
		writeIniVersionsAndRenders n files
		writeJsonVersionsAndRenders n files
		
	),	
	fn createMaxMerger = (
		local n = id + postfixMerger
		local p = root + n + @"\"
		local zip = root + n + ".zip"
		local files = getGCFiles()
		
		makeDir p all: true
		
		for f in files do (
			local mergerName = "GC-Repack-" + (getMergerName f)
			copyFile f (p + mergerName)
		)
		
		copyMaps p		
		archivate zip p		
		writeIniVersionsAndRenders n files
	),
	fn createFbxObj = (
		local tmp = getFilesRecursive folder				
		local n = id + postfixExport
		local p = root + n + @"\"
		local zip = root + n + ".zip"
		local ini = root + n + ".ini"
		local files = for f in tmp where (isMatch f pattern: ptrnExport) collect f
		
		for f in files do (
			local exportName = getExportName f
			local t = trimLeft (getFilenameType f) "."
			
			makeDir p all: true
			
			copyFile f (p + exportName)
			
			setINISetting ini "EXPORT" t "true"
		)
		
		copyMaps p
		
		archivate zip p
	),	
	fn init p = (
		folder = p
		id = getId()
		root = getRoot()
		
		local files = getFiles (folder + "*.max")
		if (files.count == 0) do return #error_no_max_files
		
		return #inited
	)
)

/*
	fn splitFiles = (
		local splitterMgr = GCModelSplitWrapper()
		splitterMgr.init maxFilePath
		splitterMgr.createMaxOriginal()
		splitterMgr.createFbxObj()
		splitterMgr.createMaxMerger()
		
		local s = splitterMgr.isSplitted()
		splitterMgr.writeIniSplitStatus()
		
		return s
	)
*/

struct SketchupConverterWrapper (
	currentPath = getFileNamePath (getThisScriptFileName()),
	sketchupLocaton = @"C:\Program Files\SketchUp\",
		
	scn = undefined,
	vrscene = "",
	outFile = "",
	tmpOut = "",
	preview = "",
	input = "",
	zip = "",
	json = #(),
	jsonFile = "",
	j = JsonWrapper(),
	
	fn archivate n o = (
		if (not doesDirectoryExist o) do return false
		
		local args = n + ";" + o
		args = substituteString args "/" @"\"
		
		local cmd = "archivate.bat \"" +  args + "\""
		
		local curDir = sysInfo.currentDir
		sysInfo.currentDir = currentPath
		
		hiddenDosCommand cmd exitCode: &exitcode donotwait: false
		
		sysInfo.currentDir = curDir
	),
	fn getMaxFile o = (
		local ptrns = #(
			"GC-*-VRay.max",
			"GC-*.max",
			"*VRay*.max",
			"*V-Ray*.max",
			"*V_Ray*.max",
			"*vr*.max",
			"*.max"
		)
		
		local files = getFiles (o + "*.max")
		
		for p in ptrns do (
			for f in files do (
				local ne = filenameFromPath f
				if (MatchPattern ne pattern: p) do return f
			)
		)
		
		return undefined
	),	
	fn getRealName f = (		
		local n = getFilenameFile f
		
		n = substituteString n "GC-Repack-" ""
		n = substituteString n "GC-Repack" ""
		n = substituteString n "Repack-" ""
		n = substituteString n "repack-" ""
		n = substituteString n "GC-" ""
		n = substituteString n "-Corona" ""
		n = substituteString n "-VRay" ""
		n = substituteString n "-V-Ray" ""
		for i in #{2010..2050} do n = substituteString n (i as string) ""
		n = substituteString n "---" ""
		n = substituteString n "---" ""
		n = substituteString n "--" ""
		n = substituteString n "--" ""
		n = trimLeft (trimRight n "- ") "- "			
		n = "GC-Repack-" + n
		
		return n
	),
	fn getSketchupExe = (
		local d = (getDirectories (sketchupLocaton + "*"))[1]			
		if (d == undefined) do return undefined
		local b = d + "SketchUp.exe"
		if (not doesFileExist b) do return undefined
		return b
	),
	fn isSketchupExist = (
		local b = getSketchupExe()
		if (b == undefined) do return false
		return true
	),	
	fn getFileMb f = (
		if (not doesFileExist f) do return 0.0
		s = (getFileSize f) / 1048576.0
		return ((s * 100) as integer) / 100.0
	),
	fn getCurrentMaxVersion = (
		local v = maxVersion()
		v = (v[1] / 1000) - 2
		
		return (2000 + v) as string
	),
	fn polyCount s = (
        local iPoly = 0
		local iVert = 0
        
        local a = for i in s collect (getPolygonCount i)
        for i in a do (
			iPoly += i[1]
			iVert += i[2]
		)
		
        sPoly = iPoly as string
        sVert = iVert as string
		
		return #(sPoly, sVert)
	),	
	fn getDim s = (
        local d = s.max - s.min
        
        d = for i in 1 to 3 collect ((d[i] * 100) as integer / 100.0 ) as string
        
        return d[1] + " x " + d[2] + " x " + d[3]
    ),	
	fn getUnits = (
        local u = trimLeft (units.SystemType as string) "#"
        u[1] = toUpper u[1]
        return u
    ),
	fn getMaterialsCnt = (
		if (VRayMtl == undefined) do return 0
		local cc = 0
		
		for o in objects do (
			local c = (getClassInstances VRayMtl target: o).count
			cc += c
		)
			
		return cc
	),
	fn getVer = (
		local s = getSketchupExe()
		local c = filterString s @"\"
		if (c[c.count] != "SketchUp.exe") do return "0"
		local rr = c[c.count - 1]
		local v = (FilterString rr " ")[2]
		if (v == undefined) do return "0"
		
		return v
	),
	fn getRender = (		
		local f = @"c:\Program Files\Chaos\V-Ray\V-Ray for SketchUp\extension\extension.json"
		if (not doesFileExist f) do return "Unknown"
		return "VRay"
	),
	fn changeRenderToVRay = (
		if (matchPattern (renderers.current as string) pattern: "V_Ray*") do return true
		try (renderers.current = VRay()) catch (return false)
		return true
	),
	fn convertWithVRayUtils = (
		local v = getCurrentMaxVersion()
		local f = @"c:\ProgramData\Autodesk\ApplicationPlugins\VRay3dsMax" + v + @"\scripts\vrayutils.ms"
		
		if (doesFileExist f) do (
			fileIn f
			fileIn f
			fileIn f
			
			CreateDialog vraySceneConverterRollout
			try (DestroyDialog vraySceneConverterRollout) catch ()
			CreateDialog vraySceneConverterRollout
			
			vraySceneConverterRollout.check_optConvertOnlySelectedNodes.checked = false
			vraySceneConverterRollout.check_optConvertPhysicalMtl.checked = true
			vraySceneConverterRollout.btn_convertStart.pressed()
			vraySceneConverterRollout.visible = false
			
			return true
		)
		
		return false
	),
	fn exportToVRayScene f = (
		if (doesFileExist f) do deleteFile f
		vrayExportVRScene f startFrame:0 endFrame:0 separateFiles: false exportLights: false exportNodes: false stripPaths: true 
	),
	fn runBatch bat: "sketchup-convert.bat" = (
		local o = substituteString outFile @"\" "/"
		local v = substituteString vrscene @"\" "/"
		local s = getSketchupExe()
		
		local args = s + ";" + v + ";" + o		
		
		local cmd = bat + " \"" +  args + "\""
		
		local curDir = sysInfo.currentDir
		sysInfo.currentDir = currentPath
		
		hiddenDosCommand cmd exitCode: &exitcode donotwait: false
		
		sysInfo.currentDir = curDir		
	),
	fn getFilesRecursive r pattern: "*.*" = (
        local dd = getDirectories (r + "/*")
        local ff = getFiles (r + "/" + pattern)
        for i in dd do join ff (getFilesRecursive i pattern: pattern)
        
        return ff
    ),
	fn collectMaps = (
		local p = this.input
		local pp = this.tmpOut
		
		local collectTypes = #(".jpg", ".jpeg", ".png", ".tiff", ".tif", ".tga", ".bmp", ".exr", ".hdr", ".osl")
		local ff = getFilesRecursive p
		
		local list = #()
		for f in ff do (
			local t = toLower (getFilenameType f)
			if (findItem collectTypes t != 0) do appendIfUnique list f
		)
		
		for l in list do (
			local nn = pp + (filenameFromPath l)
			copyFile l nn
		)		
	),
	fn convertMax2Skp = (
		if (this.scn == undefined) do return false
		
		local p = this.input
		
		loadMaxFile (this.scn) quiet: true
		
		local polys = polyCount objects
		local v = getVer()
		local r = getRender()
		
		this.changeRenderToVRay()
		this.convertWithVRayUtils()
		this.exportToVRayScene this.vrscene
		this.collectMaps()
		
		this.j.addData json "scene" (maxFileName)		
		this.j.addData this.json "program" "sketchup"
		j.addData json "version" v
		j.addData json "render" r
		this.j.addData this.json "ao" false
		this.j.addData this.json "aoType" "none"
		this.j.addData this.json "polys" polys[1]
		this.j.addData this.json "verts" polys[2]		
		this.j.addData this.json "size" (getDim objects)		
		this.j.addData this.json "units" (getUnits())
		this.j.addData this.json "objectsCount" (objects.count)
		this.j.addData this.json "materialsCount" (getMaterialsCnt())
		this.j.addData json "authorsVersions" #(v)
		this.j.addData json "versionsAndRenders" #(#(#(v, r)))
		
		saveMaxFile (p + "___SKP.max") quiet: true
		try (resetMaxFile #noprompt) catch ()
		
		sleep 0.01
		
		local template = @"C:\temp\template.skp"
		deleteFile template
		copyFile (currentPath + "template.skp") template
		
		this.runBatch()
	),
	fn makeArchive = (			
		archivate this.zip this.tmpOut
		this.j.addData json "name" (filenameFromPath this.zip)						
		this.j.addData json "sizeMb" (getFileMb this.zip)
	),
	fn makeJson = (
		this.j.writeJson this.jsonFile this.json
	),
	
	fn init input: "" out: ""  name: "" = (
		this.json = #()
		
		local p = out
		local pp = p + name + @"\"		
		makeDir pp all: true
		
		this.input = input
		this.scn = getMaxFile input
		local n = getRealName this.scn
		
		this.preview = p + name + ".png"
		this.vrscene = input + name + ".vrscene"
		this.zip = p + name + "-SKP.zip"
		this.outFile = pp + n + ".skp"
		this.jsonFile = p + name + "-SKP.json"
		this.tmpOut = pp
	)
)

/*
(	
	local skpMgr = SketchupConverterWrapper()
	skpMgr.init input: @"C:\Users\user\Desktop\test_skp\2241\" out: @"C:\Users\user\Desktop\test_skp\Processed\" name: "2241"
	skpMgr.convertMax2Skp()	
	skpMgr.makeArchive()
	skpMgr.makeJson()	
)
*/

struct BlenderGLBWrapper (
	currentPath = getFileNamePath (getThisScriptFileName()),
	pythonScriptGenIni = currentPath + "blender-gen-ini.py",	
	pythonScriptconvertGLB2Blend = currentPath + "blender-import-glb.py",	
	pythonScriptZoomExtends = currentPath + "blender-zoom-extends.py",
	pythonScriptRender = currentPath + "blender-render.py",
	
	hdr = currentPath + @"model-viewer\hdri\studio.hdr",
	blenderLocation = @"C:\Program Files\Blender Foundation\",
	file = "",	
	ini = "",
	zip = "",
	preview = "",
	outFile = "",
	tmpOut = "",
	json = "",
	jsonFile = "",
	j = JsonWrapper(),
	
	fn archivate n o = (
		if (not doesDirectoryExist o) do return false
		
		local args = n + ";" + o
		args = substituteString args "/" @"\"
		
		local cmd = "archivate.bat \"" +  args + "\""
		
		local curDir = sysInfo.currentDir
		sysInfo.currentDir = currentPath
		
		hiddenDosCommand cmd exitCode: &exitcode donotwait: false
		
		sysInfo.currentDir = curDir
	),	
	fn getFileMb f = (
		if (not doesFileExist f) do return 0.0
		s = (getFileSize f) / 1048576.0
		return ((s * 100) as integer) / 100.0
	),
	fn getBlenderExe = (
		local d = (getDirectories (blenderLocation + "*"))[1]			
		if (d == undefined) do return undefined
		local b = d + "blender.exe"
		if (not doesFileExist b) do return undefined
		return b
	),
	fn isBlenderExist = (
		local b = getBlenderExe()
		if (b == undefined) do return false
		return true
	),
	fn runBatch script = (
		local f = outFile
		local b = getBlenderExe()
		
		local args = b + ";" + f + ";" + script
		args = substituteString args "/" @"\"
		
		local cmd = "blender-bg-run.bat \"" +  args + "\""
		
		local curDir = sysInfo.currentDir
		sysInfo.currentDir = currentPath
		
		hiddenDosCommand cmd exitCode: &exitcode donotwait: false
		
		sysInfo.currentDir = curDir
	),
	fn runImport script bat: "blender-bg-import.bat" = (
		local f = file
		local o = outFile
		local b = getBlenderExe()
		
		local args = b + ";" + script + ";" + f + ";" + o
		args = substituteString args "/" @"\"
		
		local cmd = bat + " \"" +  args + "\""
		
		local curDir = sysInfo.currentDir
		sysInfo.currentDir = currentPath
		
		hiddenDosCommand cmd exitCode: &exitcode donotwait: false
		
		sysInfo.currentDir = curDir		
	),	
	fn contrastImage f = (
		local curDir = sysInfo.currentDir
		sysInfo.currentDir = this.currentPath
		
		local args = f + ";" + f
		local cmd = "contrast.bat \"" + args + "\""
		
		hiddenDosCommand cmd exitcode:&exitcode			
		sysInfo.currentDir = curDir
	),	
	fn makeRender = (
		local b = getBlenderExe()
		
		local args = b + ";" + this.pythonScriptRender + ";" + this.file + ";" + this.preview + ";" + this.hdr
		
		local cmd = "blender-render.bat \"" +  args + "\""
		
		local curDir = sysInfo.currentDir
		sysInfo.currentDir = currentPath
		
		hiddenDosCommand cmd exitCode: &exitcode donotwait: false
		
		sysInfo.currentDir = curDir
		
		this.contrastImage this.preview
	),
	fn getRealName = (
		if (maxFileName != "") do (
			local n = getFilenameFile maxFileName
			
			n = substituteString n "GC-Repack-" ""
			n = substituteString n "Repack-" ""
			n = substituteString n "repack-" ""
			n = substituteString n "GC-" ""
			n = substituteString n "-Corona" ""
			n = substituteString n "-VRay" ""
			n = substituteString n "-V-Ray" ""
			for i in #{2010..2050} do n = substituteString n (i as string) ""
			n = substituteString n "---" ""
			n = substituteString n "---" ""
			n = substituteString n "--" ""
			n = substituteString n "--" ""
			n = trimLeft (trimRight n "- ") "- "			
			n = "GC-Repack-" + n
			
			return n
		)
		
		return undefined
	),
	fn makeArchive = (
		local n = getRealName()
		local p = getFilenamePath outFile
		local ext = getFilenameType  outFile
		
		if (n != undefined) then (		
			renameFile outFile (p + n + ext)
		) else (
			n = getFilenameFile outFile
		)
		
		archivate zip tmpOut
		j.addData json "name" (n + ext)				
		j.addData json "scene" (maxFileName)
		j.addData json "sizeMb" (getFileMb zip)				
	),	
	fn deleteBlenderIni = (
		deleteFile ini
	),
	fn getBlenderData sec: "INDEX" key: undefined = (		
		if (key != undefined) do (
			return getINISetting ini sec key
		)
		
		return getINISetting ini sec
	),
	fn getDim = (		
		local w = getBlenderData sec: "DIMENSION" key: "width"
		local h = getBlenderData sec: "DIMENSION" key: "height"
		local l = getBlenderData sec: "DIMENSION" key: "length"
		
		return w + " x " + l + " x " + h
	),
	fn getUnits = (
		local u = getBlenderData key: "system_units"	
		u = toLower u
		u[1] = toUpper u[1]
		
		case u of (
			"Metric": return "Meters"
			"Imperial": return "Inches"
		)
		
		return u
	),
	fn isPackedImages = (
		return (getBlenderData key: "is_packed_images") == "True"
	),	
	fn getTextures = (
		return getBlenderData sec: "TEXTURES"
	),
	fn getPolys = (
		return getBlenderData key: "polys"
	),
	fn getVerts = (
		return getBlenderData key: "vert"
	),
	fn getRender = (
		local r = getBlenderData key: "render"
		
		if (matchpattern r pattern:"BLENDER_RENDER") do return "Blender Render"
		if (matchpattern r pattern:"CYCLES") do return "Cycles"
		if (matchpattern r pattern:"EEVEE") do return "Eevee"
		if (matchpattern r pattern:"BLENDER_EEVEE*") do return "Eevee"
		if (matchpattern r pattern:"WORKBENCH") do return "Workbench Render"
		if (matchpattern r pattern:"LUXCORE") do return "LuxCoreRender"
		if (matchpattern r pattern:"RPR") do return "Radeon ProRender"
		if (matchpattern r pattern:"RADEON_PRORENDER") do return "Radeon ProRender"
		if (matchpattern r pattern:"*OCTANE*") do return "OctaneRender"
		if (matchpattern r pattern:"APPLESEED") do return "Appleseed Render"
		if (matchpattern r pattern:"*CORONA*") do return "Corona"
		if (matchpattern r pattern:"*VRAY*") do return "VRay"
		if (matchpattern r pattern:"*renderman*") do return "RenderMan"
		if (matchpattern r pattern:"*render_man*") do return "RenderMan"
		
		return r
	),
	fn getVer = (
		return getBlenderData key: "blender_ver"		
	),	
	fn makeScreenshot = (
		local f = outFile
		local b = getBlenderExe()
		local s = pythonScriptZoomExtends
		
		local args = b + ";" + f + ";" + s + ";" + preview
		args = substituteString args "/" @"\"
		
		local cmd = "blender-screenshot.bat \"" +  args + "\""
		
		local curDir = sysInfo.currentDir
		sysInfo.currentDir = currentPath
		
		hiddenDosCommand cmd exitCode: &exitcode donotwait: false
		
		sysInfo.currentDir = curDir
		
		return preview		
	),
	fn init glb: "" name: "" = (
		json = #()
		
		local p = getFilenamePath glb
		local pp = p + name + @"\"		
		makeDir pp all: true
		
		file = glb		
		preview = p + name + ".png"
		zip = p + name + ".zip"
		outFile = pp + name + ".blend"
		ini = outFile + ".ini"
		jsonFile = p + name + ".json"
		tmpOut = pp		
	),
	fn generateBlenderIni = (
		runBatch pythonScriptGenIni
		
		local v = getVer()
		local r = getRender()
		
		j.addData json "program" "blender"
		j.addData json "version" v
		j.addData json "render" r
		j.addData json "size" (getDim())
		j.addData json "polys" (getPolys())
		j.addData json "verts" (getVerts())
		j.addData json "units" (getUnits())
		j.addData json "authorsVersions" #(v)
		j.addData json "versionsAndRenders" #(#(#(v, r)))
		
		deleteBlenderIni()
	),
	fn convertGLB2Blend = (
		runImport pythonScriptconvertGLB2Blend
		generateBlenderIni()
	),
	fn makeJson = (
		j.writeJson jsonFile json
	)
)

struct WebGLPlayerWrapper (
	currentPath = getFilenamePath (getThisScriptFilename()),
	zippedPlayer = currentPath + "model-viewer.zip",
	playerPath = currentPath + @"model-viewer\",
	imgPath =  playerPath + @"images\",	
	webserver = playerPath + "webserver.bat",
	port = "33333",
	localhost = "http://localhost:" + port,
	urlModelPreview = localhost + "/?model=",
	urlImgPreview = localhost + "/img-preview.html?id=",
	
	fn extractZip f o = (
        if (f == undefined or not doesFileExist f) do return false
        if (getFilenameType f != ".zip") do return false
		
		local args = f + ";" + o
		args = substituteString args "/" @"\"
		
		local cmd = "start /b /min extract.bat \"" +  args + "\""
		
		local curDir = sysInfo.currentDir
		sysInfo.currentDir = currentPath
		
		hiddenDosCommand cmd exitCode: &exitcode donotwait: true
		
		sysInfo.currentDir = curDir
    ),

	fn makeBrowserScreenshot f s = (
		local ne = filenameFromPath f
		local n = getFilenameFile f
		local destGLB = playerPath + ne
		
		deleteFile destGLB
		copyFile f destGLB
		
		curDir = sysInfo.currentDir
		sysInfo.currentDir = currentPath	
		
		local args = (urlModelPreview + ne) + ";" + s
		local cmd2 = "chrome-screenshot.bat \"" +  args + "\""
		hiddenDosCommand cmd2 exitcode:&exitcode	
		
		sysInfo.currentDir = curDir
	),
	
	fn previewModel f kill: "1" = (	
		local ne = filenameFromPath f
		local n = getFilenameFile f
		local destGLB = playerPath + ne
		
		deleteFile destGLB
		copyFile f destGLB
		
		curDir = sysInfo.currentDir
		sysInfo.currentDir = currentPath	
		
		local args = (urlModelPreview + ne) + ";" + kill
		local cmd = "chrome-preview.bat \"" +  args + "\""
		hiddenDosCommand cmd exitcode:&exitcode	
		
		sysInfo.currentDir = curDir
	),
	
	fn previewImg id kill: "1" type: #web = (				
		if (type == #local) do (					
			local ne = filenameFromPath id
			local n = getFilenameFile id			
			local destImg = imgPath + ne
			
			deleteFile destImg
			copyFile id destImg
			id = "/images/" + ne
		)
		
		curDir = sysInfo.currentDir
		sysInfo.currentDir = currentPath	
		
		local args = urlImgPreview + id + ";" + kill
		local cmd2 = "chrome-preview.bat \"" +  args + "\""
		hiddenDosCommand cmd2 exitcode:&exitcode	
		
		sysInfo.currentDir = curDir
	),
	
	fn startWebServer  = (
		makeDir imgPath all: true
		for i in (getFiles (imgPath + "*.*")) do deleteFile i
		for i in (getFiles (playerPath + "*.glb")) do deleteFile i
		
		if (doesFileExist zippedPlayer /*and not doesFileExist webserver*/) do (
			extractZip	zippedPlayer playerPath
		)
		
		if (not doesFileExist webserver) do return  messageBox "Can't find Model Viwer Player or Webserver, please reinstall script!" title: "Warining!"
		
		curDir = sysInfo.currentDir
		sysInfo.currentDir = playerPath	
		
		local args = playerPath + ";" + port
		local cmd = "start /b /min " + (filenameFromPath webserver) + " \"" +  args + "\""
		
		hiddenDosCommand cmd exitcode:&exitcode	
	),
	
	fn run = (
		startWebServer()
	)
)


struct WebRequestWrapper (
	currentPath = getFileNamePath (getThisScriptFileName()),	
	fn read o = (
		local txt = ""
		if (o == "" or not doesFileExist o) do return ""
		local data = (dotNetClass "System.IO.File").readAllLines o
		
		for i in data do txt += i + "\n"
		
		txt = trimLeft (trimRight txt)
		
		return txt
	),
	fn get u = (
		local o = @"c:\temp\" + "tmp_webRequest_" + (timeStamp() as string) + ".txt"
		local args = u + ";" + o
		
		local cmd = "web-request.bat \"" +  args + "\""
		
		local curDir = sysInfo.currentDir
		sysInfo.currentDir = currentPath
		
		hiddenDosCommand cmd exitCode: &exitcode donotwait: false
		
		sysInfo.currentDir = curDir
		
		local data = this.read o
		
		deleteFile o
		
		return data
	)
)

struct GCUploaderWrapper (
	prod = #("https://greatcatalog.net/api/cron-processing-autoconverted.php?k=profdDFkljio3245ldsvvvvws214Po2", "gc-autoconverted"),
	test = #("https://t2.greatcatalog.net/api/cron-processing-autoconverted.php?k=devIddqdd3Depo989dsfNUiygw27D", "dev-gc-autoconverted-eu-1"),
	currentPath = getFileNamePath (getThisScriptFileName()),
	uploadDir = "",
	root = "",
	cred = prod,
	cli = @"C:\Program Files\Amazon\AWSCLIV2\aws.exe",
	isCliExist = doesFileExist cli,
		
	fn trim s tag: " " = (
		return trimLeft (trimRight s tag) tag
	),
	fn rmDir d = (
		local cmd = "rmdir /S /Q \"" + d + "\""
		HiddenDOSCommand cmd donotwait: false
	),
	fn upload d b = (
		if (d.count > 3) do d = trimRight d @"\"
		local args = d + ";" + b
		
		local ff = getFiles (d + @"\*.*")
		local cnt = ff.count as string
		
		logging ("Start uploading to AWS " + cnt + " files...")
		
		local cmd = "sync-to-aws.bat \"" +  args + "\""
		
		local curDir = sysInfo.currentDir
		sysInfo.currentDir = currentPath
		
		hiddenDosCommand cmd exitCode: &exitcode donotwait: false
		
		sysInfo.currentDir = curDir
		
		logging "Uploading to AWS done!"
	),
	fn syncCRON = (
		logging "Start CRON sync..."
		
		-- Web Request
		local r = (WebRequestWrapper()).get this.cred[1]
		if (r == "All Done") do (
			logging "CRON processed successfully!"
			logging ("CRON command: " + r as string)
			return true
		)
		
		logging "CRON did not send the All Done command!!!"
		logging ("CRON command: " + r as string)
		return false
	),
	fn init uploadDir mode: #prod = (
		this.uploadDir = uploadDir
		this.root = substituteString this.uploadDir @"Processed\" ""
		if (mode == #test) do this.cred = this.test
	),
	fn run = (
		if (not isCliExist) do return messageBox "Please install the AWS CLI V2 utility!" title: "Error!"
		
		this.upload this.uploadDir this.cred[2]
		local isCronSynced = this.syncCRON()
		if (not isCronSynced) do  return messageBox "Problem with CRON synchronization, try running the process again!" title: "Error!"
		
		this.rmDir this.root
		makeDir this.root all: true
		messageBox "Upload files to DB was successful!" title: "Success!"
	)
)

struct GCDownloaderWrapper (
	currentPath = getFileNamePath (getThisScriptFileName()),
	count = 30,
	prod = "https://greatcatalog.net/api/get-version-for-conversion.php?key=prodJq8PsdWdf34ffFtoMa698aidf22&count=",
	test = "https://t2.greatcatalog.net/api/get-version-for-conversion.php?key=iddqD2024IFjodtoMa63ta45fsdaf23&count=",
	cred = prod,
	data = "",
	downloadDir = "",
	fn trim s tag: " " = (
		return trimLeft (trimRight s tag) tag
	),
	fn download u f = (
		logging "Start downloading files..."
		
		local args = u + ";" + f
		
		local cmd = "download.bat \"" +  args + "\""
		
		local curDir = sysInfo.currentDir
		sysInfo.currentDir = currentPath
		
		hiddenDosCommand cmd exitCode: &exitcode donotwait: false
		
		sysInfo.currentDir = curDir
		
		logging "Downloading files done!"
	),
	fn readResponce r = (
		if (r == undefined) do return undefined
		
		local s = r.GetResponseStream()
		local sr = dotNetObject "System.IO.StreamReader" s
		return sr.ReadToEnd()
	),
	fn getRequest url timeoutMin: 180 = (
		local w = (dotNetClass "System.Net.WebRequest").Create (url  + "&time=" + (timestamp() as string))
		w.Timeout = timeoutMin * 60 * 1000
		
		try (	
			local spm = dotNetClass "System.Net.ServicePointManager"
			spm.SecurityProtocol = spm.SecurityProtocol.TLS12				
			
			w.Method = "GET"		
			w.UserAgent = "Mozilla/5.0"
			
			local r = w.GetResponse()
			
			return (readResponce r)
		) catch ()
			
		return undefined
	),
	fn fileSize f = (
		return try ((getFileSize f) as float) catch (0.0)
	),
	fn isValidFile f = (
		if (not doesFileExist f) do return false
		local size = fileSize f
		if (size == 0.0) do return false
		if (size > 2000) do return true
		local ss = (dotnetClass "System.IO.File").ReadAllLines f
		return findString ss[1] ("xml version=") == undefined
	),
	fn getFilesName ff = (
		return for i in ff collect (getFilenameFile f)
	),
	fn run = (
		local u = cred + (count as string)
		this.data = this.getRequest u
		
		if (this.data == undefined) do return messageBox "Unable to retrieve data from the server!" title: "Error!"
		local dd = FilterString this.data "\n"
		local errors = #()
		local haystack = #()
		
		if (dd.count == 0) do return messageBox "The list of files from the server came empty!" title: "Notify!"
		
		for i in 1 to dd.count do (
			local d = FilterString  dd[i] "|"
			local n = d[1]
			local u = d[2]
			
			if (n == undefined or u == undefined) do (
				appendIfUnique errors ("Can't parse the string " + dd[i])
				continue
			)
			
			append haystack #(n, u)
		)
		
		if (errors.count > 0) do (
			local m = (errors.count as string) + " errors found!\nDo you want to continue?\n\n"
			for i in errors do m += i + "\n"
			
			local q = queryBox m title: "Notify!"
			if (not q) do return false
		)
		
		local errorsFiles = #()
		local successFiles = #()
		local existFiles = #()
		
		progressStart "Downloading..."
		escapeEnable = true
		clearListener()
		
		for i in 1 to haystack.count do (
			local h = haystack[i]
			local f = this.downloadDir + (this.trim h[1]) + ".zip"
			local u = this.trim h[2]
			
			if (doesFileExist f) do (
				appendIfUnique existFiles f
				appendIfUnique successFiles f
				progressUpdate (100.0 * i / haystack.count)
				windows.processPostedMessages() 
				continue
			)
			
			if (getProgressCancel() or keyboard.escPressed) do return false
			
			this.download u f
			
			if (getProgressCancel() or keyboard.escPressed) do return false
			
			if (not this.isValidFile f) then (
				appendIfUnique errorsFiles f
				deleteFile f
			) else (
				appendIfUnique successFiles f
			)
			
			progressUpdate (100.0 * i / haystack.count)
			windows.processPostedMessages() 
		)
		
		progressEnd()
		
		if (errorsFiles.count > 0 and successFiles.count == 0) do (
			local m = "Files were not downloaded!"
			return messageBox m title: "Error!"
		)
		
		if (errorsFiles.count > 0 and successFiles.count > 0) do (
			local m = (errorsFiles.count as string) + " files were not downloaded! Try downloading again!"
			return messageBox m title: "Error!"
		)
		
		if (haystack.count != successFiles.count) do (
			local m = "Attention, not all files from the current queue have been downloaded!"
			return messageBox m title: "Error!"
		)

		if (haystack.count == existFiles.count) do (
			local m = "All files in this queue have been downloaded!"
			return messageBox m title: "Success!"
		)
	),
	fn init downloadDir mode: #prod count: 30 = (
		if (mode == #test) do this.cred = this.test
		makeDir downloadDir all: true
		this.downloadDir = downloadDir
		this.count = count
	)
)

struct BatchGLBConverterWrapper (
	selfPath = getFilenamePath (getThisScriptFilename()),
	texturesQueueNames = #(),
	normalsQueueNames = #(),
	texturesQueue = #(),
	normalsQueue = #(),
	outPath = "",
	convertexe = "",
	json = #(),
	j = JsonWrapper(),
	w = WebGLPlayerWrapper(),	
	
	fn isValidObject o = (
		return o.material != undefined and isValidNode o and not isDeleted o and canConvertTo o Editable_mesh
	),
	
	fn ungroupRecursive = (
		local s = objects
		fn tmpUngroup s = (
			local o = false
			for i in s where isGroupHead i and isValidNode i do (
				explodeGroup i
				o = true
			)
			return o
		)
		
		while k != false do k = tmpUngroup s
	),
	
	fn fixGeometry = (
		local oo = objects as array
		with redraw off (
			with undo off (
				for o in oo where this.isValidObject o do (
					ResetXForm o
					convertToMesh o
					local a = snapshot o
					a.name = o.name
					a.wirecolor = o.wirecolor
					
					if (classOf a == Editable_Mesh or classOf a == Editable_Poly) do (
						update a
					)
					try(delete o) catch()
				)
			)
		)
	),
	
	fn instnceDuplicateMaps = (
		local names = #()
		local maps = #()
		for i in getClassInstances Bitmaptexture do (
			if (i.filename == undefined or i.filename == "") do continue
			local n = toLower (filenameFromPath i.filename)
			local id = findItem names n
			if (id == 0) then (
				append names n
				maps[names.count] = #(i)
			) else (
				appendIfUnique maps[id] i
			)
		)
		
		for i in maps do (
			for id in 2 to i.count do (
				replaceInstances i[id] i[1]
			)
		)
		
		free names
		free maps
	),
	
	fn optimizeImages files: #() quality: 90 = (			
		if (files.count == 0) do return false
		
		local jpgoptim = "\"" + this.selfPath + "jpegoptim.exe\""
		local p = getFilenamePath files[1]
		makeDir p all: true
		
		
		curDir = sysInfo.currentDir
		sysInfo.currentDir = p
		
		local imgs = ""
		
		for i in files do imgs += "\"" + (filenameFromPath i) + "\" "
		
		local cmd = jpgoptim + " --strip-all --all-progressive -f -o -q -m" + (quality as string) + "  " + imgs
		
		hiddenDosCommand cmd exitcode:&exitcode	
		
		sysInfo.currentDir = curDir 
	),
	
	fn deployConvertExe = (
		local convertexe = this.selfPath + "convert.exe"
		local tmpDir = @"C:\temp\"
		local tmpConvertexe = tmpDir + "convert.exe"
		makeDir tmpDir
		copyFile convertexe tmpConvertexe
		return tmpConvertexe
	),
	
	fn convertImageTo f isDelete: true type: #jpg = (		
		local p = getFilenamePath f
		local n = getFilenameFile f
		local ext = getFilenameType f		
		local exe = this.convertexe
		
		local tt = case type of (
			#png: ".png"
			default: ".jpg"
		)
		
		local ff = p + n + tt
		
		local curDir = sysInfo.currentDir
		sysInfo.currentDir = this.selfPath	
		
		local cmd = exe + " \"" + f + "\" \"" + ff + "\""									
		hiddenDosCommand cmd exitcode:&exitcode			
		sysInfo.currentDir = curDir
		
		if (isDelete and ext != tt) do deleteFile f
		
		this.optimizeImages files: #(ff)
		
		return ff
	),
	
	fn contrastImage f = (
		local curDir = sysInfo.currentDir
		sysInfo.currentDir = this.selfPath
		
		local args = f + ";" + f
		local cmd = "contrast.bat \"" + args + "\""
		
		hiddenDosCommand cmd exitcode:&exitcode			
		sysInfo.currentDir = curDir
	),
	
	fn clampImageColors f = (
		local curDir = sysInfo.currentDir
		sysInfo.currentDir = this.selfPath
		
		local args = f + ";" + f
		local cmd = "clamp-colors.bat \"" + args + "\""
		
		
		hiddenDosCommand cmd exitcode:&exitcode			
		sysInfo.currentDir = curDir
	),
	
	fn resizeImage f maxSize: 2048 type: #jpg = (
		local size = maxSize as string + "x" + maxSize as string + @">"
		
		local convertexe = this.selfPath + "convert.exe"
		local tmpDir = @"C:\temp\"
		local tmpConvertexe = tmpDir + "convert.exe"
		makeDir tmpDir
		copyFile convertexe tmpConvertexe
		
		local exe = tmpConvertexe
		
		if (doesFileExist f and getFileSize f > 0) do return f
		
		local curDir = sysInfo.currentDir
		sysInfo.currentDir = this.selfPath	
		
		local cmd = exe + " \"" + f + "\" -resize \"" + size + "\" \"" + f + "\""									
		hiddenDosCommand cmd exitcode:&exitcode			
		sysInfo.currentDir = curDir
		
		this.optimizeImages files: #(f)
		
		return f	
	),
	
	fn getSceneDir = (
		local n = this.getSceneName()
		local p = maxFilePath
		if (p == "") do p = this.outPath + n + @"\"
		return p
	),
	
	fn getCacheMapsDir = (
		local p = (getSceneDir()) + @"_glb_cache\"
		makeDir p all: true
		return p
	),
	
	fn getUnusedDirs = (
		local s = this.getSceneName()		
		local dd = #()
		
		append dd (this.outPath + s + @"\")
		
		return dd
	),
	
	fn generateCacheFilename type: #jpg = (
		local p = this.getCacheMapsDir()
		local ext = case type of (
			#png: ".png"
			default: ".jpg"
		)
		
		return p + "__cache_" + (timeStamp() as string) + ext
	),
		
	fn getCurrentMaxVersion = (
		local v = maxVersion()
		v = (v[1] / 1000) - 2
		
		return (2000 + v) as string
	),
	
	fn clearCacheMapsDir = (
		local p = getCacheMapsDir()
		for i in getFiles (p + "__cache_*.jpg") do deleteFile i
	),
	
	fn getSceneName = (
		return getFileNameFile maxFileName
	),
	
	fn getMapChannel t = (
		for i in (getClassInstances Bitmaptexture target: t) do (
			return try (i.coords.mapChannel) catch (1)
		)
		
		return 1
	),
	
	fn renderTargetMap t size: [2048, 2048] isReplace: true type: #jpg clamp: true = (
		if (t == undefined) do return undefined
		
		local mapChannel = getMapChannel t		
		local p = this.getCacheMapsDir()
		makeDir p all: true
		local f = this.generateCacheFilename type: #png
		
		local rm = renderMap t size: size filename: f --display: true  --into: lm
		rm.gamma = 2.2
		rm.filename = f		
		
		save rm
		close rm
		
		if (type != #png) do (
			f = this.convertImageTo f type: #jpg
		)
		
		if (clamp) do this.clampImageColors f
		
		this.optimizeImages files: #(f)
		
		local bt = Bitmaptexture filename: f
		bt.coords.mapChannel = mapChannel
		
		if (isReplace) do replaceInstances t bt
		
		return bt 
	),
	
	fn getMapFullPath f = (
		return mapPaths.getFullFilePath (filenameFromPath f)
	),
	
	fn cacheBitmap t resize: true type: #jpg clamp: true = (
		local f = t.filename
		if (f == undefined or f == "") do return undefined
		local ff = this.generateCacheFilename()
		f = this.getMapFullPath f
		
		copyFile f ff
		
		ff = this.convertImageTo ff type: type
		
		if (resize) do this.resizeImage ff		
		if (clamp) do this.clampImageColors ff
		
		t.filename = ff
		
		if (not doesFileExist ff) do return undefined
		
		return t
	),
	
	fn extractBitmapFromSlot m = (
		local a = getClassInstances Bitmaptexture target: m
		return a[1]
	),
	
	fn convertBumpToNormal t = (
		if (t == undefined) do return false
		
		local normalmap = this.selfPath + "normalmap.exe"
		local tmpDir = @"C:\temp\"
		local tmpNormalmap = tmpDir + "normalmap.exe"
		makeDir tmpDir
		copyFile normalmap tmpNormalmap
		
		local exe = tmpNormalmap
		
		local bt = undefined
		if (classOf t == Bitmaptexture) then (
			bt = this.cacheBitmap t type: #png
		) else (
			-- If possible extract one bitmap for normal
			local _tmp = this.extractBitmapFromSlot t
			if (_tmp == undefined) then (
				bt = this.renderTargetMap t isReplace: false type: #png
			) else (
				bt = this.cacheBitmap _tmp type: #png
			)
		)
		
		if (bt == undefined) do return false
		
		local f = bt.filename
		local ff = this.generateCacheFilename type: #png
		
		local p = getFilenamePath f
		makeDir p all: true
		
		curDir = sysInfo.currentDir
		sysInfo.currentDir = this.selfPath
		
		local cmd = exe + " -i \"" + f + "\" -o \"" + ff + "\""
		
		hiddenDosCommand cmd exitcode:&exitcode	
		
		sysInfo.currentDir = curDir 
		
		local nn = this.convertImageTo ff type: #jpg
		
		
		this.optimizeImages files: #(nn)
		
		deleteFile f
		
		if (classOf t == Bitmaptexture) then (
			bt.filename = nn
			return bt
		) 
		
		return Bitmaptexture filename: nn			
	),
	
	fn addTextureToQueue t = (
		if (t == undefined) do return false
		if (classOf t == Bitmaptexture and t.filename != undefined and t.filename != "") do (
			local n = toLower (filenameFromPath t.filename)
			local id = findItem this.texturesQueueNames n
			
			-- To copy			
			if (id == 0) then (
				append texturesQueue #(t)
				this.texturesQueueNames[this.texturesQueue.count] = n
				
				return true
			) else (
				return appendIfUnique this.texturesQueue[id] t
			)
		)
	
		-- To bake
		-- To bake map, cnt = 1, classOf not Bitmaptex
		return append this.texturesQueue #(t)
	),	
	
	fn addNormalToQueue t = (
		if (t == undefined) do return false
		
		if (classOf t == CoronaNormal and t.normalMap != undefined) do (
			local b =  t.normalMap
			-- Kill CoronaNormal
			replaceInstances t b
			return this.addTextureToQueue b
		) 
		
		-- To convert
		if (classOf t == Bitmaptexture and t.filename != undefined and t.filename != "") do (
			local n = toLower (filenameFromPath t.filename)
			local id = findItem this.normalsQueueNames n
			
			-- To convert to normal
			if (id == 0) then (
				append this.normalsQueue #(t)
				this.normalsQueueNames[this.normalsQueue.count] = n
				
				return true
			) else (		
				return appendIfUnique this.normalsQueue[id] t
			)
		)
		
		-- To bake map and convert to normal, cnt = 1, classOf not Bitmaptex
		return appendIfUnique normalsQueue #(t)
	),
	
	fn renderNormalsQueue = (
		for t in this.normalsQueue do (
			if (classOf t[1] == Bitmaptexture) then (					
				local n = this.convertBumpToNormal t[1]
				for i in t where n != false do replaceInstances i n
			) else (
				local n = this.convertBumpToNormal t[1]
				if (n != undefined and n != false) do replaceInstances t[1] n
			)				
		)
	),
	
	fn renderTexturesQueue = (			
		for t in this.texturesQueue do (
			if (classOf t[1] == Bitmaptexture) then (
				local b = cacheBitmap t[1]
				for i in t where i != undefined and b != undefined do replaceInstances i b
			) else if (t[1] != undefined) then (				
				this.renderTargetMap t[1] isReplace: true type: #jpg
			)				
		)
	),
	
	fn getMaterialsWithFalloff = (
		local o = #()
		for i in getClassInstances CoronaPhysicalMtl where i.baseTexmap != undefined do (
			for ii in getClassInstances Falloff target: i.baseTexmap do (
				append o i
				exit
			)
		)
		return o
	),
	
	fn neutralizeMeshSmooth = (
		local a = #()
		for i in getClassInstances MeshSmooth do appendIfUnique a i
		for i in getClassInstances TurboSmooth do appendIfUnique a i
			
		for i in a do (
			if (i.renderIterations > i.iterations) do i.iterations = i.renderIterations
			try (i.isolineDisplay = false) catch ()
		)
	),
	
	fn neutralizeRaySwitch = (
		for i in getClassInstances CoronaRaySwitchMtl do (
			if (classOf i.giMtl == CoronaPhysicalMtl and i.giMtl.baseTexmap == undefined) then (
				if (i.directMtl != undefined) then (
					replaceInstances i i.directMtl
				) else if (i.reflectMtl != undefined) then (
					replaceInstances i i.reflectMtl
				) else if (i.refractMtl != undefined) then (
					replaceInstances i i.refractMtl
				) else (
					replaceInstances i i.giMtl
				)
			) else if (i.giMtl != undefined) do (
				replaceInstances i i.giMtl
			)
		)
	),
	
	fn replaceToBlackEmptyBitmap = (
		for i in getClassInstances Bitmaptexture do (
			if (i.filename != undefined and i.filename != "") do continue
			local f = this.generateCacheFilename()
			local b = bitmap 128 128 color: (color 5 5 5)
			b.filename = f
			save b
			close b
			
			i.filename = f
		)
	),
	
	fn neutralizeCoronaMix = (
		for i in getClassInstances CoronaMix do (
			local nm = Mix()
			nm.name = i.name + "_" + (random 1000 10000) as string
			
			nm.mixAmount = i.mixAmount * 100.0
			nm.mask = i.texmapMix
			
			nm.color1 = i.colorTop
			nm.color2 = i.colorBottom
			
			nm.map1 = i.texmapTop
			nm.map2 = i.texmapBottom
			
			replaceInstances i nm
		)
	),
	
	fn neutralizeFalloff = (
		for i in getClassInstances Falloff do (
			local nm = Mix()
			nm.name = i.name
			
			nm.mixAmount = 50.0
			
			nm.color1 = i.color1
			nm.color2 = i.color2
			
			nm.map1 = i.map1
			nm.map2 = i.map2
			
			if (classOf i.map1 == Bitmaptexture) do (
				return replaceInstances i i.map1
			)
			if (nm.map2 == undefined) do nm.map2 = nm.map1
			
			replaceInstances i nm
		)
	),
	
	fn neutralizeDoubleSided = (
		for i in getClassInstances doubleSided do (
			local nm = i.material1
			nm.name = i.name
			
			replaceInstances i nm
		)		 
	),
	
	fn neutralizeNoise = (
		for i in getClassInstances Noise do (
			i.color1 = gray
			i.color2 = gray
		)
	),
	
	fn neutralizeCoronaSkinMtl = (
		for i in getClassInstances CoronaSkinMtl do (
			local nm = CoronaPhysicalMtl()			
			nm.name = i.name
			nm.baseColor = i.skinColor
			nm.baseTexmap = i.texmapSkinColor
			nm.baseRoughness = 1.0 - i.reflection1Glossiness
			nm.baseIor = i.reflection1Ior
			
			replaceInstances i nm
		)
	),
	
	fn neutralizeCoronaLayered = (
		for i in getClassInstances CoronaLayeredMtl do (
			local nm = i.baseMtl
			nm.name = i.name
			
			replaceInstances i nm
		)
	),
	
	fn neutralizeBlendMtl = (
		for i in getClassInstances Blend do (
			local nm = i.map1
			nm.name = i.name
			
			replaceInstances i nm
		)
	),
	
	fn neutralizeCoronaAO = (
		for i in getClassInstances CoronaAO do (
			i.texmapOccluded = i.texmapUnoccluded
			i.colorOccluded = color 128 128 128
			i.colorUnoccluded = i.colorOccluded 
		)
	),
	
	fn setVrayMtlFogColorToDiffuse = (
		for i in getClassInstances VRayMtl do (
			if (i.refraction_fogColor == white) do continue
			if (i.Refraction == black) do continue
			
			i.Diffuse = i.refraction_fogColor
		)
	),
	
	fn normalizeRealWorldUVWbyTiling = (
		for o in objects do (
			if (not isValidNode o or isDeleted o or not (canConvertTo o Editable_Mesh) or classOf o.material == undefined) do continue
			
			global normalizeBitmaps = #()
			global normalizeValues = #()
			global normalizeOffsets = #()
			
			fn normalizeMaterialTiling m o id = (
				local bb = getClassInstances Bitmaptexture target: m
				if (bb.count == 0) do continue
				local isRealWorld = try(bb[1].coords.realWorldScale == true) catch (false)
				
				try (bb[1].coords.realWorldScale = false) catch ()
				local u = bb[1].coords.U_Tiling as float
				local v = bb[1].coords.V_Tiling as float
				local uOffset = bb[1].coords.U_Offset as float
				local vOffset = bb[1].coords.V_Offset as float
				
				if (u == 1.0 and v == 1.0) do continue
				
				local moVolSelect = Vol__Select()
				moVolSelect.level = 2
				moVolSelect.volume = 5
				moVolSelect.matID = id
				addModifier o moVolSelect
				
				local modUvwXForm = UVW_Xform()
				modUvwXForm.U_Tile = u
				modUvwXForm.V_Tile = v
				modUvwXForm.U_Offset = uOffset
				modUvwXForm.V_Offset = vOffset
				addModifier o modUvwXForm
				
				for b in bb do (
					try (b.coords.realWorldScale = false) catch ()
					
					if (appendifUnique normalizeBitmaps b) do (
						local _u = b.coords.U_Tiling / u
						local _v = b.coords.V_Tiling / v
						local _uOffset = b.coords.U_Offset - uOffset
						local _vOffset = b.coords.V_Offset - vOffset
						
						append normalizeValues #(_u, _v)
						append normalizeOffsets #(_uOffset, _vOffset)
					)
					
					--b.coords.U_Tiling = b.coords.U_Tiling / u
					--b.coords.V_Tiling = b.coords.V_Tiling / v
				)
			)
			
			if (classOf o.material == Multimaterial) then (
				for id in o.material.materialIDList do (
					local m = o.material.materialList[id]
					if (m == undefined) do continue
					
					normalizeMaterialTiling m o id
				)								
			) else (
				normalizeMaterialTiling o.material o 1
			)
			
			for i in 1 to normalizeBitmaps.count do (
				local b = normalizeBitmaps[i]
				b.coords.U_Tiling = normalizeValues[i][1]
				b.coords.V_Tiling = normalizeValues[i][2]
				b.coords.U_Offset = normalizeOffsets[i][1]
				b.coords.V_Offset = normalizeOffsets[i][2]
			)
			
			convertToMesh o
		)
	),
	
	fn coronaLightMtlToGltfMaterial = (
		for i in getClassInstances CoronaLightMtl do (
			local nm = glTFMaterial()
			nm.name = i.name
			
			nm.emissionColor = i.color
			nm.emissionMap = i.texmap
			if (i.opacityTexmap != undefined) do (
				nm.AlphaMap = i.opacityTexmap
				this.addTextureToQueue nm.AlphaMap
				nm.alphaMode = 2
			)
			
			replaceInstances i nm	
		)
	),
	
	fn clampColor c = (
		if (c == black) do return color 6 6 6
		if (c == white) do return color 248 248 248
		return c
	),
	
	fn isGlass i = (		
		if (i.refractionAmount >= 0.75 and i.baseRoughness < 0.5) do return true
		if (MatchPattern i.name pattern: "*glass*") do return true
		return false
	),
	
	fn coronaPhysicalMtlToGltfMaterial falloffMaterials: #() = (			
		for i in getClassInstances CoronaPhysicalMtl do (
			i.roughnessMode = 0
			local nm = glTFMaterial()
			nm.name = i.name
			nm.DoubleSided = true
			
			local isUsedFalloff = (findItem falloffMaterials i) != 0
			local preset = #none
			
			if (isUsedFalloff) do preset = #cloth
			if (this.isGlass i) do preset = #glass			
			
			-- Diffuse				
			if (i.baseTexmap != undefined) then (
				nm.baseColorMap = i.baseTexmap
				this.addTextureToQueue nm.baseColorMap
				
				if (i.baseLevel != 1.0) do (
					local c = i.baseLevel * 255.0
					nm.baseColor = color c c c
					nm.baseColor = this.clampColor nm.baseColor
				)
			) else (
				nm.baseColor = this.clampColor i.basecolor
			)
			
			-- Roughness
			nm.roughness = if (i.roughnessMode == 1) then (1.0 - i.baseRoughness) else (i.baseRoughness)
			if (i.baseRoughnessTexmap != undefined) then (
				nm.roughnessMap = i.baseRoughnessTexmap
				this.addTextureToQueue nm.roughnessMap
				
				if (nm.roughness == 1) do nm.roughness = 0.75
			) else if (isUsedFalloff and nm.roughness == 0) do (
				nm.roughness = 0.75
			)
			
			-- Opacity
			if (i.opacityTexmap != undefined) do (
				-- Force bake Alpha (Tiling not supported)
				local cc = Color_Correction()
				-- Invert
				--cc.rewireMode = 2
				cc.map = i.opacityTexmap
				nm.AlphaMap = cc
				this.addTextureToQueue cc
				nm.alphaMode = 2
			)
			
			-- Bump
			nm.normal = i.baseBumpMapAmount
			if (nm.normal > 0.2) do nm.normal = 0.2
			if (i.baseBumpTexmap != undefined) do (
				nm.normalMap = copy i.baseBumpTexmap
				this.addNormalToQueue nm.normalMap
			)
			
			-- Displace
			if (i.displacementTexmap != undefined) do (
				nm.normalMap = copy i.displacementTexmap
				this.addNormalToQueue nm.normalMap
				nm.normal = 0.8
			)
			
			-- Metalness
			nm.metalness_map = i.metalnessTexmap
			this.addTextureToQueue nm.metalness_map 
			
			if (i.metalnessMode == 1) do (
				nm.metalness = 1
			)
			
			-- IOR
			nm.enableIndexOfRefraction = true
			nm.indexOfRefraction = i.baseIor
			if (i.baseIor < 1.1) do nm.roughness = 1.0
			
			-- Self Illumination
			if (i.selfIllumLevel != 0) do (
				nm.emissionColor = i.selfIllumColor
				nm.emissionMap = i.selfIllumTexmap
				this.addTextureToQueue nm.emissionMap
			)
			
			-- Refraction
			if (i.refractionAmountTexmap != undefined) then (
				nm.AlphaMap = i.refractionAmountTexmap
				this.addTextureToQueue nm.AlphaMap
				nm.alphaMode = 3
			) else if (i.refractionAmount != 0) do (
				local c = (1.0 - i.refractionAmount) * 255.0
				
				-- Clamp black color
				if (c < 30) do c = 30
				
				nm.AlphaMap = ColorMap()
				nm.AlphaMap.solidcolor = color c c c
				nm.alphaMode = 3
				
				this.addTextureToQueue nm.AlphaMap
			)
			
			-- Clearcoat
			if (i.clearcoatAmount != 0) do (
				nm.enableClearCoat = true
				nm.clearcoat = i.clearcoatAmount
				nm.clearcoatMap = i.clearcoatAmountTexmap
				this.addTextureToQueue nm.clearcoatMap
				
				nm.clearcoatNormal = i.clearcoatBumpMapAmount
				nm.clearcoatNormalMap = copy i.clearcoatBumpTexmap
				addNormalToQueue nm.clearcoatNormalMap
				
				nm.clearcoatRoughness = i.clearcoatRoughness
				nm.clearcoatRoughnessMap = i.clearcoatRoughnessTexmap
				this.addTextureToQueue nm.clearcoatRoughnessMap
			)
			
			-- Sheen
			if (i.sheenAmount != 0) then (
				nm.enableSheen = true					
				nm.sheenColor = i.sheenColor
				nm.sheenRoughness = i.sheenRoughness
				nm.sheenColorMap = i.sheenColorTexmap
				this.addTextureToQueue nm.sheenColorMap
				
				nm.sheenRoughnessMap = i.sheenRoughnessTexmap
				this.addTextureToQueue nm.sheenRoughnessMap
			)
			
			-- Force Clamp Roughness
			if (nm.roughness > 0.75) do nm.roughness = 0.75
			
			-- Force set prams for specific presets
			if (preset == #cloth) do (
				nm.normal = 0.25
				
				if (i.sheenAmount != 0) do (
					nm.enableSheen = true
					nm.sheenRoughness = 0.3
					nm.sheenColor = color 65 65 65
					nm.metalness = 0
				)
			)
			
			if (preset == #glass) do (
				nm.roughness = 0.15
				nm.DoubleSided = true
				nm.enableClearCoat = true
				nm.clearcoat = 1
				nm.clearcoatRoughness = 1
				nm.enableSheen = true
				nm.sheenRoughness = 0.3
				nm.sheenColor = color 255 255 255 255
				nm.indexOfRefraction = 20
				nm.AlphaMap = ColorMap()
				nm.AlphaMap.solidcolor = color 110 110 110
				nm.alphaMode = 3
				
				this.addTextureToQueue nm.AlphaMap
			)
			
			
			-- Replacement
			replaceInstances i nm				
		)
	),

	fn convertToCorona = (
		::CoronaConverterSuppressGui = true
		::CoronaConverter 
		local ff = getFiles (@"c:\Program Files\Corona\Corona Renderer for 3ds Max\" + getCurrentMaxVersion() + @"\Scripts\coronaConverter*.ms")
		try (fileIn ff[1]) catch ()
		
		::CoronaConverter.converterTools.convertCoronaBitmapToBitmap()
		::CoronaConverter.converterSettings.convertCoronaLegacyMtl = true
		::CoronaConverter.CoronaConverterRoll.convertCoronaLegacyMtlCheckbox.checked = true
		
		::CoronaConverter.convertScene()
		
		::CoronaConverterSuppressGui = false
	),
	
	fn autoUnwrap obj = (
		with redraw off with undo off (
			select obj
			max hierarchy mode
			modPanel.addModToSelection (Unwrap_UVW ()) ui:on
			subobjectLevel = 3
			local uvw =  obj.modifiers[1]
			uvw.setMapChannel 2
			uvw.setApplyToWholeObject true
			max modify mode
			subobjectLevel = 3
			max select all
				
			/*ss = #{}
			for i in 1 to uvw.numberPolygons() do append ss i
			uvw.selectPolygons ss*/
				
			uvw.flattenMap 50 #([1,0,0], [-1,0,0], [0,1,0], [0,-1,0], [0,0,1], [0,0,-1]) 0.0085 true 2 true true
			uvw.unwrap4.setThickOpenEdges false
			
			max select none
			subobjectLevel = 0
			convertToMesh obj  
		)				
	),
	
	fn attachObjectsByMaterials = (
		local mats = #()
		for i in objects where this.isValidObject i do appendIfUnique mats i.material
		
		local objsByMats = #()
		for i in 1 to mats.count do (
			objsByMats[i] = for o in objects where this.isValidObject o and o.material == mats[i] collect o
		)
		
		for oo in objsByMats where oo.count > 1 do (
			convertToPoly oo[1]
			for i in oo.count to 2 by -1 do (
				polyop.attach oo[1] oo[i]
				deleteItem oo i
			)
		)
		
		return for i in objsByMats collect i[1]
	),
	
	fn getDenoisedImage f = (
		local p = getFilenamePath f
		local n = getFilenameFile  f
		local ext = getFilenameType f
		local d = getFiles (p + n + "_denoised*" + ext)
		if (d[1] == undefined or not doesFileExist d[1]) do return f
		return d[1]
	),
	
	fn denoiseImage f = (
		local v = getCurrentMaxVersion()
		
		local args = v + ";" + f
		args = substituteString args "/" @"\"
		
		local cmd = "denoise.bat \"" +  args + "\""
		
		local curDir = sysInfo.currentDir
		sysInfo.currentDir = this.selfPath
		
		hiddenDosCommand cmd exitCode: &exitcode donotwait: false
		
		sysInfo.currentDir = curDir	
	),
	
	fn bakeCoronaAO obj filename ao: undefined = (
		if (ao == undefined) do return false
		
		try (convertToMesh obj) catch ()
		max tool zoomextents
		max views redraw
		clearSelection()	
		select obj
		
		local originalMaterial = obj.material
		
		local p = getFilenamePath filename
		local n = getFilenameFile filename
		local ext = getFilenameType filename
		
		makeDir p all: true
		
		renderers.current = Corona()
		local r = renderers.current
		
		local tmp_PassesLimit = r.progressive_passLimit
		r.progressive_passLimit = ao.passes
		r.denoise_filterType = 4
		r.denoise_blendAmount = 1.0
		r.shading_onlyElements = true
		renderSceneDialog.commit()
		renderSceneDialog.update()
		
		local m = CoronaPhysicalMtl()
		m.baseColor = white
		m.baseRoughness = 1.0
		local cao = CoronaAO()
		cao.maxDistance = units.decodeValue ao.size
		cao.colorSpread = 0.022
		cao.Quality = 64
		cao.normalMode = 0
		cao.rayDirectionality = 0.03
		--cao.occlusionFrom = 3
		m.baseTexmap = cao
		obj.material = m
		
		obj.iNodeBakeProperties.removeAllBakeElements() 
		local be = Corona_DiffuseColor()
		be.outputSzX = be.outputSzY = ao.resolution
		be.fileType = "jpg"
		be.filename = filename
		be.enabled = true
		be.filter = true
		obj.INodeBakeProperties.addBakeElement be
		obj.INodeBakeProperties.bakeEnabled = true
		obj.INodeBakeProperties.bakeChannel = 2
		obj.INodeBakeProperties.nDilations = 2
		select obj
		
		render rendertype:#bakeSelected vfb: true progressBar:true outputSize:[ao.resolution, ao.resolution] vfb: false
		
		this.optimizeImages files: #(filename)
		
		if (ao.denoise) do denoiseImage filename
		
		obj.material = originalMaterial
		r.progressive_passLimit = tmp_PassesLimit
	),
	
	fn getXNormal = (
		local p = @"c:\Program Files\xNormal\"
		if (not doesDirectoryExist p) do return undefined
		local dd = getDirectories (p + "*")
		local d = dd[dd.count]
		if (d == undefined) do return undefined
		
		local f = d + @"x64\xNormal.exe"
		if (not doesFileExist f) do return undefined
		
		return f
	),
	
	fn xNomralCmd fbx jpg size = (
		local selfPath = getFileNamePath (getThisScriptFileName())
			
		local curDir = sysInfo.currentDir
		sysInfo.currentDir = selfPath	
		
		local xNormal = this.getXNormal()
		if (xNormal == undefined) do return false
		
		local args = xNormal + ";" + fbx + ";" + jpg + ";" + size
		local cmd = "xnormal.bat \"" +  args + "\""
		
		hiddenDosCommand cmd exitcode:&exitcode	
		
		sysInfo.currentDir = curDir
	),
	
	fn bakeXNormalAO obj filename ao: undefined = (
		if (ao == undefined) do return false
		
		local denoise = ao.denoise
		local res = ao.resolution as string
		
		local p = getFilenamePath filename
		local n = getFilenameFile filename
		local ext = getFilenameType filename
		
		deleteFile filename
		makeDir p all: true
		
		local clone = snapshot obj
		
		channelInfo.CopyChannel clone 3 2
		channelInfo.PasteChannel clone 3 1
		
		select clone
		
		FbxImporterSetParam "Cameras" false
		FbxImporterSetParam "Lights" false
		FbxImporterSetParam "Animation" false
		FbxExporterSetParam "EmbedTextures" false
		FbxExporterSetParam "SmoothingGroups" true
		
		local nn = "__tmpBakeAO_Mesh_" + (timeStamp() as string) + ".fbx"
		local f = p + nn
		
		exportFile f #noPrompt selectedOnly: true
		local generatedFile = p + n + "_cavity" + ext
		deleteFile generatedFile
		
		this.xNomralCmd f filename res
		
		renameFile generatedFile filename
		
		delete clone
		deleteFile f
		
		this.optimizeImages files: #(filename)		
		if (ao.denoise) do denoiseImage filename
	),
	
	fn setAOmap obj f = (
		if (f == "" or not doesFileExist f) do return false
		
		local d = getDenoisedImage f
		if (d != undefined) do f = d
		
		local b = Bitmaptexture()
		b.filename = f
		b.coords.mapChannel = 2
		b.name = "AO"
		
		for i in getClassInstances glTFMaterial target: obj.material do (			
			i.ambientOcclusionMap = b
		)
	),
	
	fn createAOmap ao: undefined = (
		max unhide all
		local oo = geometry as array
		for o in oo where this.isValidObject o do (
			local n = o.material.name
			o.material = copy o.material
			o.material.name = n
			
			local f = this.generateCacheFilename()
			
			this.autoUnwrap o
			if (ao.type == #corona) do (
				this.bakeCoronaAO o f ao: ao
				this.setAOmap o f
			)
			
			if (ao.type == #xnormal) do (
				this.bakeXNormalAO o f ao: ao
				this.setAOmap o f
			)			
		)
	),
	
	fn rmDir d = (
		local cmd = "timeout /t 5 /nobreak & rmdir /S /Q \"" + d + "\""
		HiddenDOSCommand cmd donotwait: true
	),
	
	fn saveGLBScene = (
		local p = getSceneDir()
		saveMaxFile (p + "GLB.max") quiet: true
	),
	
	fn packGLTF i o = (
		local args = i + ";" + o
		args = substituteString args "/" @"\"
		
		local cmd = "gltfpack.bat \"" +  args + "\""
		
		local curDir = sysInfo.currentDir
		sysInfo.currentDir = this.selfPath
		
		hiddenDosCommand cmd exitCode: &exitcode donotwait: false
		
		sysInfo.currentDir = curDir
		
		for p in this.getUnusedDirs() do rmDir p
	),
	
	fn exportGLB p n: undefined = (
		ATSOps.Refresh()
		select geometry
		try (unhide selection doLayer: true) catch ()
		if (n == undefined) do n = this.getSceneName() 
		local pp = p + n + @"\"
		makeDir pp all: true
		local i = pp + n + ".gltf"
		local o = p + n + ".glb"
		local preview = p + n + ".png"
		
		deleteFile o
		exportFile i #noPrompt selectedOnly: true
		deleteFile (i + ".log")
		
		packGLTF i o
		
		-- JSON: Filename
		this.j.addData this.json "version" (getCurrentMaxVersion())
		this.j.addData this.json "name" (n + ".glb")
		-- JSON: Scenename
		this.j.addData this.json "scene" maxFileName
		
		-- Web Preview
		w.run()
		w.makeBrowserScreenshot	o preview
		
		return o
		-- Remove ktx2
		--for i in getFiles (glbFolder + "*.ktx2") do deleteFile i
	),
	
	fn removeExtraObjects = (
		try (delete lights) catch ()
		try (delete cameras) catch ()
	),
	
	fn getFileMb f = (
		if (not doesFileExist f) do return 0.0
		s = (getFileSize f) / 1048576.0
		return ((s * 100) as integer) / 100.0
	),
	
	fn polyCount s = (
        local iPoly = 0
		local iVert = 0
        
        local a = for i in s collect (getPolygonCount i)
        for i in a do (
			iPoly += i[1]
			iVert += i[2]
		)
		
        sPoly = iPoly as string
        sVert = iVert as string
		
		return #(sPoly, sVert)
	),
	
	fn getDim s = (
        local d = s.max - s.min
        
        d = for i in 1 to 3 collect ((d[i] * 100) as integer / 100.0 ) as string
        
        return d[1] + " x " + d[2] + " x " + d[3]
    ),
	
	fn getUnits = (
        local u = trimLeft (units.SystemType as string) "#"
        u[1] = toUpper u[1]
        return u
    ),
	
	fn getMaterialsCnt = (
		if (glTFMaterial == undefined) do return 0
		local cc = 0
		
		for o in objects do (
			local c = (getClassInstances glTFMaterial target: o).count
			cc += c
		)
			
		return cc
	),
	
	fn run out: "" scn: undefined ao: undefined isNormalizeTiling: false = (
		this.json = #()
		SetQuietMode true
		/* 
			@Input
			ao = AO_Settings (enabled, passes, resolution, denoise, size)
			scn = scn (file, path, name, ext, type, del, opened, maxName)
		*/
		
		if (ao == undefined or scn == undefined) do return false
		this.convertexe = deployConvertExe()
		ATSOps.Refresh()
		
		this.outPath = out
		this.texturesQueueNames = #()
		this.normalsQueueNames = #()
		this.texturesQueue = #()
		this.normalsQueue = #()
		
		-- Normalize Mesh
		this.ungroupRecursive()
		this.removeExtraObjects()			
		this.neutralizeMeshSmooth()
		this.fixGeometry()
		this.attachObjectsByMaterials()
		
		-- Save Fog color before conversion to Corona
		this.setVrayMtlFogColorToDiffuse()
		
		-- Purge cache
		this.clearCacheMapsDir()
		
		-- Convert all to Corona Physical Mtl
		this.convertToCorona()
		
		-- Bitmap instansing
		this.instnceDuplicateMaps()
		
		local falloffMaterials = this.getMaterialsWithFalloff()
		
		-- Simplify maps
		this.neutralizeFalloff()
		this.neutralizeCoronaAO()
		this.neutralizeRaySwitch()
		this.neutralizeCoronaSkinMtl()
		this.neutralizeCoronaLayered()
		this.neutralizeNoise()
		this.neutralizeBlendMtl()
		this.neutralizeDoubleSided()
		this.neutralizeCoronaMix()
		
		-- Convert to GLTF Material
		this.coronaPhysicalMtlToGltfMaterial falloffMaterials: falloffMaterials
		this.coronaLightMtlToGltfMaterial()
		
		-- Tiling to proper mapping	(Kill Tiling)
		if (isNormalizeTiling) do normalizeRealWorldUVWbyTiling()
		
		-- Empty maps to Black!
		replaceToBlackEmptyBitmap()
		
		-- Render Maps
		this.renderTexturesQueue()	
		this.renderNormalsQueue()
		
		if (ao.enabled) do this.createAOmap ao: ao
		
		local o = this.exportGLB out n: scn.name
		
		-- JSON: Data		
		local glbPolys = polyCount objects
		local glbSize = getFileMb o
		
		this.j.addData this.json "program" "glb"
		this.j.addData this.json "ao" ao.enabled
		this.j.addData this.json "aoType" ao.type
		this.j.addData this.json "sizeMb" glbSize
		this.j.addData this.json "polys" glbPolys[1]
		this.j.addData this.json "verts" glbPolys[2]		
		this.j.addData this.json "size" (getDim objects)		
		this.j.addData this.json "units" (getUnits())
		this.j.addData this.json "objectsCount" (objects.count)
		this.j.addData this.json "materialsCount" (getMaterialsCnt())
		
		-- Write JSON
		local jsonFile = out + scn.name + ".json"		
		this.j.writeJson jsonFile this.json	
		
		this.saveGLBScene()	
			
		if (scn.del != undefined) do rmDir scn.del
		
		SetQuietMode false
		
		return o
	),
	
	fn extractZip f o = (
        if (f == undefined or not doesFileExist f) do return false
        if (getFilenameType f != ".zip") do return false
		
		local args = f + ";" + o
		args = substituteString args "/" @"\"
		
		local cmd = "start /b /min /wait extract.bat \"" +  args + "\""
		
		local curDir = sysInfo.currentDir
		sysInfo.currentDir = this.selfPath
		
		hiddenDosCommand cmd exitCode: &exitcode donotwait: false
		
		sysInfo.currentDir = curDir
    ),
	
	fn getMaxFile o = (
		local ptrns = #(
			"GC-*-Corona.max",
			"GC-*-VRay.max",
			"GC-*.max",
			"*Corona*.max",
			"*VRay*.max",
			"*V-Ray*.max",
			"*V_Ray*.max",
			"*crn*.max",
			"*vr*.max",
			"*.max"
		)
		
		local files = getFiles (o + "*.max")

		for p in ptrns do (
			for f in files do (
				local ne = filenameFromPath f
				if (MatchPattern ne pattern: p) do return f
			)
		)
		
		return undefined
	),
	
	fn load f = (
		sleep 0.1
		try (resetMaxFile #noprompt) catch ()
		
		struct scn (file, path, name, ext, type, del, opened, maxName)
		local r = scn()
		
		SetQuietMode true
		local ext = getFilenameType f
		local p = getFilenamePath f
		local n = getFilenameFile f
		local nn = filenameFromPath f
		
		r.file = f
		r.path = p
		r.name = n
		r.ext = ext
		r.del = undefined
		r.opened = false
		
		-- For Max files
		if (ext == ".max") do (
			loadMaxFile f quiet: true
			r.type = #max
			r.opened = maxFileName == nn
			r.maxName = nn
			
			return r
		)
		
		-- For archives
		local o = p + n + @"\"
		extractZip f o
		
		r.type = #zip
		r.del = o
		
		local m = getMaxFile o		
		
		if (m == undefined) do (
			SetQuietMode false
			return r
		)
		
		nn = filenameFromPath m
		r.maxName = nn
		
		loadMaxFile m quiet: true
		SetQuietMode false	
		r.opened = maxFileName == nn
		
		return r
	)
)
	
global API_BATCH_GLB_CONVERTER = BatchGLBConverterWrapper()

--::BATCH_GLB_CONVERTER_SUPPRESS_GUI = false
--::API_BATCH_GLB_CONVERTER.load @"c:\Projects\Scripts\GC-Batch-GLB-Converter\test\part1\63113.zip"

struct '@' (
	currScript = getThisScriptFileName(),
	name = getFilenameFile currScript,
	pth = getFileNamePath currScript,
	ini = pth +  sysinfo.username + "@" + sysinfo.computername + ".ini",
	--ini = (getThisScriptFileName()) + ".ini",
	sec = name,
	
	fn trim s tag: "" = (
		s as string
		return (trimLeft (trimRight s tag) tag)
	),
	
	fn add k v sec: "" = (
		if (sec == "") do sec = this.sec
		if (v == undefined) do v = ""
		setIniSetting this.ini sec k (v as string)
	),
	
	fn get k sec: "" type: #string = (
		if (sec == "") do sec = this.sec
		
		if (k == "") do return getINISetting this.ini sec
		
		local v = getIniSetting this.ini sec k
		
		case type of (
			#bool_true: return if (v == "true") then true else false
			#bool_false: return if (v == "false") then false else true
			#int: return try (v as integer) catch(0)
		)
		
		return v
	),
	
	fn del k sec: "" = (
		if (sec == "") do sec = this.sec
		delIniSetting ini sec k
	),	
	
	fn delSec s = (
		delIniSetting ini s
	)
)

global '*' = '@'()	
global _rBatchGCGLBConverter = undefined
global _rBatchGCGLBConverterSettings = undefined

try (DestroyDialog _rSendCommend) catch ()
global _rSendCommend = undefined

if (::_rBatchGCGLBChecker == undefined) do (
	global _rBatchGCGLBChecker = undefined
)

try(closeRolloutFloater floaterBatchGLBConverter) catch()
try (DestroyDialog ::_rBatchGCGLBChecker) catch ()

if (::BATCH_GLB_CONVERTER_SUPPRESS_GUI != true) do (

	global floaterBatchGLBConverter = newRolloutFloater "GLB Converter" 300 890

	fn checkArchiveForErrors type: #default = (
		try (DestroyDialog ::_rBatchGCGLBChecker) catch ()
		if (::BATCH_GLB_CONVERTER_FILES == undefined) do return false
		if (::floaterBatchGLBConverter == undefined) do return false
		
		global checkType = type
		
		rollout _rBatchGCGLBChecker "" (
			group "Info" ( 
				label lblName "Loading..." align: #left
				label lblPolys "" align: #left
				label lblIsChecked "" align: #left
				label lblStatus "" align: #left
				label lblComment "" align: #left
			)
			
			group "Custom Scene Coversion Options" (
				checkbox cbxKillTiling "Kill Tex Tiling and Apply UVW XForm" align: #left enabled: false
				checkbox cbxBakeAO "Bake AO" align: #left enabled: false checked: true
			)
			
			button btnSave "Save Scene" width: 254 height: 35 enabled: false
			button btnPrev "<< Prev." across: 2 width: 120 align: #left offset: [0, 10] enabled: false
			button btnNext "Next >>"  width: 120 align: #right offset: [0, 10] enabled: false
			
			local current = undefined
			
			fn polyCount s = (
				local iPoly = 0
				local iVert = 0
				
				local a = for i in s collect (getPolygonCount i)
				for i in a do (
					iPoly += i[1]
					iVert += i[2]
				)
				
				return #(iPoly, iVert)
			)
			
			fn formatNumberWithSpaces n = (
				local numberStr = (n as string)
				local s = ""
				local len = numberStr.count
				
				for i in 1 to len do	(
					s = numberStr[len - i + 1] + s
					if (mod i 3 == 0 and i != len) do (
						s = " " + s
					)
				)
				
				return s
			)
			
			fn formatString s v: #() tag: "$" = (
				for i in 1 to v.count  do (
					local t = v[i] as string
					s = substituteString s (tag + i as string) (t)
				)
				
				return s
			)
			
			fn boost = if (((maxVersion())[1] / 1000) >= 13) do windows.processPostedMessages() 
			
			fn getter k = (
				if (current == undefined or current.ini == undefined) do return ""
				return getINISetting current.ini "index" k
			)
			
			fn setter k v = (
				if (current == undefined or current.ini == undefined) do return false
				setINISetting current.ini "index" k (v as string)
			)
			
			fn updateUI = (
				if (current == undefined) do return false				
				local n = current.name				
				local isChecked = (getter "checked") == "true"
				local isCheckedText = if (isChecked) then "Yes" else "No"
				local comment = _rBatchGCGLBConverter.getComment current.id
				local polys = polyCount objects
				
				lblName.caption = formatString "Name: $1" v: #(n)
				lblIsChecked.caption = formatString "Is Checked: $1" v: #(isCheckedText)
				lblStatus.caption = formatString "Status: $1" v: #(current.approve)
				if (current.approve == "Skip") do (
					lblComment.caption = formatString "Comment: $1" v: #(comment)  
				)
				
				local polysStr = formatString "Polys: $1" v: #(formatNumberWithSpaces polys[1])  
				 
				if (polys[1] > 250000) do polysStr = polysStr + " [!]"
				lblPolys.caption = polysStr
				
				boost()
			)
			
			fn setPos = (
				if (::_rBatchGCGLBChecker == undefined) do return false
				local p = floaterBatchGLBConverter.pos				
				SetDialogPos ::_rBatchGCGLBChecker [p[1] + 310, p[2]]
			)
			
			fn goToFile type = (
				if (getSaveRequired()) do (
					local q = queryBox ("Do you want to go to the " + (type as string) + " file without saving?") title: "Confirm?"
					if (not q) do return false
				)
				
				local lbx = _rBatchGCGLBConverter.lbxList
				local ss = lbx.selection as array
				local id = ss[1]
				
				if (id == 0 or id == undefined) do try (DestroyDialog ::_rBatchGCGLBChecker) catch ()
				
				local f = ::BATCH_GLB_CONVERTER_FILES				
				local prevId = id - 1
				local nextId = id + 1
				local prev = try (f[prevId]) catch (undefined)
				local next = try (f[nextId]) catch (undefined)
				local sid = -1
				
				if (type == #next and next == undefined) do return false
				if (type == #pref and prev == undefined) do return false
				
				if (type == #next) do sid = nextId 
				if (type == #prev) do sid = prevId 
				if (sid == -1) do return false
				
				lbx.selection = sid
				
				checkArchiveForErrors()
			)
			
			fn splitFiles = (
				local splitterMgr = GCModelSplitWrapper()
				splitterMgr.init maxFilePath
				splitterMgr.createMaxOriginal()
				splitterMgr.createFbxObj()
				splitterMgr.createMaxMerger()
				
				local s = splitterMgr.isSplitted()
				splitterMgr.writeIniSplitStatus()
				
				return s
			)
			
			fn loadChecks = (
				local o1 = getter "kill_tiling"
				local o2 = getter "bake_ao"
				cbxKillTiling.checked = o1 == "true"
				cbxBakeAO.checked = o2 != "false"
			)
			
			fn enableBackFaceCull = (
				for i in objects do try (i.backfacecull = true) catch ()
			)
			
			fn setMapsVisible = (
				local classes = #(
					CoronaPhysicalMtl,
					CoronaLegacyMtl,
					VRayMtl
				)
				
				for c in classes where c != undefined do (
					for i in getClassinstances c do (
						try (showTextureMap i true) catch ()
					)	
				)
			)
			
			fn explodeAllGroups = (				
				local gg = for o in objects where isGroupHead o collect o
				for g in gg do try (explodeGroup g) catch ()
			)
			
			fn disableIsolineDisplayForSmooth = (
				for i in getClassInstances MeshSmooth do i.isolineDisplay = false
				for i in getClassInstances TurboSmooth do i.isolineDisplay = false
			)
			
			fn resetXForAllObjects = (
				for o in geometry where isValidNode o and not isDeleted o do (
					ResetXForm o
					collapseStack o
				)
			)
			
			fn attachSceneObjects = (	
				local objs = geometry as array
				if (objs.count < 2) do return false
				
				local base = objs[1]
				try (collapseStack base) catch ()
				try (convertToPoly base) catch ()
				base.parent = undefined	
				
				for i in objs.count to 2 by -1 do (
					local o = objs[i]
					if (o == undefined or not isValidNode o) do continue		
					try (convertToPoly o) catch ()
					o.parent = undefined
					try (polyop.attach base o) catch ()					
				)
				
				CenterPivot base
				base.wirecolor = gray
				base.name = getFilenameFile maxFileName
			)
			
			fn setSnenePivotBottom = (
				MaxOps.pivotMode = #pivotOnly
				
				local center = objects.center
				local bottom = objects.min.z
				
				for i in objects do (
					i.pivot = center
					i.pivot.z = bottom
					i.pos = [0, 0, 0]
				)
			)

			
			
			on cbxKillTiling changed a do (
				setter "kill_tiling" a
			)
			
			on cbxBakeAO changed a do (
				setter "bake_ao" a
			)
			
			on _rBatchGCGLBChecker open do (
				setPos()
				
				local f = ::BATCH_GLB_CONVERTER_FILES
				local lbx = _rBatchGCGLBConverter.lbxList
				local ss = lbx.selection as array
				local id = ss[1]
				
				if (id == 0 or id == undefined) do try (DestroyDialog ::_rBatchGCGLBChecker) catch ()
				
				current = f[id]
				local prev = try (f[id - 1]) catch (undefined)
				local next = try (f[id + 1]) catch (undefined)
				
				btnNext.enabled = next != undefined
				btnPrev.enabled = prev != undefined
				
				local scn = getter "scene"
				local isErrorOpen = false
				
				if (scn == "") then (
					local r = ::API_BATCH_GLB_CONVERTER.load current.filename
					
					if (r.opened) do (
						setter "scene" r.maxName
					)
					
					isErrorOpen = not r.opened
				) else (
					try (resetMaxFile #noprompt) catch ()
					loadMaxFile (current.extractPath + scn) quiet: true
					if (maxFileName == "") do isErrorOpen = true
				)
				
				local maxFiles = getFiles (current.extractPath + "*.max")
				if (maxFiles.count == 0) then (
					::_rBatchGCGLBConverter.setModelStatus status: #skip
					messageBox "Not found *.max files in archive.\nAutomatically applied Skip status!" title: "Error!"				
				) else if (isErrorOpen) do (
					messageBox "Error while opening scene!\nTry to clear extracted files and repeat againg!" title: "Error!"
				)
				
				-- If not splitted and not checked yet
				/*if (getter "checked" != "true" and getter "splitted" != "true") do (
					splitFiles()
				)*/
				
				loadChecks()
				
				max tool zoomextents
				max tool maximize
				max views redraw
				max unfreeze all
				max unhide all
				enableBackFaceCull()
				setMapsVisible()
				
				if (::checkType == #autoConvert) do (
					setter "bake_ao" "false"
					explodeAllGroups()
					disableIsolineDisplayForSmooth()
					resetXForAllObjects()
					attachSceneObjects()
					setSnenePivotBottom()
				)
				
				updateUI()
				
				btnSave.enabled = true
				cbxKillTiling.enabled = true
				cbxBakeAO.enabled = true
				
				
				try (::_rBatchGCGLBConverter.updateLbx()) catch ()
			)
			
			on _rBatchGCGLBChecker moved p do (
				setPos()
			)
			
			on btnNext pressed do (
				goToFile #next
			)
			
			on btnPrev pressed do (
				goToFile #prev
			)
			
			on btnSave pressed do (
				if (maxFileName == "") do (
					return btnSave.enabled = false
				)
				
				local lbx = _rBatchGCGLBConverter.lbxList
				local ss = lbx.selection as array
				local id = ss[1]
				
				if (id == 0 or id == undefined) do try (DestroyDialog ::_rBatchGCGLBChecker) catch ()
				
				saveMaxFile (maxFilePath + maxFileName)
				setter "checked" "true"
				
				loadChecks()
				updateUI()
				setMapsVisible()
				try (::_rBatchGCGLBConverter.updateLbx()) catch ()
				
				lbx.selection = id			
			)
		)
		
		CreateDialog _rBatchGCGLBChecker 280 265
	)

	rollout _rBatchGCGLBConverter "GLB Converter" category: 1 (
		
		edittext edtInputPath "" readonly: true across: 2 align: #left fieldwidth: 215 height: 22 tooltip: "Select a folder to download models"	
		button btnSearchInputPath "..." width: 35 height: 24  align: #right offset: [0, -1]		
			
		multilistbox lbxList "" items: #() height: 45
		label lblStatus "Selected items for export: 0" align: #right
		--button btnSelectAll "Select All" align: #center width: 100 across: 2
		--button btnDeselect "Deselect" align: #center width: 100
			
		button btnDownload "Download Models" height: 24 width: 260 tooltip: "Download all models from the current queue"	
		--button btnCheckArchive "Check Archive" width: 260 height: 24 tooltip: "Check the model for errors:\n- No groups\n- Only one logical model (Attached)\n- Centered and grounded\n- Reasonable amount of polygons\n- Correct mapping"
		
		button btnQuickExport "Quick Export" align: #left height: 24 tooltip: "Converts to GLB without baking AO and converting to Blender" across: 2 offset: [0, 10]
		button btnBatchExport "Final Export Selected (0)" height: 24 width: 175  align: #right tooltip: "Converts to GLB all Checked and selected models from list"	 offset: [0, 10]	
		
		button btnQA "QA GLB + Preview" height: 24 width: 260 tooltip: "Conversion quality assessment" offset: [0, 10]
		
		button btnStatusApprove "Status: Approve" across: 3 height: 24 width: 82 align: #left tooltip: "Approve models" offset: [0, 10]
		button btnStatusNone "Status: None" height: 24 width: 82 align: #center tooltip: "Set status None" offset: [0, 10]
		button btnStatusSkip "Status: Skip" height: 24 width: 82 align: #right tooltip: "Skip models" offset: [0, 10]
		
		button btnUpload "Upload All Models " height: 24 width: 260 tooltip: "Uploads all models into the Database, if all statuses are set: Approve or Skip and all generated files exists (GLB, BLEND)" offset: [0, 10]
		
		
		global BATCH_GLB_CONVERTER_FILES = #()
		global BATCH_GLB_PROCESSED_DIR = ""
		global BATCH_GLB_MODE = #prod
		
		fn getMode = (
			local m = '*'.get "mode"
			if (m == "2") then (
				return #test
			) 
			
			return #prod
		)
		
		fn loadSettings = (
			local dd = '*'.get "tnt_path"
			edtInputPath.text = dd
			
			if (dd != "") do (
				::BATCH_GLB_PROCESSED_DIR = dd + @"Processed\"
				makeDir ::BATCH_GLB_PROCESSED_DIR all: true
			)					
			
			::BATCH_GLB_MODE = getMode()
		)
		
		fn formatString s v: #() tag: "$" = (
			for i in 1 to v.count  do (
				t = v[i] as string
				s = substituteString s (tag + i as string) (t)
			)
			
			return s
		)
		
		fn getSelectedItems = (
			local ss = lbxList.selection as array
			return for i in ss collect ::BATCH_GLB_CONVERTER_FILES[i]
		)
		
		fn startQA = (
			local items = getSelectedItems()
			local i = items[1]
			local w = WebGLPlayerWrapper()
			if (i == undefined) do return false
			
			w.startWebServer() 
			w.previewModel i.glb
			
			w.previewImg i.name kill: "0"
			w.previewImg i.glbScreen kill: "0" type: #local
			if (::_rBatchGCGLBConverterSettings.cbxMakeBlend.checked) do w.previewImg i.blendScreen kill: "0" type: #local
		)
		
		fn getOpenFiles = (
			local f = #()
			
			local d = dotNetObject "System.Windows.Forms.OpenFileDialog" 
			d.title = "Select Files"
			d.Multiselect = true
			d.Filter = "Archives/3Ds Max (*.zip/*.max)|*.zip;*.max"
			d.FilterIndex = 1
			
			local result = d.showDialog() 
			result.ToString() 
			result.Equals result.OK 
			result.Equals result.Cancel 
			
			f = d.fileNames 
			
			return f
		)
		
		fn getScene ini = (
			local extractPath = getFilenamePath ini
			local scn = getINISetting ini "index" "scene"
			
			if (scn == "") do return undefined
			scn = extractPath + scn
			if (not doesFileExist scn) do return undefined
			
			return scn
		)
		
		fn getChecked ini = (
			return (getINISetting ini "index" "checked") == "true"
		)
		
		fn getKillTiling ini = (
			return (getINISetting ini "index" "kill_tiling") == "true"
		)
		
		fn getBakeAO ini = (
			return (getINISetting ini "index" "bake_ao") != "false"
		)
		
		fn getMask f = (
			f = getFilenameFile f
			f = trimLeft f "0123456789-"
			return f
		)
		
		fn getApproveStatus id f = (
			local n = getMask f
			local ini = ::BATCH_GLB_PROCESSED_DIR + id + ".ini"
			
			return getINISetting ini "FILES" n
		)
		
		fn delApproveStatus id f = (
			local ini = ::BATCH_GLB_PROCESSED_DIR + id + ".ini"
			local n = getMask f
			return delINISetting ini "FILES" n
		)
		
		fn setApproveStatus id f status: #skip = (
			if (status != #skip and status != #none and not doesFileExist f) do status = #error
			
			--local os = getApproveStatus id f
			
			local ini = ::BATCH_GLB_PROCESSED_DIR + id + ".ini"
			local n = getMask f
			local s = case status of (
				#skip: "Skip"
				#error: "Error"
				#approve: "Approve"
				#none: ""
				default: ""
			)
			
			--if (os == s) do s = ""
			
			setINISetting ini "FILES" n s
		)
		
		fn getComment id = (
			local ini = ::BATCH_GLB_PROCESSED_DIR + id + ".ini"
			local c = getINISetting ini "DATA" "comment"
			return trimLeft (trimRight c "\"") "\""
		)
		
		fn setComment id c = (
			local ini = ::BATCH_GLB_PROCESSED_DIR + id + ".ini"
			
			local replaces = #(
				#("\"", ""),
				#("'", ""),
				#("&", ""),
				#("=", ""),
				#("`", ""),
				#("\n", " "),
				#("\r\n", " "),
				#("\t", " "),
				#("   ", " "),
				#("  ", " ")
			)
			for i in replaces do c = substituteString c i[1] i[2]
			
			c = trimLeft (trimRight c " \t") " \t"
			
			setINISetting ini "DATA" "comment" ("\"" + c + "\"")
		)
		
		fn getData = (
			::BATCH_GLB_CONVERTER_FILES = #()
			local dd = '*'.get "tnt_path"
			
			local ff = getFiles (dd + "*.zip")
			
			--local splitterMgr = GCModelSplitWrapper()

			struct tmp (
				id,
				path, 
				outPath, 
				filename, 
				name, 
				blnd, 
				glb, 
				isGlbExist, 
				isBlndExist, 
				type, 
				ext, 
				ini, 
				extractPath, 
				isChecked, 
				--isSplitted, 
				scene,
				glbName,
				glbScreen,
				blendName,
				blendScreen,
				approve,
				isApprove,
				iniProcessed,
				isBakeAO,
				isNormalizeTiling
			)
			
			local badPattern = #("*-BLEND", "*-FBX-OBJ", "*-MaxMerger", "*-MaxOriginal", "*-SKP")
			
			for f in ff do (
				local p = getFilenamePath f
				local outPath = ::BATCH_GLB_PROCESSED_DIR
				local n = getFilenameFile f
				local id = n
				local ext = getFilenameType f
				local extractPath = p + n + @"\"
				--splitterMgr.init extractPath
				
				local skip = false
				for pt in badPattern where MatchPattern n pattern: pt do skip = true
				
				if (skip) do continue
				
				local glb = outPath + n + "-GLB.glb"				
				local blnd = outPath + n + "-BLEND.zip"				
				local ini = extractPath + "glb.ini"
				local iniProcessed = outPath + n +".ini"
				
				local glbName = n + "-GLB"
				local glbScreen = outPath + glbName + ".png"
				local blendName = n + "-BLEND"
				local blendScreen = outPath + blendName + ".png"
				
				local type = (trimLeft ext ".") as name
				local filename = f				
				
				local isChecked = getChecked ini
				local isNormalizeTiling = getKillTiling ini
				local isBakeAO = getBakeAO ini
				--local isSplitted = splitterMgr.isSplitted()
				
				local isGlbExist = doesFileExist glb
				local isBlndExist = doesFileExist blnd
				
				local approve = getApproveStatus id glb
				local isApprove = approve == "Approve"
				
				if (isBlndExist and isApprove) do (
					::_rBatchGCGLBConverter.setApproveStatus id blnd status: #approve
				)
				
				local scn = getScene ini
				
				append ::BATCH_GLB_CONVERTER_FILES (
					tmp path: p \
					outPath: outPath \
					name: n \
					id: id \
					filename: filename \
					glb: glb \
					blnd: blnd \
					isGlbExist: isGlbExist \
					isBlndExist: isBlndExist \
					type: type \
					ext: ext \
					ini: ini \
					extractPath: extractPath \
					isChecked: isChecked \
					scene: scn \
					glbName: glbName \
					glbScreen: glbScreen \
					blendName: blendName \
					blendScreen: blendScreen \
					approve: approve \
					isApprove: isApprove \
					iniProcessed: iniProcessed \
					isBakeAO: isBakeAO \
					isNormalizeTiling: isNormalizeTiling 
				)
			)
			
			return ::BATCH_GLB_CONVERTER_FILES
		)
		
		fn updateUI = (
			local ss = getSelectedItems()
			
			local checkedCnt = 0
			local checkedInSel = 0
			for i in ::BATCH_GLB_CONVERTER_FILES do (
				if (i.isChecked and i.approve != "Skip") do (
					checkedCnt += 1
					if (findItem ss i != 0) do checkedInSel += 1
				)
			)
			
			local isSetSyncFolder = edtInputPath.text != "" and doesDirectoryExist edtInputPath.text
			
			local isFilesExists = (getFiles (edtInputPath.text + "*.zip")).count > 0
			local isProcessedFilesExists = (getFiles (::BATCH_GLB_PROCESSED_DIR + @"*.zip")).count > 0
			
			local isOneSelected = lbxList.items.count != 0 and ss.count == 1
			local isAtleastOneSelected = lbxList.items.count != 0 and ss.count > 0
			
			btnBatchExport.enabled = isAtleastOneSelected and checkedCnt != 0
			lblStatus.caption = formatString "Ready to Export: $1 | Total Items: $2" v: #(checkedCnt, lbxList.items.count)
			btnBatchExport.caption = formatString "Final Export Selected ($1/$2)" v: #(checkedInSel, ss.count)
			--btnCheckArchive.enabled = isOneSelected
			btnQA.enabled = isOneSelected and ss[1].isGlbExist
			btnStatusNone.enabled = isAtleastOneSelected
			btnStatusApprove.enabled = isAtleastOneSelected
			btnStatusSkip.enabled = isOneSelected
			btnQuickExport.enabled = isAtleastOneSelected and checkedCnt != 0
			
			btnDownload.enabled = isSetSyncFolder	
			btnUpload.enabled = isSetSyncFolder and isProcessedFilesExists
		)
	
		fn updateLbx = (
			local ss = getSelectedItems()
			local selectedNames = for i in ss collect i.name
			
			getData()
			
			lbxList.items = #()
			local o = #()
			local c = 1
			local sel = #{}
			
			for i in ::BATCH_GLB_CONVERTER_FILES do (
				local glbStatus = ""
				local blndStatus = ""
				local aoStatus = ""
				local checkStatus = ""
				local approve = ""
				
				if (i.isGlbExist) do glbStatus = " [GLB]"
				if (i.isBlndExist) do blndStatus = " [BLEND]"
				if (not i.isBakeAO) do aoStatus = " [no AO]"
				
				i.isChecked = getChecked i.ini				
				i.scene = getScene i.ini
				if (i.approve != "") do approve = formatString "[$1] " v: #(i.approve)
			
				if (i.approve == "Approve" and (not i.isBlndExist and ::_rBatchGCGLBConverterSettings.cbxMakeBlend.checked)) do (
					approve = "[Not found Blender file]"
				)
				
				if (i.isChecked) do checkStatus = " [Checked]"
				
				if (i.approve != "") do (
					checkStatus = ""
					glbStatus = ""
					blndStatus = ""
				)
				
				append o (formatString "$1$2$3$4$5$6" v: #(approve, i.name, checkStatus, glbStatus, blndStatus, aoStatus))
				if (findItem selectedNames i.name != 0) do append sel c
				
				c += 1
			)
			
			lbxList.items = o
			
			lbxList.selection = sel
			updateUI()
			
			SetQuietMode false
		)
		
		fn setModelStatus status: #skip = (
			local items = getSelectedItems()
			
			for i in items do (
				setApproveStatus i.id i.glb status: status			
				setApproveStatus i.id i.blnd status: status
			)
			
			updateLbx()
			
			return true
		)
		
		fn copyToClipboard b = (
			local o = ""			
			for i in b where i != "" do o += i + "\n"
			
			setClipboardText o
			setClipboardText o
			
			messageBox ("Copied to clipboard: \n\n" + o) beep: false title: "Clipboard"
		)
		
		fn getOpenPath = (
			local p = getSavePath catption: "Export GLB"
			if (p == undefined) do return undefined
			return p += @"\"
		)
		
		fn startBatchExport type: #default = (
			local ss = getSelectedItems()
			ss = for i in ss where i.isChecked and i.approve != "Skip" collect i
			
			if (ss.count == 0) do return messageBox "Please select [Checked] items from list!" title: "Warning!"
			
			local blendGLBMgr = BlenderGLBWrapper()
			
			-- If Blender not exist!
			if (::_rBatchGCGLBConverterSettings.cbxMakeBlend.checked and not blendGLBMgr.isBlenderExist()) do (
				messageBox "Blender not installed!" title: "Error!"
				return false
			)
			
			local xNormal = ::API_BATCH_GLB_CONVERTER.getXNormal()
			if (::_rBatchGCGLBConverterSettings.cbxUseXNormalAO.checked and xNormal == undefined) do (
				messageBox "xNormal not installed!" title: "Error!"
				return false
			)
			
			local p = edtInputPath.text
			if (p == "") do return messageBox "Please select Sync Amazon Folder!" title: "Warning!"
			
			local outPath = ::BATCH_GLB_PROCESSED_DIR
			
			SetQuietMode true
			progressStart "In process..."
			escapeEnable = true
			clearListener()
			
			SceneConverter.BackupOriginalFiles = false
			
			for i in 1 to ss.count do (
				struct AO_Settings (enabled, passes, resolution, denoise, size, type)
				local ao = AO_Settings()
				ao.enabled = ::_rBatchGCGLBConverterSettings.cbxUseCoronaAO.checked or ::_rBatchGCGLBConverterSettings.cbxUseXNormalAO.checked
				if (type == #quick) do ao.enabled = false
				if (type == #autoConvert) do ao.enabled = false
				
				if (::_rBatchGCGLBConverterSettings.cbxUseCoronaAO.checked) do (
					ao.size = (::_rBatchGCGLBConverterSettings.spnAOSize.value as string) + "cm"
					ao.passes = ::_rBatchGCGLBConverterSettings.spnAOPasses.value
					ao.resolution = ::_rBatchGCGLBConverterSettings.spnAOResolution.value
					ao.denoise = ::_rBatchGCGLBConverterSettings.cbxAODenoise.checked
					ao.type = #corona
				)
				
				if (::_rBatchGCGLBConverterSettings.cbxUseXNormalAO.checked) do (
					ao.resolution = ::_rBatchGCGLBConverterSettings.spnAOXNormalResolution.value
					ao.denoise = ::_rBatchGCGLBConverterSettings.cbxAODenoiseXNormal.checked
					ao.type = #xnormal
				)
				
				local f = ss[i]
				
				if (not doesFileExist f.scene) do continue
				
				if (getProgressCancel() or keyboard.escPressed) do return false
				
				try (resetMaxFile #noprompt) catch ()
				loadMaxFile (f.scene) quiet: true
				if (maxFileName == "") do continue
				
				struct scn (file, path, name, ext, type, del, opened, maxName)
				local r = scn()
				
				local ext = getFilenameType f.scene
				local pp = getFilenamePath f.scene
				local n = getFilenameFile f.scene
				local nn = filenameFromPath f.scene
				
				r.file = f.scene
				r.path = pp
				r.name = f.glbName
				r.ext = ext
				r.del = undefined
				r.opened = true
				
				local isNormalizeTiling = ::_rBatchGCGLBConverter.getKillTiling f.ini
				local isBakeAO = ::_rBatchGCGLBConverter.getBakeAO f.ini
			
				if (ao.enabled and not isBakeAO) do (
					ao.enabled = false				
				)
				local glb = ::API_BATCH_GLB_CONVERTER.run scn: r out: outPath ao: ao isNormalizeTiling: isNormalizeTiling
				
				if (getProgressCancel() or keyboard.escPressed) do return false
				
				-- Bender
				if (type == #default or type == #autoConvert) do (
					if (::_rBatchGCGLBConverterSettings.cbxMakeBlend.checked) do (					
						blendGLBMgr.init glb: glb name: f.blendName
						blendGLBMgr.convertGLB2Blend()
						--blendGLBMgr.makeScreenshot()
						blendGLBMgr.makeRender()
						blendGLBMgr.makeArchive()
						blendGLBMgr.makeJson()					
					)
				)
				
				if (getProgressCancel() or keyboard.escPressed) do return false
				
				progressUpdate (100 * i / ss.count)
				
				/* Process archives */
				/*if (not doesFileExist f.filename) do continue
				
				if (getProgressCancel() or keyboard.escPressed) do return false
				
				local scn = ::API_BATCH_GLB_CONVERTER.load f.filename				
				if (not scn.opened) do continue
				
				local glb = ::API_BATCH_GLB_CONVERTER.run scn: scn out: p ao: ao
				
				if (getProgressCancel() or keyboard.escPressed) do return false
				
				progressUpdate (100 * i / ss.count)*/
			)
			
			progressEnd()
			resetMaxFile #noprompt
			SetQuietMode false
			
			updateLbx()
			
			ShellLaunch outPath ""
		)
		
		fn autoConvert = (
			local ss = lbxList.selection as array
			if (ss.count == 0) do return messageBox "Please select items from list!" title: "Warning!"
			
			local p = edtInputPath.text
			if (p == "") do return messageBox "Please select Sync Amazon Folder!" title: "Warning!"
			
			local outPath = ::BATCH_GLB_PROCESSED_DIR
			
			SetQuietMode true
			progressStart "In process..."
			escapeEnable = true
			clearListener()
			
			print ss
			
			SceneConverter.BackupOriginalFiles = false
 			
 			for i in ss do (
 				lbxList.selection =#{i}
 				checkArchiveForErrors type: #autoConvert 				
 				::_rBatchGCGLBChecker.btnSave.pressed()								
 			)
			
			try (DestroyDialog ::_rBatchGCGLBChecker) catch ()
 				
			lbxList.selection = ss
			startBatchExport type: #autoConvert
			
			progressEnd()
			resetMaxFile #noprompt
			SetQuietMode false
			
			updateLbx()
			
			ShellLaunch outPath ""
		)
		
		on btnDownload pressed do (
			local downloadMgr = GCDownloaderWrapper()
			local count = ::_rBatchGCGLBConverterSettings.spnDownloadQueueQuantity.value
			downloadMgr.init (edtInputPath.text) mode: (::BATCH_GLB_MODE) count: count
			downloadMgr.run()
			
			updateLbx()
		)
		
		on btnUpload pressed do (
			local isAllStatusesSet = true
			for i in ::BATCH_GLB_CONVERTER_FILES do (
				if (i.approve == "") do isAllStatusesSet = false
			)
			
			if (not isAllStatusesSet) do return messageBox "Please set the statuses Approve or Skip for all files!" title: "Error!"
			
			uploadMgr = GCUploaderWrapper()
			uploadMgr.init (::BATCH_GLB_PROCESSED_DIR) mode: (::BATCH_GLB_MODE)
			uploadMgr.run()
			
			updateLbx()
			
			local l = getLogginFile()
			ShellLaunch l ""
		)
		
		on btnQA pressed do startQA()
		on btnStatusApprove pressed do setModelStatus status: #approve
		on btnStatusNone pressed do setModelStatus status: #none
			
		on btnStatusSkip pressed do (
			local items = getSelectedItems()
			if (items.count == 0) do return false
			if (items.count != 1) do return messageBox "Please select only one item from list!" title: "Warning!"
			
			global _BATCH_REASONS = #(
				"",
				"100. Very polygonal model",
				"101. Wrong UVW Mapping",
				"102. Wrong UVW Tiling",
				"103. The model explodes after XForm",
				"104. Poorly baked Textures / Materials",
				"105. Set of assets / Many different objects",
				"106. The model is not convertible"
			)
			
			global skipCancelled = false
			
			try (DestroyDialog _rSendCommend) catch ()
			rollout _rSendCommend "Comment" (
				group "Skip Reason" (
					edittext edtComment "" height: 50
				)
				group "Or Choose from Predefined Reasons" (
					listbox lbxReasons "" items: ::_BATCH_REASONS
				)
				button btnSave "Save" width: 70 height: 25 align: #right offset: [100, 20] across: 2
				button btnCancel "Cancel" width: 70 height: 25 align: #right offset: [0, 20]
				
				on edtComment entered a do (
					btnSave.pressed()
				)
				
				on btnCancel pressed do (
					/*if (edtComment.text.count < 1) do (
						_rBatchGCGLBConverter.setModelStatus status: #none
					)*/
					try (DestroyDialog _rSendCommend) catch ()					
				)
				
				on btnSave pressed do (
					if (edtComment.text.count < 1) do return messageBox "Please enter Skip Reason!" title: "Error!"
					
					--_rBatchGCGLBConverter.getComment
					--_rBatchGCGLBConverter.setComment
					
					local items = _rBatchGCGLBConverter.getSelectedItems()
					
					for i in items do (
						_rBatchGCGLBConverter.setComment i.id edtComment.text
					)
					
					_rBatchGCGLBConverter.setModelStatus status: #skip
					
					try (DestroyDialog _rSendCommend) catch ()
				)
				
				on _rSendCommend open do (
					setFocus edtComment
					lbxReasons.selection = 0
					local items = _rBatchGCGLBConverter.getSelectedItems()
					if (items.count == 1) do (
						edtComment.text = _rBatchGCGLBConverter.getComment items[1].id
					)
					
					local x = '*'.get "_rSendCommend_x"
					local y = '*'.get "_rSendCommend_y"
					
					if (x != "" and y != "") do (
						x = x as integer
						y = y as integer
						SetDialogPos _rSendCommend [x, y]
					)		
				)
				
				on _rSendCommend close do (
					local p = GetDialogPos _rSendCommend
			
					'*'.add "_rSendCommend_x" p.x
					'*'.add "_rSendCommend_y" p.y
				)
				
				on lbxReasons selected a do (
					edtComment.text = lbxReasons.selected
					setFocus edtComment
				)				
			)
			
			CreateDialog _rSendCommend width: 380 height: 323 style: #(#style_toolwindow)			
		)
		
		on lbxList rightClick do (
			struct rc (
				items = getSelectedItems(),
				isSelected = items.count == 1,
				atleastOneSelected = items.count > 0,
				isQAEnabled = isSelected and items[1].isGlbExist,
				w = WebGLPlayerWrapper(),
				item = items[1],
				
				fn cleanupAllFiles = (
					local q = (QueryDeleteFiles()).show()
					if (q == #no) do return false
					
					local openedScene = undefined
					local c = 0
					
					for i in items do (
						if (maxFilePath == i.extractPath) do (
							openedScene = maxFileName + " - " + i.name
							continue
						)
						
						local id = i.id
						
						if (q == #files_archives) do deleteFile i.filename
						
						local files = getFiles (i.outPath + i.id + "-*")
						for ff in files do deleteFile ff
						
						deleteFile i.glb
						deleteFile i.iniProcessed
						
						local cmd = "rmdir /s /q \"" +  i.extractPath  + "\""
						HiddenDOSCommand cmd
						
						delApproveStatus id i.glb
						delApproveStatus id i.blnd
						
						c += 1
					)
					
					updateLbx()
					if (items.count == 1 and openedScene != undefined) then (
						local m = "You cannot delete files because the scene " + openedScene + " is currently open!"
						messageBox m title: "Info!" beep: true
					) else if (openedScene != undefined) then (
						local m = (c as string) + " items deleted! One item ignored " + openedScene + " because scene is opened!"
						messageBox m title: "Info!"
					) else (
						local m = (c as string) + " items deleted!"
						messageBox m title: "Info!"
					)
				),
				fn show = (
					rcmenu rcListbox (
						menuItem QA "QA GLB + Preview" enabled: this.isQAEnabled
						separator sep0
						
						menuItem approveModel "Approve" enabled: atleastOneSelected
						--menuItem noneModel "None" enabled: atleastOneSelected
						menuItem skipModel "Skip" enabled: isSelected
						separator sep1						
						
						menuItem openPreview "Open Site Preview" enabled: isSelected
						menuItem copyArchivePath "Copy Archive Path" enabled: isSelected
						separator sep2
						
						menuItem batchExport "Final Export Selected" enabled: atleastOneSelected
						menuItem autoConvert "Auto Convert (Under Test)" enabled: atleastOneSelected
						
						separator sep3
						menuItem removeAll "Remove All (+Generated Files)" enabled: atleastOneSelected
						
						on rcListbox open do (							
							local i = this.item
							if (i == undefined) do return false
							
							local id = i.id
							local f = this.item.filename
							local status = getApproveStatus id i.glb
							
							approveModel.checked = false
							skipModel.checked = false
							--noneModel.checked = false
							
							if (this.items.count == 1) do (
								if (not i.isChecked or not i.isGlbExist) do (
									approveModel.enabled = false
									skipModel.enabled = true
								)
								
								if (status == "Approve") do (
									approveModel.checked = true
								)
								
								if (status == "Skip") do (
									skipModel.checked = true
								)
								
								/* if (status == "") do (
									noneModel.checked = true
								) */
							)
						)
						
						on autoConvert picked do (
							::_rBatchGCGLBConverter.autoConvert()
						)
						
						on batchExport picked do (
							::_rBatchGCGLBConverter.btnBatchExport.pressed()
						)
						
						on noneModel picked do (
							::_rBatchGCGLBConverter.btnStatusNone.pressed()
						)
						
						on skipModel picked do (
							::_rBatchGCGLBConverter.btnStatusSkip.pressed()
						)
						
						on approveModel picked do (
							::_rBatchGCGLBConverter.btnStatusApprove.pressed()
						)
						
						on QA picked do (
							startQA()
						)
						
						on openPreview picked do (
							local i = this.item
							
							w.previewImg i.name kill: "0"
						)
						
						on removeAll picked do cleanupAllFiles()
						
						on copyArchivePath picked do (
							local i = this.item
							
							setClipboardText i.filename
							setClipboardText i.filename
							
							messageBox "Copied!" title: "Success!"
						)
					)
					registerRightClickMenu rcListbox 
					popUpMenu rcListbox 
				)
			)

			(rc()).show()
		)
		
		on lbxList doubleClicked v do (
			checkArchiveForErrors()
		)
		
		on btnCheckArchive pressed do (
			checkArchiveForErrors()
		)
		
		on btnDeselect pressed do (
			lbxList.selection = #{}
			
			updateUI()
		)
		
		on btnSelectAll pressed do (
			lbxList.selection = for i in 1 to lbxList.items.count collect i
			
			updateUI()
		)
		
		-- !! Del
		on btnAdd pressed do (
			local ff = getOpenFiles()
			if (ff.count == 0) do return #nofiles
			
			for f in ff do (			
				'*'.add f "" sec:"files"
			)
			
			updateLbx()
		)
		
		-- !! Del
		on btnRemove pressed do (
			local ss = getSelectedItems()
			if (ss.count == 0) do return messageBox "Please select items from list!" title: "Warning!"
			
			for f in ss do (
				'*'.del f.filename sec: "files" 
			)
			
			lbxList.selection = #{}
			
			updateLbx()
		)
		
		-- !! Del
		on btnRemoveAll pressed do (
			local q = queryBox "Do you really want to delete all items from list?" title: "Confirm?"
			if (not q) do return #cancel
			
			'*'.delSec "files"
			
			updateLbx()
		)
		
		on btnSearchInputPath pressed do (
			local d = '*'.get "tnt_path"
			local p = getSavePath initialDir: d
			
			if (p == undefined) do return false
			p += @"\"
			
			edtInputPath.text = p
			'*'.add "tnt_path" p
			
			loadSettings()
			
			lbxList.selection = #{}
			updateLbx()
		)
	
		on lbxList selectionEnd do updateUI()
		
		
		on _rBatchGCGLBConverter open do (
			loadSettings()
			
			updateLbx()
			
			try (DestroyDialog ::_rBatchGCGLBChecker) catch ()
		)
		
		on _rBatchGCGLBConverter close do (
			try (DestroyDialog ::_rBatchGCGLBChecker) catch ()
		)
	
		on _rBatchGCGLBConverter moved  p do (
			if (::_rBatchGCGLBChecker != undefined) do (
				SetDialogPos ::_rBatchGCGLBChecker [p[1] + 310, p[2]]			
			)
		)
		
		on btnBatchExport pressed do startBatchExport()
		on btnQuickExport pressed do startBatchExport type: #quick
	)
	
	rollout _rBatchGCGLBConverterSettings "Settings" category: 2 (
		group "Mode" (
			checkbutton cbxModeProd "Production" across: 2 highlightColor: (color 52 168 83) width: 122
			checkbutton cbxModeTest "Testing" highlightColor: (color 186 169 55) width: 122
		)
		
		group "Download Queue Quantity" (
			spinner spnDownloadQueueQuantity "Count: " range: [1, 200, 30] type: #integer fieldwidth: 50 align: #left
		)
		
		group "AO Settings" (
			checkbox cbxUseCoronaAO "Use Corona AO"
			
			spinner spnAOPasses "Passes: " range: [1, 9999, 100] type: #integer fieldwidth: 50 align: #right across: 2 offset: [-15, 0]
			spinner spnAOSize "Size (cm): " range: [0.01, 9999.0, 5.0] type: #float fieldwidth: 50 
			spinner spnAOResolution "Resolution:"  range: [512, 8192, 1024] scale: 512 type: #integer align: #right fieldwidth: 50 across: 2  offset: [-15, 0]
			checkbox cbxAODenoise "Use VRay Denoiser" offset: [15, 0]
		)
		
		group "xNormal AO" (
			checkbox cbxUseXNormalAO "Use xNormal AO"
			spinner spnAOXNormalResolution "Resolution:"  range: [512, 8192, 1024] scale: 512 type: #integer align: #right fieldwidth: 50 across: 2  offset: [-15, 0]
			checkbox cbxAODenoiseXNormal "Use VRay Denoiser" align: #left offset: [15, 0]
		)
		
		group "Additional Formats" (
			checkbox cbxMakeBlend "Blender (.blend)"	
		)
		
		fn setMode mode: #prod = (
			if (mode == #prod) do (
				cbxModeProd.checked = true
				cbxModeTest.checked = false
				'*'.add "mode" "1"			
			) 
			
			if (mode == #test) do (
				cbxModeProd.checked = false
				cbxModeTest.checked = true
				'*'.add "mode" "2"
			)
		)
		
		fn updateMode = (
			local m = '*'.get "mode"
			if (m == "2") then (
				setMode mode: #test
				return #test
			) 
			
			setMode mode: #prod
			return #prod		
		)
		
		
		fn loadSettings = (
			local dd = '*'.get "tnt_path"
			
			local p = '*'.get "spnAOPasses" type: #int
			spnAOPasses.value = if (p != 0) then p else 100
			
			local s = '*'.get "spnAOSize" type: #int
			spnAOSize.value = if (s != 0) then s else 5.0
			
			local r = '*'.get "spnAOResolution" type: #int
			spnAOResolution.value = if (r != 0) then r else 1024
			
			local r2 = '*'.get "spnAOXNormalResolution" type: #int
			spnAOXNormalResolution.value = if (r2 != 0) then r2 else 1024
			
			local q1 = '*'.get "spnDownloadQueueQuantity" type: #int
			spnDownloadQueueQuantity.value = if (q1 != 0) then q1 else 30
			
			cbxAODenoise.checked = '*'.get "cbxAODenoise" type: #bool_false
			cbxUseCoronaAO.checked = '*'.get "cbxUseCoronaAO" type: #bool_false
			cbxUseXNormalAO.checked = '*'.get "cbxUseXNormalAO" type: #bool_true
			cbxAODenoiseXNormal.checked = '*'.get "cbxAODenoiseXNormal" type: #bool_false
			cbxMakeBlend.checked = '*'.get "cbxMakeBlend" type: #bool_false
			
			if (cbxUseXNormalAO.checked) do (
				cbxUseCoronaAO.checked = false
				'*'.add  "cbxUseCoronaAO" false
			)
			
			updateMode()
		)
		
		fn updateUI = (
			local isUseCoronaAOGroupEnabled = cbxUseCoronaAO.checked
			spnAOPasses.enabled = isUseCoronaAOGroupEnabled
			spnAOResolution.enabled = isUseCoronaAOGroupEnabled
			spnAOSize.enabled = isUseCoronaAOGroupEnabled
			cbxAODenoise.enabled = isUseCoronaAOGroupEnabled
			
			local isUseXNormalAOGroupEnabled = cbxUseXNormalAO.checked
			spnAOXNormalResolution.enabled = isUseXNormalAOGroupEnabled
			cbxAODenoiseXNormal.enabled = isUseXNormalAOGroupEnabled			
		)
		
		on spnDownloadQueueQuantity changed v do '*'.add  "spnDownloadQueueQuantity" v
		on spnAOPasses changed v do '*'.add  "spnAOPasses" v
		on spnAOSize changed v do '*'.add  "spnAOSize" v
		on spnAOResolution changed v do '*'.add  "spnAOResolution" v
		on cbxAODenoise changed v do '*'.add  "cbxAODenoise" v		
		on spnAOXNormalResolution changed v do '*'.add  "spnAOXNormalResolution" v	
		on cbxAODenoiseXNormal changed v do '*'.add  "cbxAODenoiseXNormal" v		
		on cbxMakeBlend changed v do '*'.add  "cbxMakeBlend" v		
		
		on cbxUseCoronaAO changed v do (			
			'*'.add  "cbxUseXNormalAO" false
			cbxUseXNormalAO.checked = false
			
			'*'.add  "cbxUseCoronaAO" v
			updateUI()
		)
		
		on cbxUseXNormalAO changed v do (
			'*'.add  "cbxUseXNormalAO" v			
			'*'.add  "cbxUseCoronaAO" false
			cbxUseCoronaAO.checked = false
			
			updateUI()
		)
		
		on _rBatchGCGLBConverterSettings open do (
			loadSettings()
		)
		
		on cbxModeProd changed v do (
			setMode mode: #prod
		)
	
		on cbxModeTest changed v do (
			setMode mode: #test
		)
	)
	
	rollout _rAboutGCGLBConverter "About" category: 999 (
		group "Description" (
			dotNetControl edtDescription "System.Windows.Forms.Textbox" align:#center height: 60
		)
		
		label lblDummy1 ""
		
		label lblName "" 
		label lblVer ""
		label lblClient ""
		
		label lblDummy2 ""
		
		label lblAuthor ""
		hyperlink lblCopy ""  align: #center
		
		label lblDummy3 ""
		
		timer tmrRestart "" active: false interval: 300
			
		fn downloadFile url dl = (
			deleteFile dl
			w = dotNetObject "System.Net.WebClient"			
			try(
				spm = dotNetClass "System.Net.ServicePointManager"
				spm.SecurityProtocol = spm.SecurityProtocol.TLS12				
				w.DownloadFile (url + "?time=" + timestamp() as string) dl				
			) catch(
				return false
			)
			
			return true
		)
		
		fn bgUpdate = (
			local url = "https://raw.githubusercontent.com/MastaMan/GC-Batch-GLB-Converter/main/"
			local main = url + "Batch GLB Converter.ms"
			
			local this = getThisScriptFileName()
			local p = getFileNamePath (getThisScriptFileName())
			local dl = this + ".tmp"
			local r = downloadFile main dl
			if(not r or not doesFileExist dl) do return print "Can't download updates!"
			local vn = getIniSetting dl "INFO" "VERSION"
			local vo = getIniSetting this "INFO" "VERSION"
			local additionalFiles = getIniSetting dl "FILES"
			
			if(vn > vo) do (
				deleteFile this
				renameFile dl this
				
				for n in additionalFiles do (
					local s = getIniSetting dl "FILES" n
					if (s == "") do downloadFile (url + n) (p + n)
					if (s == "deleted") do deleteFile (p + n)
				)
				
				tmrRestart.active = true
			)
			
			deleteFile dl
		)
		
		fn updateWorker = (
			m = dotnetobject "CSharpUtilities.SynchronizingBackgroundWorker"
			m.WorkerSupportsCancellation = true 
			m.CancelAsync() 
			dotNet.addEventHandler m "DoWork" bgUpdate
			m.RunWorkerAsync()	
		)
		
		fn getScriptInfo s releaseInfo: "" =  (
			if(releaseInfo != "") do (
				local r = getINISetting s releaseInfo
				return r
			)
			
			local v = getINISetting s "INFO" "VERSION"
			local a = getINISetting s "INFO" "AUTHOR"
			local n = getINISetting s "INFO" "NAME"
			local o = ""
			for i in (getINISetting s "ABOUT") do o += i + "\r\n"
			local d = getINISetting s "INFO" "DEV"
			local h = getINISetting s "INFO" "HELP"
			local c = getINISetting s "INFO" "CLIENT"
			
			struct data (version, author, name, description, developer, client, help, releases)
			
			local r = for i in (getINISetting s) where (i != "ABOUT" and i != "SCRIPT" and i != "COPY") collect i
			
			return (data version: v author: a name: n description: o developer: d client: c help: h releases: r)
		)
		
		on tmrRestart tick do (
			this = getThisScriptFileName()
			try(fileIn this) catch()
			vo = getIniSetting this "INFO" "VERSION"
			m = ("Script updated to version " + vo + "!\n\n\n")
			for c in (getIniSetting this vo) do (
				m += c + "\n"
			)
			
			--messageBox m title: "Success!" beep: false
			print "---UPDATED---"
			print m
			tmrRestart.active = false
		)

		on _rAboutGCGLBConverter open do (
			edtDescription.MultiLine = true
			edtDescription.WordWrap = true
			edtDescription.ReadOnly = true
			edtDescription.BorderStyle = (dotNetClass "System.Windows.Forms.BorderStyle").FixedSingle
			
			
			local i = getScriptInfo (getThisScriptFilename())
			
			lblName.caption = i.name
			lblAuthor.caption = i.author
			lblVer.caption = i.version
			lblCopy.address = lblCopy.caption = i.developer
			lblClient.caption = i.client
			edtDescription.text = i.description
			
			try (floaterBatchGLBConverter.title = i.name + " " + i.version) catch()
			try (_rGCAutoModeration_Main.title = i.name + " v" +  i.version) catch()
			
			updateWorker()
			
			local x = '*'.get "x"
			local y = '*'.get "y"
			
			if (x != "" and y != "") do (
				x = x as integer
				y = y as integer
				floaterBatchGLBConverter.pos = [x, y] 
			)		
		)
		
		on _rAboutGCGLBConverter close do (
			local p = floaterBatchGLBConverter.pos
			
			'*'.add "x" p.x
			'*'.add "y" p.y
		)	
	)

	addRollout _rBatchGCGLBConverterSettings floaterBatchGLBConverter rolledUp: true 
	addRollout _rBatchGCGLBConverter floaterBatchGLBConverter rolledUp: false border: false	
	addRollout _rAboutGCGLBConverter floaterBatchGLBConverter rolledUp: true
)
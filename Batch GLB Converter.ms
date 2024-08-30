/*  
[INFO] 
NAME=Batch GLB Converter
VERSION=1.0.0
AUTHOR=MastaMan
DEV=https://3dground.net
HELP=
CLIENT=Eugen Zharnikov

[ABOUT]
Script for bulk conversion models to GLB=

[SCRIPT]
*/

/*
	TODO: 
	Transluency -> Transmission

*/


struct BatchGLBConverterWrapper (
	selfPath = getFilenamePath (getThisScriptFilename()),
	texturesQueueNames = #(),
	normalsQueueNames = #(),
	texturesQueue = #(),
	normalsQueue = #(),
	outPath = "",
		
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
	
	fn convertImageTo f isDelete: true type: #jpg = (
		local convertexe = this.selfPath + "convert.exe"
		local tmpDir = @"C:\temp\"
		local tmpConvertexe = tmpDir + "convert.exe"
		makeDir tmpDir
		copyFile convertexe tmpConvertexe
		
		local p = getFilenamePath f
		local n = getFilenameFile f
		local ext = getFilenameType f
		
		local exe = tmpConvertexe
		
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
		-- ??
		--this.optimizeImages files: #(ff)
		
		return ff
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
		-- ??
		--this.optimizeImages files: #(f)
		
		return f	
	),
	
	fn getCacheMapsDir = (
		local n = this.getSceneName()
		local p = this.outPath + n + @"\_glb_cache\"
		makeDir p all: true
		return p
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
	
	fn renderTargetMap t size: [2048, 2048] isReplace: true type: #jpg = (
		if (t == undefined) do return undefined
		local p = this.getCacheMapsDir()
		makeDir p all: true
		local f = this.generateCacheFilename type: type
		local rm = renderMap t size: size
		rm.gamma = 1.0
		rm.filename = f
		save rm
		close rm
		-- ??
		--this.optimizeImages files: #(f)
		
		local bt = Bitmaptexture filename: f
		
		if (isReplace) do replaceInstances t bt
		
		return bt
	),
	
	fn getMapFullPath f = (
		return mapPaths.getFullFilePath (filenameFromPath f)
	),
	
	fn cacheBitmap t resize: true type: #jpg = (
		local f = t.filename
		if (f == undefined or f == "") do return undefined
		local ff = this.generateCacheFilename()
		f = this.getMapFullPath f
		
		copyFile f ff
		
		ff = this.convertImageTo ff type: type
		--??
		--if (resize) do this.resizeImage ff
		
		t.filename = ff
		
		if (not doesFileExist ff) do return undefined
		
		return t
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
			bt = this.renderTargetMap t isReplace: false type: #png
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
		
		-- ??
		--this.optimizeImages files: #(nn)
		
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
				for i in t do replaceInstances i n
			) else (
				local n = this.convertBumpToNormal t[1]
				replaceInstances t[1] n
			)				
		)
	),
	
	fn renderTexturesQueue = (			
		for t in this.texturesQueue do (
			if (classOf t[1] == Bitmaptexture) then (
				local b = cacheBitmap t[1]			
				for i in t where i != undefined do replaceInstances i b
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
	
	fn neutralizeFalloff = (
		for i in getClassInstances Falloff do (
			local nm = Mix()
			nm.name = i.name
			
			nm.mixAmount = 50.0
			
			nm.color1 = i.color1
			nm.color2 = i.color2
			
			nm.map1 = i.map1
			nm.map2 = i.map2
			
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
	
	fn neutralizeCoronaAO = (
		for i in getClassInstances CoronaAO do (
			i.texmapOccluded = i.texmapUnoccluded
			i.colorOccluded = color 128 128 128
			i.colorUnoccluded = i.colorOccluded 
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
	
	fn coronaPhysicalMtlToGltfMaterial falloffMaterials: #() = (			
		for i in getClassInstances CoronaPhysicalMtl do (
			local nm = glTFMaterial()
			nm.name = i.name
			
			local isUsedFalloff = (findItem falloffMaterials i) != 0
			
			-- Diffuse				
			if (i.baseTexmap != undefined) then (
				nm.baseColorMap = i.baseTexmap
				this.addTextureToQueue nm.baseColorMap
				
				if (i.baseLevel != 1.0) do (
					local c = i.baseLevel * 255.0
					nm.baseColor = color c c c
				)
			) else (
				nm.baseColor = i.basecolor
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
				nm.AlphaMap = i.opacityTexmap
				alphaMode = 2
			)
			
			-- Bump
			nm.normal = i.baseBumpMapAmount
			if (i.baseBumpTexmap != undefined) do (
				nm.normalMap = copy i.baseBumpTexmap
				this.addNormalToQueue nm.normalMap
			)
			
			-- Displace
			if (i.displacementTexmap != undefined) do (
				nm.normalMap = copy i.displacementTexmap
				this.addNormalToQueue nm.normalMap
				nm.normal = 1.65
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
				local c = i.refractionAmount * 255.0
				
				nm.AlphaMap = ColorMap()
				nm.AlphaMap.solidcolor = color c c c
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
			) else if (isUsedFalloff) do (
				-- If falloff in diffuse, force enable Sheen
				nm.enableSheen = true
				nm.sheenRoughness = 0.3
				nm.sheenColor = color 65 65 65
				nm.metalness = 0
			)
			
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
		select obj
		modPanel.addModToSelection (Unwrap_UVW ()) ui:on
		subobjectLevel = 3
		local uvw =  obj.modifiers[1]
		uvw.setMapChannel 2
		uvw.setApplyToWholeObject true
		ss = #{}
		for i in 1 to uvw.numberPolygons() do append ss i
		uvw.selectPolygons ss
		uvw.flattenMap 50 #([1,0,0], [-1,0,0], [0,1,0], [0,-1,0], [0,0,1], [0,0,-1]) 0.0085 true 2 true true
		convertToMesh obj     
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
	
	fn bakeAO obj filename ao: undefined = (
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
		
		-- ??
		--this.optimizeImages files: #(filename)
		
		if (ao.denoise) do denoiseImage filename
		
		obj.material = originalMaterial
		r.progressive_passLimit = tmp_PassesLimit
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
			this.bakeAO o f ao: ao
			this.setAOmap o f		
		)
	),
	
	fn packGLTF i o = (
		local args = i + ";" + o
		args = substituteString args "/" @"\"
		
		local cmd = "gltfpack.bat \"" +  args + "\""
		
		local curDir = sysInfo.currentDir
		sysInfo.currentDir = this.selfPath
		
		hiddenDosCommand cmd exitCode: &exitcode donotwait: false
		
		sysInfo.currentDir = curDir	
	),
	
	fn exportGLB p = (
		ATSOps.Refresh()
		select geometry
		try (unhide selection doLayer: true) catch ()
		local n = this.getSceneName() 
		local pp = p + n + @"\"
		makeDir pp all: true
		local i = pp + n + ".gltf"
		local o = p + n + ".glb" 
		
		deleteFile o
		exportFile i #noPrompt selectedOnly: true
		deleteFile (i + ".log")
		
		packGLTF i o
		
		-- Remove ktx2
		--for i in getFiles (glbFolder + "*.ktx2") do deleteFile i
	),
	
	fn removeExtraObjects = (
		try (delete lights) catch ()
		try (delete cameras) catch ()
	),
	
	fn rmDir d = (
		local cmd = "rmdir /S /Q \"" + d + "\""
		HiddenDOSCommand cmd
	),
	
	fn run out: "" scn: undefined ao: undefined = (
		SetQuietMode true
		/* 
			@Input
			ao = AO_Settings (enabled, passes, resolution, denoise, size)
			scn = scn (file, path, name, ext, type, del, opened, maxName)
		*/
		
		if (ao == undefined or scn == undefined) do return false
		
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
		this.neutralizeCoronaLayered()
		
		-- Convert to GLTF Material
		this.coronaPhysicalMtlToGltfMaterial falloffMaterials: falloffMaterials
		this.coronaLightMtlToGltfMaterial()
		
		-- Render Maps
		this.renderTexturesQueue()
		this.renderNormalsQueue()
		
		if (ao.enabled) do this.createAOmap ao: ao
		
		this.exportGLB out
		
		if (scn.del != undefined) do rmDir scn.del
		
		SetQuietMode false
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
	
	fn load f = (
		resetMaxFile #noprompt
		
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
		
		local m = (getFiles (o + "GC-*-Corona.max"))[1]			
		if (m == undefined) do m = (getFiles (o + "GC-*-VRay.max"))[1]
		
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


try(closeRolloutFloater floaterBatchGLBConverter) catch()

if (::BATCH_GLB_CONVERTER_SUPPRESS_GUI != true) do (

	global floaterBatchGLBConverter = newRolloutFloater "GLB Converter" 300 630

	rollout _rBatchGCGCLBConverter "GLB Converter" category: 1 (
		group "Batch Export to GLB" (
			label lblTip1 "Tip: You can add *.max or *.zip to the list!" align: #left
			multiListbox lbxList "" items: #() height: 25
			label lblStatus "Selected items for export: 0" align: #right
			
			button btnAdd "+ Add"  width: 100 across: 2
			button btnRemove "- Remove" width: 100	
			button btnRemoveAll "Remove All" width: 100 across: 2
			button btnCopyNames "Copy Names"  width: 100
		)
		
		group "AO Settings" (
			spinner spnAOPasses "Passes: " range: [1, 9999, 100] type: #integer fieldwidth: 50 align: #right across: 2 offset: [-15, 0]
			spinner spnAOSize "Size (cm): " range: [0.01, 9999.0, 5.0] type: #float fieldwidth: 50 
			spinner spnAOResolution "Resolution:"  range: [512, 8192, 1024] scale: 512 type: #integer align: #right fieldwidth: 50 across: 2  offset: [-15, 0]
			checkbox cbxAODenoise "Use VRay Denoiser" offset: [15, 0]
		)
		
		checkbox cbxBakeAO "Bake AO Maps"
		
		button btnBatchExport "Batch Export (0)" height: 36 width: 260 offset: [0, 10]
		
		global BATCH_GLB_CONVERTER_FILES = #()
		
		fn loadSettings = (
			local p = '*'.get "spnAOPasses" type: #int
			spnAOPasses.value = if (p != 0) then p else 100
			
			local s = '*'.get "spnAOSize" type: #int
			spnAOSize.value = if (s != 0) then s else 5.0
			
			local r = '*'.get "spnAOResolution" type: #int
			spnAOResolution.value = if (r != 0) then r else 1024
			
			cbxAODenoise.checked = '*'.get "cbxAODenoise" type: #bool_false
			cbxBakeAO.checked = '*'.get "cbxBakeAO" type: #bool_false
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
		
		fn getData = (
			::BATCH_GLB_CONVERTER_FILES = #()
			
			local ff = '*'.get "" sec: "files"
			
			struct tmp (path, filename, name, glb, isGlbExist, type, ext)
			
			for f in ff do (
				local glb = '*'.get f sec: "files"
				local isGlbExist = glb != "" and doesFileExist glb				
				local p = getFilenamePath f
				local n = getFilenameFile f
				local ext = getFilenameType f
				local type = (trimLeft ext ".") as name
				local filename = f
				
				if (not doesFileExist f) do (
					'*'.del f sec: "files"
					continue
				)
				
				append ::BATCH_GLB_CONVERTER_FILES (tmp path: p name: n filename: filename glb: glb isGlbExist: isGlbExist type: type ext: ext)
			)
			
			return ::BATCH_GLB_CONVERTER_FILES
		)

		fn updateUI = (
			local ss = getSelectedItems()
			btnBatchExport.enabled = lbxList.items.count != 0 and ss.count != 0
			lblStatus.caption = formatString "Selected Items: $1 | Total Items: $2" v: #(ss.count, lbxList.items.count)
			btnBatchExport.caption = formatString "Batch Export ($1)" v: #(ss.count)
			
			isAOGroupEnabled = cbxBakeAO.checked
			spnAOPasses.enabled = isAOGroupEnabled
			spnAOResolution.enabled = isAOGroupEnabled
			spnAOSize.enabled = isAOGroupEnabled
			cbxAODenoise.enabled = isAOGroupEnabled
		)
	
		fn updateLbx = (
			getData()
			
			lbxList.items = #()
			local o = #()
			for i in ::BATCH_GLB_CONVERTER_FILES do (
				local glbStatus = ""
				if (i.isGlbExist) do glbStatus = "[GLB]"
				append o (formatString "$1 $2" v: #(i.name, glbStatus))
			)
			
			lbxList.items = o
			
			updateUI()
			
			SetQuietMode false
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
		
		fn startBatchExport = (
			local ss = getSelectedItems()			
			if (ss.count == 0) do return messageBox "Please select items from list!" title: "Warning!"
			
			local p = getOpenPath()
			if (p == undefined) do return false
			
			struct AO_Settings (enabled, passes, resolution, denoise, size)
			ao = AO_Settings()
			ao.enabled = cbxBakeAO.checked
			ao.size = (spnAOSize.value as string) + "cm"
			ao.passes = spnAOPasses.value
			ao.resolution = spnAOResolution.value
			ao.denoise = cbxAODenoise.checked
			
			progressStart "In process..."
			escapeEnable = true
			clearListener()
			for i in 1 to ss.count do (
				local f = ss[i]
				
				if (not doesFileExist f.filename) do continue
				
				if (getProgressCancel() or keyboard.escPressed) do return false
				
				local scn = ::API_BATCH_GLB_CONVERTER.load f.filename				
				if (not scn.opened) do continue
				
				::API_BATCH_GLB_CONVERTER.run scn: scn out: p ao: ao
				
				if (getProgressCancel() or keyboard.escPressed) do return false
				
				progressUpdate (100 * i / ss.count)
			)
			
			progressEnd()			
			resetMaxFile #noprompt
			SetQuietMode false
			
			updateLbx()
			
			ShellLaunch p ""
		)
		
		on btnAdd pressed do (
			local ff = getOpenFiles()
			if (ff.count == 0) do return #nofiles
			
			for f in ff do (			
				'*'.add f "" sec:"files"
			)
			
			updateLbx()
		)
		
		on btnRemove pressed do (
			local ss = getSelectedItems()
			if (ss.count == 0) do return messageBox "Please select items from list!" title: "Warning!"
			
			for f in ss do (
				'*'.del f.filename sec: "files" 
			)
			
			lbxList.selection = #{}
			
			updateLbx()
		)
		
		on btnRemoveAll pressed do (
			local q = queryBox "Do you really want to delete all items from list?" title: "Confirm?"
			if (not q) do return #cancel
			
			'*'.delSec "files"
			
			updateLbx()
		)
		
		on btnCopyNames pressed do (
			local ss = getSelectedItems()
			if (ss.count == 0) do (
				messageBox "Please select items from list!" title: "Error!"
				return false 
			)
			
			local b = for i in ss collect i.name
			
			copyToClipboard b
		)
	
		on lbxList selectionEnd do updateUI()
		
		on spnAOPasses changed v do '*'.add  "spnAOPasses" v
		on spnAOSize changed v do '*'.add  "spnAOSize" v
		on spnAOResolution changed v do '*'.add  "spnAOResolution" v
		on cbxAODenoise changed v do '*'.add  "cbxAODenoise" v
		on cbxBakeAO changed v do (
			'*'.add  "cbxBakeAO" v
			updateUI()
		)
	
		
		on _rBatchGCGCLBConverter open do (
			loadSettings()
			
			updateLbx()
		)
		
		on btnBatchExport pressed do startBatchExport()
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
			
			local additionalFiles = #(
				"Install.mcr", 
				"jpegoptim.exe",
				"convert.exe",
				"gltfpack.exe",
				"denoise.bat",
				"gltfpack.bat",
				"vdenoise.xml",
				"normalmap.exe"						
			)
			
			local this = getThisScriptFileName()
			local p = getFileNamePath (getThisScriptFileName())
			local dl = this + ".tmp"
			local r = downloadFile main dl
			if(not r or not doesFileExist dl) do return print "Can't download updates!"
			local vn = getIniSetting dl "INFO" "VERSION"
			local vo = getIniSetting this "INFO" "VERSION"
			
			if(vn > vo) do (
				deleteFile this
				renameFile dl this
				
				for n in additionalFiles do (
					downloadFile (url + n) (p + n)
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

	addRollout _rBatchGCGCLBConverter floaterBatchGLBConverter rolledUp: false border: false
	addRollout _rAboutGCGLBConverter floaterBatchGLBConverter rolledUp: true
)
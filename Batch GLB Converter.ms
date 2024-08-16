/*
	TODO: 
	Transluency -> Transmission

*/

(
	struct BatchGLBConverterWrapper (
		selfPath = getFilenamePath (getThisScriptFilename()),
		texturesQueueNames = #(),
		normalsQueueNames = #(),
		texturesQueue = #(),
		normalsQueue = #(),
			
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
			
			local jpgoptim = "\"" + selfPath + "jpegoptim.exe\""
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
			local convertexe = selfPath + "convert.exe"
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
			sysInfo.currentDir = selfPath	
			
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
			
			local convertexe = selfPath + "convert.exe"
			local tmpDir = @"C:\temp\"
			local tmpConvertexe = tmpDir + "convert.exe"
			makeDir tmpDir
			copyFile convertexe tmpConvertexe
			
			local exe = tmpConvertexe
			
			if (doesFileExist f and getFileSize f > 0) do return f
			
			local curDir = sysInfo.currentDir
			sysInfo.currentDir = selfPath	
			
			local cmd = exe + " \"" + f + "\" -resize \"" + size + "\" \"" + f + "\""									
			hiddenDosCommand cmd exitcode:&exitcode			
			sysInfo.currentDir = curDir
			-- ??
			--this.optimizeImages files: #(f)
			
			return f	
		),
		
		fn getCacheMapsDir = (
			return maxFilePath + @"_glb_cache\"
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
			local ff = generateCacheFilename()
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
			
			local normalmap = selfPath + "normalmap.exe"
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
			sysInfo.currentDir = selfPath
			
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
					for i in t do replaceInstances i b
				) else (
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
	
		fn runCoronaConverter = (
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
			local d = p + n + "_denoised" + ext
			if (not doesFileExist d) do return undefined
			return d
		),
		
		fn denoiseImage f = (
			local v = getCurrentMaxVersion()
			
			local args = v + ";" + f
			args = substituteString args "/" @"\"
			
			local cmd = "denoise.bat \"" +  args + "\""
			
			local curDir = sysInfo.currentDir
			sysInfo.currentDir = selfPath
			
			hiddenDosCommand cmd exitCode: &exitcode donotwait: false
			
			sysInfo.currentDir = curDir	
		),
		
		fn bakeAO obj filename size: 1024 passes: 100 aoSize: "5cm" denoise: true = (			
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
			r.progressive_passLimit = passes
			r.denoise_filterType = 4
			r.denoise_blendAmount = 1.0
			r.shading_onlyElements = true
			renderSceneDialog.commit()
			renderSceneDialog.update()
			
			local m = CoronaPhysicalMtl()
			m.baseColor = white
			m.baseRoughness = 1.0
			local ao = CoronaAO()
			ao.maxDistance = units.decodeValue aoSize
			ao.colorSpread = 0.022
			ao.Quality = 2
			ao.normalMode = 0
			ao.rayDirectionality = 0.03
			--ao.occlusionFrom = 3
			m.baseTexmap = ao
			obj.material = m
			
			obj.iNodeBakeProperties.removeAllBakeElements() 
			local be = Corona_DiffuseColor()
			be.outputSzX = be.outputSzY = size	
			be.fileType = "jpg"
			be.filename = filename
			be.enabled = true
			be.filter = true
			obj.INodeBakeProperties.addBakeElement be
			obj.INodeBakeProperties.bakeEnabled = true
			obj.INodeBakeProperties.bakeChannel = 2
			obj.INodeBakeProperties.nDilations = 2
			select obj
			
			render rendertype:#bakeSelected vfb: true progressBar:true outputSize:[size, size] vfb: false
			
			-- ??
			--this.optimizeImages files: #(filename)
			
			if (denoise) do denoiseImage filename
			
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
		
		fn createAOmap = (
			max unhide all
			local oo = objects as array
			for o in oo where this.isValidObject o do (
				local n = o.material.name
				o.material = copy o.material
				o.material.name = n
				
				local f = this.generateCacheFilename()			
				this.autoUnwrap o					
				this.bakeAO o f size: 512 passes: 10 aoSize: "5cm" denoise: true
				this.setAOmap o f				
			)
		),
		
		fn packGLTF i o = (
			local args = i + ";" + o
			args = substituteString args "/" @"\"
			
			local cmd = "gltfpack.bat \"" +  args + "\""
			
			local curDir = sysInfo.currentDir
			sysInfo.currentDir = selfPath
			
			hiddenDosCommand cmd exitCode: &exitcode donotwait: false
			
			
			sysInfo.currentDir = curDir	
		),
		
		fn exportGLB = (
			ATSOps.Refresh()
			select geometry
			local n = this.getSceneName() 
			local glbFolder = this.selfPath + @"GLB\"
			local p = glbFolder + n + @"\"
			makeDir p all: true			
			local i = p + n + ".gltf"
			local o = glbFolder + n + ".glb" 
			
			deleteFile i
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
		
		fn run AO: true = (
			if (maxFileName == "") do return false
			
			ATSOps.Refresh()
			
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
			
			this.clearCacheMapsDir()
			
			-- Convert all to Corona Physical Mtl
			this.runCoronaConverter()
			
			this.instnceDuplicateMaps()
			
			local falloffMaterials = this.getMaterialsWithFalloff()
			
			this.neutralizeFalloff()
			this.neutralizeCoronaAO()
			this.neutralizeCoronaLayered()
			
			-- Convert to GLTF Material
			this.coronaPhysicalMtlToGltfMaterial falloffMaterials: falloffMaterials
			this.coronaLightMtlToGltfMaterial()
			
			-- Render Maps
			this.renderTexturesQueue()
			this.renderNormalsQueue()
			
			if (AO) do this.createAOmap()
			
			this.exportGLB()
		)
	)
	
	local scn = maxFilePath + maxFileName
	resetMaxFile #noPrompt 
	loadMaxFile scn quiet: true
	(BatchGLBConverterWrapper()).run AO: true
	messageBox "Done!" beep: false title: "Success!"
)
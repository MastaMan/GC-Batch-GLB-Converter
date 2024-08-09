/*
	TODO: 
	Transluency -> Transmission

*/

(
	struct BatchGLBConverterWrapper (
		selfPath = getFilenamePath (getThisScriptFilename()),
		texturesQueue = #(),
		normalsQueue = #(),
			
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
		
		fn resizeImage f maxSize: 2048 type: #jpg = (
			local size = maxSize as string + "x" + maxSize as string + @">"
			
			local convertexe = selfPath + "convert.exe"
			local tmpDir = @"C:\temp\"
			local tmpConvertexe = tmpDir + "convert.exe"
			makeDir tmpDir
			copyFile convertexe tmpConvertexe
			
			local exe = tmpConvertexe
			
			local nn = f
			if (doesFileExist nn and getFileSize nn > 0) do return nn
			deleteFile nn
			
			local curDir = sysInfo.currentDir
			sysInfo.currentDir = selfPath	
			
			local cmd = exe + " \"" + f + "\" -resize \"" + size + "\" \"" + nn + "\""									
			hiddenDosCommand cmd exitcode:&exitcode			
			sysInfo.currentDir = curDir
			
			optimizeImages files: #(nn)
			
			return nn	
		),
		
		fn getCacheMapsDir = (
			return maxFilePath + @"_glb_cache\"
		),
		
		fn generateCacheFilename type: #jpg = (
			local p = getCacheMapsDir()
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
			local p = getCacheMapsDir()
			makeDir p all: true
			local f = generateCacheFilename type: type
			local rm = renderMap t size: size
			rm.gamma = 1.0
			rm.filename = f
			save rm
			close rm
			
			optimizeImages files: #(f)
			
			local bt = Bitmaptexture filename: f
			
			if (isReplace) do replaceInstances t bt
			
			return bt
		),
		
		/*fn convertBumpToNormal t = (			
			if (t == undefined) do return false
			
			local bt = renderTargetMap t isReplace: false type: #png
			
			local f = bt.filename
			
			if (f == undefined or f == "") do return false
			
			local o = OSLMap()
			o.OSLPath = selfPath + "BumpToNormalMap.osl"
			o.Filename = f
			
			local n = renderTargetMap o isReplace: false
			
			replaceInstances t n
			deleteFile f
			
			return n
		),*/
		
		fn convertBumpToNormal t = (			
			if (t == undefined) do return false
			
			local normalmap = selfPath + "normalmap.exe"
			local tmpDir = @"C:\temp\"
			local tmpNormalmap = tmpDir + "normalmap.exe"
			makeDir tmpDir
			copyFile normalmap tmpNormalmap
			
			local exe = tmpNormalmap
			
			local bt = renderTargetMap t isReplace: false type: #png
			
			local f = bt.filename
			local ff = generateCacheFilename()
		
			local p = getFilenamePath f
			makeDir p all: true
			
			curDir = sysInfo.currentDir
			sysInfo.currentDir = selfPath
			
			local cmd = exe + " -i \"" + f + "\" -o \"" + ff + "\""
			
			hiddenDosCommand cmd exitcode:&exitcode	
			
			sysInfo.currentDir = curDir 
			
			optimizeImages files: #(ff)
			
			local n = Bitmaptexture filename: ff
			
			replaceInstances t n
			deleteFile f
			
			return n
		),
		
		fn cacheBitmap t = (
			local f = t.filename
			if (f == undefined or f == "") do return false
			local ff = generateCacheFilename()
			
			copyFile f ff
			
			resizeImage ff
			
			local bt = Bitmaptexture filename: ff
			
			replaceInstances t bt
		),
		
		fn addTextureToQueue t = (
			if (t == undefined) do return false
			return appendIfUnique texturesQueue t			
		),	
		
		fn addNormalToQueue t = (
			if (t == undefined) do return false
			
			if (classOf t == CoronaNormal and t.normalMap != undefined) do (
				return addTextureToQueue t				
			) 
			
			return appendIfUnique normalsQueue t
		),
		
		fn renderNormalsQueue = (
			for t in normalsQueue do (
				convertBumpToNormal t
			)
		),
		
		fn renderTexturesQueue = (
			for t in texturesQueue do (
				renderTargetMap t
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
					addTextureToQueue nm.AlphaMap
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
					addTextureToQueue nm.baseColorMap
					
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
					addTextureToQueue nm.roughnessMap
					
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
					addNormalToQueue nm.normalMap
				)
				
				-- Displace
				if (i.displacementTexmap != undefined) do (
					nm.normalMap = copy i.displacementTexmap
					addNormalToQueue nm.normalMap
					nm.normal = 1.65
				)
				
				-- Metalness
				nm.metalness_map = i.metalnessTexmap
				addTextureToQueue nm.metalness_map 
				
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
					addTextureToQueue nm.emissionMap
				)
				
				-- Refraction
				if (i.refractionAmountTexmap != undefined) then (
					nm.AlphaMap = i.refractionAmountTexmap
					addTextureToQueue nm.AlphaMap
					nm.alphaMode = 3
				) else if (i.refractionAmount != 0) do (
					local c = i.refractionAmount * 255.0
					
					nm.AlphaMap = ColorMap()
					nm.AlphaMap.solidcolor = color c c c
					addTextureToQueue nm.AlphaMap
				)
				
				-- Clearcoat
				if (i.clearcoatAmount != 0) do (
					nm.enableClearCoat = true
					nm.clearcoat = i.clearcoatAmount
					nm.clearcoatMap = i.clearcoatAmountTexmap
					addTextureToQueue nm.clearcoatMap
					
					nm.clearcoatNormal = i.clearcoatBumpMapAmount
					nm.clearcoatNormalMap = copy i.clearcoatBumpTexmap
					addNormalToQueue nm.clearcoatNormalMap
					
					nm.clearcoatRoughness = i.clearcoatRoughness
					nm.clearcoatRoughnessMap = i.clearcoatRoughnessTexmap
					addTextureToQueue nm.clearcoatRoughnessMap
				)
				
				-- Sheen
				if (i.sheenAmount != 0) then (
					nm.enableSheen = true					
					nm.sheenColor = i.sheenColor
					nm.sheenRoughness = i.sheenRoughness
					nm.sheenColorMap = i.sheenColorTexmap
					addTextureToQueue nm.sheenColorMap
					
					nm.sheenRoughnessMap = i.sheenRoughnessTexmap
					addTextureToQueue nm.sheenRoughnessMap
				) else if (isUsedFalloff) do (
					-- If falloff in diffuse, force enable Sheen
					nm.enableSheen = true
					nm.sheenRoughness = 0.18
					nm.sheenColor = color 35 35 35
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
		
		fn exportGLB = (
			ATSOps.Refresh()
			select geometry
			local n = getSceneName() + ".glb"
			local f = selfPath + n
			deleteFile f
			exportFile f #noPrompt selectedOnly: true
			deleteFile (f + ".log")
		),
		
		fn removeExtraObjects = (
			try (delete lights) catch ()
			try (delete cameras) catch ()
		),
		
		fn run = (
			if (maxFileName == "") do return false
			
			texturesQueue = #()
			normalsQueue = #()
			
			clearCacheMapsDir()
			removeExtraObjects()
			
			-- Convert all to Corona Physical Mtl
			runCoronaConverter()
			
			instnceDuplicateMaps()
			
			local falloffMaterials = getMaterialsWithFalloff()
			
			neutralizeFalloff()
			neutralizeCoronaAO()
			neutralizeCoronaLayered()
			
			-- Convert to GLTF Material
			coronaPhysicalMtlToGltfMaterial falloffMaterials: falloffMaterials
			coronaLightMtlToGltfMaterial()
			
			-- Render Maps
			renderTexturesQueue()
			renderNormalsQueue()
			
			exportGLB()
			
			-- ??? Bake AO
		)
	)
	
	(BatchGLBConverterWrapper()).run()
)
fn optimizeImages files: #() quality: 90 = (
	selfPath = getFilenamePath (getThisScriptFilename())
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
	)
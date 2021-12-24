sub_dissectors = {
	["VERSION"] = nil, 

	["PROC_LIST"] = nil, 
	["PROC_READ"] = nil, 
	["PROC_WRITE"] = nil, 
	["PROC_MAPS"] = nil, 
	["PROC_INTALL"] = nil, 
	["PROC_CALL"] = nil, 
	["PROC_ELF"] = nil, 
	["PROC_PROTECT"] = nil, 
	["PROC_SCAN"] = nil, 
	["PROC_INFO"] = nil, 
	["PROC_ALLOC"] = nil, 
	["PROC_FREE"] = nil, 

	["DEBUG_ATTACH"] = nil, 
	["DEBUG_DETACH"] = nil, 
	["DEBUG_BREAKPT"] = nil, 
	["DEBUG_WATCHPT"] = nil, 
	["DEBUG_THREADS"] = nil, 
	["DEBUG_STOPTHR"] = nil, 
	["DEBUG_RESUMETHR"] = nil, 
	["DEBUG_GETREGS"] = nil, 
	["DEBUG_SETREGS"] = nil, 
	["DEBUG_GETFPREGS"] = nil, 
	["DEBUG_SETFPREGS"] = nil, 
	["DEBUG_GETDBGREGS"] = nil, 
	["DEBUG_SETDBGREGS"] = nil, 
	["DEBUG_STOPGO"] = nil, 
	["DEBUG_THRINFO"] = nil, 
	["DEBUG_SINGLESTEP"] = nil, 

	["KERN_BASE"] = nil, 
	["KERN_READ"] = nil, 
	["KERN_WRITE"] = nil, 

	["CONSOLE_REBOOT"] = nil, 
	["CONSOLE_END"] = nil, 
	["CONSOLE_PRINT"] = nil, 
	["CONSOLE_NOTIFY"] = nil, 
	["CONSOLE_INFO"] = nil, 
	
	-- extended
	["PS4_FIRMWARE"] = PS4FW, 
	["EXT_VERSION"] = ExtVersion, 
}

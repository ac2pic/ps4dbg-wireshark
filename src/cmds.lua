CMD = {
	[0xBD000001] = "VERSION",

	[0xBDAA0001] = "PROC_LIST",
	[0xBDAA0002] = "PROC_READ",
	[0xBDAA0003] = "PROC_WRITE",
	[0xBDAA0004] = "PROC_MAPS",
	[0xBDAA0005] = "PROC_INTALL",
	[0xBDAA0006] = "PROC_CALL",
	[0xBDAA0007] = "PROC_ELF",
	[0xBDAA0008] = "PROC_PROTECT",
	[0xBDAA0009] = "PROC_SCAN",
	[0xBDAA000A] = "PROC_INFO",
	[0xBDAA000B] = "PROC_ALLOC",
	[0xBDAA000C] = "PROC_FREE",

	[0xBDBB0001] = "DEBUG_ATTACH",
	[0xBDBB0002] = "DEBUG_DETACH",
	[0xBDBB0003] = "DEBUG_BREAKPT",
	[0xBDBB0004] = "DEBUG_WATCHPT",
	[0xBDBB0005] = "DEBUG_THREADS",
	[0xBDBB0006] = "DEBUG_STOPTHR",
	[0xBDBB0007] = "DEBUG_RESUMETHR",
	[0xBDBB0008] = "DEBUG_GETREGS",
	[0xBDBB0009] = "DEBUG_SETREGS",
	[0xBDBB000A] = "DEBUG_GETFPREGS",
	[0xBDBB000B] = "DEBUG_SETFPREGS",
	[0xBDBB000C] = "DEBUG_GETDBGREGS",
	[0xBDBB000D] = "DEBUG_SETDBGREGS",
	[0xBDBB0010] = "DEBUG_STOPGO",
	[0xBDBB0011] = "DEBUG_THRINFO",
	[0xBDBB0012] = "DEBUG_SINGLESTEP",

	[0xBDCC0001] = "KERN_BASE",
	[0xBDCC0002] = "KERN_READ",
	[0xBDCC0003] = "KERN_WRITE",

	[0xBDDD0001] = "CONSOLE_REBOOT",
	[0xBDDD0002] = "CONSOLE_END",
	[0xBDDD0003] = "CONSOLE_PRINT",
	[0xBDDD0004] = "CONSOLE_NOTIFY",
	[0xBDDD0005] = "CONSOLE_INFO",
	
	-- extended
	[0xBD000500] = "PS4_FIRMWARE",
	[0xBD000501] = "EXT_VERSION",
}
PS4FW = {}
function PS4FW:sub_dissector(buffer, pinfo, tree, cmd_cache)
    local subtree = tree:add(ps4debug_proto,buffer(),"PS4Debug Protocol Data")	
	
    if buffer:len() == 2 then 
        firmware = buffer(0,2):le_uint()

        conn = create_connection(client, server)

        conn.cached[pinfo.number] = {}
        fw_cache = conn.cached[pinfo.number]
        fw_cache.index = 1
        fw_cache.type = "RESP"
        pinfo.cols.info = string.format("%s is %s", cmd_cache.cmd, firmware)
		subtree:add(buffer(),"Firmware")
    end
end

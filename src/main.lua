ps4debug_proto = Proto("ps4debug","PS4Debug Protocol")

function ps4debug_proto.dissector(buffer,pinfo,tree)
	client, server = get_client_server(src_pair, dst_pair)
	if has_connection(client, server) then
		conn = create_connection(client, server) 
		cache = conn.cached[pinfo.number]
		if cache then
			pinfo.cols.protocol = "PS4Debug"
			pinfo.cols.info = cache.info
			local subtree = tree:add(ps4debug_proto,buffer(),"PS4Debug Protocol Data")
			if cache.subtree then
				for key, value in pairs(cache.subtree) do
					-- size, length, msg = value
					subtree:add(buffer(value[1], value[2]),value[3])
				end
			end
			return
		end
	end

	pinfo.cols.protocol = "PS4Debug"
	
	src_pair = string.format("%s:%s", pinfo.src, pinfo.src_port)
	dst_pair = string.format("%s:%s", pinfo.dst, pinfo.dst_port)
    if buffer:len() == 12 and buffer(0,4):le_uint() == 0xFFAABBCC then
		conn = create_connection(src_pair, dst_pair)
		conn.cached[pinfo.number] = {}
		cache = conn.cached[pinfo.number]
		cache.type = "CMD"
		-- Info 
		local subtree = tree:add(ps4debug_proto,buffer(),"PS4Debug Protocol Data")
		msgs = {"Command Magic","Command Number", "Argument length"}
		cache.subtree = {}
		for key, value in pairs(msgs) do 
			subtree:add(buffer(4 * (key - 1),4),value)
			cache.subtree[key] = {4* (key - 1), 4, value}
		end
		
		local cmdName = CMD[buffer(4,4):le_uint()]
		if cmdName == nil then 
			cmdName = string.format("0x%X", buffer(4,4):le_uint())
		end
		
		create_client(src_pair)
		create_server(dst_pair)
		
		arglen = buffer(8,4):le_uint()
		cache.cmd = cmdName
		cache.arglen = arglen
		pinfo.cols.info = string.format("cmd=%s arglen=%d",cmdName, arglen)
		cache.info = string.format("cmd=%s arglen=%d",cmdName, arglen)
	else
		client, server = get_client_server(src_pair, dst_pair)
		if not client or not server then
			-- Don't know what this is for
			return
		end 
		
		cmd_number, cmd_cache = get_cmd_packet(client, server, pinfo.number)
		selected_sub_dissector = sub_dissectors[cmd_cache.cmd]
		if selected_sub_dissector then 
			return selected_sub_dissector:sub_dissector(buffer,pinfo,tree,cmd_cache)
		end
		
		pinfo.cols.protocol = string.format("PS4Debug todo %s %s", client, server)
		
		local subtree = tree:add(ps4debug_proto,buffer(),"PS4Debug Protocol Data")
		subtree:add(buffer(),cmd_number)
		if client and server then
			conn = create_connection(client, server)
			pinfo.cols.info = string.format("cmd=%s conversation",conn.cache[cmd_number]["cmd"] or 'not set')
		end

	end
end

tcp_table = DissectorTable.get("tcp.port")

tcp_table:add(744,ps4debug_proto)

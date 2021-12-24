ExtVersion = {}
function ExtVersion:sub_dissector(buffer, pinfo, tree, cmd_cache)
	src_pair = string.format("%s:%s", pinfo.src, pinfo.src_port)
	dst_pair = string.format("%s:%s", pinfo.dst, pinfo.dst_port)
	client, server = get_client_server(src_pair, dst_pair)
	
	resp_num, resp_cache = get_previous_cmd_resp(client, server, pinfo.number)
	
	conn = create_connection(client, server)
    
	if resp_num == -1 then
		conn.cached[pinfo.number] = {}
		len_cache = conn.cached[pinfo.number]
		len_cache.index = 1
		len_cache.type = "RESP"
	elseif resp_num < pinfo.number then
		-- we know it has more
		conn.cached[pinfo.number] = {}
		len_cache = conn.cached[pinfo.number]
		len_cache.index = resp_cache.index + 1
		len_cache.type = "RESP"
	end
	local subtree = tree:add(ps4debug_proto,buffer(),"PS4Debug Protocol Data")	
	if resp_num == -1 or resp_cache.index == 1 then
		pinfo.cols.info = string.format("%s string length is %s", cmd_cache.cmd, buffer(0,4):le_uint())
		subtree:add(buffer(),"String length")
	elseif resp_cache.index == 2  then
		pinfo.cols.info = string.format("%s string", cmd_cache.cmd)
		subtree:add(buffer(),"Raw string")
	end
	
end

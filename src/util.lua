function get_client_server(maybe_client, maybe_server)
	if clients[maybe_client] then 
		return maybe_client, maybe_server
	elseif servers[maybe_client] then
		return maybe_server, maybe_client
	end
	return nil, nil
end

function has_connection(client_pair, server_pair)
	unique_id = string.format("%s_%s", client_pair, server_pair)
	return not connections[unique_id]
end


function create_connection(client_pair, server_pair)
	unique_id = string.format("%s_%s", client_pair, server_pair)
	if not connections[unique_id] then
		connections[unique_id] = {}
		-- commands are the markers
		connections[unique_id].cached = {}
		-- packets are the history
		connections[unique_id].packets = {}
	end 
	return connections[unique_id]
end

function create_server(server_id)
	if not servers[server_id] then 
		servers[server_id] = true
	end
	return servers[client_id]
end

function create_client(client_id)
	if not clients[client_id] then 
		clients[client_id] = true
	end
	return clients[client_id]
end

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

function get_cmd_packet(client, server, packet_number)
	conn = create_connection(client, server) 
	cached = conn.cached
	repeat
		if cached[packet_number] and cached[packet_number].type == "CMD" then 
			return packet_number, cached[packet_number]
		end 
		packet_number = packet_number - 1
	until packet_number < 1
	return -1, nil
end

function get_previous_cmd_resp(client, server, packet_number)
	conn = create_connection(client, server) 
	cached = conn.cached
	repeat
		if cached[packet_number] then 
			if cached[packet_number].type == "CMD" then
				return -1, nil
			elseif cached[packet_number].type == "RESP" then
				return packet_number, cached[packet_number]
			end
		end 
		packet_number = packet_number - 1
	until packet_number < 1
	return -1, nil
end

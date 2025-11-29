m = Map("sshproxy", translate("SSH Proxy Configuration"))

s = m:section(TypedSection, "profile", translate("Profiles"))
s.addremove = true
s.anonymous = false

o = s:option(Value, "name", translate("Name"))
o.rmempty = false

o = s:option(Value, "server", translate("Server"))

o = s:option(Value, "port", translate("Port"))
o.default = 22

o = s:option(Value, "user", translate("User"))

o = s:option(Value, "keyfile", translate("Key File"))
o.placeholder = "/etc/dropbear/id_rsa"

o = s:option(TextValue, "payload", translate("Payload"))
o.wrap = "off"

o = s:option(ListValue, "tls", translate("Use TLS (openssl s_client)"))
o:value("0", "No")
o:value("1", "Yes")
o.default = "0"

o = s:option(Value, "remote_socks_port", translate("Local SOCKS Port (0 off)"))
o.default = "0"

btn = m:section(SimpleSection)
start = btn:option(Button, "_start", translate("Start Service"))
function start.write()
    luci.sys.call("/etc/init.d/sshproxy start")
end

stop = btn:option(Button, "_stop", translate("Stop Service"))
function stop.write()
    luci.sys.call("/etc/init.d/sshproxy stop")
end

return m

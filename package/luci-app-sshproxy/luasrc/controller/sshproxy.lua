module('luci.controller.sshproxy', package.seeall)
function index()
 entry({'admin','services','sshproxy'}, cbi('sshproxy/form'), _('SSH Proxy'), 30).dependent=true
end

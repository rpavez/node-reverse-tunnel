log4js = require('log4js')
const { spawn } = require('child_process')
var wstun = require("@mdslab/wstun");

reverse_client = new wstun.client_reverse();

// without security
wstunHost = 'ws://host.docker.internal:3000';

// or with security 
// wstunHost = 'wss://wstunServerIP:wstunPort';

// <publicPort> is the port on the reverse tunnel server on which the tunneled service will be reachable
// <remoteHost>:<remotePort> is the endpoint of the service to be reverse tunneled
reverse_client.start("23", wstunHost, '0.0.0.0:22');

spawn('/usr/sbin/sshd', ['-D']);
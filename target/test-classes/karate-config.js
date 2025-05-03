function fn() { 
var env = karate.env; // get system property 'karate.env' karate.log('karate.env system property was:', env); 
if (!env) { 
env = 'dev'; 
} 

var config = {
env: env, 
myVarName: 'hello karate', 
baseUrl: 'https://gorest.co.in',
tokenID: 'Bearer 6d8c762ad7af8ecf5b12abb1e7a345214e822f4cafcfb67d183a21af51163300'
}

if (env == 'dev') { 
// customize 
// e.g. config.foo = 'bar'; 
} else if (env == 'e2e') { 
// customize 
} 
return config; 
}


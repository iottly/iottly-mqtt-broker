db.topics.insert({_id:1, topics:["/iottly/project1/device01/commands", "/iottly/project1/device01/events"]})

db.topics.insert({_id:0, topics:["/iottly/+/+/commands"]})


//pwd: devicepassword
db.users.insert({username:"device01", password:"PBKDF2$sha256$901$vsmD1hzGz6Eq40FP$yn7B8BQVgadfNyWxzvJBgS860523nMr8", topics:1, superuser:0})


//pwd: bridgepassword
db.users.update({username:"mosq-bridge"},{username:"mosq-bridge", password:"PBKDF2$sha256$901$G3BatbMS88ks2gpx$h2V+ufI7/UM6XjeJMHBSdQGPkdwjdWgh", topics:0, superuser:0},{ upsert: true })


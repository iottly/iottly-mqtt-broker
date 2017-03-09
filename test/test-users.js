res = db.boardsMqttTopics.insertOne({topics:["/iottly/management/project1/device01/commands", "/iottly/management/project1/device01/events"]})
//pwd: devicepassword
db.boardsMqttAuth.insert({username:"device01", password:"PBKDF2$sha256$901$vsmD1hzGz6Eq40FP$yn7B8BQVgadfNyWxzvJBgS860523nMr8", topics:res.insertedId, superuser:0})


res =  db.boardsMqttTopics.insertOne({topics:["/iottly/management/+/+/commands"]})
//pwd: bridgepassword
db.boardsMqttAuth.update({username:"mosq-bridge"},{username:"mosq-bridge", password:"PBKDF2$sha256$901$G3BatbMS88ks2gpx$h2V+ufI7/UM6XjeJMHBSdQGPkdwjdWgh", topics:res.insertedId, superuser:0},{ upsert: true })

res =  db.boardsMqttTopics.insertOne({topics:["/iottly/management/+/+/events"]})
//pwd: bridgepassword
db.boardsMqttAuth.update({username:"posthttp"},{username:"posthttp", password:"", topics:res.insertedId, superuser:0},{ upsert: true })

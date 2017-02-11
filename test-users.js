db.users.insert({username:"device01", password:"PBKDF2$sha256$901$rn5WQ3nJ7Rx6GtDB$pggfXK0HZcV5hgb6EKBNltLlypMdH99U", topics:1, superuser:0})
db.users.insert({username:"iottlycore", password:"PBKDF2$sha256$901$rn5WQ3nJ7Rx6GtDB$pggfXK0HZcV5hgb6EKBNltLlypMdH99U", topics:1, superuser:0})

db.users.update({username:"mosq-node"},{username:"mosq-node", password:"PBKDF2$sha256$901$rn5WQ3nJ7Rx6GtDB$pggfXK0HZcV5hgb6EKBNltLlypMdH99U", topics:0, superuser:0},{ upsert: true })

db.users.insert({username:"local-mosq-node-01", password:"PBKDF2$sha256$901$rn5WQ3nJ7Rx6GtDB$pggfXK0HZcV5hgb6EKBNltLlypMdH99U", topics:1, superuser:0})
db.topics.update({username:"local-mosq-node-01"},{username:"local-mosq-node-01", password:"PBKDF2$sha256$901$rn5WQ3nJ7Rx6GtDB$pggfXK0HZcV5hgb6EKBNltLlypMdH99U", topics:0, superuser:0},{ upsert: true })




db.topics.insert({_id:1, topics:["publish_tpc", "subscription_tpc"]})

db.topics.update({_id:1, topics:["publish_tpc", "subscription_tpc"]},{ upsert: true })



db.topics.update({_id:1, topics:["/iottly/project1/device01/commands", "/iottly/project1/device01/events"]},{ upsert: true })

db.topics.insert({_id:1, topics:["/iottly/project1/device01/commands", "/iottly/project1/device01/events"]})

db.topics.insert({_id:0, topics:["/iottly/+/+/commands"]})
db.users.insert({username:"device01", password:"PBKDF2$sha256$901$rn5WQ3nJ7Rx6GtDB$pggfXK0HZcV5hgb6EKBNltLlypMdH99U", topics:1, superuser:0})
db.users.insert({username:"iottlycore", password:"PBKDF2$sha256$901$rn5WQ3nJ7Rx6GtDB$pggfXK0HZcV5hgb6EKBNltLlypMdH99U", topics:1, superuser:0})

db.topics.insert({_id:1, topics:["testtopic"]})

db.topics.update({_id:1},{topics:["altratopic"]},{ upsert: true })
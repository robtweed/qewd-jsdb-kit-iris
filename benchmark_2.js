var qewd_mg_dbx = require('qewd-mg-dbx');
var DocumentStore = require('ewd-document-store');

var mglobal = require('mg-dbx').mglobal;

var params = {
    database: {
      type: 'IRIS',
      path: '/usr/irissys/mgr',
      username: '_SYSTEM',
      password: 'secret',
      namespace: 'USER'
    }
};

var db = new qewd_mg_dbx(params);
var status = db.open();
if (status.error) return status;
  

var documentStore = new DocumentStore(db);
documentStore.close = db.close.bind(db);

console.log("\n\nVersion (mg-dbx-bdb.node): " + db.version());

var max = 500000;
var global = new mglobal(db.dbx, 'cm');
var d1 = new Date();
var d1_ms = d1.getTime()
console.log("d1: " + d1.toISOString());
var n = 0;
var value;
for (n = 1; n <= max; n ++) {
   value = global.get(n);
   //console.log(n + " = " + value);
}

var d2 = new Date();
var d2_ms = d2.getTime();
var diff = Math.abs(d1_ms - d2_ms)
console.log("d2: " + d2.toISOString());
console.log("records: " + max + " diff: " + diff + " secs: " + (diff / 1000));
db.close();
console.log("*** the end ***\n");
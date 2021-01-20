// Example script loading an XML file

var jsdb = require('./jsdb_shell');
var doc = jsdb.use('exampleDom');
doc.enable_dom();
doc.delete();
var filepath = '/home/irisowner/qewd-jsdb/example.xml';
doc.dom.parser.parseFile(filepath, function(dom) {
  console.log(dom.output(2));
});

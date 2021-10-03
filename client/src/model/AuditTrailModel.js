const uuidv4 = require('uuid/v4');

export default class AuditTrailModel {

	id;
	date;
	data;
	path;
	username;
	method;
	resource;

	constructor(date,data,path,username,method,resource) {
		this.id = uuidv4();
		this.date = date;
		this.data = data;
		this.path = path;
		this.username = username;
		this.method = method;
		this.resource = resource ;

	}

	getId(){
	return this.id ;
	}
}

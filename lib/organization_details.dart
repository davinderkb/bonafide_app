
class OrganizationDetails{
  String _companyName, _companyId, _employees,_projects, _clients;


  OrganizationDetails(this._companyName, this._companyId, this._employees, this._projects, this._clients);


  String get companyName => _companyName;

  factory OrganizationDetails.fromJson(dynamic json) {
    return OrganizationDetails(json['company'] as String, json['id'] as String, json['employee'] as String, json['project'] as String, json['client'] as String);
  }

  get companyId => _companyId;

  get employees => _employees;

  get projects => _projects;

  get clients => _clients;


}
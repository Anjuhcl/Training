using { incident.mgmt.db as db } from '../db/schema';


service AdminService {
    @readonly
    entity Incidents as projection on db.Incidents{
        *
    } action IncidentReview(customerID: String) returns String;
    entity Customers as projection on db.Customers;
    action getIncident();
}

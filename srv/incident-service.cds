using {incident.mgmt.db as db} from '../db/schema';


service IncidentsService {


    @odata.draft.enabled
    entity Incidents as projection on db.Incidents{
        *
    }actions {

        function getCurrentStatus() returns String;
        action ChangeUrgencytoHigh() returns String;
    };

    @readonly
    entity Customers as projection on db.Customers;
}

extend projection IncidentsService.Customers with {
    firstName || ' ' || lastName as name : String
};

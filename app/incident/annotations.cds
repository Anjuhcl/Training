using IncidentsService as service from '../../srv/incident-service';
using from '../../db/schema';

annotate service.Incidents with @(
    UI.SelectionFields            : [customer_ID],
    UI.FieldGroup #GeneratedGroup : {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: 'customer_ID ',
                Value: customer_ID,
            },
            {
                $Type: 'UI.DataField',
                Value: title,
            },
            {
                $Type: 'UI.DataField',
                Label: 'urgencyCode',
                Value: urgencyCode,
            },
            {
                $Type: 'UI.DataField',
                Label: 'urgency_code',
                Value: urgency_code,
            },
            {
                $Type: 'UI.DataField',
                Label: 'status_code',
                Value: status_code,
            },
        ],
    },
    UI.FieldGroup #GeneratedGroup1: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: 'customer_ID',
                Value: customer_ID,
            },
            {
                $Type: 'UI.DataField',
                Value: title,
            },
            {
                $Type: 'UI.DataField',
                Label: 'urgencyCode',
                Value: urgencyCode,
            },
            {
                $Type: 'UI.DataField',
                Label: 'urgency_code',
                Value: urgency_code,
            },
            {
                $Type: 'UI.DataField',
                Label: 'status_code',
                Value: status_code,
            },
        ],
    },
    UI.FieldGroup #HeaderGroup1   : {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: 'Created By',
                Value: createdBy,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Created At',
                Value: createdAt,
            },
        // {
        //     $Type: 'UI.DataField',
        //     Label: 'customer',
        //     Value: customer,
        // },
        // {
        //     $Type: 'UI.DataField',
        //     Value: title,
        // },
        // {
        //     $Type: 'UI.DataField',
        //     Label: 'urgencyCode',
        //     Value: urgencyCode,
        // },
        // {
        //     $Type: 'UI.DataField',
        //     Label: 'urgency_code',
        //     Value: urgency_code,
        // },
        // {
        //     $Type: 'UI.DataField',
        //     Label: 'status_code',
        //     Value: status_code,
        // },
        ],
    },
    UI.Facets                     : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'GeneratedFacet1',
            Label : 'General Information',
            Target: '@UI.FieldGroup#GeneratedGroup',
        },
        // {
        //     $Type : 'UI.ReferenceFacet',
        //     ID    : 'GeneratedFacet2',
        //     Label : 'Customer Detail',
        //     Target: '@UI.FieldGroup#GeneratedGroup1',
        // },
        // {
        //     $Type : 'UI.CollectionFacet',
        //     Label : '{i18n>Overview}',
        //     ID : 'i18nOverview',
        //     Facets : [
        //         {
        //             $Type : 'UI.ReferenceFacet',
        //             Label : '{i18n>Details}',
        //             ID : 'Details',
        //             Target : '@UI.FieldGroup#Details',
        //         },],
        // },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Conversation',
            ID    : 'Conversation',
            Target: 'conversation/@UI.LineItem#Conversation',
        }
    ],
    UI.LineItem                   : [
        {
            $Type : 'UI.DataFieldForAction',
            Action: 'IncidentsService.ChangeUrgencytoHigh',
            Label : 'Change urgency to High',
        },
        {
            $Type: 'UI.DataField',
            Label: 'customer_ID',
            Value: customer_ID,
        },
        {
            $Type: 'UI.DataField',
            Value: title,
        },
        {
            $Type: 'UI.DataField',
            Label: 'urgencyCode',
            Value: urgencyCode,
        },
        {
            $Type: 'UI.DataField',
            Label: 'urgency_code',
            Value: urgency_code,
        },
        {
            $Type: 'UI.DataField',
            Label: 'status_code',
            Value: status_code,
        },
    ],
    UI.HeaderInfo                 : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Incident',
        TypeNamePlural: 'Incidents',
        Title         : {Value: 'Incident'},
        Description   : {
            $Type: 'UI.DataField',
            Value: customer.name,
        },
        TypeImageUrl  : 'sap-icon://alert'
    },
    UI.HeaderFacets               : [{
        $Type : 'UI.ReferenceFacet',
        Target: '@UI.FieldGroup#HeaderGroup1',
    }

    ]
);

annotate service.Incidents with {
    // customer @Common.ValueList: {
//     $Type         : 'Common.ValueListType',
//     CollectionPath: 'Customers',
//     Parameters    : [
//         {
//             $Type            : 'Common.ValueListParameterInOut',
//             LocalDataProperty: customer_ID,
//             ValueListProperty: 'ID',
//         },
//             {
//                 $Type            : 'Common.ValueListParameterDisplayOnly',
//                 ValueListProperty: 'firstName',
//             },
//             {
//                 $Type            : 'Common.ValueListParameterDisplayOnly',
//                 ValueListProperty: 'lastName',
//             },
//         {
//             $Type : 'Common.ValueListParameterDisplayOnly',
//             ValueListProperty : 'email',
//         },
//         // {
//         //     $Type : 'Common.ValueListParameterDisplayOnly',
//         //     ValueListProperty : 'phone',
//         // },
//         ],
//     }
};

annotate service.Incidents with @(UI.FieldGroup #Details: {
    $Type: 'UI.FieldGroupType',
    Data : [
        {
            $Type: 'UI.DataField',
            Value: status_code,
            Label: 'status_code',
        },
        {
            $Type: 'UI.DataField',
            Value: urgency_code,
            Label: 'urgency_code',
        },
    ],
});

annotate service.Incidents with {
    status @Common.ValueListWithFixedValues: true
};

annotate service.Status with {
    code @Common.Text: descr
};

annotate service.Incidents with {
    urgency @Common.ValueListWithFixedValues: true
};

annotate service.Urgency with {
    code @Common.Text: descr
};

annotate service.Incidents.conversation with @(UI.LineItem #Conversation: [
    {
        $Type: 'UI.DataField',
        Value: message,
        Label: '{i18n>Message}',
    },
    {
        $Type: 'UI.DataField',
        Value: author,
    },
    {
        $Type: 'UI.DataField',
        Value: timestamp,
    },
]);

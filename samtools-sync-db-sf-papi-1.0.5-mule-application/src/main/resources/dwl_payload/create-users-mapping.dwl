%dw 2.0
output application/json
---
{
    "userID": payload.MemberId__c,
    "firstName": payload.FirstName__c,
    "lastName": payload.LastName__c,
    "dateOfBirth": payload.DateOfBirth__c,
    "email": payload.Email__c,
    "phoneNumber": payload.PhoneNumber__c
}
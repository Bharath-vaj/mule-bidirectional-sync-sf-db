%dw 2.0
output application/json
---
{
    "accountID": payload.AccountID__c,
    "userID": payload.MemberID__c,
    "accountType": payload.AccountType__c,
    "balance": payload.Balance__c
}
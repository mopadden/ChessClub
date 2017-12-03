// exempt the membership player if gender is exempt from fee on the subscription year
// calculate the appropriate fee factor according to the gender exemption and the membership starting date

trigger MembershipEntryTrigger on Membership__c (before insert, before update) {
 for(Membership__c m: Trigger.new){
 // always gives 0 ...
 // m.Gender_Fee_Factor__c = m.Subscription__r.Subscription_Year__r.Exempt_Gender__c == m.Player__r.Gender__c ? 0:1 ;   
 // try hard-coded.
 // always gives 1 ...
  for(Year__c y: [SELECT ID, Exempt_Gender__c,Second_Semester_Start_Date__c FROM Year__c
                  WHERE ID IN (SELECT Subscription_Year__c FROM Subscription__c WHERE Subscription__c.ID = :m.Subscription__c)
                  ])
  {
    for(Player__c p: [SELECT ID, Gender__c FROM Player__c WHERE ID = :m.Player__c])
    {
       m.Fee_Exempt__c = p.Gender__c == y.Exempt_Gender__c;     
       m.Fee_Factor__c = m.Fee_Exempt__c?0:m.Start_Date__c>=y.Second_Semester_Start_Date__c?0.5:1;
    }
  }
 }
}
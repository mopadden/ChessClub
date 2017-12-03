<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Fee_Exempt</fullName>
        <field>Fee_Exempt__c</field>
        <literalValue>1</literalValue>
        <name>Fee Exempt</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Fee_Liable</fullName>
        <field>Fee_Exempt__c</field>
        <literalValue>0</literalValue>
        <name>Fee Liable</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Gender_Fee_Factor</fullName>
        <field>Fee_Factor__c</field>
        <formula>IF(ISPICKVAL( Player__r.Gender__c, &quot;Female&quot; ),0,1)</formula>
        <name>Gender Fee Factor</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Membership_Expiry_Date</fullName>
        <field>Expiry_Date__c</field>
        <formula>Subscription__r.Subscription_Year__r.Next_Start_Date__c</formula>
        <name>Membership Expiry Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Year_Membership_Player</fullName>
        <field>Year_Player_Membership__c</field>
        <formula>Subscription__r.Subscription_Year__c  + Player__c</formula>
        <name>Year Membership Player</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Add Membership</fullName>
        <actions>
            <name>Membership_Expiry_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Year_Membership_Player</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>True</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Fee Exempt Membership</fullName>
        <actions>
            <name>Fee_Exempt</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>OR(
AND( ISPICKVAL(Subscription__r.Subscription_Year__r.Exempt_Gender__c, &quot;Female&quot; ), ISPICKVAL( Player__r.Gender__c, &quot;Female&quot; )
),
AND(
ISPICKVAL(Subscription__r.Subscription_Year__r.Exempt_Gender__c, &quot;Male&quot; ), 
ISPICKVAL( Player__r.Gender__c, &quot;Male&quot; )
)
)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Fee Liable Membership</fullName>
        <actions>
            <name>Fee_Liable</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>OR(
AND( ISPICKVAL(Subscription__r.Subscription_Year__r.Exempt_Gender__c, &quot;Female&quot; ), NOT(ISPICKVAL( Player__r.Gender__c, &quot;Female&quot; ))
),
AND(
ISPICKVAL(Subscription__r.Subscription_Year__r.Exempt_Gender__c, &quot;Male&quot; ), 
NOT(ISPICKVAL( Player__r.Gender__c, &quot;Male&quot; ))
)
)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>

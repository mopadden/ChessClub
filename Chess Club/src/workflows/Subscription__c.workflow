<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Subscription_Expiry_Date</fullName>
        <field>Expiry_Date__c</field>
        <formula>Subscription_Year__r.Next_Start_Date__c</formula>
        <name>Subscription Expiry Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Year_Subscriber</fullName>
        <field>Subscriber_Year__c</field>
        <formula>Subscription_Year__c + Subscriber__c</formula>
        <name>Year Subscriber</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Subscription Entry</fullName>
        <actions>
            <name>Subscription_Expiry_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Year_Subscriber</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>True</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>

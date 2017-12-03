<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Unique_Meeting_Supervisor</fullName>
        <field>Meeting_Supervisor__c</field>
        <formula>Meeting__c + Supervisor__c</formula>
        <name>Unique Meeting Supervisor</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Supervision Entry</fullName>
        <actions>
            <name>Unique_Meeting_Supervisor</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>True</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>

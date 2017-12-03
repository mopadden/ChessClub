<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>UniqueNextYearStartDate</fullName>
        <field>Next_Starting_Date__c</field>
        <formula>TEXT( Next_Start_Date__c )</formula>
        <name>Unique Next Year Start Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Unique_Year_Start_Date</fullName>
        <field>Starting_Date__c</field>
        <formula>TEXT( Start_Date__c )</formula>
        <name>Unique Year Start Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Year Entry</fullName>
        <actions>
            <name>UniqueNextYearStartDate</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Unique_Year_Start_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>True</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>

/**
 * @description       : 
 * @author            : Shubhranshu Panda
 * @group             : 
 * @last modified on  : 09-28-2023
 * @last modified by  : Shubhranshu Panda
**/
public with sharing class changeDataCaptureController {
    // public changeDataCaptureController() {

    // }

    @AuraEnabled
    public static void AssignTask(String recordid){
        try {
            Job_Application__c opp = [SELECT OwnerId from Job_Application__c Where Id=:recordid WITH SECURITY_ENFORCED];
            Task tsk = new Task();
            tsk.OwnerId = opp.OwnerId;
            tsk.WhatId = recordid;
            tsk.Subject = 'Offer letter sent';
            tsk.Status = 'Not Started';
            tsk.Priority = 'High';
            if(Schema.SObjectType.Task.isCreateable()){
                insert tsk;
            }
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
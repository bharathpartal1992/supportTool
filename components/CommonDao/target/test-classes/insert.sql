INSERT INTO ORSS_MESSAGE_DETAILS (KEY, KEYTYPE, PROTOCOL_MESSAGEID, CONVERSATION_ID, NIMS_ID, ESTIMATE_NUMBER, CONTRACT_NUMBER, SUPPLIER_ID, MESSAGE_CODE, NIMS_SLIP_NUMBER, SUPPLIER_REF_NUMBER, DIRECTION, MESSAGE_TIMESTAMP, RECEIPT_TIMESTAMP, STATUS, EXCEPTIONMESSAGE, PAYLOAD, RESUBMITTED_DATETIME, SENDER_MESSAGEID, RECEIVER_MESSAGEID) VALUES ('key1', 'BusinessMessage', 'E537', 'convId1', 'dummynims1', 'TESD44D35', '65583889', 'TEST', 'DCR_REQUEST', 'nsn1', '760', 'Outbound', TO_TIMESTAMP('2016-05-03 10:22:08.350000000', 'YYYY-MM-DD HH24:MI:SS.FF'), TO_TIMESTAMP('2016-05-04 10:22:12.874000000', 'YYYY-MM-DD HH24:MI:SS.FF'), 'Manual_Resubmission', 'expMess', '<?xml version="1.0" encoding="UTF-8"?>
<e537>
  <b2bHeader>
    <fromDUNS>TEST</fromDUNS>
    <toDUNS>NIMS-RoBT</toDUNS>
    <senderMessageID>mars_rs09123</senderMessageID>
    <receiverMessageID>mars_rq09123</receiverMessageID>
    <processID>e537DCRRequest</processID>
  </b2bHeader>
  <b2bBody>
    <mE537RequestNims>
      <requestHeader>
        <messageCode>DCR_REQUEST</messageCode>
        <supplier>PABSSC</supplier>
        <contractNumber>65583889</contractNumber>
        <estimateNumber>TESD44D35</estimateNumber>
        <supplierReferenceNumber>760</supplierReferenceNumber>
        <responseReasonCode>B</responseReasonCode>
        <responseReason>dcr 2 rollback test</responseReason>
        <authorisedCost>108.46</authorisedCost>
        <responseGenerationDate>2011-08-12T12:57:58</responseGenerationDate>
        <proposedAgreedRequiredByDate>2011-09-01T12:57:58</proposedAgreedRequiredByDate>
        <numberOfItems>1</numberOfItems>
      </requestHeader></mE537RequestNims></b2bBody>
</e537>', TO_TIMESTAMP('2016-05-05 10:22:57.210000000', 'YYYY-MM-DD HH24:MI:SS.FF'), 'mars_rs09123', 'mars_rq09123');

TRUNCATE risk_events;
INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-01 13:29:28.688',
  '0ff38bbb7d6e1123_1577885366686',
  '3b30d7eb-c280-4f07-9a6d-aa88a559b5b6',
  '+10542468601',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"3b30d7eb-c280-4f07-9a6d-aa88a559b5b6","sessionId":"0ff38bbb7d6e1123_1577885366686","userId":"+10542468601","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"+10542468601","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-01 13:29:36.897',
  '0ff38bbb7d6e1123_1577885375043',
  'd532229d-5bad-4440-b2e7-d77bb17ebef5',
  '+10542468601',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"d532229d-5bad-4440-b2e7-d77bb17ebef5","sessionId":"0ff38bbb7d6e1123_1577885375043","userId":"+10542468601","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"+10542468601","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-01 13:29:38.925',
  '0ff38bbb7d6e1123_1577885375043',
  '5c1965c3-4f30-4167-8275-f3b1c200e2d6',
  '+10542468601',
  'GENERAL',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"5c1965c3-4f30-4167-8275-f3b1c200e2d6","sessionId":"0ff38bbb7d6e1123_1577885375043","userId":"+10542468601","checkPointType":"GENERAL"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-01 13:29:40.823',
  '0ff38bbb7d6e1123_1577885375043',
  '2ad99676-253a-447a-8cd2-12d5da898f7d',
  '+10542468601',
  'TRANSACTION',
  87.5,
  'USD',
  'XPORTALStore',
  NULL,
  CAST('{"score":0,"amount":87.5,"riskLevel":"LOW","requestId":"2ad99676-253a-447a-8cd2-12d5da898f7d","sessionId":"0ff38bbb7d6e1123_1577885375043","destinationId":"XPORTALStore","userId":"+10542468601","currencyCode":"USD","user":{"phoneUser":"05424445877","isPhoneVerified":"VERIFIED","address":{},"email":"best_test@gmail.com","isEmailVerified":"VERIFIED"},"checkPointType":"TRANSACTION","transaction":{"transactionType":"PURCHASE","amount":87.5,"time_stamp":1577885380751,"curType":"USD","shippingAddress":{"firstName":"Ama","lastName":"Joke","country":"IL","phoneNumber":"055555555","city":"Ramat Gan","postalCode":"52573","addressLine1":"David Ben Gurion Rd 10","addressLine2":"","state":"Israel"},"authorizationResponse":{"verificationStatus":"verificationStatus","aVSResultCode":"aVSResultCod","acquirerResponseCode":"acquirerResponseCode","acquirerResponseMessage":"acquirerResponseMessage","declineReasonMessage":"declineReasonMessage","threeDSResponseStatus":"threeDSResponseStatus","declineReasonCode":"declineReasonCode","threeDSResponseECI":"threeDSResponseECI","threeDSResponseEnrolled":"threeDSResponseEnrolled"},"payment":{"bankAccountDetails":{"bsb":"bsb","number":"number","fullName":"fullname"},"paymentMethodId":"1000CardId","fullNameOnCard":"Ama Joke","paymentMethodType":"CREDIT_CARD","processor":"Processor","creditCardDetail":{"lastFourDigit":"6546","bin":"065464","cardId":"1000CardId","cardToken":"ffjhg7i8tkh8hklhf","yearExpiryDate":2021,"monthExpiryDate":5}},"billingAddress":{"firstName":"Ama","lastName":"Joke","country":"IL","phoneNumber":"055555555","city":"Ramat Gan","postalCode":"52573","addressLine1":"David Ben Gurion Rd 10","addressLine2":"","state":"Israel"},"destinationId":"XPORTALStore","type":"TRANSACTION","user":{"phoneUser":"05424445877","isPhoneVerified":"VERIFIED","address":{},"email":"best_test@gmail.com","isEmailVerified":"VERIFIED"}}}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-01 13:29:45.297',
  '0ff38bbb7d6e1123_1577885375043',
  '9848cfb9-be53-4f13-8a46-35a473692c53',
  '+10542468601',
  'ADD_PAYMENT_METHOD',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"9848cfb9-be53-4f13-8a46-35a473692c53","paymentMethod":{"payment":{"bankAccountDetails":{},"paymentMethodId":"1000","fullNameOnCard":"fullNameOnCard","paymentMethodType":"CREDIT_CARD","processor":"processor","creditCardDetail":{"lastFourDigit":"0000","cardId":"1000","cardToken":"CardToken","yearExpiryDate":0,"monthExpiryDate":0}},"billingAddress":{"firstName":"Ama","lastName":"Joke","country":"IL","phoneNumber":"055555555","city":"Ramat Gan","postalCode":"52573","addressLine1":"David Ben Gurion Rd 10","addressLine2":" ","state":"Israel"},"type":"ADD_PAYMENT_METHOD","user":{"phoneUser":"phoneUser","isPhoneVerified":"VERIFIED","address":{},"isEmailVerified":"VERIFIED"}},"sessionId":"0ff38bbb7d6e1123_1577885375043","userId":"+10542468601","user":{"phoneUser":"phoneUser","isPhoneVerified":"VERIFIED","address":{},"isEmailVerified":"VERIFIED"},"checkPointType":"ADD_PAYMENT_METHOD"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-01 13:43:18.334',
  '16737877f105ba30_1577886190246',
  '2b735ba1-adc0-4fc9-a87c-3e12cc7654a0',
  '0542450590-01-01',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"2b735ba1-adc0-4fc9-a87c-3e12cc7654a0","sessionId":"16737877f105ba30_1577886190246","userId":"0542450590-01-01","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"0542450590-01-01","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-01 13:43:54.416',
  '16737877f105ba30_1577886230232',
  'bd295679-3f32-46e3-b447-4789ed50ea57',
  '0542450590-01-01',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"bd295679-3f32-46e3-b447-4789ed50ea57","sessionId":"16737877f105ba30_1577886230232","userId":"0542450590-01-01","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"0542450590-01-01","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-01 13:46:37.028',
  '16737877f105ba30_1577886388108',
  '028dd9bb-793c-433c-a412-eda5c43bc3ff',
  '0542450590-01-01',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"028dd9bb-793c-433c-a412-eda5c43bc3ff","sessionId":"16737877f105ba30_1577886388108","userId":"0542450590-01-01","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"0542450590-01-01","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-01 14:26:05.629',
  '0ff38bbb7d6e1123_1577888762691',
  '51a227ae-4a25-476a-8cd8-a4e12c9ce640',
  '+10542468601',
  'GENERAL',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"51a227ae-4a25-476a-8cd8-a4e12c9ce640","sessionId":"0ff38bbb7d6e1123_1577888762691","userId":"+10542468601","checkPointType":"GENERAL"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-01 14:26:07.761',
  '0ff38bbb7d6e1123_1577888762691',
  'd115ca8e-bf49-4e8f-8f7b-9493c3a2badd',
  '+10542468601',
  'TRANSACTION',
  43.55,
  'USD',
  'XPORTALStore',
  'APPROVED',
  CAST('{"score":0,"amount":43.55,"riskLevel":"LOW","requestId":"d115ca8e-bf49-4e8f-8f7b-9493c3a2badd","sessionId":"0ff38bbb7d6e1123_1577888762691","destinationId":"XPORTALStore","userId":"+10542468601","currencyCode":"USD","user":{"phoneUser":"05424445877","isPhoneVerified":"VERIFIED","address":{},"email":"best_test@gmail.com","isEmailVerified":"VERIFIED"},"checkPointType":"TRANSACTION","transaction":{"transactionType":"PURCHASE","amount":43.55,"time_stamp":1577888767660,"curType":"USD","shippingAddress":{"firstName":"Ama","lastName":"Joke","country":"IL","phoneNumber":"055555555","city":"Ramat Gan","postalCode":"52573","addressLine1":"David Ben Gurion Rd 10","addressLine2":"","state":"Israel"},"authorizationResponse":{"verificationStatus":"verificationStatus","aVSResultCode":"aVSResultCod","acquirerResponseCode":"acquirerResponseCode","acquirerResponseMessage":"acquirerResponseMessage","declineReasonMessage":"declineReasonMessage","threeDSResponseStatus":"threeDSResponseStatus","declineReasonCode":"declineReasonCode","threeDSResponseECI":"threeDSResponseECI","threeDSResponseEnrolled":"threeDSResponseEnrolled"},"payment":{"bankAccountDetails":{"bsb":"bsb","number":"number","fullName":"fullname"},"paymentMethodId":"1000CardId","fullNameOnCard":"Ama Joke","paymentMethodType":"CREDIT_CARD","processor":"Processor","creditCardDetail":{"lastFourDigit":"6546","bin":"065464","cardId":"1000CardId","cardToken":"ffjhg7i8tkh8hklhf","yearExpiryDate":2021,"monthExpiryDate":5}},"billingAddress":{"firstName":"Ama","lastName":"Joke","country":"IL","phoneNumber":"055555555","city":"Ramat Gan","postalCode":"52573","addressLine1":"David Ben Gurion Rd 10","addressLine2":"","state":"Israel"},"destinationId":"XPORTALStore","type":"TRANSACTION","user":{"phoneUser":"05424445877","isPhoneVerified":"VERIFIED","address":{},"email":"best_test@gmail.com","isEmailVerified":"VERIFIED"}}}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-01 14:54:13.417',
  '16737877f105ba30_1577890438587',
  '319a6054-f463-473e-98fb-0bce3aefe807',
  '0542450590-01-01',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"319a6054-f463-473e-98fb-0bce3aefe807","sessionId":"16737877f105ba30_1577890438587","userId":"0542450590-01-01","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"0542450590-01-01","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-01 15:37:24.695',
  '16737877f105ba30_1577893040228',
  '32a1fdb1-7b7f-4f14-9d1d-3f493b7de887',
  '0542450590-01-01',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"32a1fdb1-7b7f-4f14-9d1d-3f493b7de887","sessionId":"16737877f105ba30_1577893040228","userId":"0542450590-01-01","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"0542450590-01-01","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-01 15:42:42.061',
  '16737877f105ba30_1577893356810',
  '0592f9ff-6b53-41c8-94be-df0e178318a5',
  '0542450590-01-01',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"0592f9ff-6b53-41c8-94be-df0e178318a5","sessionId":"16737877f105ba30_1577893356810","userId":"0542450590-01-01","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"0542450590-01-01","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 09:40:41.269',
  '0ff38bbb7d6e1123_1577958038674',
  '335d9914-8ec8-47c2-a1e6-003ba74dd879',
  '+10542468601',
  'GENERAL',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"335d9914-8ec8-47c2-a1e6-003ba74dd879","sessionId":"0ff38bbb7d6e1123_1577958038674","userId":"+10542468601","checkPointType":"GENERAL"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-01 15:43:53.178',
  '16737877f105ba30_1577893430549',
  '0e7fc1eb-47a9-4eb5-8e05-1646f1e0f25e',
  '0542450590-01-01',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"0e7fc1eb-47a9-4eb5-8e05-1646f1e0f25e","sessionId":"16737877f105ba30_1577893430549","userId":"0542450590-01-01","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"0542450590-01-01","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-01 15:45:34.052',
  '16737877f105ba30_1577893530238',
  '183a1885-cb28-4841-8a26-bfb79d1e80f1',
  '0542450590-01-01',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"183a1885-cb28-4841-8a26-bfb79d1e80f1","sessionId":"16737877f105ba30_1577893530238","userId":"0542450590-01-01","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"0542450590-01-01","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-01 15:45:54.124',
  '16737877f105ba30_1577893551908',
  '504fcca7-af30-4c83-800e-f722942fc3fb',
  '0542450590-01-01',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"504fcca7-af30-4c83-800e-f722942fc3fb","sessionId":"16737877f105ba30_1577893551908","userId":"0542450590-01-01","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"0542450590-01-01","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-01 15:46:45.187',
  '16737877f105ba30_1577893601355',
  '1b8572d6-f3ad-484b-8e14-91f0baf22358',
  '0542450590-01-01',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"1b8572d6-f3ad-484b-8e14-91f0baf22358","sessionId":"16737877f105ba30_1577893601355","userId":"0542450590-01-01","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"0542450590-01-01","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-01 15:47:34.048',
  '16737877f105ba30_1577893649467',
  '44597ebd-25cc-4240-9443-89a6f287a470',
  '0542450590-01-01',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"44597ebd-25cc-4240-9443-89a6f287a470","sessionId":"16737877f105ba30_1577893649467","userId":"0542450590-01-01","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"0542450590-01-01","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-01 15:48:56.647',
  '16737877f105ba30_1577893732430',
  '523fa615-e329-4a53-9a9a-48b36100a7fa',
  '0542450590-01-01',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"523fa615-e329-4a53-9a9a-48b36100a7fa","sessionId":"16737877f105ba30_1577893732430","userId":"0542450590-01-01","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"0542450590-01-01","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-01 15:50:46.284',
  '16737877f105ba30_1577893840799',
  '92185aa5-f49c-4169-ab0d-9978e9ae3711',
  '0542450590-01-01',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"92185aa5-f49c-4169-ab0d-9978e9ae3711","sessionId":"16737877f105ba30_1577893840799","userId":"0542450590-01-01","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"0542450590-01-01","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-01 15:52:47.993',
  '16737877f105ba30_1577893963532',
  '0c4d884c-dfdd-4808-973c-395b08f8e19c',
  '0542450590-01-01',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"0c4d884c-dfdd-4808-973c-395b08f8e19c","sessionId":"16737877f105ba30_1577893963532","userId":"0542450590-01-01","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"0542450590-01-01","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 06:32:44.815',
  '16737877f105ba30_1577946760032',
  '1667e1ab-3cd6-44fc-b90e-9bd09d79dd69',
  '0542450590-01-01',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"1667e1ab-3cd6-44fc-b90e-9bd09d79dd69","sessionId":"16737877f105ba30_1577946760032","userId":"0542450590-01-01","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"0542450590-01-01","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 06:36:50.941',
  '16737877f105ba30_1577947006240',
  'dc973228-ac50-4b82-93dd-e1228b7cf23c',
  '0542450590-01-01',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"dc973228-ac50-4b82-93dd-e1228b7cf23c","sessionId":"16737877f105ba30_1577947006240","userId":"0542450590-01-01","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"0542450590-01-01","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 07:04:52.839',
  '16737877f105ba30_1577948680666',
  '75d60a00-3239-4a23-815d-7bf71d54f831',
  '0542450590-01-01',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"75d60a00-3239-4a23-815d-7bf71d54f831","sessionId":"16737877f105ba30_1577948680666","userId":"0542450590-01-01","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"0542450590-01-01","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 08:09:00.483',
  '16737877f105ba30_1577952535674',
  '546f877e-afb2-4b0d-9cf8-a5eaa43bd1d4',
  '0542450590-01-01',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"546f877e-afb2-4b0d-9cf8-a5eaa43bd1d4","sessionId":"16737877f105ba30_1577952535674","userId":"0542450590-01-01","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"0542450590-01-01","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 08:12:47.897',
  '0ff38bbb7d6e1123_1577952765100',
  '9c93e316-5034-4783-93e6-e1229bbd6710',
  '+10542468601',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"9c93e316-5034-4783-93e6-e1229bbd6710","sessionId":"0ff38bbb7d6e1123_1577952765100","userId":"+10542468601","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"+10542468601","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 08:12:59.424',
  '0ff38bbb7d6e1123_1577952765100',
  '8df7ae34-fb40-497c-9d81-c64dca836d92',
  '+10542468601',
  'GENERAL',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"8df7ae34-fb40-497c-9d81-c64dca836d92","sessionId":"0ff38bbb7d6e1123_1577952765100","userId":"+10542468601","checkPointType":"GENERAL"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 09:39:25.751',
  'ad2d0b6b3b583708_1577957963713',
  'dbd2cac7-049d-44d5-a3b1-b986d7503364',
  '020120-1',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"dbd2cac7-049d-44d5-a3b1-b986d7503364","sessionId":"ad2d0b6b3b583708_1577957963713","userId":"020120-1","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"020120-1","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 11:04:07.883',
  '16737877f105ba30_1577963042942',
  'f5690d00-7379-4aae-a9c5-64d9b3cbfbd0',
  '2',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"f5690d00-7379-4aae-a9c5-64d9b3cbfbd0","sessionId":"16737877f105ba30_1577963042942","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 11:08:02.556',
  '16737877f105ba30_1577963120580',
  '13facf53-6bf7-476a-8aab-2a0c36033f41',
  '2',
  'GENERAL',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"13facf53-6bf7-476a-8aab-2a0c36033f41","sessionId":"16737877f105ba30_1577963120580","userId":"2","checkPointType":"GENERAL"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 12:23:33.242',
  '16737877f105ba30_1577967804740',
  '80feae2b-822e-467e-9373-edb7b525c415',
  '2',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"80feae2b-822e-467e-9373-edb7b525c415","sessionId":"16737877f105ba30_1577967804740","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 12:27:45.737',
  '16737877f105ba30_1577968061207',
  'c20027c4-dde6-4717-b576-e67fcd0dd741',
  '2',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"c20027c4-dde6-4717-b576-e67fcd0dd741","sessionId":"16737877f105ba30_1577968061207","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 08:13:03.713',
  '0ff38bbb7d6e1123_1577952765100',
  '85321609-e149-4df5-92b0-f3f60245a13b',
  '+10542468601',
  'TRANSACTION',
  34.15,
  'USD',
  'XPORTALStore',
  'APPROVED',
  CAST('{"score":0,"amount":34.15,"riskLevel":"LOW","requestId":"85321609-e149-4df5-92b0-f3f60245a13b","sessionId":"0ff38bbb7d6e1123_1577952765100","destinationId":"XPORTALStore","userId":"+10542468601","currencyCode":"USD","user":{"phoneUser":"05424445877","isPhoneVerified":"VERIFIED","address":{},"email":"best_test@gmail.com","isEmailVerified":"VERIFIED"},"checkPointType":"TRANSACTION","transaction":{"transactionType":"PURCHASE","amount":34.15,"time_stamp":1577952783607,"curType":"USD","shippingAddress":{"firstName":"Ama","lastName":"Joke","country":"IL","phoneNumber":"055555555","city":"Ramat Gan","postalCode":"52573","addressLine1":"David Ben Gurion Rd 10","addressLine2":"","state":"Israel"},"authorizationResponse":{"verificationStatus":"verificationStatus","aVSResultCode":"aVSResultCod","acquirerResponseCode":"acquirerResponseCode","acquirerResponseMessage":"acquirerResponseMessage","declineReasonMessage":"declineReasonMessage","threeDSResponseStatus":"threeDSResponseStatus","declineReasonCode":"declineReasonCode","threeDSResponseECI":"threeDSResponseECI","threeDSResponseEnrolled":"threeDSResponseEnrolled"},"payment":{"bankAccountDetails":{"bsb":"bsb","number":"number","fullName":"fullname"},"paymentMethodId":"1000CardId","fullNameOnCard":"Ama Joke","paymentMethodType":"CREDIT_CARD","processor":"Processor","creditCardDetail":{"lastFourDigit":"6546","bin":"065464","cardId":"1000CardId","cardToken":"ffjhg7i8tkh8hklhf","yearExpiryDate":2021,"monthExpiryDate":5}},"billingAddress":{"firstName":"Ama","lastName":"Joke","country":"IL","phoneNumber":"055555555","city":"Ramat Gan","postalCode":"52573","addressLine1":"David Ben Gurion Rd 10","addressLine2":"","state":"Israel"},"destinationId":"XPORTALStore","type":"TRANSACTION","user":{"phoneUser":"05424445877","isPhoneVerified":"VERIFIED","address":{},"email":"best_test@gmail.com","isEmailVerified":"VERIFIED"}}}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 08:28:14.215',
  '16737877f105ba30_1577953680387',
  'bf37fff2-954a-446c-a47f-035d57c2ea9e',
  '0542450590-01-01',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"bf37fff2-954a-446c-a47f-035d57c2ea9e","sessionId":"16737877f105ba30_1577953680387","userId":"0542450590-01-01","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"0542450590-01-01","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 08:42:13.753',
  '16737877f105ba30_1577954528835',
  '3a340494-3027-45e6-8c2f-0acd9160d9dd',
  '0542450590-01-01',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"3a340494-3027-45e6-8c2f-0acd9160d9dd","sessionId":"16737877f105ba30_1577954528835","userId":"0542450590-01-01","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"0542450590-01-01","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 08:44:49.198',
  '16737877f105ba30_1577954681744',
  '213860d8-c40c-4d0d-b3d7-8de31b1e7609',
  '0542450590-01-01',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"213860d8-c40c-4d0d-b3d7-8de31b1e7609","sessionId":"16737877f105ba30_1577954681744","userId":"0542450590-01-01","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"0542450590-01-01","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 08:45:41.723',
  '16737877f105ba30_1577954736669',
  '05594951-979b-48c9-bfb8-3edd242991ff',
  '0542450590-01-01',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"05594951-979b-48c9-bfb8-3edd242991ff","sessionId":"16737877f105ba30_1577954736669","userId":"0542450590-01-01","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"0542450590-01-01","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 08:47:29.831',
  '16737877f105ba30_1577954840900',
  '5e5da2ea-0105-4537-9402-8a6acc26a1d3',
  '0542450590-01-01',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"5e5da2ea-0105-4537-9402-8a6acc26a1d3","sessionId":"16737877f105ba30_1577954840900","userId":"0542450590-01-01","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"0542450590-01-01","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 08:49:11.012',
  '16737877f105ba30_1577954945944',
  '59bbb8a1-433d-4f42-948a-4fca0bb5913c',
  '0542450590-01-01',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"59bbb8a1-433d-4f42-948a-4fca0bb5913c","sessionId":"16737877f105ba30_1577954945944","userId":"0542450590-01-01","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"0542450590-01-01","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 08:50:34.748',
  '16737877f105ba30_1577955028658',
  '58b5c07d-933a-484b-9fa7-01c51dff98cd',
  '0542450590-01-01',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"58b5c07d-933a-484b-9fa7-01c51dff98cd","sessionId":"16737877f105ba30_1577955028658","userId":"0542450590-01-01","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"0542450590-01-01","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 09:01:46.874',
  '16737877f105ba30_1577955699874',
  '67a7b970-88a8-4783-b6c4-e3c7d613a76e',
  '0542450590-01-01',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"67a7b970-88a8-4783-b6c4-e3c7d613a76e","sessionId":"16737877f105ba30_1577955699874","userId":"0542450590-01-01","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"0542450590-01-01","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 09:02:45.216',
  '16737877f105ba30_1577955759135',
  'dae6dcd5-9fc6-4408-8eac-c4b77e6f3bea',
  '0542450590-01-01',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"dae6dcd5-9fc6-4408-8eac-c4b77e6f3bea","sessionId":"16737877f105ba30_1577955759135","userId":"0542450590-01-01","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"0542450590-01-01","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 09:03:49.048',
  '16737877f105ba30_1577955823244',
  'b289a54f-246d-4e6c-b7a3-1d189d02ef3b',
  '0542450590-01-01',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"b289a54f-246d-4e6c-b7a3-1d189d02ef3b","sessionId":"16737877f105ba30_1577955823244","userId":"0542450590-01-01","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"0542450590-01-01","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 09:04:47.621',
  '16737877f105ba30_1577955882557',
  'bba9fee3-d6eb-4f6c-8335-297f9e21825f',
  '0542450590-01-01',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"bba9fee3-d6eb-4f6c-8335-297f9e21825f","sessionId":"16737877f105ba30_1577955882557","userId":"0542450590-01-01","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"0542450590-01-01","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 09:06:12.639',
  '16737877f105ba30_1577955966896',
  '468a972b-6cbb-4bca-b492-dad1e124f565',
  '0542450590-01-01',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"468a972b-6cbb-4bca-b492-dad1e124f565","sessionId":"16737877f105ba30_1577955966896","userId":"0542450590-01-01","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"0542450590-01-01","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 09:13:10.796',
  '16737877f105ba30_1577956385649',
  '5620649a-ab71-4ca9-81db-9dcd11e8ad12',
  '0542450590-01-01',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"5620649a-ab71-4ca9-81db-9dcd11e8ad12","sessionId":"16737877f105ba30_1577956385649","userId":"0542450590-01-01","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"0542450590-01-01","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 09:28:48.165',
  '16737877f105ba30_1577957322035',
  'd6abeb84-35fb-4e51-9242-f85b85920e97',
  '0542450590-01-01',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"d6abeb84-35fb-4e51-9242-f85b85920e97","sessionId":"16737877f105ba30_1577957322035","userId":"0542450590-01-01","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"0542450590-01-01","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 09:33:54.070',
  '16737877f105ba30_1577957626958',
  'b1f02730-bc58-478d-a225-6b839b6941b7',
  '0542450590-01-01',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"b1f02730-bc58-478d-a225-6b839b6941b7","sessionId":"16737877f105ba30_1577957626958","userId":"0542450590-01-01","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"0542450590-01-01","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 09:40:44.122',
  '0ff38bbb7d6e1123_1577958038674',
  '5ba524df-566e-4302-a7c6-4545cfc75654',
  '+10542468601',
  'TRANSACTION',
  35.55,
  'USD',
  'XPORTALStore',
  'APPROVED',
  CAST('{"score":0,"amount":35.55,"riskLevel":"LOW","requestId":"5ba524df-566e-4302-a7c6-4545cfc75654","sessionId":"0ff38bbb7d6e1123_1577958038674","destinationId":"XPORTALStore","userId":"+10542468601","currencyCode":"USD","user":{"phoneUser":"05424445877","isPhoneVerified":"VERIFIED","address":{},"email":"best_test@gmail.com","isEmailVerified":"VERIFIED"},"checkPointType":"TRANSACTION","transaction":{"transactionType":"PURCHASE","amount":35.55,"time_stamp":1577958044028,"curType":"USD","shippingAddress":{"firstName":"Ama","lastName":"Joke","country":"IL","phoneNumber":"055555555","city":"Ramat Gan","postalCode":"52573","addressLine1":"David Ben Gurion Rd 10","addressLine2":"","state":"Israel"},"authorizationResponse":{"verificationStatus":"verificationStatus","aVSResultCode":"aVSResultCod","acquirerResponseCode":"acquirerResponseCode","acquirerResponseMessage":"acquirerResponseMessage","declineReasonMessage":"declineReasonMessage","threeDSResponseStatus":"threeDSResponseStatus","declineReasonCode":"declineReasonCode","threeDSResponseECI":"threeDSResponseECI","threeDSResponseEnrolled":"threeDSResponseEnrolled"},"payment":{"bankAccountDetails":{"bsb":"bsb","number":"number","fullName":"fullname"},"paymentMethodId":"1000CardId","fullNameOnCard":"Ama Joke","paymentMethodType":"CREDIT_CARD","processor":"Processor","creditCardDetail":{"lastFourDigit":"6546","bin":"065464","cardId":"1000CardId","cardToken":"ffjhg7i8tkh8hklhf","yearExpiryDate":2021,"monthExpiryDate":5}},"billingAddress":{"firstName":"Ama","lastName":"Joke","country":"IL","phoneNumber":"055555555","city":"Ramat Gan","postalCode":"52573","addressLine1":"David Ben Gurion Rd 10","addressLine2":"","state":"Israel"},"destinationId":"XPORTALStore","type":"TRANSACTION","user":{"phoneUser":"05424445877","isPhoneVerified":"VERIFIED","address":{},"email":"best_test@gmail.com","isEmailVerified":"VERIFIED"}}}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 09:41:06.950',
  '0ff38bbb7d6e1123_1577958064440',
  '386b17cd-b887-4a02-a6a7-1de62fa48cef',
  '7777',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"386b17cd-b887-4a02-a6a7-1de62fa48cef","sessionId":"0ff38bbb7d6e1123_1577958064440","userId":"7777","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"7777","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 09:42:51.784',
  'ad2d0b6b3b583708_1577957963713',
  '97e8ce95-1f8f-4078-a4f7-46d1b3f1e546',
  '020120-1',
  'ADD_PAYMENT_METHOD',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"97e8ce95-1f8f-4078-a4f7-46d1b3f1e546","paymentMethod":{"payment":{"bankAccountDetails":{},"paymentMethodId":"1000","fullNameOnCard":"fullNameOnCard","paymentMethodType":"CREDIT_CARD","processor":"processor","creditCardDetail":{"lastFourDigit":"0000","cardId":"1000","cardToken":"CardToken","yearExpiryDate":0,"monthExpiryDate":0}},"billingAddress":{"firstName":"Ama","lastName":"Joke","country":"IL","phoneNumber":"055555555","city":"Ramat Gan","postalCode":"52573","addressLine1":"David Ben Gurion Rd 10","addressLine2":" ","state":"Israel"},"type":"ADD_PAYMENT_METHOD","user":{"phoneUser":"phoneUser","isPhoneVerified":"VERIFIED","address":{},"isEmailVerified":"VERIFIED"}},"sessionId":"ad2d0b6b3b583708_1577957963713","userId":"020120-1","user":{"phoneUser":"phoneUser","isPhoneVerified":"VERIFIED","address":{},"isEmailVerified":"VERIFIED"},"checkPointType":"ADD_PAYMENT_METHOD"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 09:42:59.517',
  'ad2d0b6b3b583708_1577957963713',
  'dd276bbe-32be-45d7-96ce-0dc0eb11f9e5',
  '020120-1',
  'GENERAL',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"dd276bbe-32be-45d7-96ce-0dc0eb11f9e5","sessionId":"ad2d0b6b3b583708_1577957963713","userId":"020120-1","checkPointType":"GENERAL"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  1.0,
  '2020-01-02 09:43:03.539',
  'ad2d0b6b3b583708_1577957963713',
  '4e5d9c5d-a65e-4e5e-ae56-80d96bb9cfbe',
  '020120-1',
  'TRANSACTION',
  55.55,
  'USD',
  'XPORTALStore',
  'APPROVED',
  CAST('{"score":1,"amount":55.55,"riskLevel":"LOW","requestId":"4e5d9c5d-a65e-4e5e-ae56-80d96bb9cfbe","sessionId":"ad2d0b6b3b583708_1577957963713","destinationId":"XPORTALStore","userId":"020120-1","currencyCode":"USD","user":{"phoneUser":"05424445877","isPhoneVerified":"VERIFIED","address":{},"email":"best_test@gmail.com","isEmailVerified":"VERIFIED"},"checkPointType":"TRANSACTION","transaction":{"transactionType":"PURCHASE","amount":55.55,"time_stamp":1577958183477,"curType":"USD","shippingAddress":{"firstName":"Ama","lastName":"Joke","country":"IL","phoneNumber":"055555555","city":"Ramat Gan","postalCode":"52573","addressLine1":"David Ben Gurion Rd 10","addressLine2":"","state":"Israel"},"authorizationResponse":{"verificationStatus":"verificationStatus","aVSResultCode":"aVSResultCod","acquirerResponseCode":"acquirerResponseCode","acquirerResponseMessage":"acquirerResponseMessage","declineReasonMessage":"declineReasonMessage","threeDSResponseStatus":"threeDSResponseStatus","declineReasonCode":"declineReasonCode","threeDSResponseECI":"threeDSResponseECI","threeDSResponseEnrolled":"threeDSResponseEnrolled"},"payment":{"bankAccountDetails":{"bsb":"bsb","number":"number","fullName":"fullname"},"paymentMethodId":"1000CardId","fullNameOnCard":"Ama Joke","paymentMethodType":"CREDIT_CARD","processor":"Processor","creditCardDetail":{"lastFourDigit":"6546","bin":"065464","cardId":"1000CardId","cardToken":"ffjhg7i8tkh8hklhf","yearExpiryDate":2021,"monthExpiryDate":5}},"billingAddress":{"firstName":"Ama","lastName":"Joke","country":"IL","phoneNumber":"055555555","city":"Ramat Gan","postalCode":"52573","addressLine1":"David Ben Gurion Rd 10","addressLine2":"","state":"Israel"},"destinationId":"XPORTALStore","type":"TRANSACTION","user":{"phoneUser":"05424445877","isPhoneVerified":"VERIFIED","address":{},"email":"best_test@gmail.com","isEmailVerified":"VERIFIED"}}}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 09:56:21.056',
  'ad2d0b6b3b583708_1577958977507',
  'aacb6c7e-a7bf-4e39-82dc-22f0eec451b1',
  '020120-1',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"aacb6c7e-a7bf-4e39-82dc-22f0eec451b1","sessionId":"ad2d0b6b3b583708_1577958977507","userId":"020120-1","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"020120-1","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 09:56:51.272',
  'ad2d0b6b3b583708_1577958977507',
  'e3ec14c4-afc0-431d-8263-2c52ed9fb68d',
  '020120-1',
  'GENERAL',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"e3ec14c4-afc0-431d-8263-2c52ed9fb68d","sessionId":"ad2d0b6b3b583708_1577958977507","userId":"020120-1","checkPointType":"GENERAL"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 11:05:24.625',
  '16737877f105ba30_1577963120580',
  '693b8111-def9-48c9-9fed-609a3e080be4',
  '2',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"693b8111-def9-48c9-9fed-609a3e080be4","sessionId":"16737877f105ba30_1577963120580","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 11:22:21.331',
  '16737877f105ba30_1577964137913',
  '2bb93804-1614-4d44-91e3-b532fe701aa6',
  '2',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"2bb93804-1614-4d44-91e3-b532fe701aa6","sessionId":"16737877f105ba30_1577964137913","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 12:26:08.460',
  '16737877f105ba30_1577967962398',
  '2710a5aa-271e-4961-b835-b8c89f8fa360',
  '2',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"2710a5aa-271e-4961-b835-b8c89f8fa360","sessionId":"16737877f105ba30_1577967962398","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 12:41:40.748',
  '16737877f105ba30_1577968895695',
  '5f27eb13-2dfc-40fb-8f5e-7e13fea60733',
  '2',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"5f27eb13-2dfc-40fb-8f5e-7e13fea60733","sessionId":"16737877f105ba30_1577968895695","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 12:43:31.234',
  '16737877f105ba30_1577969004842',
  '3d33d3f3-8d31-46a6-b96f-8cf53caa7b07',
  '2',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"3d33d3f3-8d31-46a6-b96f-8cf53caa7b07","sessionId":"16737877f105ba30_1577969004842","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 12:44:48.375',
  '16737877f105ba30_1577969077432',
  'e46bbafe-c240-4ca1-a929-2996036f45cd',
  '2',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"e46bbafe-c240-4ca1-a929-2996036f45cd","sessionId":"16737877f105ba30_1577969077432","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 12:47:50.660',
  '16737877f105ba30_1577969263695',
  'bc8ed021-e20c-46c7-89e2-ea7f7475c4cf',
  '2',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"bc8ed021-e20c-46c7-89e2-ea7f7475c4cf","sessionId":"16737877f105ba30_1577969263695","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 09:56:53.121',
  'ad2d0b6b3b583708_1577958977507',
  'd8d4427f-1405-4fd9-aa33-0c89a78d9de0',
  '020120-1',
  'TRANSACTION',
  11.99,
  'USD',
  'XPORTALStore',
  'APPROVED',
  CAST('{"score":0,"amount":11.99,"riskLevel":"LOW","requestId":"d8d4427f-1405-4fd9-aa33-0c89a78d9de0","sessionId":"ad2d0b6b3b583708_1577958977507","destinationId":"XPORTALStore","userId":"020120-1","currencyCode":"USD","user":{"phoneUser":"05424445877","isPhoneVerified":"VERIFIED","address":{},"email":"best_test@gmail.com","isEmailVerified":"VERIFIED"},"checkPointType":"TRANSACTION","transaction":{"transactionType":"PURCHASE","amount":11.99,"time_stamp":1577959013050,"curType":"USD","shippingAddress":{"firstName":"Ama","lastName":"Joke","country":"IL","phoneNumber":"055555555","city":"Ramat Gan","postalCode":"52573","addressLine1":"David Ben Gurion Rd 10","addressLine2":"","state":"Israel"},"authorizationResponse":{"verificationStatus":"verificationStatus","aVSResultCode":"aVSResultCod","acquirerResponseCode":"acquirerResponseCode","acquirerResponseMessage":"acquirerResponseMessage","declineReasonMessage":"declineReasonMessage","threeDSResponseStatus":"threeDSResponseStatus","declineReasonCode":"declineReasonCode","threeDSResponseECI":"threeDSResponseECI","threeDSResponseEnrolled":"threeDSResponseEnrolled"},"payment":{"bankAccountDetails":{"bsb":"bsb","number":"number","fullName":"fullname"},"paymentMethodId":"1000CardId","fullNameOnCard":"Ama Joke","paymentMethodType":"CREDIT_CARD","processor":"Processor","creditCardDetail":{"lastFourDigit":"6546","bin":"065464","cardId":"1000CardId","cardToken":"ffjhg7i8tkh8hklhf","yearExpiryDate":2021,"monthExpiryDate":5}},"billingAddress":{"firstName":"Ama","lastName":"Joke","country":"IL","phoneNumber":"055555555","city":"Ramat Gan","postalCode":"52573","addressLine1":"David Ben Gurion Rd 10","addressLine2":"","state":"Israel"},"destinationId":"XPORTALStore","type":"TRANSACTION","user":{"phoneUser":"05424445877","isPhoneVerified":"VERIFIED","address":{},"email":"best_test@gmail.com","isEmailVerified":"VERIFIED"}}}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 09:58:19.753',
  'ad2d0b6b3b583708_1577959096905',
  '4c6cbad7-98f7-4662-8746-fa9eaed60118',
  '020120-2',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"4c6cbad7-98f7-4662-8746-fa9eaed60118","sessionId":"ad2d0b6b3b583708_1577959096905","userId":"020120-2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"020120-2","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 09:58:54.129',
  'ad2d0b6b3b583708_1577959132070',
  'e749fc75-9faf-4afd-86d0-989094417a1e',
  '020120-1',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"e749fc75-9faf-4afd-86d0-989094417a1e","sessionId":"ad2d0b6b3b583708_1577959132070","userId":"020120-1","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"020120-1","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 10:09:10.281',
  '16737877f105ba30_1577959745140',
  '7869d5c2-fc7e-4a07-8e7b-ca0620760503',
  '0542450590-01-01',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"7869d5c2-fc7e-4a07-8e7b-ca0620760503","sessionId":"16737877f105ba30_1577959745140","userId":"0542450590-01-01","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"0542450590-01-01","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 10:09:36.470',
  '16737877f105ba30_1577959771438',
  '7f13fbac-6d2f-4260-a96d-e83dc3a91e57',
  '0542450590-01-01',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"7f13fbac-6d2f-4260-a96d-e83dc3a91e57","sessionId":"16737877f105ba30_1577959771438","userId":"0542450590-01-01","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"0542450590-01-01","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 10:09:55.605',
  '16737877f105ba30_1577959792737',
  'f57cb857-04ad-4313-8665-43160d9c9305',
  '0542450590-01-01',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"f57cb857-04ad-4313-8665-43160d9c9305","sessionId":"16737877f105ba30_1577959792737","userId":"0542450590-01-01","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"0542450590-01-01","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 10:11:51.447',
  '16737877f105ba30_1577959906606',
  '84f50244-ad2b-4855-b24e-23d89a5a654a',
  '0542450590-01-01',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"84f50244-ad2b-4855-b24e-23d89a5a654a","sessionId":"16737877f105ba30_1577959906606","userId":"0542450590-01-01","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"0542450590-01-01","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 10:12:44.120',
  '16737877f105ba30_1577959958219',
  '12f307e8-c5ba-46e3-8452-8a56a2a4cb82',
  '0542450590-01-01',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"12f307e8-c5ba-46e3-8452-8a56a2a4cb82","sessionId":"16737877f105ba30_1577959958219","userId":"0542450590-01-01","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"0542450590-01-01","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 10:27:09.185',
  '16737877f105ba30_1577960823582',
  '9e3ba5fd-9e96-4e81-8290-229cf9609e07',
  '0542450590-01-01',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"9e3ba5fd-9e96-4e81-8290-229cf9609e07","sessionId":"16737877f105ba30_1577960823582","userId":"0542450590-01-01","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"0542450590-01-01","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 10:33:51.327',
  '16737877f105ba30_1577961228309',
  'a5a2557f-e74d-4590-8342-172bb0a3e4f9',
  '6',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"a5a2557f-e74d-4590-8342-172bb0a3e4f9","sessionId":"16737877f105ba30_1577961228309","userId":"6","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"6","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 10:40:21.801',
  '16737877f105ba30_1577961618083',
  '3ff436e0-ea80-40cc-ada3-1a5b43d07a1b',
  '2',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"3ff436e0-ea80-40cc-ada3-1a5b43d07a1b","sessionId":"16737877f105ba30_1577961618083","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 10:41:18.707',
  '16737877f105ba30_1577961673770',
  '64fc5299-05e2-4455-bfe4-9195736bd9f7',
  '2',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"64fc5299-05e2-4455-bfe4-9195736bd9f7","sessionId":"16737877f105ba30_1577961673770","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 11:00:52.233',
  '16737877f105ba30_1577962847872',
  '131d15b6-395e-434e-bfdf-5ad255c08a12',
  '2',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"131d15b6-395e-434e-bfdf-5ad255c08a12","sessionId":"16737877f105ba30_1577962847872","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 11:02:30.968',
  '16737877f105ba30_1577962947029',
  'e9736ebc-795c-417b-aa2d-7078dc0f34e0',
  '2',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"e9736ebc-795c-417b-aa2d-7078dc0f34e0","sessionId":"16737877f105ba30_1577962947029","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 12:48:43.388',
  '16737877f105ba30_1577969317173',
  '9acb5204-63f6-400d-8a80-fba5848296cb',
  '2',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"9acb5204-63f6-400d-8a80-fba5848296cb","sessionId":"16737877f105ba30_1577969317173","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 12:50:57.734',
  '16737877f105ba30_1577969452174',
  'fbc3dee4-521f-4406-8b71-0dd4d62dd9eb',
  '2',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"fbc3dee4-521f-4406-8b71-0dd4d62dd9eb","sessionId":"16737877f105ba30_1577969452174","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 12:53:41.865',
  '16737877f105ba30_1577969615495',
  '6ad5e618-2201-4ea8-adab-0f427ca6f738',
  '2',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"6ad5e618-2201-4ea8-adab-0f427ca6f738","sessionId":"16737877f105ba30_1577969615495","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 12:57:06.311',
  '16737877f105ba30_1577969819639',
  'ae8253fc-ad9b-4076-8236-2f53bdf3ee16',
  '2',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"ae8253fc-ad9b-4076-8236-2f53bdf3ee16","sessionId":"16737877f105ba30_1577969819639","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 12:58:20.190',
  '16737877f105ba30_1577969896896',
  '12f22626-7e3f-4ca8-9732-f13317fdd02e',
  '2',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"12f22626-7e3f-4ca8-9732-f13317fdd02e","sessionId":"16737877f105ba30_1577969896896","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 12:59:57.751',
  '16737877f105ba30_1577969991792',
  '6638a078-51a3-4ca6-9f37-9a0c54d9303a',
  '2',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"6638a078-51a3-4ca6-9f37-9a0c54d9303a","sessionId":"16737877f105ba30_1577969991792","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 13:01:20.738',
  '16737877f105ba30_1577970073658',
  'ac9e03fa-ecec-4712-94a3-d1ffb19deac3',
  '2',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"ac9e03fa-ecec-4712-94a3-d1ffb19deac3","sessionId":"16737877f105ba30_1577970073658","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 13:01:26.892',
  '0ff38bbb7d6e1123_1577970084200',
  'b51499f7-c074-463a-981f-45de4ee4be77',
  '+105424686011',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"b51499f7-c074-463a-981f-45de4ee4be77","sessionId":"0ff38bbb7d6e1123_1577970084200","userId":"+105424686011","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"+105424686011","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 13:01:57.435',
  '16737877f105ba30_1577970114157',
  '0d5fbf28-8867-4b49-8466-b6769bdcd4d3',
  '2',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"0d5fbf28-8867-4b49-8466-b6769bdcd4d3","sessionId":"16737877f105ba30_1577970114157","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 14:11:00.902',
  'CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1577974259573',
  '0B32B4BF-23B9-4A81-A917-36C87838935D',
  '556555',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"0B32B4BF-23B9-4A81-A917-36C87838935D","sessionId":"CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1577974259573","userId":"556555","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"556555","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 14:12:29.024',
  'CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1577974348831',
  'C88DC26E-2F21-4296-B861-9AAACCC55097',
  '2',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"C88DC26E-2F21-4296-B861-9AAACCC55097","sessionId":"CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1577974348831","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 14:13:21.375',
  'CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1577974400610',
  '9030F83A-3922-4711-B754-F4986C4E57FF',
  '2',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"9030F83A-3922-4711-B754-F4986C4E57FF","sessionId":"CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1577974400610","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 14:21:10.262',
  'CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1577974869658',
  '2654E3A4-09AF-43D8-BCBF-D93E4FD403A4',
  '2',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"2654E3A4-09AF-43D8-BCBF-D93E4FD403A4","sessionId":"CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1577974869658","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 14:55:29.321',
  'CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1577976925083',
  '82BE5D0F-B7F6-43FA-92FC-EA736B83F53C',
  '2',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"82BE5D0F-B7F6-43FA-92FC-EA736B83F53C","sessionId":"CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1577976925083","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 15:35:34.644',
  'F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1577979333894',
  '79A43A84-0DEE-4643-8631-9BF75517AE37',
  '2',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"79A43A84-0DEE-4643-8631-9BF75517AE37","sessionId":"F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1577979333894","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 15:39:03.441',
  'F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1577979542753',
  'A25D277F-BFC5-4168-8664-5D1DB45C50D9',
  '2',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"A25D277F-BFC5-4168-8664-5D1DB45C50D9","sessionId":"F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1577979542753","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'VERY_HIGH',
  1000.0,
  '2020-01-02 14:56:17.885',
  'CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1577976925083',
  '8AC1DB94-0D61-4635-9CB2-F8995A1049F9',
  '2',
  'TRANSACTION',
  50.0,
  'USD',
  'XPORTALStore',
  'APPROVED',
  CAST('{"score":1000,"amount":50,"riskLevel":"VERY_HIGH","requestId":"8AC1DB94-0D61-4635-9CB2-F8995A1049F9","sessionId":"CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1577976925083","destinationId":"XPORTALStore","userId":"2","currencyCode":"USD","user":{"phoneUser":"2","isPhoneVerified":"VERIFIED","address":{},"userId":"2","email":"best_test@gmail.com","isEmailVerified":"VERIFIED"},"checkPointType":"TRANSACTION","transaction":{"transactionType":"DEPOSIT","amount":50,"time_stamp":1577976977795,"curType":"USD","shippingAddress":{"firstName":"Ama","lastName":"Joke","country":"FR","phoneNumber":"055555555","city":"Paris","postalCode":"654","addressLine1":"Zion Place","addressLine2":"Rooted","state":"March"},"authorizationResponse":{"verificationStatus":"verificationStatus","aVSResultCode":"aVSResultCode","acquirerResponseCode":"acquirerResponseCode","acquirerResponseMessage":"acquirerResponseMessage","declineReasonMessage":"declineReasonMessage","threeDSResponseStatus":"threeDSResponseStatus","declineReasonCode":"declineReasonCode","threeDSResponseECI":"threeDSResponseECI","threeDSResponseEnrolled":"threeDSResponseEnrolled"},"payment":{"bankAccountDetails":{},"paymentMethodId":"1000","fullNameOnCard":"fullNameOnCard","paymentMethodType":"CREDIT_CARD","processor":"processor","creditCardDetail":{"lastFourDigit":"0000","cardId":"1000","cardToken":"CardToken","yearExpiryDate":0,"monthExpiryDate":0}},"billingAddress":{"firstName":"Ama","lastName":"Joke","country":"IL","phoneNumber":"055555555","city":"Ramat Gan","postalCode":"52573","addressLine1":"David Ben Gurion Rd 10","addressLine2":" ","state":"Israel"},"additionalData":{"map":{}},"destinationId":"XPORTALStore","type":"TRANSACTION","user":{"phoneUser":"2","isPhoneVerified":"VERIFIED","address":{},"userId":"2","email":"best_test@gmail.com","isEmailVerified":"VERIFIED"}}}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 14:57:21.882',
  'CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1577977041607',
  '41788F6F-C1C0-40C6-8D9C-51201AF59813',
  '054245059',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"41788F6F-C1C0-40C6-8D9C-51201AF59813","sessionId":"CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1577977041607","userId":"054245059","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"054245059","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  1.0,
  '2020-01-02 14:58:04.255',
  'CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1577977041607',
  '6745B4F2-2E78-4110-A7F1-47757FA65B2B',
  '054245059',
  'TRANSACTION',
  50.0,
  'USD',
  'XPORTALStore',
  'APPROVED',
  CAST('{"score":1,"amount":50,"riskLevel":"LOW","requestId":"6745B4F2-2E78-4110-A7F1-47757FA65B2B","sessionId":"CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1577977041607","destinationId":"XPORTALStore","userId":"054245059","currencyCode":"USD","user":{"phoneUser":"054245059","isPhoneVerified":"VERIFIED","address":{},"userId":"054245059","email":"best_test@gmail.com","isEmailVerified":"VERIFIED"},"checkPointType":"TRANSACTION","transaction":{"transactionType":"DEPOSIT","amount":50,"time_stamp":1577977084156,"curType":"USD","shippingAddress":{"firstName":"Ama","lastName":"Joke","country":"FR","phoneNumber":"055555555","city":"Paris","postalCode":"654","addressLine1":"Zion Place","addressLine2":"Rooted","state":"March"},"authorizationResponse":{"verificationStatus":"verificationStatus","aVSResultCode":"aVSResultCode","acquirerResponseCode":"acquirerResponseCode","acquirerResponseMessage":"acquirerResponseMessage","declineReasonMessage":"declineReasonMessage","threeDSResponseStatus":"threeDSResponseStatus","declineReasonCode":"declineReasonCode","threeDSResponseECI":"threeDSResponseECI","threeDSResponseEnrolled":"threeDSResponseEnrolled"},"payment":{"bankAccountDetails":{},"paymentMethodId":"1000","fullNameOnCard":"fullNameOnCard","paymentMethodType":"CREDIT_CARD","processor":"processor","creditCardDetail":{"lastFourDigit":"0000","cardId":"1000","cardToken":"CardToken","yearExpiryDate":0,"monthExpiryDate":0}},"billingAddress":{"firstName":"Ama","lastName":"Joke","country":"IL","phoneNumber":"055555555","city":"Ramat Gan","postalCode":"52573","addressLine1":"David Ben Gurion Rd 10","addressLine2":" ","state":"Israel"},"additionalData":{"map":{}},"destinationId":"XPORTALStore","type":"TRANSACTION","user":{"phoneUser":"054245059","isPhoneVerified":"VERIFIED","address":{},"userId":"054245059","email":"best_test@gmail.com","isEmailVerified":"VERIFIED"}}}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 14:59:29.013',
  'CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1577977168765',
  '78F0A039-6C68-4B5C-B5AB-5D985AEBE04D',
  '2',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"78F0A039-6C68-4B5C-B5AB-5D985AEBE04D","sessionId":"CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1577977168765","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 15:00:38.291',
  'CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1577977234312',
  'EDF71AEB-E908-47CF-B808-9C7729B80799',
  '2',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"EDF71AEB-E908-47CF-B808-9C7729B80799","sessionId":"CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1577977234312","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 15:03:14.460',
  'CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1577977393083',
  'AF8C40C2-3B25-4C9B-BE2E-A649C6878F38',
  '2',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"AF8C40C2-3B25-4C9B-BE2E-A649C6878F38","sessionId":"CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1577977393083","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 15:07:03.389',
  'CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1577977618749',
  'C8D4013D-9121-4837-B899-1573EA4E2DA4',
  '2',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"C8D4013D-9121-4837-B899-1573EA4E2DA4","sessionId":"CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1577977618749","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 15:15:08.277',
  'F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1577978097215',
  '281B94AD-44F4-42A6-A97B-10C80168B7B7',
  '5565',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"281B94AD-44F4-42A6-A97B-10C80168B7B7","sessionId":"F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1577978097215","userId":"5565","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"5565","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 15:16:15.453',
  'F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1577978168619',
  '44C7760F-E852-43A5-ACAF-8D35BB9A69AA',
  '5565',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"44C7760F-E852-43A5-ACAF-8D35BB9A69AA","sessionId":"F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1577978168619","userId":"5565","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"5565","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 15:17:13.754',
  'F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1577978232246',
  '00053E6D-211E-4B74-961B-580302E07780',
  '5565',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"00053E6D-211E-4B74-961B-580302E07780","sessionId":"F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1577978232246","userId":"5565","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"5565","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 15:19:36.293',
  'F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1577978375873',
  '50519B91-DC97-43B7-8477-3529DD07CB12',
  '2',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"50519B91-DC97-43B7-8477-3529DD07CB12","sessionId":"F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1577978375873","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 15:28:58.620',
  'F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1577978937465',
  'FFCA20D0-6DDE-49A1-A738-A1E3B2A575A9',
  '2',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"FFCA20D0-6DDE-49A1-A738-A1E3B2A575A9","sessionId":"F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1577978937465","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 15:40:33.673',
  'F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1577979633089',
  'B88F13FE-1B29-4ACF-A2AE-62057CF917E3',
  '2',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"B88F13FE-1B29-4ACF-A2AE-62057CF917E3","sessionId":"F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1577979633089","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 15:41:48.369',
  'F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1577979704476',
  'FF1A4DE8-A27D-4723-9FCC-862102818355',
  '2',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"FF1A4DE8-A27D-4723-9FCC-862102818355","sessionId":"F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1577979704476","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 15:47:22.455',
  'F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1577980041443',
  'A8245847-ABC8-4548-A8D2-8AE06D2FA26E',
  '2',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"A8245847-ABC8-4548-A8D2-8AE06D2FA26E","sessionId":"F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1577980041443","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 15:48:02.284',
  'F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1577980081185',
  '86DB0721-18FB-43F5-81EC-0B43F53CDE95',
  '2',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"86DB0721-18FB-43F5-81EC-0B43F53CDE95","sessionId":"F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1577980081185","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 16:01:22.223',
  'F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1577980881728',
  '342B5D68-6D50-414B-B8C5-14F67CC6B77F',
  '2',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"342B5D68-6D50-414B-B8C5-14F67CC6B77F","sessionId":"F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1577980881728","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 16:02:06.961',
  'F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1577980926513',
  '5257D0CF-61CD-434C-A678-F39CD67A1956',
  '2',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"5257D0CF-61CD-434C-A678-F39CD67A1956","sessionId":"F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1577980926513","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 16:04:36.090',
  'F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1577981075372',
  '5A3ACAFD-D6F2-406E-8A46-CE12A3C476DE',
  '2',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"5A3ACAFD-D6F2-406E-8A46-CE12A3C476DE","sessionId":"F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1577981075372","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 16:05:13.642',
  'F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1577981113138',
  'D7749403-0A50-4C22-BD42-FDC839BD9406',
  '2',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"D7749403-0A50-4C22-BD42-FDC839BD9406","sessionId":"F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1577981113138","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 16:08:52.668',
  'F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1577981332109',
  '9A103E97-108D-4B46-B8F8-789C99327279',
  '2',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"9A103E97-108D-4B46-B8F8-789C99327279","sessionId":"F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1577981332109","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 16:10:04.626',
  'F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1577981404116',
  'C21A67C5-5BA0-4D54-9644-660327E9AFEF',
  '2',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"C21A67C5-5BA0-4D54-9644-660327E9AFEF","sessionId":"F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1577981404116","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 16:11:22.055',
  'F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1577981481160',
  '7D0DF4E4-E4F0-45A5-8436-41DC4A086E46',
  '2',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"7D0DF4E4-E4F0-45A5-8436-41DC4A086E46","sessionId":"F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1577981481160","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 16:13:25.916',
  'F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1577981605060',
  '9C370871-6449-419E-91A2-5E8E189A1E6A',
  '2',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"9C370871-6449-419E-91A2-5E8E189A1E6A","sessionId":"F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1577981605060","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 16:14:03.292',
  'F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1577981642782',
  'EF4864B5-EC41-4111-94E5-41DBD5D71B00',
  '2',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"EF4864B5-EC41-4111-94E5-41DBD5D71B00","sessionId":"F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1577981642782","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 16:14:32.944',
  'F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1577981672510',
  'F1501CA6-707D-4FD8-9515-566866668449',
  '054245059',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"F1501CA6-707D-4FD8-9515-566866668449","sessionId":"F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1577981672510","userId":"054245059","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"054245059","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 16:14:48.721',
  'F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1577981688351',
  '7B80258D-BA5E-449F-8B95-9D4A416044A3',
  '2',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"7B80258D-BA5E-449F-8B95-9D4A416044A3","sessionId":"F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1577981688351","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-02 19:21:27.867',
  '40E70635-24D4-42F3-A5CF-28AFE87DF4C9_1577992887699',
  'BC99E321-A09C-41BB-88F5-5924F843516D',
  '40E70635-24D4-42F3-A5CF-28AFE87DF4C9',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"BC99E321-A09C-41BB-88F5-5924F843516D","sessionId":"40E70635-24D4-42F3-A5CF-28AFE87DF4C9_1577992887699","userId":"40E70635-24D4-42F3-A5CF-28AFE87DF4C9","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"40E70635-24D4-42F3-A5CF-28AFE87DF4C9","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-04 13:05:46.893',
  '8D4882DA-F71B-432D-9986-574EA8C9ECD2_1578143146601',
  'F1A21878-B28E-4AF0-B6C8-5F4BE704C5D5',
  '8D4882DA-F71B-432D-9986-574EA8C9ECD2',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"F1A21878-B28E-4AF0-B6C8-5F4BE704C5D5","sessionId":"8D4882DA-F71B-432D-9986-574EA8C9ECD2_1578143146601","userId":"8D4882DA-F71B-432D-9986-574EA8C9ECD2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"8D4882DA-F71B-432D-9986-574EA8C9ECD2","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-04 13:06:26.157',
  '8D4882DA-F71B-432D-9986-574EA8C9ECD2_1578143185128',
  '2017C8CB-7F8F-4902-B12D-C3B43949450C',
  '8D4882DA-F71B-432D-9986-574EA8C9ECD2',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"2017C8CB-7F8F-4902-B12D-C3B43949450C","sessionId":"8D4882DA-F71B-432D-9986-574EA8C9ECD2_1578143185128","userId":"8D4882DA-F71B-432D-9986-574EA8C9ECD2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"8D4882DA-F71B-432D-9986-574EA8C9ECD2","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 06:37:06.431',
  'CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578206224983',
  '90CC34A6-193D-4B2F-8F21-8B8914E41548',
  '2',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"90CC34A6-193D-4B2F-8F21-8B8914E41548","sessionId":"CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578206224983","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 06:37:51.225',
  'CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578206270959',
  '4CD9AE0E-D5D5-4E26-9C6B-5F32A1E5779C',
  '2',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"4CD9AE0E-D5D5-4E26-9C6B-5F32A1E5779C","sessionId":"CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578206270959","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 06:38:15.745',
  'CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578206294713',
  'B7A447BD-6688-418D-9EA1-46AE67BAA9EF',
  '2',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"B7A447BD-6688-418D-9EA1-46AE67BAA9EF","sessionId":"CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578206294713","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 07:08:31.160',
  'CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578208110100',
  '7498C8B8-C444-4994-95C7-99872FCA982E',
  '2',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"7498C8B8-C444-4994-95C7-99872FCA982E","sessionId":"CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578208110100","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 07:09:03.302',
  'CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578208143060',
  'D98A666F-6742-49DF-A6A4-0067C947E73B',
  '2',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"D98A666F-6742-49DF-A6A4-0067C947E73B","sessionId":"CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578208143060","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 07:11:13.495',
  'CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578208272517',
  '4426D5D5-43B2-4234-8D64-62296D09B330',
  '2',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"4426D5D5-43B2-4234-8D64-62296D09B330","sessionId":"CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578208272517","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.75,
  '2020-01-05 07:11:19.689',
  'CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578208272517',
  '02FA05A0-5817-462D-8479-B70BA2D7114F',
  '2',
  'TRANSACTION',
  50.0,
  'USD',
  'XPORTALStore',
  'APPROVED',
  CAST('{"score":0.75,"amount":50,"riskLevel":"LOW","requestId":"02FA05A0-5817-462D-8479-B70BA2D7114F","sessionId":"CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578208272517","destinationId":"XPORTALStore","userId":"2","currencyCode":"USD","user":{"phoneUser":"2","isPhoneVerified":"VERIFIED","address":{},"userId":"2","email":"best_test@gmail.com","isEmailVerified":"VERIFIED"},"checkPointType":"TRANSACTION","transaction":{"transactionType":"DEPOSIT","amount":50,"time_stamp":1578208279621,"curType":"USD","shippingAddress":{"firstName":"Ama","lastName":"Joke","country":"FR","phoneNumber":"055555555","city":"Paris","postalCode":"654","addressLine1":"Zion Place","addressLine2":"Rooted","state":"March"},"authorizationResponse":{"verificationStatus":"verificationStatus","aVSResultCode":"aVSResultCode","acquirerResponseCode":"acquirerResponseCode","acquirerResponseMessage":"acquirerResponseMessage","declineReasonMessage":"declineReasonMessage","threeDSResponseStatus":"threeDSResponseStatus","declineReasonCode":"declineReasonCode","threeDSResponseECI":"threeDSResponseECI","threeDSResponseEnrolled":"threeDSResponseEnrolled"},"payment":{"bankAccountDetails":{},"paymentMethodId":"1000","fullNameOnCard":"fullNameOnCard","paymentMethodType":"CREDIT_CARD","processor":"processor","creditCardDetail":{"lastFourDigit":"0000","cardId":"1000","cardToken":"CardToken","yearExpiryDate":0,"monthExpiryDate":0}},"billingAddress":{"firstName":"Ama","lastName":"Joke","country":"IL","phoneNumber":"055555555","city":"Ramat Gan","postalCode":"52573","addressLine1":"David Ben Gurion Rd 10","addressLine2":" ","state":"Israel"},"additionalData":{"map":{}},"destinationId":"XPORTALStore","type":"TRANSACTION","user":{"phoneUser":"2","isPhoneVerified":"VERIFIED","address":{},"userId":"2","email":"best_test@gmail.com","isEmailVerified":"VERIFIED"}}}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 07:49:30.955',
  '16737877f105ba30_1578210556790',
  '91333fa3-ff03-4d9a-bc25-4993d0ddd573',
  'TestUser',
  'ADD_PAYMENT_METHOD',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"91333fa3-ff03-4d9a-bc25-4993d0ddd573","paymentMethod":{"payment":{"bankAccountDetails":{},"creditCardDetail":{}},"billingAddress":{},"type":"ADD_PAYMENT_METHOD","user":{"isPhoneVerified":"UNKNOWN","address":{},"isEmailVerified":"UNKNOWN"}},"sessionId":"16737877f105ba30_1578210556790","userId":"TestUser","user":{"isPhoneVerified":"UNKNOWN","address":{},"isEmailVerified":"UNKNOWN"},"checkPointType":"ADD_PAYMENT_METHOD"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'VERY_HIGH',
  1000.0,
  '2020-01-05 07:11:25.714',
  'CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578208272517',
  '0A94069C-7209-476F-A922-BEC97FB64F44',
  '2',
  'TRANSACTION',
  50.0,
  'USD',
  'XPORTALStore',
  'APPROVED',
  CAST('{"score":1000,"amount":50,"riskLevel":"VERY_HIGH","requestId":"0A94069C-7209-476F-A922-BEC97FB64F44","sessionId":"CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578208272517","destinationId":"XPORTALStore","userId":"2","currencyCode":"USD","user":{"phoneUser":"2","isPhoneVerified":"VERIFIED","address":{},"userId":"2","email":"best_test@gmail.com","isEmailVerified":"VERIFIED"},"checkPointType":"TRANSACTION","transaction":{"transactionType":"DEPOSIT","amount":50,"time_stamp":1578208285657,"curType":"USD","shippingAddress":{"firstName":"Ama","lastName":"Joke","country":"FR","phoneNumber":"055555555","city":"Paris","postalCode":"654","addressLine1":"Zion Place","addressLine2":"Rooted","state":"March"},"authorizationResponse":{"verificationStatus":"verificationStatus","aVSResultCode":"aVSResultCode","acquirerResponseCode":"acquirerResponseCode","acquirerResponseMessage":"acquirerResponseMessage","declineReasonMessage":"declineReasonMessage","threeDSResponseStatus":"threeDSResponseStatus","declineReasonCode":"declineReasonCode","threeDSResponseECI":"threeDSResponseECI","threeDSResponseEnrolled":"threeDSResponseEnrolled"},"payment":{"bankAccountDetails":{},"paymentMethodId":"1000","fullNameOnCard":"fullNameOnCard","paymentMethodType":"CREDIT_CARD","processor":"processor","creditCardDetail":{"lastFourDigit":"0000","cardId":"1000","cardToken":"CardToken","yearExpiryDate":0,"monthExpiryDate":0}},"billingAddress":{"firstName":"Ama","lastName":"Joke","country":"IL","phoneNumber":"055555555","city":"Ramat Gan","postalCode":"52573","addressLine1":"David Ben Gurion Rd 10","addressLine2":" ","state":"Israel"},"additionalData":{"map":{}},"destinationId":"XPORTALStore","type":"TRANSACTION","user":{"phoneUser":"2","isPhoneVerified":"VERIFIED","address":{},"userId":"2","email":"best_test@gmail.com","isEmailVerified":"VERIFIED"}}}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 07:49:18.932',
  '16737877f105ba30_1578210556790',
  '39c65af5-194d-4ac0-ad11-c6cf32971967',
  '111111',
  'TRANSACTION',
  50.0,
  'ILS',
  '111111',
  NULL,
  CAST('{"score":0,"amount":50,"riskLevel":"LOW","requestId":"39c65af5-194d-4ac0-ad11-c6cf32971967","sessionId":"16737877f105ba30_1578210556790","destinationId":"111111","userId":"111111","currencyCode":"ILS","user":{"isPhoneVerified":"UNKNOWN","address":{},"isEmailVerified":"UNKNOWN"},"checkPointType":"TRANSACTION","transaction":{"transactionType":"PURCHASE","amount":50,"time_stamp":1578210558838,"curType":"ILS","shippingAddress":{},"authorizationResponse":{},"payment":{"bankAccountDetails":{},"creditCardDetail":{}},"billingAddress":{},"destinationId":"111111","type":"TRANSACTION","user":{"isPhoneVerified":"UNKNOWN","address":{},"isEmailVerified":"UNKNOWN"}}}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 07:49:20.811',
  '16737877f105ba30_1578210556348',
  '3d06c94f-6a41-4c4c-9464-2ebd792a0f16',
  '111111',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"3d06c94f-6a41-4c4c-9464-2ebd792a0f16","sessionId":"16737877f105ba30_1578210556348","userId":"111111","user":{"isPhoneVerified":"UNKNOWN","address":{},"email":"user@gmail.com","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 07:49:21.293',
  '16737877f105ba30_1578210556790',
  '2e0a01fd-5319-4912-bed7-1492fee2369b',
  '111111',
  'TRANSACTION',
  50.0,
  'ILS',
  '111111',
  NULL,
  CAST('{"score":0,"amount":50,"riskLevel":"LOW","requestId":"2e0a01fd-5319-4912-bed7-1492fee2369b","sessionId":"16737877f105ba30_1578210556790","destinationId":"111111","userId":"111111","currencyCode":"ILS","user":{"isPhoneVerified":"UNKNOWN","address":{},"isEmailVerified":"UNKNOWN"},"checkPointType":"TRANSACTION","transaction":{"transactionType":"PURCHASE","amount":50,"time_stamp":1578210561246,"curType":"ILS","shippingAddress":{},"authorizationResponse":{},"payment":{"bankAccountDetails":{},"creditCardDetail":{}},"billingAddress":{},"destinationId":"111111","type":"TRANSACTION","user":{"isPhoneVerified":"UNKNOWN","address":{},"isEmailVerified":"UNKNOWN"}}}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 07:49:28.404',
  '16737877f105ba30_1578210556790',
  '730ce3e3-4d05-45c3-a0d3-56e826a92826',
  'TestUser',
  'ADD_PAYMENT_METHOD',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"730ce3e3-4d05-45c3-a0d3-56e826a92826","paymentMethod":{"payment":{"bankAccountDetails":{},"paymentMethodId":"1000","fullNameOnCard":"Eli_az","paymentMethodType":"CREDIT_CARD","processor":"kljbhkjh","creditCardDetail":{"lastFourDigit":"6544","bin":"654654","cardId":"1000","cardToken":"kljhkho80p9","yearExpiryDate":2020,"monthExpiryDate":5}},"billingAddress":{"firstName":"Eli","lastName":"Az","country":"IL","phoneNumber":"05424504590","city":"Modii''n","postalCode":"99","addressLine1":"Bla bla 2/5","addressLine2":"","state":""},"type":"ADD_PAYMENT_METHOD","user":{"phoneUser":"0542450590","isPhoneVerified":"VERIFIED","address":{},"email":"test@test.com","isEmailVerified":"VERIFIED"}},"sessionId":"16737877f105ba30_1578210556790","userId":"TestUser","user":{"phoneUser":"0542450590","isPhoneVerified":"VERIFIED","address":{},"email":"test@test.com","isEmailVerified":"VERIFIED"},"checkPointType":"ADD_PAYMENT_METHOD"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 07:49:29.667',
  '16737877f105ba30_1578210556790',
  '2da1c906-2996-4b60-bdc7-c7b054aeee3a',
  'TestUser',
  'ADD_PAYMENT_METHOD',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"2da1c906-2996-4b60-bdc7-c7b054aeee3a","paymentMethod":{"payment":{"bankAccountDetails":{},"paymentMethodId":"1000","fullNameOnCard":"Eli_az","paymentMethodType":"CREDIT_CARD","processor":"kljbhkjh","creditCardDetail":{"lastFourDigit":"6544","cardId":"1000","cardToken":"kljhkho80p9","yearExpiryDate":2020,"monthExpiryDate":5}},"billingAddress":{"firstName":"Eli","lastName":"Az","country":"IL","phoneNumber":"05424504590","city":"Modii''n","postalCode":"99","addressLine1":"Bla bla 2/5","addressLine2":"","state":""},"type":"ADD_PAYMENT_METHOD","user":{"phoneUser":"0542450590","isPhoneVerified":"VERIFIED","address":{},"email":"test@test.com","isEmailVerified":"VERIFIED"}},"sessionId":"16737877f105ba30_1578210556790","userId":"TestUser","user":{"phoneUser":"0542450590","isPhoneVerified":"VERIFIED","address":{},"email":"test@test.com","isEmailVerified":"VERIFIED"},"checkPointType":"ADD_PAYMENT_METHOD"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 07:49:30.283',
  '16737877f105ba30_1578210556790',
  '807d820e-4f2e-4432-83c2-b372211cd79a',
  'TestUser',
  'ADD_PAYMENT_METHOD',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"807d820e-4f2e-4432-83c2-b372211cd79a","paymentMethod":{"payment":{"bankAccountDetails":{},"paymentMethodId":"1000","fullNameOnCard":"Eli_az","paymentMethodType":"CREDIT_CARD","processor":"kljbhkjh","creditCardDetail":{"lastFourDigit":"65","bin":"654654","cardId":"1000","cardToken":"kljhkho80p9","yearExpiryDate":2020,"monthExpiryDate":5}},"billingAddress":{"firstName":"Eli","lastName":"Az","country":"IL","phoneNumber":"05424504590","city":"Modii''n","postalCode":"99","addressLine1":"Bla bla 2/5","addressLine2":"","state":""},"type":"ADD_PAYMENT_METHOD","user":{"phoneUser":"0542450590","isPhoneVerified":"VERIFIED","address":{},"email":"test@test.com","isEmailVerified":"VERIFIED"}},"sessionId":"16737877f105ba30_1578210556790","userId":"TestUser","user":{"phoneUser":"0542450590","isPhoneVerified":"VERIFIED","address":{},"email":"test@test.com","isEmailVerified":"VERIFIED"},"checkPointType":"ADD_PAYMENT_METHOD"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 07:49:31.687',
  '16737877f105ba30_1578210556790',
  '1074e15d-a1ac-4248-84b0-2c3f1ba4f90b',
  'TestUser',
  'ADD_PAYMENT_METHOD',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"1074e15d-a1ac-4248-84b0-2c3f1ba4f90b","paymentMethod":{"payment":{"bankAccountDetails":{},"creditCardDetail":{"cardToken":"545644444"}},"billingAddress":{},"type":"ADD_PAYMENT_METHOD","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"111111","isEmailVerified":"UNKNOWN"}},"sessionId":"16737877f105ba30_1578210556790","userId":"TestUser","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"111111","isEmailVerified":"UNKNOWN"},"checkPointType":"ADD_PAYMENT_METHOD"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  1.0,
  '2020-01-05 07:49:32.392',
  '16737877f105ba30_1578210556790',
  'f4c5d679-9cd6-4339-a5d5-a078056f10b8',
  'TestUser',
  'TRANSACTION',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":1,"riskLevel":"LOW","requestId":"f4c5d679-9cd6-4339-a5d5-a078056f10b8","sessionId":"16737877f105ba30_1578210556790","userId":"TestUser","user":{"phoneUser":"0542450590","isPhoneVerified":"VERIFIED","address":{},"email":"test@test.com","isEmailVerified":"VERIFIED"},"checkPointType":"TRANSACTION","transaction":{"time_stamp":1578210572350,"shippingAddress":{},"authorizationResponse":{},"payment":{"bankAccountDetails":{},"paymentMethodId":"1000","fullNameOnCard":"Eli_az","paymentMethodType":"CREDIT_CARD","processor":"kljbhkjh","creditCardDetail":{"lastFourDigit":"65","bin":"654654","cardId":"1000","cardToken":"kljhkho80p9","yearExpiryDate":2020,"monthExpiryDate":5}},"billingAddress":{"firstName":"Eli","lastName":"Az","country":"IL","phoneNumber":"05424504590","city":"Modii''n","postalCode":"99","addressLine1":"Bla bla 2/5","addressLine2":"","state":""},"type":"TRANSACTION","user":{"phoneUser":"0542450590","isPhoneVerified":"VERIFIED","address":{},"email":"test@test.com","isEmailVerified":"VERIFIED"}}}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  1.0,
  '2020-01-05 07:49:33.019',
  '16737877f105ba30_1578210556790',
  '727d219b-969d-4aad-b81d-e4e234c66ea6',
  'TestUser',
  'TRANSACTION',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":1,"riskLevel":"LOW","requestId":"727d219b-969d-4aad-b81d-e4e234c66ea6","sessionId":"16737877f105ba30_1578210556790","userId":"TestUser","user":{"phoneUser":"0542450590","isPhoneVerified":"VERIFIED","address":{},"email":"test@test.com","isEmailVerified":"VERIFIED"},"checkPointType":"TRANSACTION","transaction":{"time_stamp":1578210572967,"shippingAddress":{},"authorizationResponse":{},"payment":{"bankAccountDetails":{},"paymentMethodId":"1000","fullNameOnCard":"Eli_az","paymentMethodType":"CREDIT_CARD","processor":"kljbhkjh","creditCardDetail":{"lastFourDigit":"65","bin":"654654","cardId":"1000","cardToken":"kljhkho80p9","yearExpiryDate":2020,"monthExpiryDate":5}},"billingAddress":{"firstName":"Eli","lastName":"Az","country":"IL","phoneNumber":"05424504590","city":"Modii''n","postalCode":"99","addressLine1":"Bla bla 2/5","addressLine2":"","state":""},"type":"TRANSACTION","user":{"phoneUser":"0542450590","isPhoneVerified":"VERIFIED","address":{},"email":"test@test.com","isEmailVerified":"VERIFIED"}}}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 07:49:33.677',
  '16737877f105ba30_1578210556790',
  'b2063419-29df-46c6-ba5b-ecefbf1cfb41',
  'TestUser',
  'ADD_PAYMENT_METHOD',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"b2063419-29df-46c6-ba5b-ecefbf1cfb41","paymentMethod":{"payment":{"bankAccountDetails":{},"paymentMethodId":"1000","fullNameOnCard":"Eli_az","paymentMethodType":"CREDIT_CARD","processor":"kljbhkjh","creditCardDetail":{"lastFourDigit":"6544","bin":"654654","cardId":"1000","cardToken":"kljhkho80p9","yearExpiryDate":2005,"monthExpiryDate":5}},"billingAddress":{"firstName":"Eli","lastName":"Az","country":"IL","phoneNumber":"05424504590","city":"Modii''n","postalCode":"99","addressLine1":"Bla bla 2/5","addressLine2":"","state":""},"type":"ADD_PAYMENT_METHOD","user":{"phoneUser":"0542450590","isPhoneVerified":"VERIFIED","address":{},"email":"test@test.com","isEmailVerified":"VERIFIED"}},"sessionId":"16737877f105ba30_1578210556790","userId":"TestUser","user":{"phoneUser":"0542450590","isPhoneVerified":"VERIFIED","address":{},"email":"test@test.com","isEmailVerified":"VERIFIED"},"checkPointType":"ADD_PAYMENT_METHOD"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 07:49:35.597',
  '16737877f105ba30_1578210572986',
  '1f3b9def-3b9f-4690-bd95-7f2bea970125',
  '12345',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"1f3b9def-3b9f-4690-bd95-7f2bea970125","sessionId":"16737877f105ba30_1578210572986","userId":"12345","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"12345","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 07:49:46.852',
  '16737877f105ba30_1578210572986',
  'e0875e57-dc45-4585-9949-4ab4e7c61e2b',
  '111111',
  'TRANSACTION',
  50.0,
  'ILS',
  '111111',
  NULL,
  CAST('{"score":0,"amount":50,"riskLevel":"LOW","requestId":"e0875e57-dc45-4585-9949-4ab4e7c61e2b","sessionId":"16737877f105ba30_1578210572986","destinationId":"111111","userId":"111111","currencyCode":"ILS","user":{"isPhoneVerified":"UNKNOWN","address":{},"email":"user@gmail.com","isEmailVerified":"UNKNOWN"},"checkPointType":"TRANSACTION","transaction":{"transactionType":"PURCHASE","amount":50,"time_stamp":1578210586735,"curType":"ILS","shippingAddress":{},"authorizationResponse":{},"payment":{"bankAccountDetails":{},"creditCardDetail":{}},"billingAddress":{},"destinationId":"111111","type":"TRANSACTION","user":{"isPhoneVerified":"UNKNOWN","address":{},"email":"user@gmail.com","isEmailVerified":"UNKNOWN"}}}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 07:49:48.323',
  '16737877f105ba30_1578210585966',
  '8b76ee60-c612-4401-92d4-48dace2c4f1a',
  '111111',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"8b76ee60-c612-4401-92d4-48dace2c4f1a","sessionId":"16737877f105ba30_1578210585966","userId":"111111","user":{"isPhoneVerified":"UNKNOWN","address":{},"isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 07:49:50.060',
  '16737877f105ba30_1578210587410',
  '216e09d6-cdb0-4ff1-aba8-cd622af9f0a2',
  '111111',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"216e09d6-cdb0-4ff1-aba8-cd622af9f0a2","sessionId":"16737877f105ba30_1578210587410","userId":"111111","user":{"isPhoneVerified":"UNKNOWN","address":{},"isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 07:49:52.055',
  '16737877f105ba30_1578210589326',
  'de5a0449-c833-4811-bfa8-fcd0d4ca2087',
  '11111',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"de5a0449-c833-4811-bfa8-fcd0d4ca2087","sessionId":"16737877f105ba30_1578210589326","userId":"11111","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"11111","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 07:49:53.503',
  '16737877f105ba30_1578210591148',
  'fd80c1ad-818f-448c-9031-afaaa90665c9',
  '111111',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"fd80c1ad-818f-448c-9031-afaaa90665c9","sessionId":"16737877f105ba30_1578210591148","userId":"111111","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"111111","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 07:49:54.146',
  '16737877f105ba30_1578210591148',
  '6068c559-70a9-43d1-8c32-2a9931ea3508',
  '111111',
  'TRANSACTION',
  50.0,
  'ILS',
  '111111',
  NULL,
  CAST('{"score":0,"amount":50,"riskLevel":"LOW","requestId":"6068c559-70a9-43d1-8c32-2a9931ea3508","sessionId":"16737877f105ba30_1578210591148","destinationId":"111111","userId":"111111","currencyCode":"ILS","user":{"isPhoneVerified":"UNKNOWN","address":{},"isEmailVerified":"UNKNOWN"},"checkPointType":"TRANSACTION","transaction":{"transactionType":"PURCHASE","amount":50,"time_stamp":1578210594086,"curType":"ILS","shippingAddress":{},"authorizationResponse":{},"payment":{"bankAccountDetails":{},"creditCardDetail":{}},"billingAddress":{},"destinationId":"111111","type":"TRANSACTION","user":{"isPhoneVerified":"UNKNOWN","address":{},"isEmailVerified":"UNKNOWN"}}}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 07:57:39.658',
  'f7ad1a4b2beed248_1578211058667',
  'b6ddca86-f3fc-4aef-a780-fa28c614ba67',
  '43599c5f-95b3-4842-b502-8030c6d60bdf',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"b6ddca86-f3fc-4aef-a780-fa28c614ba67","sessionId":"f7ad1a4b2beed248_1578211058667","userId":"43599c5f-95b3-4842-b502-8030c6d60bdf","user":{"phoneUser":"","isPhoneVerified":"UNKNOWN","address":{},"userId":"43599c5f-95b3-4842-b502-8030c6d60bdf","email":"","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'VERY_HIGH',
  1000.0,
  '2020-01-05 07:58:32.607',
  'f7ad1a4b2beed248_1578211111141',
  '4933e243-07c5-4762-9a88-ce6b99700799',
  '43599c5f-95b3-4842-b502-8030c6d60bdf',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":1000,"riskLevel":"VERY_HIGH","requestId":"4933e243-07c5-4762-9a88-ce6b99700799","sessionId":"f7ad1a4b2beed248_1578211111141","userId":"43599c5f-95b3-4842-b502-8030c6d60bdf","user":{"phoneUser":"0547798240","isPhoneVerified":"UNKNOWN","address":{},"email":"zivc@com","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'VERY_HIGH',
  1000.0,
  '2020-01-05 07:58:53.449',
  'f7ad1a4b2beed248_1578211111141',
  '6ea7b606-f355-434e-811f-1e295ad26d54',
  '43599c5f-95b3-4842-b502-8030c6d60bdf',
  'GENERAL',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":1000,"riskLevel":"VERY_HIGH","requestId":"6ea7b606-f355-434e-811f-1e295ad26d54","sessionId":"f7ad1a4b2beed248_1578211111141","userId":"43599c5f-95b3-4842-b502-8030c6d60bdf","checkPointType":"GENERAL"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 08:15:57.839',
  'CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578212157602',
  '7237E1F1-C0B3-4494-9227-91E97078F63A',
  '2',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"7237E1F1-C0B3-4494-9227-91E97078F63A","sessionId":"CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578212157602","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 08:32:22.116',
  '16737877f105ba30_1578213136539',
  '8ab50bc0-5017-45dc-a354-4cf2fb140fd5',
  '2',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"8ab50bc0-5017-45dc-a354-4cf2fb140fd5","sessionId":"16737877f105ba30_1578213136539","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 08:33:20.338',
  '16737877f105ba30_1578213197885',
  '2393a680-00a3-4f17-820d-7fb2984b44c9',
  '2',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"2393a680-00a3-4f17-820d-7fb2984b44c9","sessionId":"16737877f105ba30_1578213197885","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 09:22:50.438',
  '16737877f105ba30_1578216160584',
  '1f1e127c-8cfe-494b-987e-6d1ad9d9f043',
  '2',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"1f1e127c-8cfe-494b-987e-6d1ad9d9f043","sessionId":"16737877f105ba30_1578216160584","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'VERY_HIGH',
  1000.0,
  '2020-01-05 10:14:08.193',
  'CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578219133535',
  'E0EEF0CB-440A-4347-A050-A960B92D2807',
  '2',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":1000,"riskLevel":"VERY_HIGH","requestId":"E0EEF0CB-440A-4347-A050-A960B92D2807","sessionId":"CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578219133535","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'VERY_HIGH',
  1000.0,
  '2020-01-05 10:18:59.524',
  'CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578219530237',
  '32C02750-4BC4-45E1-B05F-F3D58B2E19D8',
  '2',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":1000,"riskLevel":"VERY_HIGH","requestId":"32C02750-4BC4-45E1-B05F-F3D58B2E19D8","sessionId":"CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578219530237","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 10:19:08.677',
  'CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578219548414',
  '098382D6-B3F7-4F3B-AB5F-45059E916EB9',
  '054245059',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"098382D6-B3F7-4F3B-AB5F-45059E916EB9","sessionId":"CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578219548414","userId":"054245059","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"054245059","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 10:21:10.244',
  'CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578219669656',
  '14CC2CD9-1E8F-4499-AD80-706D3E30FD5C',
  '0542450570',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"14CC2CD9-1E8F-4499-AD80-706D3E30FD5C","sessionId":"CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578219669656","userId":"0542450570","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"0542450570","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 10:22:43.920',
  'CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578219762174',
  '05FC771E-87BC-4566-B9AE-929BF5FA4280',
  '0542450570',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"05FC771E-87BC-4566-B9AE-929BF5FA4280","sessionId":"CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578219762174","userId":"0542450570","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"0542450570","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 10:29:18.565',
  'CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578220157547',
  '11FACE43-2569-4CEA-B026-18CF14B48318',
  '0542450570',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"11FACE43-2569-4CEA-B026-18CF14B48318","sessionId":"CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578220157547","userId":"0542450570","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"0542450570","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 10:30:07.788',
  'CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578220204781',
  '68E49B3F-6BD4-43FC-AB61-A51A212F2EC4',
  '0542450570',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"68E49B3F-6BD4-43FC-AB61-A51A212F2EC4","sessionId":"CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578220204781","userId":"0542450570","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"0542450570","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 10:30:26.040',
  'CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578220225791',
  '1D05706E-F0D0-4BCC-ADFE-5518810BF4BD',
  '054245059',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"1D05706E-F0D0-4BCC-ADFE-5518810BF4BD","sessionId":"CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578220225791","userId":"054245059","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"054245059","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 10:30:39.868',
  'CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578220225791',
  'D0244B81-3639-446B-8AA3-A7521BB80D7D',
  '054245059',
  'TRANSACTION',
  50.0,
  'USD',
  'XPORTALStore',
  'APPROVED',
  CAST('{"score":0,"amount":50,"riskLevel":"LOW","requestId":"D0244B81-3639-446B-8AA3-A7521BB80D7D","sessionId":"CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578220225791","destinationId":"XPORTALStore","userId":"054245059","currencyCode":"USD","user":{"phoneUser":"054245059","isPhoneVerified":"VERIFIED","address":{},"userId":"054245059","email":"best_test@gmail.com","isEmailVerified":"VERIFIED"},"checkPointType":"TRANSACTION","transaction":{"transactionType":"DEPOSIT","amount":50,"time_stamp":1578220239799,"curType":"USD","shippingAddress":{"firstName":"Ama","lastName":"Joke","country":"FR","phoneNumber":"055555555","city":"Paris","postalCode":"654","addressLine1":"Zion Place","addressLine2":"Rooted","state":"March"},"authorizationResponse":{"verificationStatus":"verificationStatus","aVSResultCode":"aVSResultCode","acquirerResponseCode":"acquirerResponseCode","acquirerResponseMessage":"acquirerResponseMessage","declineReasonMessage":"declineReasonMessage","threeDSResponseStatus":"threeDSResponseStatus","declineReasonCode":"declineReasonCode","threeDSResponseECI":"threeDSResponseECI","threeDSResponseEnrolled":"threeDSResponseEnrolled"},"payment":{"bankAccountDetails":{},"paymentMethodId":"1000","fullNameOnCard":"Eli_az","paymentMethodType":"CREDIT_CARD","processor":"kljbhkjh","creditCardDetail":{"lastFourDigit":"6544","bin":"654654","cardId":"1000","cardToken":"kljhkho80p9","yearExpiryDate":2005,"monthExpiryDate":5}},"billingAddress":{"firstName":"Eli","lastName":"Az","country":"IL","phoneNumber":"05424504590","city":"Modii''n","postalCode":"99","addressLine1":"Bla bla 2/5","addressLine2":"","state":""},"additionalData":{"map":{}},"destinationId":"XPORTALStore","type":"TRANSACTION","user":{"phoneUser":"054245059","isPhoneVerified":"VERIFIED","address":{},"userId":"054245059","email":"best_test@gmail.com","isEmailVerified":"VERIFIED"}}}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 10:31:13.108',
  'CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578220225791',
  'D6FD7F81-5C3D-4B63-986D-FEFD9F2F5649',
  '054245059',
  'TRANSACTION',
  34.45,
  'USD',
  'XPORTALStore',
  'APPROVED',
  CAST('{"score":0,"amount":34.45,"riskLevel":"LOW","requestId":"D6FD7F81-5C3D-4B63-986D-FEFD9F2F5649","sessionId":"CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578220225791","destinationId":"XPORTALStore","userId":"054245059","currencyCode":"USD","user":{"phoneUser":"054245059","isPhoneVerified":"VERIFIED","address":{},"userId":"054245059","email":"best_test@gmail.com","isEmailVerified":"VERIFIED"},"checkPointType":"TRANSACTION","transaction":{"transactionType":"DEPOSIT","amount":34.45,"time_stamp":1578220273060,"curType":"USD","shippingAddress":{"firstName":"Ama","lastName":"Joke","country":"FR","phoneNumber":"055555555","city":"Paris","postalCode":"654","addressLine1":"Zion Place","addressLine2":"Rooted","state":"March"},"authorizationResponse":{"verificationStatus":"verificationStatus","aVSResultCode":"aVSResultCode","acquirerResponseCode":"acquirerResponseCode","acquirerResponseMessage":"acquirerResponseMessage","declineReasonMessage":"declineReasonMessage","threeDSResponseStatus":"threeDSResponseStatus","declineReasonCode":"declineReasonCode","threeDSResponseECI":"threeDSResponseECI","threeDSResponseEnrolled":"threeDSResponseEnrolled"},"payment":{"bankAccountDetails":{},"paymentMethodId":"1000","fullNameOnCard":"Eli_az","paymentMethodType":"CREDIT_CARD","processor":"kljbhkjh","creditCardDetail":{"lastFourDigit":"6544","bin":"654654","cardId":"1000","cardToken":"kljhkho80p9","yearExpiryDate":2005,"monthExpiryDate":5}},"billingAddress":{"firstName":"Eli","lastName":"Az","country":"IL","phoneNumber":"05424504590","city":"Modii''n","postalCode":"99","addressLine1":"Bla bla 2/5","addressLine2":"","state":""},"additionalData":{"map":{}},"destinationId":"XPORTALStore","type":"TRANSACTION","user":{"phoneUser":"054245059","isPhoneVerified":"VERIFIED","address":{},"userId":"054245059","email":"best_test@gmail.com","isEmailVerified":"VERIFIED"}}}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 10:31:41.714',
  '16737877f105ba30_1578216289317',
  '6d71e391-b040-4f82-b184-82fcb1ae73b3',
  '2',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"6d71e391-b040-4f82-b184-82fcb1ae73b3","sessionId":"16737877f105ba30_1578216289317","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'VERY_HIGH',
  1000.0,
  '2020-01-05 10:40:41.909',
  'CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578220841704',
  'CBE0A9CA-7CCF-4AA9-A283-21064057BC74',
  '054245059',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":1000,"riskLevel":"VERY_HIGH","requestId":"CBE0A9CA-7CCF-4AA9-A283-21064057BC74","sessionId":"CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578220841704","userId":"054245059","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"054245059","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 10:41:04.594',
  'CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578220841704',
  'E67EE9A4-A93A-4B49-A9A0-160FEF3B93DD',
  '054245059',
  'TRANSACTION',
  50.0,
  'USD',
  'XPORTALStore',
  'APPROVED',
  CAST('{"score":0,"amount":50,"riskLevel":"LOW","requestId":"E67EE9A4-A93A-4B49-A9A0-160FEF3B93DD","sessionId":"CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578220841704","destinationId":"XPORTALStore","userId":"054245059","currencyCode":"USD","user":{"phoneUser":"054245059","isPhoneVerified":"VERIFIED","address":{},"userId":"054245059","email":"best_test@gmail.com","isEmailVerified":"VERIFIED"},"checkPointType":"TRANSACTION","transaction":{"transactionType":"DEPOSIT","amount":50,"time_stamp":1578220864521,"curType":"USD","shippingAddress":{"firstName":"Ama","lastName":"Joke","country":"FR","phoneNumber":"055555555","city":"Paris","postalCode":"654","addressLine1":"Zion Place","addressLine2":"Rooted","state":"March"},"authorizationResponse":{"verificationStatus":"verificationStatus","aVSResultCode":"aVSResultCode","acquirerResponseCode":"acquirerResponseCode","acquirerResponseMessage":"acquirerResponseMessage","declineReasonMessage":"declineReasonMessage","threeDSResponseStatus":"threeDSResponseStatus","declineReasonCode":"declineReasonCode","threeDSResponseECI":"threeDSResponseECI","threeDSResponseEnrolled":"threeDSResponseEnrolled"},"payment":{"bankAccountDetails":{},"paymentMethodId":"1000","fullNameOnCard":"Eli_az","paymentMethodType":"CREDIT_CARD","processor":"kljbhkjh","creditCardDetail":{"lastFourDigit":"6544","bin":"654654","cardId":"1000","cardToken":"kljhkho80p9","yearExpiryDate":2005,"monthExpiryDate":5}},"billingAddress":{"firstName":"Eli","lastName":"Az","country":"IL","phoneNumber":"05424504590","city":"Modii''n","postalCode":"99","addressLine1":"Bla bla 2/5","addressLine2":"","state":""},"additionalData":{"map":{}},"destinationId":"XPORTALStore","type":"TRANSACTION","user":{"phoneUser":"054245059","isPhoneVerified":"VERIFIED","address":{},"userId":"054245059","email":"best_test@gmail.com","isEmailVerified":"VERIFIED"}}}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 12:55:04.901',
  '16737877f105ba30_1578228901715',
  '99af5f0a-fffc-4114-9c78-21ec105bbec0',
  '051245059',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"99af5f0a-fffc-4114-9c78-21ec105bbec0","sessionId":"16737877f105ba30_1578228901715","userId":"051245059","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"051245059","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 14:50:23.581',
  'CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578235823362',
  '9378D1B8-FA19-4255-8B26-EA2C43153366',
  '050120+1',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"9378D1B8-FA19-4255-8B26-EA2C43153366","sessionId":"CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578235823362","userId":"050120+1","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"050120+1","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 10:41:52.665',
  'CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578220841704',
  '1880F647-E717-4E5F-B9FB-60B3E6E4CBA9',
  '054245059',
  'TRANSACTION',
  34.45,
  'USD',
  'XPORTALStore',
  'APPROVED',
  CAST('{"score":0,"amount":34.45,"riskLevel":"LOW","requestId":"1880F647-E717-4E5F-B9FB-60B3E6E4CBA9","sessionId":"CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578220841704","destinationId":"XPORTALStore","userId":"054245059","currencyCode":"USD","user":{"phoneUser":"054245059","isPhoneVerified":"VERIFIED","address":{},"userId":"054245059","email":"best_test@gmail.com","isEmailVerified":"VERIFIED"},"checkPointType":"TRANSACTION","transaction":{"transactionType":"DEPOSIT","amount":34.45,"time_stamp":1578220912604,"curType":"USD","shippingAddress":{"firstName":"Ama","lastName":"Joke","country":"FR","phoneNumber":"055555555","city":"Paris","postalCode":"654","addressLine1":"Zion Place","addressLine2":"Rooted","state":"March"},"authorizationResponse":{"verificationStatus":"verificationStatus","aVSResultCode":"aVSResultCode","acquirerResponseCode":"acquirerResponseCode","acquirerResponseMessage":"acquirerResponseMessage","declineReasonMessage":"declineReasonMessage","threeDSResponseStatus":"threeDSResponseStatus","declineReasonCode":"declineReasonCode","threeDSResponseECI":"threeDSResponseECI","threeDSResponseEnrolled":"threeDSResponseEnrolled"},"payment":{"bankAccountDetails":{},"paymentMethodId":"1000","fullNameOnCard":"Eli_az","paymentMethodType":"CREDIT_CARD","processor":"kljbhkjh","creditCardDetail":{"lastFourDigit":"6544","bin":"654654","cardId":"1000","cardToken":"kljhkho80p9","yearExpiryDate":2005,"monthExpiryDate":5}},"billingAddress":{"firstName":"Eli","lastName":"Az","country":"IL","phoneNumber":"05424504590","city":"Modii''n","postalCode":"99","addressLine1":"Bla bla 2/5","addressLine2":"","state":""},"additionalData":{"map":{}},"destinationId":"XPORTALStore","type":"TRANSACTION","user":{"phoneUser":"054245059","isPhoneVerified":"VERIFIED","address":{},"userId":"054245059","email":"best_test@gmail.com","isEmailVerified":"VERIFIED"}}}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'VERY_HIGH',
  1000.0,
  '2020-01-05 10:58:47.219',
  'F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578221926973',
  '98F4883C-6D0E-4B9E-9D0F-B1F7EFC74CD8',
  '054245059',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":1000,"riskLevel":"VERY_HIGH","requestId":"98F4883C-6D0E-4B9E-9D0F-B1F7EFC74CD8","sessionId":"F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578221926973","userId":"054245059","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"054245059","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 10:59:11.838',
  'F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578221926973',
  'F9292D34-9B91-45F3-9604-F9DE088EAFFB',
  '054245059',
  'TRANSACTION',
  50.0,
  'USD',
  'XPORTALStore',
  'APPROVED',
  CAST('{"score":0,"amount":50,"riskLevel":"LOW","requestId":"F9292D34-9B91-45F3-9604-F9DE088EAFFB","sessionId":"F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578221926973","destinationId":"XPORTALStore","userId":"054245059","currencyCode":"USD","user":{"phoneUser":"054245059","isPhoneVerified":"VERIFIED","address":{},"userId":"054245059","email":"best_test@gmail.com","isEmailVerified":"VERIFIED"},"checkPointType":"TRANSACTION","transaction":{"transactionType":"DEPOSIT","amount":50,"time_stamp":1578221951770,"curType":"USD","shippingAddress":{"firstName":"Ama","lastName":"Joke","country":"FR","phoneNumber":"055555555","city":"Paris","postalCode":"654","addressLine1":"Zion Place","addressLine2":"Rooted","state":"March"},"authorizationResponse":{"verificationStatus":"verificationStatus","aVSResultCode":"aVSResultCode","acquirerResponseCode":"acquirerResponseCode","acquirerResponseMessage":"acquirerResponseMessage","declineReasonMessage":"declineReasonMessage","threeDSResponseStatus":"threeDSResponseStatus","declineReasonCode":"declineReasonCode","threeDSResponseECI":"threeDSResponseECI","threeDSResponseEnrolled":"threeDSResponseEnrolled"},"payment":{"bankAccountDetails":{},"paymentMethodId":"1000","fullNameOnCard":"Eli_az","paymentMethodType":"CREDIT_CARD","processor":"kljbhkjh","creditCardDetail":{"lastFourDigit":"6544","bin":"654654","cardId":"1000","cardToken":"kljhkho80p9","yearExpiryDate":2005,"monthExpiryDate":5}},"billingAddress":{"firstName":"Eli","lastName":"Az","country":"IL","phoneNumber":"05424504590","city":"Modii''n","postalCode":"99","addressLine1":"Bla bla 2/5","addressLine2":"","state":""},"additionalData":{"map":{}},"destinationId":"XPORTALStore","type":"TRANSACTION","user":{"phoneUser":"054245059","isPhoneVerified":"VERIFIED","address":{},"userId":"054245059","email":"best_test@gmail.com","isEmailVerified":"VERIFIED"}}}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 12:42:23.670',
  'CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578228143505',
  'E6B15657-9FB4-4EA4-B011-348726778B2F',
  '050120+1',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"E6B15657-9FB4-4EA4-B011-348726778B2F","sessionId":"CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578228143505","userId":"050120+1","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"050120+1","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 14:50:10.630',
  'CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578235809741',
  'ED2326AF-D63E-405C-8B80-51B27ED06240',
  '050120+1',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"ED2326AF-D63E-405C-8B80-51B27ED06240","sessionId":"CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578235809741","userId":"050120+1","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"050120+1","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 15:22:18.801',
  '740683C6-B1C5-4298-969A-A9D4657C7896_1578237738586',
  '4C50D62B-DCAA-4D01-BEF1-828F67D48270',
  '050120+2',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"4C50D62B-DCAA-4D01-BEF1-828F67D48270","sessionId":"740683C6-B1C5-4298-969A-A9D4657C7896_1578237738586","userId":"050120+2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"050120+2","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'MEDIUM',
  248.0,
  '2020-01-05 12:43:01.251',
  'CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578228143505',
  '79544FA4-FDEF-4FF5-AD99-754B8A4F2E79',
  '050120+1',
  'TRANSACTION',
  34.45,
  'USD',
  'XPORTALStore',
  'APPROVED',
  CAST('{"score":248,"amount":34.45,"riskLevel":"MEDIUM","requestId":"79544FA4-FDEF-4FF5-AD99-754B8A4F2E79","sessionId":"CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578228143505","destinationId":"XPORTALStore","userId":"050120+1","currencyCode":"USD","user":{"phoneUser":"050120+1","isPhoneVerified":"VERIFIED","address":{},"userId":"050120+1","email":"best_test@gmail.com","isEmailVerified":"VERIFIED"},"checkPointType":"TRANSACTION","transaction":{"transactionType":"DEPOSIT","amount":34.45,"time_stamp":1578228181173,"curType":"USD","shippingAddress":{"firstName":"Ama","lastName":"Joke","country":"FR","phoneNumber":"055555555","city":"Paris","postalCode":"654","addressLine1":"Zion Place","addressLine2":"Rooted","state":"March"},"authorizationResponse":{"verificationStatus":"verificationStatus","aVSResultCode":"aVSResultCode","acquirerResponseCode":"acquirerResponseCode","acquirerResponseMessage":"acquirerResponseMessage","declineReasonMessage":"declineReasonMessage","threeDSResponseStatus":"threeDSResponseStatus","declineReasonCode":"declineReasonCode","threeDSResponseECI":"threeDSResponseECI","threeDSResponseEnrolled":"threeDSResponseEnrolled"},"payment":{"bankAccountDetails":{},"paymentMethodId":"1000","fullNameOnCard":"Eli_az","paymentMethodType":"CREDIT_CARD","processor":"kljbhkjh","creditCardDetail":{"lastFourDigit":"6544","bin":"654654","cardId":"1000","cardToken":"kljhkho80p9","yearExpiryDate":2005,"monthExpiryDate":5}},"billingAddress":{"firstName":"Eli","lastName":"Az","country":"IL","phoneNumber":"05424504590","city":"Modii''n","postalCode":"99","addressLine1":"Bla bla 2/5","addressLine2":"","state":""},"additionalData":{"map":{}},"destinationId":"XPORTALStore","type":"TRANSACTION","user":{"phoneUser":"050120+1","isPhoneVerified":"VERIFIED","address":{},"userId":"050120+1","email":"best_test@gmail.com","isEmailVerified":"VERIFIED"}}}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 12:43:51.449',
  'CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578228231234',
  '82737BE6-1AD3-46D1-9442-5EDB00C16459',
  '050120+1',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"82737BE6-1AD3-46D1-9442-5EDB00C16459","sessionId":"CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578228231234","userId":"050120+1","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"050120+1","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 12:44:05.987',
  'CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578228231234',
  'C2D2A77C-F773-4614-A8DF-5CDC980D3A33',
  '050120+1',
  'ADD_PAYMENT_METHOD',
  NULL,
  NULL,
  NULL,
  'APPROVED',
  CAST('{"score":0,"riskLevel":"LOW","requestId":"C2D2A77C-F773-4614-A8DF-5CDC980D3A33","paymentMethod":{"payment":{"bankAccountDetails":{"bsb":"34636363","number":"4884488","fullName":"Eli"},"paymentMethodId":"11","fullNameOnCard":"!1","processor":"Aa","creditCardDetail":{"lastFourDigit":"123","bin":"!","cardId":"11","cardToken":"qq","yearExpiryDate":12,"monthExpiryDate":13}},"billingAddress":{"firstName":"a","lastName":"11","country":"a","phoneNumber":"1","city":"!","postalCode":"aa","addressLine1":"11","addressLine2":"!","state":"*"},"additionalData":{"map":{}},"type":"ADD_PAYMENT_METHOD","user":{"phoneUser":"1","isPhoneVerified":"NOT_VERIFIED","address":{},"userId":"050120+1","email":"1","isEmailVerified":"UNKNOWN"}},"sessionId":"CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578228231234","userId":"050120+1","user":{"phoneUser":"1","isPhoneVerified":"NOT_VERIFIED","address":{},"userId":"050120+1","email":"1","isEmailVerified":"UNKNOWN"},"checkPointType":"ADD_PAYMENT_METHOD"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'MEDIUM',
  248.0,
  '2020-01-05 12:44:19.337',
  'CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578228231234',
  'C272C22A-E171-4F19-BC9A-3E5B9B63CC6A',
  '050120+1',
  'TRANSACTION',
  55.45,
  'USD',
  'XPORTALStore',
  'APPROVED',
  CAST('{"score":248,"amount":55.45,"riskLevel":"MEDIUM","requestId":"C272C22A-E171-4F19-BC9A-3E5B9B63CC6A","sessionId":"CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578228231234","destinationId":"XPORTALStore","userId":"050120+1","currencyCode":"USD","user":{"phoneUser":"050120+1","isPhoneVerified":"VERIFIED","address":{},"userId":"050120+1","email":"best_test@gmail.com","isEmailVerified":"VERIFIED"},"checkPointType":"TRANSACTION","transaction":{"transactionType":"DEPOSIT","amount":55.45,"time_stamp":1578228259276,"curType":"USD","shippingAddress":{"firstName":"Ama","lastName":"Joke","country":"FR","phoneNumber":"055555555","city":"Paris","postalCode":"654","addressLine1":"Zion Place","addressLine2":"Rooted","state":"March"},"authorizationResponse":{"verificationStatus":"verificationStatus","aVSResultCode":"aVSResultCode","acquirerResponseCode":"acquirerResponseCode","acquirerResponseMessage":"acquirerResponseMessage","declineReasonMessage":"declineReasonMessage","threeDSResponseStatus":"threeDSResponseStatus","declineReasonCode":"declineReasonCode","threeDSResponseECI":"threeDSResponseECI","threeDSResponseEnrolled":"threeDSResponseEnrolled"},"payment":{"bankAccountDetails":{},"paymentMethodId":"1000","fullNameOnCard":"Eli_az","paymentMethodType":"CREDIT_CARD","processor":"kljbhkjh","creditCardDetail":{"lastFourDigit":"6544","bin":"654654","cardId":"1000","cardToken":"kljhkho80p9","yearExpiryDate":2005,"monthExpiryDate":5}},"billingAddress":{"firstName":"Eli","lastName":"Az","country":"IL","phoneNumber":"05424504590","city":"Modii''n","postalCode":"99","addressLine1":"Bla bla 2/5","addressLine2":"","state":""},"additionalData":{"map":{}},"destinationId":"XPORTALStore","type":"TRANSACTION","user":{"phoneUser":"050120+1","isPhoneVerified":"VERIFIED","address":{},"userId":"050120+1","email":"best_test@gmail.com","isEmailVerified":"VERIFIED"}}}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 12:46:42.522',
  'CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578228401908',
  '69D13070-DE9C-4499-824D-0432D63BCF6B',
  '050120+1',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"69D13070-DE9C-4499-824D-0432D63BCF6B","sessionId":"CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578228401908","userId":"050120+1","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"050120+1","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 12:53:23.681',
  'ad2d0b6b3b583708_1578228801928',
  '6db1c1e5-2450-48c5-8e0e-e1f6c578ab92',
  '050120+1',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"6db1c1e5-2450-48c5-8e0e-e1f6c578ab92","sessionId":"ad2d0b6b3b583708_1578228801928","userId":"050120+1","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"050120+1","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 12:54:42.344',
  '16737877f105ba30_1578228878153',
  '4b8c5e72-b3bb-4d6d-a505-379139e18e7a',
  '2',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"4b8c5e72-b3bb-4d6d-a505-379139e18e7a","sessionId":"16737877f105ba30_1578228878153","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 14:50:29.218',
  'CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578235823362',
  '08ECB247-F9A6-4C69-A27E-625C3225BD07',
  '050120+1',
  'ADD_PAYMENT_METHOD',
  NULL,
  NULL,
  NULL,
  'APPROVED',
  CAST('{"score":0,"riskLevel":"LOW","requestId":"08ECB247-F9A6-4C69-A27E-625C3225BD07","paymentMethod":{"payment":{"bankAccountDetails":{"bsb":"34636363","number":"4884488","fullName":"Eli"},"paymentMethodId":"11","fullNameOnCard":"!1","processor":"Aa","creditCardDetail":{"lastFourDigit":"123","bin":"!","cardId":"11","cardToken":"qq","yearExpiryDate":12,"monthExpiryDate":13}},"billingAddress":{"firstName":"a","lastName":"11","country":"a","phoneNumber":"1","city":"!","postalCode":"aa","addressLine1":"11","addressLine2":"!","state":"*"},"additionalData":{"map":{}},"type":"ADD_PAYMENT_METHOD","user":{"phoneUser":"1","isPhoneVerified":"NOT_VERIFIED","address":{},"userId":"050120+1","email":"1","isEmailVerified":"UNKNOWN"}},"sessionId":"CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578235823362","userId":"050120+1","user":{"phoneUser":"1","isPhoneVerified":"NOT_VERIFIED","address":{},"userId":"050120+1","email":"1","isEmailVerified":"UNKNOWN"},"checkPointType":"ADD_PAYMENT_METHOD"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 14:50:37.735',
  'CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578235823362',
  '02F66ADB-3E5C-42CE-A777-8B8FE3C38B40',
  '050120+1',
  'TRANSACTION',
  55.45,
  'USD',
  'XPORTALStore',
  'APPROVED',
  CAST('{"score":0,"amount":55.45,"riskLevel":"LOW","requestId":"02F66ADB-3E5C-42CE-A777-8B8FE3C38B40","sessionId":"CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578235823362","destinationId":"XPORTALStore","userId":"050120+1","currencyCode":"USD","user":{"phoneUser":"050120+1","isPhoneVerified":"VERIFIED","address":{},"userId":"050120+1","email":"best_test@gmail.com","isEmailVerified":"VERIFIED"},"checkPointType":"TRANSACTION","transaction":{"transactionType":"DEPOSIT","amount":55.45,"time_stamp":1578235837673,"curType":"USD","shippingAddress":{"firstName":"Ama","lastName":"Joke","country":"FR","phoneNumber":"055555555","city":"Paris","postalCode":"654","addressLine1":"Zion Place","addressLine2":"Rooted","state":"March"},"authorizationResponse":{"verificationStatus":"verificationStatus","aVSResultCode":"aVSResultCode","acquirerResponseCode":"acquirerResponseCode","acquirerResponseMessage":"acquirerResponseMessage","declineReasonMessage":"declineReasonMessage","threeDSResponseStatus":"threeDSResponseStatus","declineReasonCode":"declineReasonCode","threeDSResponseECI":"threeDSResponseECI","threeDSResponseEnrolled":"threeDSResponseEnrolled"},"payment":{"bankAccountDetails":{},"paymentMethodId":"1000","fullNameOnCard":"Eli_az","paymentMethodType":"CREDIT_CARD","processor":"kljbhkjh","creditCardDetail":{"lastFourDigit":"6544","bin":"654654","cardId":"1000","cardToken":"kljhkho80p9","yearExpiryDate":2005,"monthExpiryDate":5}},"billingAddress":{"firstName":"Eli","lastName":"Az","country":"IL","phoneNumber":"05424504590","city":"Modii''n","postalCode":"99","addressLine1":"Bla bla 2/5","addressLine2":"","state":""},"additionalData":{"map":{}},"destinationId":"XPORTALStore","type":"TRANSACTION","user":{"phoneUser":"050120+1","isPhoneVerified":"VERIFIED","address":{},"userId":"050120+1","email":"best_test@gmail.com","isEmailVerified":"VERIFIED"}}}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 15:09:02.344',
  'CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578236941498',
  '0E2B555B-B994-47D0-8B32-0D7468B7E9C0',
  '45646',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"0E2B555B-B994-47D0-8B32-0D7468B7E9C0","sessionId":"CE46AF34-E1E7-4861-B7E6-2E0E93E7788A_1578236941498","userId":"45646","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"45646","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 15:21:48.481',
  '740683C6-B1C5-4298-969A-A9D4657C7896_1578237708369',
  'F33CFFC3-975B-42AD-93C9-0194A274EEAF',
  '050120+2',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"F33CFFC3-975B-42AD-93C9-0194A274EEAF","sessionId":"740683C6-B1C5-4298-969A-A9D4657C7896_1578237708369","userId":"050120+2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"050120+2","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 15:21:58.637',
  '740683C6-B1C5-4298-969A-A9D4657C7896_1578237708369',
  '364CBB4C-C77F-40BA-BACB-ADD32905F787',
  '050120+2',
  'ADD_PAYMENT_METHOD',
  NULL,
  NULL,
  NULL,
  'APPROVED',
  CAST('{"score":0,"riskLevel":"LOW","requestId":"364CBB4C-C77F-40BA-BACB-ADD32905F787","paymentMethod":{"payment":{"bankAccountDetails":{"bsb":"34636363","number":"4884488","fullName":"Eli"},"paymentMethodId":"11","fullNameOnCard":"!1","processor":"Aa","creditCardDetail":{"lastFourDigit":"123","bin":"!","cardId":"11","cardToken":"qq","yearExpiryDate":12,"monthExpiryDate":13}},"billingAddress":{"firstName":"a","lastName":"11","country":"a","phoneNumber":"1","city":"!","postalCode":"aa","addressLine1":"11","addressLine2":"!","state":"*"},"additionalData":{"map":{}},"type":"ADD_PAYMENT_METHOD","user":{"phoneUser":"1","isPhoneVerified":"NOT_VERIFIED","address":{},"userId":"050120+2","email":"1","isEmailVerified":"UNKNOWN"}},"sessionId":"740683C6-B1C5-4298-969A-A9D4657C7896_1578237708369","userId":"050120+2","user":{"phoneUser":"1","isPhoneVerified":"NOT_VERIFIED","address":{},"userId":"050120+2","email":"1","isEmailVerified":"UNKNOWN"},"checkPointType":"ADD_PAYMENT_METHOD"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'MEDIUM',
  248.0,
  '2020-01-05 15:22:26.633',
  '740683C6-B1C5-4298-969A-A9D4657C7896_1578237738586',
  '454A2B25-27F1-4703-8C85-AAD98022DA54',
  '050120+2',
  'TRANSACTION',
  55.45,
  'USD',
  'XPORTALStore',
  'APPROVED',
  CAST('{"score":248,"amount":55.45,"riskLevel":"MEDIUM","requestId":"454A2B25-27F1-4703-8C85-AAD98022DA54","sessionId":"740683C6-B1C5-4298-969A-A9D4657C7896_1578237738586","destinationId":"XPORTALStore","userId":"050120+2","currencyCode":"USD","user":{"phoneUser":"050120+2","isPhoneVerified":"VERIFIED","address":{},"userId":"050120+2","email":"best_test@gmail.com","isEmailVerified":"VERIFIED"},"checkPointType":"TRANSACTION","transaction":{"transactionType":"DEPOSIT","amount":55.45,"time_stamp":1578237746577,"curType":"USD","shippingAddress":{"firstName":"Ama","lastName":"Joke","country":"FR","phoneNumber":"055555555","city":"Paris","postalCode":"654","addressLine1":"Zion Place","addressLine2":"Rooted","state":"March"},"authorizationResponse":{"verificationStatus":"verificationStatus","aVSResultCode":"aVSResultCode","acquirerResponseCode":"acquirerResponseCode","acquirerResponseMessage":"acquirerResponseMessage","declineReasonMessage":"declineReasonMessage","threeDSResponseStatus":"threeDSResponseStatus","declineReasonCode":"declineReasonCode","threeDSResponseECI":"threeDSResponseECI","threeDSResponseEnrolled":"threeDSResponseEnrolled"},"payment":{"bankAccountDetails":{},"paymentMethodId":"1000","fullNameOnCard":"Eli_az","paymentMethodType":"CREDIT_CARD","processor":"kljbhkjh","creditCardDetail":{"lastFourDigit":"6544","bin":"654654","cardId":"1000","cardToken":"kljhkho80p9","yearExpiryDate":2005,"monthExpiryDate":5}},"billingAddress":{"firstName":"Eli","lastName":"Az","country":"IL","phoneNumber":"05424504590","city":"Modii''n","postalCode":"99","addressLine1":"Bla bla 2/5","addressLine2":"","state":""},"additionalData":{"map":{}},"destinationId":"XPORTALStore","type":"TRANSACTION","user":{"phoneUser":"050120+2","isPhoneVerified":"VERIFIED","address":{},"userId":"050120+2","email":"best_test@gmail.com","isEmailVerified":"VERIFIED"}}}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 15:33:53.078',
  '740683C6-B1C5-4298-969A-A9D4657C7896_1578238432933',
  '71BA28C3-E1C1-4D93-ACEF-3B27B99F01FE',
  '050120+3',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"71BA28C3-E1C1-4D93-ACEF-3B27B99F01FE","sessionId":"740683C6-B1C5-4298-969A-A9D4657C7896_1578238432933","userId":"050120+3","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"050120+3","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 15:34:02.593',
  '740683C6-B1C5-4298-969A-A9D4657C7896_1578238432933',
  'AE9B4D19-56C7-4CFB-8639-E58F9AF80DFD',
  '050120+3',
  'ADD_PAYMENT_METHOD',
  NULL,
  NULL,
  NULL,
  'APPROVED',
  CAST('{"score":0,"riskLevel":"LOW","requestId":"AE9B4D19-56C7-4CFB-8639-E58F9AF80DFD","paymentMethod":{"payment":{"bankAccountDetails":{"bsb":"34636363","number":"4884488","fullName":"Eli"},"paymentMethodId":"11","fullNameOnCard":"!1","processor":"Aa","creditCardDetail":{"lastFourDigit":"123","bin":"!","cardId":"11","cardToken":"qq","yearExpiryDate":12,"monthExpiryDate":13}},"billingAddress":{"firstName":"a","lastName":"11","country":"a","phoneNumber":"1","city":"!","postalCode":"aa","addressLine1":"11","addressLine2":"!","state":"*"},"additionalData":{"map":{}},"type":"ADD_PAYMENT_METHOD","user":{"phoneUser":"1","isPhoneVerified":"NOT_VERIFIED","address":{},"userId":"050120+3","email":"1","isEmailVerified":"UNKNOWN"}},"sessionId":"740683C6-B1C5-4298-969A-A9D4657C7896_1578238432933","userId":"050120+3","user":{"phoneUser":"1","isPhoneVerified":"NOT_VERIFIED","address":{},"userId":"050120+3","email":"1","isEmailVerified":"UNKNOWN"},"checkPointType":"ADD_PAYMENT_METHOD"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 15:34:34.967',
  '740683C6-B1C5-4298-969A-A9D4657C7896_1578238474730',
  'BDFF6DF0-6BAB-4910-9CCE-85A08A074B05',
  '050120+3',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"BDFF6DF0-6BAB-4910-9CCE-85A08A074B05","sessionId":"740683C6-B1C5-4298-969A-A9D4657C7896_1578238474730","userId":"050120+3","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"050120+3","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-06 10:09:23.421',
  'F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578305362050',
  'D6B118DA-3733-478E-95F2-64C8E2E73E60',
  '2',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"D6B118DA-3733-478E-95F2-64C8E2E73E60","sessionId":"F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578305362050","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-06 10:40:11.083',
  'F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578307209751',
  'B2506B1A-B5E1-4811-960F-529D238B1E89',
  '2',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"B2506B1A-B5E1-4811-960F-529D238B1E89","sessionId":"F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578307209751","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'MEDIUM',
  248.0,
  '2020-01-05 15:34:40.105',
  '740683C6-B1C5-4298-969A-A9D4657C7896_1578238474730',
  '86409B82-3C34-4F55-ACC7-ECF5C5F980FB',
  '050120+3',
  'TRANSACTION',
  85.99,
  'USD',
  'XPORTALStore',
  'APPROVED',
  CAST('{"score":248,"amount":85.99,"riskLevel":"MEDIUM","requestId":"86409B82-3C34-4F55-ACC7-ECF5C5F980FB","sessionId":"740683C6-B1C5-4298-969A-A9D4657C7896_1578238474730","destinationId":"XPORTALStore","userId":"050120+3","currencyCode":"USD","user":{"phoneUser":"050120+3","isPhoneVerified":"VERIFIED","address":{},"userId":"050120+3","email":"best_test@gmail.com","isEmailVerified":"VERIFIED"},"checkPointType":"TRANSACTION","transaction":{"transactionType":"DEPOSIT","amount":85.99,"time_stamp":1578238480030,"curType":"USD","shippingAddress":{"firstName":"Ama","lastName":"Joke","country":"FR","phoneNumber":"055555555","city":"Paris","postalCode":"654","addressLine1":"Zion Place","addressLine2":"Rooted","state":"March"},"authorizationResponse":{"verificationStatus":"verificationStatus","aVSResultCode":"aVSResultCode","acquirerResponseCode":"acquirerResponseCode","acquirerResponseMessage":"acquirerResponseMessage","declineReasonMessage":"declineReasonMessage","threeDSResponseStatus":"threeDSResponseStatus","declineReasonCode":"declineReasonCode","threeDSResponseECI":"threeDSResponseECI","threeDSResponseEnrolled":"threeDSResponseEnrolled"},"payment":{"bankAccountDetails":{},"paymentMethodId":"1000","fullNameOnCard":"Eli_az","paymentMethodType":"CREDIT_CARD","processor":"kljbhkjh","creditCardDetail":{"lastFourDigit":"6544","bin":"654654","cardId":"1000","cardToken":"kljhkho80p9","yearExpiryDate":2005,"monthExpiryDate":5}},"billingAddress":{"firstName":"Eli","lastName":"Az","country":"IL","phoneNumber":"05424504590","city":"Modii''n","postalCode":"99","addressLine1":"Bla bla 2/5","addressLine2":"","state":""},"additionalData":{"map":{}},"destinationId":"XPORTALStore","type":"TRANSACTION","user":{"phoneUser":"050120+3","isPhoneVerified":"VERIFIED","address":{},"userId":"050120+3","email":"best_test@gmail.com","isEmailVerified":"VERIFIED"}}}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 15:43:37.433',
  '740683C6-B1C5-4298-969A-A9D4657C7896_1578239016869',
  '06FC55CA-7501-4D7A-B0CC-42DDBD965FEC',
  '740683C6-B1C5-4298-969A-A9D4657C7896',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"06FC55CA-7501-4D7A-B0CC-42DDBD965FEC","sessionId":"740683C6-B1C5-4298-969A-A9D4657C7896_1578239016869","userId":"740683C6-B1C5-4298-969A-A9D4657C7896","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"740683C6-B1C5-4298-969A-A9D4657C7896","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 15:43:58.909',
  '740683C6-B1C5-4298-969A-A9D4657C7896_1578239016869',
  '0EBBA8C2-371F-4DF0-BA32-7D00BEDC69EF',
  '740683C6-B1C5-4298-969A-A9D4657C7896',
  'GENERAL',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"0EBBA8C2-371F-4DF0-BA32-7D00BEDC69EF","sessionId":"740683C6-B1C5-4298-969A-A9D4657C7896_1578239016869","userId":"740683C6-B1C5-4298-969A-A9D4657C7896","checkPointType":"GENERAL"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-05 15:52:18.967',
  '740683C6-B1C5-4298-969A-A9D4657C7896_1578239016869',
  '0B56859C-9B9D-4EBF-BBA6-3FDF4F619259',
  '740683C6-B1C5-4298-969A-A9D4657C7896',
  'GENERAL',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"0B56859C-9B9D-4EBF-BBA6-3FDF4F619259","sessionId":"740683C6-B1C5-4298-969A-A9D4657C7896_1578239016869","userId":"740683C6-B1C5-4298-969A-A9D4657C7896","checkPointType":"GENERAL"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-06 07:06:04.345',
  'F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578294363263',
  '53AC8FC6-CC99-453F-92A6-A84B55C88BDD',
  '054245059',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"53AC8FC6-CC99-453F-92A6-A84B55C88BDD","sessionId":"F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578294363263","userId":"054245059","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"054245059","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-06 07:13:33.008',
  'F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578294812622',
  '7AFB25B2-BAFB-49E4-B368-BAFE79EE414D',
  '2',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"7AFB25B2-BAFB-49E4-B368-BAFE79EE414D","sessionId":"F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578294812622","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-06 07:14:03.652',
  'F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578294843264',
  'F1B4BB64-346C-4FEB-A3FF-057AA7F76561',
  '2',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"F1B4BB64-346C-4FEB-A3FF-057AA7F76561","sessionId":"F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578294843264","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-06 07:38:35.835',
  'F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578296314898',
  'CC7D52AB-AF33-4D2D-8BE4-4DC0FE6A8F60',
  '2',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"CC7D52AB-AF33-4D2D-8BE4-4DC0FE6A8F60","sessionId":"F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578296314898","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-06 10:17:50.820',
  'F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578305869878',
  '39926F38-2AA2-456B-A3A6-2B521AD10D6D',
  '2',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"39926F38-2AA2-456B-A3A6-2B521AD10D6D","sessionId":"F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578305869878","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-06 10:43:38.943',
  'F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578307417613',
  'A67D46AD-F43B-4447-A831-09047249A72D',
  '2',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"A67D46AD-F43B-4447-A831-09047249A72D","sessionId":"F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578307417613","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-06 10:44:22.512',
  'F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578307460916',
  '96A53A0E-004C-4A7F-B76C-564BE3A9DB63',
  '2',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"96A53A0E-004C-4A7F-B76C-564BE3A9DB63","sessionId":"F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578307460916","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'VERY_HIGH',
  1000.0,
  '2020-01-06 07:39:54.447',
  'F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578296314898',
  '49A62076-B72D-4789-B297-AB230A8D2A5F',
  '2',
  'TRANSACTION',
  50.0,
  'USD',
  'XPORTALStore',
  'APPROVED',
  CAST('{"score":1000,"amount":50,"riskLevel":"VERY_HIGH","requestId":"49A62076-B72D-4789-B297-AB230A8D2A5F","sessionId":"F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578296314898","destinationId":"XPORTALStore","userId":"2","currencyCode":"USD","user":{"phoneUser":"2","isPhoneVerified":"VERIFIED","address":{},"userId":"2","email":"best_test@gmail.com","isEmailVerified":"VERIFIED"},"checkPointType":"TRANSACTION","transaction":{"transactionType":"DEPOSIT","amount":50,"time_stamp":1578296394358,"curType":"USD","shippingAddress":{"firstName":"Ama","lastName":"Joke","country":"FR","phoneNumber":"055555555","city":"Paris","postalCode":"654","addressLine1":"Zion Place","addressLine2":"Rooted","state":"March"},"authorizationResponse":{"verificationStatus":"verificationStatus","aVSResultCode":"aVSResultCode","acquirerResponseCode":"acquirerResponseCode","acquirerResponseMessage":"acquirerResponseMessage","declineReasonMessage":"declineReasonMessage","threeDSResponseStatus":"threeDSResponseStatus","declineReasonCode":"declineReasonCode","threeDSResponseECI":"threeDSResponseECI","threeDSResponseEnrolled":"threeDSResponseEnrolled"},"payment":{"bankAccountDetails":{},"paymentMethodId":"1000","fullNameOnCard":"Eli_az","paymentMethodType":"CREDIT_CARD","processor":"kljbhkjh","creditCardDetail":{"lastFourDigit":"6544","bin":"654654","cardId":"1000","cardToken":"kljhkho80p9","yearExpiryDate":2005,"monthExpiryDate":5}},"billingAddress":{"firstName":"Eli","lastName":"Az","country":"IL","phoneNumber":"05424504590","city":"Modii''n","postalCode":"99","addressLine1":"Bla bla 2/5","addressLine2":"","state":""},"additionalData":{"map":{}},"destinationId":"XPORTALStore","type":"TRANSACTION","user":{"phoneUser":"2","isPhoneVerified":"VERIFIED","address":{},"userId":"2","email":"best_test@gmail.com","isEmailVerified":"VERIFIED"}}}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-06 07:51:41.549',
  'F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578297100209',
  '907B0159-1C46-4285-A126-6CEFEAE10AB8',
  '2',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"907B0159-1C46-4285-A126-6CEFEAE10AB8","sessionId":"F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578297100209","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-06 08:25:50.964',
  'F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578299149492',
  'BABE1DF1-988C-4192-BBB9-CCA5712521B1',
  '2',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"BABE1DF1-988C-4192-BBB9-CCA5712521B1","sessionId":"F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578299149492","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-06 08:26:43.560',
  'F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578299203068',
  '01E11F22-B609-4E0E-86C3-267B83A62A97',
  '054245059',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"01E11F22-B609-4E0E-86C3-267B83A62A97","sessionId":"F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578299203068","userId":"054245059","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"054245059","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-06 08:26:58.739',
  'F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578299203068',
  '384DA555-4EB2-452B-A3E9-CE4EE63DAB75',
  '054245059',
  'TRANSACTION',
  11.99,
  'USD',
  'XPORTALStore',
  'APPROVED',
  CAST('{"score":0,"amount":11.99,"riskLevel":"LOW","requestId":"384DA555-4EB2-452B-A3E9-CE4EE63DAB75","sessionId":"F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578299203068","destinationId":"XPORTALStore","userId":"054245059","currencyCode":"USD","user":{"phoneUser":"054245059","isPhoneVerified":"VERIFIED","address":{},"userId":"054245059","email":"best_test@gmail.com","isEmailVerified":"VERIFIED"},"checkPointType":"TRANSACTION","transaction":{"transactionType":"DEPOSIT","amount":11.99,"time_stamp":1578299218683,"curType":"USD","shippingAddress":{"firstName":"Ama","lastName":"Joke","country":"FR","phoneNumber":"055555555","city":"Paris","postalCode":"654","addressLine1":"Zion Place","addressLine2":"Rooted","state":"March"},"authorizationResponse":{"verificationStatus":"verificationStatus","aVSResultCode":"aVSResultCode","acquirerResponseCode":"acquirerResponseCode","acquirerResponseMessage":"acquirerResponseMessage","declineReasonMessage":"declineReasonMessage","threeDSResponseStatus":"threeDSResponseStatus","declineReasonCode":"declineReasonCode","threeDSResponseECI":"threeDSResponseECI","threeDSResponseEnrolled":"threeDSResponseEnrolled"},"payment":{"bankAccountDetails":{},"paymentMethodId":"1000","fullNameOnCard":"Eli_az","paymentMethodType":"CREDIT_CARD","processor":"kljbhkjh","creditCardDetail":{"lastFourDigit":"6544","bin":"654654","cardId":"1000","cardToken":"kljhkho80p9","yearExpiryDate":2005,"monthExpiryDate":5}},"billingAddress":{"firstName":"Eli","lastName":"Az","country":"IL","phoneNumber":"05424504590","city":"Modii''n","postalCode":"99","addressLine1":"Bla bla 2/5","addressLine2":"","state":""},"additionalData":{"map":{}},"destinationId":"XPORTALStore","type":"TRANSACTION","user":{"phoneUser":"054245059","isPhoneVerified":"VERIFIED","address":{},"userId":"054245059","email":"best_test@gmail.com","isEmailVerified":"VERIFIED"}}}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-06 09:01:08.195',
  'F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578301250234',
  '4954D9DF-0A42-4E88-9D02-06F7F2F605DA',
  '054245059',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"4954D9DF-0A42-4E88-9D02-06F7F2F605DA","sessionId":"F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578301250234","userId":"054245059","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"054245059","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-06 09:04:09.523',
  'F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578301448684',
  '6F92B22F-60EF-441C-AEAD-68BDCF11E898',
  '2',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"6F92B22F-60EF-441C-AEAD-68BDCF11E898","sessionId":"F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578301448684","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-06 09:05:36.974',
  'F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578301534663',
  'BE7D0C7C-5DBE-4B49-A39E-D271E2F31BBA',
  '2',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"BE7D0C7C-5DBE-4B49-A39E-D271E2F31BBA","sessionId":"F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578301534663","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-06 09:39:45.233',
  'F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578303583170',
  'BB5A16C3-09FE-4F34-A607-8E3AC98FBC19',
  '2',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"BB5A16C3-09FE-4F34-A607-8E3AC98FBC19","sessionId":"F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578303583170","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-06 09:59:54.524',
  'F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578304792884',
  '4513ECC0-C0C2-47D0-818D-81A3FD378EEC',
  '2',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"4513ECC0-C0C2-47D0-818D-81A3FD378EEC","sessionId":"F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578304792884","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-06 10:44:47.320',
  'F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578307486829',
  'F23F8DC6-753F-4213-8560-DB6FE7CB29FC',
  '2',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"F23F8DC6-753F-4213-8560-DB6FE7CB29FC","sessionId":"F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578307486829","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-06 10:45:16.392',
  'F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578307516006',
  '5138A4D9-E606-4A5D-A789-037901556E44',
  '2',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"5138A4D9-E606-4A5D-A789-037901556E44","sessionId":"F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578307516006","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-06 15:51:05.705',
  '0ff38bbb7d6e1123_1578325863461',
  '197437cc-cc8a-4cec-9d84-298eae23f311',
  '+105424686011',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"197437cc-cc8a-4cec-9d84-298eae23f311","sessionId":"0ff38bbb7d6e1123_1578325863461","userId":"+105424686011","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"+105424686011","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-06 15:51:11.681',
  '0ff38bbb7d6e1123_1578325863461',
  '07a47e8f-57d1-4fcd-9a0a-e9df82104b78',
  '+105424686011',
  'GENERAL',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"07a47e8f-57d1-4fcd-9a0a-e9df82104b78","sessionId":"0ff38bbb7d6e1123_1578325863461","userId":"+105424686011","checkPointType":"GENERAL"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-07 07:58:40.362',
  'F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578383919226',
  '766F18C9-ECB2-43D4-9618-9081EFD57872',
  '2',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"766F18C9-ECB2-43D4-9618-9081EFD57872","sessionId":"F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578383919226","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-07 08:13:20.757',
  'F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578384799766',
  'FD2649B3-C9BE-4450-9240-180C71115126',
  '2',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"FD2649B3-C9BE-4450-9240-180C71115126","sessionId":"F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578384799766","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-07 08:15:16.020',
  'F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578384915135',
  '091E1FC9-85E6-4F45-BCAE-3570F193C2A1',
  '2',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"091E1FC9-85E6-4F45-BCAE-3570F193C2A1","sessionId":"F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578384915135","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'VERY_HIGH',
  1000.0,
  '2020-01-07 08:17:19.491',
  '2E32C2AD-28E0-41B7-A2A6-D1EC0E094807_1578385038590',
  '922067FF-A12C-4336-A5FB-3E61FBC23ADA',
  '2',
  'REGISTER',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":1000,"riskLevel":"VERY_HIGH","requestId":"922067FF-A12C-4336-A5FB-3E61FBC23ADA","sessionId":"2E32C2AD-28E0-41B7-A2A6-D1EC0E094807_1578385038590","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"REGISTER"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'VERY_HIGH',
  1000.0,
  '2020-01-07 08:18:14.110',
  '2E32C2AD-28E0-41B7-A2A6-D1EC0E094807_1578385038590',
  '0E0D2498-BE16-4F75-8D11-D47CC66129ED',
  '2',
  'ADD_PAYMENT_METHOD',
  NULL,
  NULL,
  NULL,
  'APPROVED',
  CAST('{"score":1000,"riskLevel":"VERY_HIGH","requestId":"0E0D2498-BE16-4F75-8D11-D47CC66129ED","paymentMethod":{"payment":{"bankAccountDetails":{"bsb":"34636363","number":"4884488","fullName":"Eli"},"paymentMethodId":"11","fullNameOnCard":"!1","processor":"Aa","creditCardDetail":{"lastFourDigit":"123","bin":"!","cardId":"11","cardToken":"qq","yearExpiryDate":12,"monthExpiryDate":13}},"billingAddress":{"firstName":"a","lastName":"11","country":"a","phoneNumber":"1","city":"!","postalCode":"aa","addressLine1":"11","addressLine2":"!","state":"*"},"additionalData":{"map":{}},"type":"ADD_PAYMENT_METHOD","user":{"phoneUser":"1","isPhoneVerified":"NOT_VERIFIED","address":{},"userId":"2","email":"1","isEmailVerified":"UNKNOWN"}},"sessionId":"2E32C2AD-28E0-41B7-A2A6-D1EC0E094807_1578385038590","userId":"2","user":{"phoneUser":"1","isPhoneVerified":"NOT_VERIFIED","address":{},"userId":"2","email":"1","isEmailVerified":"UNKNOWN"},"checkPointType":"ADD_PAYMENT_METHOD"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-07 08:18:44.751',
  'F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578385123728',
  'B65508A3-47D2-4FE3-858F-1A7760A46EA4',
  '2',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"B65508A3-47D2-4FE3-858F-1A7760A46EA4","sessionId":"F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578385123728","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-07 08:19:58.533',
  'F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578385197689',
  '0037281A-408A-4327-BD00-5BB17E9D5E5C',
  '2',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"0037281A-408A-4327-BD00-5BB17E9D5E5C","sessionId":"F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578385197689","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-07 08:24:59.745',
  'F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578385498869',
  'E21609E4-D33A-4CA9-9C30-DA0B61AE1D33',
  '2',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"E21609E4-D33A-4CA9-9C30-DA0B61AE1D33","sessionId":"F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578385498869","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);

INSERT INTO risk_events
(
  severity,
  score,
  TIMESTAMP,
  sessionid,
  requestid,
  userid,
  CHECKPOINT,
  amount,
  currency,
  destination,
  status,
  JSON
)
VALUES
(
  'LOW',
  0.0,
  '2020-01-07 14:04:54.962',
  'F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578405893509',
  '8203EC6D-5118-4176-BFFD-3D096332940B',
  '2',
  'LOGIN',
  NULL,
  NULL,
  NULL,
  NULL,
  CAST('{"score":0,"riskLevel":"LOW","requestId":"8203EC6D-5118-4176-BFFD-3D096332940B","sessionId":"F9D9ECF8-03CA-4AD3-9DAE-3BB2DCC2A67F_1578405893509","userId":"2","user":{"isPhoneVerified":"UNKNOWN","address":{},"userId":"2","isEmailVerified":"UNKNOWN"},"checkPointType":"LOGIN"}' AS JSON)
);


COMMIT;

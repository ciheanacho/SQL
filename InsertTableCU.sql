Set foreign_key_checks= 0;
INSERT INTO membership VALUES(323589,'2016-08-02');
INSERT INTO membership VALUES(443251, '2015-05-25');
INSERT INTO membership VALUES(263189, '2014-07-20');
INSERT INTO membership VALUES(833993, '2013-11-30');
INSERT INTO membership VALUES(571085, '2017-06-29');
INSERT INTO membership VALUES(923589, '2014-08-23');
INSERT INTO membership VALUES(279850, '2015-10-31');

INSERT INTO cuaccount VALUES (100024, 1, 'Savings', 1003.23, 571085);
INSERT INTO cuaccount VALUES (100025, 2, 'Checking', 999.35, 571085);
INSERT INTO cuaccount VALUES (100026, 1, 'Savings', 12358.97, 443251);
INSERT INTO cuaccount VALUES (100027, 2, 'Courtesy Pay', 157.89, 443251);
INSERT INTO cuaccount VALUES (100028, 3, 'Special Savings', 24781.36, 443251);
INSERT INTO cuaccount VALUES (100029, 1, 'Savings', 5147.99, 923589);
INSERT INTO cuaccount VALUES (100030, 2, 'Checking', 502.48, 923589);
INSERT INTO cuaccount VALUES (100031, 3, 'IRA', 15784.84, 923589);
INSERT INTO cuaccount VALUES (100032, 1, 'Savings', 3418.65, 833933);
INSERT INTO cuaccount VALUES (100033, 2, 'Checking', 987.45, 833933);
INSERT INTO cuaccount VALUES (100034, 1, 'Savings', 34007.99, 279850);
INSERT INTO cuaccount VALUES (100035, 2, 'Checking', 2681.66, 279850);
INSERT INTO cuaccount VALUES (100036, 1, 'Savings', 25.00, 263189);
INSERT INTO cuaccount VALUES (100037, 1, 'Savings', 6000.57,323589);
INSERT INTO cuaccount VALUES (100038, 2, 'Checking', 103.16, 323589);
      
INSERT INTO cumember VALUES(259841175,'Smith','Anthony', '1021 Bear Lake Way','Tampa','FL','33608','770-251-8850','Smithy25@yahoo.com',571085);
INSERT INTO cumember VALUES(358857745, 'Smith','Jessica', '1021 Bear Lake Way','Tampa', 'FL', '33608', '678-842-0158','SmithJess94@gmail.com', 571085);
INSERT INTO cumember VALUES(897448069, 'Jefferson', 'Markeise', '8954 Heatwave Ave, APT 17', 'Tampa', 'FL', '33601', '813-451-8125','ThisMarkiese@gmail.com', 443251);
INSERT INTO cumember VALUES(321587451, 'James', 'Shannon', '2241 Lenox Blvd, Apt 2', 'Tampa', 'FL', '33605', '850-268-4520','ShannonIsGreat27@yahoo.com', 923589);
INSERT INTO cumember VALUES(741854239, 'McCarthy', 'Terian', '1598 CrabApple Lane', 'Tampa', 'FL', '33604', '850-417-4512','TCarthy1987@ymail.com', 833933);
INSERT INTO cumember VALUES(541023974, 'Ashley', 'Jermaine', '415 Henderson Ct, Apt 7', 'Tampa', 'FL', '33601', '678-541-8722','Ash_Pass778@gmail.com', 833933);
INSERT INTO cumember VALUES(879541230, 'Cauley', 'Patricia', '779 Juniper Hill Road', 'Tampa', 'FL', '33603', '813-501-7745', 'PattyPat67@aol.com', 279850);
INSERT INTO cumember VALUES(028957501, 'Cauley', 'Richard', '779 Juniper Hill Road', 'Tampa', 'FL', '33603', '813-841-7023', 'RichyRocks1965@aol.com', 279850);
INSERT INTO cumember VALUES(120387845, 'Harris', 'Tawanda', '834 Roadmap Parkway, Apt 2015', 'Tampa', 'FL', '33604', '404-874-1368', 'THarris88@gmail.com', 263189);

INSERT INTO application VALUES(889415, 'New Auto Loan', 'New Auto Loan', 26000.00, '2017-03-19', 323589);
INSERT INTO application VALUES(899105, 'Signature Loan', 'Student Tuition', 15500.00, '2017-07-27', 323589);
INSERT INTO application VALUES(771876, 'Signature Loan', 'New  Roof', 7000.00, '2015-08-24', 443251);
INSERT INTO application VALUES(773299, 'Payday Loan' , 'Birthday Present', 1000.00, '2016-01-29', 443251);
INSERT INTO application VALUES(791218, 'Payday Loan' , 'Family Emergency', 500.00, '2016-03-18', 443251);
INSERT INTO application VALUES(615527, 'Signature Loan' , 'Vehicle Repair', 780.00, '2015-02-24', 279850);
INSERT INTO application VALUES(653398, 'Used Auto Loan' , 'Used Auto Loan', 19500.00, '2015-09-02', 279850);
INSERT INTO application VALUES(656288, 'Used Auto Loan', 'Used Auto Loan', 21790.00, '2015-10-02', 279850);
INSERT INTO application VALUES(656801, 'Used Auto Loan' , 'Used Auto Loan', 16575.00, '2015-10-15', 279850);
INSERT INTO application VALUES(656812, 'Signature Loan', 'Christmas', 1500.00, '2015-11-15', 279850);
INSERT INTO application VALUES(443182, 'New Auto Loan' , 'New Auto Loan', 29500.00, '2014-03-27', 833933);
INSERT INTO application VALUES(445899, 'New Auto Loan', 'New Auto Loan', 27250.00, '2014-04-05', 833933);
INSERT INTO application VALUES (445879, 'Signature Loan', 'Personal', 12000.00, '2014-04-05', 833933);
INSERT INTO application VALUES (687951, 'Used Auto Loan' , 'Used Auto Loan', 9500.00, '2016-05-01', 923589);
INSERT INTO application VALUES (169811, 'SignatureCollateral','Wedding',20000.00,'2014-06-27',923589);
INSERT INTO application VALUES (717981, 'SignatureCollateral','New Engine', 30000.00,'2018-07-24', 571085);

INSERT INTO loan VALUES(135, 'SignatureCollateral', 15982.66, 'Current', '2016 Cadillac Escalade',923589,169811);
INSERT INTO loan VALUES(267, 'SignatureCollateral', 1778.35, 'Current', '2013 Nissan Rogue',571085, 717981);
INSERT INTO loan VALUES(333, 'Signature Loan', 10119.22, 'Current', null ,833933,445879);
INSERT INTO loan VALUES(377, 'New Auto Loan', 25227.18, 'Current', '2015 CHEVROLET MALIBU' ,833933,443182);
INSERT INTO loan VALUES(325, 'Signature Loan', 18774.32, 'Current', null ,833933,445899);
INSERT INTO loan VALUES(411, 'Used Auto Loan', 15422.80, 'Past Due', '2015 INFINITI QX80' ,279850, 656801);
INSERT INTO loan VALUES(425, 'Signatuure Loan', 0.00 ,'Closed', null ,279850, 656812);
INSERT INTO loan VALUES(516, 'Signatuure Loan', 996.18 ,'Past Due', null ,443251, 771876);
INSERT INTO loan VALUES(189, 'Signatuure Loan', 6897.32 ,'Current', null ,323589, 899105);
INSERT INTO loan VALUES(465, 'New Auto Loan', 0.00 ,'Past Due', '2017 Honda Pilot' ,323589, 889415);




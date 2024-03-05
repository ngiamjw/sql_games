-- SQLite
SELECT description FROM crime_scene_report WHERE date=20180115 AND type='murder' AND city ='SQL City';
--Security footage shows that there were 2 witnesses. The first witness lives at the last house on "Northwestern Dr". The second witness, named Annabel, lives somewhere on "Franklin Ave".

SELECT * FROM person WHERE address_street_name='Franklin Ave' AND name LIKE "Annabel%";
--16371	Annabel Miller	490173	103	Franklin Ave	318771143

SELECT * FROM person WHERE address_street_name='Northwestern Dr';
--people who live on northwestern dr

SELECT transcript FROM interview WHERE person_id=16371;
--I saw the murder happen, and I recognized the killer from my gym when I was working out last week on January the 9th.

SELECT transcript FROM interview WHERE person_id IN (SELECT id FROM person WHERE address_street_name='Northwestern Dr');
--I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" bag. The membership number on the bag started with "48Z". Only gold members have those bags. The man got into a car with a plate that included "H42W".

SELECT * FROM get_fit_now_check_in WHERE check_in_date=20180109 AND membership_id LIKE "48Z%";
-- 48Z7A	20180109	1600	1730
-- 48Z55	20180109	1530	1700

SELECT * FROM get_fit_now_member WHERE membership_status ='gold' AND id IN (SELECT membership_id FROM get_fit_now_check_in WHERE check_in_date=20180109 AND membership_id LIKE "48Z%");
-- 48Z55	67318	Jeremy Bowers	20160101	gold
-- 48Z7A	28819	Joe Germuska	20160305	gold

SELECT * FROM drivers_license WHERE plate_number LIKE "%H42W%" AND gender='male';
-- 423327	30	70	brown	brown	male	0H42W2	Chevrolet	Spark LS
-- 664760	21	71	black	black	male	4H42WR	Nissan	Altima

SELECT * FROM facebook_event_checkin WHERE date=20180109;

SELECT * FROM person WHERE id IN (SELECT person_id FROM get_fit_now_member WHERE membership_status ='gold' AND id IN (SELECT membership_id FROM get_fit_now_check_in WHERE check_in_date=20180109 AND membership_id LIKE "48Z%"));
-- 28819	Joe Germuska	173289	111	Fisk Rd	138909730
-- 67318	Jeremy Bowers	423327	530	Washington Pl, Apt 3A	871539279

SELECT * FROM income WHERE ssn='138909730';
--871539279	10500

-- AND person_id=67318 OR person_id=288

SELECT * FROM solution;
-- Notes
-- This is for ESX ONLY and purely example
-- You must create a job for ambulance job with 'off' in front of the exact name and
-- create the same amount of grade numbers as you have with that job.
-- Below is an example of off duty for a job named 'ambulance' with 4 grades:
INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('offambulance', 'Ambulance', 1);

INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	('offambulance', 0, 'offambulance', 'Off Duty', 50, '{}', '{}'),
	('offambulance', 1, 'offambulance', 'Off Duty', 50, '{}', '{}'),
	('offambulance', 2, 'offambulance', 'Off Duty', 50, '{}', '{}'),
	('offambulance', 3, 'offambulance', 'Off Duty', 50, '{}', '{}');

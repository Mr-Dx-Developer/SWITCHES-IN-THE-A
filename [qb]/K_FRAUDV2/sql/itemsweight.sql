INSERT IGNORE INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
    ('generator', 'Generator', 1, 0, 1),
    ('laptop2', 'Laptop #2', 1, 0, 1),
    ('whiteslip', 'White Slip', 10, 0, 1),
    ('skimmer', 'Skimmer', 1, 0, 1),
    ('clonedcard', 'Cloned Card', 10, 0, 1),
    ('blankcard', 'Blank Card', 10, 0, 1),
    ('forgedcheck', 'Forged Check', 10, 0, 1),
    ('infousb', 'Info Usb', 10, 0, 1),
    ('stolencard', 'Stolencard', 10, 0, 1),
    ('printer', 'Printer', 1, 0, 1);

INSERT IGNORE INTO `jobs` (`name`, `label`, `whitelisted`) VALUES 
    ('scammer', 'Scammer', 1);

INSERT IGNORE INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES 
    ('scammer', 0, 'scammer', 'Scammer', 0, '{}', '{}');

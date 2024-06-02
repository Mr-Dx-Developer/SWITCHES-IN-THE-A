CREATE TABLE `jcjobs` (
  `id` int(11) NOT NULL,
  `identifier` varchar(100) NOT NULL,
  `job` varchar(100) NOT NULL,
  `grade` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `jcjobs`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `jcjobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
COMMIT;

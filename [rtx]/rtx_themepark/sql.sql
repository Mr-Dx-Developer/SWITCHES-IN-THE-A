CREATE TABLE `owned_themepark` (
  `id` int(11) NOT NULL,
  `identifier` varchar(500) COLLATE utf8mb4_bin NOT NULL,
  `balance` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

ALTER TABLE `owned_themepark`
  ADD PRIMARY KEY (`id`),
  ADD KEY `identifier` (`identifier`(191));

ALTER TABLE `owned_themepark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
COMMIT;bank_accounts
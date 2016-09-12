CREATE TABLE `room` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `canvas_width` int(10) unsigned NOT NULL,
  `canvas_height` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `stroke` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `room_id` int(10) unsigned NOT NULL,
  `width` tinyint(3) unsigned NOT NULL,
  `red` tinyint(3) unsigned NOT NULL,
  `green` tinyint(3) unsigned NOT NULL,
  `blue` tinyint(3) unsigned NOT NULL,
  `alpha` float unsigned NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `room_id` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `point` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `stroke_id` int(10) unsigned NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `room_id` (`stroke_id`)
);

CREATE TABLE `csrf_token` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `token` varbinary(128) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY (`token`)
);
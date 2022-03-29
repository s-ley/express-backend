CREATE TABLE `user` (
    `id` INT AUTO_INCREMENT,
    `email` VARCHAR(255) NOT NULL UNIQUE,
    `password_hash` VARCHAR(64) NOT NULL,
    `name` VARCHAR(64) NOT NULL,
    `lastName` VARCHAR(64) NOT NULL,
    `phone` VARCHAR(20) NOT NULL,
    `deleted` BIT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
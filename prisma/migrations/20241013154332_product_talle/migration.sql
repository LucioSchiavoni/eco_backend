/*
  Warnings:

  - You are about to drop the column `productId` on the `Talle` table. All the data in the column will be lost.
  - Added the required column `stock` to the `Product` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `Talle` DROP FOREIGN KEY `Talle_productId_fkey`;

-- AlterTable
ALTER TABLE `Product` ADD COLUMN `stock` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `Talle` DROP COLUMN `productId`;

-- CreateTable
CREATE TABLE `ProductoTalle` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `productoId` INTEGER NOT NULL,
    `talleId` INTEGER NOT NULL,
    `stock` INTEGER NOT NULL,

    UNIQUE INDEX `ProductoTalle_productoId_talleId_key`(`productoId`, `talleId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `ProductoTalle` ADD CONSTRAINT `ProductoTalle_productoId_fkey` FOREIGN KEY (`productoId`) REFERENCES `Product`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ProductoTalle` ADD CONSTRAINT `ProductoTalle_talleId_fkey` FOREIGN KEY (`talleId`) REFERENCES `Talle`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

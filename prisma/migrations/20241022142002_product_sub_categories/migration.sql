/*
  Warnings:

  - You are about to drop the `ProductoTalle` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Talle` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `ProductoTalle` DROP FOREIGN KEY `ProductoTalle_productoId_fkey`;

-- DropForeignKey
ALTER TABLE `ProductoTalle` DROP FOREIGN KEY `ProductoTalle_talleId_fkey`;

-- DropTable
DROP TABLE `ProductoTalle`;

-- DropTable
DROP TABLE `Talle`;

-- CreateTable
CREATE TABLE `_ProductSubCategories` (
    `A` INTEGER NOT NULL,
    `B` INTEGER NOT NULL,

    UNIQUE INDEX `_ProductSubCategories_AB_unique`(`A`, `B`),
    INDEX `_ProductSubCategories_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `_ProductSubCategories` ADD CONSTRAINT `_ProductSubCategories_A_fkey` FOREIGN KEY (`A`) REFERENCES `Product`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_ProductSubCategories` ADD CONSTRAINT `_ProductSubCategories_B_fkey` FOREIGN KEY (`B`) REFERENCES `SubCategories`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

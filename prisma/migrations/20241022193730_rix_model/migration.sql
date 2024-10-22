/*
  Warnings:

  - You are about to drop the `Categories` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ProductCategories` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `SubCategories` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_ProductCategories` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_ProductSubCategories` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `categoryId` to the `Product` table without a default value. This is not possible if the table is not empty.
  - Added the required column `subCategoryId` to the `Product` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `ProductCategories` DROP FOREIGN KEY `ProductCategories_categoryId_fkey`;

-- DropForeignKey
ALTER TABLE `ProductCategories` DROP FOREIGN KEY `ProductCategories_productId_fkey`;

-- DropForeignKey
ALTER TABLE `SubCategories` DROP FOREIGN KEY `SubCategories_categoryId_fkey`;

-- DropForeignKey
ALTER TABLE `_ProductCategories` DROP FOREIGN KEY `_ProductCategories_A_fkey`;

-- DropForeignKey
ALTER TABLE `_ProductCategories` DROP FOREIGN KEY `_ProductCategories_B_fkey`;

-- DropForeignKey
ALTER TABLE `_ProductSubCategories` DROP FOREIGN KEY `_ProductSubCategories_A_fkey`;

-- DropForeignKey
ALTER TABLE `_ProductSubCategories` DROP FOREIGN KEY `_ProductSubCategories_B_fkey`;

-- AlterTable
ALTER TABLE `Product` ADD COLUMN `categoryId` INTEGER NOT NULL,
    ADD COLUMN `subCategoryId` INTEGER NOT NULL;

-- DropTable
DROP TABLE `Categories`;

-- DropTable
DROP TABLE `ProductCategories`;

-- DropTable
DROP TABLE `SubCategories`;

-- DropTable
DROP TABLE `_ProductCategories`;

-- DropTable
DROP TABLE `_ProductSubCategories`;

-- CreateTable
CREATE TABLE `Category` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `SubCategory` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Product` ADD CONSTRAINT `Product_categoryId_fkey` FOREIGN KEY (`categoryId`) REFERENCES `Category`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Product` ADD CONSTRAINT `Product_subCategoryId_fkey` FOREIGN KEY (`subCategoryId`) REFERENCES `SubCategory`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

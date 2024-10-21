-- DropForeignKey
ALTER TABLE `SubCategories` DROP FOREIGN KEY `SubCategories_categoryId_fkey`;

-- AddForeignKey
ALTER TABLE `SubCategories` ADD CONSTRAINT `SubCategories_categoryId_fkey` FOREIGN KEY (`categoryId`) REFERENCES `Categories`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

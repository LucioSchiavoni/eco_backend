-- DropForeignKey
ALTER TABLE `ProductCategories` DROP FOREIGN KEY `ProductCategories_categoryId_fkey`;

-- DropForeignKey
ALTER TABLE `ProductCategories` DROP FOREIGN KEY `ProductCategories_productId_fkey`;

-- DropForeignKey
ALTER TABLE `ProductoTalle` DROP FOREIGN KEY `ProductoTalle_productoId_fkey`;

-- DropForeignKey
ALTER TABLE `ProductoTalle` DROP FOREIGN KEY `ProductoTalle_talleId_fkey`;

-- AddForeignKey
ALTER TABLE `ProductoTalle` ADD CONSTRAINT `ProductoTalle_productoId_fkey` FOREIGN KEY (`productoId`) REFERENCES `Product`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ProductoTalle` ADD CONSTRAINT `ProductoTalle_talleId_fkey` FOREIGN KEY (`talleId`) REFERENCES `Talle`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ProductCategories` ADD CONSTRAINT `ProductCategories_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `Product`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ProductCategories` ADD CONSTRAINT `ProductCategories_categoryId_fkey` FOREIGN KEY (`categoryId`) REFERENCES `Categories`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

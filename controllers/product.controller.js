import prisma from "../config/db.js";
import dotenv from 'dotenv'
dotenv.config()




export const createProduct = async(req,res) => {
    const {name, price, categoryIds, sizeIds } =  req.body
    const file = req.file;
    const uploadFile = file ? `${process.env.URL_UPLOAD}/upload/${file.filename}` : '';

    const categoriesData = categoryIds.map((categoryId) => ({
    category: {
        connect: { id: categoryId }, 
    },
    }));

        const sizeData = sizeIds.map((sizeId) => ({
    talle: {
        connect: { id: sizeId }, 
    },
    }));

    try {
        const newProduct = await prisma.product.create({
            data:{
                name: name,
                price: price,
                img: file ? uploadFile : null,
                productCategories:{
                    create:categoriesData
                },
                talle:{
                    create: sizeData
                }
            }
        }) 
        return {success: "Nuevo producto creado"}
       
    } catch (error) {
        console.log(error)
    }
}



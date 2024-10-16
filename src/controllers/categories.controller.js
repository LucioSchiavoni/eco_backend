import prisma from "../config/db.js";






export const createCategories = async(req,res) => {

    const {name} = req.body;
    try {
        const exist = await prisma.categories.findFirst({
            where:{
                name: name
            }
        })
        if(exist){
        const message = { message: "Esta categoria ya existe"}
        return res.json(message)
        }

        const result = await prisma.categories.create({
            data:{
                name: name
            }
        })
        const message = {success: "Se agrego una nueva categoria"}
        return res.json(message)
    } catch (error) {
     console.log(error)
    }
}

export const getCategories = async(req,res) => {
    try {
        const result = await prisma.categories.findMany()
        return res.json(result)
    } catch (error) {
        console.log(error)
    }
}


export const createSize = async(req,res) => {

    const  {size, productId} = req.body;
    try {
        
        const result = await prisma.talle.create({
            data:{
                size:size,
                productId: productId
            }
        })

        const message = { message: "Se agregaron los talles"}
        return res.json(message)
    } catch (error) {
        console.log(error)
    }
}
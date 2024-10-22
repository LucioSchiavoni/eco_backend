import prisma from "../config/db.js";
import dotenv from 'dotenv'
dotenv.config()




export const createProduct = async (req, res) => {
  const { name, price, category, subCategory, stock } = req.body;
  const file = req.file;
  const uploadFile = file ? `${process.env.URL_UPLOAD}/upload/${file.filename}` : ''; 

  try {
      const newProduct = await prisma.product.create({
          data: {
              name: name,
              price: price,
              stock: parseInt(stock),
              img: file ? uploadFile : null,
              categoryId: parseInt(category),
              subCategoryId: parseInt(subCategory), 
          }
      });

      return res.status(201).json({ success: 'Nuevo producto creado', product: newProduct });
  } catch (error) {
      return res.status(500).json({ error: 'Error al crear el producto', details: error.message });
  }
};




export const getProducts = async (req, res) => {
  try {
    const products = await prisma.product.findMany({
      include:{
        category:true,
        subCategory:true,
      }
    })
    return res.status(200).json(products);
  } catch (error) {
    console.error(error);
    return res.status(500).json({ error: 'Error al obtener los productos' });
  }
}


export const getProductById = async (req, res) => { 
  const { id } = req.params;
  try {
    const product = await prisma.product.findUnique({
      where: {
        id: parseInt(id),
      }
    });
    if (!product) {
      return res.status(404).json({ error: 'Producto no encontrado' });
    }
    return res.status(200).json(product);
  } catch (error) {
    console.error(error);
    return res.status(500).json({ error: 'Error al obtener el producto' });
  }
}
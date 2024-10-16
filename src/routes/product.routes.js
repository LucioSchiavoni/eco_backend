import { Router } from "express";
import upload from "../middlewares/uploadFile.js";
import { createProduct, getProductById, getProducts } from "../controllers/product.controller.js";


const productRouter = Router();


productRouter.post("/product" ,upload.single('product[img]'), createProduct)
productRouter.get("/product", getProducts)
productRouter.get("/product/:id", getProductById)


export default productRouter;
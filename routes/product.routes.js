import { Router } from "express";
import upload from "../middlewares/uploadFile.js";
import { createProduct, getProducts } from "../controllers/product.controller.js";


const productRouter = Router();


productRouter.post("/product" ,upload.single('img'), createProduct)
// notasRouter.get("/allNotas", getNotas)
// notasRouter.get("/post/:id", getNotasById)
productRouter.get("/product", getProducts)



export default productRouter;
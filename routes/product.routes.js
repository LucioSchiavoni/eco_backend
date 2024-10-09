import { Router } from "express";
import upload from "../middleware/uploadFile.js";
import { createProduct } from "../controllers/product.controller.js";


const productRouter = Router();


productRouter.post("/product" ,upload.single('img'), createProduct)
// notasRouter.get("/allNotas", getNotas)
// notasRouter.get("/post/:id", getNotasById)



export default productRouter;
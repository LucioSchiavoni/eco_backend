import { Router } from "express";
import { createCategories, getCategories, createSize } from "../controllers/categories.controller.js";



const categoriesRouter = Router();


categoriesRouter.post("/newCategories" , createCategories)
categoriesRouter.get("/categories" , getCategories)
categoriesRouter.post("/size", createSize)

export default categoriesRouter;
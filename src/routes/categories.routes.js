import { Router } from "express";
import { createCategories, getCategories, createSize, createSubCategories, getSubCategories } from "../controllers/categories.controller.js";



const categoriesRouter = Router();


categoriesRouter.post("/newCategories" , createCategories)
categoriesRouter.get("/categories" , getCategories)
categoriesRouter.post("/size", createSize)
categoriesRouter.post("/subCategories", createSubCategories)
categoriesRouter.get("/subCategories/:categoryId", getSubCategories)
categoriesRouter.get("/categories", getCategories)


export default categoriesRouter;
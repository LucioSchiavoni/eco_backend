import { Router } from "express";
import { authService, changePasswordService, loginService, registerService } from "../controllers/user.controller.js";


const userRouter = Router()

userRouter.post("/login", loginService)
userRouter.get("/auth", authService)
userRouter.post("/register", registerService)
userRouter.put("/changePassword/:id", changePasswordService)


export default userRouter;
import express from 'express'
import cors from 'cors'
import userRouter from './routes/user.routes.js'
import dotenv from 'dotenv'
import categoriesRouter from './routes/categories.routes.js'
import productRouter from './routes/product.routes.js'


dotenv.config()


const app = express()

const PORT = process.env.PORT


const opcionesCors = {
    origin: process.env.FRONTEND_URL_DEV,
    credentials: true 
};

app.use(cors(opcionesCors))
app.use(express.urlencoded({extended: true}));
app.use(express.json());
app.use("/upload", express.static("src/middlewares/upload"))
app.use("/", userRouter)
app.use("/", categoriesRouter)
app.use("/", productRouter)

app.get("/", (req,res) => {
    res.json("Index")
})

app.listen(PORT, () =>  { 
    console.log(`Servidor corriendo en http://localhost:${PORT}`)
})
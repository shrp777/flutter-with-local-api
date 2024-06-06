import express from "express";
import cors from "cors";

const app = express();
app.use(cors());

const fruits = [
  { name: "Pomme", id: 1 },
  { name: "Poire", id: 2 },
  { name: "Ananas", id: 3 },
  { name: "Cerise", id: 4 },
  { name: "Fraise", id: 5 },
  { name: "Orange", id: 6 },
  { name: "Citron", id: 7 },
  { name: "Banane", id: 8 },
  { name: "Kiwi", id: 9 },
  { name: "Melon", id: 10 },
  { name: "Mandarine", id: 11 },
  { name: "Pastèque", id: 12 },
  { name: "Abricot", id: 13 },
  { name: "Clémentine", id: 14 },
  { name: "Framboise", id: 15 },
  { name: "Mangue", id: 16 },
  { name: "Pêche", id: 17 },
  { name: "Litchi", id: 18 },
  { name: "Prune", id: 19 },
  { name: "Groseille", id: 20 }
];

app.get("/fruits", (req, res) => {
  res.json(fruits);
});

app.listen(3333);

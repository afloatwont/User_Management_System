import express, { json } from 'express';

const app = express();
const PORT = process.env.PORT || 3000;

app.use(json());

let users = [];
let nextId = 1;

app.post('/users', (req, res) => {
  try {
    const { name, email, phone } = req.body;

    if (!name || !email) {
      return res.status(400).json({
        error: 'Name and email are required fields'
      });
    }

    const newUser = {
      id: nextId++,
      name,
      email,
      phone: phone || '',
      createdAt: new Date().toISOString()
    };

    users.push(newUser);
    res.status(201).json(newUser);
  } catch (error) {
    res.status(500).json({
      error: 'Internal server error',
      message: error.message
    });
  }
});

app.get('/users', (req, res) => {
  res.json(users);
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
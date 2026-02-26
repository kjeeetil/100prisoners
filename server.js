const express = require('express');
const path = require('path');
const app = express();

const port = process.env.PORT || 8080;

// Serve static files in the current directory
app.use(express.static(__dirname));

// Explicit route to serve main.html on root
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'main.html'));
});

app.listen(port, () => {
    console.log(`100 Prisoners Visualizer is listening on port ${port}`);
});

const express = require("express");
const fs = require("fs");
const path = require("path");
const bcrypt = require("bcryptjs");
const cors = require("cors");

const app = express();
app.use(express.json());
app.use(cors());

const DATA_DIR = path.join(__dirname, "data");

if (!fs.existsSync(DATA_DIR)) {
  fs.mkdirSync(DATA_DIR);
}

// Helper functions
const loadCommunity = (id) => {
  const filePath = path.join(DATA_DIR, `${id}.json`);
  if (!fs.existsSync(filePath)) return null;
  return JSON.parse(fs.readFileSync(filePath));
};

const saveCommunity = (id, data) => {
  const filePath = path.join(DATA_DIR, `${id}.json`);
  fs.writeFileSync(filePath, JSON.stringify(data, null, 2));
};

// -------------------------------------------
// 🟩 NEW: Get all communities (list all JSON files)
// -------------------------------------------
app.get("/api/community/all", (req, res) => {
  console.log("ALL ROUTE HIT");
  try {
    const files = fs.readdirSync(DATA_DIR).filter(f => f.endsWith(".json"));

    const communities = files.map(file => {
      const filePath = path.join(DATA_DIR, file);
      return JSON.parse(fs.readFileSync(filePath));
    });

    return res.json(communities);
  } catch (err) {
    console.error("Error loading communities:", err);
    return res.status(500).json({ error: "Failed to load communities" });
  }
});

// -------------------------------------------
// Create community
// -------------------------------------------
app.post("/api/community/create", async (req, res) => {
  const { communityName, description, adminName, adminMajorRole, password } = req.body;

  if (
    !communityName?.trim() ||
    !adminName?.trim() ||
    !password?.trim() ||
    !adminMajorRole?.trim()
  ) {
    return res.status(400).json({
      error: "Missing required fields (communityName, adminName, adminMajorRole, password)"
    });
  }

  const cleanName = communityName.trim();
  const id = cleanName.toLowerCase().replace(/ /g, "_");

  const filePath = path.join(DATA_DIR, `${id}.json`);
  if (fs.existsSync(filePath))
    return res.status(400).json({ error: "Community already exists" });

  const passwordHash = await bcrypt.hash(password, 10);

  const community = {
    communityName: cleanName,
    description,
    admin: adminName.trim(),
    adminMajorRole: adminMajorRole.trim(),
    members: [],
    groupLimit: 20,
    access: {
      isLocked: true,
      passwordHash
    }
  };

  saveCommunity(id, community);

  res.json({ message: "Community created", id });
});

// -------------------------------------------
// Join Community
// -------------------------------------------
app.post("/api/community/:id/join", (req, res) => {
  const id = req.params.id;
  const { memberName, majorRole } = req.body;

  const community = loadCommunity(id);
  if (!community)
    return res.status(404).json({ error: "Community not found" });

  if (!majorRole?.trim()) {
    return res.status(400).json({ error: "Major role is required" });
  }

  if (community.members.length >= community.groupLimit) {
    return res.status(400).json({ error: "Community is full" });
  }

  community.members.push({
    name: memberName.trim(),
    majorRole: majorRole.trim(),
    joinedAt: new Date().toISOString()
  });

  saveCommunity(id, community);
  res.json({ message: "Joined community successfully" });
});

// -------------------------------------------
// EDIT community (Password-Protected)
// -------------------------------------------
app.post("/api/community/:id/edit", async (req, res) => {
  const id = req.params.id;
  const { password, update } = req.body;

  const community = loadCommunity(id);
  if (!community)
    return res.status(404).json({ error: "Community not found" });

  const match = await bcrypt.compare(password, community.access.passwordHash);
  if (!match)
    return res.status(403).json({ error: "Incorrect password" });

  Object.assign(community, update);

  saveCommunity(id, community);
  res.json({ message: "Community updated successfully" });
});

// -------------------------------------------
// 🟥 LAST ROUTE – Load by ID (VERY IMPORTANT)
// -------------------------------------------
app.get("/api/community/:id", (req, res) => {
  const id = req.params.id;
  const community = loadCommunity(id);

  if (!community)
    return res.status(404).json({ error: "Community not found" });

  res.json(community);
});

const PORT = 5000;
app.listen(PORT, () => {
  console.log(`Server running at http://localhost:${PORT}`);
});

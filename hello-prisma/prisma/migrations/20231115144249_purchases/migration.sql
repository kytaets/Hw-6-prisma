-- CreateTable
CREATE TABLE "Purchases" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "amount" REAL NOT NULL,
    "date" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "gamerId" INTEGER NOT NULL,
    CONSTRAINT "Purchases_gamerId_fkey" FOREIGN KEY ("gamerId") REFERENCES "Profile" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Achievements" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "title" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "GamerAchievements" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT
);
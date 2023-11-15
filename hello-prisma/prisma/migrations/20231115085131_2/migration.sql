/*
  Warnings:

  - You are about to drop the column `authorId` on the `Game` table. All the data in the column will be lost.
  - Added the required column `gamerId` to the `Game` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Game" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "title" TEXT NOT NULL,
    "game_hours" INTEGER,
    "played" BOOLEAN NOT NULL DEFAULT false,
    "gamerId" INTEGER NOT NULL,
    CONSTRAINT "Game_gamerId_fkey" FOREIGN KEY ("gamerId") REFERENCES "Profile" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Game" ("game_hours", "id", "played", "title") SELECT "game_hours", "id", "played", "title" FROM "Game";
DROP TABLE "Game";
ALTER TABLE "new_Game" RENAME TO "Game";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;

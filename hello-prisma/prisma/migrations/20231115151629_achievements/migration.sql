/*
  Warnings:

  - You are about to drop the column `game_hours` on the `Game` table. All the data in the column will be lost.
  - The primary key for the `GamerAchievements` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `GamerAchievements` table. All the data in the column will be lost.
  - You are about to drop the column `phone_number` on the `PersonalInformation` table. All the data in the column will be lost.
  - Added the required column `achievementId` to the `GamerAchievements` table without a default value. This is not possible if the table is not empty.
  - Added the required column `gamerId` to the `GamerAchievements` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Game" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "title" TEXT NOT NULL,
    "gameHours" INTEGER,
    "played" BOOLEAN NOT NULL DEFAULT false,
    "gamerId" INTEGER NOT NULL,
    CONSTRAINT "Game_gamerId_fkey" FOREIGN KEY ("gamerId") REFERENCES "Profile" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Game" ("gamerId", "id", "played", "title") SELECT "gamerId", "id", "played", "title" FROM "Game";
DROP TABLE "Game";
ALTER TABLE "new_Game" RENAME TO "Game";
CREATE TABLE "new_GamerAchievements" (
    "gamerId" INTEGER NOT NULL,
    "achievementId" INTEGER NOT NULL,

    PRIMARY KEY ("gamerId", "achievementId"),
    CONSTRAINT "GamerAchievements_gamerId_fkey" FOREIGN KEY ("gamerId") REFERENCES "Profile" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "GamerAchievements_achievementId_fkey" FOREIGN KEY ("achievementId") REFERENCES "Achievements" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
DROP TABLE "GamerAchievements";
ALTER TABLE "new_GamerAchievements" RENAME TO "GamerAchievements";
CREATE TABLE "new_PersonalInformation" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT,
    "phoneNumber" TEXT,
    "country" TEXT,
    "city" TEXT,
    "profileId" INTEGER NOT NULL,
    CONSTRAINT "PersonalInformation_profileId_fkey" FOREIGN KEY ("profileId") REFERENCES "Profile" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_PersonalInformation" ("city", "country", "id", "name", "profileId") SELECT "city", "country", "id", "name", "profileId" FROM "PersonalInformation";
DROP TABLE "PersonalInformation";
ALTER TABLE "new_PersonalInformation" RENAME TO "PersonalInformation";
CREATE UNIQUE INDEX "PersonalInformation_profileId_key" ON "PersonalInformation"("profileId");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;

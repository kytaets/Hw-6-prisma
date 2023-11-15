/*
  Warnings:

  - You are about to drop the column `name` on the `Profile` table. All the data in the column will be lost.

*/
-- CreateTable
CREATE TABLE "PersonalInformation" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT,
    "phone_number" INTEGER,
    "country" TEXT,
    "city" TEXT
);

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Profile" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "email" TEXT NOT NULL,
    "nickname" TEXT NOT NULL
);
INSERT INTO "new_Profile" ("email", "id", "nickname") SELECT "email", "id", "nickname" FROM "Profile";
DROP TABLE "Profile";
ALTER TABLE "new_Profile" RENAME TO "Profile";
CREATE UNIQUE INDEX "Profile_email_key" ON "Profile"("email");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;

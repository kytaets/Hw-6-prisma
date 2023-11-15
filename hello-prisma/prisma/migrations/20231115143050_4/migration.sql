-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_PersonalInformation" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT,
    "phone_number" TEXT,
    "country" TEXT,
    "city" TEXT,
    "profileId" INTEGER NOT NULL,
    CONSTRAINT "PersonalInformation_profileId_fkey" FOREIGN KEY ("profileId") REFERENCES "Profile" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_PersonalInformation" ("city", "country", "id", "name", "phone_number", "profileId") SELECT "city", "country", "id", "name", "phone_number", "profileId" FROM "PersonalInformation";
DROP TABLE "PersonalInformation";
ALTER TABLE "new_PersonalInformation" RENAME TO "PersonalInformation";
CREATE UNIQUE INDEX "PersonalInformation_profileId_key" ON "PersonalInformation"("profileId");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;

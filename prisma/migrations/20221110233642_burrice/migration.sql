/*
  Warnings:

  - Added the required column `nome` to the `batata` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_batata" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nome" TEXT NOT NULL
);
INSERT INTO "new_batata" ("id") SELECT "id" FROM "batata";
DROP TABLE "batata";
ALTER TABLE "new_batata" RENAME TO "batata";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;

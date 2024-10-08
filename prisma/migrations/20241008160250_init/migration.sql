-- CreateTable
CREATE TABLE "Follows" (
    "following_user_id" INTEGER NOT NULL,
    "followed_user_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Follows_pkey" PRIMARY KEY ("following_user_id","followed_user_id")
);

-- CreateTable
CREATE TABLE "Users" (
    "id" INTEGER NOT NULL,
    "role_id" INTEGER NOT NULL,
    "username" TEXT NOT NULL,
    "avatar_img" TEXT,
    "date_of_birth" TIMESTAMP(3),
    "email" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL,
    "hasApprovedTerms" BOOLEAN NOT NULL,

    CONSTRAINT "Users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Recipes" (
    "id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "dish_id" INTEGER NOT NULL,
    "category_id" INTEGER NOT NULL,
    "description" TEXT NOT NULL,
    "prep_time" INTEGER NOT NULL,
    "img_url" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Recipes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Roles" (
    "id" INTEGER NOT NULL,
    "type" TEXT NOT NULL,

    CONSTRAINT "Roles_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Categories" (
    "id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Categories_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Dishes" (
    "id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Dishes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Ingredients" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Ingredients_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Instructions" (
    "id" INTEGER NOT NULL,
    "recipe_id" INTEGER NOT NULL,
    "step_number" INTEGER NOT NULL,
    "description" TEXT NOT NULL,

    CONSTRAINT "Instructions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RecipeIngredients" (
    "recipe_id" INTEGER NOT NULL,
    "ingredient_id" INTEGER NOT NULL,
    "amount" INTEGER NOT NULL,
    "unit" TEXT NOT NULL,

    CONSTRAINT "RecipeIngredients_pkey" PRIMARY KEY ("recipe_id","ingredient_id")
);

-- CreateTable
CREATE TABLE "Reviews" (
    "id" INTEGER NOT NULL,
    "recipe_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "comment" TEXT NOT NULL,
    "rating" DOUBLE PRECISION NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Reviews_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Follows" ADD CONSTRAINT "Follows_following_user_id_fkey" FOREIGN KEY ("following_user_id") REFERENCES "Users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Follows" ADD CONSTRAINT "Follows_followed_user_id_fkey" FOREIGN KEY ("followed_user_id") REFERENCES "Users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Users" ADD CONSTRAINT "Users_role_id_fkey" FOREIGN KEY ("role_id") REFERENCES "Roles"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Recipes" ADD CONSTRAINT "Recipes_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "Users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Recipes" ADD CONSTRAINT "Recipes_dish_id_fkey" FOREIGN KEY ("dish_id") REFERENCES "Dishes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Recipes" ADD CONSTRAINT "Recipes_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "Categories"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Instructions" ADD CONSTRAINT "Instructions_recipe_id_fkey" FOREIGN KEY ("recipe_id") REFERENCES "Recipes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RecipeIngredients" ADD CONSTRAINT "RecipeIngredients_recipe_id_fkey" FOREIGN KEY ("recipe_id") REFERENCES "Recipes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RecipeIngredients" ADD CONSTRAINT "RecipeIngredients_ingredient_id_fkey" FOREIGN KEY ("ingredient_id") REFERENCES "Ingredients"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Reviews" ADD CONSTRAINT "Reviews_recipe_id_fkey" FOREIGN KEY ("recipe_id") REFERENCES "Recipes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Reviews" ADD CONSTRAINT "Reviews_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "Users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

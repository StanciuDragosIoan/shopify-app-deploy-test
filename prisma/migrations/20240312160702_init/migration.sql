-- CreateTable
CREATE TABLE "Session" (
    "id" TEXT NOT NULL,
    "shop" TEXT NOT NULL,
    "state" TEXT NOT NULL,
    "isOnline" BOOLEAN NOT NULL DEFAULT false,
    "scope" TEXT,
    "expires" TIMESTAMP(3),
    "accessToken" TEXT NOT NULL,
    "userId" BIGINT,
    "userConfigId" TEXT,

    CONSTRAINT "Session_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserConfig" (
    "id" TEXT NOT NULL,
    "platformId" TEXT NOT NULL,

    CONSTRAINT "UserConfig_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Platform" (
    "id" TEXT NOT NULL,
    "platform_name" TEXT NOT NULL,
    "platform_api_login" TEXT NOT NULL,
    "platform_api_key" TEXT NOT NULL,
    "platform_return_endpoint" TEXT NOT NULL,
    "userConfigId" TEXT,

    CONSTRAINT "Platform_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Store" (
    "id" TEXT NOT NULL,
    "userConfigId" TEXT,
    "store_name" TEXT NOT NULL,
    "store_prefix" TEXT NOT NULL,
    "shopify_access_token" TEXT NOT NULL,
    "ir_order_service" TEXT NOT NULL,
    "ir_headless_api_token" TEXT NOT NULL,
    "ir_client" TEXT NOT NULL,
    "ir_parcelType" TEXT NOT NULL,
    "frontend" TEXT NOT NULL,
    "ir_itemType" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Store_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Session" ADD CONSTRAINT "Session_userConfigId_fkey" FOREIGN KEY ("userConfigId") REFERENCES "UserConfig"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Platform" ADD CONSTRAINT "Platform_userConfigId_fkey" FOREIGN KEY ("userConfigId") REFERENCES "UserConfig"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Store" ADD CONSTRAINT "Store_userConfigId_fkey" FOREIGN KEY ("userConfigId") REFERENCES "UserConfig"("id") ON DELETE SET NULL ON UPDATE CASCADE;

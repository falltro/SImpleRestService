/*
 Navicat Premium Data Transfer

 Source Server         : pg_12
 Source Server Type    : PostgreSQL
 Source Server Version : 120001
 Source Host           : vit9:5433
 Source Catalog        : union
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 120001
 File Encoding         : 65001

 Date: 29/06/2021 20:28:13
*/


-- ----------------------------
-- Sequence structure for class_education_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."class_education_seq";
CREATE SEQUENCE "public"."class_education_seq"
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 100
CACHE 1;

-- ----------------------------
-- Sequence structure for job_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."job_id_seq";
CREATE SEQUENCE "public"."job_id_seq"
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for member_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."member_id_seq";
CREATE SEQUENCE "public"."member_id_seq"
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for payment_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."payment_id_seq";
CREATE SEQUENCE "public"."payment_id_seq"
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for person_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."person_id_seq";
CREATE SEQUENCE "public"."person_id_seq"
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Table structure for class_education
-- ----------------------------
DROP TABLE IF EXISTS "public"."class_education";
CREATE TABLE "public"."class_education" (
                                            "id" int4 NOT NULL DEFAULT nextval('class_education_seq'::regclass),
                                            "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
                                            "name1" varchar(255) COLLATE "pg_catalog"."default",
                                            "name2" varchar(50) COLLATE "pg_catalog"."default",
                                            "updated" timestamp(6)
)
;

-- ----------------------------
-- Records of class_education
-- ----------------------------
INSERT INTO "public"."class_education" VALUES (1, '??????????????', '??????????????', NULL, '2020-05-20 20:31:01.388842');
INSERT INTO "public"."class_education" VALUES (2, '????????????', '????????????', NULL, '2020-05-20 20:31:01.388842');
INSERT INTO "public"."class_education" VALUES (3, '?????????????? ??????????????????????', '?????????????? ??????????????????????', NULL, '2020-05-20 20:31:01.388842');
INSERT INTO "public"."class_education" VALUES (4, '???????????????????????? ????????????', '???????????????????????? ????????????', NULL, '2020-05-20 20:31:01.388842');
INSERT INTO "public"."class_education" VALUES (5, '?????????????????????????????? ??????????????????????', '?????????????????????????????? ??????????????????????', NULL, '2020-05-20 20:31:01.388842');
INSERT INTO "public"."class_education" VALUES (6, '??????????????', '??????????????', NULL, '2020-05-20 20:31:01.388842');
INSERT INTO "public"."class_education" VALUES (7, '???? ??????????????', '???? ??????????????', NULL, '2020-05-20 20:31:01.388842');
INSERT INTO "public"."class_education" VALUES (8, '???????????????? ??????????????', '???????????????? ??????????????', NULL, '2020-05-20 20:31:01.388842');
INSERT INTO "public"."class_education" VALUES (9, '???????????????? ??????????????', '???????????????? ??????????????', NULL, '2020-05-20 20:31:01.388842');
INSERT INTO "public"."class_education" VALUES (10, '??????????????????????', '??????????????????????', NULL, '2020-05-20 20:31:01.388842');

-- ----------------------------
-- Table structure for class_org
-- ----------------------------
DROP TABLE IF EXISTS "public"."class_org";
CREATE TABLE "public"."class_org" (
                                      "id" int4 NOT NULL,
                                      "name" varchar(255) COLLATE "pg_catalog"."default",
                                      "city" varchar(255) COLLATE "pg_catalog"."default",
                                      "address" varchar(255) COLLATE "pg_catalog"."default",
                                      "updated" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP
)
;
COMMENT ON COLUMN "public"."class_org"."name" IS '????????????????';
COMMENT ON COLUMN "public"."class_org"."city" IS '??????????';
COMMENT ON COLUMN "public"."class_org"."address" IS '??????????';

-- ----------------------------
-- Records of class_org
-- ----------------------------
INSERT INTO "public"."class_org" VALUES (0, '?????????????????????? ????????????????', '??????????', '????. ????????????', '2021-06-29 19:24:55.590643');
INSERT INTO "public"."class_org" VALUES (1, '?????????????????? ????????????????', '??????????', '????. ??.????????????', '2021-06-29 19:24:55.590643');

-- ----------------------------
-- Table structure for doc_job
-- ----------------------------
DROP TABLE IF EXISTS "public"."doc_job";
CREATE TABLE "public"."doc_job" (
                                    "person_id" int4 NOT NULL,
                                    "place" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
                                    "post" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
                                    "created" date NOT NULL,
                                    "finished" date,
                                    "updated" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                    "id" int4 NOT NULL DEFAULT nextval('job_id_seq'::regclass)
)
;
COMMENT ON COLUMN "public"."doc_job"."place" IS '?????????? ??????????????????????????, ????????????????, ??????????????????????';
COMMENT ON COLUMN "public"."doc_job"."post" IS '?????????????????? ????????????';

-- ----------------------------
-- Records of doc_job
-- ----------------------------
INSERT INTO "public"."doc_job" VALUES (1, '?????????? ????????????????', '??????????????', '2021-06-01', NULL, '2021-06-29 19:26:08.378013', 1);
INSERT INTO "public"."doc_job" VALUES (1, '????????', '??????????????????', '2021-06-01', NULL, '2021-06-29 19:26:08.378013', 2);

-- ----------------------------
-- Table structure for doc_member
-- ----------------------------
DROP TABLE IF EXISTS "public"."doc_member";
CREATE TABLE "public"."doc_member" (
                                       "num" int4 NOT NULL DEFAULT nextval('member_id_seq'::regclass),
                                       "created" date NOT NULL,
                                       "finished" date,
                                       "completed" date NOT NULL,
                                       "person_id" int4 NOT NULL,
                                       "org_id" int4 NOT NULL,
                                       "updated" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
                                       "id" int4 NOT NULL DEFAULT nextval('member_id_seq'::regclass)
)
;
COMMENT ON COLUMN "public"."doc_member"."num" IS '?????????????? ?????????? ???';
COMMENT ON COLUMN "public"."doc_member"."created" IS '???????? ???????????????????? ?? ????????????????';
COMMENT ON COLUMN "public"."doc_member"."finished" IS '???????? ???????????? ?? ??????????????????';
COMMENT ON COLUMN "public"."doc_member"."completed" IS '???????? ????????????????????';
COMMENT ON COLUMN "public"."doc_member"."person_id" IS '????????';
COMMENT ON COLUMN "public"."doc_member"."org_id" IS '?????????????????? ?? ??????????????????????';

-- ----------------------------
-- Records of doc_member
-- ----------------------------
INSERT INTO "public"."doc_member" VALUES (1, '2021-06-01', NULL, '2020-01-01', 1, 0, '2021-06-29 19:26:50.69732', 1);

-- ----------------------------
-- Table structure for doc_payment
-- ----------------------------
DROP TABLE IF EXISTS "public"."doc_payment";
CREATE TABLE "public"."doc_payment" (
                                        "person_id" int4 NOT NULL,
                                        "created" date NOT NULL,
                                        "finished" date,
                                        "org_id" int4 NOT NULL,
                                        "updated" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                        "id" int4 NOT NULL DEFAULT nextval('payment_id_seq'::regclass)
)
;
COMMENT ON COLUMN "public"."doc_payment"."person_id" IS '????????';
COMMENT ON COLUMN "public"."doc_payment"."created" IS '???????????? ??????????????';
COMMENT ON COLUMN "public"."doc_payment"."finished" IS '?????????? ??????????????';
COMMENT ON COLUMN "public"."doc_payment"."org_id" IS '???????????????? ?? ??????????????????????';

-- ----------------------------
-- Records of doc_payment
-- ----------------------------
INSERT INTO "public"."doc_payment" VALUES (3, '2021-06-03', '2021-06-30', 1, '2021-06-29 19:27:41.859862', 1);

-- ----------------------------
-- Table structure for person
-- ----------------------------
DROP TABLE IF EXISTS "public"."person";
CREATE TABLE "public"."person" (
                                   "fn" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
                                   "ln" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
                                   "mn" varchar(255) COLLATE "pg_catalog"."default",
                                   "birth" date NOT NULL,
                                   "education" varchar(255) COLLATE "pg_catalog"."default",
                                   "address" varchar(255) COLLATE "pg_catalog"."default",
                                   "phone" varchar(255) COLLATE "pg_catalog"."default",
                                   "id" int4 NOT NULL DEFAULT nextval('person_id_seq'::regclass),
                                   "birth_place" varchar(255) COLLATE "pg_catalog"."default",
                                   "live_place" varchar(255) COLLATE "pg_catalog"."default",
                                   "reg_place" varchar(255) COLLATE "pg_catalog"."default",
                                   "marital_id" int2 NOT NULL DEFAULT 0,
                                   "citizenship" varchar(100) COLLATE "pg_catalog"."default",
                                   "nationality" varchar(100) COLLATE "pg_catalog"."default",
                                   "comment" varchar(255) COLLATE "pg_catalog"."default",
                                   "updated" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP
)
;
COMMENT ON COLUMN "public"."person"."fn" IS '??????';
COMMENT ON COLUMN "public"."person"."ln" IS '??????????????????';
COMMENT ON COLUMN "public"."person"."mn" IS '?????? ???? ????????????';
COMMENT ON COLUMN "public"."person"."birth" IS '???????? ??????????????????';
COMMENT ON COLUMN "public"."person"."education" IS '????????????????';
COMMENT ON COLUMN "public"."person"."address" IS '?????????????? ??????????';
COMMENT ON COLUMN "public"."person"."phone" IS '??? ????????????????';
COMMENT ON COLUMN "public"."person"."birth_place" IS '?????????? ????????????????';
COMMENT ON COLUMN "public"."person"."live_place" IS '?????????? ???????????????????????? ????????????????????';
COMMENT ON COLUMN "public"."person"."reg_place" IS '?????????? ??????????????????????';
COMMENT ON COLUMN "public"."person"."marital_id" IS '???????????????? ??????????????????';
COMMENT ON COLUMN "public"."person"."citizenship" IS '??????????????????????';
COMMENT ON COLUMN "public"."person"."nationality" IS '????????????????????????????';
COMMENT ON COLUMN "public"."person"."comment" IS '??????????????????????';

-- ----------------------------
-- Records of person
-- ----------------------------
INSERT INTO "public"."person" VALUES ('????????????????', '??????????', NULL, '2021-06-06', NULL, NULL, NULL, 8, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2021-06-29 19:28:24.621329');
INSERT INTO "public"."person" VALUES ('????????????', '????????', '????????????????', '2021-06-06', NULL, NULL, NULL, 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2021-06-29 19:28:24.621329');
INSERT INTO "public"."person" VALUES ('??????????????', '??????????????', '??????????????????', '2021-06-01', NULL, NULL, NULL, 4, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2021-06-29 19:28:24.621329');
INSERT INTO "public"."person" VALUES ('??????????????', '????????', '????????????????', '2021-06-06', NULL, NULL, NULL, 5, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2021-06-29 19:28:24.621329');
INSERT INTO "public"."person" VALUES ('??????????????', '????????', '??????????????????', '2021-06-06', NULL, NULL, NULL, 6, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2021-06-29 19:28:24.621329');
INSERT INTO "public"."person" VALUES ('????????????????', '??????????????????', '????????????????', '0001-01-01', NULL, NULL, NULL, 7, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2021-06-29 19:28:24.621329');
INSERT INTO "public"."person" VALUES ('????????????', '????????', '????????????????', '2021-06-01', '????????????', NULL, NULL, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2021-06-29 19:28:24.621329');

-- ----------------------------
-- Function structure for trigger_updatable
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."trigger_updatable"();
CREATE OR REPLACE FUNCTION "public"."trigger_updatable"()
              RETURNS "pg_catalog"."trigger" AS $BODY$
BEGIN
    new.updated := CURRENT_TIMESTAMP;
RETURN new;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."class_education_seq"', 101, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."job_id_seq"', 11, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."member_id_seq"', 11, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."payment_id_seq"', 11, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."person_id_seq"', 10, true);

-- ----------------------------
-- Triggers structure for table class_education
-- ----------------------------
CREATE TRIGGER "update" AFTER INSERT OR UPDATE OF "name", "name1", "name2" ON "public"."class_education"
    FOR EACH STATEMENT
EXECUTE PROCEDURE "public"."trigger_updatable"();

-- ----------------------------
-- Primary Key structure for table class_education
-- ----------------------------
ALTER TABLE "public"."class_education" ADD CONSTRAINT "class_education_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Triggers structure for table class_org
-- ----------------------------
CREATE TRIGGER "update" AFTER INSERT OR UPDATE OF "name", "city", "address" ON "public"."class_org"
    FOR EACH STATEMENT
EXECUTE PROCEDURE "public"."trigger_updatable"();

-- ----------------------------
-- Primary Key structure for table class_org
-- ----------------------------
ALTER TABLE "public"."class_org" ADD CONSTRAINT "class_org_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Triggers structure for table doc_job
-- ----------------------------
CREATE TRIGGER "update" AFTER INSERT OR UPDATE OF "place", "post", "person_id", "finished", "created" ON "public"."doc_job"
    FOR EACH STATEMENT
EXECUTE PROCEDURE "public"."trigger_updatable"();

-- ----------------------------
-- Uniques structure for table doc_job
-- ----------------------------
ALTER TABLE "public"."doc_job" ADD CONSTRAINT "ux_doc_job" UNIQUE ("person_id", "place", "post", "created", "finished");

-- ----------------------------
-- Primary Key structure for table doc_job
-- ----------------------------
ALTER TABLE "public"."doc_job" ADD CONSTRAINT "work_change_doc_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Triggers structure for table doc_member
-- ----------------------------
CREATE TRIGGER "update" AFTER INSERT OR UPDATE OF "created", "finished", "completed", "num", "person_id", "org_id" ON "public"."doc_member"
    FOR EACH STATEMENT
EXECUTE PROCEDURE "public"."trigger_updatable"();

-- ----------------------------
-- Uniques structure for table doc_member
-- ----------------------------
ALTER TABLE "public"."doc_member" ADD CONSTRAINT "ux_doc_member" UNIQUE ("person_id", "created", "org_id");

-- ----------------------------
-- Primary Key structure for table doc_member
-- ----------------------------
ALTER TABLE "public"."doc_member" ADD CONSTRAINT "membership_card_doc_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Triggers structure for table doc_payment
-- ----------------------------
CREATE TRIGGER "update" AFTER INSERT OR UPDATE OF "created", "finished", "person_id", "org_id" ON "public"."doc_payment"
    FOR EACH STATEMENT
EXECUTE PROCEDURE "public"."trigger_updatable"();

-- ----------------------------
-- Uniques structure for table doc_payment
-- ----------------------------
ALTER TABLE "public"."doc_payment" ADD CONSTRAINT "ux_doc_payment" UNIQUE ("person_id", "created");

-- ----------------------------
-- Primary Key structure for table doc_payment
-- ----------------------------
ALTER TABLE "public"."doc_payment" ADD CONSTRAINT "payment_doc_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Triggers structure for table person
-- ----------------------------
CREATE TRIGGER "update" AFTER INSERT OR UPDATE OF "birth", "education", "address", "phone", "birth_place", "live_place", "fn", "reg_place", "marital_id", "citizenship", "nationality", "comment", "ln", "mn" ON "public"."person"
    FOR EACH STATEMENT
EXECUTE PROCEDURE "public"."trigger_updatable"();

-- ----------------------------
-- Uniques structure for table person
-- ----------------------------
ALTER TABLE "public"."person" ADD CONSTRAINT "UX_person_name" UNIQUE ("fn", "ln", "mn", "birth");

-- ----------------------------
-- Primary Key structure for table person
-- ----------------------------
ALTER TABLE "public"."person" ADD CONSTRAINT "person_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table doc_job
-- ----------------------------
ALTER TABLE "public"."doc_job" ADD CONSTRAINT "work_change_doc_person_id_fkey" FOREIGN KEY ("person_id") REFERENCES "public"."person" ("id") ON DELETE NO ACTION ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table doc_member
-- ----------------------------
ALTER TABLE "public"."doc_member" ADD CONSTRAINT "membership_card_doc_person_id_fkey" FOREIGN KEY ("person_id") REFERENCES "public"."person" ("id") ON DELETE NO ACTION ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table doc_payment
-- ----------------------------
ALTER TABLE "public"."doc_payment" ADD CONSTRAINT "payment_doc_person_id_fkey" FOREIGN KEY ("person_id") REFERENCES "public"."person" ("id") ON DELETE NO ACTION ON UPDATE CASCADE;

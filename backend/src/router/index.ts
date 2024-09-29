import { Router } from "express";
import { AuthUser } from "../middlewares";
import * as Controller from "../controllers";

const router = Router();
router.post("/user/signin", Controller.UserSignIn);
router.post("/user/signup", Controller.UserCreate);
router.get("/user/info", AuthUser, Controller.UserInfo);
router.post("/user/update", AuthUser, Controller.UserUpdate);

router.get("/communities", Controller.CommunitiesList);
router.post("/community/create", AuthUser, Controller.CommunityCreate);

router.get("/admin/logs", AuthUser, Controller.ShowLogs);
router.post("/admin/logs/flush", AuthUser, Controller.FlushLogs);

export default router;

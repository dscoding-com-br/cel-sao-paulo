import { Router } from "express";
import { AuthUser } from "../middlewares";
import * as Controller from "../controllers";

const router = Router();
router.post("/signin", Controller.UserSignIn);
router.post("/signup", Controller.UserCreate);
router.put("/profile", AuthUser, Controller.UserProfile);

router.get("/topics", Controller.TopicsList);
router.get("/topics/auth",AuthUser, Controller.TopicsListTwo);
router.get("/topic/users", AuthUser, Controller.TopicUsers);
router.get("/topics/my", AuthUser, Controller.TopicsMy);
router.get("/topic/subscribe", AuthUser, Controller.TopicSubscribe);
router.get("/topic/unsubscribe", AuthUser, Controller.TopicUnsubscribe);
router.post("/topic", AuthUser, Controller.TopicCreate);
router.patch("/topic", AuthUser, Controller.TopicUpdate);
router.delete("/topic", AuthUser, Controller.TopicDelete);

router.get("/messages", AuthUser, Controller.MessagesList);
router.post("/message", AuthUser, Controller.MessageCreate);
router.put("/messages", AuthUser, Controller.TopicClearMessages);
router.delete("/message", AuthUser, Controller.MessageDelete);

router.get("/logs", AuthUser, Controller.ShowLogs);
router.post("/logs/flush", AuthUser, Controller.FlushLogs);

export default router;

import { Request, Response, NextFunction } from "express";
import Authorization from "../auth";
import logger from "../log";

export async function AuthUser(req: Request, res: Response, next: NextFunction) {
	try {
		const auth_header = req.headers["authorization"] as string;
		let token = auth_header?.split(" ")[1];

		if (!token) {
			 token = req.query.token as string;
			 logger.info(`Query: ${token} ${req.query}`);
			if (!token) return res.status(403).json({ message: "Token de autorização não encontrado!" });
		}
		const auth = new Authorization();
		const result = await auth.verify(token);
		if (!result) return res.status(403).json({ message: "Autorização inválida!" });
		res.locals.payload = result;
		next();
	} catch (error) {
		logger.error(`Error: ${error}`);
		return res.status(500).json({ message: "Internal server error!" });
	}
}


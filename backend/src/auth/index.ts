import { Response } from "express";
import jwt, { VerifyOptions } from "jsonwebtoken";
import logger from "../log";
import { Auth } from "../types";

export default class Authorization {
	private public_key: string;
	private private_key: string;
	private expiration: string;

	constructor() {
		const public_key = process.env.PUBLIC_KEY || "";
		const private_key = process.env.PRIVATE_KEY || "";
		this.public_key = public_key.replace(/\\n/gm, "\n");
		this.private_key = private_key.replace(/\\n/gm, "\n");
		this.expiration = process.env.JWT_EXPIRATION || "2h";
	}

	public async sign(userId: number, refreshCount: number = 0): Promise<string | null> {
		try {
			return jwt.sign(
				{
					userId,
					refreshCount,
				},
				this.private_key,
				{ expiresIn: this.expiration, algorithm: "ES512" },
			);
		} catch (error) {
			logger.error(`Error: ${error}`);
			return null;
		}
	}

	public async verify(token: string): Promise<Auth | null> {
		try {
			const options: VerifyOptions = {
				algorithms: ["ES512"],
			};
			return jwt.verify(token, this.public_key, options) as Auth;
		} catch (error) {
			logger.error(`Error: ${error}`);
			return null;
		}
	}

	public getAuthorization(response: Response) {
		const locals = response.locals.payload as Auth;
		if (!locals) {
			response.status(401).json({ message: "Autorização não encontrada!" });
			return null;
		}
		return locals;
	}
}

import { Request, Response, NextFunction } from "express";
import { Communities } from "../database/models";

export async function CommunitiesList(req: Request, res: Response, next: NextFunction) {
	try {
		const communities = await Communities.findAll();
		res.status(200).json(communities);
	} catch (error) {
		next(error);
	}
}

export async function CommunityCreate(req: Request, res: Response, next: NextFunction) {
	try {
		const auth = res.locals.auth;
		const { name, description } = req.body;

		let community = await Communities.findOne({ where: { name } });
		if (community) return res.status(400).json({ message: "Comunidade já existe" });

		community = await Communities.create({
			name,
			description,
			adminId: auth.userId,
		});

		res.status(201).json({ message: "Comunidade criada com sucesso" });
	} catch (error) {
		next(error);
	}
}

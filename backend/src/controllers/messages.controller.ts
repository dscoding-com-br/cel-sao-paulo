import { Request, Response, NextFunction } from "express";
import { Topics, Subscriptions, Messages, Users } from "../database/models";

export async function MessagesList(req: Request, res: Response, next: NextFunction) {
	try {
		const auth = res.locals.payload;
		const topicId = req.query.topicId as string;

		const subscriptions = await Subscriptions.findAll({ where: { userId: auth.userId, topicId: topicId } });
		if (subscriptions.length === 0) {
			const topic = await Topics.findOne({ where: { id: topicId, adminId: auth.userId } });
			if (!topic) return res.status(400).json({ message: "Topico não encontrado ou você não é o administrador" });
		}
		const users = await Users.findAll();
		const messages = await Messages.findAll({
			where: { topicId },
			order: [["createdAt", "DESC"]],
		});

		const response = [];
		for (let i = 0; i < messages.length; i++) {
			const message = messages[i];
			const user = users.find((user) => user.id === message.userId);
			response.push({ ...message.dataValues, username: user.name });
		}

		res.status(200).json(response);
	} catch (error) {
		next(error);
	}
}

export async function MessageCreate(req: Request, res: Response, next: NextFunction) {
	try {
		const auth = res.locals.payload;
		const { topicId, content, toSpecificUser } = req.body;
		const subscriptions = await Subscriptions.findAll({ where: { userId: auth.userId, topicId } });
		if (subscriptions.length === 0) {
			const topic = await Topics.findOne({ where: { id: topicId, adminId: auth.userId } });
			if (!topic) return res.status(400).json({ message: "Topico não encontrado ou você não é o administrador" });
		}

		await Messages.create({
			userId: auth.userId,
			topicId,
			content,
			toSpecificUser,
		});

		res.status(201).json({ message: "Mensagem enviada com sucesso" });
	} catch (error) {
		next(error);
	}
}

export async function MessageDelete(req: Request, res: Response, next: NextFunction) {
	try {
		const auth = res.locals.payload;
		const messageId = req.query.messageId as string;
		const message = await Messages.findOne({ where: { id: messageId } });
		if (!message) return res.status(200).json({ message: "Mensagem apagada" });

		if (message.userId !== auth.userId) {
			const topic = await Topics.findOne({ where: { id: message.topicId } });
			if (topic.adminId !== auth.userId)
			 if(message.userId !== auth.userId)
			    return res.status(400).json({ message: "Você não tem permissão para apagar esta mensagem" });
		}

		await Messages.destroy({ where: { id: messageId } });

		res.status(200).json({ message: "Mensagem apagada com sucesso" });
	} catch (error) {
		next(error);
	}
}

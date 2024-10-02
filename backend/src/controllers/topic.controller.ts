import { Request, Response, NextFunction } from "express";
import { Topics, Subscriptions, Messages, Users } from "../database/models";
import { Op } from "sequelize";

export async function TopicsList(req: Request, res: Response, next: NextFunction) {
	try {
		const topics = await Topics.findAll();
		res.status(200).json(topics);
	} catch (error) {
		next(error);
	}
}

export async function TopicsListTwo(req: Request, res: Response, next: NextFunction) {
	try {
		const auth = res.locals.payload;
		const topics = await Topics.findAll();
		const subscriptions = await Subscriptions.findAll({ where: { userId: auth.userId } });

		const response = [];

		for (let i = 0; i < topics.length; i++) {
			let subscribed = false;

			subscriptions.forEach((sub) => {
				if (sub.topicId[i] === topics[i].id) subscribed = true;
			});

			if (topics[i].adminId === auth.userId) subscribed = true;
			response.push({ ...topics[i].dataValues, subscribed });
		}

		res.status(200).json(response);
	} catch (error) {
		next(error);
	}
}

export async function TopicCreate(req: Request, res: Response, next: NextFunction) {
	try {
		const auth = res.locals.payload;
		const { name, description } = req.body;
		let topic = await Topics.findOne({ where: { name } });
		if (topic) return res.status(400).json({ message: "Topico já existe" });

		topic = await Topics.create({
			name,
			description,
			adminId: auth.userId,
		});

		res.status(201).json({ message: "Topico criada com sucesso" });
	} catch (error) {
		next(error);
	}
}

export async function TopicSubscribe(req: Request, res: Response, next: NextFunction) {
	try {
		const auth = res.locals.payload;
		const topicId = req.query.topicId as string;
		const topic = await Topics.findOne({ where: { id: topicId } });
		if (!topic) return res.status(400).json({ message: "Topico não encontrada" });

		const subscription = await Subscriptions.findOne({ where: { userId: auth.userId, topicId } });
		if (subscription) return res.status(400).json({ message: "Você já está inscrito neste topico" });

		await Subscriptions.create({ userId: auth.userId, topicId: parseInt(topicId) });
		res.status(201).json({ message: "Inscrição realizada com sucesso" });
	} catch (error) {
		next(error);
	}
}

export async function TopicUnsubscribe(req: Request, res: Response, next: NextFunction) {
	try {
		const auth = res.locals.payload;
		const topicId = req.query.topicId as string;

		const topic = await Topics.findOne({ where: { id: topicId } });
		if (!topic) return res.status(400).json({ message: "Topico não encontrada" });

		if(topic.adminId === auth.userId) return res.status(400).json({ message: "Você não pode sair de um topico que você administra, mas pode apagar o topico" });


		const subscription = await Subscriptions.findOne({ where: { userId: auth.userId, topicId } });
		if (!subscription) return res.status(400).json({ message: "Você não está inscrito neste topico" });

		await Subscriptions.destroy({ where: { userId: auth.userId, topicId } });

		res.status(201).json({ message: "Inscrição cancelada com sucesso" });
	} catch (error) {
		next(error);
	}
}

export async function TopicsMy(req: Request, res: Response, next: NextFunction) {
	try {
		const auth = res.locals.payload;

		const subscriptions = await Subscriptions.findAll({ where: { userId: auth.userId } });
		const myTopics = subscriptions.map((sub) => sub.topicId);
		const topics = await Topics.findAll({ where: { id: { [Op.in]: myTopics } } });
		const adminTopics = await Topics.findAll({ where: { adminId: auth.userId } });

		let response = [];
		for (let i = 0; i < topics.length; i++) {
			const topic = topics[i];

			const message = await Messages.findOne({
				where: { topicId: topic.id },
				order: [["createdAt", "DESC"]],
			});

			if (message) {
				const user = await Users.findOne({ where: { id: message.userId } });
				response.push({ ...topic.dataValues, admin: false, message: { ...message.dataValues, username: user.name } });
			} else {
				response.push({ ...topic.dataValues, admin: false, message: null });
			}
		}

		for (let i = 0; i < adminTopics.length; i++) {
			const topic = adminTopics[i];
			const message = await Messages.findOne({
				where: { topicId: topic.id },
				order: [["createdAt", "DESC"]],
			});

			if (message) {
				const user = await Users.findOne({ where: { id: message.userId } });
				response.push({ ...topic.dataValues, admin: true, message: { ...message.dataValues, username: user.name } });
			} else {
				response.push({ ...topic.dataValues, admin: true, message: null });
			}
		}

		res.status(200).json(response);
	} catch (error) {
		next(error);
	}
}

export async function TopicUsers(req: Request, res: Response, next: NextFunction) {
	try {
		const topicId = req.query.topicId as string;
		const subscriptions = await Subscriptions.findAll({ where: { topicId } });
		const user_ids = subscriptions.map((sub) => sub.userId);
		const users = await Users.findAll({ where: { id: { [Op.in]: user_ids } }, attributes: { exclude: ["password"] } });
		res.status(200).json(users);
	} catch (error) {
		next(error);
	}
}

export async function TopicUpdate(req: Request, res: Response, next: NextFunction) {
	try {
		const auth = res.locals.payload;
		const { topicId, name, description } = req.body;
		const topic = await Topics.findOne({ where: { id: topicId } });
		if (!topic) return res.status(400).json({ message: "Topico não encontrada" });
		if (topic.adminId !== auth.userId) return res.status(403).json({ message: "Você não é o administrador desta comunidade" });

		await Topics.update({ name, description }, { where: { id: topicId } });
		res.status(200).json({ message: "Topico atualizada com sucesso" });
	} catch (error) {
		next(error);
	}
}

export async function TopicClearMessages(req: Request, res: Response, next: NextFunction) {
	try {
		const auth = res.locals.payload;
		const topicId = req.query.topicId as string;
		const topic = await Topics.findOne({ where: { id: topicId } });
		if (!topic) return res.status(400).json({ message: "Topico não encontrada" });
		if (topic.adminId !== auth.userId) return res.status(403).json({ message: "Você não é o administrador desta comunidade" });

		await Messages.destroy({ where: { topicId } });

		res.status(200).json({ message: "Mensagens da comunidade apagadas com sucesso" });
	} catch (error) {
		next(error);
	}
}

export async function TopicDelete(req: Request, res: Response, next: NextFunction) {
	try {
		const auth = res.locals.payload;
		const topicId = req.query.topicId as string;

		const topic = await Topics.findOne({ where: { id: topicId } });
		if (!topic) return res.status(400).json({ message: "Topico não encontrada" });
		if (topic.adminId !== auth.userId) return res.status(403).json({ message: "Você não é o administrador desta comunidade" });

		await Topics.destroy({ where: { id: topicId } });
		await Subscriptions.destroy({ where: { topicId } });
		await Messages.destroy({ where: { topicId } });

		res.status(200).json({ message: "Topico apagada com sucesso" });
	} catch (error) {
		next(error);
	}
}

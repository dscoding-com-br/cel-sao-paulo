import { Request, Response, NextFunction } from "express";
import bcrypt from "bcryptjs";
import { Users } from "../database/models";
import Authorization from "../auth";

export async function UserSignIn(req: Request, res: Response, next: NextFunction) {
	try {
		const { email, password } = req.body;
		let user = await Users.findOne({ where: { email } });
		if (!user) return res.status(400).json({ message: "Usuário não foi encontrado" });

		const validPassword = bcrypt.compareSync(password, user.password);
		if (!validPassword) return res.status(400).json({ message: "Senha inválida" });

		const auth = new Authorization();
		const token = await auth.sign(user.id, 0);

		res.status(200).json({
			token,
			expiresIn: process.env.JWT_EXPIRATION,
			user: {
				id: user.id,
				name: user.name,
				email: user.email,
			},
		});
	} catch (error) {
		next(error);
	}
}
export async function UserCreate(req: Request, res: Response, next: NextFunction) {
	try {
		const { email, password, name } = req.body;
		let user = await Users.findOne({ where: { email } });
		if (user) return res.status(400).json({ message: "E-mail já esta cadastrado" });

		user = await Users.create({
			email,
			password: bcrypt.hashSync(password, 10),
			name,
		});

		const auth = new Authorization();
		const token = await auth.sign(user.id, 0);

		res.status(201).json({ token, expiresIn: process.env.JWT_EXPIRATION, user: { id: user.id, name: user.name, email: user.email } });
	} catch (error) {
		next(error);
	}
}


export async function UserProfile(req: Request, res: Response, next: NextFunction) {
	try {
		const auth = res.locals.payload;
		const { password, name, email } = req.body;
		const user = await Users.findByPk(auth.userId);
		if (!user) return res.status(404).json({ message: "Usuário não foi encontrado" });

		if (email && email !== user.email) {
			const emailExists = await Users.findOne({ where: { email } });
			if (emailExists) return res.status(400).json({ message: "E-mail já esta cadastrado" });
		}

		if (email) user.email = email;
		if (password) user.password = bcrypt.hashSync(password, 10);
		if (name) user.name = name;

		await user.save();
		res.status(200).json({ message: "Usuário atualizado com sucesso" });
	} catch (error) {
		next(error);
	}
}
export async function UserDelete(req: Request, res: Response, next: NextFunction) {
	try {
		const { id } = req.params;
		const user = await Users.findByPk(id);
		if (!user) return res.status(404).json({ message: "Usuário não foi encontrado" });

		await user.destroy();
		res.status(200).json({ message: "Usuário excluido com sucesso" });
	} catch (error) {
		next(error);
	}
}

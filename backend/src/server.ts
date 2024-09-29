import express, { Response, Request, NextFunction } from "express";
import cors from "cors";
import helmet from "helmet";
import logger from "./log";
import expressWinston from "express-winston";
import router from "./router";
import database from "./database/db";

// Configuração do dotenv para carregar as variáveis de ambiente
require("dotenv-safe").config();

(async () => {
	try {
		// inicialização do banco de dados
		await database.sync().then(() => {
			logger.info("Banco de dados sincronizado");
		});

		// inicialização do servidor
		const app = express();
		const port = process.env.PORT || 3000;

		const cors_options = {
			origin: process.env.CORS_ALLOW_ORIGIN || "*",
			methods: ["GET", "PUT", "POST", "DELETE", "PATCH", "OPTIONS"],
			allowedHeaders: ["Content-Type", "authorization", "signature"],
			optionsSuccessStatus: 200,
		};

		app.use(cors(cors_options));
		app.use(helmet());
		app.use(express.json());
		app.use(express.urlencoded({ extended: true }));

		// caso a variável de ambiente seja diferente de "production", o log de requisições será exibido
		if (process.env.NODE_ENV !== "production") {
			app.use(
				expressWinston.logger({
					winstonInstance: logger,
					expressFormat: true,
					meta: true,
					msg: "Router: HTTP {{req.method}} {{req.url}} {{res.statusCode}} {{res.responseTime}}ms",
					colorize: true,
				}),
			);
		}

		// rotas da aplicação
		app.use(router);

		// middleware para tratamento de erros
		app.use((error: Error, _req: Request, res: Response, _next: NextFunction) => {
			if (error?.message?.includes("jwt expired")) {
				res.status(403).json({ message: "Token de autorização expirado!" });
			} else {
				logger.error(JSON.stringify(error));
				res.status(500).json({ message: "Internal Server Error!" });
			}
		});

		// middleware para rotas não encontradas
		app.use("/", (req: Request, res: Response) => {
			res.status(401).json({ message: "Não autorizado!" });
		});

		// inicialização do servidor
		app.listen(port, () => {
			logger.info(`Servidor rodando na porta ${port}`);
		});


	} catch (error) {
		logger.error(`Error: ${error}`);
	}
})();

import { Sequelize } from "sequelize";

const name = process.env.DATABASE_NAME!;
const user = process.env.DATABASE_USER!;
const password = process.env.DATABASE_PASSWORD;
const host = process.env.DATABASE_HOST;

export default new Sequelize(name, user, password, {
	dialect: "mysql",
	host: host,
	logging: false,
	timezone: "+00:00",
});

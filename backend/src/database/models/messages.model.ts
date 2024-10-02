import { Model, Optional, DataTypes } from "sequelize";
import database from "../db";
import { IMessage } from "../../interfaces";

interface CreationAttributes extends Optional<IMessage, "id" | "createdAt" | "updatedAt" | "toSpecificUser"> {}
export interface MessageInstance extends Model<IMessage, CreationAttributes>, IMessage {}
export const Messages = database.define<MessageInstance>("messages", {
	id: { type: DataTypes.INTEGER.UNSIGNED, autoIncrement: true, primaryKey: true },
	userId: { type: DataTypes.INTEGER.UNSIGNED, allowNull: false },
	topicId: { type: DataTypes.INTEGER.UNSIGNED, allowNull: false },
	toSpecificUser: { type: DataTypes.INTEGER.UNSIGNED, allowNull: true },
	content: { type: DataTypes.STRING, allowNull: false },
	createdAt: { type: DataTypes.DATE, allowNull: false },
	updatedAt: { type: DataTypes.DATE, allowNull: false },
});

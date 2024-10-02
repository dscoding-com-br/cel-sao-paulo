import { Model, Optional, DataTypes } from "sequelize";
import database from "../db";
import { ITopic } from "../../interfaces";

interface CreationAttributes extends Optional<ITopic, "id" | "createdAt" | "updatedAt"> {}
export interface TopicInstance extends Model<ITopic, CreationAttributes>, ITopic {}
export const Topics = database.define<TopicInstance>("topics", {
	id: { type: DataTypes.INTEGER.UNSIGNED, autoIncrement: true, primaryKey: true },
	adminId: { type: DataTypes.INTEGER.UNSIGNED, allowNull: false },
	name: { type: DataTypes.STRING(30), allowNull: false },
	description: { type: DataTypes.STRING, allowNull: false },
	createdAt: { type: DataTypes.DATE, allowNull: false },
	updatedAt: { type: DataTypes.DATE, allowNull: false },
});

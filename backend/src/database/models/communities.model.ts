import { Model, Optional, DataTypes } from "sequelize";
import database from "../db";
import { ICommunity } from "../../interfaces";

interface CreationAttributes extends Optional<ICommunity, "id" | "createdAt" | "updatedAt"> {}
export interface CommunityInstance extends Model<ICommunity, CreationAttributes>, ICommunity {}
export const Communities = database.define<CommunityInstance>("communities", {
	id: { type: DataTypes.INTEGER.UNSIGNED, autoIncrement: true, primaryKey: true },
	adminId: { type: DataTypes.INTEGER.UNSIGNED, allowNull: false },
	name: { type: DataTypes.STRING(30), allowNull: false },
	description: { type: DataTypes.STRING, allowNull: false },
	createdAt: { type: DataTypes.DATE, allowNull: false },
	updatedAt: { type: DataTypes.DATE, allowNull: false },
});

import { Model, Optional, DataTypes } from "sequelize";
import database from "../db";
import { INotification } from "../../interfaces";

interface CreationAttributes extends Optional<INotification, "id" | "createdAt" | "updatedAt" | "toSpecificUser"> {}
export interface NotificationInstance extends Model<INotification, CreationAttributes>, INotification {}
export const Notifications = database.define<NotificationInstance>("notifications", {
	id: { type: DataTypes.INTEGER.UNSIGNED, autoIncrement: true, primaryKey: true },
	userId: { type: DataTypes.INTEGER.UNSIGNED, allowNull: false },
	communityId: { type: DataTypes.INTEGER.UNSIGNED, allowNull: false },
	toSpecificUser: { type: DataTypes.INTEGER.UNSIGNED, allowNull: true },
	title: { type: DataTypes.STRING(30), allowNull: false },
	content: { type: DataTypes.STRING, allowNull: false },
	createdAt: { type: DataTypes.DATE, allowNull: false },
	updatedAt: { type: DataTypes.DATE, allowNull: false },
});

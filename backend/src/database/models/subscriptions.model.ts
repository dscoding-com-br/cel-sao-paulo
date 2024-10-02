import { Model, Optional, DataTypes } from "sequelize";
import database from "../db";
import { ISubscription } from "../../interfaces";

interface CreationAttributes extends Optional<ISubscription, "id" | "createdAt" | "updatedAt"> {}
export interface SubscriptionInstance extends Model<ISubscription, CreationAttributes>, ISubscription {}
export const Subscriptions = database.define<SubscriptionInstance>("subscriptions", {
	id: { type: DataTypes.INTEGER.UNSIGNED, autoIncrement: true, primaryKey: true },
	userId: { type: DataTypes.INTEGER.UNSIGNED, allowNull: false },
	topicId: { type: DataTypes.INTEGER.UNSIGNED, allowNull: false },
	createdAt: { type: DataTypes.DATE, allowNull: false },
	updatedAt: { type: DataTypes.DATE, allowNull: false },
});

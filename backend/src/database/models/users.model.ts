import { Model, Optional, DataTypes } from "sequelize";
import database from "../db";
import { IUser } from "../../interfaces";

interface UsersCreationAttributes extends Optional<IUser, "id" | "createdAt" | "updatedAt"> {}
export interface UsersInstance extends Model<IUser, UsersCreationAttributes>, IUser {}
export const Users = database.define<UsersInstance>("users", {
	id: { type: DataTypes.INTEGER.UNSIGNED, autoIncrement: true, primaryKey: true },
	name: { type: DataTypes.STRING(30), allowNull: false },
	email: { type: DataTypes.STRING(40), allowNull: false, unique: true },
	password: { type: DataTypes.STRING, allowNull: false },
	createdAt: { type: DataTypes.DATE, allowNull: false },
	updatedAt: { type: DataTypes.DATE, allowNull: false },
});

import { object, string, number } from "yup";

export const UserSchema = object({
	name: string().required(),
	email: string().email().required(),
	password: string().required(),
});

export const CommunitySchema = object({
	adminId: number().required(),
	name: string().required(),
	description: string().required(),
});

export const SubscriptionSchema = object({
	userId: number().required(),
	communityId: number().required(),
});

export const NotificationSchema = object({
	title: string().required(),
	content: string().required(),
	communityId: number().required(),
	toSpecificUser: number().optional(),
});

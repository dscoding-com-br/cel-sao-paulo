export interface IMessage {
	id?: number;
	userId: number;
	topicId: number;
	toSpecificUser?: number;
	content: string;
	createdAt?: Date;
	updatedAt?: Date;
}

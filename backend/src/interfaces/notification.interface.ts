export interface INotification {
	id?: number;
	userId: number;
	communityId: number;
	toSpecificUser?: number;
	title: string;
	content: string;
	createdAt?: Date;
	updatedAt?: Date;
}

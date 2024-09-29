
export interface ICommunity {
    id?: number;
    adminId: number;
    name: string;
    description: string;
    createdAt?: Date;
    updatedAt?: Date;
}
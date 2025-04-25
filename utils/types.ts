export interface User {
    id: string;
    email: string;
    name: string;
    avatar?: string;
}

export interface Task {
    id: string;
    title: string;
    description: string;
    status: string;
    priority: 'low' | 'medium' | 'high';
    dueDate?: Date;
    createdAt: Date;
    updatedAt: Date;
}
  
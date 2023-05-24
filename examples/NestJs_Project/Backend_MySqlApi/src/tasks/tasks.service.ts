import { Injectable, Inject } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Task } from './task.entity';

@Injectable()
export class TasksService
{
    private tasks: Array<Task> = [];
    
    constructor( @InjectRepository( Task ) private tasksRepository: Repository<Task> ) { }
    
    async getTasks(): Promise<Task[]>
    {
        return await this.tasksRepository.find();
    }

    async getTask( _id: number ): Promise<Task[]>
    {
        return await this.tasksRepository.find({
            select: ["name", "completed"],
            where: [{ "id": _id }]
        });
    }

    async createTask( task: Task )
    {
        this.tasksRepository.save( task );
    }
    
    async updateTask( task: Task )
    {
        this.tasksRepository.save( task )
    }

    async deleteTask( task: Task )
    {
        this.tasksRepository.delete( task );
    }
}

import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { TasksModule } from './tasks/tasks.module';
import { Task } from './tasks/task.entity';

@Module({
    imports: [
        TypeOrmModule.forRoot({
            type: 'mysql',
            host: 'localhost',
            port: 3306,
            username: 'root',
            password: 'vagrant',
            database: 'NestJs_Project',
            entities: [Task],
            synchronize: true,
            
            autoLoadEntities: true,
        }),
        TasksModule,
    ],
})
export class AppModule {}

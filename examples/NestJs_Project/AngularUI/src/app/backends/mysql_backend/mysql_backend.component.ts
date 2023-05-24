import { Component, OnInit } from '@angular/core';
import { TasksMysqlService } from '../../services/tasks_mysql.service';

interface Task {
    id: number;
    name: string;
    completed: boolean;
}

@Component({
    selector: 'app-mysql_backend',
    templateUrl: './mysql_backend.component.html',
    styleUrls: []
})
export class AppMysqlBackendComponent implements OnInit
{
    tasks: Task[];
    task: string;
    
    // eslint-disable-next-line @typescript-eslint/no-empty-function
    constructor(
        private taskService: TasksMysqlService,
    ) {
        this.tasks  = [];
        this.task   = '';
    }

    ngOnInit()
    {
        this.taskService.getTasks().subscribe( ( data: any ) => {
            console.log( data );
            this.tasks  = data as Task[];
        });
    }
    
    addTask( task: string )
    {
        this.taskService.addTask( task ).subscribe();
        this.task ='';
    }
    
    deleteTask( id: number )
    {
        this.taskService.deleteTask( id ).subscribe( ( data: any ) => {
            console.log( data );
        });
    }
}

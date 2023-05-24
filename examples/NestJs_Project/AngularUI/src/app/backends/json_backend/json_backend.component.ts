import { Component, OnInit } from '@angular/core';
import { TasksJsonService } from '../../services/tasks_json.service';

interface Task {
    id: number;
    name: string;
    completed: boolean;
}

@Component({
    selector: 'app-json_backend',
    templateUrl: './json_backend.component.html',
    styleUrls: []
})
export class AppJsonBackendComponent implements OnInit
{
    tasks: Task[];
    task: string;
    
    // eslint-disable-next-line @typescript-eslint/no-empty-function
    constructor(
        private taskService: TasksJsonService,
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

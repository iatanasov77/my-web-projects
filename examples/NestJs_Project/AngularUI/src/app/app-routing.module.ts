import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { AppJsonBackendComponent } from './backends/json_backend/json_backend.component';
import { AppMysqlBackendComponent } from './backends/mysql_backend/mysql_backend.component';

const routes: Routes = [
    {
        path: '',
        pathMatch: 'full',
        redirectTo: '/json-backend'
    },
    {
        path: 'json-backend',
        component: AppJsonBackendComponent,
        data: {
            title: 'JSON Backend',
        }
    },
    {
        path: 'mysql-backend',
        component: AppMysqlBackendComponent,
        data: {
            title: 'MySql Backend',
        }
    }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }

import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';
import { FormsModule } from '@angular/forms';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';

import { AppJsonBackendComponent } from './backends/json_backend/json_backend.component';
import { AppMysqlBackendComponent } from './backends/mysql_backend/mysql_backend.component';

@NgModule({
    declarations: [
        AppComponent,
        
        AppJsonBackendComponent,
        AppMysqlBackendComponent,
    ],
    imports: [
        BrowserModule,
        AppRoutingModule,
        HttpClientModule,
        FormsModule
    ],
    providers: [],
    bootstrap: [AppComponent]
})
export class AppModule { }

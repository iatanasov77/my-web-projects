import { TestBed } from '@angular/core/testing';
import { RouterTestingModule } from '@angular/router/testing';
import { AppMysqlBackendComponent } from './mysql_backend.component';

describe('AppMysqlBackendComponent', () => {
  beforeEach(() => TestBed.configureTestingModule({
    imports: [RouterTestingModule],
    declarations: [AppMysqlBackendComponent]
  }));

  it('should create the app', () => {
    const fixture = TestBed.createComponent(AppMysqlBackendComponent);
    const app = fixture.componentInstance;
    expect(app).toBeTruthy();
  });

  it(`should have as title 'angular-ui'`, () => {
    const fixture = TestBed.createComponent(AppMysqlBackendComponent);
    const app = fixture.componentInstance;
    //expect(app.title).toEqual('angular-ui');
  });

  it('should render title', () => {
    const fixture = TestBed.createComponent(AppMysqlBackendComponent);
    fixture.detectChanges();
    const compiled = fixture.nativeElement as HTMLElement;
    expect(compiled.querySelector('.content span')?.textContent).toContain('angular-ui app is running!');
  });
});

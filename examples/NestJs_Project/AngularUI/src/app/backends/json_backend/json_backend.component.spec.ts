import { TestBed } from '@angular/core/testing';
import { RouterTestingModule } from '@angular/router/testing';
import { AppJsonBackendComponent } from './json_backend.component';

describe('AppJsonBackendComponent', () => {
  beforeEach(() => TestBed.configureTestingModule({
    imports: [RouterTestingModule],
    declarations: [AppJsonBackendComponent]
  }));

  it('should create the app', () => {
    const fixture = TestBed.createComponent(AppJsonBackendComponent);
    const app = fixture.componentInstance;
    expect(app).toBeTruthy();
  });

  it(`should have as title 'angular-ui'`, () => {
    const fixture = TestBed.createComponent(AppJsonBackendComponent);
    const app = fixture.componentInstance;
    //expect(app.title).toEqual('angular-ui');
  });

  it('should render title', () => {
    const fixture = TestBed.createComponent(AppJsonBackendComponent);
    fixture.detectChanges();
    const compiled = fixture.nativeElement as HTMLElement;
    expect(compiled.querySelector('.content span')?.textContent).toContain('angular-ui app is running!');
  });
});

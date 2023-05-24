import { TestBed } from '@angular/core/testing';

import { TasksJsonService } from './tasks_json.service';

describe('TasksJsonService', () => {
  let service: TasksJsonService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(TasksJsonService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});

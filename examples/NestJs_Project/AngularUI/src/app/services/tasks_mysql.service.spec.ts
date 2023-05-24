import { TestBed } from '@angular/core/testing';

import { TasksMysqlService } from './tasks_mysql.service';

describe('TasksMysqlService', () => {
  let service: TasksMysqlService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(TasksMysqlService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});

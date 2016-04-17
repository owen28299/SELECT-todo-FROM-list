DROP USER IF EXISTS michael;

CREATE USER michael ENCRYPTED PASSWORD 'stonebreaker';

DROP DATABASE IF EXISTS todo_app;

CREATE DATABASE todo_app;

\c todo_app;

CREATE TABLE tasks (
  id SERIAL NOT NULL UNIQUE PRIMARY KEY,
  title varchar(255) NOT NULL,
  description text,
  created_at timestamp DEFAULT now() NOT NULL,
  updated_at timestamp,
  completed boolean DEFAULT false NOT NULL
);

ALTER TABLE tasks DROP COLUMN completed;
ALTER TABLE tasks ADD
  completed_at timestamp
  DEFAULT null;
ALTER TABLE tasks ALTER COLUMN updated_at SET NOT NULL;
ALTER TABLE tasks ALTER COLUMN updated_at SET DEFAULT now();

INSERT INTO tasks VALUES (
  default,
  'Study SQL',
  'Complete this exercise',
  default,
  default,
  NULL
);

INSERT INTO tasks VALUES (
  default,
  'Study PostgreSQL',
  'Read all the documentation',
  default,
  default,
  NULL
);

SELECT title, description
  FROM tasks
  WHERE completed_at IS NULL;

UPDATE tasks
  SET completed_at = now()
  WHERE title = 'Study SQL';

SELECT title, description
  FROM tasks
  WHERE completed_at IS NULL;

SELECT * FROM tasks
  ORDER BY created_at DESC;

INSERT INTO tasks VALUES (
  default,
  'mistake 1',
  'a test entry',
  default,
  default,
  NULL
);

INSERT INTO tasks VALUES (
  default,
  'mistake 2',
  'another test entry',
  default,
  default,
  NULL
);

INSERT INTO tasks VALUES (
  default,
  'third mistake',
  'another test entry',
  default,
  default,
  NULL
);

SELECT * FROM tasks
  WHERE title LIKE '%mistake%';

DELETE FROM tasks
  WHERE title = 'mistake 1';

SELECT * FROM tasks
  WHERE title LIKE '%mistake%';

DELETE FROM tasks
  WHERE title LIKE '%mistake%';

SELECT * FROM tasks
  ORDER BY title ASC;
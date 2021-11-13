create table if not exists stats (
    id serial primary key,
    solved boolean not null,
    puzzle_date date not null,
    time_taken int not null,
    completed_at timestamptz not null,
    checks int not null default 0,
    reveals int not null default 0,
    constructor text not null
);

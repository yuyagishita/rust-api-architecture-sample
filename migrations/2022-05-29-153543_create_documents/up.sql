CREATE TABLE documents (
  id SERIAL PRIMARY KEY,
  title varchar(500) NOT NULL,
  body text NOT NULL,
  created_at timestamp not null default current_timestamp,
  updated_at timestamp not null default current_timestamp
);

create function set_update_at() returns trigger as '
  begin
    new.updated_at := ''now'';
    return new;
  end;
' language 'plpgsql';
create trigger set_update_at_trigger before update on documents for each row execute procedure set_update_at();
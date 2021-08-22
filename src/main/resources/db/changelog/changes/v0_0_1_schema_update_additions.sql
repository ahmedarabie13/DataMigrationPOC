--liquibase formatted sql
--changeset Arabie:1

--adding the new tables

CREATE TABLE user_template (
                               id uuid NOT NULL,
                               user_id uuid NULL,
                               template_id uuid NULL,
                               CONSTRAINT user_template_pkey PRIMARY KEY (id),
                               CONSTRAINT user_template_template_id_fkey FOREIGN KEY (template_id)
                                   REFERENCES template_base_entity(id) ON DELETE CASCADE
);

CREATE TABLE group_template (
                                id uuid NOT NULL,
                                group_id uuid NULL,
                                template_id uuid NULL,
                                CONSTRAINT group_template_pkey PRIMARY KEY (id),
                                CONSTRAINT group_template_template_id_fkey FOREIGN KEY (template_id)
                                    REFERENCES template_base_entity(id) ON DELETE CASCADE
);




CREATE TABLE channel_template (
                                  id uuid NOT NULL,
                                  channel varchar(150) NULL,
                                  template_id uuid NULL,
                                  CONSTRAINT channel_template_pkey PRIMARY KEY (id),
                                  CONSTRAINT fk_channel_template FOREIGN KEY (template_id)
                                      REFERENCES template_base_entity(id)
);

CREATE TABLE file_templates (
                                id uuid NULL,
                                is_global bool NULL DEFAULT true,
                                "type" varchar(50) NULL,
                                media_url text NULL,
                                format varchar(20) NULL,
                                CONSTRAINT file_templates_id_key UNIQUE (id),
                                CONSTRAINT fk_file_templates FOREIGN KEY (id)
                                    REFERENCES template_base_entity(id) ON DELETE CASCADE
);


-- adding new columns to the existing tables

alter table template_base_entity
    add column name varchar(200),
    add column description varchar(500),
    add column queue UUID,
    add column is_published varchar default false;


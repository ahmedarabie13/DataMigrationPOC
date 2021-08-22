--liquibase formatted sql
--changeset Arabie:1

-- deleting the unneeded columns after data migration

alter table email_templates
    drop column name,
    drop column description,
    drop column is_published;


alter table quick_text_templates
    drop column name,
    drop column description,
    drop column is_published;

alter table url_templates
    drop column name,
    drop column description,
    drop column is_published;


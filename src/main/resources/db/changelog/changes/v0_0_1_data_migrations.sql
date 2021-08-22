--liquibase formatted sql
--changeset Arabie:1

DO
'
DECLARE

    email_rec record;
    url_rec record;
    txt_rec record;


BEGIN

    for email_rec in select * from email_templates
    loop

        update template_base_entity
        set
            name = email_rec.name,
            description = email_rec.description,
            is_published = email_rec.is_published
        where id = email_rec.id;
    end loop;



    for url_rec in select * from url_templates
    loop

        update template_base_entity
        set
            name = url_rec.name,
            description = url_rec.description,
            is_published = url_rec.is_published
        where id = url_rec.id;

    end loop;

    for txt_rec in select * from quick_text_templates
    loop

        update template_base_entity
        set
            name = txt_rec.name,
            description = txt_rec.description,
            is_published = txt_rec.is_published
        where id = txt_rec.id;

    end loop;


END;
' LANGUAGE PLPGSQL;


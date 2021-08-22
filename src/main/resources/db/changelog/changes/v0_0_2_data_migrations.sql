--liquibase formatted sql
--changeset Arabie:1
DO
'
DECLARE

        email_cursor cursor for
            select *
            from email_templates;

        url_cursor cursor for
            select *
            from url_templates;

        txt_cursor cursor for
            select *
            from quick_text_templates;

        email_rec record;
        url_rec record;
        txt_rec record;

BEGIN

        open email_cursor;
        loop

            fetch email_cursor into email_rec;

            exit when not found;

            update template_base_entity
            set
                name = email_rec.name,
                decription = email_rec.description,
                is_published = email_rec.is_published
            where id = email_rec.id;
        end loop;

        open url_cursor;

        loop

            fetch url_cusror into url_rec;

            exit when not found;
            update template_base_entity
            set
                name = url_rec.name,
                decription = url_rec.description,
                is_published = url_rec.is_published
            where id = url_rec.id;

        end loop;
        open txt_cursor;

        loop

            fetch txt_cursor into txt_rec;

            exit when not found;
            update template_base_entity
            set
                name = txt_rec.name,
                decription = txt_rec.description,
                is_published = txt_rec.is_published
            where id = txt_rec.id;

        end loop;



END;
' LANGUAGE PLPGSQL;

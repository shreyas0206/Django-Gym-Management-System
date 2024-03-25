--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: main_appsetting; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_appsetting (
    id bigint NOT NULL,
    logo_img character varying(100) NOT NULL
);


ALTER TABLE public.main_appsetting OWNER TO postgres;

--
-- Name: main_appsetting_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_appsetting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.main_appsetting_id_seq OWNER TO postgres;

--
-- Name: main_appsetting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_appsetting_id_seq OWNED BY public.main_appsetting.id;


--
-- Name: main_assignsubscriber; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_assignsubscriber (
    id bigint NOT NULL,
    trainer_id bigint NOT NULL,
    user_id integer
);


ALTER TABLE public.main_assignsubscriber OWNER TO postgres;

--
-- Name: main_assignsubscriber_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_assignsubscriber_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.main_assignsubscriber_id_seq OWNER TO postgres;

--
-- Name: main_assignsubscriber_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_assignsubscriber_id_seq OWNED BY public.main_assignsubscriber.id;


--
-- Name: main_banners; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_banners (
    id bigint NOT NULL,
    img character varying(100) NOT NULL,
    alt_text character varying(150) NOT NULL
);


ALTER TABLE public.main_banners OWNER TO postgres;

--
-- Name: main_banners_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_banners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.main_banners_id_seq OWNER TO postgres;

--
-- Name: main_banners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_banners_id_seq OWNED BY public.main_banners.id;


--
-- Name: main_enquiry; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_enquiry (
    id bigint NOT NULL,
    full_name character varying(150) NOT NULL,
    email character varying(150) NOT NULL,
    detail text NOT NULL,
    send_time timestamp with time zone NOT NULL
);


ALTER TABLE public.main_enquiry OWNER TO postgres;

--
-- Name: main_enquiry_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_enquiry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.main_enquiry_id_seq OWNER TO postgres;

--
-- Name: main_enquiry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_enquiry_id_seq OWNED BY public.main_enquiry.id;


--
-- Name: main_faq; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_faq (
    id bigint NOT NULL,
    quest text NOT NULL,
    ans text NOT NULL
);


ALTER TABLE public.main_faq OWNER TO postgres;

--
-- Name: main_faq_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_faq_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.main_faq_id_seq OWNER TO postgres;

--
-- Name: main_faq_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_faq_id_seq OWNED BY public.main_faq.id;


--
-- Name: main_gallery; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_gallery (
    id bigint NOT NULL,
    title character varying(150) NOT NULL,
    detail text NOT NULL,
    img character varying(100)
);


ALTER TABLE public.main_gallery OWNER TO postgres;

--
-- Name: main_gallery_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_gallery_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.main_gallery_id_seq OWNER TO postgres;

--
-- Name: main_gallery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_gallery_id_seq OWNED BY public.main_gallery.id;


--
-- Name: main_galleryimage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_galleryimage (
    id bigint NOT NULL,
    alt_text character varying(150) NOT NULL,
    img character varying(100),
    gallery_id bigint
);


ALTER TABLE public.main_galleryimage OWNER TO postgres;

--
-- Name: main_galleryimage_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_galleryimage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.main_galleryimage_id_seq OWNER TO postgres;

--
-- Name: main_galleryimage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_galleryimage_id_seq OWNED BY public.main_galleryimage.id;


--
-- Name: main_notiftrainerstatus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_notiftrainerstatus (
    id bigint NOT NULL,
    status boolean NOT NULL,
    notif_id bigint NOT NULL,
    trainer_id bigint NOT NULL
);


ALTER TABLE public.main_notiftrainerstatus OWNER TO postgres;

--
-- Name: main_notiftrainerstatus_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_notiftrainerstatus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.main_notiftrainerstatus_id_seq OWNER TO postgres;

--
-- Name: main_notiftrainerstatus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_notiftrainerstatus_id_seq OWNED BY public.main_notiftrainerstatus.id;


--
-- Name: main_notifuserstatus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_notifuserstatus (
    id bigint NOT NULL,
    status boolean NOT NULL,
    notif_id bigint NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.main_notifuserstatus OWNER TO postgres;

--
-- Name: main_notifuserstatus_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_notifuserstatus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.main_notifuserstatus_id_seq OWNER TO postgres;

--
-- Name: main_notifuserstatus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_notifuserstatus_id_seq OWNED BY public.main_notifuserstatus.id;


--
-- Name: main_notify; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_notify (
    id bigint NOT NULL,
    notify_detail text NOT NULL,
    read_by_trainer_id bigint,
    read_by_user_id integer
);


ALTER TABLE public.main_notify OWNER TO postgres;

--
-- Name: main_notify_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_notify_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.main_notify_id_seq OWNER TO postgres;

--
-- Name: main_notify_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_notify_id_seq OWNED BY public.main_notify.id;


--
-- Name: main_page; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_page (
    id bigint NOT NULL,
    title character varying(200) NOT NULL,
    detail text NOT NULL
);


ALTER TABLE public.main_page OWNER TO postgres;

--
-- Name: main_page_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_page_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.main_page_id_seq OWNER TO postgres;

--
-- Name: main_page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_page_id_seq OWNED BY public.main_page.id;


--
-- Name: main_plandiscount; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_plandiscount (
    id bigint NOT NULL,
    total_months integer NOT NULL,
    total_discount integer NOT NULL,
    subplan_id bigint
);


ALTER TABLE public.main_plandiscount OWNER TO postgres;

--
-- Name: main_plandiscount_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_plandiscount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.main_plandiscount_id_seq OWNER TO postgres;

--
-- Name: main_plandiscount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_plandiscount_id_seq OWNED BY public.main_plandiscount.id;


--
-- Name: main_service; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_service (
    id bigint NOT NULL,
    title character varying(150) NOT NULL,
    detail text NOT NULL,
    img character varying(100)
);


ALTER TABLE public.main_service OWNER TO postgres;

--
-- Name: main_service_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_service_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.main_service_id_seq OWNER TO postgres;

--
-- Name: main_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_service_id_seq OWNED BY public.main_service.id;


--
-- Name: main_subplan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_subplan (
    id bigint NOT NULL,
    title character varying(150) NOT NULL,
    price integer NOT NULL,
    highlight_status boolean,
    max_member integer,
    validity_days integer
);


ALTER TABLE public.main_subplan OWNER TO postgres;

--
-- Name: main_subplan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_subplan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.main_subplan_id_seq OWNER TO postgres;

--
-- Name: main_subplan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_subplan_id_seq OWNED BY public.main_subplan.id;


--
-- Name: main_subplanfeature; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_subplanfeature (
    id bigint NOT NULL,
    title character varying(150) NOT NULL
);


ALTER TABLE public.main_subplanfeature OWNER TO postgres;

--
-- Name: main_subplanfeature_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_subplanfeature_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.main_subplanfeature_id_seq OWNER TO postgres;

--
-- Name: main_subplanfeature_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_subplanfeature_id_seq OWNED BY public.main_subplanfeature.id;


--
-- Name: main_subplanfeature_subplan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_subplanfeature_subplan (
    id bigint NOT NULL,
    subplanfeature_id bigint NOT NULL,
    subplan_id bigint NOT NULL
);


ALTER TABLE public.main_subplanfeature_subplan OWNER TO postgres;

--
-- Name: main_subplanfeature_subplan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_subplanfeature_subplan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.main_subplanfeature_subplan_id_seq OWNER TO postgres;

--
-- Name: main_subplanfeature_subplan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_subplanfeature_subplan_id_seq OWNED BY public.main_subplanfeature_subplan.id;


--
-- Name: main_subscriber; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_subscriber (
    id bigint NOT NULL,
    mobile character varying(20) NOT NULL,
    address text NOT NULL,
    img character varying(100),
    user_id integer
);


ALTER TABLE public.main_subscriber OWNER TO postgres;

--
-- Name: main_subscriber_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_subscriber_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.main_subscriber_id_seq OWNER TO postgres;

--
-- Name: main_subscriber_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_subscriber_id_seq OWNED BY public.main_subscriber.id;


--
-- Name: main_subscription; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_subscription (
    id bigint NOT NULL,
    price character varying(50) NOT NULL,
    plan_id bigint,
    user_id integer,
    reg_date date
);


ALTER TABLE public.main_subscription OWNER TO postgres;

--
-- Name: main_subscription_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.main_subscription_id_seq OWNER TO postgres;

--
-- Name: main_subscription_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_subscription_id_seq OWNED BY public.main_subscription.id;


--
-- Name: main_trainer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_trainer (
    id bigint NOT NULL,
    full_name character varying(100) NOT NULL,
    mobile character varying(100) NOT NULL,
    address text NOT NULL,
    is_active boolean NOT NULL,
    detail text NOT NULL,
    img character varying(100) NOT NULL,
    pwd character varying(50),
    username character varying(100),
    facebook character varying(200),
    pinterest character varying(200),
    twitter character varying(200),
    youtube character varying(200),
    salary integer NOT NULL
);


ALTER TABLE public.main_trainer OWNER TO postgres;

--
-- Name: main_trainer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_trainer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.main_trainer_id_seq OWNER TO postgres;

--
-- Name: main_trainer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_trainer_id_seq OWNED BY public.main_trainer.id;


--
-- Name: main_trainerachivement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_trainerachivement (
    id bigint NOT NULL,
    title character varying(100) NOT NULL,
    detail text NOT NULL,
    img character varying(100) NOT NULL,
    trainer_id bigint NOT NULL
);


ALTER TABLE public.main_trainerachivement OWNER TO postgres;

--
-- Name: main_trainerachivement_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_trainerachivement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.main_trainerachivement_id_seq OWNER TO postgres;

--
-- Name: main_trainerachivement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_trainerachivement_id_seq OWNED BY public.main_trainerachivement.id;


--
-- Name: main_trainermsg; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_trainermsg (
    id bigint NOT NULL,
    message text NOT NULL,
    trainer_id bigint,
    user_id integer
);


ALTER TABLE public.main_trainermsg OWNER TO postgres;

--
-- Name: main_trainermsg_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_trainermsg_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.main_trainermsg_id_seq OWNER TO postgres;

--
-- Name: main_trainermsg_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_trainermsg_id_seq OWNED BY public.main_trainermsg.id;


--
-- Name: main_trainernotification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_trainernotification (
    id bigint NOT NULL,
    notif_msg text NOT NULL
);


ALTER TABLE public.main_trainernotification OWNER TO postgres;

--
-- Name: main_trainernotification_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_trainernotification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.main_trainernotification_id_seq OWNER TO postgres;

--
-- Name: main_trainernotification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_trainernotification_id_seq OWNED BY public.main_trainernotification.id;


--
-- Name: main_trainersalary; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_trainersalary (
    id bigint NOT NULL,
    amt integer NOT NULL,
    amt_date date NOT NULL,
    remarks text NOT NULL,
    trainer_id bigint NOT NULL
);


ALTER TABLE public.main_trainersalary OWNER TO postgres;

--
-- Name: main_trainersalary_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_trainersalary_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.main_trainersalary_id_seq OWNER TO postgres;

--
-- Name: main_trainersalary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_trainersalary_id_seq OWNED BY public.main_trainersalary.id;


--
-- Name: main_trainersubscriberreport; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_trainersubscriberreport (
    id bigint NOT NULL,
    report_msg text NOT NULL,
    report_for_trainer_id bigint,
    report_for_user_id integer,
    report_from_trainer_id bigint,
    report_from_user_id integer
);


ALTER TABLE public.main_trainersubscriberreport OWNER TO postgres;

--
-- Name: main_trainersubscriberreport_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_trainersubscriberreport_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.main_trainersubscriberreport_id_seq OWNER TO postgres;

--
-- Name: main_trainersubscriberreport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_trainersubscriberreport_id_seq OWNED BY public.main_trainersubscriberreport.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: main_appsetting id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_appsetting ALTER COLUMN id SET DEFAULT nextval('public.main_appsetting_id_seq'::regclass);


--
-- Name: main_assignsubscriber id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_assignsubscriber ALTER COLUMN id SET DEFAULT nextval('public.main_assignsubscriber_id_seq'::regclass);


--
-- Name: main_banners id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_banners ALTER COLUMN id SET DEFAULT nextval('public.main_banners_id_seq'::regclass);


--
-- Name: main_enquiry id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_enquiry ALTER COLUMN id SET DEFAULT nextval('public.main_enquiry_id_seq'::regclass);


--
-- Name: main_faq id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_faq ALTER COLUMN id SET DEFAULT nextval('public.main_faq_id_seq'::regclass);


--
-- Name: main_gallery id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_gallery ALTER COLUMN id SET DEFAULT nextval('public.main_gallery_id_seq'::regclass);


--
-- Name: main_galleryimage id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_galleryimage ALTER COLUMN id SET DEFAULT nextval('public.main_galleryimage_id_seq'::regclass);


--
-- Name: main_notiftrainerstatus id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_notiftrainerstatus ALTER COLUMN id SET DEFAULT nextval('public.main_notiftrainerstatus_id_seq'::regclass);


--
-- Name: main_notifuserstatus id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_notifuserstatus ALTER COLUMN id SET DEFAULT nextval('public.main_notifuserstatus_id_seq'::regclass);


--
-- Name: main_notify id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_notify ALTER COLUMN id SET DEFAULT nextval('public.main_notify_id_seq'::regclass);


--
-- Name: main_page id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_page ALTER COLUMN id SET DEFAULT nextval('public.main_page_id_seq'::regclass);


--
-- Name: main_plandiscount id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_plandiscount ALTER COLUMN id SET DEFAULT nextval('public.main_plandiscount_id_seq'::regclass);


--
-- Name: main_service id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_service ALTER COLUMN id SET DEFAULT nextval('public.main_service_id_seq'::regclass);


--
-- Name: main_subplan id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_subplan ALTER COLUMN id SET DEFAULT nextval('public.main_subplan_id_seq'::regclass);


--
-- Name: main_subplanfeature id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_subplanfeature ALTER COLUMN id SET DEFAULT nextval('public.main_subplanfeature_id_seq'::regclass);


--
-- Name: main_subplanfeature_subplan id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_subplanfeature_subplan ALTER COLUMN id SET DEFAULT nextval('public.main_subplanfeature_subplan_id_seq'::regclass);


--
-- Name: main_subscriber id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_subscriber ALTER COLUMN id SET DEFAULT nextval('public.main_subscriber_id_seq'::regclass);


--
-- Name: main_subscription id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_subscription ALTER COLUMN id SET DEFAULT nextval('public.main_subscription_id_seq'::regclass);


--
-- Name: main_trainer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_trainer ALTER COLUMN id SET DEFAULT nextval('public.main_trainer_id_seq'::regclass);


--
-- Name: main_trainerachivement id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_trainerachivement ALTER COLUMN id SET DEFAULT nextval('public.main_trainerachivement_id_seq'::regclass);


--
-- Name: main_trainermsg id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_trainermsg ALTER COLUMN id SET DEFAULT nextval('public.main_trainermsg_id_seq'::regclass);


--
-- Name: main_trainernotification id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_trainernotification ALTER COLUMN id SET DEFAULT nextval('public.main_trainernotification_id_seq'::regclass);


--
-- Name: main_trainersalary id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_trainersalary ALTER COLUMN id SET DEFAULT nextval('public.main_trainersalary_id_seq'::regclass);


--
-- Name: main_trainersubscriberreport id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_trainersubscriberreport ALTER COLUMN id SET DEFAULT nextval('public.main_trainersubscriberreport_id_seq'::regclass);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: main_appsetting main_appsetting_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_appsetting
    ADD CONSTRAINT main_appsetting_pkey PRIMARY KEY (id);


--
-- Name: main_assignsubscriber main_assignsubscriber_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_assignsubscriber
    ADD CONSTRAINT main_assignsubscriber_pkey PRIMARY KEY (id);


--
-- Name: main_banners main_banners_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_banners
    ADD CONSTRAINT main_banners_pkey PRIMARY KEY (id);


--
-- Name: main_enquiry main_enquiry_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_enquiry
    ADD CONSTRAINT main_enquiry_pkey PRIMARY KEY (id);


--
-- Name: main_faq main_faq_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_faq
    ADD CONSTRAINT main_faq_pkey PRIMARY KEY (id);


--
-- Name: main_gallery main_gallery_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_gallery
    ADD CONSTRAINT main_gallery_pkey PRIMARY KEY (id);


--
-- Name: main_galleryimage main_galleryimage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_galleryimage
    ADD CONSTRAINT main_galleryimage_pkey PRIMARY KEY (id);


--
-- Name: main_notiftrainerstatus main_notiftrainerstatus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_notiftrainerstatus
    ADD CONSTRAINT main_notiftrainerstatus_pkey PRIMARY KEY (id);


--
-- Name: main_notifuserstatus main_notifuserstatus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_notifuserstatus
    ADD CONSTRAINT main_notifuserstatus_pkey PRIMARY KEY (id);


--
-- Name: main_notify main_notify_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_notify
    ADD CONSTRAINT main_notify_pkey PRIMARY KEY (id);


--
-- Name: main_page main_page_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_page
    ADD CONSTRAINT main_page_pkey PRIMARY KEY (id);


--
-- Name: main_plandiscount main_plandiscount_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_plandiscount
    ADD CONSTRAINT main_plandiscount_pkey PRIMARY KEY (id);


--
-- Name: main_service main_service_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_service
    ADD CONSTRAINT main_service_pkey PRIMARY KEY (id);


--
-- Name: main_subplan main_subplan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_subplan
    ADD CONSTRAINT main_subplan_pkey PRIMARY KEY (id);


--
-- Name: main_subplanfeature main_subplanfeature_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_subplanfeature
    ADD CONSTRAINT main_subplanfeature_pkey PRIMARY KEY (id);


--
-- Name: main_subplanfeature_subplan main_subplanfeature_subp_subplanfeature_id_subpla_bf605d3c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_subplanfeature_subplan
    ADD CONSTRAINT main_subplanfeature_subp_subplanfeature_id_subpla_bf605d3c_uniq UNIQUE (subplanfeature_id, subplan_id);


--
-- Name: main_subplanfeature_subplan main_subplanfeature_subplan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_subplanfeature_subplan
    ADD CONSTRAINT main_subplanfeature_subplan_pkey PRIMARY KEY (id);


--
-- Name: main_subscriber main_subscriber_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_subscriber
    ADD CONSTRAINT main_subscriber_pkey PRIMARY KEY (id);


--
-- Name: main_subscription main_subscription_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_subscription
    ADD CONSTRAINT main_subscription_pkey PRIMARY KEY (id);


--
-- Name: main_trainer main_trainer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_trainer
    ADD CONSTRAINT main_trainer_pkey PRIMARY KEY (id);


--
-- Name: main_trainerachivement main_trainerachivement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_trainerachivement
    ADD CONSTRAINT main_trainerachivement_pkey PRIMARY KEY (id);


--
-- Name: main_trainermsg main_trainermsg_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_trainermsg
    ADD CONSTRAINT main_trainermsg_pkey PRIMARY KEY (id);


--
-- Name: main_trainernotification main_trainernotification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_trainernotification
    ADD CONSTRAINT main_trainernotification_pkey PRIMARY KEY (id);


--
-- Name: main_trainersalary main_trainersalary_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_trainersalary
    ADD CONSTRAINT main_trainersalary_pkey PRIMARY KEY (id);


--
-- Name: main_trainersubscriberreport main_trainersubscriberreport_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_trainersubscriberreport
    ADD CONSTRAINT main_trainersubscriberreport_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: main_assignsubscriber_trainer_id_68159959; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_assignsubscriber_trainer_id_68159959 ON public.main_assignsubscriber USING btree (trainer_id);


--
-- Name: main_assignsubscriber_user_id_ddb1b6bb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_assignsubscriber_user_id_ddb1b6bb ON public.main_assignsubscriber USING btree (user_id);


--
-- Name: main_galleryimage_gallery_id_1cb3d125; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_galleryimage_gallery_id_1cb3d125 ON public.main_galleryimage USING btree (gallery_id);


--
-- Name: main_notiftrainerstatus_notif_id_632bfcb5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_notiftrainerstatus_notif_id_632bfcb5 ON public.main_notiftrainerstatus USING btree (notif_id);


--
-- Name: main_notiftrainerstatus_trainer_id_8c91e0ae; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_notiftrainerstatus_trainer_id_8c91e0ae ON public.main_notiftrainerstatus USING btree (trainer_id);


--
-- Name: main_notifuserstatus_notif_id_8d22acc2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_notifuserstatus_notif_id_8d22acc2 ON public.main_notifuserstatus USING btree (notif_id);


--
-- Name: main_notifuserstatus_user_id_196b7d7e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_notifuserstatus_user_id_196b7d7e ON public.main_notifuserstatus USING btree (user_id);


--
-- Name: main_notify_read_by_trainer_id_3f0d1b22; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_notify_read_by_trainer_id_3f0d1b22 ON public.main_notify USING btree (read_by_trainer_id);


--
-- Name: main_notify_read_by_user_id_b215073b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_notify_read_by_user_id_b215073b ON public.main_notify USING btree (read_by_user_id);


--
-- Name: main_plandiscount_subplan_id_dac208ed; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_plandiscount_subplan_id_dac208ed ON public.main_plandiscount USING btree (subplan_id);


--
-- Name: main_subplanfeature_subplan_subplan_id_7f529d09; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_subplanfeature_subplan_subplan_id_7f529d09 ON public.main_subplanfeature_subplan USING btree (subplan_id);


--
-- Name: main_subplanfeature_subplan_subplanfeature_id_271236cf; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_subplanfeature_subplan_subplanfeature_id_271236cf ON public.main_subplanfeature_subplan USING btree (subplanfeature_id);


--
-- Name: main_subscriber_user_id_3a1710f0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_subscriber_user_id_3a1710f0 ON public.main_subscriber USING btree (user_id);


--
-- Name: main_subscription_plan_id_7c4ae514; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_subscription_plan_id_7c4ae514 ON public.main_subscription USING btree (plan_id);


--
-- Name: main_subscription_user_id_1046b95d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_subscription_user_id_1046b95d ON public.main_subscription USING btree (user_id);


--
-- Name: main_trainerachivement_trainer_id_9721cbf2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_trainerachivement_trainer_id_9721cbf2 ON public.main_trainerachivement USING btree (trainer_id);


--
-- Name: main_trainermsg_trainer_id_bbda00be; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_trainermsg_trainer_id_bbda00be ON public.main_trainermsg USING btree (trainer_id);


--
-- Name: main_trainermsg_user_id_af9055fc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_trainermsg_user_id_af9055fc ON public.main_trainermsg USING btree (user_id);


--
-- Name: main_trainersalary_trainer_id_66395ee6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_trainersalary_trainer_id_66395ee6 ON public.main_trainersalary USING btree (trainer_id);


--
-- Name: main_trainersubscriberreport_report_for_trainer_id_b5b188b6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_trainersubscriberreport_report_for_trainer_id_b5b188b6 ON public.main_trainersubscriberreport USING btree (report_for_trainer_id);


--
-- Name: main_trainersubscriberreport_report_for_user_id_70c95482; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_trainersubscriberreport_report_for_user_id_70c95482 ON public.main_trainersubscriberreport USING btree (report_for_user_id);


--
-- Name: main_trainersubscriberreport_report_from_trainer_id_c5480c4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_trainersubscriberreport_report_from_trainer_id_c5480c4b ON public.main_trainersubscriberreport USING btree (report_from_trainer_id);


--
-- Name: main_trainersubscriberreport_report_from_user_id_982c87ca; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_trainersubscriberreport_report_from_user_id_982c87ca ON public.main_trainersubscriberreport USING btree (report_from_user_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_assignsubscriber main_assignsubscriber_trainer_id_68159959_fk_main_trainer_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_assignsubscriber
    ADD CONSTRAINT main_assignsubscriber_trainer_id_68159959_fk_main_trainer_id FOREIGN KEY (trainer_id) REFERENCES public.main_trainer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_assignsubscriber main_assignsubscriber_user_id_ddb1b6bb_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_assignsubscriber
    ADD CONSTRAINT main_assignsubscriber_user_id_ddb1b6bb_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_galleryimage main_galleryimage_gallery_id_1cb3d125_fk_main_gallery_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_galleryimage
    ADD CONSTRAINT main_galleryimage_gallery_id_1cb3d125_fk_main_gallery_id FOREIGN KEY (gallery_id) REFERENCES public.main_gallery(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_notiftrainerstatus main_notiftrainersta_notif_id_632bfcb5_fk_main_trai; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_notiftrainerstatus
    ADD CONSTRAINT main_notiftrainersta_notif_id_632bfcb5_fk_main_trai FOREIGN KEY (notif_id) REFERENCES public.main_trainernotification(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_notiftrainerstatus main_notiftrainerstatus_trainer_id_8c91e0ae_fk_main_trainer_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_notiftrainerstatus
    ADD CONSTRAINT main_notiftrainerstatus_trainer_id_8c91e0ae_fk_main_trainer_id FOREIGN KEY (trainer_id) REFERENCES public.main_trainer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_notifuserstatus main_notifuserstatus_notif_id_8d22acc2_fk_main_notify_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_notifuserstatus
    ADD CONSTRAINT main_notifuserstatus_notif_id_8d22acc2_fk_main_notify_id FOREIGN KEY (notif_id) REFERENCES public.main_notify(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_notifuserstatus main_notifuserstatus_user_id_196b7d7e_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_notifuserstatus
    ADD CONSTRAINT main_notifuserstatus_user_id_196b7d7e_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_notify main_notify_read_by_trainer_id_3f0d1b22_fk_main_trainer_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_notify
    ADD CONSTRAINT main_notify_read_by_trainer_id_3f0d1b22_fk_main_trainer_id FOREIGN KEY (read_by_trainer_id) REFERENCES public.main_trainer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_notify main_notify_read_by_user_id_b215073b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_notify
    ADD CONSTRAINT main_notify_read_by_user_id_b215073b_fk_auth_user_id FOREIGN KEY (read_by_user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_plandiscount main_plandiscount_subplan_id_dac208ed_fk_main_subplan_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_plandiscount
    ADD CONSTRAINT main_plandiscount_subplan_id_dac208ed_fk_main_subplan_id FOREIGN KEY (subplan_id) REFERENCES public.main_subplan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_subplanfeature_subplan main_subplanfeature__subplan_id_7f529d09_fk_main_subp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_subplanfeature_subplan
    ADD CONSTRAINT main_subplanfeature__subplan_id_7f529d09_fk_main_subp FOREIGN KEY (subplan_id) REFERENCES public.main_subplan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_subplanfeature_subplan main_subplanfeature__subplanfeature_id_271236cf_fk_main_subp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_subplanfeature_subplan
    ADD CONSTRAINT main_subplanfeature__subplanfeature_id_271236cf_fk_main_subp FOREIGN KEY (subplanfeature_id) REFERENCES public.main_subplanfeature(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_subscriber main_subscriber_user_id_3a1710f0_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_subscriber
    ADD CONSTRAINT main_subscriber_user_id_3a1710f0_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_subscription main_subscription_plan_id_7c4ae514_fk_main_subplan_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_subscription
    ADD CONSTRAINT main_subscription_plan_id_7c4ae514_fk_main_subplan_id FOREIGN KEY (plan_id) REFERENCES public.main_subplan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_subscription main_subscription_user_id_1046b95d_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_subscription
    ADD CONSTRAINT main_subscription_user_id_1046b95d_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_trainerachivement main_trainerachivement_trainer_id_9721cbf2_fk_main_trainer_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_trainerachivement
    ADD CONSTRAINT main_trainerachivement_trainer_id_9721cbf2_fk_main_trainer_id FOREIGN KEY (trainer_id) REFERENCES public.main_trainer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_trainermsg main_trainermsg_trainer_id_bbda00be_fk_main_trainer_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_trainermsg
    ADD CONSTRAINT main_trainermsg_trainer_id_bbda00be_fk_main_trainer_id FOREIGN KEY (trainer_id) REFERENCES public.main_trainer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_trainermsg main_trainermsg_user_id_af9055fc_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_trainermsg
    ADD CONSTRAINT main_trainermsg_user_id_af9055fc_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_trainersalary main_trainersalary_trainer_id_66395ee6_fk_main_trainer_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_trainersalary
    ADD CONSTRAINT main_trainersalary_trainer_id_66395ee6_fk_main_trainer_id FOREIGN KEY (trainer_id) REFERENCES public.main_trainer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_trainersubscriberreport main_trainersubscrib_report_for_trainer_i_b5b188b6_fk_main_trai; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_trainersubscriberreport
    ADD CONSTRAINT main_trainersubscrib_report_for_trainer_i_b5b188b6_fk_main_trai FOREIGN KEY (report_for_trainer_id) REFERENCES public.main_trainer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_trainersubscriberreport main_trainersubscrib_report_for_user_id_70c95482_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_trainersubscriberreport
    ADD CONSTRAINT main_trainersubscrib_report_for_user_id_70c95482_fk_auth_user FOREIGN KEY (report_for_user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_trainersubscriberreport main_trainersubscrib_report_from_trainer__c5480c4b_fk_main_trai; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_trainersubscriberreport
    ADD CONSTRAINT main_trainersubscrib_report_from_trainer__c5480c4b_fk_main_trai FOREIGN KEY (report_from_trainer_id) REFERENCES public.main_trainer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_trainersubscriberreport main_trainersubscrib_report_from_user_id_982c87ca_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_trainersubscriberreport
    ADD CONSTRAINT main_trainersubscrib_report_from_user_id_982c87ca_fk_auth_user FOREIGN KEY (report_from_user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: demo_advert; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE demo_advert (
    id integer NOT NULL,
    url character varying(200),
    text character varying(255) NOT NULL,
    page_id integer
);


--
-- Name: demo_advert_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE demo_advert_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: demo_advert_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE demo_advert_id_seq OWNED BY demo_advert.id;


--
-- Name: demo_advertplacement; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE demo_advertplacement (
    id integer NOT NULL,
    advert_id integer NOT NULL,
    page_id integer NOT NULL
);


--
-- Name: demo_advertplacement_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE demo_advertplacement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: demo_advertplacement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE demo_advertplacement_id_seq OWNED BY demo_advertplacement.id;


--
-- Name: demo_blogindexpage; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE demo_blogindexpage (
    page_ptr_id integer NOT NULL,
    intro text NOT NULL,
    br_link_id integer
);


--
-- Name: demo_blogindexpagerelatedlink; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE demo_blogindexpagerelatedlink (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200) NOT NULL,
    title character varying(255) NOT NULL,
    link_document_id integer,
    link_page_id integer,
    page_id integer NOT NULL
);


--
-- Name: demo_blogindexpagerelatedlink_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE demo_blogindexpagerelatedlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: demo_blogindexpagerelatedlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE demo_blogindexpagerelatedlink_id_seq OWNED BY demo_blogindexpagerelatedlink.id;


--
-- Name: demo_blogpage; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE demo_blogpage (
    page_ptr_id integer NOT NULL,
    body text NOT NULL,
    date date NOT NULL,
    feed_image_id integer,
    br_link_id integer
);


--
-- Name: demo_blogpagecarouselitem; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE demo_blogpagecarouselitem (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200) NOT NULL,
    embed_url character varying(200) NOT NULL,
    caption character varying(255) NOT NULL,
    image_id integer,
    link_document_id integer,
    link_page_id integer,
    page_id integer NOT NULL
);


--
-- Name: demo_blogpagecarouselitem_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE demo_blogpagecarouselitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: demo_blogpagecarouselitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE demo_blogpagecarouselitem_id_seq OWNED BY demo_blogpagecarouselitem.id;


--
-- Name: demo_blogpagerelatedlink; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE demo_blogpagerelatedlink (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200) NOT NULL,
    title character varying(255) NOT NULL,
    link_document_id integer,
    link_page_id integer,
    page_id integer NOT NULL
);


--
-- Name: demo_blogpagerelatedlink_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE demo_blogpagerelatedlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: demo_blogpagerelatedlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE demo_blogpagerelatedlink_id_seq OWNED BY demo_blogpagerelatedlink.id;


--
-- Name: demo_blogpagetag; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE demo_blogpagetag (
    id integer NOT NULL,
    content_object_id integer NOT NULL,
    tag_id integer NOT NULL
);


--
-- Name: demo_blogpagetag_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE demo_blogpagetag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: demo_blogpagetag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE demo_blogpagetag_id_seq OWNED BY demo_blogpagetag.id;


--
-- Name: demo_contactpage; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE demo_contactpage (
    page_ptr_id integer NOT NULL,
    telephone character varying(20) NOT NULL,
    email character varying(75) NOT NULL,
    address_1 character varying(255) NOT NULL,
    address_2 character varying(255) NOT NULL,
    city character varying(255) NOT NULL,
    country character varying(255) NOT NULL,
    post_code character varying(10) NOT NULL,
    body text NOT NULL,
    feed_image_id integer,
    br_link_id integer
);


--
-- Name: demo_courseindexpage; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE demo_courseindexpage (
    page_ptr_id integer NOT NULL,
    intro text NOT NULL,
    br_link_id integer,
    header_image_id integer,
    body text NOT NULL
);


--
-- Name: demo_courseindexpagerelatedlink; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE demo_courseindexpagerelatedlink (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200) NOT NULL,
    title character varying(255) NOT NULL,
    link_document_id integer,
    link_page_id integer,
    page_id integer NOT NULL
);


--
-- Name: demo_courseindexpagerelatedlink_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE demo_courseindexpagerelatedlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: demo_courseindexpagerelatedlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE demo_courseindexpagerelatedlink_id_seq OWNED BY demo_courseindexpagerelatedlink.id;


--
-- Name: demo_coursepage; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE demo_coursepage (
    page_ptr_id integer NOT NULL,
    date_from date NOT NULL,
    body text NOT NULL,
    cost_lecture character varying(255) NOT NULL,
    cost_outreach character varying(255) NOT NULL,
    signup_link character varying(200) NOT NULL,
    br_link_id integer,
    feed_image_id integer,
    header_image_id integer,
    languages character varying(255) NOT NULL
);


--
-- Name: demo_coursepagerelatedlink; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE demo_coursepagerelatedlink (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200) NOT NULL,
    title character varying(255) NOT NULL,
    link_document_id integer,
    link_page_id integer,
    page_id integer NOT NULL
);


--
-- Name: demo_coursepagerelatedlink_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE demo_coursepagerelatedlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: demo_coursepagerelatedlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE demo_coursepagerelatedlink_id_seq OWNED BY demo_coursepagerelatedlink.id;


--
-- Name: demo_eventindexpage; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE demo_eventindexpage (
    page_ptr_id integer NOT NULL,
    intro text NOT NULL,
    br_link_id integer
);


--
-- Name: demo_eventindexpagerelatedlink; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE demo_eventindexpagerelatedlink (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200) NOT NULL,
    title character varying(255) NOT NULL,
    link_document_id integer,
    link_page_id integer,
    page_id integer NOT NULL
);


--
-- Name: demo_eventindexpagerelatedlink_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE demo_eventindexpagerelatedlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: demo_eventindexpagerelatedlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE demo_eventindexpagerelatedlink_id_seq OWNED BY demo_eventindexpagerelatedlink.id;


--
-- Name: demo_eventpage; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE demo_eventpage (
    page_ptr_id integer NOT NULL,
    date_from date NOT NULL,
    date_to date,
    time_from time without time zone,
    time_to time without time zone,
    audience character varying(255) NOT NULL,
    location character varying(255) NOT NULL,
    body text NOT NULL,
    cost character varying(255) NOT NULL,
    signup_link character varying(200) NOT NULL,
    feed_image_id integer,
    br_link_id integer
);


--
-- Name: demo_eventpagecarouselitem; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE demo_eventpagecarouselitem (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200) NOT NULL,
    embed_url character varying(200) NOT NULL,
    caption character varying(255) NOT NULL,
    image_id integer,
    link_document_id integer,
    link_page_id integer,
    page_id integer NOT NULL
);


--
-- Name: demo_eventpagecarouselitem_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE demo_eventpagecarouselitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: demo_eventpagecarouselitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE demo_eventpagecarouselitem_id_seq OWNED BY demo_eventpagecarouselitem.id;


--
-- Name: demo_eventpagerelatedlink; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE demo_eventpagerelatedlink (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200) NOT NULL,
    title character varying(255) NOT NULL,
    link_document_id integer,
    link_page_id integer,
    page_id integer NOT NULL
);


--
-- Name: demo_eventpagerelatedlink_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE demo_eventpagerelatedlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: demo_eventpagerelatedlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE demo_eventpagerelatedlink_id_seq OWNED BY demo_eventpagerelatedlink.id;


--
-- Name: demo_eventpagespeaker; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE demo_eventpagespeaker (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200) NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    image_id integer,
    link_document_id integer,
    link_page_id integer,
    page_id integer NOT NULL
);


--
-- Name: demo_eventpagespeaker_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE demo_eventpagespeaker_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: demo_eventpagespeaker_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE demo_eventpagespeaker_id_seq OWNED BY demo_eventpagespeaker.id;


--
-- Name: demo_formfield; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE demo_formfield (
    id integer NOT NULL,
    sort_order integer,
    label character varying(255) NOT NULL,
    field_type character varying(16) NOT NULL,
    required boolean NOT NULL,
    choices character varying(512) NOT NULL,
    default_value character varying(255) NOT NULL,
    help_text character varying(255) NOT NULL,
    page_id integer NOT NULL
);


--
-- Name: demo_formfield_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE demo_formfield_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: demo_formfield_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE demo_formfield_id_seq OWNED BY demo_formfield.id;


--
-- Name: demo_formpage; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE demo_formpage (
    page_ptr_id integer NOT NULL,
    to_address character varying(255) NOT NULL,
    from_address character varying(255) NOT NULL,
    subject character varying(255) NOT NULL,
    intro text NOT NULL,
    thank_you_text text NOT NULL
);


--
-- Name: demo_homepage; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE demo_homepage (
    page_ptr_id integer NOT NULL,
    body text NOT NULL,
    slogan character varying(255) NOT NULL,
    br_link_id integer
);


--
-- Name: demo_homepagecarouselitem; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE demo_homepagecarouselitem (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200) NOT NULL,
    embed_url character varying(200) NOT NULL,
    caption character varying(255) NOT NULL,
    image_id integer,
    link_document_id integer,
    link_page_id integer,
    page_id integer NOT NULL
);


--
-- Name: demo_homepagecarouselitem_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE demo_homepagecarouselitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: demo_homepagecarouselitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE demo_homepagecarouselitem_id_seq OWNED BY demo_homepagecarouselitem.id;


--
-- Name: demo_homepagerelatedlink; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE demo_homepagerelatedlink (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200) NOT NULL,
    title character varying(255) NOT NULL,
    link_document_id integer,
    link_page_id integer,
    page_id integer NOT NULL
);


--
-- Name: demo_homepagerelatedlink_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE demo_homepagerelatedlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: demo_homepagerelatedlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE demo_homepagerelatedlink_id_seq OWNED BY demo_homepagerelatedlink.id;


--
-- Name: demo_languageredirectionpage; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE demo_languageredirectionpage (
    page_ptr_id integer NOT NULL
);


--
-- Name: demo_personpage; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE demo_personpage (
    page_ptr_id integer NOT NULL,
    telephone character varying(20) NOT NULL,
    email character varying(75) NOT NULL,
    address_1 character varying(255) NOT NULL,
    address_2 character varying(255) NOT NULL,
    city character varying(255) NOT NULL,
    country character varying(255) NOT NULL,
    post_code character varying(10) NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    intro text NOT NULL,
    biography text NOT NULL,
    feed_image_id integer,
    image_id integer,
    br_link_id integer
);


--
-- Name: demo_personpagerelatedlink; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE demo_personpagerelatedlink (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200) NOT NULL,
    title character varying(255) NOT NULL,
    link_document_id integer,
    link_page_id integer,
    page_id integer NOT NULL
);


--
-- Name: demo_personpagerelatedlink_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE demo_personpagerelatedlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: demo_personpagerelatedlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE demo_personpagerelatedlink_id_seq OWNED BY demo_personpagerelatedlink.id;


--
-- Name: demo_standardindexpage; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE demo_standardindexpage (
    page_ptr_id integer NOT NULL,
    intro text NOT NULL,
    feed_image_id integer,
    br_link_id integer
);


--
-- Name: demo_standardindexpagerelatedlink; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE demo_standardindexpagerelatedlink (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200) NOT NULL,
    title character varying(255) NOT NULL,
    link_document_id integer,
    link_page_id integer,
    page_id integer NOT NULL
);


--
-- Name: demo_standardindexpagerelatedlink_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE demo_standardindexpagerelatedlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: demo_standardindexpagerelatedlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE demo_standardindexpagerelatedlink_id_seq OWNED BY demo_standardindexpagerelatedlink.id;


--
-- Name: demo_standardpage; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE demo_standardpage (
    page_ptr_id integer NOT NULL,
    intro text NOT NULL,
    body text NOT NULL,
    feed_image_id integer,
    br_link_id integer
);


--
-- Name: demo_standardpagecarouselitem; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE demo_standardpagecarouselitem (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200) NOT NULL,
    embed_url character varying(200) NOT NULL,
    caption character varying(255) NOT NULL,
    image_id integer,
    link_document_id integer,
    link_page_id integer,
    page_id integer NOT NULL
);


--
-- Name: demo_standardpagecarouselitem_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE demo_standardpagecarouselitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: demo_standardpagecarouselitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE demo_standardpagecarouselitem_id_seq OWNED BY demo_standardpagecarouselitem.id;


--
-- Name: demo_standardpagerelatedlink; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE demo_standardpagerelatedlink (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200) NOT NULL,
    title character varying(255) NOT NULL,
    link_document_id integer,
    link_page_id integer,
    page_id integer NOT NULL
);


--
-- Name: demo_standardpagerelatedlink_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE demo_standardpagerelatedlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: demo_standardpagerelatedlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE demo_standardpagerelatedlink_id_seq OWNED BY demo_standardpagerelatedlink.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE django_admin_log (
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


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


--
-- Name: taggit_tag; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE taggit_tag (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL
);


--
-- Name: taggit_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE taggit_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: taggit_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE taggit_tag_id_seq OWNED BY taggit_tag.id;


--
-- Name: taggit_taggeditem; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE taggit_taggeditem (
    id integer NOT NULL,
    object_id integer NOT NULL,
    content_type_id integer NOT NULL,
    tag_id integer NOT NULL
);


--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE taggit_taggeditem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE taggit_taggeditem_id_seq OWNED BY taggit_taggeditem.id;


--
-- Name: wagtailcore_grouppagepermission; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE wagtailcore_grouppagepermission (
    id integer NOT NULL,
    permission_type character varying(20) NOT NULL,
    group_id integer NOT NULL,
    page_id integer NOT NULL
);


--
-- Name: wagtailcore_grouppagepermission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailcore_grouppagepermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailcore_grouppagepermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailcore_grouppagepermission_id_seq OWNED BY wagtailcore_grouppagepermission.id;


--
-- Name: wagtailcore_page; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE wagtailcore_page (
    id integer NOT NULL,
    path character varying(255) NOT NULL,
    depth integer NOT NULL,
    numchild integer NOT NULL,
    title character varying(255) NOT NULL,
    slug character varying(50) NOT NULL,
    live boolean NOT NULL,
    has_unpublished_changes boolean NOT NULL,
    url_path character varying(255) NOT NULL,
    seo_title character varying(255) NOT NULL,
    show_in_menus boolean NOT NULL,
    search_description text NOT NULL,
    go_live_at timestamp with time zone,
    expire_at timestamp with time zone,
    expired boolean NOT NULL,
    content_type_id integer NOT NULL,
    owner_id integer,
    locked boolean NOT NULL,
    latest_revision_created_at timestamp with time zone,
    CONSTRAINT wagtailcore_page_depth_check CHECK ((depth >= 0)),
    CONSTRAINT wagtailcore_page_numchild_check CHECK ((numchild >= 0))
);


--
-- Name: wagtailcore_page_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailcore_page_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailcore_page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailcore_page_id_seq OWNED BY wagtailcore_page.id;


--
-- Name: wagtailcore_pagerevision; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE wagtailcore_pagerevision (
    id integer NOT NULL,
    submitted_for_moderation boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    content_json text NOT NULL,
    approved_go_live_at timestamp with time zone,
    page_id integer NOT NULL,
    user_id integer
);


--
-- Name: wagtailcore_pagerevision_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailcore_pagerevision_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailcore_pagerevision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailcore_pagerevision_id_seq OWNED BY wagtailcore_pagerevision.id;


--
-- Name: wagtailcore_pageviewrestriction; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE wagtailcore_pageviewrestriction (
    id integer NOT NULL,
    password character varying(255) NOT NULL,
    page_id integer NOT NULL
);


--
-- Name: wagtailcore_pageviewrestriction_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailcore_pageviewrestriction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailcore_pageviewrestriction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailcore_pageviewrestriction_id_seq OWNED BY wagtailcore_pageviewrestriction.id;


--
-- Name: wagtailcore_site; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE wagtailcore_site (
    id integer NOT NULL,
    hostname character varying(255) NOT NULL,
    port integer NOT NULL,
    is_default_site boolean NOT NULL,
    root_page_id integer NOT NULL
);


--
-- Name: wagtailcore_site_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailcore_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailcore_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailcore_site_id_seq OWNED BY wagtailcore_site.id;


--
-- Name: wagtaildocs_document; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE wagtaildocs_document (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    file character varying(100) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    uploaded_by_user_id integer
);


--
-- Name: wagtaildocs_document_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtaildocs_document_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtaildocs_document_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtaildocs_document_id_seq OWNED BY wagtaildocs_document.id;


--
-- Name: wagtailembeds_embed; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE wagtailembeds_embed (
    id integer NOT NULL,
    url character varying(200) NOT NULL,
    max_width smallint,
    type character varying(10) NOT NULL,
    html text NOT NULL,
    title text NOT NULL,
    author_name text NOT NULL,
    provider_name text NOT NULL,
    thumbnail_url character varying(200),
    width integer,
    height integer,
    last_updated timestamp with time zone NOT NULL
);


--
-- Name: wagtailembeds_embed_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailembeds_embed_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailembeds_embed_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailembeds_embed_id_seq OWNED BY wagtailembeds_embed.id;


--
-- Name: wagtailforms_formsubmission; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE wagtailforms_formsubmission (
    id integer NOT NULL,
    form_data text NOT NULL,
    submit_time timestamp with time zone NOT NULL,
    page_id integer NOT NULL
);


--
-- Name: wagtailforms_formsubmission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailforms_formsubmission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailforms_formsubmission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailforms_formsubmission_id_seq OWNED BY wagtailforms_formsubmission.id;


--
-- Name: wagtailimages_filter; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE wagtailimages_filter (
    id integer NOT NULL,
    spec character varying(255) NOT NULL
);


--
-- Name: wagtailimages_filter_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailimages_filter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailimages_filter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailimages_filter_id_seq OWNED BY wagtailimages_filter.id;


--
-- Name: wagtailimages_image; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE wagtailimages_image (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    file character varying(100) NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    focal_point_x integer,
    focal_point_y integer,
    focal_point_width integer,
    focal_point_height integer,
    uploaded_by_user_id integer,
    CONSTRAINT wagtailimages_image_focal_point_height_check CHECK ((focal_point_height >= 0)),
    CONSTRAINT wagtailimages_image_focal_point_width_check CHECK ((focal_point_width >= 0)),
    CONSTRAINT wagtailimages_image_focal_point_x_check CHECK ((focal_point_x >= 0)),
    CONSTRAINT wagtailimages_image_focal_point_y_check CHECK ((focal_point_y >= 0))
);


--
-- Name: wagtailimages_image_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailimages_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailimages_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailimages_image_id_seq OWNED BY wagtailimages_image.id;


--
-- Name: wagtailimages_rendition; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE wagtailimages_rendition (
    id integer NOT NULL,
    file character varying(100) NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    focal_point_key character varying(255) NOT NULL,
    filter_id integer NOT NULL,
    image_id integer NOT NULL
);


--
-- Name: wagtailimages_rendition_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailimages_rendition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailimages_rendition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailimages_rendition_id_seq OWNED BY wagtailimages_rendition.id;


--
-- Name: wagtailredirects_redirect; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE wagtailredirects_redirect (
    id integer NOT NULL,
    old_path character varying(255) NOT NULL,
    is_permanent boolean NOT NULL,
    redirect_link character varying(200) NOT NULL,
    redirect_page_id integer,
    site_id integer
);


--
-- Name: wagtailredirects_redirect_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailredirects_redirect_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailredirects_redirect_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailredirects_redirect_id_seq OWNED BY wagtailredirects_redirect.id;


--
-- Name: wagtailsearch_editorspick; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE wagtailsearch_editorspick (
    id integer NOT NULL,
    sort_order integer,
    description text NOT NULL,
    page_id integer NOT NULL,
    query_id integer NOT NULL
);


--
-- Name: wagtailsearch_editorspick_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailsearch_editorspick_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailsearch_editorspick_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailsearch_editorspick_id_seq OWNED BY wagtailsearch_editorspick.id;


--
-- Name: wagtailsearch_query; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE wagtailsearch_query (
    id integer NOT NULL,
    query_string character varying(255) NOT NULL
);


--
-- Name: wagtailsearch_query_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailsearch_query_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailsearch_query_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailsearch_query_id_seq OWNED BY wagtailsearch_query.id;


--
-- Name: wagtailsearch_querydailyhits; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE wagtailsearch_querydailyhits (
    id integer NOT NULL,
    date date NOT NULL,
    hits integer NOT NULL,
    query_id integer NOT NULL
);


--
-- Name: wagtailsearch_querydailyhits_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailsearch_querydailyhits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailsearch_querydailyhits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailsearch_querydailyhits_id_seq OWNED BY wagtailsearch_querydailyhits.id;


--
-- Name: wagtailusers_userprofile; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE wagtailusers_userprofile (
    id integer NOT NULL,
    submitted_notifications boolean NOT NULL,
    approved_notifications boolean NOT NULL,
    rejected_notifications boolean NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: wagtailusers_userprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailusers_userprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailusers_userprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailusers_userprofile_id_seq OWNED BY wagtailusers_userprofile.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_advert ALTER COLUMN id SET DEFAULT nextval('demo_advert_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_advertplacement ALTER COLUMN id SET DEFAULT nextval('demo_advertplacement_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_blogindexpagerelatedlink ALTER COLUMN id SET DEFAULT nextval('demo_blogindexpagerelatedlink_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_blogpagecarouselitem ALTER COLUMN id SET DEFAULT nextval('demo_blogpagecarouselitem_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_blogpagerelatedlink ALTER COLUMN id SET DEFAULT nextval('demo_blogpagerelatedlink_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_blogpagetag ALTER COLUMN id SET DEFAULT nextval('demo_blogpagetag_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_courseindexpagerelatedlink ALTER COLUMN id SET DEFAULT nextval('demo_courseindexpagerelatedlink_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_coursepagerelatedlink ALTER COLUMN id SET DEFAULT nextval('demo_coursepagerelatedlink_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_eventindexpagerelatedlink ALTER COLUMN id SET DEFAULT nextval('demo_eventindexpagerelatedlink_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_eventpagecarouselitem ALTER COLUMN id SET DEFAULT nextval('demo_eventpagecarouselitem_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_eventpagerelatedlink ALTER COLUMN id SET DEFAULT nextval('demo_eventpagerelatedlink_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_eventpagespeaker ALTER COLUMN id SET DEFAULT nextval('demo_eventpagespeaker_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_formfield ALTER COLUMN id SET DEFAULT nextval('demo_formfield_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_homepagecarouselitem ALTER COLUMN id SET DEFAULT nextval('demo_homepagecarouselitem_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_homepagerelatedlink ALTER COLUMN id SET DEFAULT nextval('demo_homepagerelatedlink_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_personpagerelatedlink ALTER COLUMN id SET DEFAULT nextval('demo_personpagerelatedlink_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_standardindexpagerelatedlink ALTER COLUMN id SET DEFAULT nextval('demo_standardindexpagerelatedlink_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_standardpagecarouselitem ALTER COLUMN id SET DEFAULT nextval('demo_standardpagecarouselitem_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_standardpagerelatedlink ALTER COLUMN id SET DEFAULT nextval('demo_standardpagerelatedlink_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY taggit_tag ALTER COLUMN id SET DEFAULT nextval('taggit_tag_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY taggit_taggeditem ALTER COLUMN id SET DEFAULT nextval('taggit_taggeditem_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_grouppagepermission ALTER COLUMN id SET DEFAULT nextval('wagtailcore_grouppagepermission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_page ALTER COLUMN id SET DEFAULT nextval('wagtailcore_page_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_pagerevision ALTER COLUMN id SET DEFAULT nextval('wagtailcore_pagerevision_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_pageviewrestriction ALTER COLUMN id SET DEFAULT nextval('wagtailcore_pageviewrestriction_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_site ALTER COLUMN id SET DEFAULT nextval('wagtailcore_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtaildocs_document ALTER COLUMN id SET DEFAULT nextval('wagtaildocs_document_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailembeds_embed ALTER COLUMN id SET DEFAULT nextval('wagtailembeds_embed_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailforms_formsubmission ALTER COLUMN id SET DEFAULT nextval('wagtailforms_formsubmission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailimages_filter ALTER COLUMN id SET DEFAULT nextval('wagtailimages_filter_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailimages_image ALTER COLUMN id SET DEFAULT nextval('wagtailimages_image_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailimages_rendition ALTER COLUMN id SET DEFAULT nextval('wagtailimages_rendition_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailredirects_redirect ALTER COLUMN id SET DEFAULT nextval('wagtailredirects_redirect_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailsearch_editorspick ALTER COLUMN id SET DEFAULT nextval('wagtailsearch_editorspick_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailsearch_query ALTER COLUMN id SET DEFAULT nextval('wagtailsearch_query_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailsearch_querydailyhits ALTER COLUMN id SET DEFAULT nextval('wagtailsearch_querydailyhits_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailusers_userprofile ALTER COLUMN id SET DEFAULT nextval('wagtailusers_userprofile_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_group (id, name) FROM stdin;
1	Moderators
2	Editors
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_group_id_seq', 2, true);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	2	1
5	2	2
6	2	3
7	1	4
8	1	5
9	1	6
10	2	4
11	2	5
12	2	6
13	1	7
14	2	7
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 14, true);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add image	2	add_image
2	Can change image	2	change_image
3	Can delete image	2	delete_image
4	Can add document	3	add_document
5	Can change document	3	change_document
6	Can delete document	3	delete_document
7	Can access Wagtail admin	4	access_admin
8	Can add permission	5	add_permission
9	Can change permission	5	change_permission
10	Can delete permission	5	delete_permission
11	Can add group	6	add_group
12	Can change group	6	change_group
13	Can delete group	6	delete_group
14	Can add user	7	add_user
15	Can change user	7	change_user
16	Can delete user	7	delete_user
17	Can add content type	8	add_contenttype
18	Can change content type	8	change_contenttype
19	Can delete content type	8	delete_contenttype
20	Can add session	9	add_session
21	Can change session	9	change_session
22	Can delete session	9	delete_session
23	Can add Tag	10	add_tag
24	Can change Tag	10	change_tag
25	Can delete Tag	10	delete_tag
26	Can add Tagged Item	11	add_taggeditem
27	Can change Tagged Item	11	change_taggeditem
28	Can delete Tagged Item	11	delete_taggeditem
29	Can add log entry	12	add_logentry
30	Can change log entry	12	change_logentry
31	Can delete log entry	12	delete_logentry
32	Can add site	13	add_site
33	Can change site	13	change_site
34	Can delete site	13	delete_site
35	Can add page	1	add_page
36	Can change page	1	change_page
37	Can delete page	1	delete_page
38	Can add page revision	14	add_pagerevision
39	Can change page revision	14	change_pagerevision
40	Can delete page revision	14	delete_pagerevision
41	Can add group page permission	15	add_grouppagepermission
42	Can change group page permission	15	change_grouppagepermission
43	Can delete group page permission	15	delete_grouppagepermission
44	Can add page view restriction	16	add_pageviewrestriction
45	Can change page view restriction	16	change_pageviewrestriction
46	Can delete page view restriction	16	delete_pageviewrestriction
47	Can add user profile	17	add_userprofile
48	Can change user profile	17	change_userprofile
49	Can delete user profile	17	delete_userprofile
50	Can add filter	18	add_filter
51	Can change filter	18	change_filter
52	Can delete filter	18	delete_filter
53	Can add rendition	19	add_rendition
54	Can change rendition	19	change_rendition
55	Can delete rendition	19	delete_rendition
56	Can add embed	20	add_embed
57	Can change embed	20	change_embed
58	Can delete embed	20	delete_embed
59	Can add query	21	add_query
60	Can change query	21	change_query
61	Can delete query	21	delete_query
62	Can add query daily hits	22	add_querydailyhits
63	Can change query daily hits	22	change_querydailyhits
64	Can delete query daily hits	22	delete_querydailyhits
65	Can add editors pick	23	add_editorspick
66	Can change editors pick	23	change_editorspick
67	Can delete editors pick	23	delete_editorspick
68	Can add redirect	24	add_redirect
69	Can change redirect	24	change_redirect
70	Can delete redirect	24	delete_redirect
71	Can add form submission	25	add_formsubmission
72	Can change form submission	25	change_formsubmission
73	Can delete form submission	25	delete_formsubmission
74	Can add advert placement	26	add_advertplacement
75	Can change advert placement	26	change_advertplacement
76	Can delete advert placement	26	delete_advertplacement
77	Can add advert	27	add_advert
78	Can change advert	27	change_advert
79	Can delete advert	27	delete_advert
80	Can add home page carousel item	28	add_homepagecarouselitem
81	Can change home page carousel item	28	change_homepagecarouselitem
82	Can delete home page carousel item	28	delete_homepagecarouselitem
83	Can add home page related link	29	add_homepagerelatedlink
84	Can change home page related link	29	change_homepagerelatedlink
85	Can delete home page related link	29	delete_homepagerelatedlink
86	Can add Homepage	30	add_homepage
87	Can change Homepage	30	change_homepage
88	Can delete Homepage	30	delete_homepage
89	Can add standard index page related link	31	add_standardindexpagerelatedlink
90	Can change standard index page related link	31	change_standardindexpagerelatedlink
91	Can delete standard index page related link	31	delete_standardindexpagerelatedlink
92	Can add standard index page	32	add_standardindexpage
93	Can change standard index page	32	change_standardindexpage
94	Can delete standard index page	32	delete_standardindexpage
95	Can add standard page carousel item	33	add_standardpagecarouselitem
96	Can change standard page carousel item	33	change_standardpagecarouselitem
97	Can delete standard page carousel item	33	delete_standardpagecarouselitem
98	Can add standard page related link	34	add_standardpagerelatedlink
99	Can change standard page related link	34	change_standardpagerelatedlink
100	Can delete standard page related link	34	delete_standardpagerelatedlink
101	Can add standard page	35	add_standardpage
102	Can change standard page	35	change_standardpage
103	Can delete standard page	35	delete_standardpage
104	Can add blog index page related link	36	add_blogindexpagerelatedlink
105	Can change blog index page related link	36	change_blogindexpagerelatedlink
106	Can delete blog index page related link	36	delete_blogindexpagerelatedlink
107	Can add blog index page	37	add_blogindexpage
108	Can change blog index page	37	change_blogindexpage
109	Can delete blog index page	37	delete_blogindexpage
110	Can add blog page carousel item	38	add_blogpagecarouselitem
111	Can change blog page carousel item	38	change_blogpagecarouselitem
112	Can delete blog page carousel item	38	delete_blogpagecarouselitem
113	Can add blog page related link	39	add_blogpagerelatedlink
114	Can change blog page related link	39	change_blogpagerelatedlink
115	Can delete blog page related link	39	delete_blogpagerelatedlink
116	Can add blog page tag	40	add_blogpagetag
117	Can change blog page tag	40	change_blogpagetag
118	Can delete blog page tag	40	delete_blogpagetag
119	Can add blog page	41	add_blogpage
120	Can change blog page	41	change_blogpage
121	Can delete blog page	41	delete_blogpage
122	Can add person page related link	42	add_personpagerelatedlink
123	Can change person page related link	42	change_personpagerelatedlink
124	Can delete person page related link	42	delete_personpagerelatedlink
125	Can add person page	43	add_personpage
126	Can change person page	43	change_personpage
127	Can delete person page	43	delete_personpage
128	Can add contact page	44	add_contactpage
129	Can change contact page	44	change_contactpage
130	Can delete contact page	44	delete_contactpage
131	Can add event index page related link	45	add_eventindexpagerelatedlink
132	Can change event index page related link	45	change_eventindexpagerelatedlink
133	Can delete event index page related link	45	delete_eventindexpagerelatedlink
134	Can add event index page	46	add_eventindexpage
135	Can change event index page	46	change_eventindexpage
136	Can delete event index page	46	delete_eventindexpage
137	Can add event page carousel item	47	add_eventpagecarouselitem
138	Can change event page carousel item	47	change_eventpagecarouselitem
139	Can delete event page carousel item	47	delete_eventpagecarouselitem
140	Can add event page related link	48	add_eventpagerelatedlink
141	Can change event page related link	48	change_eventpagerelatedlink
142	Can delete event page related link	48	delete_eventpagerelatedlink
143	Can add event page speaker	49	add_eventpagespeaker
144	Can change event page speaker	49	change_eventpagespeaker
145	Can delete event page speaker	49	delete_eventpagespeaker
146	Can add event page	50	add_eventpage
147	Can change event page	50	change_eventpage
148	Can delete event page	50	delete_eventpage
149	Can add form field	51	add_formfield
150	Can change form field	51	change_formfield
151	Can delete form field	51	delete_formfield
152	Can add form page	52	add_formpage
153	Can change form page	52	change_formpage
154	Can delete form page	52	delete_formpage
155	Can add language redirection page	53	add_languageredirectionpage
156	Can change language redirection page	53	change_languageredirectionpage
157	Can delete language redirection page	53	delete_languageredirectionpage
158	Can add course index page related link	54	add_courseindexpagerelatedlink
159	Can change course index page related link	54	change_courseindexpagerelatedlink
160	Can delete course index page related link	54	delete_courseindexpagerelatedlink
161	Can add course index page	55	add_courseindexpage
162	Can change course index page	55	change_courseindexpage
163	Can delete course index page	55	delete_courseindexpage
164	Can add course page related link	56	add_coursepagerelatedlink
165	Can change course page related link	56	change_coursepagerelatedlink
166	Can delete course page related link	56	delete_coursepagerelatedlink
167	Can add course page	57	add_coursepage
168	Can change course page	57	change_coursepage
169	Can delete course page	57	delete_coursepage
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_permission_id_seq', 169, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$12000$dQHBdKXyC7Si$KAwau1lN8a4qomvRkF3S+dsFXr1tiztD2UOw7bO1uZs=	2015-04-24 14:49:51.79068+00	t	admin				t	t	2015-01-15 10:13:48.969+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: demo_advert; Type: TABLE DATA; Schema: public; Owner: -
--

COPY demo_advert (id, url, text, page_id) FROM stdin;
1		Photo credits	17
2		Contact	12
\.


--
-- Name: demo_advert_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('demo_advert_id_seq', 2, true);


--
-- Data for Name: demo_advertplacement; Type: TABLE DATA; Schema: public; Owner: -
--

COPY demo_advertplacement (id, advert_id, page_id) FROM stdin;
\.


--
-- Name: demo_advertplacement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('demo_advertplacement_id_seq', 1, false);


--
-- Data for Name: demo_blogindexpage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY demo_blogindexpage (page_ptr_id, intro, br_link_id) FROM stdin;
28	<p>Three species are poly- or paraphyletic in the present taxonomical arrangement and either subspecies need to be reassigned and/or species split up. The Blue-headed Wagtail (AKA Yellow Wagtail and many other names), especially, has always been a taxonomical nightmare with over a dozen currently accepted subspecies and many more invalid ones. The two remaining "monochrome" species, Mekong and African Pied Wagtail may be closely related, or a most striking example of convergent evolution.</p>	\N
5	<p>Three species are poly- or paraphyletic in the present taxonomical arrangement and either subspecies need to be reassigned and/or species split up. The Blue-headed Wagtail (AKA Yellow Wagtail and many other names), especially, has always been a taxonomical nightmare with over a dozen currently accepted subspecies and many more invalid ones. The two remaining "monochrome" species, Mekong and African Pied Wagtail may be closely related, or a most striking example of convergent evolution.</p>	\N
\.


--
-- Data for Name: demo_blogindexpagerelatedlink; Type: TABLE DATA; Schema: public; Owner: -
--

COPY demo_blogindexpagerelatedlink (id, sort_order, link_external, title, link_document_id, link_page_id, page_id) FROM stdin;
2	0		Events index	\N	4	28
1	0		Treinamento	\N	44	5
\.


--
-- Name: demo_blogindexpagerelatedlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('demo_blogindexpagerelatedlink_id_seq', 2, true);


--
-- Data for Name: demo_blogpage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY demo_blogpage (page_ptr_id, body, date, feed_image_id, br_link_id) FROM stdin;
16	<p>mtDNA cytochrome b and NADH dehydrogenase subunit 2 sequence data (Voelker, 2002) is of limited use: the suspicion that there is a superspecies of probably 3 white-bellied, black-throated wagtails is confirmed. Also, there is another superspecies in sub-Saharan Africa, three white-throated species with a black breast-band. The remaining five species are highly variable morphologically and their relationships with each other and with the two clades have not yet been satisfactorily explained.</p><p>The origin of the genus appears to be in the general area of Eastern Siberia/Mongolia. Wagtails spread rapidly across Eurasia and dispersed to Africa in the Zanclean (Early Pliocene) where the sub-Saharan lineage was later isolated. The African Pied Wagtail (and possibly the Mekong Wagtail) diverged prior to the massive radiation of the white-bellied black-throated and most yellow-bellied forms, all of which took place during the late Piacenzian (early Late Pliocene), c. 3 mya.<br/></p><p><embed alt="Pied wagtail by Marie Hale" embedtype="image" format="left" id="10"/><embed alt="Wagtail Sproing by Jim Bendon" embedtype="image" format="right" id="12"/><br/></p><p>mtDNA cytochrome b and NADH dehydrogenase subunit 2 sequence data (Voelker, 2002) is of limited use: the suspicion that there is a superspecies of probably 3 white-bellied, black-throated wagtails is confirmed. Also, there is another superspecies in sub-Saharan Africa, three white-throated species with a black breast-band. The remaining five species are highly variable morphologically and their relationships with each other and with the two clades have not yet been satisfactorily explained.</p><p>The origin of the genus appears to be in the general area of Eastern Siberia/Mongolia. Wagtails spread rapidly across Eurasia and dispersed to Africa in the Zanclean (Early Pliocene) where the sub-Saharan lineage was later isolated. The African Pied Wagtail (and possibly the Mekong Wagtail) diverged prior to the massive radiation of the white-bellied black-throated and most yellow-bellied forms, all of which took place during the late Piacenzian (early Late Pliocene), c. 3 mya.</p><p>mtDNA cytochrome b and NADH dehydrogenase subunit 2 sequence data (Voelker, 2002) is of limited use: the suspicion that there is a superspecies of probably 3 white-bellied, black-throated wagtails is confirmed. Also, there is another superspecies in sub-Saharan Africa, three white-throated species with a black breast-band. The remaining five species are highly variable morphologically and their relationships with each other and with the two clades have not yet been satisfactorily explained.</p><p>The origin of the genus appears to be in the general area of Eastern Siberia/Mongolia. Wagtails spread rapidly across Eurasia and dispersed to Africa in the Zanclean (Early Pliocene) where the sub-Saharan lineage was later isolated. The African Pied Wagtail (and possibly the Mekong Wagtail) diverged prior to the massive radiation of the white-bellied black-throated and most yellow-bellied forms, all of which took place during the late Piacenzian (early Late Pliocene), c. 3 mya.</p>	2013-12-02	7	\N
18	<p>Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters, laying up to six speckled eggs at a time. Among their most conspicuous behaviours is a near constant tail wagging, a trait that has given the birds their common name. In spite of the ubiquity of the behaviour and observations of it, the reasons for it are poorly understood. It has been suggested that it may flush up prey, or that it may signal submissiveness to other wagtails. Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators.</p><p><br/></p><p><embed alt="Grey wagtail by Lip Kee" embedtype="image" format="fullwidth" id="15"/><br/></p><p><br/></p><p>At first glance, the wagtails appear to be divided into a yellow-bellied group and a white-bellied one, or one where the upper head is black and another where it is usually gray, but may be olive, yellow, or other colours. However, these are not evolutionary lineages; change of belly colour and increase of melanin have occurred independently several times in the wagtails, and the colour patterns which actually indicate relationships are more subtle.</p><p><br/></p><p>mtDNA cytochrome b and NADH dehydrogenase subunit 2 sequence data (Voelker, 2002) is of limited use: the suspicion that there is a superspecies of probably 3 white-bellied, black-throated wagtails is confirmed. Also, there is another superspecies in sub-Saharan Africa, three white-throated species with a black breast-band. The remaining five species are highly variable morphologically and their relationships with each other and with the two clades have not yet been satisfactorily explained.<br/></p><p><br/></p><p>The origin of the genus appears to be in the general area of Eastern Siberia/Mongolia. Wagtails spread rapidly across Eurasia and dispersed to Africa in the Zanclean (Early Pliocene) where the sub-Saharan lineage was later isolated. The African Pied Wagtail (and possibly the Mekong Wagtail) diverged prior to the massive radiation of the white-bellied black-throated and most yellow-bellied forms, all of which took place during the late Piacenzian (early Late Pliocene), c. 3 mya.<br/></p><p><br/></p><p>Three species are poly- or paraphyletic in the present taxonomical arrangement and either subspecies need to be reassigned and/or species split up. The Blue-headed Wagtail (AKA Yellow Wagtail and many other names), especially, has always been a taxonomical nightmare with over a dozen currently accepted subspecies and many more invalid ones. The two remaining "monochrome" species, Mekong and African Pied Wagtail may be closely related, or a most striking example of convergent evolution.<br/></p><p><br/></p><p>Prehistoric wagtails known from fossils are Motacilla humata and Motacilla major.<br/></p><p><br/></p><p>See the species accounts for more on individual species' relationships.</p>	2014-01-10	15	\N
19	<p>Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters, laying up to six speckled eggs at a time. Among their most conspicuous behaviours is a near constant tail wagging, a trait that has given the birds their common name. In spite of the ubiquity of the behaviour and observations of it, the reasons for it are poorly understood. It has been suggested that it may flush up prey, or that it may signal submissiveness to other wagtails. Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators.</p><p><br/></p><p>At first glance, the wagtails appear to be divided into a yellow-bellied group and a white-bellied one, or one where the upper head is black and another where it is usually gray, but may be olive, yellow, or other colours. However, these are not evolutionary lineages; change of belly colour and increase of melanin have occurred independently several times in the wagtails, and the colour patterns which actually indicate relationships are more subtle.<br/></p><p><br/></p><p>mtDNA cytochrome b and NADH dehydrogenase subunit 2 sequence data (Voelker, 2002) is of limited use: the suspicion that there is a superspecies of probably 3 white-bellied, black-throated wagtails is confirmed. Also, there is another superspecies in sub-Saharan Africa, three white-throated species with a black breast-band. The remaining five species are highly variable morphologically and their relationships with each other and with the two clades have not yet been satisfactorily explained.<br/></p><p><br/></p><p>The origin of the genus appears to be in the general area of Eastern Siberia/Mongolia. Wagtails spread rapidly across Eurasia and dispersed to Africa in the Zanclean (Early Pliocene) where the sub-Saharan lineage was later isolated. The African Pied Wagtail (and possibly the Mekong Wagtail) diverged prior to the massive radiation of the white-bellied black-throated and most yellow-bellied forms, all of which took place during the late Piacenzian (early Late Pliocene), c. 3 mya.<br/></p><p><br/></p><p>Three species are poly- or paraphyletic in the present taxonomical arrangement and either subspecies need to be reassigned and/or species split up. The Blue-headed Wagtail (AKA Yellow Wagtail and many other names), especially, has always been a taxonomical nightmare with over a dozen currently accepted subspecies and many more invalid ones. The two remaining "monochrome" species, Mekong and African Pied Wagtail may be closely related, or a most striking example of convergent evolution.<br/></p><p><br/></p><p>Prehistoric wagtails known from fossils are Motacilla humata and Motacilla major.<br/></p><p><br/></p><p>See the species accounts for more on individual species' relationships.<br/></p>	2014-02-01	14	\N
29	<p>mtDNA cytochrome b and NADH dehydrogenase subunit 2 sequence data (Voelker, 2002) is of limited use: the suspicion that there is a superspecies of probably 3 white-bellied, black-throated wagtails is confirmed. Also, there is another superspecies in sub-Saharan Africa, three white-throated species with a black breast-band. The remaining five species are highly variable morphologically and their relationships with each other and with the two clades have not yet been satisfactorily explained.</p><p>The origin of the genus appears to be in the general area of Eastern Siberia/Mongolia. Wagtails spread rapidly across Eurasia and dispersed to Africa in the Zanclean (Early Pliocene) where the sub-Saharan lineage was later isolated. The African Pied Wagtail (and possibly the Mekong Wagtail) diverged prior to the massive radiation of the white-bellied black-throated and most yellow-bellied forms, all of which took place during the late Piacenzian (early Late Pliocene), c. 3 mya.<br/></p><p><embed alt="Pied wagtail by Marie Hale" embedtype="image" format="left" id="10"/><embed alt="Wagtail Sproing by Jim Bendon" embedtype="image" format="right" id="12"/><br/></p><p>mtDNA cytochrome b and NADH dehydrogenase subunit 2 sequence data (Voelker, 2002) is of limited use: the suspicion that there is a superspecies of probably 3 white-bellied, black-throated wagtails is confirmed. Also, there is another superspecies in sub-Saharan Africa, three white-throated species with a black breast-band. The remaining five species are highly variable morphologically and their relationships with each other and with the two clades have not yet been satisfactorily explained.</p><p>The origin of the genus appears to be in the general area of Eastern Siberia/Mongolia. Wagtails spread rapidly across Eurasia and dispersed to Africa in the Zanclean (Early Pliocene) where the sub-Saharan lineage was later isolated. The African Pied Wagtail (and possibly the Mekong Wagtail) diverged prior to the massive radiation of the white-bellied black-throated and most yellow-bellied forms, all of which took place during the late Piacenzian (early Late Pliocene), c. 3 mya.</p><p>mtDNA cytochrome b and NADH dehydrogenase subunit 2 sequence data (Voelker, 2002) is of limited use: the suspicion that there is a superspecies of probably 3 white-bellied, black-throated wagtails is confirmed. Also, there is another superspecies in sub-Saharan Africa, three white-throated species with a black breast-band. The remaining five species are highly variable morphologically and their relationships with each other and with the two clades have not yet been satisfactorily explained.</p><p>The origin of the genus appears to be in the general area of Eastern Siberia/Mongolia. Wagtails spread rapidly across Eurasia and dispersed to Africa in the Zanclean (Early Pliocene) where the sub-Saharan lineage was later isolated. The African Pied Wagtail (and possibly the Mekong Wagtail) diverged prior to the massive radiation of the white-bellied black-throated and most yellow-bellied forms, all of which took place during the late Piacenzian (early Late Pliocene), c. 3 mya.</p>	2013-12-02	7	\N
30	<p>Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters, laying up to six speckled eggs at a time. Among their most conspicuous behaviours is a near constant tail wagging, a trait that has given the birds their common name. In spite of the ubiquity of the behaviour and observations of it, the reasons for it are poorly understood. It has been suggested that it may flush up prey, or that it may signal submissiveness to other wagtails. Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators.</p><p><br/></p><p><embed alt="Grey wagtail by Lip Kee" embedtype="image" format="fullwidth" id="15"/><br/></p><p><br/></p><p>At first glance, the wagtails appear to be divided into a yellow-bellied group and a white-bellied one, or one where the upper head is black and another where it is usually gray, but may be olive, yellow, or other colours. However, these are not evolutionary lineages; change of belly colour and increase of melanin have occurred independently several times in the wagtails, and the colour patterns which actually indicate relationships are more subtle.</p><p><br/></p><p>mtDNA cytochrome b and NADH dehydrogenase subunit 2 sequence data (Voelker, 2002) is of limited use: the suspicion that there is a superspecies of probably 3 white-bellied, black-throated wagtails is confirmed. Also, there is another superspecies in sub-Saharan Africa, three white-throated species with a black breast-band. The remaining five species are highly variable morphologically and their relationships with each other and with the two clades have not yet been satisfactorily explained.<br/></p><p><br/></p><p>The origin of the genus appears to be in the general area of Eastern Siberia/Mongolia. Wagtails spread rapidly across Eurasia and dispersed to Africa in the Zanclean (Early Pliocene) where the sub-Saharan lineage was later isolated. The African Pied Wagtail (and possibly the Mekong Wagtail) diverged prior to the massive radiation of the white-bellied black-throated and most yellow-bellied forms, all of which took place during the late Piacenzian (early Late Pliocene), c. 3 mya.<br/></p><p><br/></p><p>Three species are poly- or paraphyletic in the present taxonomical arrangement and either subspecies need to be reassigned and/or species split up. The Blue-headed Wagtail (AKA Yellow Wagtail and many other names), especially, has always been a taxonomical nightmare with over a dozen currently accepted subspecies and many more invalid ones. The two remaining "monochrome" species, Mekong and African Pied Wagtail may be closely related, or a most striking example of convergent evolution.<br/></p><p><br/></p><p>Prehistoric wagtails known from fossils are Motacilla humata and Motacilla major.<br/></p><p><br/></p><p>See the species accounts for more on individual species' relationships.</p>	2014-01-10	15	\N
31	<p>Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters, laying up to six speckled eggs at a time. Among their most conspicuous behaviours is a near constant tail wagging, a trait that has given the birds their common name. In spite of the ubiquity of the behaviour and observations of it, the reasons for it are poorly understood. It has been suggested that it may flush up prey, or that it may signal submissiveness to other wagtails. Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators.</p><p><br/></p><p>At first glance, the wagtails appear to be divided into a yellow-bellied group and a white-bellied one, or one where the upper head is black and another where it is usually gray, but may be olive, yellow, or other colours. However, these are not evolutionary lineages; change of belly colour and increase of melanin have occurred independently several times in the wagtails, and the colour patterns which actually indicate relationships are more subtle.<br/></p><p><br/></p><p>mtDNA cytochrome b and NADH dehydrogenase subunit 2 sequence data (Voelker, 2002) is of limited use: the suspicion that there is a superspecies of probably 3 white-bellied, black-throated wagtails is confirmed. Also, there is another superspecies in sub-Saharan Africa, three white-throated species with a black breast-band. The remaining five species are highly variable morphologically and their relationships with each other and with the two clades have not yet been satisfactorily explained.<br/></p><p><br/></p><p>The origin of the genus appears to be in the general area of Eastern Siberia/Mongolia. Wagtails spread rapidly across Eurasia and dispersed to Africa in the Zanclean (Early Pliocene) where the sub-Saharan lineage was later isolated. The African Pied Wagtail (and possibly the Mekong Wagtail) diverged prior to the massive radiation of the white-bellied black-throated and most yellow-bellied forms, all of which took place during the late Piacenzian (early Late Pliocene), c. 3 mya.<br/></p><p><br/></p><p>Three species are poly- or paraphyletic in the present taxonomical arrangement and either subspecies need to be reassigned and/or species split up. The Blue-headed Wagtail (AKA Yellow Wagtail and many other names), especially, has always been a taxonomical nightmare with over a dozen currently accepted subspecies and many more invalid ones. The two remaining "monochrome" species, Mekong and African Pied Wagtail may be closely related, or a most striking example of convergent evolution.<br/></p><p><br/></p><p>Prehistoric wagtails known from fossils are Motacilla humata and Motacilla major.<br/></p><p><br/></p><p>See the species accounts for more on individual species' relationships.<br/></p>	2014-02-01	14	\N
\.


--
-- Data for Name: demo_blogpagecarouselitem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY demo_blogpagecarouselitem (id, sort_order, link_external, embed_url, caption, image_id, link_document_id, link_page_id, page_id) FROM stdin;
1	0	http://www.flickr.com/photos/kkoshy/		White wagtail by Koshy Koshy	9	\N	\N	16
2	1	http://www.flickr.com/photos/jim_bendon_1957/		Wagtail by Jim Bendon	7	\N	\N	16
3	0	http://www.flickr.com/photos/kkoshy/		White wagtail by Koshy Koshy	9	\N	\N	29
4	1	http://www.flickr.com/photos/jim_bendon_1957/		Wagtail by Jim Bendon	7	\N	\N	29
\.


--
-- Name: demo_blogpagecarouselitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('demo_blogpagecarouselitem_id_seq', 4, true);


--
-- Data for Name: demo_blogpagerelatedlink; Type: TABLE DATA; Schema: public; Owner: -
--

COPY demo_blogpagerelatedlink (id, sort_order, link_external, title, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Name: demo_blogpagerelatedlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('demo_blogpagerelatedlink_id_seq', 1, false);


--
-- Data for Name: demo_blogpagetag; Type: TABLE DATA; Schema: public; Owner: -
--

COPY demo_blogpagetag (id, content_object_id, tag_id) FROM stdin;
4	19	5
5	16	4
6	16	5
7	18	4
8	29	4
9	29	5
10	30	4
11	31	5
\.


--
-- Name: demo_blogpagetag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('demo_blogpagetag_id_seq', 11, true);


--
-- Data for Name: demo_contactpage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY demo_contactpage (page_ptr_id, telephone, email, address_1, address_2, city, country, post_code, body, feed_image_id, br_link_id) FROM stdin;
42	012345 123456	foo@example.com	21 Tweety Mansions	3 Bird Lane	Birdland	Birdshire	W1A 1AA	<p>Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters, laying up to six speckled eggs at a time. Among their most conspicuous behaviours is a near constant tail wagging, a trait that has given the birds their common name. In spite of the ubiquity of the behaviour and observations of it, the reasons for it are poorly understood. It has been suggested that it may flush up prey, or that it may signal submissiveness to other wagtails. Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators.</p>	7	\N
12	012345 123456	foo@example.com	21 Tweety Mansions	3 Bird Lane	Birdland	Birdshire	W1A 1AA	<p>Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters, laying up to six speckled eggs at a time. Among their most conspicuous behaviours is a near constant tail wagging, a trait that has given the birds their common name. In spite of the ubiquity of the behaviour and observations of it, the reasons for it are poorly understood. It has been suggested that it may flush up prey, or that it may signal submissiveness to other wagtails. Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators.</p>	7	\N
\.


--
-- Data for Name: demo_courseindexpage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY demo_courseindexpage (page_ptr_id, intro, br_link_id, header_image_id, body) FROM stdin;
44	Treinamento é um dos principais ministérios que está ligado a tudo que a <b>JOCUM</b> faz. Nossos programas têm como objetivo equipar os cristãos para melhor servir ao próximo nas mais diversas áreas, desde agricultura e saúde, artes, educação, tecnologia até reabilitação de dependentes químicos e ministérios transculturais. Cada programa de treinamento reflete o propósito da <b>JOCUM: Conhecer a Deus e fazê-lo conhecido</b>. Cada curso pode ser oferecido tanto como um programa separado ou como parte da Universidade das Nações. 	\N	16	<p>Em sua maioria, os cursos da JOCUM possuem um programa intensivo de aprendizado onde os alunos se concentram em um assunto por vez e combinam o aprendizado teórico com aplicação prática. Cada escola pode durar de três a nove meses e quase todas os programas se dividem em fase teórica e fase prática, sendo esta última opcional em alguns casos específicos.</p><p><br/></p><p><a href="http://en.wikipedia.org/wiki/Loren_Cunningham">Loren Cunningham</a> definiu esse formato  da seguinte forma: </p><p><i>“Em nossos cursos iremos enfatizar o relacionamento com Deus e uns com os outros. Nós vamos usar um corpo rotativo de professores que vão se alternar e viver junto aos alunos numa comunidade ao estilo dos vilarejos da Ásia e do Pacífico. A ênfase vai ser em aprender enquanto se faz.”</i>. </p><p><br/></p><p>Para muitos alunos da JOCUM, o aprendizado intensivo combinado com a vida em comunidade, e frequentemente transcultural, é uma experiência única de transformação de vida.</p><p><br/></p>
\.


--
-- Data for Name: demo_courseindexpagerelatedlink; Type: TABLE DATA; Schema: public; Owner: -
--

COPY demo_courseindexpagerelatedlink (id, sort_order, link_external, title, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Name: demo_courseindexpagerelatedlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('demo_courseindexpagerelatedlink_id_seq', 1, false);


--
-- Data for Name: demo_coursepage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY demo_coursepage (page_ptr_id, date_from, body, cost_lecture, cost_outreach, signup_link, br_link_id, feed_image_id, header_image_id, languages) FROM stdin;
46	2016-08-02	Tech Segundo Nível	5.000,00	1.000,00		\N	17	\N	2015-05-02 20:22:38.837996+00:00
45	2016-02-04	Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. <p><br/></p><p>Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc.</p><p><br/></p><p>Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit am.<br/></p><p><br/></p><p>Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit am.<br/></p><p></p>	3.000,00	2.000,00 - 5.000,00		\N	16	\N	Português; Inglês
\.


--
-- Data for Name: demo_coursepagerelatedlink; Type: TABLE DATA; Schema: public; Owner: -
--

COPY demo_coursepagerelatedlink (id, sort_order, link_external, title, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Name: demo_coursepagerelatedlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('demo_coursepagerelatedlink_id_seq', 1, false);


--
-- Data for Name: demo_eventindexpage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY demo_eventindexpage (page_ptr_id, intro, br_link_id) FROM stdin;
25	<p>Three species are poly- or paraphyletic in the present taxonomical arrangement and either subspecies need to be reassigned and/or species split up. The Blue-headed Wagtail (AKA Yellow Wagtail and many other names), especially, has always been a taxonomical nightmare with over a dozen currently accepted subspecies and many more invalid ones. The two remaining "monochrome" species, Mekong and African Pied Wagtail may be closely related, or a most striking example of convergent evolution.</p>	4
4	<p>Three species are poly- or paraphyletic in the present taxonomical arrangement and either subspecies need to be reassigned and/or species split up. The Blue-headed Wagtail (AKA Yellow Wagtail and many other names), especially, has always been a taxonomical nightmare with over a dozen currently accepted subspecies and many more invalid ones. The two remaining "monochrome" species, Mekong and African Pied Wagtail may be closely related, or a most striking example of convergent evolution.</p>	\N
\.


--
-- Data for Name: demo_eventindexpagerelatedlink; Type: TABLE DATA; Schema: public; Owner: -
--

COPY demo_eventindexpagerelatedlink (id, sort_order, link_external, title, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Name: demo_eventindexpagerelatedlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('demo_eventindexpagerelatedlink_id_seq', 1, false);


--
-- Data for Name: demo_eventpage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY demo_eventpage (page_ptr_id, date_from, date_to, time_from, time_to, audience, location, body, cost, signup_link, feed_image_id, br_link_id) FROM stdin;
8	2018-02-28	2018-03-02	11:30:00	19:00:00	public	Royal Albert Hall	<p>Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters, laying up to six speckled eggs at a time. Among their most conspicuous behaviours is a near constant tail wagging, a trait that has given the birds their common name. In spite of the ubiquity of the behaviour and observations of it, the reasons for it are poorly understood. It has been suggested that it may flush up prey, or that it may signal submissiveness to other wagtails. Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators.</p><p>At first glance, the wagtails appear to be divided into a yellow-bellied group and a white-bellied one, or one where the upper head is black and another where it is usually gray, but may be olive, yellow, or other colours. However, these are not evolutionary lineages; change of belly colour and increase of melanin have occurred independently several times in the wagtails, and the colour patterns which actually indicate relationships are more subtle.<br/></p>	£30 per person, £10 concessions	http://www.eventbrite.com/	8	\N
9	2018-04-26	\N	\N	\N	private	O2 Arena	<p>Three species are poly- or paraphyletic in the present taxonomical arrangement and either subspecies need to be reassigned and/or species split up. The Blue-headed Wagtail (AKA Yellow Wagtail and many other names), especially, has always been a taxonomical nightmare with over a dozen currently accepted subspecies and many more invalid ones. The two remaining "monochrome" species, Mekong and African Pied Wagtail may be closely related, or a most striking example of convergent evolution</p>	£50		10	\N
26	2018-02-28	2018-03-02	11:30:00	19:00:00	public	Royal Albert Hall	<p>Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters, laying up to six speckled eggs at a time. Among their most conspicuous behaviours is a near constant tail wagging, a trait that has given the birds their common name. In spite of the ubiquity of the behaviour and observations of it, the reasons for it are poorly understood. It has been suggested that it may flush up prey, or that it may signal submissiveness to other wagtails. Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators.</p><p>At first glance, the wagtails appear to be divided into a yellow-bellied group and a white-bellied one, or one where the upper head is black and another where it is usually gray, but may be olive, yellow, or other colours. However, these are not evolutionary lineages; change of belly colour and increase of melanin have occurred independently several times in the wagtails, and the colour patterns which actually indicate relationships are more subtle.<br/></p>	£30 per person, £10 concessions	http://www.eventbrite.com/	8	\N
27	2018-04-26	\N	\N	\N	private	O2 Arena	<p>Three species are poly- or paraphyletic in the present taxonomical arrangement and either subspecies need to be reassigned and/or species split up. The Blue-headed Wagtail (AKA Yellow Wagtail and many other names), especially, has always been a taxonomical nightmare with over a dozen currently accepted subspecies and many more invalid ones. The two remaining "monochrome" species, Mekong and African Pied Wagtail may be closely related, or a most striking example of convergent evolution</p>	£50		10	\N
\.


--
-- Data for Name: demo_eventpagecarouselitem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY demo_eventpagecarouselitem (id, sort_order, link_external, embed_url, caption, image_id, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Name: demo_eventpagecarouselitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('demo_eventpagecarouselitem_id_seq', 1, false);


--
-- Data for Name: demo_eventpagerelatedlink; Type: TABLE DATA; Schema: public; Owner: -
--

COPY demo_eventpagerelatedlink (id, sort_order, link_external, title, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Name: demo_eventpagerelatedlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('demo_eventpagerelatedlink_id_seq', 1, false);


--
-- Data for Name: demo_eventpagespeaker; Type: TABLE DATA; Schema: public; Owner: -
--

COPY demo_eventpagespeaker (id, sort_order, link_external, first_name, last_name, image_id, link_document_id, link_page_id, page_id) FROM stdin;
1	0		James	Joyce	5	\N	\N	8
2	1		David	Mitchell	6	\N	\N	8
3	0		James	Joyce	5	\N	\N	26
4	1		David	Mitchell	6	\N	\N	26
\.


--
-- Name: demo_eventpagespeaker_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('demo_eventpagespeaker_id_seq', 4, true);


--
-- Data for Name: demo_formfield; Type: TABLE DATA; Schema: public; Owner: -
--

COPY demo_formfield (id, sort_order, label, field_type, required, choices, default_value, help_text, page_id) FROM stdin;
2	0	Nome	singleline	t				47
3	1	Mensagem	multiline	t				47
4	0	Nome:	singleline	t				48
5	1	Email	email	t				48
6	2	Mensagem	multiline	t				48
\.


--
-- Name: demo_formfield_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('demo_formfield_id_seq', 6, true);


--
-- Data for Name: demo_formpage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY demo_formpage (page_ptr_id, to_address, from_address, subject, intro, thank_you_text) FROM stdin;
47	essnato@gmail.com			Deseja entrar em contato?	Muito obrigado!
48				<ul><li>Envie email p/ se inscrever</li><li>Envie email p/ saber mais</li><li>bla bla</li></ul>	Obrigado!
\.


--
-- Data for Name: demo_homepage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY demo_homepage (page_ptr_id, body, slogan, br_link_id) FROM stdin;
24	<h2>Teste</h2><p>Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters, laying up to six speckled eggs at a time. Among their most conspicuous behaviours is a near constant tail wagging, a trait that has given the birds their common name. In spite of the ubiquity of the behaviour and observations of it, the reasons for it are poorly understood. It has been suggested that it may flush up prey, or that it may signal submissiveness to other wagtails. Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators. ;D</p>	Know Him Make Him Known	\N
2	<h2>Teste</h2><p>Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters, laying up to six speckled eggs at a time. Among their most conspicuous behaviours is a near constant tail wagging, a trait that has given the birds their common name. In spite of the ubiquity of the behaviour and observations of it, the reasons for it are poorly understood. It has been suggested that it may flush up prey, or that it may signal submissiveness to other wagtails. Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators. ;D</p>	Conhecer Deus Fazê-Lo conhecido	\N
\.


--
-- Data for Name: demo_homepagecarouselitem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY demo_homepagecarouselitem (id, sort_order, link_external, embed_url, caption, image_id, link_document_id, link_page_id, page_id) FROM stdin;
1	0	http://www.flickr.com/photos/lipkee/		Grey wagtail by Lip Kee	15	\N	\N	2
2	1	http://www.flickr.com/photos/jim_bendon_1957/		Wagtail sproing by Jim Bendon	12	\N	\N	2
3	2	http://www.flickr.com/photos/kjfnjy/		Wagtail at Borovoye, Kazakhstan by Ken and Nyetta	11	\N	\N	2
\.


--
-- Name: demo_homepagecarouselitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('demo_homepagecarouselitem_id_seq', 6, true);


--
-- Data for Name: demo_homepagerelatedlink; Type: TABLE DATA; Schema: public; Owner: -
--

COPY demo_homepagerelatedlink (id, sort_order, link_external, title, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Name: demo_homepagerelatedlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('demo_homepagerelatedlink_id_seq', 1, false);


--
-- Data for Name: demo_languageredirectionpage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY demo_languageredirectionpage (page_ptr_id) FROM stdin;
43
\.


--
-- Data for Name: demo_personpage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY demo_personpage (page_ptr_id, telephone, email, address_1, address_2, city, country, post_code, first_name, last_name, intro, biography, feed_image_id, image_id, br_link_id) FROM stdin;
40	012345 123456	foo@example.com	21 Tweety Mansions	3 Bird Lane	Birdland	Birdshire	W1A 1AA	James	Joyce	<p>The origin of the genus appears to be in the general area of Eastern Siberia/Mongolia. Wagtails spread rapidly across Eurasia and dispersed to Africa in the Zanclean</p>	<p>Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters, laying up to six speckled eggs at a time. Among their most conspicuous behaviours is a near constant tail wagging, a trait that has given the birds their common name. In spite of the ubiquity of the behaviour and observations of it, the reasons for it are poorly understood. It has been suggested that it may flush up prey, or that it may signal submissiveness to other wagtails. Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators.</p><p><br/></p><p>At first glance, the wagtails appear to be divided into a yellow-bellied group and a white-bellied one, or one where the upper head is black and another where it is usually gray, but may be olive, yellow, or other colours. However, these are not evolutionary lineages; change of belly colour and increase of melanin have occurred independently several times in the wagtails, and the colour patterns which actually indicate relationships are more subtle.<br/></p>	5	5	\N
41		foo@example.com					W1A 1AA	David	Mitchell	<p>Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World.</p>	<p>Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters, laying up to six speckled eggs at a time. Among their most conspicuous behaviours is a near constant tail wagging, a trait that has given the birds their common name. In spite of the ubiquity of the behaviour and observations of it, the reasons for it are poorly understood. It has been suggested that it may flush up prey, or that it may signal submissiveness to other wagtails. Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators.</p>	6	6	\N
14		foo@example.com					W1A 1AA	David	Mitchell	<p>Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World.</p>	<p>Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters, laying up to six speckled eggs at a time. Among their most conspicuous behaviours is a near constant tail wagging, a trait that has given the birds their common name. In spite of the ubiquity of the behaviour and observations of it, the reasons for it are poorly understood. It has been suggested that it may flush up prey, or that it may signal submissiveness to other wagtails. Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators.</p>	6	6	\N
13	012345 123456	foo@example.com	21 Tweety Mansions	3 Bird Lane	Birdland	Birdshire	W1A 1AA	James	Joyce	<p>The origin of the genus appears to be in the general area of Eastern Siberia/Mongolia. Wagtails spread rapidly across Eurasia and dispersed to Africa in the Zanclean</p>	<p>Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters, laying up to six speckled eggs at a time. Among their most conspicuous behaviours is a near constant tail wagging, a trait that has given the birds their common name. In spite of the ubiquity of the behaviour and observations of it, the reasons for it are poorly understood. It has been suggested that it may flush up prey, or that it may signal submissiveness to other wagtails. Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators.</p><p><br/></p><p>At first glance, the wagtails appear to be divided into a yellow-bellied group and a white-bellied one, or one where the upper head is black and another where it is usually gray, but may be olive, yellow, or other colours. However, these are not evolutionary lineages; change of belly colour and increase of melanin have occurred independently several times in the wagtails, and the colour patterns which actually indicate relationships are more subtle.<br/></p>	5	5	\N
\.


--
-- Data for Name: demo_personpagerelatedlink; Type: TABLE DATA; Schema: public; Owner: -
--

COPY demo_personpagerelatedlink (id, sort_order, link_external, title, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Name: demo_personpagerelatedlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('demo_personpagerelatedlink_id_seq', 1, false);


--
-- Data for Name: demo_standardindexpage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY demo_standardindexpage (page_ptr_id, intro, feed_image_id, br_link_id) FROM stdin;
32	<p>Three species are poly- or paraphyletic in the present taxonomical arrangement and either subspecies need to be reassigned and/or species split up. The Blue-headed Wagtail (AKA Yellow Wagtail and many other names), especially, has always been a taxonomical nightmare with over a dozen currently accepted subspecies and many more invalid ones. The two remaining "monochrome" species, Mekong and African Pied Wagtail may be closely related, or a most striking example of convergent evolution.</p>	\N	\N
36	<p>A listing of pages at the next level down</p>	\N	\N
39		\N	\N
6	<p>Three species are poly- or paraphyletic in the present taxonomical arrangement and either subspecies need to be reassigned and/or species split up. The Blue-headed Wagtail (AKA Yellow Wagtail and many other names), especially, has always been a taxonomical nightmare with over a dozen currently accepted subspecies and many more invalid ones. The two remaining "monochrome" species, Mekong and African Pied Wagtail may be closely related, or a most striking example of convergent evolution.</p>	\N	\N
20		\N	\N
21	<p>A listing of pages at the next level down</p>	\N	\N
\.


--
-- Data for Name: demo_standardindexpagerelatedlink; Type: TABLE DATA; Schema: public; Owner: -
--

COPY demo_standardindexpagerelatedlink (id, sort_order, link_external, title, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Name: demo_standardindexpagerelatedlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('demo_standardindexpagerelatedlink_id_seq', 1, false);


--
-- Data for Name: demo_standardpage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY demo_standardpage (page_ptr_id, intro, body, feed_image_id, br_link_id) FROM stdin;
17	<p>The following photos have been used in the sample wagtail demo database</p>	<br/><p>James Joyce, 1915, <a href="http://epc.buffalo.edu/authors/joyce/image/1915.jpg">Cornell Joyce Collection</a> by C. Ruf - public domain in the United States</p>\n<p>David Mitchell (b. 1969), British writer, Warsaw (Poland), April 7, 2006,  <a href="http://www.mariuszkubik.pl/">Mariusz Kubik</a>, GDFL licence</p><p>Wagtail, October 14, 2012 by <a href="http://www.flickr.com/photos/markyharky/">Mark Harkin</a>,   <a href="http://creativecommons.org/licenses/by/2.0/">Creative Commons</a></p><p>Wagtail, February 18th 2008, by <a href="http://www.flickr.com/photos/oufoufsworld/">Joe Buckingham</a>, <a href="http://creativecommons.org/licenses/by/2.0/">Creative Commons</a></p><p>Wagtail, August 4th 2009, by <a href="http://www.flickr.com/photos/fsphil/">fs-phil</a>, <a href="http://creativecommons.org/licenses/by-sa/2.0/">Creative Commons</a></p><p>White wagtail, February 5th 2012, by <a href="http://www.flickr.com/photos/kkoshy/">Koshy Koshy</a>, <a href="http://creativecommons.org/licenses/by/2.0/">Creative Commons</a></p><p>Pied wagtail, January 20th 2013, by <a href="http://www.flickr.com/photos/15016964@N02/">Marie Hale</a>, <a href="http://creativecommons.org/licenses/by/2.0/">Creative Commons</a></p><p>Wagtail at Borovoye, Kazakhstan, June 16th 2012, by <a href="http://www.flickr.com/photos/kjfnjy/">Ken and Nyetta</a>, <a href="http://creativecommons.org/licenses/by/2.0/">Creative Commons</a></p><p>Wagtail sproing, April 29 2012, by <a href="http://www.flickr.com/photos/jim_bendon_1957/">Jim Bendon</a>, <a href="http://creativecommons.org/licenses/by-sa/2.0/">Creative Commons</a></p><p>Hopalong wagtail, June 17th 2008, by <a href="http://www.flickr.com/photos/ruthhb/">Ruth Flickr</a>, <a href="http://creativecommons.org/licenses/by-nc-sa/2.0/">Creative Commons</a></p><p>Wagtail collects insects, June 10th 2010, by <a href="http://www.flickr.com/photos/27126314@N03/">Margrit</a>, <a href="http://creativecommons.org/licenses/by-nc-sa/2.0/">Creative Commons</a></p><p>Grey wagtail, March 13th 2009, by <a href="http://www.flickr.com/photos/lipkee/">Lip Kee</a>, <a href="http://creativecommons.org/licenses/by-sa/2.0/">Creative Commons</a></p>	15	\N
37	<p>At first glance, the wagtails appear to be divided into a yellow-bellied group and a white-bellied one, or one where the upper head is black and another where it is usually gray, but may be olive, yellow, or other colours.</p>	<p>The origin of the genus appears to be in the general area of Eastern Siberia/Mongolia. Wagtails spread rapidly across Eurasia and dispersed to Africa in the Zanclean (Early Pliocene) where the sub-Saharan lineage was later isolated. The African Pied Wagtail (and possibly the Mekong Wagtail) diverged prior to the massive radiation of the white-bellied black-throated and most yellow-bellied forms, all of which took place during the late Piacenzian (early Late Pliocene), c. 3 mya.</p><p><span><br/></span></p><p><span>Three species are poly- or paraphyletic in the present taxonomical arrangement and either subspecies need to be reassigned and/or species split up. The Blue-headed Wagtail (AKA Yellow Wagtail and many other names), especially, has always been a taxonomical nightmare with over a dozen currently accepted subspecies and many more invalid ones. The two remaining "monochrome" species, Mekong and African Pied Wagtail may be closely related, or a most striking example of convergent evolution.</span><br/></p>	\N	\N
38	<p>The origin of the genus appears to be in the general area of Eastern Siberia/Mongolia. Wagtails spread rapidly across Eurasia and dispersed to Africa in the Zanclean (Early Pliocene) where the sub-Saharan lineage was later isolated. The African Pied Wagtail (and possibly the Mekong Wagtail) diverged prior to the massive radiation of the white-bellied black-throated and most yellow-bellied forms, all of which took place during the late Piacenzian (early Late Pliocene), c. 3 mya.</p>	<p>The origin of the genus appears to be in the general area of Eastern Siberia/Mongolia. Wagtails spread rapidly across Eurasia and dispersed to Africa in the Zanclean (Early Pliocene) where the sub-Saharan lineage was later isolated. The African Pied Wagtail (and possibly the Mekong Wagtail) diverged prior to the massive radiation of the white-bellied black-throated and most yellow-bellied forms, all of which took place during the late Piacenzian (early Late Pliocene), c. 3 mya.</p><p><span><br/></span></p><p><span>Three species are poly- or paraphyletic in the present taxonomical arrangement and either subspecies need to be reassigned and/or species split up. The Blue-headed Wagtail (AKA Yellow Wagtail and many other names), especially, has always been a taxonomical nightmare with over a dozen currently accepted subspecies and many more invalid ones. The two remaining "monochrome" species, Mekong and African Pied Wagtail may be closely related, or a most striking example of convergent evolution.</span><br/></p>	\N	\N
10	<p>At first glance, the wagtails appear to be divided into a yellow-bellied group and a white-bellied one, or one where the upper head is black and another where it is usually gray, but may be olive, yellow, or other colours. However, these are not evolutionary lineages; change of belly colour and increase of melanin have occurred independently several times in the wagtails, and the colour patterns which actually indicate relationships are more subtle.</p>	<p>Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters, laying up to six speckled eggs at a time. Among their most conspicuous behaviours is a near constant tail wagging, a trait that has given the birds their common name. In spite of the ubiquity of the behaviour and observations of it, the reasons for it are poorly understood. It has been suggested that it may flush up prey, or that it may signal submissiveness to other wagtails. Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators.</p><p><br/></p><p>At first glance, the wagtails appear to be divided into a yellow-bellied group and a white-bellied one, or one where the upper head is black and another where it is usually gray, but may be olive, yellow, or other colours. However, these are not evolutionary lineages; change of belly colour and increase of melanin have occurred independently several times in the wagtails, and the colour patterns which actually indicate relationships are more subtle.<br/></p><p><br/></p><p>mtDNA cytochrome b and NADH dehydrogenase subunit 2 sequence data (Voelker, 2002) is of limited use: the suspicion that there is a superspecies of probably 3 white-bellied, black-throated wagtails is confirmed. Also, there is another superspecies in sub-Saharan Africa, three white-throated species with a black breast-band. The remaining five species are highly variable morphologically and their relationships with each other and with the two clades have not yet been satisfactorily explained.<br/></p><p><br/></p><p>The origin of the genus appears to be in the general area of Eastern Siberia/Mongolia. Wagtails spread rapidly across Eurasia and dispersed to Africa in the Zanclean (Early Pliocene) where the sub-Saharan lineage was later isolated. The African Pied Wagtail (and possibly the Mekong Wagtail) diverged prior to the massive radiation of the white-bellied black-throated and most yellow-bellied forms, all of which took place during the late Piacenzian (early Late Pliocene), c. 3 mya.<br/></p>	12	\N
22	<p>At first glance, the wagtails appear to be divided into a yellow-bellied group and a white-bellied one, or one where the upper head is black and another where it is usually gray, but may be olive, yellow, or other colours.</p>	<p>The origin of the genus appears to be in the general area of Eastern Siberia/Mongolia. Wagtails spread rapidly across Eurasia and dispersed to Africa in the Zanclean (Early Pliocene) where the sub-Saharan lineage was later isolated. The African Pied Wagtail (and possibly the Mekong Wagtail) diverged prior to the massive radiation of the white-bellied black-throated and most yellow-bellied forms, all of which took place during the late Piacenzian (early Late Pliocene), c. 3 mya.</p><p><span><br/></span></p><p><span>Three species are poly- or paraphyletic in the present taxonomical arrangement and either subspecies need to be reassigned and/or species split up. The Blue-headed Wagtail (AKA Yellow Wagtail and many other names), especially, has always been a taxonomical nightmare with over a dozen currently accepted subspecies and many more invalid ones. The two remaining "monochrome" species, Mekong and African Pied Wagtail may be closely related, or a most striking example of convergent evolution.</span><br/></p>	\N	\N
23	<p>The origin of the genus appears to be in the general area of Eastern Siberia/Mongolia. Wagtails spread rapidly across Eurasia and dispersed to Africa in the Zanclean (Early Pliocene) where the sub-Saharan lineage was later isolated. The African Pied Wagtail (and possibly the Mekong Wagtail) diverged prior to the massive radiation of the white-bellied black-throated and most yellow-bellied forms, all of which took place during the late Piacenzian (early Late Pliocene), c. 3 mya.</p>	<p>The origin of the genus appears to be in the general area of Eastern Siberia/Mongolia. Wagtails spread rapidly across Eurasia and dispersed to Africa in the Zanclean (Early Pliocene) where the sub-Saharan lineage was later isolated. The African Pied Wagtail (and possibly the Mekong Wagtail) diverged prior to the massive radiation of the white-bellied black-throated and most yellow-bellied forms, all of which took place during the late Piacenzian (early Late Pliocene), c. 3 mya.</p><p><span><br/></span></p><p><span>Three species are poly- or paraphyletic in the present taxonomical arrangement and either subspecies need to be reassigned and/or species split up. The Blue-headed Wagtail (AKA Yellow Wagtail and many other names), especially, has always been a taxonomical nightmare with over a dozen currently accepted subspecies and many more invalid ones. The two remaining "monochrome" species, Mekong and African Pied Wagtail may be closely related, or a most striking example of convergent evolution.</span><br/></p>	\N	\N
33	<p>At first glance, the wagtails appear to be divided into a yellow-bellied group and a white-bellied one, or one where the upper head is black and another where it is usually gray, but may be olive, yellow, or other colours. However, these are not evolutionary lineages; change of belly colour and increase of melanin have occurred independently several times in the wagtails, and the colour patterns which actually indicate relationships are more subtle.</p>	<p>Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters, laying up to six speckled eggs at a time. Among their most conspicuous behaviours is a near constant tail wagging, a trait that has given the birds their common name. In spite of the ubiquity of the behaviour and observations of it, the reasons for it are poorly understood. It has been suggested that it may flush up prey, or that it may signal submissiveness to other wagtails. Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators.</p><p><br/></p><p>At first glance, the wagtails appear to be divided into a yellow-bellied group and a white-bellied one, or one where the upper head is black and another where it is usually gray, but may be olive, yellow, or other colours. However, these are not evolutionary lineages; change of belly colour and increase of melanin have occurred independently several times in the wagtails, and the colour patterns which actually indicate relationships are more subtle.<br/></p><p><br/></p><p>mtDNA cytochrome b and NADH dehydrogenase subunit 2 sequence data (Voelker, 2002) is of limited use: the suspicion that there is a superspecies of probably 3 white-bellied, black-throated wagtails is confirmed. Also, there is another superspecies in sub-Saharan Africa, three white-throated species with a black breast-band. The remaining five species are highly variable morphologically and their relationships with each other and with the two clades have not yet been satisfactorily explained.<br/></p><p><br/></p><p>The origin of the genus appears to be in the general area of Eastern Siberia/Mongolia. Wagtails spread rapidly across Eurasia and dispersed to Africa in the Zanclean (Early Pliocene) where the sub-Saharan lineage was later isolated. The African Pied Wagtail (and possibly the Mekong Wagtail) diverged prior to the massive radiation of the white-bellied black-throated and most yellow-bellied forms, all of which took place during the late Piacenzian (early Late Pliocene), c. 3 mya.<br/></p>	12	\N
34	<p>The remaining five species are highly variable morphologically and their relationships with each other and with the two clades have not yet been satisfactorily explained.</p>	<h4>Wagtails are great</h4><p>At first glance, the wagtails appear to be divided into a yellow-bellied group and a white-bellied one, or one where the upper head is black and another where it is usually gray, but may be olive, yellow, or other colours. However, these are not evolutionary lineages; change of belly colour and increase of melanin have occurred independently several times in the wagtails, and the colour patterns which actually indicate relationships are more subtle.</p><p><embed alt="Wagtail Sproing by Jim Bendon" embedtype="image" format="left" id="12"/><br/></p><h4>Wagtails are pretty</h4><p>mtDNA cytochrome b and NADH dehydrogenase subunit 2 sequence data (Voelker, 2002) is of limited use: the suspicion that there is a superspecies of probably 3 white-bellied, black-throated wagtails is confirmed. Also, there is another superspecies in sub-Saharan Africa, three white-throated species with a black breast-band. The remaining five species are highly variable morphologically and their relationships with each other and with the two clades have not yet been satisfactorily explained.<br/></p><p><embed alt="Pied wagtail by Marie Hale" embedtype="image" format="right" id="10"/><br/></p><p>The origin of the genus appears to be in the general area of Eastern Siberia/Mongolia. Wagtails spread rapidly across Eurasia and dispersed to Africa in the Zanclean (Early Pliocene) where the sub-Saharan lineage was later isolated. The African Pied Wagtail (and possibly the Mekong Wagtail) diverged prior to the massive radiation of the white-bellied black-throated and most yellow-bellied forms, all of which took place during the late Piacenzian (early Late Pliocene), c. 3 mya.<br/></p><p>Three species are poly- or paraphyletic in the present taxonomical arrangement and either subspecies need to be reassigned and/or species split up. The Blue-headed Wagtail (AKA Yellow Wagtail and many other names), especially, has always been a taxonomical nightmare with over a dozen currently accepted subspecies and many more invalid ones. The two remaining "monochrome" species, Mekong and African Pied Wagtail may be closely related, or a most striking example of convergent evolution.<br/></p>	10	\N
35	<p>The following photos have been used in the sample wagtail demo database</p>	<br/><p>James Joyce, 1915, <a href="http://epc.buffalo.edu/authors/joyce/image/1915.jpg">Cornell Joyce Collection</a> by C. Ruf - public domain in the United States</p>\n<p>David Mitchell (b. 1969), British writer, Warsaw (Poland), April 7, 2006,  <a href="http://www.mariuszkubik.pl/">Mariusz Kubik</a>, GDFL licence</p><p>Wagtail, October 14, 2012 by <a href="http://www.flickr.com/photos/markyharky/">Mark Harkin</a>,   <a href="http://creativecommons.org/licenses/by/2.0/">Creative Commons</a></p><p>Wagtail, February 18th 2008, by <a href="http://www.flickr.com/photos/oufoufsworld/">Joe Buckingham</a>, <a href="http://creativecommons.org/licenses/by/2.0/">Creative Commons</a></p><p>Wagtail, August 4th 2009, by <a href="http://www.flickr.com/photos/fsphil/">fs-phil</a>, <a href="http://creativecommons.org/licenses/by-sa/2.0/">Creative Commons</a></p><p>White wagtail, February 5th 2012, by <a href="http://www.flickr.com/photos/kkoshy/">Koshy Koshy</a>, <a href="http://creativecommons.org/licenses/by/2.0/">Creative Commons</a></p><p>Pied wagtail, January 20th 2013, by <a href="http://www.flickr.com/photos/15016964@N02/">Marie Hale</a>, <a href="http://creativecommons.org/licenses/by/2.0/">Creative Commons</a></p><p>Wagtail at Borovoye, Kazakhstan, June 16th 2012, by <a href="http://www.flickr.com/photos/kjfnjy/">Ken and Nyetta</a>, <a href="http://creativecommons.org/licenses/by/2.0/">Creative Commons</a></p><p>Wagtail sproing, April 29 2012, by <a href="http://www.flickr.com/photos/jim_bendon_1957/">Jim Bendon</a>, <a href="http://creativecommons.org/licenses/by-sa/2.0/">Creative Commons</a></p><p>Hopalong wagtail, June 17th 2008, by <a href="http://www.flickr.com/photos/ruthhb/">Ruth Flickr</a>, <a href="http://creativecommons.org/licenses/by-nc-sa/2.0/">Creative Commons</a></p><p>Wagtail collects insects, June 10th 2010, by <a href="http://www.flickr.com/photos/27126314@N03/">Margrit</a>, <a href="http://creativecommons.org/licenses/by-nc-sa/2.0/">Creative Commons</a></p><p>Grey wagtail, March 13th 2009, by <a href="http://www.flickr.com/photos/lipkee/">Lip Kee</a>, <a href="http://creativecommons.org/licenses/by-sa/2.0/">Creative Commons</a></p>	15	\N
15	<p>The remaining five species are highly variable morphologically and their relationships with each other and with the two clades have not yet been satisfactorily explained.</p>	<h4>Wagtails are great</h4><p>At first glance, the wagtails appear to be divided into a yellow-bellied group and a white-bellied one, or one where the upper head is black and another where it is usually gray, but may be olive, yellow, or other colours. However, these are not evolutionary lineages; change of belly colour and increase of melanin have occurred independently several times in the wagtails, and the colour patterns which actually indicate relationships are more subtle.</p><p><embed alt="Wagtail Sproing by Jim Bendon" embedtype="image" format="left" id="12"/><br/></p><h4>Wagtails are pretty</h4><p>mtDNA cytochrome b and NADH dehydrogenase subunit 2 sequence data (Voelker, 2002) is of limited use: the suspicion that there is a superspecies of probably 3 white-bellied, black-throated wagtails is confirmed. Also, there is another superspecies in sub-Saharan Africa, three white-throated species with a black breast-band. The remaining five species are highly variable morphologically and their relationships with each other and with the two clades have not yet been satisfactorily explained.<br/></p><p><embed alt="Pied wagtail by Marie Hale" embedtype="image" format="right" id="10"/><br/></p><p>The origin of the genus appears to be in the general area of Eastern Siberia/Mongolia. Wagtails spread rapidly across Eurasia and dispersed to Africa in the Zanclean (Early Pliocene) where the sub-Saharan lineage was later isolated. The African Pied Wagtail (and possibly the Mekong Wagtail) diverged prior to the massive radiation of the white-bellied black-throated and most yellow-bellied forms, all of which took place during the late Piacenzian (early Late Pliocene), c. 3 mya.<br/></p><p>Three species are poly- or paraphyletic in the present taxonomical arrangement and either subspecies need to be reassigned and/or species split up. The Blue-headed Wagtail (AKA Yellow Wagtail and many other names), especially, has always been a taxonomical nightmare with over a dozen currently accepted subspecies and many more invalid ones. The two remaining "monochrome" species, Mekong and African Pied Wagtail may be closely related, or a most striking example of convergent evolution.<br/></p>	10	\N
49			\N	\N
\.


--
-- Data for Name: demo_standardpagecarouselitem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY demo_standardpagecarouselitem (id, sort_order, link_external, embed_url, caption, image_id, link_document_id, link_page_id, page_id) FROM stdin;
3	0	http://www.flickr.com/photos/ruthhb/		Hopalong wagtail by Ruth Flickr	13	\N	\N	33
4	1	http://www.flickr.com/photos/lipkee/		Grey wagtail by Lip Kee	15	\N	\N	33
1	0	http://www.flickr.com/photos/ruthhb/		Hopalong wagtail by Ruth Flickr	13	\N	\N	10
2	1	http://www.flickr.com/photos/lipkee/		Grey wagtail by Lip Kee	15	\N	\N	10
\.


--
-- Name: demo_standardpagecarouselitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('demo_standardpagecarouselitem_id_seq', 4, true);


--
-- Data for Name: demo_standardpagerelatedlink; Type: TABLE DATA; Schema: public; Owner: -
--

COPY demo_standardpagerelatedlink (id, sort_order, link_external, title, link_document_id, link_page_id, page_id) FROM stdin;
3	0		Internal link to events	\N	4	33
4	1	http://www.google.com/	External link to google	\N	\N	33
1	0		Internal link to events	\N	4	10
2	1	http://www.google.com/	External link to google	\N	\N	10
\.


--
-- Name: demo_standardpagerelatedlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('demo_standardpagerelatedlink_id_seq', 4, true);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: -
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1, false);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: -
--

COPY django_content_type (id, name, app_label, model) FROM stdin;
1	page	wagtailcore	page
2	image	wagtailimages	image
3	document	wagtaildocs	document
4	Wagtail admin	wagtailadmin	admin
5	permission	auth	permission
6	group	auth	group
7	user	auth	user
8	content type	contenttypes	contenttype
9	session	sessions	session
10	Tag	taggit	tag
11	Tagged Item	taggit	taggeditem
12	log entry	admin	logentry
13	site	wagtailcore	site
14	page revision	wagtailcore	pagerevision
15	group page permission	wagtailcore	grouppagepermission
16	page view restriction	wagtailcore	pageviewrestriction
17	user profile	wagtailusers	userprofile
18	filter	wagtailimages	filter
19	rendition	wagtailimages	rendition
20	embed	wagtailembeds	embed
21	query	wagtailsearch	query
22	query daily hits	wagtailsearch	querydailyhits
23	editors pick	wagtailsearch	editorspick
24	redirect	wagtailredirects	redirect
25	form submission	wagtailforms	formsubmission
26	advert placement	demo	advertplacement
27	advert	demo	advert
28	home page carousel item	demo	homepagecarouselitem
29	home page related link	demo	homepagerelatedlink
30	Homepage	demo	homepage
31	standard index page related link	demo	standardindexpagerelatedlink
32	standard index page	demo	standardindexpage
33	standard page carousel item	demo	standardpagecarouselitem
34	standard page related link	demo	standardpagerelatedlink
35	standard page	demo	standardpage
36	blog index page related link	demo	blogindexpagerelatedlink
37	blog index page	demo	blogindexpage
38	blog page carousel item	demo	blogpagecarouselitem
39	blog page related link	demo	blogpagerelatedlink
40	blog page tag	demo	blogpagetag
41	blog page	demo	blogpage
42	person page related link	demo	personpagerelatedlink
43	person page	demo	personpage
44	contact page	demo	contactpage
45	event index page related link	demo	eventindexpagerelatedlink
46	event index page	demo	eventindexpage
47	event page carousel item	demo	eventpagecarouselitem
48	event page related link	demo	eventpagerelatedlink
49	event page speaker	demo	eventpagespeaker
50	event page	demo	eventpage
51	form field	demo	formfield
52	form page	demo	formpage
53	language redirection page	demo	languageredirectionpage
54	course index page related link	demo	courseindexpagerelatedlink
55	course index page	demo	courseindexpage
56	course page related link	demo	coursepagerelatedlink
57	course page	demo	coursepage
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('django_content_type_id_seq', 57, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2015-03-25 13:28:52.928832+00
2	auth	0001_initial	2015-03-25 13:28:53.022481+00
3	admin	0001_initial	2015-03-25 13:28:53.077407+00
4	taggit	0001_initial	2015-03-25 13:28:53.129213+00
5	wagtailimages	0001_initial	2015-03-25 13:28:53.24968+00
6	wagtailcore	0001_initial	2015-03-25 13:28:53.463017+00
7	wagtailcore	0002_initial_data	2015-03-25 13:28:53.542251+00
8	wagtailimages	0002_initial_data	2015-03-25 13:28:53.671552+00
9	wagtaildocs	0001_initial	2015-03-25 13:28:53.714904+00
10	wagtaildocs	0002_initial_data	2015-03-25 13:28:53.824681+00
11	demo	0001_initial	2015-03-25 13:28:59.135409+00
12	sessions	0001_initial	2015-03-25 13:28:59.15145+00
13	wagtailadmin	0001_create_admin_access_permissions	2015-03-25 13:28:59.231575+00
14	wagtailcore	0003_add_uniqueness_constraint_on_group_page_permission	2015-03-25 13:28:59.340964+00
15	wagtailcore	0004_page_locked	2015-03-25 13:28:59.51318+00
16	wagtailcore	0005_add_page_lock_permission_to_moderators	2015-03-25 13:28:59.611095+00
17	wagtailcore	0006_add_lock_page_permission	2015-03-25 13:28:59.735885+00
18	wagtailcore	0007_page_latest_revision_created_at	2015-03-25 13:28:59.879704+00
19	wagtailcore	0008_populate_latest_revision_created_at	2015-03-25 13:29:00.023183+00
20	wagtailcore	0009_remove_auto_now_add_from_pagerevision_created_at	2015-03-25 13:29:00.192638+00
21	wagtailcore	0010_change_page_owner_to_null_on_delete	2015-03-25 13:29:00.450109+00
22	wagtailembeds	0001_initial	2015-03-25 13:29:00.468038+00
23	wagtailforms	0001_initial	2015-03-25 13:29:00.549939+00
24	wagtailimages	0003_fix_focal_point_fields	2015-03-25 13:29:00.821946+00
25	wagtailimages	0004_make_focal_point_key_not_nullable	2015-03-25 13:29:01.044072+00
26	wagtailimages	0005_make_filter_spec_unique	2015-03-25 13:29:01.251901+00
27	wagtailredirects	0001_initial	2015-03-25 13:29:01.336433+00
28	wagtailsearch	0001_initial	2015-03-25 13:29:01.553515+00
29	wagtailusers	0001_initial	2015-03-25 13:29:01.587531+00
30	demo	0002_homepage_slogan	2015-04-19 18:36:21.393537+00
31	demo	0003_auto_20150420_2136	2015-04-20 20:36:39.538363+00
32	demo	0004_auto_20150424_2315	2015-04-24 22:15:48.66412+00
33	demo	0005_courseindexpage_body	2015-04-30 20:54:05.695759+00
34	demo	0006_coursepage_languages	2015-05-02 20:22:55.033242+00
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('django_migrations_id_seq', 34, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: -
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
tu9p3m1oo91wox2pf6gfhf6z82rr81o9	M2Q1YWUzOTlmMTYxYjNlZjdhYjJjZTRiOTMyMThlODA0MTY2NDc4ZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImJkNzIyOTNlODdlZjJjMGZjMTMxYzYxOTY0MThjZGMxNGNjNjExN2UiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-04-08 13:31:51.295803+00
8qxw8di4hv6x1t70gvswwx4z0sswa3dl	Mzg1NjZiMzhkNDJlYmQxNjlhMTEzMTFlNzU2M2Q3MzU3YmM1ODY2Yzp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhYmQyM2RiNTU1NzU5NTFlNmE2MzhkZjZmNzQ4YmE0M2JmYmNkM2EiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-04-23 20:18:10.156165+00
y6tvonchlwjyfjwzcptpjckhylan0gtf	ZThjNDczZmVmOTQ5MjY0YTZlYWM4NGUyMDI4NDFlZmNmMDU3YmRlNjp7Il9sYW5ndWFnZSI6ImJyIn0=	2015-05-08 18:27:00.251357+00
iwccyt6hzytodgo7lmz72lnbn5sqm202	ZThjNDczZmVmOTQ5MjY0YTZlYWM4NGUyMDI4NDFlZmNmMDU3YmRlNjp7Il9sYW5ndWFnZSI6ImJyIn0=	2015-05-08 19:08:41.04226+00
5j0v9wo5afnhg7d7yv2asdtdbw8lmwr5	YWFmYzZjNjFmYWIyNDkzOWJlZDFhOWI1Y2M2ZjNiZmY2YTdjMmM2YTp7Il9sYW5ndWFnZSI6InB0LWJyIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGFiZDIzZGI1NTU3NTk1MWU2YTYzOGRmNmY3NDhiYTQzYmZiY2QzYSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2015-05-12 20:00:57.690546+00
\.


--
-- Data for Name: taggit_tag; Type: TABLE DATA; Schema: public; Owner: -
--

COPY taggit_tag (id, name, slug) FROM stdin;
1	writers	writers
2	people	people
3	person	person
4	wagtail	wagtail
5	bird	bird
6	writer	writer
\.


--
-- Name: taggit_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('taggit_tag_id_seq', 6, true);


--
-- Data for Name: taggit_taggeditem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY taggit_taggeditem (id, object_id, content_type_id, tag_id) FROM stdin;
\.


--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('taggit_taggeditem_id_seq', 1, false);


--
-- Data for Name: wagtailcore_grouppagepermission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailcore_grouppagepermission (id, permission_type, group_id, page_id) FROM stdin;
1	add	1	1
2	edit	1	1
3	publish	1	1
4	add	2	1
5	edit	2	1
6	lock	1	1
\.


--
-- Name: wagtailcore_grouppagepermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailcore_grouppagepermission_id_seq', 6, true);


--
-- Data for Name: wagtailcore_page; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailcore_page (id, path, depth, numchild, title, slug, live, has_unpublished_changes, url_path, seo_title, show_in_menus, search_description, go_live_at, expire_at, expired, content_type_id, owner_id, locked, latest_revision_created_at) FROM stdin;
45	00010004000200010001	5	1	Artes ETED	artes-eted	t	f	/ywam/br/treinamento/artes-eted/		f		\N	\N	f	57	1	f	2015-05-02 20:43:38.673264+00
48	000100040002000100010001	6	0	Quer saber mais sobre o curso?	quer-saber-mais-sobre-o-curso	t	f	/ywam/br/treinamento/artes-eted/quer-saber-mais-sobre-o-curso/		f		\N	\N	f	52	1	f	2015-05-04 20:16:57.57633+00
16	00010004000200040001	5	0	Blog post	blog-post	t	f	/ywam/br/revista/blog-post/		f	The origin of the genus appears to be in the general area of Eastern Siberia/Mongolia. Wagtails spread rapidly across Eurasia and dispersed to Africa in the Zanclean (Early Pliocene) where the sub-Saharan lineage was later isolated. The African Pied Wagtail (and possibly the Mekong Wagtail) diverged prior to the massive radiation of the white-bellied black-throated and most yellow-bellied forms, all of which took place during the late Piacenzian (early Late Pliocene), c. 3 mya.	\N	\N	f	41	\N	f	\N
13	00010004000200060001	5	0	James Joyce	james-joyce	t	f	/ywam/br/nosso-time/james-joyce/		f	The origin of the genus appears to be in the general area of Eastern Siberia/Mongolia. Wagtails spread rapidly across Eurasia and dispersed to Africa	\N	\N	f	43	\N	f	2015-05-05 14:27:18.11281+00
5	0001000400020004	4	3	Revista	revista	t	f	/ywam/br/revista/		t		\N	\N	f	37	\N	f	2015-05-04 19:51:26.712076+00
1	0001	1	1	Root	root	t	f	/		f		\N	\N	f	1	\N	f	\N
2	000100040002	3	7	br	br	t	f	/ywam/br/		f		\N	\N	f	30	\N	f	2015-04-22 20:05:07.834454+00
4	0001000400020003	4	2	Eventos	eventos	t	f	/ywam/br/eventos/		f		\N	\N	f	46	\N	f	2015-05-04 20:50:34.240231+00
8	00010004000200030001	5	0	Event 1	event-1	t	f	/ywam/br/eventos/event-1/		f	At first glance, the wagtails appear to be divided into a yellow-bellied group and a white-bellied one	\N	\N	f	50	\N	f	\N
47	00010004000200080001	5	0	Contato Teste	contato-teste	t	f	/ywam/br/contato/contato-teste/		f		\N	\N	f	52	1	f	2015-05-03 19:16:48.281449+00
9	00010004000200030002	5	0	Event 2	event-2	t	f	/ywam/br/eventos/event-2/		f	Three species are poly- or paraphyletic in the present taxonomical arrangement and either subspecies need to be reassigned and/or species split up. The Blue-headed Wagtail (AKA Yellow Wagtail and many other names), especially, has always been a taxonomical nightmare with over a dozen currently accepted subspecies and many more invalid ones. The two remaining "monochrome" species, Mekong and African Pied Wagtail may be closely related, or a most striking example of convergent evolution.	\N	\N	f	50	\N	f	\N
6	0001000400020002	4	4	Ministérios	ministerios	t	f	/ywam/br/ministerios/		t		\N	\N	f	32	\N	f	2015-05-04 20:51:08.072426+00
15	00010004000200020002	5	0	Standard page 2	standard-page-2	t	f	/ywam/br/ministerios/standard-page-2/		f	The remaining five species are highly variable morphologically and their relationships with each other and with the two clades have not yet been satisfactorily explained.	\N	\N	f	35	\N	f	2015-05-04 19:59:32.95799+00
17	00010004000200020007	5	0	Photo credits	photo-credits	t	f	/ywam/br/ministerios/photo-credits/		f		\N	\N	f	35	\N	f	\N
49	0001000400020007	4	0	Sobre Nós	sobre-nos	t	f	/ywam/br/sobre-nos/		t		\N	\N	f	35	1	f	2015-05-05 15:51:35.881086+00
46	00010004000200010002	5	0	Tech Segundo Nível	tech-segundo-nivel	t	f	/ywam/br/treinamento/tech-segundo-nivel/		f		\N	\N	f	57	1	f	2015-04-24 22:51:25.328191+00
23	000100040002000200080002	6	0	Another grandchild page	another-grandchild-page	t	f	/ywam/br/ministerios/a-deeper-menu-level/another-grandchild-page/		t	The origin of the genus appears to be in the general area of Eastern Siberia/Mongolia. Wagtails spread rapidly across Eurasia and dispersed to Africa in the Zanclean (Early Pliocene) where the sub-Saharan lineage was later isolated. The African Pied Wagtail (and possibly the Mekong Wagtail) diverged prior to the massive radiation of the white-bellied black-throated and most yellow-bellied forms, all of which took place during the late Piacenzian (early Late Pliocene), c. 3 mya.	\N	\N	f	35	\N	f	\N
14	00010004000200060002	5	0	David Mitchell	david-mitchell	t	f	/ywam/br/nosso-time/david-mitchell/		f	Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators.	\N	\N	f	43	\N	f	2015-05-05 14:27:38.922738+00
12	0001000400020008	4	1	Contato	contato	t	f	/ywam/br/contato/		t	The origin of the genus appears to be in the general area of Eastern Siberia/Mongolia. Wagtails spread rapidly across Eurasia and dispersed to Africa in the Zanclean...	\N	\N	f	44	\N	f	2015-05-04 20:51:30.592726+00
10	00010004000200020001	5	0	Standard page 1	standard-page-1	t	f	/ywam/br/ministerios/standard-page-1/		f	Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters.	\N	\N	f	35	\N	f	2015-05-04 20:55:16.91457+00
36	00010004000100030004	5	2	A deeper menu level	a-deeper-menu-level	t	f	/ywam/en/standard-index/a-deeper-menu-level/		t		\N	\N	f	32	1	f	2015-04-20 19:43:17.590618+00
38	000100040001000300040002	6	0	Another grandchild page	another-grandchild-page	t	f	/ywam/en/standard-index/a-deeper-menu-level/another-grandchild-page/		t	The origin of the genus appears to be in the general area of Eastern Siberia/Mongolia. Wagtails spread rapidly across Eurasia and dispersed to Africa in the Zanclean (Early Pliocene) where the sub-Saharan lineage was later isolated. The African Pied Wagtail (and possibly the Mekong Wagtail) diverged prior to the massive radiation of the white-bellied black-throated and most yellow-bellied forms, all of which took place during the late Piacenzian (early Late Pliocene), c. 3 mya.	\N	\N	f	35	1	f	2015-04-20 19:43:17.749946+00
40	00010004000100040001	5	0	James Joyce	james-joyce	t	f	/ywam/en/people/james-joyce/		t	The origin of the genus appears to be in the general area of Eastern Siberia/Mongolia. Wagtails spread rapidly across Eurasia and dispersed to Africa	\N	\N	f	43	1	f	2015-04-20 19:43:17.874277+00
39	0001000400010004	4	2	People	people	t	f	/ywam/en/people/		t		\N	\N	f	32	1	f	2015-04-20 19:43:17.813412+00
41	00010004000100040002	5	0	David Mitchell	david-mitchell	t	f	/ywam/en/people/david-mitchell/		t	Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators.	\N	\N	f	43	1	f	2015-04-20 19:43:17.984519+00
22	000100040002000200080001	6	0	A grandchild page	a-grandchild-page	t	f	/ywam/br/ministerios/a-deeper-menu-level/a-grandchild-page/		t	The origin of the genus appears to be in the general area of Eastern Siberia/Mongolia. Wagtails spread rapidly across Eurasia and dispersed to Africa in the Zanclean (Early Pliocene) where the sub-Saharan lineage was later isolated. The African Pied Wagtail (and possibly the Mekong Wagtail) diverged prior to the massive radiation of the white-bellied black-throated and most yellow-bellied forms, all of which took place during the late Piacenzian (early Late Pliocene), c. 3 mya.	\N	\N	f	35	\N	f	\N
21	00010004000200020008	5	2	A deeper menu level	a-deeper-menu-level	t	f	/ywam/br/ministerios/a-deeper-menu-level/		f		\N	\N	f	32	\N	f	2015-05-04 20:55:35.638156+00
44	0001000400020001	4	2	Treinamento	treinamento	t	f	/ywam/br/treinamento/		t		\N	\N	f	55	1	f	2015-05-01 20:17:05.986628+00
20	0001000400020006	4	2	Nosso Time	nosso-time	t	f	/ywam/br/nosso-time/		t		\N	\N	f	32	\N	f	2015-05-04 20:53:51.275027+00
18	00010004000200040002	5	0	Blog post again	blog-post-again	t	f	/ywam/br/revista/blog-post-again/		f	Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters, laying up to six speckled eggs at a time. Among their most conspicuous behaviours is a near constant tail wagging, a trait that has given the birds their common name. In spite of the ubiquity of the behaviour and observations of it, the reasons for it are poorly understood. It has been suggested that it may flush up prey, or that it may signal submissiveness to other wagtails. Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators.	\N	\N	f	41	\N	f	\N
43	00010004	2	2	ywam	ywam	t	f	/ywam/		f		\N	\N	f	53	1	f	2015-04-20 20:42:36.360416+00
25	0001000400010001	4	2	Events index	events-index	t	f	/ywam/en/events-index/		t		\N	\N	f	46	1	f	2015-04-20 20:53:38.403948+00
19	00010004000200040003	5	0	Another blog post	another-blog-post	t	f	/ywam/br/revista/another-blog-post/		f	Three species are poly- or paraphyletic in the present taxonomical arrangement and either subspecies need to be reassigned and/or species split up. The Blue-headed Wagtail (AKA Yellow Wagtail and many other names), especially, has always been a taxonomical nightmare with over a dozen currently accepted subspecies and many more invalid ones. The two remaining "monochrome" species, Mekong and African Pied Wagtail may be closely related, or a most striking example of convergent evolution.	\N	\N	f	41	\N	f	\N
42	0001000400010005	4	0	Contact page	contact-page	t	f	/ywam/en/contact-page/		t	The origin of the genus appears to be in the general area of Eastern Siberia/Mongolia. Wagtails spread rapidly across Eurasia and dispersed to Africa in the Zanclean...	\N	\N	f	44	1	f	2015-04-20 19:43:18.099392+00
28	0001000400010002	4	3	Blog index	blog-index	t	f	/ywam/en/blog-index/		t		\N	\N	f	37	1	f	2015-04-20 19:43:16.504669+00
26	00010004000100010001	5	0	Event 1	event-1	t	f	/ywam/en/events-index/event-1/		f	At first glance, the wagtails appear to be divided into a yellow-bellied group and a white-bellied one	\N	\N	f	50	1	f	2015-04-20 19:43:16.30388+00
35	00010004000100030003	5	0	Photo credits	photo-credits	t	f	/ywam/en/standard-index/photo-credits/		f		\N	\N	f	35	1	f	2015-04-20 19:43:17.504528+00
30	00010004000100020002	5	0	Blog post again	blog-post-again	t	f	/ywam/en/blog-index/blog-post-again/		f	Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters, laying up to six speckled eggs at a time. Among their most conspicuous behaviours is a near constant tail wagging, a trait that has given the birds their common name. In spite of the ubiquity of the behaviour and observations of it, the reasons for it are poorly understood. It has been suggested that it may flush up prey, or that it may signal submissiveness to other wagtails. Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators.	\N	\N	f	41	1	f	2015-04-20 19:43:16.951588+00
27	00010004000100010002	5	0	Event 2	event-2	t	f	/ywam/en/events-index/event-2/		f	Three species are poly- or paraphyletic in the present taxonomical arrangement and either subspecies need to be reassigned and/or species split up. The Blue-headed Wagtail (AKA Yellow Wagtail and many other names), especially, has always been a taxonomical nightmare with over a dozen currently accepted subspecies and many more invalid ones. The two remaining "monochrome" species, Mekong and African Pied Wagtail may be closely related, or a most striking example of convergent evolution.	\N	\N	f	50	1	f	2015-04-20 19:43:16.412998+00
31	00010004000100020003	5	0	Another blog post	another-blog-post	t	f	/ywam/en/blog-index/another-blog-post/		f	Three species are poly- or paraphyletic in the present taxonomical arrangement and either subspecies need to be reassigned and/or species split up. The Blue-headed Wagtail (AKA Yellow Wagtail and many other names), especially, has always been a taxonomical nightmare with over a dozen currently accepted subspecies and many more invalid ones. The two remaining "monochrome" species, Mekong and African Pied Wagtail may be closely related, or a most striking example of convergent evolution.	\N	\N	f	41	1	f	2015-04-20 19:43:17.086309+00
29	00010004000100020001	5	0	Blog post	blog-post	t	f	/ywam/en/blog-index/blog-post/		f	The origin of the genus appears to be in the general area of Eastern Siberia/Mongolia. Wagtails spread rapidly across Eurasia and dispersed to Africa in the Zanclean (Early Pliocene) where the sub-Saharan lineage was later isolated. The African Pied Wagtail (and possibly the Mekong Wagtail) diverged prior to the massive radiation of the white-bellied black-throated and most yellow-bellied forms, all of which took place during the late Piacenzian (early Late Pliocene), c. 3 mya.	\N	\N	f	41	1	f	2015-04-20 19:43:16.718661+00
24	000100040001	3	5	en	en	t	f	/ywam/en/		f		\N	\N	f	30	1	f	2015-04-22 20:04:51.718023+00
33	00010004000100030001	5	0	Standard page 1	standard-page-1	t	f	/ywam/en/standard-index/standard-page-1/		t	Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters.	\N	\N	f	35	1	f	2015-04-20 19:43:17.341568+00
32	0001000400010003	4	4	Standard index	standard-index	t	f	/ywam/en/standard-index/		t		\N	\N	f	32	1	f	2015-04-20 19:43:17.23529+00
34	00010004000100030002	5	0	Standard page 2	standard-page-2	t	f	/ywam/en/standard-index/standard-page-2/		t	The remaining five species are highly variable morphologically and their relationships with each other and with the two clades have not yet been satisfactorily explained.	\N	\N	f	35	1	f	2015-04-20 19:43:17.425681+00
37	000100040001000300040001	6	0	A grandchild page	a-grandchild-page	t	f	/ywam/en/standard-index/a-deeper-menu-level/a-grandchild-page/		t	The origin of the genus appears to be in the general area of Eastern Siberia/Mongolia. Wagtails spread rapidly across Eurasia and dispersed to Africa in the Zanclean (Early Pliocene) where the sub-Saharan lineage was later isolated. The African Pied Wagtail (and possibly the Mekong Wagtail) diverged prior to the massive radiation of the white-bellied black-throated and most yellow-bellied forms, all of which took place during the late Piacenzian (early Late Pliocene), c. 3 mya.	\N	\N	f	35	1	f	2015-04-20 19:43:17.654952+00
\.


--
-- Name: wagtailcore_page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailcore_page_id_seq', 49, true);


--
-- Data for Name: wagtailcore_pagerevision; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailcore_pagerevision (id, submitted_for_moderation, created_at, content_json, approved_go_live_at, page_id, user_id) FROM stdin;
12	f	2015-04-20 19:42:58.435232+00	{"advert_placements": [], "carousel_items": [{"link_page": null, "embed_url": "", "image": 15, "link_external": "http://www.flickr.com/photos/lipkee/", "caption": "Grey wagtail by Lip Kee", "sort_order": 0, "link_document": null, "pk": 1, "page": null}, {"link_page": null, "embed_url": "", "image": 12, "link_external": "http://www.flickr.com/photos/jim_bendon_1957/", "caption": "Wagtail sproing by Jim Bendon", "sort_order": 1, "link_document": null, "pk": 2, "page": null}, {"link_page": null, "embed_url": "", "image": 11, "link_external": "http://www.flickr.com/photos/kjfnjy/", "caption": "Wagtail at Borovoye, Kazakhstan by Ken and Nyetta", "sort_order": 2, "link_document": null, "pk": 3, "page": null}], "search_description": "", "owner": null, "path": "00010002", "latest_revision_created_at": "2015-04-19T20:05:58.420Z", "go_live_at": null, "related_links": [], "title": "br", "seo_title": "", "slug": "br", "live": true, "has_unpublished_changes": false, "body": "<h2>Teste</h2><p>Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters, laying up to six speckled eggs at a time. Among their most conspicuous behaviours is a near constant tail wagging, a trait that has given the birds their common name. In spite of the ubiquity of the behaviour and observations of it, the reasons for it are poorly understood. It has been suggested that it may flush up prey, or that it may signal submissiveness to other wagtails. Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators. ;D</p>", "numchild": 5, "content_type": 30, "show_in_menus": true, "slogan": "Conhecer Deus Faz\\u00ea-Lo conhecido", "url_path": "/home-page/", "expired": false, "pk": 2, "locked": false, "depth": 2, "expire_at": null}	\N	2	1
72	f	2015-05-04 20:50:34.240231+00	{"advert_placements": [], "search_description": "", "owner": null, "intro": "<p>Three species are poly- or paraphyletic in the present taxonomical arrangement and either subspecies need to be reassigned and/or species split up. The Blue-headed Wagtail (AKA Yellow Wagtail and many other names), especially, has always been a taxonomical nightmare with over a dozen currently accepted subspecies and many more invalid ones. The two remaining \\"monochrome\\" species, Mekong and African Pied Wagtail may be closely related, or a most striking example of convergent evolution.</p>", "latest_revision_created_at": "2015-04-24T14:50:08.702Z", "go_live_at": null, "related_links": [], "title": "Eventos", "seo_title": "", "slug": "eventos", "live": true, "has_unpublished_changes": false, "numchild": 2, "content_type": 46, "show_in_menus": false, "path": "0001000400020002", "url_path": "/ywam/br/events/", "expired": false, "pk": 4, "locked": false, "depth": 4, "br_link": null, "expire_at": null}	\N	4	1
48	f	2015-04-24 14:50:08.702701+00	{"advert_placements": [], "search_description": "", "owner": null, "intro": "<p>Three species are poly- or paraphyletic in the present taxonomical arrangement and either subspecies need to be reassigned and/or species split up. The Blue-headed Wagtail (AKA Yellow Wagtail and many other names), especially, has always been a taxonomical nightmare with over a dozen currently accepted subspecies and many more invalid ones. The two remaining \\"monochrome\\" species, Mekong and African Pied Wagtail may be closely related, or a most striking example of convergent evolution.</p>", "latest_revision_created_at": null, "go_live_at": null, "related_links": [], "title": "Events", "seo_title": "", "slug": "events", "live": true, "has_unpublished_changes": false, "numchild": 2, "content_type": 46, "show_in_menus": true, "path": "0001000400020001", "url_path": "/ywam/br/events-index/", "expired": false, "pk": 4, "locked": false, "depth": 4, "br_link": null, "expire_at": null}	\N	4	1
2	f	2015-03-25 16:27:11.267532+00	{"advert_placements": [], "carousel_items": [{"link_page": null, "embed_url": "", "image": 15, "link_external": "http://www.flickr.com/photos/lipkee/", "caption": "Grey wagtail by Lip Kee", "sort_order": 0, "link_document": null, "pk": 1, "page": null}, {"link_page": null, "embed_url": "", "image": 12, "link_external": "http://www.flickr.com/photos/jim_bendon_1957/", "caption": "Wagtail sproing by Jim Bendon", "sort_order": 1, "link_document": null, "pk": 2, "page": null}, {"link_page": null, "embed_url": "", "image": 11, "link_external": "http://www.flickr.com/photos/kjfnjy/", "caption": "Wagtail at Borovoye, Kazakhstan by Ken and Nyetta", "sort_order": 2, "link_document": null, "pk": 3, "page": null}], "search_description": "", "owner": null, "latest_revision_created_at": "2015-03-25T16:26:58.880Z", "go_live_at": null, "related_links": [], "title": "Home page", "seo_title": "", "slug": "home-page", "live": true, "has_unpublished_changes": true, "body": "<h2>Teste</h2><p>Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters, laying up to six speckled eggs at a time. Among their most conspicuous behaviours is a near constant tail wagging, a trait that has given the birds their common name. In spite of the ubiquity of the behaviour and observations of it, the reasons for it are poorly understood. It has been suggested that it may flush up prey, or that it may signal submissiveness to other wagtails. Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators.</p>", "numchild": 5, "content_type": 30, "show_in_menus": true, "path": "00010002", "url_path": "/home-page/", "expired": false, "pk": 2, "locked": false, "depth": 2, "expire_at": null}	\N	2	1
3	f	2015-03-25 16:27:20.136813+00	{"advert_placements": [], "carousel_items": [{"link_page": null, "embed_url": "", "image": 15, "link_external": "http://www.flickr.com/photos/lipkee/", "caption": "Grey wagtail by Lip Kee", "sort_order": 0, "link_document": null, "pk": 1, "page": null}, {"link_page": null, "embed_url": "", "image": 12, "link_external": "http://www.flickr.com/photos/jim_bendon_1957/", "caption": "Wagtail sproing by Jim Bendon", "sort_order": 1, "link_document": null, "pk": 2, "page": null}, {"link_page": null, "embed_url": "", "image": 11, "link_external": "http://www.flickr.com/photos/kjfnjy/", "caption": "Wagtail at Borovoye, Kazakhstan by Ken and Nyetta", "sort_order": 2, "link_document": null, "pk": 3, "page": null}], "search_description": "", "owner": null, "latest_revision_created_at": "2015-03-25T16:27:11.267Z", "go_live_at": null, "related_links": [], "title": "Home page", "seo_title": "", "slug": "home-page", "live": true, "has_unpublished_changes": true, "body": "<h2>Teste</h2><p>Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters, laying up to six speckled eggs at a time. Among their most conspicuous behaviours is a near constant tail wagging, a trait that has given the birds their common name. In spite of the ubiquity of the behaviour and observations of it, the reasons for it are poorly understood. It has been suggested that it may flush up prey, or that it may signal submissiveness to other wagtails. Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators.</p>", "numchild": 5, "content_type": 30, "show_in_menus": true, "path": "00010002", "url_path": "/home-page/", "expired": false, "pk": 2, "locked": false, "depth": 2, "expire_at": null}	\N	2	1
73	f	2015-05-04 20:51:08.072426+00	{"advert_placements": [], "search_description": "", "owner": null, "intro": "<p>Three species are poly- or paraphyletic in the present taxonomical arrangement and either subspecies need to be reassigned and/or species split up. The Blue-headed Wagtail (AKA Yellow Wagtail and many other names), especially, has always been a taxonomical nightmare with over a dozen currently accepted subspecies and many more invalid ones. The two remaining \\"monochrome\\" species, Mekong and African Pied Wagtail may be closely related, or a most striking example of convergent evolution.</p>", "latest_revision_created_at": "2015-04-24T14:51:03.907Z", "go_live_at": null, "feed_image": null, "related_links": [], "title": "Minist\\u00e9rios", "seo_title": "", "slug": "ministerios", "live": true, "has_unpublished_changes": false, "numchild": 4, "content_type": 32, "show_in_menus": true, "path": "0001000400020004", "url_path": "/ywam/br/standards/", "expired": false, "pk": 6, "locked": false, "depth": 4, "br_link": null, "expire_at": null}	\N	6	1
49	f	2015-04-24 14:51:03.90713+00	{"advert_placements": [], "search_description": "", "owner": null, "intro": "<p>Three species are poly- or paraphyletic in the present taxonomical arrangement and either subspecies need to be reassigned and/or species split up. The Blue-headed Wagtail (AKA Yellow Wagtail and many other names), especially, has always been a taxonomical nightmare with over a dozen currently accepted subspecies and many more invalid ones. The two remaining \\"monochrome\\" species, Mekong and African Pied Wagtail may be closely related, or a most striking example of convergent evolution.</p>", "latest_revision_created_at": null, "go_live_at": null, "feed_image": null, "related_links": [], "title": "Standards", "seo_title": "", "slug": "standards", "live": true, "has_unpublished_changes": false, "numchild": 4, "content_type": 32, "show_in_menus": true, "path": "0001000400020003", "url_path": "/ywam/br/standard-index/", "expired": false, "pk": 6, "locked": false, "depth": 4, "br_link": null, "expire_at": null}	\N	6	1
43	f	2015-04-20 19:44:17.198746+00	{"advert_placements": [], "carousel_items": [{"link_page": null, "embed_url": "", "image": 15, "link_external": "http://www.flickr.com/photos/lipkee/", "caption": "Grey wagtail by Lip Kee", "sort_order": 0, "link_document": null, "pk": 1, "page": null}, {"link_page": null, "embed_url": "", "image": 12, "link_external": "http://www.flickr.com/photos/jim_bendon_1957/", "caption": "Wagtail sproing by Jim Bendon", "sort_order": 1, "link_document": null, "pk": 2, "page": null}, {"link_page": null, "embed_url": "", "image": 11, "link_external": "http://www.flickr.com/photos/kjfnjy/", "caption": "Wagtail at Borovoye, Kazakhstan by Ken and Nyetta", "sort_order": 2, "link_document": null, "pk": 3, "page": null}], "search_description": "", "owner": 1, "path": "00010003", "latest_revision_created_at": "2015-04-20T19:43:15.964Z", "go_live_at": null, "related_links": [], "title": "en", "seo_title": "", "slug": "en", "live": true, "has_unpublished_changes": false, "body": "<h2>Teste</h2><p>Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters, laying up to six speckled eggs at a time. Among their most conspicuous behaviours is a near constant tail wagging, a trait that has given the birds their common name. In spite of the ubiquity of the behaviour and observations of it, the reasons for it are poorly understood. It has been suggested that it may flush up prey, or that it may signal submissiveness to other wagtails. Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators. ;D</p>", "numchild": 5, "content_type": 30, "show_in_menus": true, "slogan": "Know Him Make Him Known", "url_path": "/en/", "expired": false, "pk": 24, "locked": false, "depth": 2, "expire_at": null}	\N	24	1
10	f	2015-04-19 20:02:28.8572+00	{"advert_placements": [], "carousel_items": [{"link_page": null, "embed_url": "", "image": 15, "link_external": "http://www.flickr.com/photos/lipkee/", "caption": "Grey wagtail by Lip Kee", "sort_order": 0, "link_document": null, "pk": 1, "page": null}, {"link_page": null, "embed_url": "", "image": 12, "link_external": "http://www.flickr.com/photos/jim_bendon_1957/", "caption": "Wagtail sproing by Jim Bendon", "sort_order": 1, "link_document": null, "pk": 2, "page": null}, {"link_page": null, "embed_url": "", "image": 11, "link_external": "http://www.flickr.com/photos/kjfnjy/", "caption": "Wagtail at Borovoye, Kazakhstan by Ken and Nyetta", "sort_order": 2, "link_document": null, "pk": 3, "page": null}], "search_description": "", "owner": null, "path": "00010002", "latest_revision_created_at": "2015-04-19T20:01:59.270Z", "go_live_at": null, "related_links": [], "title": "Home page", "seo_title": "", "slug": "home-page", "live": true, "has_unpublished_changes": false, "body": "<h2>Teste</h2><p>Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters, laying up to six speckled eggs at a time. Among their most conspicuous behaviours is a near constant tail wagging, a trait that has given the birds their common name. In spite of the ubiquity of the behaviour and observations of it, the reasons for it are poorly understood. It has been suggested that it may flush up prey, or that it may signal submissiveness to other wagtails. Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators. ;D</p>", "numchild": 5, "content_type": 30, "show_in_menus": true, "slogan": "Conhecer Deus. Faz\\u00ea-Lo conhecido", "url_path": "/home-page/", "expired": false, "pk": 2, "locked": false, "depth": 2, "expire_at": null}	\N	2	1
51	f	2015-04-24 14:51:35.605751+00	{"advert_placements": [], "telephone": "012345 123456", "search_description": "The origin of the genus appears to be in the general area of Eastern Siberia/Mongolia. Wagtails spread rapidly across Eurasia and dispersed to Africa in the Zanclean...", "owner": null, "latest_revision_created_at": null, "go_live_at": null, "feed_image": 7, "city": "Birdland", "title": "Contact", "seo_title": "", "slug": "contact", "live": true, "has_unpublished_changes": false, "email": "foo@example.com", "body": "<p>Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters, laying up to six speckled eggs at a time. Among their most conspicuous behaviours is a near constant tail wagging, a trait that has given the birds their common name. In spite of the ubiquity of the behaviour and observations of it, the reasons for it are poorly understood. It has been suggested that it may flush up prey, or that it may signal submissiveness to other wagtails. Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators.</p>", "post_code": "W1A 1AA", "numchild": 0, "content_type": 44, "show_in_menus": true, "path": "0001000400020005", "url_path": "/ywam/br/contact-page/", "expired": false, "pk": 12, "locked": false, "country": "Birdshire", "depth": 4, "address_1": "21 Tweety Mansions", "address_2": "3 Bird Lane", "br_link": null, "expire_at": null}	\N	12	1
57	f	2015-04-30 20:56:26.675277+00	{"advert_placements": [], "search_description": "", "owner": 1, "intro": "Treinamento \\u00e9 um dos principais minist\\u00e9rios que est\\u00e1 ligado a tudo que a <b>JOCUM</b> faz. Nossos programas t\\u00eam como objetivo equipar os crist\\u00e3os para melhor servir ao pr\\u00f3ximo nas mais diversas \\u00e1reas, desde agricultura e sa\\u00fade, artes, educa\\u00e7\\u00e3o, tecnologia at\\u00e9 reabilita\\u00e7\\u00e3o de dependentes qu\\u00edmicos e minist\\u00e9rios transculturais. Cada programa de treinamento reflete o prop\\u00f3sito da <b>JOCUM: Conhecer a Deus e faz\\u00ea-lo conhecido</b>. Cada curso pode ser oferecido tanto como um programa separado ou como parte da Universidade das Na\\u00e7\\u00f5es.\\u00a0", "latest_revision_created_at": "2015-04-24T22:24:13.378Z", "go_live_at": null, "related_links": [], "title": "Treinamento", "seo_title": "", "slug": "treinamento", "live": true, "has_unpublished_changes": false, "body": "<p>Em sua maioria, os cursos da JOCUM possuem um programa intensivo de aprendizado onde os alunos se concentram em um assunto por vez e combinam o aprendizado te\\u00f3rico com aplica\\u00e7\\u00e3o pr\\u00e1tica. Cada escola pode durar de tr\\u00eas a nove meses e quase todas os programas se dividem em fase te\\u00f3rica e fase pr\\u00e1tica, sendo esta \\u00faltima opcional em alguns casos espec\\u00edficos.</p><p><br/></p><p>Loren Cunningham definiu esse formato \\u00a0da seguinte forma: <i>\\u201cEm nossos cursos iremos enfatizar o relacionamento com Deus e uns com os outros. N\\u00f3s vamos usar um corpo rotativo de professores que v\\u00e3o se alternar e viver junto aos alunos numa comunidade ao estilo dos vilarejos da \\u00c1sia e do Pac\\u00edfico. A \\u00eanfase vai ser em aprender enquanto se faz.\\u201d</i>.\\u00a0</p><p><br/></p><p>Para muitos alunos da JOCUM, o aprendizado intensivo combinado com a vida em comunidade, e frequentemente transcultural, \\u00e9 uma experi\\u00eancia \\u00fanica de transforma\\u00e7\\u00e3o de vida.</p><p><br/></p>", "numchild": 2, "content_type": 55, "show_in_menus": true, "path": "0001000400020001", "url_path": "/ywam/br/cursos/", "expired": false, "pk": 44, "locked": false, "depth": 4, "br_link": null, "header_image": 16, "expire_at": null}	\N	44	1
52	f	2015-04-24 22:23:50.658647+00	{"advert_placements": [], "search_description": "", "owner": 1, "intro": "Cursos", "latest_revision_created_at": null, "go_live_at": null, "related_links": [], "title": "Cursos", "seo_title": "", "slug": "cursos", "live": true, "has_unpublished_changes": false, "numchild": 0, "content_type": 55, "show_in_menus": false, "path": "0001000400020006", "url_path": "/ywam/br/cursos/", "expired": false, "pk": 44, "locked": false, "depth": 4, "br_link": null, "header_image": 16, "expire_at": null}	\N	44	1
74	f	2015-05-04 20:51:30.592726+00	{"advert_placements": [], "telephone": "012345 123456", "search_description": "The origin of the genus appears to be in the general area of Eastern Siberia/Mongolia. Wagtails spread rapidly across Eurasia and dispersed to Africa in the Zanclean...", "owner": null, "latest_revision_created_at": "2015-04-24T14:51:35.605Z", "go_live_at": null, "feed_image": 7, "city": "Birdland", "title": "Contato", "seo_title": "", "slug": "contato", "live": true, "has_unpublished_changes": false, "email": "foo@example.com", "body": "<p>Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters, laying up to six speckled eggs at a time. Among their most conspicuous behaviours is a near constant tail wagging, a trait that has given the birds their common name. In spite of the ubiquity of the behaviour and observations of it, the reasons for it are poorly understood. It has been suggested that it may flush up prey, or that it may signal submissiveness to other wagtails. Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators.</p>", "post_code": "W1A 1AA", "numchild": 1, "content_type": 44, "show_in_menus": true, "path": "0001000400020006", "url_path": "/ywam/br/contact/", "expired": false, "pk": 12, "locked": false, "country": "Birdshire", "depth": 4, "address_1": "21 Tweety Mansions", "address_2": "3 Bird Lane", "br_link": null, "expire_at": null}	\N	12	1
65	f	2015-05-02 20:24:24.213432+00	{"advert_placements": [], "cost_outreach": "2.000,00 - 5.000,00", "search_description": "", "owner": 1, "latest_revision_created_at": "2015-05-02T19:51:53.477Z", "go_live_at": null, "feed_image": 16, "cost_lecture": "3.000,00", "related_links": [], "title": "Artes ETED", "signup_link": "", "date_from": "2016-02-04", "seo_title": "", "slug": "artes-eted", "languages": "Portugu\\u00eas; Ingl\\u00eas", "live": true, "has_unpublished_changes": false, "body": "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim.\\u00a0<p><br/></p><p>Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc.</p><p></p>", "numchild": 0, "content_type": 57, "show_in_menus": false, "path": "00010004000200010001", "url_path": "/ywam/br/treinamento/artes-eted/", "expired": false, "pk": 45, "locked": false, "depth": 5, "br_link": null, "header_image": null, "expire_at": null}	\N	45	1
53	f	2015-04-24 22:24:13.378802+00	{"advert_placements": [], "search_description": "", "owner": 1, "intro": "Cursos", "latest_revision_created_at": "2015-04-24T22:23:50.658Z", "go_live_at": null, "related_links": [], "title": "Cursos", "seo_title": "", "slug": "cursos", "live": true, "has_unpublished_changes": false, "numchild": 0, "content_type": 55, "show_in_menus": true, "path": "0001000400020006", "url_path": "/ywam/br/cursos/", "expired": false, "pk": 44, "locked": false, "depth": 4, "br_link": null, "header_image": 16, "expire_at": null}	\N	44	1
26	f	2015-04-20 19:43:16.30388+00	{"advert_placements": [], "carousel_items": [], "date_to": "2018-03-02", "search_description": "At first glance, the wagtails appear to be divided into a yellow-bellied group and a white-bellied one", "owner": 1, "cost": "\\u00a330 per person, \\u00a310 concessions", "latest_revision_created_at": null, "time_to": "19:00:00", "go_live_at": null, "feed_image": 8, "related_links": [], "title": "Event 1", "signup_link": "http://www.eventbrite.com/", "date_from": "2018-02-28", "seo_title": "", "slug": "event-1", "live": true, "location": "Royal Albert Hall", "has_unpublished_changes": false, "body": "<p>Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters, laying up to six speckled eggs at a time. Among their most conspicuous behaviours is a near constant tail wagging, a trait that has given the birds their common name. In spite of the ubiquity of the behaviour and observations of it, the reasons for it are poorly understood. It has been suggested that it may flush up prey, or that it may signal submissiveness to other wagtails. Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators.</p><p>At first glance, the wagtails appear to be divided into a yellow-bellied group and a white-bellied one, or one where the upper head is black and another where it is usually gray, but may be olive, yellow, or other colours. However, these are not evolutionary lineages; change of belly colour and increase of melanin have occurred independently several times in the wagtails, and the colour patterns which actually indicate relationships are more subtle.<br/></p>", "numchild": 0, "time_from": "11:30:00", "speakers": [{"last_name": "Joyce", "first_name": "James", "link_page": null, "image": 5, "link_external": "", "sort_order": 0, "link_document": null, "pk": 3, "page": 26}, {"last_name": "Mitchell", "first_name": "David", "link_page": null, "image": 6, "link_external": "", "sort_order": 1, "link_document": null, "pk": 4, "page": 26}], "audience": "public", "content_type": 50, "show_in_menus": false, "path": "0001000300010001", "url_path": "/en/events-index/event-1/", "expired": false, "pk": 26, "locked": false, "depth": 4, "expire_at": null}	\N	26	1
27	f	2015-04-20 19:43:16.412998+00	{"advert_placements": [], "carousel_items": [], "date_to": null, "search_description": "Three species are poly- or paraphyletic in the present taxonomical arrangement and either subspecies need to be reassigned and/or species split up. The Blue-headed Wagtail (AKA Yellow Wagtail and many other names), especially, has always been a taxonomical nightmare with over a dozen currently accepted subspecies and many more invalid ones. The two remaining \\"monochrome\\" species, Mekong and African Pied Wagtail may be closely related, or a most striking example of convergent evolution.", "owner": 1, "cost": "\\u00a350", "latest_revision_created_at": null, "time_to": null, "go_live_at": null, "feed_image": 10, "related_links": [], "title": "Event 2", "signup_link": "", "date_from": "2018-04-26", "seo_title": "", "slug": "event-2", "live": true, "location": "O2 Arena", "has_unpublished_changes": false, "body": "<p>Three species are poly- or paraphyletic in the present taxonomical arrangement and either subspecies need to be reassigned and/or species split up. The Blue-headed Wagtail (AKA Yellow Wagtail and many other names), especially, has always been a taxonomical nightmare with over a dozen currently accepted subspecies and many more invalid ones. The two remaining \\"monochrome\\" species, Mekong and African Pied Wagtail may be closely related, or a most striking example of convergent evolution</p>", "numchild": 0, "time_from": null, "speakers": [], "audience": "private", "content_type": 50, "show_in_menus": false, "path": "0001000300010002", "url_path": "/en/events-index/event-2/", "expired": false, "pk": 27, "locked": false, "depth": 4, "expire_at": null}	\N	27	1
28	f	2015-04-20 19:43:16.504669+00	{"advert_placements": [], "search_description": "", "owner": 1, "intro": "<p>Three species are poly- or paraphyletic in the present taxonomical arrangement and either subspecies need to be reassigned and/or species split up. The Blue-headed Wagtail (AKA Yellow Wagtail and many other names), especially, has always been a taxonomical nightmare with over a dozen currently accepted subspecies and many more invalid ones. The two remaining \\"monochrome\\" species, Mekong and African Pied Wagtail may be closely related, or a most striking example of convergent evolution.</p>", "latest_revision_created_at": null, "go_live_at": null, "related_links": [{"link_page": 4, "title": "Events index", "link_external": "", "sort_order": 0, "link_document": null, "pk": 2, "page": 28}], "title": "Blog index", "seo_title": "", "slug": "blog-index", "live": true, "has_unpublished_changes": false, "numchild": 0, "content_type": 37, "show_in_menus": true, "path": "000100030002", "url_path": "/en/blog-index/", "expired": false, "pk": 28, "locked": false, "depth": 3, "expire_at": null}	\N	28	1
29	f	2015-04-20 19:43:16.718661+00	{"advert_placements": [], "carousel_items": [{"link_page": null, "embed_url": "", "image": 9, "link_external": "http://www.flickr.com/photos/kkoshy/", "caption": "White wagtail by Koshy Koshy", "sort_order": 0, "link_document": null, "pk": 3, "page": 29}, {"link_page": null, "embed_url": "", "image": 7, "link_external": "http://www.flickr.com/photos/jim_bendon_1957/", "caption": "Wagtail by Jim Bendon", "sort_order": 1, "link_document": null, "pk": 4, "page": 29}], "search_description": "The origin of the genus appears to be in the general area of Eastern Siberia/Mongolia. Wagtails spread rapidly across Eurasia and dispersed to Africa in the Zanclean (Early Pliocene) where the sub-Saharan lineage was later isolated. The African Pied Wagtail (and possibly the Mekong Wagtail) diverged prior to the massive radiation of the white-bellied black-throated and most yellow-bellied forms, all of which took place during the late Piacenzian (early Late Pliocene), c. 3 mya.", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "feed_image": 7, "related_links": [], "title": "Blog post", "seo_title": "", "slug": "blog-post", "live": true, "has_unpublished_changes": false, "tagged_items": [{"pk": 8, "tag": 4, "content_object": 29}, {"pk": 9, "tag": 5, "content_object": 29}], "body": "<p>mtDNA cytochrome b and NADH dehydrogenase subunit 2 sequence data (Voelker, 2002) is of limited use: the suspicion that there is a superspecies of probably 3 white-bellied, black-throated wagtails is confirmed. Also, there is another superspecies in sub-Saharan Africa, three white-throated species with a black breast-band. The remaining five species are highly variable morphologically and their relationships with each other and with the two clades have not yet been satisfactorily explained.</p><p>The origin of the genus appears to be in the general area of Eastern Siberia/Mongolia. Wagtails spread rapidly across Eurasia and dispersed to Africa in the Zanclean (Early Pliocene) where the sub-Saharan lineage was later isolated. The African Pied Wagtail (and possibly the Mekong Wagtail) diverged prior to the massive radiation of the white-bellied black-throated and most yellow-bellied forms, all of which took place during the late Piacenzian (early Late Pliocene), c. 3 mya.<br/></p><p><embed alt=\\"Pied wagtail by Marie Hale\\" embedtype=\\"image\\" format=\\"left\\" id=\\"10\\"/><embed alt=\\"Wagtail Sproing by Jim Bendon\\" embedtype=\\"image\\" format=\\"right\\" id=\\"12\\"/><br/></p><p>mtDNA cytochrome b and NADH dehydrogenase subunit 2 sequence data (Voelker, 2002) is of limited use: the suspicion that there is a superspecies of probably 3 white-bellied, black-throated wagtails is confirmed. Also, there is another superspecies in sub-Saharan Africa, three white-throated species with a black breast-band. The remaining five species are highly variable morphologically and their relationships with each other and with the two clades have not yet been satisfactorily explained.</p><p>The origin of the genus appears to be in the general area of Eastern Siberia/Mongolia. Wagtails spread rapidly across Eurasia and dispersed to Africa in the Zanclean (Early Pliocene) where the sub-Saharan lineage was later isolated. The African Pied Wagtail (and possibly the Mekong Wagtail) diverged prior to the massive radiation of the white-bellied black-throated and most yellow-bellied forms, all of which took place during the late Piacenzian (early Late Pliocene), c. 3 mya.</p><p>mtDNA cytochrome b and NADH dehydrogenase subunit 2 sequence data (Voelker, 2002) is of limited use: the suspicion that there is a superspecies of probably 3 white-bellied, black-throated wagtails is confirmed. Also, there is another superspecies in sub-Saharan Africa, three white-throated species with a black breast-band. The remaining five species are highly variable morphologically and their relationships with each other and with the two clades have not yet been satisfactorily explained.</p><p>The origin of the genus appears to be in the general area of Eastern Siberia/Mongolia. Wagtails spread rapidly across Eurasia and dispersed to Africa in the Zanclean (Early Pliocene) where the sub-Saharan lineage was later isolated. The African Pied Wagtail (and possibly the Mekong Wagtail) diverged prior to the massive radiation of the white-bellied black-throated and most yellow-bellied forms, all of which took place during the late Piacenzian (early Late Pliocene), c. 3 mya.</p>", "numchild": 0, "content_type": 41, "show_in_menus": false, "date": "2013-12-02", "path": "0001000300020001", "url_path": "/en/blog-index/blog-post/", "expired": false, "pk": 29, "locked": false, "depth": 4, "expire_at": null}	\N	29	1
30	f	2015-04-20 19:43:16.951588+00	{"advert_placements": [], "carousel_items": [], "search_description": "Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters, laying up to six speckled eggs at a time. Among their most conspicuous behaviours is a near constant tail wagging, a trait that has given the birds their common name. In spite of the ubiquity of the behaviour and observations of it, the reasons for it are poorly understood. It has been suggested that it may flush up prey, or that it may signal submissiveness to other wagtails. Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators.", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "feed_image": 15, "related_links": [], "title": "Blog post again", "seo_title": "", "slug": "blog-post-again", "live": true, "has_unpublished_changes": false, "tagged_items": [{"pk": 10, "tag": 4, "content_object": 30}], "body": "<p>Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters, laying up to six speckled eggs at a time. Among their most conspicuous behaviours is a near constant tail wagging, a trait that has given the birds their common name. In spite of the ubiquity of the behaviour and observations of it, the reasons for it are poorly understood. It has been suggested that it may flush up prey, or that it may signal submissiveness to other wagtails. Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators.</p><p><br/></p><p><embed alt=\\"Grey wagtail by Lip Kee\\" embedtype=\\"image\\" format=\\"fullwidth\\" id=\\"15\\"/><br/></p><p><br/></p><p>At first glance, the wagtails appear to be divided into a yellow-bellied group and a white-bellied one, or one where the upper head is black and another where it is usually gray, but may be olive, yellow, or other colours. However, these are not evolutionary lineages; change of belly colour and increase of melanin have occurred independently several times in the wagtails, and the colour patterns which actually indicate relationships are more subtle.</p><p><br/></p><p>mtDNA cytochrome b and NADH dehydrogenase subunit 2 sequence data (Voelker, 2002) is of limited use: the suspicion that there is a superspecies of probably 3 white-bellied, black-throated wagtails is confirmed. Also, there is another superspecies in sub-Saharan Africa, three white-throated species with a black breast-band. The remaining five species are highly variable morphologically and their relationships with each other and with the two clades have not yet been satisfactorily explained.<br/></p><p><br/></p><p>The origin of the genus appears to be in the general area of Eastern Siberia/Mongolia. Wagtails spread rapidly across Eurasia and dispersed to Africa in the Zanclean (Early Pliocene) where the sub-Saharan lineage was later isolated. The African Pied Wagtail (and possibly the Mekong Wagtail) diverged prior to the massive radiation of the white-bellied black-throated and most yellow-bellied forms, all of which took place during the late Piacenzian (early Late Pliocene), c. 3 mya.<br/></p><p><br/></p><p>Three species are poly- or paraphyletic in the present taxonomical arrangement and either subspecies need to be reassigned and/or species split up. The Blue-headed Wagtail (AKA Yellow Wagtail and many other names), especially, has always been a taxonomical nightmare with over a dozen currently accepted subspecies and many more invalid ones. The two remaining \\"monochrome\\" species, Mekong and African Pied Wagtail may be closely related, or a most striking example of convergent evolution.<br/></p><p><br/></p><p>Prehistoric wagtails known from fossils are Motacilla humata and Motacilla major.<br/></p><p><br/></p><p>See the species accounts for more on individual species' relationships.</p>", "numchild": 0, "content_type": 41, "show_in_menus": false, "date": "2014-01-10", "path": "0001000300020002", "url_path": "/en/blog-index/blog-post-again/", "expired": false, "pk": 30, "locked": false, "depth": 4, "expire_at": null}	\N	30	1
31	f	2015-04-20 19:43:17.086309+00	{"advert_placements": [], "carousel_items": [], "search_description": "Three species are poly- or paraphyletic in the present taxonomical arrangement and either subspecies need to be reassigned and/or species split up. The Blue-headed Wagtail (AKA Yellow Wagtail and many other names), especially, has always been a taxonomical nightmare with over a dozen currently accepted subspecies and many more invalid ones. The two remaining \\"monochrome\\" species, Mekong and African Pied Wagtail may be closely related, or a most striking example of convergent evolution.", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "feed_image": 14, "related_links": [], "title": "Another blog post", "seo_title": "", "slug": "another-blog-post", "live": true, "has_unpublished_changes": false, "tagged_items": [{"pk": 11, "tag": 5, "content_object": 31}], "body": "<p>Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters, laying up to six speckled eggs at a time. Among their most conspicuous behaviours is a near constant tail wagging, a trait that has given the birds their common name. In spite of the ubiquity of the behaviour and observations of it, the reasons for it are poorly understood. It has been suggested that it may flush up prey, or that it may signal submissiveness to other wagtails. Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators.</p><p><br/></p><p>At first glance, the wagtails appear to be divided into a yellow-bellied group and a white-bellied one, or one where the upper head is black and another where it is usually gray, but may be olive, yellow, or other colours. However, these are not evolutionary lineages; change of belly colour and increase of melanin have occurred independently several times in the wagtails, and the colour patterns which actually indicate relationships are more subtle.<br/></p><p><br/></p><p>mtDNA cytochrome b and NADH dehydrogenase subunit 2 sequence data (Voelker, 2002) is of limited use: the suspicion that there is a superspecies of probably 3 white-bellied, black-throated wagtails is confirmed. Also, there is another superspecies in sub-Saharan Africa, three white-throated species with a black breast-band. The remaining five species are highly variable morphologically and their relationships with each other and with the two clades have not yet been satisfactorily explained.<br/></p><p><br/></p><p>The origin of the genus appears to be in the general area of Eastern Siberia/Mongolia. Wagtails spread rapidly across Eurasia and dispersed to Africa in the Zanclean (Early Pliocene) where the sub-Saharan lineage was later isolated. The African Pied Wagtail (and possibly the Mekong Wagtail) diverged prior to the massive radiation of the white-bellied black-throated and most yellow-bellied forms, all of which took place during the late Piacenzian (early Late Pliocene), c. 3 mya.<br/></p><p><br/></p><p>Three species are poly- or paraphyletic in the present taxonomical arrangement and either subspecies need to be reassigned and/or species split up. The Blue-headed Wagtail (AKA Yellow Wagtail and many other names), especially, has always been a taxonomical nightmare with over a dozen currently accepted subspecies and many more invalid ones. The two remaining \\"monochrome\\" species, Mekong and African Pied Wagtail may be closely related, or a most striking example of convergent evolution.<br/></p><p><br/></p><p>Prehistoric wagtails known from fossils are Motacilla humata and Motacilla major.<br/></p><p><br/></p><p>See the species accounts for more on individual species' relationships.<br/></p>", "numchild": 0, "content_type": 41, "show_in_menus": false, "date": "2014-02-01", "path": "0001000300020003", "url_path": "/en/blog-index/another-blog-post/", "expired": false, "pk": 31, "locked": false, "depth": 4, "expire_at": null}	\N	31	1
54	f	2015-04-24 22:37:36.380004+00	{"advert_placements": [], "cost_outreach": "2.000,00 - 5.000,00", "search_description": "", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "feed_image": 16, "related_links": [], "title": "Artes ETED", "signup_link": "", "date_from": "2016-02-04", "seo_title": "", "slug": "artes-eted", "cost_lecture": "3.000,00", "live": true, "has_unpublished_changes": false, "body": "Eted Master", "numchild": 0, "content_type": 57, "show_in_menus": false, "path": "00010004000200010001", "url_path": "/ywam/br/cursos/artes-eted/", "expired": false, "pk": 45, "locked": false, "depth": 5, "br_link": null, "header_image": null, "expire_at": null}	\N	45	1
32	f	2015-04-20 19:43:17.23529+00	{"advert_placements": [], "search_description": "", "owner": 1, "intro": "<p>Three species are poly- or paraphyletic in the present taxonomical arrangement and either subspecies need to be reassigned and/or species split up. The Blue-headed Wagtail (AKA Yellow Wagtail and many other names), especially, has always been a taxonomical nightmare with over a dozen currently accepted subspecies and many more invalid ones. The two remaining \\"monochrome\\" species, Mekong and African Pied Wagtail may be closely related, or a most striking example of convergent evolution.</p>", "latest_revision_created_at": null, "go_live_at": null, "feed_image": null, "related_links": [], "title": "Standard index", "seo_title": "", "slug": "standard-index", "live": true, "has_unpublished_changes": false, "numchild": 0, "content_type": 32, "show_in_menus": true, "path": "000100030003", "url_path": "/en/standard-index/", "expired": false, "pk": 32, "locked": false, "depth": 3, "expire_at": null}	\N	32	1
33	f	2015-04-20 19:43:17.341568+00	{"advert_placements": [], "carousel_items": [{"link_page": null, "embed_url": "", "image": 13, "link_external": "http://www.flickr.com/photos/ruthhb/", "caption": "Hopalong wagtail by Ruth Flickr", "sort_order": 0, "link_document": null, "pk": 3, "page": 33}, {"link_page": null, "embed_url": "", "image": 15, "link_external": "http://www.flickr.com/photos/lipkee/", "caption": "Grey wagtail by Lip Kee", "sort_order": 1, "link_document": null, "pk": 4, "page": 33}], "search_description": "Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters.", "owner": 1, "intro": "<p>At first glance, the wagtails appear to be divided into a yellow-bellied group and a white-bellied one, or one where the upper head is black and another where it is usually gray, but may be olive, yellow, or other colours. However, these are not evolutionary lineages; change of belly colour and increase of melanin have occurred independently several times in the wagtails, and the colour patterns which actually indicate relationships are more subtle.</p>", "latest_revision_created_at": null, "go_live_at": null, "feed_image": 12, "related_links": [{"link_page": 4, "title": "Internal link to events", "link_external": "", "sort_order": 0, "link_document": null, "pk": 3, "page": 33}, {"link_page": null, "title": "External link to google", "link_external": "http://www.google.com/", "sort_order": 1, "link_document": null, "pk": 4, "page": 33}], "title": "Standard page 1", "seo_title": "", "slug": "standard-page-1", "live": true, "has_unpublished_changes": false, "body": "<p>Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters, laying up to six speckled eggs at a time. Among their most conspicuous behaviours is a near constant tail wagging, a trait that has given the birds their common name. In spite of the ubiquity of the behaviour and observations of it, the reasons for it are poorly understood. It has been suggested that it may flush up prey, or that it may signal submissiveness to other wagtails. Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators.</p><p><br/></p><p>At first glance, the wagtails appear to be divided into a yellow-bellied group and a white-bellied one, or one where the upper head is black and another where it is usually gray, but may be olive, yellow, or other colours. However, these are not evolutionary lineages; change of belly colour and increase of melanin have occurred independently several times in the wagtails, and the colour patterns which actually indicate relationships are more subtle.<br/></p><p><br/></p><p>mtDNA cytochrome b and NADH dehydrogenase subunit 2 sequence data (Voelker, 2002) is of limited use: the suspicion that there is a superspecies of probably 3 white-bellied, black-throated wagtails is confirmed. Also, there is another superspecies in sub-Saharan Africa, three white-throated species with a black breast-band. The remaining five species are highly variable morphologically and their relationships with each other and with the two clades have not yet been satisfactorily explained.<br/></p><p><br/></p><p>The origin of the genus appears to be in the general area of Eastern Siberia/Mongolia. Wagtails spread rapidly across Eurasia and dispersed to Africa in the Zanclean (Early Pliocene) where the sub-Saharan lineage was later isolated. The African Pied Wagtail (and possibly the Mekong Wagtail) diverged prior to the massive radiation of the white-bellied black-throated and most yellow-bellied forms, all of which took place during the late Piacenzian (early Late Pliocene), c. 3 mya.<br/></p>", "numchild": 0, "content_type": 35, "show_in_menus": true, "path": "0001000300030001", "url_path": "/en/standard-index/standard-page-1/", "expired": false, "pk": 33, "locked": false, "depth": 4, "expire_at": null}	\N	33	1
34	f	2015-04-20 19:43:17.425681+00	{"advert_placements": [], "carousel_items": [], "search_description": "The remaining five species are highly variable morphologically and their relationships with each other and with the two clades have not yet been satisfactorily explained.", "owner": 1, "intro": "<p>The remaining five species are highly variable morphologically and their relationships with each other and with the two clades have not yet been satisfactorily explained.</p>", "latest_revision_created_at": null, "go_live_at": null, "feed_image": 10, "related_links": [], "title": "Standard page 2", "seo_title": "", "slug": "standard-page-2", "live": true, "has_unpublished_changes": false, "body": "<h4>Wagtails are great</h4><p>At first glance, the wagtails appear to be divided into a yellow-bellied group and a white-bellied one, or one where the upper head is black and another where it is usually gray, but may be olive, yellow, or other colours. However, these are not evolutionary lineages; change of belly colour and increase of melanin have occurred independently several times in the wagtails, and the colour patterns which actually indicate relationships are more subtle.</p><p><embed alt=\\"Wagtail Sproing by Jim Bendon\\" embedtype=\\"image\\" format=\\"left\\" id=\\"12\\"/><br/></p><h4>Wagtails are pretty</h4><p>mtDNA cytochrome b and NADH dehydrogenase subunit 2 sequence data (Voelker, 2002) is of limited use: the suspicion that there is a superspecies of probably 3 white-bellied, black-throated wagtails is confirmed. Also, there is another superspecies in sub-Saharan Africa, three white-throated species with a black breast-band. The remaining five species are highly variable morphologically and their relationships with each other and with the two clades have not yet been satisfactorily explained.<br/></p><p><embed alt=\\"Pied wagtail by Marie Hale\\" embedtype=\\"image\\" format=\\"right\\" id=\\"10\\"/><br/></p><p>The origin of the genus appears to be in the general area of Eastern Siberia/Mongolia. Wagtails spread rapidly across Eurasia and dispersed to Africa in the Zanclean (Early Pliocene) where the sub-Saharan lineage was later isolated. The African Pied Wagtail (and possibly the Mekong Wagtail) diverged prior to the massive radiation of the white-bellied black-throated and most yellow-bellied forms, all of which took place during the late Piacenzian (early Late Pliocene), c. 3 mya.<br/></p><p>Three species are poly- or paraphyletic in the present taxonomical arrangement and either subspecies need to be reassigned and/or species split up. The Blue-headed Wagtail (AKA Yellow Wagtail and many other names), especially, has always been a taxonomical nightmare with over a dozen currently accepted subspecies and many more invalid ones. The two remaining \\"monochrome\\" species, Mekong and African Pied Wagtail may be closely related, or a most striking example of convergent evolution.<br/></p>", "numchild": 0, "content_type": 35, "show_in_menus": true, "path": "0001000300030002", "url_path": "/en/standard-index/standard-page-2/", "expired": false, "pk": 34, "locked": false, "depth": 4, "expire_at": null}	\N	34	1
35	f	2015-04-20 19:43:17.504528+00	{"advert_placements": [], "carousel_items": [], "search_description": "", "owner": 1, "intro": "<p>The following photos have been used in the sample wagtail demo database</p>", "latest_revision_created_at": null, "go_live_at": null, "feed_image": 15, "related_links": [], "title": "Photo credits", "seo_title": "", "slug": "photo-credits", "live": true, "has_unpublished_changes": false, "body": "<br/><p>James Joyce,\\u00a01915,\\u00a0<a href=\\"http://epc.buffalo.edu/authors/joyce/image/1915.jpg\\">Cornell Joyce Collection</a>\\u00a0by C. Ruf - public domain in the United States</p>\\n<p>David Mitchell (b. 1969), British writer,\\u00a0Warsaw (Poland), April 7, 2006, \\u00a0<a href=\\"http://www.mariuszkubik.pl/\\">Mariusz Kubik</a>, GDFL licence</p><p>Wagtail,\\u00a0October 14, 2012\\u00a0by <a href=\\"http://www.flickr.com/photos/markyharky/\\">Mark Harkin</a>, \\u00a0\\u00a0<a href=\\"http://creativecommons.org/licenses/by/2.0/\\">Creative Commons</a></p><p>Wagtail, February 18th 2008, by <a href=\\"http://www.flickr.com/photos/oufoufsworld/\\">Joe Buckingham</a>, <a href=\\"http://creativecommons.org/licenses/by/2.0/\\">Creative Commons</a></p><p>Wagtail, August 4th 2009, by <a href=\\"http://www.flickr.com/photos/fsphil/\\">fs-phil</a>, <a href=\\"http://creativecommons.org/licenses/by-sa/2.0/\\">Creative Commons</a></p><p>White wagtail, February 5th 2012, by <a href=\\"http://www.flickr.com/photos/kkoshy/\\">Koshy Koshy</a>, <a href=\\"http://creativecommons.org/licenses/by/2.0/\\">Creative Commons</a></p><p>Pied wagtail, January 20th 2013, by <a href=\\"http://www.flickr.com/photos/15016964@N02/\\">Marie Hale</a>, <a href=\\"http://creativecommons.org/licenses/by/2.0/\\">Creative Commons</a></p><p>Wagtail at Borovoye, Kazakhstan, June 16th 2012, by <a href=\\"http://www.flickr.com/photos/kjfnjy/\\">Ken and Nyetta</a>,\\u00a0<a href=\\"http://creativecommons.org/licenses/by/2.0/\\">Creative Commons</a></p><p>Wagtail sproing, April 29 2012, by <a href=\\"http://www.flickr.com/photos/jim_bendon_1957/\\">Jim Bendon</a>, <a href=\\"http://creativecommons.org/licenses/by-sa/2.0/\\">Creative Commons</a></p><p>Hopalong wagtail, June 17th 2008, by <a href=\\"http://www.flickr.com/photos/ruthhb/\\">Ruth Flickr</a>, <a href=\\"http://creativecommons.org/licenses/by-nc-sa/2.0/\\">Creative Commons</a></p><p>Wagtail collects insects, June 10th 2010, by <a href=\\"http://www.flickr.com/photos/27126314@N03/\\">Margrit</a>, <a href=\\"http://creativecommons.org/licenses/by-nc-sa/2.0/\\">Creative Commons</a></p><p>Grey wagtail, March 13th 2009, by <a href=\\"http://www.flickr.com/photos/lipkee/\\">Lip Kee</a>, <a href=\\"http://creativecommons.org/licenses/by-sa/2.0/\\">Creative Commons</a></p>", "numchild": 0, "content_type": 35, "show_in_menus": false, "path": "0001000300030003", "url_path": "/en/standard-index/photo-credits/", "expired": false, "pk": 35, "locked": false, "depth": 4, "expire_at": null}	\N	35	1
36	f	2015-04-20 19:43:17.590618+00	{"advert_placements": [], "search_description": "", "owner": 1, "intro": "<p>A listing of pages at the next level down</p>", "latest_revision_created_at": null, "go_live_at": null, "feed_image": null, "related_links": [], "title": "A deeper menu level", "seo_title": "", "slug": "a-deeper-menu-level", "live": true, "has_unpublished_changes": false, "numchild": 0, "content_type": 32, "show_in_menus": true, "path": "0001000300030004", "url_path": "/en/standard-index/a-deeper-menu-level/", "expired": false, "pk": 36, "locked": false, "depth": 4, "expire_at": null}	\N	36	1
37	f	2015-04-20 19:43:17.654952+00	{"advert_placements": [], "carousel_items": [], "search_description": "The origin of the genus appears to be in the general area of Eastern Siberia/Mongolia. Wagtails spread rapidly across Eurasia and dispersed to Africa in the Zanclean (Early Pliocene) where the sub-Saharan lineage was later isolated. The African Pied Wagtail (and possibly the Mekong Wagtail) diverged prior to the massive radiation of the white-bellied black-throated and most yellow-bellied forms, all of which took place during the late Piacenzian (early Late Pliocene), c. 3 mya.", "owner": 1, "intro": "<p>At first glance, the wagtails appear to be divided into a yellow-bellied group and a white-bellied one, or one where the upper head is black and another where it is usually gray, but may be olive, yellow, or other colours.</p>", "latest_revision_created_at": null, "go_live_at": null, "feed_image": null, "related_links": [], "title": "A grandchild page", "seo_title": "", "slug": "a-grandchild-page", "live": true, "has_unpublished_changes": false, "body": "<p>The origin of the genus appears to be in the general area of Eastern Siberia/Mongolia. Wagtails spread rapidly across Eurasia and dispersed to Africa in the Zanclean (Early Pliocene) where the sub-Saharan lineage was later isolated. The African Pied Wagtail (and possibly the Mekong Wagtail) diverged prior to the massive radiation of the white-bellied black-throated and most yellow-bellied forms, all of which took place during the late Piacenzian (early Late Pliocene), c. 3 mya.</p><p><span><br/></span></p><p><span>Three species are poly- or paraphyletic in the present taxonomical arrangement and either subspecies need to be reassigned and/or species split up. The Blue-headed Wagtail (AKA Yellow Wagtail and many other names), especially, has always been a taxonomical nightmare with over a dozen currently accepted subspecies and many more invalid ones. The two remaining \\"monochrome\\" species, Mekong and African Pied Wagtail may be closely related, or a most striking example of convergent evolution.</span><br/></p>", "numchild": 0, "content_type": 35, "show_in_menus": true, "path": "00010003000300040001", "url_path": "/en/standard-index/a-deeper-menu-level/a-grandchild-page/", "expired": false, "pk": 37, "locked": false, "depth": 5, "expire_at": null}	\N	37	1
38	f	2015-04-20 19:43:17.749946+00	{"advert_placements": [], "carousel_items": [], "search_description": "The origin of the genus appears to be in the general area of Eastern Siberia/Mongolia. Wagtails spread rapidly across Eurasia and dispersed to Africa in the Zanclean (Early Pliocene) where the sub-Saharan lineage was later isolated. The African Pied Wagtail (and possibly the Mekong Wagtail) diverged prior to the massive radiation of the white-bellied black-throated and most yellow-bellied forms, all of which took place during the late Piacenzian (early Late Pliocene), c. 3 mya.", "owner": 1, "intro": "<p>The origin of the genus appears to be in the general area of Eastern Siberia/Mongolia. Wagtails spread rapidly across Eurasia and dispersed to Africa in the Zanclean (Early Pliocene) where the sub-Saharan lineage was later isolated. The African Pied Wagtail (and possibly the Mekong Wagtail) diverged prior to the massive radiation of the white-bellied black-throated and most yellow-bellied forms, all of which took place during the late Piacenzian (early Late Pliocene), c. 3 mya.</p>", "latest_revision_created_at": null, "go_live_at": null, "feed_image": null, "related_links": [], "title": "Another grandchild page", "seo_title": "", "slug": "another-grandchild-page", "live": true, "has_unpublished_changes": false, "body": "<p>The origin of the genus appears to be in the general area of Eastern Siberia/Mongolia. Wagtails spread rapidly across Eurasia and dispersed to Africa in the Zanclean (Early Pliocene) where the sub-Saharan lineage was later isolated. The African Pied Wagtail (and possibly the Mekong Wagtail) diverged prior to the massive radiation of the white-bellied black-throated and most yellow-bellied forms, all of which took place during the late Piacenzian (early Late Pliocene), c. 3 mya.</p><p><span><br/></span></p><p><span>Three species are poly- or paraphyletic in the present taxonomical arrangement and either subspecies need to be reassigned and/or species split up. The Blue-headed Wagtail (AKA Yellow Wagtail and many other names), especially, has always been a taxonomical nightmare with over a dozen currently accepted subspecies and many more invalid ones. The two remaining \\"monochrome\\" species, Mekong and African Pied Wagtail may be closely related, or a most striking example of convergent evolution.</span><br/></p>", "numchild": 0, "content_type": 35, "show_in_menus": true, "path": "00010003000300040002", "url_path": "/en/standard-index/a-deeper-menu-level/another-grandchild-page/", "expired": false, "pk": 38, "locked": false, "depth": 5, "expire_at": null}	\N	38	1
39	f	2015-04-20 19:43:17.813412+00	{"advert_placements": [], "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": null, "go_live_at": null, "feed_image": null, "related_links": [], "title": "People", "seo_title": "", "slug": "people", "live": true, "has_unpublished_changes": false, "numchild": 0, "content_type": 32, "show_in_menus": true, "path": "000100030004", "url_path": "/en/people/", "expired": false, "pk": 39, "locked": false, "depth": 3, "expire_at": null}	\N	39	1
40	f	2015-04-20 19:43:17.874277+00	{"last_name": "Joyce", "advert_placements": [], "image": 5, "telephone": "012345 123456", "search_description": "The origin of the genus appears to be in the general area of Eastern Siberia/Mongolia. Wagtails spread rapidly across Eurasia and dispersed to Africa", "owner": 1, "intro": "<p>The origin of the genus appears to be in the general area of Eastern Siberia/Mongolia. Wagtails spread rapidly across Eurasia and dispersed to Africa in the Zanclean</p>", "latest_revision_created_at": null, "biography": "<p>Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters, laying up to six speckled eggs at a time. Among their most conspicuous behaviours is a near constant tail wagging, a trait that has given the birds their common name. In spite of the ubiquity of the behaviour and observations of it, the reasons for it are poorly understood. It has been suggested that it may flush up prey, or that it may signal submissiveness to other wagtails. Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators.</p><p><br/></p><p>At first glance, the wagtails appear to be divided into a yellow-bellied group and a white-bellied one, or one where the upper head is black and another where it is usually gray, but may be olive, yellow, or other colours. However, these are not evolutionary lineages; change of belly colour and increase of melanin have occurred independently several times in the wagtails, and the colour patterns which actually indicate relationships are more subtle.<br/></p>", "go_live_at": null, "feed_image": 5, "city": "Birdland", "first_name": "James", "title": "James Joyce", "seo_title": "", "slug": "james-joyce", "live": true, "has_unpublished_changes": false, "email": "foo@example.com", "post_code": "W1A 1AA", "numchild": 0, "related_links": [], "content_type": 43, "show_in_menus": true, "path": "0001000300040001", "url_path": "/en/people/james-joyce/", "expired": false, "pk": 40, "locked": false, "country": "Birdshire", "depth": 4, "address_1": "21 Tweety Mansions", "address_2": "3 Bird Lane", "expire_at": null}	\N	40	1
80	f	2015-05-05 15:51:35.881086+00	{"advert_placements": [], "carousel_items": [], "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": null, "go_live_at": null, "feed_image": null, "related_links": [], "title": "Sobre N\\u00f3s", "seo_title": "", "slug": "sobre-nos", "live": true, "has_unpublished_changes": false, "body": "", "numchild": 0, "content_type": 35, "show_in_menus": true, "path": "0001000400020008", "url_path": "/ywam/br/sobre-nos/", "expired": false, "pk": 49, "locked": false, "depth": 4, "br_link": null, "expire_at": null}	\N	49	1
75	f	2015-05-04 20:53:51.275027+00	{"advert_placements": [], "search_description": "", "owner": null, "intro": "", "latest_revision_created_at": null, "go_live_at": null, "feed_image": null, "related_links": [], "title": "Nosso Time", "seo_title": "", "slug": "nosso-time", "live": true, "has_unpublished_changes": false, "numchild": 2, "content_type": 32, "show_in_menus": true, "path": "0001000400020005", "url_path": "/ywam/br/people/", "expired": false, "pk": 20, "locked": false, "depth": 4, "br_link": null, "expire_at": null}	\N	20	1
41	f	2015-04-20 19:43:17.984519+00	{"last_name": "Mitchell", "advert_placements": [], "image": 6, "telephone": "", "search_description": "Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators.", "owner": 1, "intro": "<p>Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World.</p>", "latest_revision_created_at": null, "biography": "<p>Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters, laying up to six speckled eggs at a time. Among their most conspicuous behaviours is a near constant tail wagging, a trait that has given the birds their common name. In spite of the ubiquity of the behaviour and observations of it, the reasons for it are poorly understood. It has been suggested that it may flush up prey, or that it may signal submissiveness to other wagtails. Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators.</p>", "go_live_at": null, "feed_image": 6, "city": "", "first_name": "David", "title": "David Mitchell", "seo_title": "", "slug": "david-mitchell", "live": true, "has_unpublished_changes": false, "email": "foo@example.com", "post_code": "W1A 1AA", "numchild": 0, "related_links": [], "content_type": 43, "show_in_menus": true, "path": "0001000300040002", "url_path": "/en/people/david-mitchell/", "expired": false, "pk": 41, "locked": false, "country": "", "depth": 4, "address_1": "", "address_2": "", "expire_at": null}	\N	41	1
55	f	2015-04-24 22:39:21.674144+00	{"advert_placements": [], "cost_outreach": "1.000,00", "search_description": "", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "feed_image": null, "related_links": [], "title": "Tech Segundo N\\u00edvel", "signup_link": "", "date_from": "2016-08-02", "seo_title": "", "slug": "tech-segundo-nivel", "cost_lecture": "5.000,00", "live": true, "has_unpublished_changes": false, "body": "Tech Segundo N\\u00edvel", "numchild": 0, "content_type": 57, "show_in_menus": false, "path": "00010004000200010002", "url_path": "/ywam/br/cursos/tech-segundo-nivel/", "expired": false, "pk": 46, "locked": false, "depth": 5, "br_link": null, "header_image": null, "expire_at": null}	\N	46	1
42	f	2015-04-20 19:43:18.099392+00	{"advert_placements": [], "telephone": "012345 123456", "search_description": "The origin of the genus appears to be in the general area of Eastern Siberia/Mongolia. Wagtails spread rapidly across Eurasia and dispersed to Africa in the Zanclean...", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "feed_image": 7, "city": "Birdland", "title": "Contact page", "seo_title": "", "slug": "contact-page", "live": true, "has_unpublished_changes": false, "email": "foo@example.com", "body": "<p>Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters, laying up to six speckled eggs at a time. Among their most conspicuous behaviours is a near constant tail wagging, a trait that has given the birds their common name. In spite of the ubiquity of the behaviour and observations of it, the reasons for it are poorly understood. It has been suggested that it may flush up prey, or that it may signal submissiveness to other wagtails. Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators.</p>", "post_code": "W1A 1AA", "numchild": 0, "content_type": 44, "show_in_menus": true, "path": "000100030005", "url_path": "/en/contact-page/", "expired": false, "pk": 42, "locked": false, "country": "Birdshire", "depth": 3, "address_1": "21 Tweety Mansions", "address_2": "3 Bird Lane", "expire_at": null}	\N	42	1
56	f	2015-04-24 22:51:25.328191+00	{"advert_placements": [], "cost_outreach": "1.000,00", "search_description": "", "owner": 1, "latest_revision_created_at": "2015-04-24T22:39:21.674Z", "go_live_at": null, "feed_image": 17, "related_links": [], "title": "Tech Segundo N\\u00edvel", "signup_link": "", "date_from": "2016-08-02", "seo_title": "", "slug": "tech-segundo-nivel", "cost_lecture": "5.000,00", "live": true, "has_unpublished_changes": false, "body": "Tech Segundo N\\u00edvel", "numchild": 0, "content_type": 57, "show_in_menus": false, "path": "00010004000200010002", "url_path": "/ywam/br/cursos/tech-segundo-nivel/", "expired": false, "pk": 46, "locked": false, "depth": 5, "br_link": null, "header_image": null, "expire_at": null}	\N	46	1
76	f	2015-05-04 20:55:16.91457+00	{"advert_placements": [], "carousel_items": [{"link_page": null, "embed_url": "", "image": 13, "link_external": "http://www.flickr.com/photos/ruthhb/", "caption": "Hopalong wagtail by Ruth Flickr", "sort_order": 0, "link_document": null, "pk": 1, "page": 10}, {"link_page": null, "embed_url": "", "image": 15, "link_external": "http://www.flickr.com/photos/lipkee/", "caption": "Grey wagtail by Lip Kee", "sort_order": 1, "link_document": null, "pk": 2, "page": 10}], "search_description": "Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters.", "owner": null, "intro": "<p>At first glance, the wagtails appear to be divided into a yellow-bellied group and a white-bellied one, or one where the upper head is black and another where it is usually gray, but may be olive, yellow, or other colours. However, these are not evolutionary lineages; change of belly colour and increase of melanin have occurred independently several times in the wagtails, and the colour patterns which actually indicate relationships are more subtle.</p>", "latest_revision_created_at": null, "go_live_at": null, "feed_image": 12, "related_links": [{"link_page": 4, "title": "Internal link to events", "link_external": "", "sort_order": 0, "link_document": null, "pk": 1, "page": 10}, {"link_page": null, "title": "External link to google", "link_external": "http://www.google.com/", "sort_order": 1, "link_document": null, "pk": 2, "page": 10}], "title": "Standard page 1", "seo_title": "", "slug": "standard-page-1", "live": true, "has_unpublished_changes": false, "body": "<p>Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters, laying up to six speckled eggs at a time. Among their most conspicuous behaviours is a near constant tail wagging, a trait that has given the birds their common name. In spite of the ubiquity of the behaviour and observations of it, the reasons for it are poorly understood. It has been suggested that it may flush up prey, or that it may signal submissiveness to other wagtails. Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators.</p><p><br/></p><p>At first glance, the wagtails appear to be divided into a yellow-bellied group and a white-bellied one, or one where the upper head is black and another where it is usually gray, but may be olive, yellow, or other colours. However, these are not evolutionary lineages; change of belly colour and increase of melanin have occurred independently several times in the wagtails, and the colour patterns which actually indicate relationships are more subtle.<br/></p><p><br/></p><p>mtDNA cytochrome b and NADH dehydrogenase subunit 2 sequence data (Voelker, 2002) is of limited use: the suspicion that there is a superspecies of probably 3 white-bellied, black-throated wagtails is confirmed. Also, there is another superspecies in sub-Saharan Africa, three white-throated species with a black breast-band. The remaining five species are highly variable morphologically and their relationships with each other and with the two clades have not yet been satisfactorily explained.<br/></p><p><br/></p><p>The origin of the genus appears to be in the general area of Eastern Siberia/Mongolia. Wagtails spread rapidly across Eurasia and dispersed to Africa in the Zanclean (Early Pliocene) where the sub-Saharan lineage was later isolated. The African Pied Wagtail (and possibly the Mekong Wagtail) diverged prior to the massive radiation of the white-bellied black-throated and most yellow-bellied forms, all of which took place during the late Piacenzian (early Late Pliocene), c. 3 mya.<br/></p>", "numchild": 0, "content_type": 35, "show_in_menus": false, "path": "00010004000200020001", "url_path": "/ywam/br/ministerios/standard-page-1/", "expired": false, "pk": 10, "locked": false, "depth": 5, "br_link": null, "expire_at": null}	\N	10	1
44	f	2015-04-20 20:42:36.360416+00	{"advert_placements": [], "locked": false, "title": "ywam", "numchild": 0, "show_in_menus": false, "live": true, "seo_title": "", "search_description": "", "depth": 2, "latest_revision_created_at": null, "has_unpublished_changes": false, "content_type": 53, "path": "00010004", "owner": 1, "pk": 43, "url_path": "/ywam/", "expired": false, "slug": "ywam", "expire_at": null, "go_live_at": null}	\N	43	1
77	f	2015-05-04 20:55:35.638156+00	{"advert_placements": [], "search_description": "", "owner": null, "intro": "<p>A listing of pages at the next level down</p>", "latest_revision_created_at": null, "go_live_at": null, "feed_image": null, "related_links": [], "title": "A deeper menu level", "seo_title": "", "slug": "a-deeper-menu-level", "live": true, "has_unpublished_changes": false, "numchild": 2, "content_type": 32, "show_in_menus": false, "path": "00010004000200020008", "url_path": "/ywam/br/ministerios/a-deeper-menu-level/", "expired": false, "pk": 21, "locked": false, "depth": 5, "br_link": null, "expire_at": null}	\N	21	1
13	f	2015-04-20 19:42:58.435232+00	{"advert_placements": [], "carousel_items": [{"link_page": null, "embed_url": "", "image": 15, "link_external": "http://www.flickr.com/photos/lipkee/", "caption": "Grey wagtail by Lip Kee", "sort_order": 0, "pk": 1, "link_document": null, "page": 24}, {"link_page": null, "embed_url": "", "image": 12, "link_external": "http://www.flickr.com/photos/jim_bendon_1957/", "caption": "Wagtail sproing by Jim Bendon", "sort_order": 1, "pk": 2, "link_document": null, "page": 24}, {"link_page": null, "embed_url": "", "image": 11, "link_external": "http://www.flickr.com/photos/kjfnjy/", "caption": "Wagtail at Borovoye, Kazakhstan by Ken and Nyetta", "sort_order": 2, "pk": 3, "link_document": null, "page": 24}], "seo_title": "", "owner": null, "path": "00010002", "latest_revision_created_at": "2015-04-19T20:05:58.420Z", "go_live_at": null, "related_links": [], "title": "br", "search_description": "", "live": true, "has_unpublished_changes": false, "pk": 24, "body": "<h2>Teste</h2><p>Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters, laying up to six speckled eggs at a time. Among their most conspicuous behaviours is a near constant tail wagging, a trait that has given the birds their common name. In spite of the ubiquity of the behaviour and observations of it, the reasons for it are poorly understood. It has been suggested that it may flush up prey, or that it may signal submissiveness to other wagtails. Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators. ;D</p>", "numchild": 5, "content_type": 30, "show_in_menus": true, "locked": false, "url_path": "/home-page/", "expired": false, "slug": "br", "slogan": "Conhecer Deus Faz\\u00ea-Lo conhecido", "depth": 2, "expire_at": null}	\N	24	1
59	f	2015-05-01 19:44:53.831627+00	{"advert_placements": [], "search_description": "", "owner": 1, "intro": "Treinamento \\u00e9 um dos principais minist\\u00e9rios que est\\u00e1 ligado a tudo que a <b>JOCUM</b> faz. Nossos programas t\\u00eam como objetivo equipar os crist\\u00e3os para melhor servir ao pr\\u00f3ximo nas mais diversas \\u00e1reas, desde agricultura e sa\\u00fade, artes, educa\\u00e7\\u00e3o, tecnologia at\\u00e9 reabilita\\u00e7\\u00e3o de dependentes qu\\u00edmicos e minist\\u00e9rios transculturais. Cada programa de treinamento reflete o prop\\u00f3sito da <b>JOCUM: Conhecer a Deus e faz\\u00ea-lo conhecido</b>. Cada curso pode ser oferecido tanto como um programa separado ou como parte da Universidade das Na\\u00e7\\u00f5es.\\u00a0", "latest_revision_created_at": "2015-05-01T19:43:14.063Z", "go_live_at": null, "related_links": [], "title": "Treinamento", "seo_title": "", "slug": "treinamento", "live": true, "has_unpublished_changes": false, "body": "<p>Em sua maioria, os cursos da JOCUM possuem um programa intensivo de aprendizado onde os alunos se concentram em um assunto por vez e combinam o aprendizado te\\u00f3rico com aplica\\u00e7\\u00e3o pr\\u00e1tica. Cada escola pode durar de tr\\u00eas a nove meses e quase todas os programas se dividem em fase te\\u00f3rica e fase pr\\u00e1tica, sendo esta \\u00faltima opcional em alguns casos espec\\u00edficos.</p><p><br/></p><p>Loren Cunningham definiu esse formato \\u00a0da seguinte forma: <i>\\u201cEm nossos cursos iremos enfatizar o relacionamento com Deus e uns com os outros. N\\u00f3s vamos usar um corpo rotativo de professores que v\\u00e3o se alternar e viver junto aos alunos numa comunidade ao estilo dos vilarejos da \\u00c1sia e do Pac\\u00edfico. A \\u00eanfase vai ser em aprender enquanto se faz.\\u201d</i>.\\u00a0</p><p><br/></p><p>Para muitos alunos da JOCUM, o aprendizado intensivo combinado com a vida em comunidade, e frequentemente transcultural, \\u00e9 uma experi\\u00eancia \\u00fanica de transforma\\u00e7\\u00e3o de vida.</p><p><br/></p>", "numchild": 2, "content_type": 55, "show_in_menus": true, "path": "0001000400020001", "url_path": "/ywam/br/treinamento/", "expired": false, "pk": 44, "locked": false, "depth": 4, "br_link": null, "header_image": 16, "expire_at": null}	\N	44	1
58	f	2015-05-01 19:43:14.063114+00	{"advert_placements": [], "search_description": "", "owner": 1, "intro": "Treinamento \\u00e9 um dos principais minist\\u00e9rios que est\\u00e1 ligado a tudo que a <b>JOCUM</b> faz. Nossos programas t\\u00eam como objetivo equipar os crist\\u00e3os para melhor servir ao pr\\u00f3ximo nas mais diversas \\u00e1reas, desde agricultura e sa\\u00fade, artes, educa\\u00e7\\u00e3o, tecnologia at\\u00e9 reabilita\\u00e7\\u00e3o de dependentes qu\\u00edmicos e minist\\u00e9rios transculturais. Cada programa de treinamento reflete o prop\\u00f3sito da <b>JOCUM: Conhecer a Deus e faz\\u00ea-lo conhecido</b>. Cada curso pode ser oferecido tanto como um programa separado ou como parte da Universidade das Na\\u00e7\\u00f5es.\\u00a0", "latest_revision_created_at": "2015-04-30T20:56:26.675Z", "go_live_at": null, "related_links": [], "title": "Treinamento", "seo_title": "", "slug": "treinamento", "live": true, "has_unpublished_changes": false, "body": "<p>Em sua maioria, os cursos da JOCUM possuem um programa intensivo de aprendizado onde os alunos se concentram em um assunto por vez e combinam o aprendizado te\\u00f3rico com aplica\\u00e7\\u00e3o pr\\u00e1tica. Cada escola pode durar de tr\\u00eas a nove meses e quase todas os programas se dividem em fase te\\u00f3rica e fase pr\\u00e1tica, sendo esta \\u00faltima opcional em alguns casos espec\\u00edficos.</p><p>Loren Cunningham definiu esse formato \\u00a0da seguinte forma: <i>\\u201cEm nossos cursos iremos enfatizar o relacionamento com Deus e uns com os outros. N\\u00f3s vamos usar um corpo rotativo de professores que v\\u00e3o se alternar e viver junto aos alunos numa comunidade ao estilo dos vilarejos da \\u00c1sia e do Pac\\u00edfico. A \\u00eanfase vai ser em aprender enquanto se faz.\\u201d</i>.\\u00a0</p><p>Para muitos alunos da JOCUM, o aprendizado intensivo combinado com a vida em comunidade, e frequentemente transcultural, \\u00e9 uma experi\\u00eancia \\u00fanica de transforma\\u00e7\\u00e3o de vida.</p><p><br/></p>", "numchild": 2, "content_type": 55, "show_in_menus": true, "path": "0001000400020001", "url_path": "/ywam/br/treinamento/", "expired": false, "pk": 44, "locked": false, "depth": 4, "br_link": null, "header_image": 16, "expire_at": null}	\N	44	1
20	f	2015-04-19 18:34:29.385224+00	{"advert_placements": [], "carousel_items": [{"link_page": null, "embed_url": "", "image": 15, "link_external": "http://www.flickr.com/photos/lipkee/", "caption": "Grey wagtail by Lip Kee", "sort_order": 0, "pk": 1, "link_document": null, "page": 24}, {"link_page": null, "embed_url": "", "image": 12, "link_external": "http://www.flickr.com/photos/jim_bendon_1957/", "caption": "Wagtail sproing by Jim Bendon", "sort_order": 1, "pk": 2, "link_document": null, "page": 24}, {"link_page": null, "embed_url": "", "image": 11, "link_external": "http://www.flickr.com/photos/kjfnjy/", "caption": "Wagtail at Borovoye, Kazakhstan by Ken and Nyetta", "sort_order": 2, "pk": 3, "link_document": null, "page": 24}], "seo_title": "", "owner": null, "path": "00010002", "latest_revision_created_at": "2015-04-14T20:13:53.064Z", "go_live_at": null, "related_links": [], "title": "Home page", "search_description": "", "live": true, "has_unpublished_changes": false, "pk": 24, "body": "<h2>Teste</h2><p>Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters, laying up to six speckled eggs at a time. Among their most conspicuous behaviours is a near constant tail wagging, a trait that has given the birds their common name. In spite of the ubiquity of the behaviour and observations of it, the reasons for it are poorly understood. It has been suggested that it may flush up prey, or that it may signal submissiveness to other wagtails. Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators. ;D</p>", "numchild": 5, "content_type": 30, "show_in_menus": true, "locked": false, "url_path": "/home-page/", "expired": false, "slug": "home-page", "slogan": "Conhecer a Deus e faz\\u00ea-Lo conhecido", "depth": 2, "expire_at": null}	\N	24	1
7	f	2015-04-19 18:34:29.385224+00	{"advert_placements": [], "carousel_items": [{"link_page": null, "embed_url": "", "image": 15, "link_external": "http://www.flickr.com/photos/lipkee/", "caption": "Grey wagtail by Lip Kee", "sort_order": 0, "link_document": null, "pk": 1, "page": null}, {"link_page": null, "embed_url": "", "image": 12, "link_external": "http://www.flickr.com/photos/jim_bendon_1957/", "caption": "Wagtail sproing by Jim Bendon", "sort_order": 1, "link_document": null, "pk": 2, "page": null}, {"link_page": null, "embed_url": "", "image": 11, "link_external": "http://www.flickr.com/photos/kjfnjy/", "caption": "Wagtail at Borovoye, Kazakhstan by Ken and Nyetta", "sort_order": 2, "link_document": null, "pk": 3, "page": null}], "search_description": "", "owner": null, "path": "00010002", "latest_revision_created_at": "2015-04-14T20:13:53.064Z", "go_live_at": null, "related_links": [], "title": "Home page", "seo_title": "", "slug": "home-page", "live": true, "has_unpublished_changes": false, "body": "<h2>Teste</h2><p>Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters, laying up to six speckled eggs at a time. Among their most conspicuous behaviours is a near constant tail wagging, a trait that has given the birds their common name. In spite of the ubiquity of the behaviour and observations of it, the reasons for it are poorly understood. It has been suggested that it may flush up prey, or that it may signal submissiveness to other wagtails. Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators. ;D</p>", "numchild": 5, "content_type": 30, "show_in_menus": true, "slogan": "Conhecer a Deus e faz\\u00ea-Lo conhecido", "url_path": "/home-page/", "expired": false, "pk": 2, "locked": false, "depth": 2, "expire_at": null}	\N	2	1
61	f	2015-05-01 20:17:05.986628+00	{"advert_placements": [], "search_description": "", "owner": 1, "intro": "Treinamento \\u00e9 um dos principais minist\\u00e9rios que est\\u00e1 ligado a tudo que a <b>JOCUM</b> faz. Nossos programas t\\u00eam como objetivo equipar os crist\\u00e3os para melhor servir ao pr\\u00f3ximo nas mais diversas \\u00e1reas, desde agricultura e sa\\u00fade, artes, educa\\u00e7\\u00e3o, tecnologia at\\u00e9 reabilita\\u00e7\\u00e3o de dependentes qu\\u00edmicos e minist\\u00e9rios transculturais. Cada programa de treinamento reflete o prop\\u00f3sito da <b>JOCUM: Conhecer a Deus e faz\\u00ea-lo conhecido</b>. Cada curso pode ser oferecido tanto como um programa separado ou como parte da Universidade das Na\\u00e7\\u00f5es.\\u00a0", "latest_revision_created_at": "2015-05-01T19:44:53.831Z", "go_live_at": null, "related_links": [], "title": "Treinamento", "seo_title": "", "slug": "treinamento", "live": true, "has_unpublished_changes": false, "body": "<p>Em sua maioria, os cursos da JOCUM possuem um programa intensivo de aprendizado onde os alunos se concentram em um assunto por vez e combinam o aprendizado te\\u00f3rico com aplica\\u00e7\\u00e3o pr\\u00e1tica. Cada escola pode durar de tr\\u00eas a nove meses e quase todas os programas se dividem em fase te\\u00f3rica e fase pr\\u00e1tica, sendo esta \\u00faltima opcional em alguns casos espec\\u00edficos.</p><p><br/></p><p><a href=\\"http://en.wikipedia.org/wiki/Loren_Cunningham\\">Loren Cunningham</a> definiu esse formato \\u00a0da seguinte forma:\\u00a0</p><p><i>\\u201cEm nossos cursos iremos enfatizar o relacionamento com Deus e uns com os outros. N\\u00f3s vamos usar um corpo rotativo de professores que v\\u00e3o se alternar e viver junto aos alunos numa comunidade ao estilo dos vilarejos da \\u00c1sia e do Pac\\u00edfico. A \\u00eanfase vai ser em aprender enquanto se faz.\\u201d</i>.\\u00a0</p><p><br/></p><p>Para muitos alunos da JOCUM, o aprendizado intensivo combinado com a vida em comunidade, e frequentemente transcultural, \\u00e9 uma experi\\u00eancia \\u00fanica de transforma\\u00e7\\u00e3o de vida.</p><p><br/></p>", "numchild": 2, "content_type": 55, "show_in_menus": true, "path": "0001000400020001", "url_path": "/ywam/br/treinamento/", "expired": false, "pk": 44, "locked": false, "depth": 4, "br_link": null, "header_image": 16, "expire_at": null}	\N	44	1
66	f	2015-05-02 20:43:38.673264+00	{"advert_placements": [], "cost_outreach": "2.000,00 - 5.000,00", "search_description": "", "owner": 1, "latest_revision_created_at": "2015-05-02T20:24:24.213Z", "go_live_at": null, "feed_image": 16, "cost_lecture": "3.000,00", "related_links": [], "title": "Artes ETED", "signup_link": "", "date_from": "2016-02-04", "seo_title": "", "slug": "artes-eted", "languages": "Portugu\\u00eas; Ingl\\u00eas", "live": true, "has_unpublished_changes": false, "body": "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim.\\u00a0<p><br/></p><p>Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc.</p><p><br/></p><p>Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit am.<br/></p><p><br/></p><p>Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit am.<br/></p><p></p>", "numchild": 0, "content_type": 57, "show_in_menus": false, "path": "00010004000200010001", "url_path": "/ywam/br/treinamento/artes-eted/", "expired": false, "pk": 45, "locked": false, "depth": 5, "br_link": null, "header_image": null, "expire_at": null}	\N	45	1
5	f	2015-04-14 20:13:47.529055+00	{"advert_placements": [], "carousel_items": [{"link_page": null, "embed_url": "", "image": 15, "link_external": "http://www.flickr.com/photos/lipkee/", "caption": "Grey wagtail by Lip Kee", "sort_order": 0, "link_document": null, "pk": 1, "page": null}, {"link_page": null, "embed_url": "", "image": 12, "link_external": "http://www.flickr.com/photos/jim_bendon_1957/", "caption": "Wagtail sproing by Jim Bendon", "sort_order": 1, "link_document": null, "pk": 2, "page": null}, {"link_page": null, "embed_url": "", "image": 11, "link_external": "http://www.flickr.com/photos/kjfnjy/", "caption": "Wagtail at Borovoye, Kazakhstan by Ken and Nyetta", "sort_order": 2, "link_document": null, "pk": 3, "page": null}], "search_description": "", "owner": null, "latest_revision_created_at": null, "go_live_at": null, "related_links": [], "title": "Home page", "seo_title": "", "slug": "home-page", "live": true, "has_unpublished_changes": false, "body": "<h2>Teste</h2><p>Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters, laying up to six speckled eggs at a time. Among their most conspicuous behaviours is a near constant tail wagging, a trait that has given the birds their common name. In spite of the ubiquity of the behaviour and observations of it, the reasons for it are poorly understood. It has been suggested that it may flush up prey, or that it may signal submissiveness to other wagtails. Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators. ;D</p>", "numchild": 5, "content_type": 30, "show_in_menus": true, "path": "00010002", "url_path": "/home-page/", "expired": false, "pk": 2, "locked": false, "depth": 2, "expire_at": null}	\N	2	1
8	f	2015-04-19 18:36:34.288097+00	{"advert_placements": [], "carousel_items": [{"link_page": null, "embed_url": "", "image": 15, "link_external": "http://www.flickr.com/photos/lipkee/", "caption": "Grey wagtail by Lip Kee", "sort_order": 0, "link_document": null, "pk": 1, "page": null}, {"link_page": null, "embed_url": "", "image": 12, "link_external": "http://www.flickr.com/photos/jim_bendon_1957/", "caption": "Wagtail sproing by Jim Bendon", "sort_order": 1, "link_document": null, "pk": 2, "page": null}, {"link_page": null, "embed_url": "", "image": 11, "link_external": "http://www.flickr.com/photos/kjfnjy/", "caption": "Wagtail at Borovoye, Kazakhstan by Ken and Nyetta", "sort_order": 2, "link_document": null, "pk": 3, "page": null}], "search_description": "", "owner": null, "path": "00010002", "latest_revision_created_at": "2015-04-19T18:34:29.385Z", "go_live_at": null, "related_links": [], "title": "Home page", "seo_title": "", "slug": "home-page", "live": true, "has_unpublished_changes": false, "body": "<h2>Teste</h2><p>Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters, laying up to six speckled eggs at a time. Among their most conspicuous behaviours is a near constant tail wagging, a trait that has given the birds their common name. In spite of the ubiquity of the behaviour and observations of it, the reasons for it are poorly understood. It has been suggested that it may flush up prey, or that it may signal submissiveness to other wagtails. Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators. ;D</p>", "numchild": 5, "content_type": 30, "show_in_menus": true, "slogan": "Conhecer a Deus e faz\\u00ea-Lo conhecido", "url_path": "/home-page/", "expired": false, "pk": 2, "locked": false, "depth": 2, "expire_at": null}	\N	2	1
9	f	2015-04-19 20:01:59.270467+00	{"advert_placements": [], "carousel_items": [{"link_page": null, "embed_url": "", "image": 15, "link_external": "http://www.flickr.com/photos/lipkee/", "caption": "Grey wagtail by Lip Kee", "sort_order": 0, "link_document": null, "pk": 1, "page": null}, {"link_page": null, "embed_url": "", "image": 12, "link_external": "http://www.flickr.com/photos/jim_bendon_1957/", "caption": "Wagtail sproing by Jim Bendon", "sort_order": 1, "link_document": null, "pk": 2, "page": null}, {"link_page": null, "embed_url": "", "image": 11, "link_external": "http://www.flickr.com/photos/kjfnjy/", "caption": "Wagtail at Borovoye, Kazakhstan by Ken and Nyetta", "sort_order": 2, "link_document": null, "pk": 3, "page": null}], "search_description": "", "owner": null, "path": "00010002", "latest_revision_created_at": "2015-04-19T18:36:34.288Z", "go_live_at": null, "related_links": [], "title": "Home page", "seo_title": "", "slug": "home-page", "live": true, "has_unpublished_changes": false, "body": "<h2>Teste</h2><p>Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters, laying up to six speckled eggs at a time. Among their most conspicuous behaviours is a near constant tail wagging, a trait that has given the birds their common name. In spite of the ubiquity of the behaviour and observations of it, the reasons for it are poorly understood. It has been suggested that it may flush up prey, or that it may signal submissiveness to other wagtails. Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators. ;D</p>", "numchild": 5, "content_type": 30, "show_in_menus": true, "slogan": "Conhecer a Deus. Faz\\u00ea-Lo conhecido", "url_path": "/home-page/", "expired": false, "pk": 2, "locked": false, "depth": 2, "expire_at": null}	\N	2	1
23	f	2015-04-19 20:01:59.270467+00	{"advert_placements": [], "carousel_items": [{"link_page": null, "embed_url": "", "image": 15, "link_external": "http://www.flickr.com/photos/lipkee/", "caption": "Grey wagtail by Lip Kee", "sort_order": 0, "pk": 1, "link_document": null, "page": 24}, {"link_page": null, "embed_url": "", "image": 12, "link_external": "http://www.flickr.com/photos/jim_bendon_1957/", "caption": "Wagtail sproing by Jim Bendon", "sort_order": 1, "pk": 2, "link_document": null, "page": 24}, {"link_page": null, "embed_url": "", "image": 11, "link_external": "http://www.flickr.com/photos/kjfnjy/", "caption": "Wagtail at Borovoye, Kazakhstan by Ken and Nyetta", "sort_order": 2, "pk": 3, "link_document": null, "page": 24}], "seo_title": "", "owner": null, "path": "00010002", "latest_revision_created_at": "2015-04-19T18:36:34.288Z", "go_live_at": null, "related_links": [], "title": "Home page", "search_description": "", "live": true, "has_unpublished_changes": false, "pk": 24, "body": "<h2>Teste</h2><p>Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters, laying up to six speckled eggs at a time. Among their most conspicuous behaviours is a near constant tail wagging, a trait that has given the birds their common name. In spite of the ubiquity of the behaviour and observations of it, the reasons for it are poorly understood. It has been suggested that it may flush up prey, or that it may signal submissiveness to other wagtails. Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators. ;D</p>", "numchild": 5, "content_type": 30, "show_in_menus": true, "locked": false, "url_path": "/home-page/", "expired": false, "slug": "home-page", "slogan": "Conhecer a Deus. Faz\\u00ea-Lo conhecido", "depth": 2, "expire_at": null}	\N	24	1
62	f	2015-05-01 20:35:12.830943+00	{"advert_placements": [], "cost_outreach": "2.000,00 - 5.000,00", "search_description": "", "owner": 1, "latest_revision_created_at": "2015-05-01T20:14:01.552Z", "go_live_at": null, "feed_image": 16, "related_links": [], "title": "Artes ETED", "signup_link": "", "date_from": "2016-02-04", "seo_title": "", "slug": "artes-eted", "cost_lecture": "3.000,00", "live": true, "has_unpublished_changes": false, "body": "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim.\\u00a0<p><br/></p><p>Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc.</p><p><br/></p><p><b>Baga\\u00e7a \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 Porco</b></p><p>Teste \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0Porco</p>", "numchild": 0, "content_type": 57, "show_in_menus": false, "path": "00010004000200010001", "url_path": "/ywam/br/treinamento/artes-eted/", "expired": false, "pk": 45, "locked": false, "depth": 5, "br_link": null, "header_image": null, "expire_at": null}	\N	45	1
60	f	2015-05-01 20:14:01.55207+00	{"advert_placements": [], "cost_outreach": "2.000,00 - 5.000,00", "search_description": "", "owner": 1, "latest_revision_created_at": "2015-04-24T22:37:36.380Z", "go_live_at": null, "feed_image": 16, "related_links": [], "title": "Artes ETED", "signup_link": "", "date_from": "2016-02-04", "seo_title": "", "slug": "artes-eted", "cost_lecture": "3.000,00", "live": true, "has_unpublished_changes": false, "body": "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim.\\u00a0<p><br/></p><p>Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc.</p>", "numchild": 0, "content_type": 57, "show_in_menus": false, "path": "00010004000200010001", "url_path": "/ywam/br/treinamento/artes-eted/", "expired": false, "pk": 45, "locked": false, "depth": 5, "br_link": null, "header_image": null, "expire_at": null}	\N	45	1
22	f	2015-04-19 18:36:34.288097+00	{"advert_placements": [], "carousel_items": [{"link_page": null, "embed_url": "", "image": 15, "link_external": "http://www.flickr.com/photos/lipkee/", "caption": "Grey wagtail by Lip Kee", "sort_order": 0, "pk": 1, "link_document": null, "page": 24}, {"link_page": null, "embed_url": "", "image": 12, "link_external": "http://www.flickr.com/photos/jim_bendon_1957/", "caption": "Wagtail sproing by Jim Bendon", "sort_order": 1, "pk": 2, "link_document": null, "page": 24}, {"link_page": null, "embed_url": "", "image": 11, "link_external": "http://www.flickr.com/photos/kjfnjy/", "caption": "Wagtail at Borovoye, Kazakhstan by Ken and Nyetta", "sort_order": 2, "pk": 3, "link_document": null, "page": 24}], "seo_title": "", "owner": null, "path": "00010002", "latest_revision_created_at": "2015-04-19T18:34:29.385Z", "go_live_at": null, "related_links": [], "title": "Home page", "search_description": "", "live": true, "has_unpublished_changes": false, "pk": 24, "body": "<h2>Teste</h2><p>Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters, laying up to six speckled eggs at a time. Among their most conspicuous behaviours is a near constant tail wagging, a trait that has given the birds their common name. In spite of the ubiquity of the behaviour and observations of it, the reasons for it are poorly understood. It has been suggested that it may flush up prey, or that it may signal submissiveness to other wagtails. Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators. ;D</p>", "numchild": 5, "content_type": 30, "show_in_menus": true, "locked": false, "url_path": "/home-page/", "expired": false, "slug": "home-page", "slogan": "Conhecer a Deus e faz\\u00ea-Lo conhecido", "depth": 2, "expire_at": null}	\N	24	1
24	f	2015-04-20 19:43:15.964319+00	{"advert_placements": [], "carousel_items": [{"link_page": null, "embed_url": "", "image": 15, "link_external": "http://www.flickr.com/photos/lipkee/", "caption": "Grey wagtail by Lip Kee", "sort_order": 0, "link_document": null, "pk": 1, "page": null}, {"link_page": null, "embed_url": "", "image": 12, "link_external": "http://www.flickr.com/photos/jim_bendon_1957/", "caption": "Wagtail sproing by Jim Bendon", "sort_order": 1, "link_document": null, "pk": 2, "page": null}, {"link_page": null, "embed_url": "", "image": 11, "link_external": "http://www.flickr.com/photos/kjfnjy/", "caption": "Wagtail at Borovoye, Kazakhstan by Ken and Nyetta", "sort_order": 2, "link_document": null, "pk": 3, "page": null}], "search_description": "", "owner": 1, "path": "00010003", "latest_revision_created_at": "2015-04-20T19:42:58.435Z", "go_live_at": null, "related_links": [], "title": "en", "seo_title": "", "slug": "en", "live": true, "has_unpublished_changes": false, "body": "<h2>Teste</h2><p>Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters, laying up to six speckled eggs at a time. Among their most conspicuous behaviours is a near constant tail wagging, a trait that has given the birds their common name. In spite of the ubiquity of the behaviour and observations of it, the reasons for it are poorly understood. It has been suggested that it may flush up prey, or that it may signal submissiveness to other wagtails. Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators. ;D</p>", "numchild": 0, "content_type": 30, "show_in_menus": true, "slogan": "Conhecer Deus Faz\\u00ea-Lo conhecido", "url_path": "/br/", "expired": false, "pk": 24, "locked": false, "depth": 2, "expire_at": null}	\N	24	1
25	f	2015-04-20 19:43:16.11089+00	{"advert_placements": [], "search_description": "", "owner": 1, "intro": "<p>Three species are poly- or paraphyletic in the present taxonomical arrangement and either subspecies need to be reassigned and/or species split up. The Blue-headed Wagtail (AKA Yellow Wagtail and many other names), especially, has always been a taxonomical nightmare with over a dozen currently accepted subspecies and many more invalid ones. The two remaining \\"monochrome\\" species, Mekong and African Pied Wagtail may be closely related, or a most striking example of convergent evolution.</p>", "latest_revision_created_at": null, "go_live_at": null, "related_links": [], "title": "Events index", "seo_title": "", "slug": "events-index", "live": true, "has_unpublished_changes": false, "numchild": 0, "content_type": 46, "show_in_menus": true, "path": "000100030001", "url_path": "/en/events-index/", "expired": false, "pk": 25, "locked": false, "depth": 3, "expire_at": null}	\N	25	1
45	f	2015-04-20 20:53:38.403948+00	{"advert_placements": [], "search_description": "", "owner": 1, "intro": "<p>Three species are poly- or paraphyletic in the present taxonomical arrangement and either subspecies need to be reassigned and/or species split up. The Blue-headed Wagtail (AKA Yellow Wagtail and many other names), especially, has always been a taxonomical nightmare with over a dozen currently accepted subspecies and many more invalid ones. The two remaining \\"monochrome\\" species, Mekong and African Pied Wagtail may be closely related, or a most striking example of convergent evolution.</p>", "latest_revision_created_at": "2015-04-20T19:43:16.110Z", "go_live_at": null, "related_links": [], "title": "Events index", "seo_title": "", "slug": "events-index", "live": true, "has_unpublished_changes": false, "numchild": 2, "content_type": 46, "show_in_menus": true, "path": "0001000400010001", "url_path": "/ywam/en/events-index/", "expired": false, "pk": 25, "locked": false, "depth": 4, "br_link": 4, "expire_at": null}	\N	25	1
14	f	2015-03-25 16:27:11.267532+00	{"advert_placements": [], "carousel_items": [{"link_page": null, "embed_url": "", "image": 15, "link_external": "http://www.flickr.com/photos/lipkee/", "caption": "Grey wagtail by Lip Kee", "sort_order": 0, "pk": 1, "link_document": null, "page": 24}, {"link_page": null, "embed_url": "", "image": 12, "link_external": "http://www.flickr.com/photos/jim_bendon_1957/", "caption": "Wagtail sproing by Jim Bendon", "sort_order": 1, "pk": 2, "link_document": null, "page": 24}, {"link_page": null, "embed_url": "", "image": 11, "link_external": "http://www.flickr.com/photos/kjfnjy/", "caption": "Wagtail at Borovoye, Kazakhstan by Ken and Nyetta", "sort_order": 2, "pk": 3, "link_document": null, "page": 24}], "seo_title": "", "owner": null, "latest_revision_created_at": "2015-03-25T16:26:58.880Z", "go_live_at": null, "related_links": [], "title": "Home page", "search_description": "", "live": true, "has_unpublished_changes": true, "pk": 24, "body": "<h2>Teste</h2><p>Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters, laying up to six speckled eggs at a time. Among their most conspicuous behaviours is a near constant tail wagging, a trait that has given the birds their common name. In spite of the ubiquity of the behaviour and observations of it, the reasons for it are poorly understood. It has been suggested that it may flush up prey, or that it may signal submissiveness to other wagtails. Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators.</p>", "numchild": 5, "content_type": 30, "show_in_menus": true, "path": "00010002", "url_path": "/home-page/", "expired": false, "slug": "home-page", "locked": false, "depth": 2, "expire_at": null}	\N	24	1
63	f	2015-05-01 20:35:50.813226+00	{"advert_placements": [], "cost_outreach": "2.000,00 - 5.000,00", "search_description": "", "owner": 1, "latest_revision_created_at": "2015-05-01T20:35:12.830Z", "go_live_at": null, "feed_image": 16, "related_links": [], "title": "Artes ETED", "signup_link": "", "date_from": "2016-02-04", "seo_title": "", "slug": "artes-eted", "cost_lecture": "3.000,00", "live": true, "has_unpublished_changes": false, "body": "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim.\\u00a0<p><br/></p><p>Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc.</p>", "numchild": 0, "content_type": 57, "show_in_menus": false, "path": "00010004000200010001", "url_path": "/ywam/br/treinamento/artes-eted/", "expired": false, "pk": 45, "locked": false, "depth": 5, "br_link": null, "header_image": null, "expire_at": null}	\N	45	1
70	f	2015-05-04 19:59:32.95799+00	{"advert_placements": [], "carousel_items": [], "search_description": "The remaining five species are highly variable morphologically and their relationships with each other and with the two clades have not yet been satisfactorily explained.", "owner": null, "intro": "<p>The remaining five species are highly variable morphologically and their relationships with each other and with the two clades have not yet been satisfactorily explained.</p>", "latest_revision_created_at": null, "go_live_at": null, "feed_image": 10, "related_links": [], "title": "Standard page 2", "seo_title": "", "slug": "standard-page-2", "live": true, "has_unpublished_changes": false, "body": "<h4>Wagtails are great</h4><p>At first glance, the wagtails appear to be divided into a yellow-bellied group and a white-bellied one, or one where the upper head is black and another where it is usually gray, but may be olive, yellow, or other colours. However, these are not evolutionary lineages; change of belly colour and increase of melanin have occurred independently several times in the wagtails, and the colour patterns which actually indicate relationships are more subtle.</p><p><embed alt=\\"Wagtail Sproing by Jim Bendon\\" embedtype=\\"image\\" format=\\"left\\" id=\\"12\\"/><br/></p><h4>Wagtails are pretty</h4><p>mtDNA cytochrome b and NADH dehydrogenase subunit 2 sequence data (Voelker, 2002) is of limited use: the suspicion that there is a superspecies of probably 3 white-bellied, black-throated wagtails is confirmed. Also, there is another superspecies in sub-Saharan Africa, three white-throated species with a black breast-band. The remaining five species are highly variable morphologically and their relationships with each other and with the two clades have not yet been satisfactorily explained.<br/></p><p><embed alt=\\"Pied wagtail by Marie Hale\\" embedtype=\\"image\\" format=\\"right\\" id=\\"10\\"/><br/></p><p>The origin of the genus appears to be in the general area of Eastern Siberia/Mongolia. Wagtails spread rapidly across Eurasia and dispersed to Africa in the Zanclean (Early Pliocene) where the sub-Saharan lineage was later isolated. The African Pied Wagtail (and possibly the Mekong Wagtail) diverged prior to the massive radiation of the white-bellied black-throated and most yellow-bellied forms, all of which took place during the late Piacenzian (early Late Pliocene), c. 3 mya.<br/></p><p>Three species are poly- or paraphyletic in the present taxonomical arrangement and either subspecies need to be reassigned and/or species split up. The Blue-headed Wagtail (AKA Yellow Wagtail and many other names), especially, has always been a taxonomical nightmare with over a dozen currently accepted subspecies and many more invalid ones. The two remaining \\"monochrome\\" species, Mekong and African Pied Wagtail may be closely related, or a most striking example of convergent evolution.<br/></p>", "numchild": 0, "content_type": 35, "show_in_menus": false, "path": "00010004000200040002", "url_path": "/ywam/br/standards/standard-page-2/", "expired": false, "pk": 15, "locked": false, "depth": 5, "br_link": null, "expire_at": null}	\N	15	1
46	f	2015-04-22 20:04:51.718023+00	{"advert_placements": [], "carousel_items": [{"link_page": null, "embed_url": "", "image": 15, "link_external": "http://www.flickr.com/photos/lipkee/", "caption": "Grey wagtail by Lip Kee", "sort_order": 0, "link_document": null, "pk": 1, "page": null}, {"link_page": null, "embed_url": "", "image": 12, "link_external": "http://www.flickr.com/photos/jim_bendon_1957/", "caption": "Wagtail sproing by Jim Bendon", "sort_order": 1, "link_document": null, "pk": 2, "page": null}, {"link_page": null, "embed_url": "", "image": 11, "link_external": "http://www.flickr.com/photos/kjfnjy/", "caption": "Wagtail at Borovoye, Kazakhstan by Ken and Nyetta", "sort_order": 2, "link_document": null, "pk": 3, "page": null}], "search_description": "", "owner": 1, "path": "000100040001", "latest_revision_created_at": "2015-04-20T19:44:17.198Z", "go_live_at": null, "related_links": [], "title": "en", "seo_title": "", "slug": "en", "live": true, "has_unpublished_changes": false, "body": "<h2>Teste</h2><p>Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters, laying up to six speckled eggs at a time. Among their most conspicuous behaviours is a near constant tail wagging, a trait that has given the birds their common name. In spite of the ubiquity of the behaviour and observations of it, the reasons for it are poorly understood. It has been suggested that it may flush up prey, or that it may signal submissiveness to other wagtails. Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators. ;D</p>", "numchild": 5, "content_type": 30, "show_in_menus": false, "slogan": "Know Him Make Him Known", "url_path": "/ywam/en/", "expired": false, "pk": 24, "locked": false, "depth": 3, "br_link": null, "expire_at": null}	\N	24	1
15	f	2015-03-25 16:27:20.136813+00	{"advert_placements": [], "carousel_items": [{"link_page": null, "embed_url": "", "image": 15, "link_external": "http://www.flickr.com/photos/lipkee/", "caption": "Grey wagtail by Lip Kee", "sort_order": 0, "pk": 1, "link_document": null, "page": 24}, {"link_page": null, "embed_url": "", "image": 12, "link_external": "http://www.flickr.com/photos/jim_bendon_1957/", "caption": "Wagtail sproing by Jim Bendon", "sort_order": 1, "pk": 2, "link_document": null, "page": 24}, {"link_page": null, "embed_url": "", "image": 11, "link_external": "http://www.flickr.com/photos/kjfnjy/", "caption": "Wagtail at Borovoye, Kazakhstan by Ken and Nyetta", "sort_order": 2, "pk": 3, "link_document": null, "page": 24}], "seo_title": "", "owner": null, "latest_revision_created_at": "2015-03-25T16:27:11.267Z", "go_live_at": null, "related_links": [], "title": "Home page", "search_description": "", "live": true, "has_unpublished_changes": true, "pk": 24, "body": "<h2>Teste</h2><p>Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters, laying up to six speckled eggs at a time. Among their most conspicuous behaviours is a near constant tail wagging, a trait that has given the birds their common name. In spite of the ubiquity of the behaviour and observations of it, the reasons for it are poorly understood. It has been suggested that it may flush up prey, or that it may signal submissiveness to other wagtails. Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators.</p>", "numchild": 5, "content_type": 30, "show_in_menus": true, "path": "00010002", "url_path": "/home-page/", "expired": false, "slug": "home-page", "locked": false, "depth": 2, "expire_at": null}	\N	24	1
68	f	2015-05-03 19:16:48.281449+00	{"to_address": "essnato@gmail.com", "from_address": "", "search_description": "", "owner": 1, "intro": "Deseja entrar em contato?", "latest_revision_created_at": null, "advert_placements": [], "subject": "", "title": "Contato Teste", "seo_title": "", "slug": "contato-teste", "live": true, "has_unpublished_changes": false, "go_live_at": null, "numchild": 0, "content_type": 52, "show_in_menus": false, "thank_you_text": "Muito obrigado!", "path": "00010004000200060001", "url_path": "/ywam/br/contact/contato-teste/", "expired": false, "pk": 47, "locked": false, "form_fields": [{"default_value": "", "field_type": "singleline", "required": true, "choices": "", "sort_order": 0, "help_text": "", "pk": 2, "label": "Nome", "page": 47}, {"default_value": "", "field_type": "multiline", "required": true, "choices": "", "sort_order": 1, "help_text": "", "pk": 3, "label": "Mensagem", "page": 47}], "depth": 5, "expire_at": null}	\N	47	1
16	f	2015-04-19 20:02:28.8572+00	{"advert_placements": [], "carousel_items": [{"link_page": null, "embed_url": "", "image": 15, "link_external": "http://www.flickr.com/photos/lipkee/", "caption": "Grey wagtail by Lip Kee", "sort_order": 0, "pk": 1, "link_document": null, "page": 24}, {"link_page": null, "embed_url": "", "image": 12, "link_external": "http://www.flickr.com/photos/jim_bendon_1957/", "caption": "Wagtail sproing by Jim Bendon", "sort_order": 1, "pk": 2, "link_document": null, "page": 24}, {"link_page": null, "embed_url": "", "image": 11, "link_external": "http://www.flickr.com/photos/kjfnjy/", "caption": "Wagtail at Borovoye, Kazakhstan by Ken and Nyetta", "sort_order": 2, "pk": 3, "link_document": null, "page": 24}], "seo_title": "", "owner": null, "path": "00010002", "latest_revision_created_at": "2015-04-19T20:01:59.270Z", "go_live_at": null, "related_links": [], "title": "Home page", "search_description": "", "live": true, "has_unpublished_changes": false, "pk": 24, "body": "<h2>Teste</h2><p>Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters, laying up to six speckled eggs at a time. Among their most conspicuous behaviours is a near constant tail wagging, a trait that has given the birds their common name. In spite of the ubiquity of the behaviour and observations of it, the reasons for it are poorly understood. It has been suggested that it may flush up prey, or that it may signal submissiveness to other wagtails. Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators. ;D</p>", "numchild": 5, "content_type": 30, "show_in_menus": true, "locked": false, "url_path": "/home-page/", "expired": false, "slug": "home-page", "slogan": "Conhecer Deus. Faz\\u00ea-Lo conhecido", "depth": 2, "expire_at": null}	\N	24	1
17	f	2015-04-19 20:05:58.420797+00	{"advert_placements": [], "carousel_items": [{"link_page": null, "embed_url": "", "image": 15, "link_external": "http://www.flickr.com/photos/lipkee/", "caption": "Grey wagtail by Lip Kee", "sort_order": 0, "pk": 1, "link_document": null, "page": 24}, {"link_page": null, "embed_url": "", "image": 12, "link_external": "http://www.flickr.com/photos/jim_bendon_1957/", "caption": "Wagtail sproing by Jim Bendon", "sort_order": 1, "pk": 2, "link_document": null, "page": 24}, {"link_page": null, "embed_url": "", "image": 11, "link_external": "http://www.flickr.com/photos/kjfnjy/", "caption": "Wagtail at Borovoye, Kazakhstan by Ken and Nyetta", "sort_order": 2, "pk": 3, "link_document": null, "page": 24}], "seo_title": "", "owner": null, "path": "00010002", "latest_revision_created_at": "2015-04-19T20:02:28.857Z", "go_live_at": null, "related_links": [], "title": "Home page", "search_description": "", "live": true, "has_unpublished_changes": false, "pk": 24, "body": "<h2>Teste</h2><p>Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters, laying up to six speckled eggs at a time. Among their most conspicuous behaviours is a near constant tail wagging, a trait that has given the birds their common name. In spite of the ubiquity of the behaviour and observations of it, the reasons for it are poorly understood. It has been suggested that it may flush up prey, or that it may signal submissiveness to other wagtails. Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators. ;D</p>", "numchild": 5, "content_type": 30, "show_in_menus": true, "locked": false, "url_path": "/home-page/", "expired": false, "slug": "home-page", "slogan": "Conhecer Deus Faz\\u00ea-Lo conhecido", "depth": 2, "expire_at": null}	\N	24	1
18	f	2015-03-25 16:26:58.880369+00	{"advert_placements": [], "carousel_items": [{"link_page": null, "embed_url": "", "image": 15, "link_external": "http://www.flickr.com/photos/lipkee/", "caption": "Grey wagtail by Lip Kee", "sort_order": 0, "pk": 1, "link_document": null, "page": 24}, {"link_page": null, "embed_url": "", "image": 12, "link_external": "http://www.flickr.com/photos/jim_bendon_1957/", "caption": "Wagtail sproing by Jim Bendon", "sort_order": 1, "pk": 2, "link_document": null, "page": 24}, {"link_page": null, "embed_url": "", "image": 11, "link_external": "http://www.flickr.com/photos/kjfnjy/", "caption": "Wagtail at Borovoye, Kazakhstan by Ken and Nyetta", "sort_order": 2, "pk": 3, "link_document": null, "page": 24}], "seo_title": "", "owner": null, "latest_revision_created_at": null, "go_live_at": null, "related_links": [], "title": "Home page", "search_description": "", "live": true, "has_unpublished_changes": false, "pk": 24, "body": "<h2>Teste</h2><p>Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters, laying up to six speckled eggs at a time. Among their most conspicuous behaviours is a near constant tail wagging, a trait that has given the birds their common name. In spite of the ubiquity of the behaviour and observations of it, the reasons for it are poorly understood. It has been suggested that it may flush up prey, or that it may signal submissiveness to other wagtails. Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators.</p>", "numchild": 5, "content_type": 30, "show_in_menus": true, "path": "00010002", "url_path": "/home-page/", "expired": false, "slug": "home-page", "locked": false, "depth": 2, "expire_at": null}	\N	24	1
19	f	2015-04-14 20:13:53.064398+00	{"advert_placements": [], "carousel_items": [{"link_page": null, "embed_url": "", "image": 15, "link_external": "http://www.flickr.com/photos/lipkee/", "caption": "Grey wagtail by Lip Kee", "sort_order": 0, "pk": 1, "link_document": null, "page": 24}, {"link_page": null, "embed_url": "", "image": 12, "link_external": "http://www.flickr.com/photos/jim_bendon_1957/", "caption": "Wagtail sproing by Jim Bendon", "sort_order": 1, "pk": 2, "link_document": null, "page": 24}, {"link_page": null, "embed_url": "", "image": 11, "link_external": "http://www.flickr.com/photos/kjfnjy/", "caption": "Wagtail at Borovoye, Kazakhstan by Ken and Nyetta", "sort_order": 2, "pk": 3, "link_document": null, "page": 24}], "seo_title": "", "owner": null, "latest_revision_created_at": "2015-04-14T20:13:47.529Z", "go_live_at": null, "related_links": [], "title": "Home page", "search_description": "", "live": true, "has_unpublished_changes": true, "pk": 24, "body": "<h2>Teste</h2><p>Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters, laying up to six speckled eggs at a time. Among their most conspicuous behaviours is a near constant tail wagging, a trait that has given the birds their common name. In spite of the ubiquity of the behaviour and observations of it, the reasons for it are poorly understood. It has been suggested that it may flush up prey, or that it may signal submissiveness to other wagtails. Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators. ;D</p>", "numchild": 5, "content_type": 30, "show_in_menus": true, "path": "00010002", "url_path": "/home-page/", "expired": false, "slug": "home-page", "locked": false, "depth": 2, "expire_at": null}	\N	24	1
21	f	2015-04-14 20:13:47.529055+00	{"advert_placements": [], "carousel_items": [{"link_page": null, "embed_url": "", "image": 15, "link_external": "http://www.flickr.com/photos/lipkee/", "caption": "Grey wagtail by Lip Kee", "sort_order": 0, "pk": 1, "link_document": null, "page": 24}, {"link_page": null, "embed_url": "", "image": 12, "link_external": "http://www.flickr.com/photos/jim_bendon_1957/", "caption": "Wagtail sproing by Jim Bendon", "sort_order": 1, "pk": 2, "link_document": null, "page": 24}, {"link_page": null, "embed_url": "", "image": 11, "link_external": "http://www.flickr.com/photos/kjfnjy/", "caption": "Wagtail at Borovoye, Kazakhstan by Ken and Nyetta", "sort_order": 2, "pk": 3, "link_document": null, "page": 24}], "seo_title": "", "owner": null, "latest_revision_created_at": null, "go_live_at": null, "related_links": [], "title": "Home page", "search_description": "", "live": true, "has_unpublished_changes": false, "pk": 24, "body": "<h2>Teste</h2><p>Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters, laying up to six speckled eggs at a time. Among their most conspicuous behaviours is a near constant tail wagging, a trait that has given the birds their common name. In spite of the ubiquity of the behaviour and observations of it, the reasons for it are poorly understood. It has been suggested that it may flush up prey, or that it may signal submissiveness to other wagtails. Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators. ;D</p>", "numchild": 5, "content_type": 30, "show_in_menus": true, "path": "00010002", "url_path": "/home-page/", "expired": false, "slug": "home-page", "locked": false, "depth": 2, "expire_at": null}	\N	24	1
11	f	2015-04-19 20:05:58.420797+00	{"advert_placements": [], "carousel_items": [{"link_page": null, "embed_url": "", "image": 15, "link_external": "http://www.flickr.com/photos/lipkee/", "caption": "Grey wagtail by Lip Kee", "sort_order": 0, "link_document": null, "pk": 1, "page": null}, {"link_page": null, "embed_url": "", "image": 12, "link_external": "http://www.flickr.com/photos/jim_bendon_1957/", "caption": "Wagtail sproing by Jim Bendon", "sort_order": 1, "link_document": null, "pk": 2, "page": null}, {"link_page": null, "embed_url": "", "image": 11, "link_external": "http://www.flickr.com/photos/kjfnjy/", "caption": "Wagtail at Borovoye, Kazakhstan by Ken and Nyetta", "sort_order": 2, "link_document": null, "pk": 3, "page": null}], "search_description": "", "owner": null, "path": "00010002", "latest_revision_created_at": "2015-04-19T20:02:28.857Z", "go_live_at": null, "related_links": [], "title": "Home page", "seo_title": "", "slug": "home-page", "live": true, "has_unpublished_changes": false, "body": "<h2>Teste</h2><p>Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters, laying up to six speckled eggs at a time. Among their most conspicuous behaviours is a near constant tail wagging, a trait that has given the birds their common name. In spite of the ubiquity of the behaviour and observations of it, the reasons for it are poorly understood. It has been suggested that it may flush up prey, or that it may signal submissiveness to other wagtails. Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators. ;D</p>", "numchild": 5, "content_type": 30, "show_in_menus": true, "slogan": "Conhecer Deus Faz\\u00ea-Lo conhecido", "url_path": "/home-page/", "expired": false, "pk": 2, "locked": false, "depth": 2, "expire_at": null}	\N	2	1
50	f	2015-04-24 14:51:19.915393+00	{"advert_placements": [], "search_description": "", "owner": null, "intro": "<p>Three species are poly- or paraphyletic in the present taxonomical arrangement and either subspecies need to be reassigned and/or species split up. The Blue-headed Wagtail (AKA Yellow Wagtail and many other names), especially, has always been a taxonomical nightmare with over a dozen currently accepted subspecies and many more invalid ones. The two remaining \\"monochrome\\" species, Mekong and African Pied Wagtail may be closely related, or a most striking example of convergent evolution.</p>", "latest_revision_created_at": null, "go_live_at": null, "related_links": [{"link_page": 4, "title": "Events index", "link_external": "", "sort_order": 0, "link_document": null, "pk": 1, "page": 5}], "title": "Blog", "seo_title": "", "slug": "blog", "live": true, "has_unpublished_changes": false, "numchild": 3, "content_type": 37, "show_in_menus": true, "path": "0001000400020002", "url_path": "/ywam/br/blog-index/", "expired": false, "pk": 5, "locked": false, "depth": 4, "br_link": null, "expire_at": null}	\N	5	1
1	f	2015-03-25 16:26:58.880369+00	{"advert_placements": [], "carousel_items": [{"link_page": null, "embed_url": "", "image": 15, "link_external": "http://www.flickr.com/photos/lipkee/", "caption": "Grey wagtail by Lip Kee", "sort_order": 0, "link_document": null, "pk": 1, "page": 2}, {"link_page": null, "embed_url": "", "image": 12, "link_external": "http://www.flickr.com/photos/jim_bendon_1957/", "caption": "Wagtail sproing by Jim Bendon", "sort_order": 1, "link_document": null, "pk": 2, "page": 2}, {"link_page": null, "embed_url": "", "image": 11, "link_external": "http://www.flickr.com/photos/kjfnjy/", "caption": "Wagtail at Borovoye, Kazakhstan by Ken and Nyetta", "sort_order": 2, "link_document": null, "pk": 3, "page": 2}], "search_description": "", "owner": null, "latest_revision_created_at": null, "go_live_at": null, "related_links": [], "title": "Home page", "seo_title": "", "slug": "home-page", "live": true, "has_unpublished_changes": false, "body": "<h2>Teste</h2><p>Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters, laying up to six speckled eggs at a time. Among their most conspicuous behaviours is a near constant tail wagging, a trait that has given the birds their common name. In spite of the ubiquity of the behaviour and observations of it, the reasons for it are poorly understood. It has been suggested that it may flush up prey, or that it may signal submissiveness to other wagtails. Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators.</p>", "numchild": 5, "content_type": 30, "show_in_menus": true, "path": "00010002", "url_path": "/home-page/", "expired": false, "pk": 2, "locked": false, "depth": 2, "expire_at": null}	\N	2	1
6	f	2015-04-14 20:13:53.064398+00	{"advert_placements": [], "carousel_items": [{"link_page": null, "embed_url": "", "image": 15, "link_external": "http://www.flickr.com/photos/lipkee/", "caption": "Grey wagtail by Lip Kee", "sort_order": 0, "link_document": null, "pk": 1, "page": null}, {"link_page": null, "embed_url": "", "image": 12, "link_external": "http://www.flickr.com/photos/jim_bendon_1957/", "caption": "Wagtail sproing by Jim Bendon", "sort_order": 1, "link_document": null, "pk": 2, "page": null}, {"link_page": null, "embed_url": "", "image": 11, "link_external": "http://www.flickr.com/photos/kjfnjy/", "caption": "Wagtail at Borovoye, Kazakhstan by Ken and Nyetta", "sort_order": 2, "link_document": null, "pk": 3, "page": null}], "search_description": "", "owner": null, "latest_revision_created_at": "2015-04-14T20:13:47.529Z", "go_live_at": null, "related_links": [], "title": "Home page", "seo_title": "", "slug": "home-page", "live": true, "has_unpublished_changes": true, "body": "<h2>Teste</h2><p>Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters, laying up to six speckled eggs at a time. Among their most conspicuous behaviours is a near constant tail wagging, a trait that has given the birds their common name. In spite of the ubiquity of the behaviour and observations of it, the reasons for it are poorly understood. It has been suggested that it may flush up prey, or that it may signal submissiveness to other wagtails. Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators. ;D</p>", "numchild": 5, "content_type": 30, "show_in_menus": true, "path": "00010002", "url_path": "/home-page/", "expired": false, "pk": 2, "locked": false, "depth": 2, "expire_at": null}	\N	2	1
67	f	2015-05-03 14:53:50.294011+00	{"advert_placements": [], "search_description": "", "owner": null, "intro": "<p>Three species are poly- or paraphyletic in the present taxonomical arrangement and either subspecies need to be reassigned and/or species split up. The Blue-headed Wagtail (AKA Yellow Wagtail and many other names), especially, has always been a taxonomical nightmare with over a dozen currently accepted subspecies and many more invalid ones. The two remaining \\"monochrome\\" species, Mekong and African Pied Wagtail may be closely related, or a most striking example of convergent evolution.</p>", "latest_revision_created_at": "2015-04-24T14:51:19.915Z", "go_live_at": null, "related_links": [{"link_page": 4, "title": "Events index", "link_external": "", "sort_order": 0, "link_document": null, "pk": 1, "page": null}], "title": "Revista", "seo_title": "", "slug": "revista", "live": true, "has_unpublished_changes": false, "numchild": 3, "content_type": 37, "show_in_menus": true, "path": "0001000400020003", "url_path": "/ywam/br/blog/", "expired": false, "pk": 5, "locked": false, "depth": 4, "br_link": null, "expire_at": null}	\N	5	1
69	f	2015-05-04 19:51:26.712076+00	{"advert_placements": [], "search_description": "", "owner": null, "intro": "<p>Three species are poly- or paraphyletic in the present taxonomical arrangement and either subspecies need to be reassigned and/or species split up. The Blue-headed Wagtail (AKA Yellow Wagtail and many other names), especially, has always been a taxonomical nightmare with over a dozen currently accepted subspecies and many more invalid ones. The two remaining \\"monochrome\\" species, Mekong and African Pied Wagtail may be closely related, or a most striking example of convergent evolution.</p>", "latest_revision_created_at": "2015-05-03T14:53:50.294Z", "go_live_at": null, "related_links": [{"link_page": 44, "title": "Treinamento", "link_external": "", "sort_order": 0, "link_document": null, "pk": 1, "page": null}], "title": "Revista", "seo_title": "", "slug": "revista", "live": true, "has_unpublished_changes": false, "numchild": 3, "content_type": 37, "show_in_menus": true, "path": "0001000400020003", "url_path": "/ywam/br/revista/", "expired": false, "pk": 5, "locked": false, "depth": 4, "br_link": null, "expire_at": null}	\N	5	1
47	f	2015-04-22 20:05:07.834454+00	{"advert_placements": [], "carousel_items": [{"link_page": null, "embed_url": "", "image": 15, "link_external": "http://www.flickr.com/photos/lipkee/", "caption": "Grey wagtail by Lip Kee", "sort_order": 0, "link_document": null, "pk": 1, "page": null}, {"link_page": null, "embed_url": "", "image": 12, "link_external": "http://www.flickr.com/photos/jim_bendon_1957/", "caption": "Wagtail sproing by Jim Bendon", "sort_order": 1, "link_document": null, "pk": 2, "page": null}, {"link_page": null, "embed_url": "", "image": 11, "link_external": "http://www.flickr.com/photos/kjfnjy/", "caption": "Wagtail at Borovoye, Kazakhstan by Ken and Nyetta", "sort_order": 2, "link_document": null, "pk": 3, "page": null}], "search_description": "", "owner": null, "path": "000100040002", "latest_revision_created_at": "2015-04-20T19:42:58.435Z", "go_live_at": null, "related_links": [], "title": "br", "seo_title": "", "slug": "br", "live": true, "has_unpublished_changes": false, "body": "<h2>Teste</h2><p>Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters, laying up to six speckled eggs at a time. Among their most conspicuous behaviours is a near constant tail wagging, a trait that has given the birds their common name. In spite of the ubiquity of the behaviour and observations of it, the reasons for it are poorly understood. It has been suggested that it may flush up prey, or that it may signal submissiveness to other wagtails. Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators. ;D</p>", "numchild": 5, "content_type": 30, "show_in_menus": false, "slogan": "Conhecer Deus Faz\\u00ea-Lo conhecido", "url_path": "/ywam/br/", "expired": false, "pk": 2, "locked": false, "depth": 3, "br_link": null, "expire_at": null}	\N	2	1
71	f	2015-05-04 20:16:57.57633+00	{"to_address": "", "from_address": "", "search_description": "", "owner": 1, "intro": "<ul><li>Envie email p/ se inscrever</li><li>Envie email p/ saber mais</li><li>bla bla</li></ul>", "latest_revision_created_at": null, "advert_placements": [], "subject": "", "title": "Quer saber mais sobre o curso?", "seo_title": "", "slug": "quer-saber-mais-sobre-o-curso", "live": true, "has_unpublished_changes": false, "go_live_at": null, "numchild": 0, "content_type": 52, "show_in_menus": false, "thank_you_text": "Obrigado!", "path": "000100040002000100010001", "url_path": "/ywam/br/treinamento/artes-eted/quer-saber-mais-sobre-o-curso/", "expired": false, "pk": 48, "locked": false, "form_fields": [{"default_value": "", "field_type": "singleline", "required": true, "choices": "", "sort_order": 0, "help_text": "", "pk": 4, "label": "Nome:", "page": 48}, {"default_value": "", "field_type": "email", "required": true, "choices": "", "sort_order": 1, "help_text": "", "pk": 5, "label": "Email", "page": 48}, {"default_value": "", "field_type": "multiline", "required": true, "choices": "", "sort_order": 2, "help_text": "", "pk": 6, "label": "Mensagem", "page": 48}], "depth": 6, "expire_at": null}	\N	48	1
64	f	2015-05-02 19:51:53.477869+00	{"advert_placements": [], "cost_outreach": "2.000,00 - 5.000,00", "search_description": "", "owner": 1, "latest_revision_created_at": "2015-05-01T20:35:50.813Z", "go_live_at": null, "feed_image": 16, "related_links": [], "title": "Artes ETED", "signup_link": "", "date_from": "2016-02-04", "seo_title": "", "slug": "artes-eted", "cost_lecture": "3.000,00", "live": true, "has_unpublished_changes": false, "body": "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim.\\u00a0<p><br/></p><p>Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc.</p><p></p>", "numchild": 0, "content_type": 57, "show_in_menus": false, "path": "00010004000200010001", "url_path": "/ywam/br/treinamento/artes-eted/", "expired": false, "pk": 45, "locked": false, "depth": 5, "br_link": null, "header_image": null, "expire_at": null}	\N	45	1
78	f	2015-05-05 14:27:18.11281+00	{"last_name": "Joyce", "advert_placements": [], "image": 5, "telephone": "012345 123456", "search_description": "The origin of the genus appears to be in the general area of Eastern Siberia/Mongolia. Wagtails spread rapidly across Eurasia and dispersed to Africa", "owner": null, "intro": "<p>The origin of the genus appears to be in the general area of Eastern Siberia/Mongolia. Wagtails spread rapidly across Eurasia and dispersed to Africa in the Zanclean</p>", "latest_revision_created_at": null, "biography": "<p>Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters, laying up to six speckled eggs at a time. Among their most conspicuous behaviours is a near constant tail wagging, a trait that has given the birds their common name. In spite of the ubiquity of the behaviour and observations of it, the reasons for it are poorly understood. It has been suggested that it may flush up prey, or that it may signal submissiveness to other wagtails. Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators.</p><p><br/></p><p>At first glance, the wagtails appear to be divided into a yellow-bellied group and a white-bellied one, or one where the upper head is black and another where it is usually gray, but may be olive, yellow, or other colours. However, these are not evolutionary lineages; change of belly colour and increase of melanin have occurred independently several times in the wagtails, and the colour patterns which actually indicate relationships are more subtle.<br/></p>", "go_live_at": null, "feed_image": 5, "city": "Birdland", "first_name": "James", "title": "James Joyce", "seo_title": "", "slug": "james-joyce", "live": true, "has_unpublished_changes": false, "email": "foo@example.com", "post_code": "W1A 1AA", "numchild": 0, "related_links": [], "content_type": 43, "show_in_menus": false, "path": "00010004000200060001", "url_path": "/ywam/br/nosso-time/james-joyce/", "expired": false, "pk": 13, "locked": false, "country": "Birdshire", "depth": 5, "address_1": "21 Tweety Mansions", "address_2": "3 Bird Lane", "br_link": null, "expire_at": null}	\N	13	1
79	f	2015-05-05 14:27:38.922738+00	{"last_name": "Mitchell", "advert_placements": [], "image": 6, "telephone": "", "search_description": "Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators.", "owner": null, "intro": "<p>Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World.</p>", "latest_revision_created_at": null, "biography": "<p>Wagtails are slender, often colourful, ground-feeding insectivores of open country in the Old World. They are ground nesters, laying up to six speckled eggs at a time. Among their most conspicuous behaviours is a near constant tail wagging, a trait that has given the birds their common name. In spite of the ubiquity of the behaviour and observations of it, the reasons for it are poorly understood. It has been suggested that it may flush up prey, or that it may signal submissiveness to other wagtails. Recent studies have suggested instead that it is a signal of vigilance that may aid to deter potential predators.</p>", "go_live_at": null, "feed_image": 6, "city": "", "first_name": "David", "title": "David Mitchell", "seo_title": "", "slug": "david-mitchell", "live": true, "has_unpublished_changes": false, "email": "foo@example.com", "post_code": "W1A 1AA", "numchild": 0, "related_links": [], "content_type": 43, "show_in_menus": false, "path": "00010004000200060002", "url_path": "/ywam/br/nosso-time/david-mitchell/", "expired": false, "pk": 14, "locked": false, "country": "", "depth": 5, "address_1": "", "address_2": "", "br_link": null, "expire_at": null}	\N	14	1
\.


--
-- Name: wagtailcore_pagerevision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailcore_pagerevision_id_seq', 80, true);


--
-- Data for Name: wagtailcore_pageviewrestriction; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailcore_pageviewrestriction (id, password, page_id) FROM stdin;
\.


--
-- Name: wagtailcore_pageviewrestriction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailcore_pageviewrestriction_id_seq', 1, false);


--
-- Data for Name: wagtailcore_site; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailcore_site (id, hostname, port, is_default_site, root_page_id) FROM stdin;
1	localhost	80	t	43
\.


--
-- Name: wagtailcore_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailcore_site_id_seq', 1, true);


--
-- Data for Name: wagtaildocs_document; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtaildocs_document (id, title, file, created_at, uploaded_by_user_id) FROM stdin;
\.


--
-- Name: wagtaildocs_document_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtaildocs_document_id_seq', 1, false);


--
-- Data for Name: wagtailembeds_embed; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailembeds_embed (id, url, max_width, type, html, title, author_name, provider_name, thumbnail_url, width, height, last_updated) FROM stdin;
\.


--
-- Name: wagtailembeds_embed_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailembeds_embed_id_seq', 1, false);


--
-- Data for Name: wagtailforms_formsubmission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailforms_formsubmission (id, form_data, submit_time, page_id) FROM stdin;
2	{"mensagem": "teste", "nome": "teste"}	2015-05-03 19:34:49.690626+00	47
3	{"mensagem": "aaa", "nome": "aaa"}	2015-05-03 20:51:43.007365+00	47
4	{"mensagem": "a", "email": "a@aaaa.com", "nome": "aa"}	2015-05-07 17:14:50.988234+00	48
5	{"mensagem": "a", "email": "a@aaa.com", "nome": "aa"}	2015-05-07 17:21:34.292366+00	48
6	{"mensagem": "a", "email": "a@aaa.com", "nome": "aa"}	2015-05-07 17:25:53.924409+00	48
7	{"mensagem": "a", "email": "a@aaa.com", "nome": "aa"}	2015-05-07 17:26:52.929043+00	48
8	{"mensagem": "a", "email": "a@aaa.com", "nome": "aa"}	2015-05-07 17:27:25.217729+00	48
9	{"mensagem": "a", "email": "a@aaa.com", "nome": "aa"}	2015-05-07 17:28:54.382198+00	48
10	{"mensagem": "a", "email": "a@aaa.com", "nome": "aa"}	2015-05-07 17:30:17.860494+00	48
11	{"mensagem": "a", "email": "a@aaa.com", "nome": "aa"}	2015-05-07 17:30:58.808367+00	48
\.


--
-- Name: wagtailforms_formsubmission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailforms_formsubmission_id_seq', 11, true);


--
-- Data for Name: wagtailimages_filter; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailimages_filter (id, spec) FROM stdin;
1	width-1000
2	width-200
3	width-300
4	width-500
5	max-130x130
6	max-165x165
7	max-800x600
8	width-800
9	width-150
10	width-100
11	max-130x100
12	height-125
13	fill-125x370-c100
14	fill-370x125-c100
15	fill-370x125
16	width-1600
17	width-1425
18	width-1280
19	width-786
20	original
21	width&#45;1600
22	width&#45;1425
23	width&#45;1280
24	width&#45;786
25	width-1920
26	fill-150x150-c100
27	fill-230x230-c100
28	fill-400x400-c100
29	fill-250x250-c100
30	fill-300x335-c100
31	fill-335x300-c100
32	fill-370x300-c100
33	fill-365x300-c100
34	fill-200x200-c100
\.


--
-- Name: wagtailimages_filter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailimages_filter_id_seq', 34, true);


--
-- Data for Name: wagtailimages_image; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailimages_image (id, title, file, width, height, created_at, focal_point_x, focal_point_y, focal_point_width, focal_point_height, uploaded_by_user_id) FROM stdin;
4	Wagtail by Mark Harkin	original_images/wagtail_by_markyharky.jpg	640	427	2014-02-06 10:14:47.173+00	\N	\N	\N	\N	\N
5	James Joyce	original_images/James_Joyce_in_1915.jpg	500	392	2014-02-06 10:37:10.518+00	\N	\N	\N	\N	\N
6	David Mitchell	original_images/David_Mitchell_by_Kubik.JPG	360	282	2014-02-06 10:42:46.536+00	\N	\N	\N	\N	\N
7	Wagtail by Joe Buckingham	original_images/wagtail_by_joe_buckingham.jpg	640	397	2014-02-06 10:49:29.579+00	\N	\N	\N	\N	\N
8	Wagtail by fs-phil	original_images/wagtail_by_fs-phil.jpg	640	397	2014-02-06 10:54:29.963+00	\N	\N	\N	\N	\N
9	White wagtail by Koshy Koshy	original_images/white_wagtail_by_Koshyk.jpg	640	397	2014-02-06 10:57:05.536+00	\N	\N	\N	\N	\N
10	Pied wagtail by Marie Hale	original_images/pied_wagtail_by_Marie_Hale.jpg	640	397	2014-02-06 11:05:12.37+00	\N	\N	\N	\N	\N
11	Wagtail at Borovoye, Kazakhstan by Ken and Nyetta	original_images/wagtail_at_Borovoye_Kazakhstan_by_Ken_and_Nyetta.jpg	640	397	2014-02-06 11:08:09.355+00	\N	\N	\N	\N	\N
12	Wagtail Sproing by Jim Bendon	original_images/wagtail_sproing_by_Jim_Bendon.jpg	640	397	2014-02-06 11:10:01.185+00	\N	\N	\N	\N	\N
13	Hopalong wagtail by Ruth Flickr	original_images/hopalong_wagtail_by_Ruth_Flickr.jpg	640	397	2014-02-06 11:15:32.454+00	\N	\N	\N	\N	\N
14	Wagtail collects insects by Margrit	original_images/wagtail_collects_insects_by_Maggi_94.jpg	640	397	2014-02-06 11:21:13.596+00	\N	\N	\N	\N	\N
15	Grey wagtail by Lip Kee	original_images/grey_wagtail_by_lip_kee.jpg	640	397	2014-02-06 11:23:36.409+00	\N	\N	\N	\N	\N
16	Cursos Header	original_images/uofn-kona.jpg	2563	1442	2015-04-24 22:23:02.387849+00	\N	\N	\N	\N	1
17	Tech Feed	original_images/11025213_10153070734765279_4093958999396376028_o.jpg	2048	1371	2015-04-24 22:51:14.941549+00	\N	\N	\N	\N	1
\.


--
-- Name: wagtailimages_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailimages_image_id_seq', 17, true);


--
-- Data for Name: wagtailimages_rendition; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailimages_rendition (id, file, width, height, focal_point_key, filter_id, image_id) FROM stdin;
1	images/grey_wagtail_by_lip_kee.focus-none.width-1000.jpg	640	397		1	15
2	images/wagtail_sproing_by_Jim_Bendon.focus-none.width-1000.jpg	640	397		1	12
3	images/wagtail_at_Borovoye_Kazakhstan_by_.focus-none.width-1000.jpg	640	397		1	11
4	images/James_Joyce_in_1915.focus-none.width-200.jpg	200	156		2	5
5	images/David_Mitchell_by_Kubik.focus-none.width-200.JPG	200	156		2	6
6	images/wagtail_collects_insects_by_Maggi_9.focus-none.width-200.jpg	200	124		2	14
7	images/grey_wagtail_by_lip_kee.focus-none.width-200.jpg	200	124		2	15
8	images/wagtail_by_fs-phil.focus-none.width-200.jpg	200	124		2	8
9	images/pied_wagtail_by_Marie_Hale.focus-none.width-200.jpg	200	124		2	10
10	images/James_Joyce_in_1915.focus-none.width-300.jpg	300	235		3	5
11	images/wagtail_sproing_by_Jim_Bendon.focus-none.width-500.jpg	500	310		4	12
12	images/pied_wagtail_by_Marie_Hale.focus-none.width-500.jpg	500	310		4	10
13	images/wagtail_by_joe_buckingham.focus-none.width-200.jpg	200	124		2	7
14	images/grey_wagtail_by_lip_kee.focus-none.max-130x130.jpg	130	80		5	15
15	images/wagtail_sproing_by_Jim_Bendon.focus-none.max-130x130.jpg	130	80		5	12
16	images/wagtail_at_Borovoye_Kazakhstan_by.focus-none.max-130x130.jpg	130	80		5	11
17	images/grey_wagtail_by_lip_kee.focus-none.max-165x165.jpg	165	102		6	15
18	images/wagtail_collects_insects_by_Maggi.focus-none.max-165x165.jpg	165	102		6	14
19	images/hopalong_wagtail_by_Ruth_Flickr.focus-none.max-165x165.jpg	165	102		6	13
20	images/wagtail_sproing_by_Jim_Bendon.focus-none.max-165x165.jpg	165	102		6	12
21	images/wagtail_at_Borovoye_Kazakhstan_by.focus-none.max-165x165.jpg	165	102		6	11
22	images/pied_wagtail_by_Marie_Hale.focus-none.max-165x165.jpg	165	102		6	10
23	images/white_wagtail_by_Koshyk.focus-none.max-165x165.jpg	165	102		6	9
24	images/wagtail_by_fs-phil.focus-none.max-165x165.jpg	165	102		6	8
25	images/wagtail_by_joe_buckingham.focus-none.max-165x165.jpg	165	102		6	7
26	images/David_Mitchell_by_Kubik.focus-none.max-165x165.JPG	165	129		6	6
27	images/James_Joyce_in_1915.focus-none.max-165x165.jpg	165	129		6	5
28	images/wagtail_by_markyharky.focus-none.max-165x165.jpg	165	110		6	4
29	images/wagtail_sproing_by_Jim_Bendon.focus-none.max-800x600.jpg	640	397		7	12
30	images/hopalong_wagtail_by_Ruth_Flickr.focus-none.max-130x130.jpg	130	80		5	13
31	images/hopalong_wagtail_by_Ruth_Flickr.focus-none.width-1000.jpg	640	397		1	13
32	images/wagtail_by_joe_buckingham.focus-none.max-130x130.jpg	130	80		5	7
33	images/grey_wagtail_by_lip_kee.focus-none.max-800x600.jpg	640	397		7	15
34	images/grey_wagtail_by_lip_kee.focus-none.width-800.jpg	640	397		8	15
35	images/David_Mitchell_by_Kubik.focus-none.width-300.JPG	300	235		3	6
36	images/wagtail_by_fs-phil.focus-none.width-150.jpg	150	93		9	8
37	images/wagtail_by_fs-phil.focus-none.width-100.jpg	100	62		10	8
38	images/James_Joyce_in_1915.focus-none.max-130x130.jpg	130	101		5	5
39	images/David_Mitchell_by_Kubik.focus-none.max-130x130.JPG	130	101		5	6
40	images/wagtail_by_fs-phil.focus-none.max-130x130.jpg	130	80		5	8
41	images/pied_wagtail_by_Marie_Hale.focus-none.width-150.jpg	150	93		9	10
42	images/uofn-kona.focus-none.max-130x100.jpg	130	73		11	16
43	images/uofn-kona.focus-none.max-130x130.jpg	130	73		5	16
44	images/uofn-kona.focus-none.max-165x165.jpg	165	92		6	16
45	images/uofn-kona.focus-none.width-150.jpg	150	84		9	16
46	images/11025213_10153070734765279_409395.focus-none.max-130x100.jpg	130	87		11	17
47	images/11025213_10153070734765279_40939589.focus-none.width-150.jpg	150	100		9	17
48	images/wagtail_collects_insects_by_Maggi_.focus-none.height-125.jpg	201	125		12	14
49	images/wagtail_collects_insects_by.focus-none.fill-125x370-c100.jpg	125	370		13	14
50	images/wagtail_collects_insects_by.focus-none.fill-370x125-c100.jpg	370	125		14	14
51	images/wagtail_collects_insects_by_Magg.focus-none.fill-370x125.jpg	370	125		15	14
52	images/grey_wagtail_by_lip_kee.focus-none.fill-370x125-c100.jpg	370	125		14	15
53	images/wagtail_by_joe_buckingham.focus-none.fill-370x125-c100.jpg	370	125		14	7
54	images/uofn-kona.focus-none.width-1600.jpg	1600	900		16	16
55	images/uofn-kona.focus-none.width-1425.jpg	1425	801		17	16
56	images/uofn-kona.focus-none.width-1280.jpg	1280	720		18	16
57	images/uofn-kona.focus-none.width-786.jpg	786	442		19	16
58	images/uofn-kona.focus-none.original.jpg	2563	1442		20	16
59	images/uofn-kona.focus-none.width-1920.jpg	1920	1080		25	16
60	images/uofn-kona.focus-none.fill-150x150-c100.jpg	150	150		26	16
61	images/11025213_10153070734765279_.focus-none.fill-150x150-c100.jpg	150	150		26	17
62	images/uofn-kona.focus-none.fill-230x230-c100.jpg	230	230		27	16
63	images/11025213_10153070734765279_.focus-none.fill-230x230-c100.jpg	230	230		27	17
64	images/pied_wagtail_by_Marie_Hale.focus-none.max-130x130.jpg	130	80		5	10
65	images/11025213_10153070734765279_409395.focus-none.max-165x165.jpg	165	110		6	17
66	images/wagtail_sproing_by_Jim_Bend.focus-none.fill-400x400-c100.jpg	397	397		28	12
67	images/pied_wagtail_by_Marie_Hale.focus-none.fill-400x400-c100.jpg	397	397		28	10
68	images/grey_wagtail_by_lip_kee.focus-none.fill-400x400-c100.jpg	397	397		28	15
69	images/wagtail_sproing_by_Jim_Bend.focus-none.fill-250x250-c100.jpg	249	250		29	12
70	images/pied_wagtail_by_Marie_Hale.focus-none.fill-250x250-c100.jpg	249	250		29	10
71	images/grey_wagtail_by_lip_kee.focus-none.fill-250x250-c100.jpg	249	250		29	15
72	images/wagtail_sproing_by_Jim_Bend.focus-none.fill-300x335-c100.jpg	300	335		30	12
73	images/pied_wagtail_by_Marie_Hale.focus-none.fill-300x335-c100.jpg	300	335		30	10
74	images/grey_wagtail_by_lip_kee.focus-none.fill-300x335-c100.jpg	300	335		30	15
75	images/wagtail_sproing_by_Jim_Bend.focus-none.fill-335x300-c100.jpg	335	300		31	12
76	images/pied_wagtail_by_Marie_Hale.focus-none.fill-335x300-c100.jpg	335	300		31	10
77	images/grey_wagtail_by_lip_kee.focus-none.fill-335x300-c100.jpg	335	300		31	15
78	images/wagtail_sproing_by_Jim_Bend.focus-none.fill-370x300-c100.jpg	370	300		32	12
79	images/pied_wagtail_by_Marie_Hale.focus-none.fill-370x300-c100.jpg	370	300		32	10
80	images/grey_wagtail_by_lip_kee.focus-none.fill-370x300-c100.jpg	370	300		32	15
81	images/wagtail_sproing_by_Jim_Bend.focus-none.fill-365x300-c100.jpg	365	300		33	12
82	images/pied_wagtail_by_Marie_Hale.focus-none.fill-365x300-c100.jpg	365	300		33	10
83	images/grey_wagtail_by_lip_kee.focus-none.fill-365x300-c100.jpg	365	300		33	15
84	images/white_wagtail_by_Koshyk.focus-none.width-1000.jpg	640	397		1	9
85	images/wagtail_by_joe_buckingham.focus-none.width-1000.jpg	640	397		1	7
86	images/wagtail_sproing_by_Jim_Bendon.focus-none.width-150.jpg	150	93		9	12
87	images/wagtail_sproing_by_Jim_Bend.focus-none.fill-150x150-c100.jpg	150	150		26	12
88	images/James_Joyce_in_1915.focus-none.fill-200x200-c100.jpg	200	200		34	5
89	images/David_Mitchell_by_Kubik.focus-none.fill-200x200-c100.JPG	200	200		34	6
\.


--
-- Name: wagtailimages_rendition_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailimages_rendition_id_seq', 89, true);


--
-- Data for Name: wagtailredirects_redirect; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailredirects_redirect (id, old_path, is_permanent, redirect_link, redirect_page_id, site_id) FROM stdin;
\.


--
-- Name: wagtailredirects_redirect_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailredirects_redirect_id_seq', 1, false);


--
-- Data for Name: wagtailsearch_editorspick; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailsearch_editorspick (id, sort_order, description, page_id, query_id) FROM stdin;
\.


--
-- Name: wagtailsearch_editorspick_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailsearch_editorspick_id_seq', 1, false);


--
-- Data for Name: wagtailsearch_query; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailsearch_query (id, query_string) FROM stdin;
1	teste
2	james
3	see
4	artes
5	treinamento
\.


--
-- Name: wagtailsearch_query_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailsearch_query_id_seq', 5, true);


--
-- Data for Name: wagtailsearch_querydailyhits; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailsearch_querydailyhits (id, date, hits, query_id) FROM stdin;
1	2015-03-25	2	1
2	2015-03-25	1	2
3	2015-03-25	1	3
4	2015-05-06	1	4
5	2015-05-07	5	5
6	2015-05-07	1	1
\.


--
-- Name: wagtailsearch_querydailyhits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailsearch_querydailyhits_id_seq', 6, true);


--
-- Data for Name: wagtailusers_userprofile; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailusers_userprofile (id, submitted_notifications, approved_notifications, rejected_notifications, user_id) FROM stdin;
\.


--
-- Name: wagtailusers_userprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailusers_userprofile_id_seq', 1, false);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: demo_advert_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY demo_advert
    ADD CONSTRAINT demo_advert_pkey PRIMARY KEY (id);


--
-- Name: demo_advertplacement_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY demo_advertplacement
    ADD CONSTRAINT demo_advertplacement_pkey PRIMARY KEY (id);


--
-- Name: demo_blogindexpage_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY demo_blogindexpage
    ADD CONSTRAINT demo_blogindexpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: demo_blogindexpagerelatedlink_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY demo_blogindexpagerelatedlink
    ADD CONSTRAINT demo_blogindexpagerelatedlink_pkey PRIMARY KEY (id);


--
-- Name: demo_blogpage_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY demo_blogpage
    ADD CONSTRAINT demo_blogpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: demo_blogpagecarouselitem_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY demo_blogpagecarouselitem
    ADD CONSTRAINT demo_blogpagecarouselitem_pkey PRIMARY KEY (id);


--
-- Name: demo_blogpagerelatedlink_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY demo_blogpagerelatedlink
    ADD CONSTRAINT demo_blogpagerelatedlink_pkey PRIMARY KEY (id);


--
-- Name: demo_blogpagetag_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY demo_blogpagetag
    ADD CONSTRAINT demo_blogpagetag_pkey PRIMARY KEY (id);


--
-- Name: demo_contactpage_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY demo_contactpage
    ADD CONSTRAINT demo_contactpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: demo_courseindexpage_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY demo_courseindexpage
    ADD CONSTRAINT demo_courseindexpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: demo_courseindexpagerelatedlink_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY demo_courseindexpagerelatedlink
    ADD CONSTRAINT demo_courseindexpagerelatedlink_pkey PRIMARY KEY (id);


--
-- Name: demo_coursepage_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY demo_coursepage
    ADD CONSTRAINT demo_coursepage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: demo_coursepagerelatedlink_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY demo_coursepagerelatedlink
    ADD CONSTRAINT demo_coursepagerelatedlink_pkey PRIMARY KEY (id);


--
-- Name: demo_eventindexpage_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY demo_eventindexpage
    ADD CONSTRAINT demo_eventindexpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: demo_eventindexpagerelatedlink_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY demo_eventindexpagerelatedlink
    ADD CONSTRAINT demo_eventindexpagerelatedlink_pkey PRIMARY KEY (id);


--
-- Name: demo_eventpage_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY demo_eventpage
    ADD CONSTRAINT demo_eventpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: demo_eventpagecarouselitem_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY demo_eventpagecarouselitem
    ADD CONSTRAINT demo_eventpagecarouselitem_pkey PRIMARY KEY (id);


--
-- Name: demo_eventpagerelatedlink_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY demo_eventpagerelatedlink
    ADD CONSTRAINT demo_eventpagerelatedlink_pkey PRIMARY KEY (id);


--
-- Name: demo_eventpagespeaker_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY demo_eventpagespeaker
    ADD CONSTRAINT demo_eventpagespeaker_pkey PRIMARY KEY (id);


--
-- Name: demo_formfield_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY demo_formfield
    ADD CONSTRAINT demo_formfield_pkey PRIMARY KEY (id);


--
-- Name: demo_formpage_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY demo_formpage
    ADD CONSTRAINT demo_formpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: demo_homepage_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY demo_homepage
    ADD CONSTRAINT demo_homepage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: demo_homepagecarouselitem_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY demo_homepagecarouselitem
    ADD CONSTRAINT demo_homepagecarouselitem_pkey PRIMARY KEY (id);


--
-- Name: demo_homepagerelatedlink_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY demo_homepagerelatedlink
    ADD CONSTRAINT demo_homepagerelatedlink_pkey PRIMARY KEY (id);


--
-- Name: demo_languageredirectionpage_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY demo_languageredirectionpage
    ADD CONSTRAINT demo_languageredirectionpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: demo_personpage_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY demo_personpage
    ADD CONSTRAINT demo_personpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: demo_personpagerelatedlink_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY demo_personpagerelatedlink
    ADD CONSTRAINT demo_personpagerelatedlink_pkey PRIMARY KEY (id);


--
-- Name: demo_standardindexpage_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY demo_standardindexpage
    ADD CONSTRAINT demo_standardindexpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: demo_standardindexpagerelatedlink_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY demo_standardindexpagerelatedlink
    ADD CONSTRAINT demo_standardindexpagerelatedlink_pkey PRIMARY KEY (id);


--
-- Name: demo_standardpage_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY demo_standardpage
    ADD CONSTRAINT demo_standardpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: demo_standardpagecarouselitem_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY demo_standardpagecarouselitem
    ADD CONSTRAINT demo_standardpagecarouselitem_pkey PRIMARY KEY (id);


--
-- Name: demo_standardpagerelatedlink_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY demo_standardpagerelatedlink
    ADD CONSTRAINT demo_standardpagerelatedlink_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_3ec8c61c_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_3ec8c61c_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: taggit_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY taggit_tag
    ADD CONSTRAINT taggit_tag_name_key UNIQUE (name);


--
-- Name: taggit_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY taggit_tag
    ADD CONSTRAINT taggit_tag_pkey PRIMARY KEY (id);


--
-- Name: taggit_tag_slug_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY taggit_tag
    ADD CONSTRAINT taggit_tag_slug_key UNIQUE (slug);


--
-- Name: taggit_taggeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_grouppagepermission_group_id_5e8d9b00_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppagepermission_group_id_5e8d9b00_uniq UNIQUE (group_id, page_id, permission_type);


--
-- Name: wagtailcore_grouppagepermission_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppagepermission_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_page_path_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_path_key UNIQUE (path);


--
-- Name: wagtailcore_page_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_pagerevision_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_pagerevision
    ADD CONSTRAINT wagtailcore_pagerevision_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_pageviewrestriction_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_pageviewrestriction
    ADD CONSTRAINT wagtailcore_pageviewrestriction_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_site_hostname_6b53fda_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_site
    ADD CONSTRAINT wagtailcore_site_hostname_6b53fda_uniq UNIQUE (hostname, port);


--
-- Name: wagtailcore_site_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_site
    ADD CONSTRAINT wagtailcore_site_pkey PRIMARY KEY (id);


--
-- Name: wagtaildocs_document_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtaildocs_document
    ADD CONSTRAINT wagtaildocs_document_pkey PRIMARY KEY (id);


--
-- Name: wagtailembeds_embed_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailembeds_embed
    ADD CONSTRAINT wagtailembeds_embed_pkey PRIMARY KEY (id);


--
-- Name: wagtailembeds_embed_url_6d95b7ba_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailembeds_embed
    ADD CONSTRAINT wagtailembeds_embed_url_6d95b7ba_uniq UNIQUE (url, max_width);


--
-- Name: wagtailforms_formsubmission_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailforms_formsubmission
    ADD CONSTRAINT wagtailforms_formsubmission_pkey PRIMARY KEY (id);


--
-- Name: wagtailimages_filter_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailimages_filter
    ADD CONSTRAINT wagtailimages_filter_pkey PRIMARY KEY (id);


--
-- Name: wagtailimages_filter_spec_40fed7f8_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailimages_filter
    ADD CONSTRAINT wagtailimages_filter_spec_40fed7f8_uniq UNIQUE (spec);


--
-- Name: wagtailimages_image_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailimages_image
    ADD CONSTRAINT wagtailimages_image_pkey PRIMARY KEY (id);


--
-- Name: wagtailimages_rendition_image_id_119535f1_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailimages_rendition
    ADD CONSTRAINT wagtailimages_rendition_image_id_119535f1_uniq UNIQUE (image_id, filter_id, focal_point_key);


--
-- Name: wagtailimages_rendition_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailimages_rendition
    ADD CONSTRAINT wagtailimages_rendition_pkey PRIMARY KEY (id);


--
-- Name: wagtailredirects_redirect_old_path_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailredirects_redirect
    ADD CONSTRAINT wagtailredirects_redirect_old_path_key UNIQUE (old_path);


--
-- Name: wagtailredirects_redirect_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailredirects_redirect
    ADD CONSTRAINT wagtailredirects_redirect_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearch_editorspick_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailsearch_editorspick
    ADD CONSTRAINT wagtailsearch_editorspick_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearch_query_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailsearch_query
    ADD CONSTRAINT wagtailsearch_query_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearch_query_query_string_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailsearch_query
    ADD CONSTRAINT wagtailsearch_query_query_string_key UNIQUE (query_string);


--
-- Name: wagtailsearch_querydailyhits_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailsearch_querydailyhits
    ADD CONSTRAINT wagtailsearch_querydailyhits_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearch_querydailyhits_query_id_6de34f37_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailsearch_querydailyhits
    ADD CONSTRAINT wagtailsearch_querydailyhits_query_id_6de34f37_uniq UNIQUE (query_id, date);


--
-- Name: wagtailusers_userprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailusers_userprofile
    ADD CONSTRAINT wagtailusers_userprofile_pkey PRIMARY KEY (id);


--
-- Name: wagtailusers_userprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailusers_userprofile
    ADD CONSTRAINT wagtailusers_userprofile_user_id_key UNIQUE (user_id);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: demo_advert_1a63c800; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_advert_1a63c800 ON demo_advert USING btree (page_id);


--
-- Name: demo_advertplacement_0dbc927f; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_advertplacement_0dbc927f ON demo_advertplacement USING btree (advert_id);


--
-- Name: demo_advertplacement_1a63c800; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_advertplacement_1a63c800 ON demo_advertplacement USING btree (page_id);


--
-- Name: demo_blogindexpage_8385ecd8; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_blogindexpage_8385ecd8 ON demo_blogindexpage USING btree (br_link_id);


--
-- Name: demo_blogindexpagerelatedlink_121087a8; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_blogindexpagerelatedlink_121087a8 ON demo_blogindexpagerelatedlink USING btree (link_document_id);


--
-- Name: demo_blogindexpagerelatedlink_1a63c800; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_blogindexpagerelatedlink_1a63c800 ON demo_blogindexpagerelatedlink USING btree (page_id);


--
-- Name: demo_blogindexpagerelatedlink_5b76e141; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_blogindexpagerelatedlink_5b76e141 ON demo_blogindexpagerelatedlink USING btree (link_page_id);


--
-- Name: demo_blogpage_8385ecd8; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_blogpage_8385ecd8 ON demo_blogpage USING btree (br_link_id);


--
-- Name: demo_blogpage_92482941; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_blogpage_92482941 ON demo_blogpage USING btree (feed_image_id);


--
-- Name: demo_blogpagecarouselitem_121087a8; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_blogpagecarouselitem_121087a8 ON demo_blogpagecarouselitem USING btree (link_document_id);


--
-- Name: demo_blogpagecarouselitem_1a63c800; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_blogpagecarouselitem_1a63c800 ON demo_blogpagecarouselitem USING btree (page_id);


--
-- Name: demo_blogpagecarouselitem_5b76e141; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_blogpagecarouselitem_5b76e141 ON demo_blogpagecarouselitem USING btree (link_page_id);


--
-- Name: demo_blogpagecarouselitem_f33175e6; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_blogpagecarouselitem_f33175e6 ON demo_blogpagecarouselitem USING btree (image_id);


--
-- Name: demo_blogpagerelatedlink_121087a8; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_blogpagerelatedlink_121087a8 ON demo_blogpagerelatedlink USING btree (link_document_id);


--
-- Name: demo_blogpagerelatedlink_1a63c800; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_blogpagerelatedlink_1a63c800 ON demo_blogpagerelatedlink USING btree (page_id);


--
-- Name: demo_blogpagerelatedlink_5b76e141; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_blogpagerelatedlink_5b76e141 ON demo_blogpagerelatedlink USING btree (link_page_id);


--
-- Name: demo_blogpagetag_09a80f33; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_blogpagetag_09a80f33 ON demo_blogpagetag USING btree (content_object_id);


--
-- Name: demo_blogpagetag_76f094bc; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_blogpagetag_76f094bc ON demo_blogpagetag USING btree (tag_id);


--
-- Name: demo_contactpage_8385ecd8; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_contactpage_8385ecd8 ON demo_contactpage USING btree (br_link_id);


--
-- Name: demo_contactpage_92482941; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_contactpage_92482941 ON demo_contactpage USING btree (feed_image_id);


--
-- Name: demo_courseindexpage_8385ecd8; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_courseindexpage_8385ecd8 ON demo_courseindexpage USING btree (br_link_id);


--
-- Name: demo_courseindexpage_c16de916; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_courseindexpage_c16de916 ON demo_courseindexpage USING btree (header_image_id);


--
-- Name: demo_courseindexpagerelatedlink_121087a8; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_courseindexpagerelatedlink_121087a8 ON demo_courseindexpagerelatedlink USING btree (link_document_id);


--
-- Name: demo_courseindexpagerelatedlink_1a63c800; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_courseindexpagerelatedlink_1a63c800 ON demo_courseindexpagerelatedlink USING btree (page_id);


--
-- Name: demo_courseindexpagerelatedlink_5b76e141; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_courseindexpagerelatedlink_5b76e141 ON demo_courseindexpagerelatedlink USING btree (link_page_id);


--
-- Name: demo_coursepage_8385ecd8; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_coursepage_8385ecd8 ON demo_coursepage USING btree (br_link_id);


--
-- Name: demo_coursepage_92482941; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_coursepage_92482941 ON demo_coursepage USING btree (feed_image_id);


--
-- Name: demo_coursepage_c16de916; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_coursepage_c16de916 ON demo_coursepage USING btree (header_image_id);


--
-- Name: demo_coursepagerelatedlink_121087a8; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_coursepagerelatedlink_121087a8 ON demo_coursepagerelatedlink USING btree (link_document_id);


--
-- Name: demo_coursepagerelatedlink_1a63c800; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_coursepagerelatedlink_1a63c800 ON demo_coursepagerelatedlink USING btree (page_id);


--
-- Name: demo_coursepagerelatedlink_5b76e141; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_coursepagerelatedlink_5b76e141 ON demo_coursepagerelatedlink USING btree (link_page_id);


--
-- Name: demo_eventindexpage_8385ecd8; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_eventindexpage_8385ecd8 ON demo_eventindexpage USING btree (br_link_id);


--
-- Name: demo_eventindexpagerelatedlink_121087a8; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_eventindexpagerelatedlink_121087a8 ON demo_eventindexpagerelatedlink USING btree (link_document_id);


--
-- Name: demo_eventindexpagerelatedlink_1a63c800; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_eventindexpagerelatedlink_1a63c800 ON demo_eventindexpagerelatedlink USING btree (page_id);


--
-- Name: demo_eventindexpagerelatedlink_5b76e141; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_eventindexpagerelatedlink_5b76e141 ON demo_eventindexpagerelatedlink USING btree (link_page_id);


--
-- Name: demo_eventpage_8385ecd8; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_eventpage_8385ecd8 ON demo_eventpage USING btree (br_link_id);


--
-- Name: demo_eventpage_92482941; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_eventpage_92482941 ON demo_eventpage USING btree (feed_image_id);


--
-- Name: demo_eventpagecarouselitem_121087a8; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_eventpagecarouselitem_121087a8 ON demo_eventpagecarouselitem USING btree (link_document_id);


--
-- Name: demo_eventpagecarouselitem_1a63c800; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_eventpagecarouselitem_1a63c800 ON demo_eventpagecarouselitem USING btree (page_id);


--
-- Name: demo_eventpagecarouselitem_5b76e141; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_eventpagecarouselitem_5b76e141 ON demo_eventpagecarouselitem USING btree (link_page_id);


--
-- Name: demo_eventpagecarouselitem_f33175e6; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_eventpagecarouselitem_f33175e6 ON demo_eventpagecarouselitem USING btree (image_id);


--
-- Name: demo_eventpagerelatedlink_121087a8; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_eventpagerelatedlink_121087a8 ON demo_eventpagerelatedlink USING btree (link_document_id);


--
-- Name: demo_eventpagerelatedlink_1a63c800; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_eventpagerelatedlink_1a63c800 ON demo_eventpagerelatedlink USING btree (page_id);


--
-- Name: demo_eventpagerelatedlink_5b76e141; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_eventpagerelatedlink_5b76e141 ON demo_eventpagerelatedlink USING btree (link_page_id);


--
-- Name: demo_eventpagespeaker_121087a8; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_eventpagespeaker_121087a8 ON demo_eventpagespeaker USING btree (link_document_id);


--
-- Name: demo_eventpagespeaker_1a63c800; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_eventpagespeaker_1a63c800 ON demo_eventpagespeaker USING btree (page_id);


--
-- Name: demo_eventpagespeaker_5b76e141; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_eventpagespeaker_5b76e141 ON demo_eventpagespeaker USING btree (link_page_id);


--
-- Name: demo_eventpagespeaker_f33175e6; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_eventpagespeaker_f33175e6 ON demo_eventpagespeaker USING btree (image_id);


--
-- Name: demo_formfield_1a63c800; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_formfield_1a63c800 ON demo_formfield USING btree (page_id);


--
-- Name: demo_homepage_8385ecd8; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_homepage_8385ecd8 ON demo_homepage USING btree (br_link_id);


--
-- Name: demo_homepagecarouselitem_121087a8; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_homepagecarouselitem_121087a8 ON demo_homepagecarouselitem USING btree (link_document_id);


--
-- Name: demo_homepagecarouselitem_1a63c800; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_homepagecarouselitem_1a63c800 ON demo_homepagecarouselitem USING btree (page_id);


--
-- Name: demo_homepagecarouselitem_5b76e141; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_homepagecarouselitem_5b76e141 ON demo_homepagecarouselitem USING btree (link_page_id);


--
-- Name: demo_homepagecarouselitem_f33175e6; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_homepagecarouselitem_f33175e6 ON demo_homepagecarouselitem USING btree (image_id);


--
-- Name: demo_homepagerelatedlink_121087a8; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_homepagerelatedlink_121087a8 ON demo_homepagerelatedlink USING btree (link_document_id);


--
-- Name: demo_homepagerelatedlink_1a63c800; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_homepagerelatedlink_1a63c800 ON demo_homepagerelatedlink USING btree (page_id);


--
-- Name: demo_homepagerelatedlink_5b76e141; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_homepagerelatedlink_5b76e141 ON demo_homepagerelatedlink USING btree (link_page_id);


--
-- Name: demo_personpage_8385ecd8; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_personpage_8385ecd8 ON demo_personpage USING btree (br_link_id);


--
-- Name: demo_personpage_92482941; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_personpage_92482941 ON demo_personpage USING btree (feed_image_id);


--
-- Name: demo_personpage_f33175e6; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_personpage_f33175e6 ON demo_personpage USING btree (image_id);


--
-- Name: demo_personpagerelatedlink_121087a8; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_personpagerelatedlink_121087a8 ON demo_personpagerelatedlink USING btree (link_document_id);


--
-- Name: demo_personpagerelatedlink_1a63c800; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_personpagerelatedlink_1a63c800 ON demo_personpagerelatedlink USING btree (page_id);


--
-- Name: demo_personpagerelatedlink_5b76e141; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_personpagerelatedlink_5b76e141 ON demo_personpagerelatedlink USING btree (link_page_id);


--
-- Name: demo_standardindexpage_8385ecd8; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_standardindexpage_8385ecd8 ON demo_standardindexpage USING btree (br_link_id);


--
-- Name: demo_standardindexpage_92482941; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_standardindexpage_92482941 ON demo_standardindexpage USING btree (feed_image_id);


--
-- Name: demo_standardindexpagerelatedlink_121087a8; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_standardindexpagerelatedlink_121087a8 ON demo_standardindexpagerelatedlink USING btree (link_document_id);


--
-- Name: demo_standardindexpagerelatedlink_1a63c800; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_standardindexpagerelatedlink_1a63c800 ON demo_standardindexpagerelatedlink USING btree (page_id);


--
-- Name: demo_standardindexpagerelatedlink_5b76e141; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_standardindexpagerelatedlink_5b76e141 ON demo_standardindexpagerelatedlink USING btree (link_page_id);


--
-- Name: demo_standardpage_8385ecd8; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_standardpage_8385ecd8 ON demo_standardpage USING btree (br_link_id);


--
-- Name: demo_standardpage_92482941; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_standardpage_92482941 ON demo_standardpage USING btree (feed_image_id);


--
-- Name: demo_standardpagecarouselitem_121087a8; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_standardpagecarouselitem_121087a8 ON demo_standardpagecarouselitem USING btree (link_document_id);


--
-- Name: demo_standardpagecarouselitem_1a63c800; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_standardpagecarouselitem_1a63c800 ON demo_standardpagecarouselitem USING btree (page_id);


--
-- Name: demo_standardpagecarouselitem_5b76e141; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_standardpagecarouselitem_5b76e141 ON demo_standardpagecarouselitem USING btree (link_page_id);


--
-- Name: demo_standardpagecarouselitem_f33175e6; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_standardpagecarouselitem_f33175e6 ON demo_standardpagecarouselitem USING btree (image_id);


--
-- Name: demo_standardpagerelatedlink_121087a8; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_standardpagerelatedlink_121087a8 ON demo_standardpagerelatedlink USING btree (link_document_id);


--
-- Name: demo_standardpagerelatedlink_1a63c800; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_standardpagerelatedlink_1a63c800 ON demo_standardpagerelatedlink USING btree (page_id);


--
-- Name: demo_standardpagerelatedlink_5b76e141; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX demo_standardpagerelatedlink_5b76e141 ON demo_standardpagerelatedlink USING btree (link_page_id);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: taggit_taggeditem_417f1b1c; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX taggit_taggeditem_417f1b1c ON taggit_taggeditem USING btree (content_type_id);


--
-- Name: taggit_taggeditem_76f094bc; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX taggit_taggeditem_76f094bc ON taggit_taggeditem USING btree (tag_id);


--
-- Name: taggit_taggeditem_af31437c; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX taggit_taggeditem_af31437c ON taggit_taggeditem USING btree (object_id);


--
-- Name: wagtailcore_grouppagepermission_0e939a4f; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailcore_grouppagepermission_0e939a4f ON wagtailcore_grouppagepermission USING btree (group_id);


--
-- Name: wagtailcore_grouppagepermission_1a63c800; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailcore_grouppagepermission_1a63c800 ON wagtailcore_grouppagepermission USING btree (page_id);


--
-- Name: wagtailcore_page_2dbcba41; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailcore_page_2dbcba41 ON wagtailcore_page USING btree (slug);


--
-- Name: wagtailcore_page_417f1b1c; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailcore_page_417f1b1c ON wagtailcore_page USING btree (content_type_id);


--
-- Name: wagtailcore_page_5e7b1936; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailcore_page_5e7b1936 ON wagtailcore_page USING btree (owner_id);


--
-- Name: wagtailcore_pagerevision_1a63c800; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailcore_pagerevision_1a63c800 ON wagtailcore_pagerevision USING btree (page_id);


--
-- Name: wagtailcore_pagerevision_e8701ad4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailcore_pagerevision_e8701ad4 ON wagtailcore_pagerevision USING btree (user_id);


--
-- Name: wagtailcore_pageviewrestriction_1a63c800; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailcore_pageviewrestriction_1a63c800 ON wagtailcore_pageviewrestriction USING btree (page_id);


--
-- Name: wagtailcore_site_0897acf4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailcore_site_0897acf4 ON wagtailcore_site USING btree (hostname);


--
-- Name: wagtailcore_site_8372b497; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailcore_site_8372b497 ON wagtailcore_site USING btree (root_page_id);


--
-- Name: wagtaildocs_document_ef01e2b6; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtaildocs_document_ef01e2b6 ON wagtaildocs_document USING btree (uploaded_by_user_id);


--
-- Name: wagtailforms_formsubmission_1a63c800; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailforms_formsubmission_1a63c800 ON wagtailforms_formsubmission USING btree (page_id);


--
-- Name: wagtailimages_filter_b979c293; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailimages_filter_b979c293 ON wagtailimages_filter USING btree (spec);


--
-- Name: wagtailimages_image_ef01e2b6; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailimages_image_ef01e2b6 ON wagtailimages_image USING btree (uploaded_by_user_id);


--
-- Name: wagtailimages_rendition_0a317463; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailimages_rendition_0a317463 ON wagtailimages_rendition USING btree (filter_id);


--
-- Name: wagtailimages_rendition_f33175e6; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailimages_rendition_f33175e6 ON wagtailimages_rendition USING btree (image_id);


--
-- Name: wagtailredirects_redirect_2fd79f37; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailredirects_redirect_2fd79f37 ON wagtailredirects_redirect USING btree (redirect_page_id);


--
-- Name: wagtailredirects_redirect_9365d6e7; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailredirects_redirect_9365d6e7 ON wagtailredirects_redirect USING btree (site_id);


--
-- Name: wagtailsearch_editorspick_0bbeda9c; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailsearch_editorspick_0bbeda9c ON wagtailsearch_editorspick USING btree (query_id);


--
-- Name: wagtailsearch_editorspick_1a63c800; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailsearch_editorspick_1a63c800 ON wagtailsearch_editorspick USING btree (page_id);


--
-- Name: wagtailsearch_querydailyhits_0bbeda9c; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailsearch_querydailyhits_0bbeda9c ON wagtailsearch_querydailyhits USING btree (query_id);


--
-- Name: auth_group_permiss_permission_id_23962d04_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_23962d04_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_58c48ba9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_58c48ba9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permiss_content_type_id_51277a81_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_51277a81_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_30a071c9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_30a071c9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_24702650_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_24702650_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_per_permission_id_3d7071f0_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_3d7071f0_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_advert_page_id_68907c7a_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_advert
    ADD CONSTRAINT demo_advert_page_id_68907c7a_fk_wagtailcore_page_id FOREIGN KEY (page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_advertplacement_advert_id_304ed03f_fk_demo_advert_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_advertplacement
    ADD CONSTRAINT demo_advertplacement_advert_id_304ed03f_fk_demo_advert_id FOREIGN KEY (advert_id) REFERENCES demo_advert(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_advertplacement_page_id_1849f2fc_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_advertplacement
    ADD CONSTRAINT demo_advertplacement_page_id_1849f2fc_fk_wagtailcore_page_id FOREIGN KEY (page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_bl_content_object_id_4259fb9c_fk_demo_blogpage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_blogpagetag
    ADD CONSTRAINT demo_bl_content_object_id_4259fb9c_fk_demo_blogpage_page_ptr_id FOREIGN KEY (content_object_id) REFERENCES demo_blogpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_blogi_link_document_id_452e8ca0_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_blogindexpagerelatedlink
    ADD CONSTRAINT demo_blogi_link_document_id_452e8ca0_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_blogind_page_id_193ac4b8_fk_demo_blogindexpage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_blogindexpagerelatedlink
    ADD CONSTRAINT demo_blogind_page_id_193ac4b8_fk_demo_blogindexpage_page_ptr_id FOREIGN KEY (page_id) REFERENCES demo_blogindexpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_blogindexpage_br_link_id_451c88fd_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_blogindexpage
    ADD CONSTRAINT demo_blogindexpage_br_link_id_451c88fd_fk_wagtailcore_page_id FOREIGN KEY (br_link_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_blogindexpage_link_page_id_7619adba_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_blogindexpagerelatedlink
    ADD CONSTRAINT demo_blogindexpage_link_page_id_7619adba_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_blogindexpage_page_ptr_id_487fccc5_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_blogindexpage
    ADD CONSTRAINT demo_blogindexpage_page_ptr_id_487fccc5_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_blogp_link_document_id_2e5f6029_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_blogpagerelatedlink
    ADD CONSTRAINT demo_blogp_link_document_id_2e5f6029_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_blogp_link_document_id_52cae43c_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_blogpagecarouselitem
    ADD CONSTRAINT demo_blogp_link_document_id_52cae43c_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_blogpage_br_link_id_50ff1aee_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_blogpage
    ADD CONSTRAINT demo_blogpage_br_link_id_50ff1aee_fk_wagtailcore_page_id FOREIGN KEY (br_link_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_blogpage_feed_image_id_535b4836_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_blogpage
    ADD CONSTRAINT demo_blogpage_feed_image_id_535b4836_fk_wagtailimages_image_id FOREIGN KEY (feed_image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_blogpage_page_ptr_id_25d6bfa0_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_blogpage
    ADD CONSTRAINT demo_blogpage_page_ptr_id_25d6bfa0_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_blogpagecaro_page_id_543f6624_fk_demo_blogpage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_blogpagecarouselitem
    ADD CONSTRAINT demo_blogpagecaro_page_id_543f6624_fk_demo_blogpage_page_ptr_id FOREIGN KEY (page_id) REFERENCES demo_blogpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_blogpagecarou_link_page_id_234e811e_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_blogpagecarouselitem
    ADD CONSTRAINT demo_blogpagecarou_link_page_id_234e811e_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_blogpagecarouse_image_id_9ea5a13_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_blogpagecarouselitem
    ADD CONSTRAINT demo_blogpagecarouse_image_id_9ea5a13_fk_wagtailimages_image_id FOREIGN KEY (image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_blogpagerela_page_id_5b46d7ef_fk_demo_blogpage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_blogpagerelatedlink
    ADD CONSTRAINT demo_blogpagerela_page_id_5b46d7ef_fk_demo_blogpage_page_ptr_id FOREIGN KEY (page_id) REFERENCES demo_blogpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_blogpagerelat_link_page_id_58b7e9f1_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_blogpagerelatedlink
    ADD CONSTRAINT demo_blogpagerelat_link_page_id_58b7e9f1_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_blogpagetag_tag_id_3a8cbf52_fk_taggit_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_blogpagetag
    ADD CONSTRAINT demo_blogpagetag_tag_id_3a8cbf52_fk_taggit_tag_id FOREIGN KEY (tag_id) REFERENCES taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_contactpa_feed_image_id_559c37b5_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_contactpage
    ADD CONSTRAINT demo_contactpa_feed_image_id_559c37b5_fk_wagtailimages_image_id FOREIGN KEY (feed_image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_contactpage_br_link_id_41c4b6b1_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_contactpage
    ADD CONSTRAINT demo_contactpage_br_link_id_41c4b6b1_fk_wagtailcore_page_id FOREIGN KEY (br_link_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_contactpage_page_ptr_id_3219882f_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_contactpage
    ADD CONSTRAINT demo_contactpage_page_ptr_id_3219882f_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_cours_link_document_id_2809cd8d_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_courseindexpagerelatedlink
    ADD CONSTRAINT demo_cours_link_document_id_2809cd8d_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_cours_link_document_id_33c07f2a_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_coursepagerelatedlink
    ADD CONSTRAINT demo_cours_link_document_id_33c07f2a_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_cours_page_id_6e2d345b_fk_demo_courseindexpage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_courseindexpagerelatedlink
    ADD CONSTRAINT demo_cours_page_id_6e2d345b_fk_demo_courseindexpage_page_ptr_id FOREIGN KEY (page_id) REFERENCES demo_courseindexpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_coursei_header_image_id_529f9305_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_courseindexpage
    ADD CONSTRAINT demo_coursei_header_image_id_529f9305_fk_wagtailimages_image_id FOREIGN KEY (header_image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_courseindexpa_link_page_id_134d7933_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_courseindexpagerelatedlink
    ADD CONSTRAINT demo_courseindexpa_link_page_id_134d7933_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_courseindexpag_page_ptr_id_5041afec_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_courseindexpage
    ADD CONSTRAINT demo_courseindexpag_page_ptr_id_5041afec_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_courseindexpage_br_link_id_323f66e_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_courseindexpage
    ADD CONSTRAINT demo_courseindexpage_br_link_id_323f66e_fk_wagtailcore_page_id FOREIGN KEY (br_link_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_coursepag_feed_image_id_1e40172b_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_coursepage
    ADD CONSTRAINT demo_coursepag_feed_image_id_1e40172b_fk_wagtailimages_image_id FOREIGN KEY (feed_image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_coursepag_header_image_id_53cb06_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_coursepage
    ADD CONSTRAINT demo_coursepag_header_image_id_53cb06_fk_wagtailimages_image_id FOREIGN KEY (header_image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_coursepage_br_link_id_68760a6f_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_coursepage
    ADD CONSTRAINT demo_coursepage_br_link_id_68760a6f_fk_wagtailcore_page_id FOREIGN KEY (br_link_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_coursepage_page_id_767b3742_fk_demo_coursepage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_coursepagerelatedlink
    ADD CONSTRAINT demo_coursepage_page_id_767b3742_fk_demo_coursepage_page_ptr_id FOREIGN KEY (page_id) REFERENCES demo_coursepage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_coursepage_page_ptr_id_53853831_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_coursepage
    ADD CONSTRAINT demo_coursepage_page_ptr_id_53853831_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_coursepagerel_link_page_id_2605c930_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_coursepagerelatedlink
    ADD CONSTRAINT demo_coursepagerel_link_page_id_2605c930_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_event_link_document_id_1f4f5669_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_eventindexpagerelatedlink
    ADD CONSTRAINT demo_event_link_document_id_1f4f5669_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_event_link_document_id_36aed2ac_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_eventpagerelatedlink
    ADD CONSTRAINT demo_event_link_document_id_36aed2ac_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_event_link_document_id_5b08de16_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_eventpagespeaker
    ADD CONSTRAINT demo_event_link_document_id_5b08de16_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_event_link_document_id_5b625045_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_eventpagecarouselitem
    ADD CONSTRAINT demo_event_link_document_id_5b625045_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_eventi_page_id_236b61af_fk_demo_eventindexpage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_eventindexpagerelatedlink
    ADD CONSTRAINT demo_eventi_page_id_236b61af_fk_demo_eventindexpage_page_ptr_id FOREIGN KEY (page_id) REFERENCES demo_eventindexpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_eventindexpag_link_page_id_24cd9af1_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_eventindexpagerelatedlink
    ADD CONSTRAINT demo_eventindexpag_link_page_id_24cd9af1_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_eventindexpage_br_link_id_5f5b42f8_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_eventindexpage
    ADD CONSTRAINT demo_eventindexpage_br_link_id_5f5b42f8_fk_wagtailcore_page_id FOREIGN KEY (br_link_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_eventindexpage_page_ptr_id_7cd68e86_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_eventindexpage
    ADD CONSTRAINT demo_eventindexpage_page_ptr_id_7cd68e86_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_eventpage_br_link_id_51b91d7f_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_eventpage
    ADD CONSTRAINT demo_eventpage_br_link_id_51b91d7f_fk_wagtailcore_page_id FOREIGN KEY (br_link_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_eventpage_feed_image_id_c16175d_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_eventpage
    ADD CONSTRAINT demo_eventpage_feed_image_id_c16175d_fk_wagtailimages_image_id FOREIGN KEY (feed_image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_eventpage_page_ptr_id_43613341_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_eventpage
    ADD CONSTRAINT demo_eventpage_page_ptr_id_43613341_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_eventpageca_page_id_78a8885d_fk_demo_eventpage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_eventpagecarouselitem
    ADD CONSTRAINT demo_eventpageca_page_id_78a8885d_fk_demo_eventpage_page_ptr_id FOREIGN KEY (page_id) REFERENCES demo_eventpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_eventpagecaro_link_page_id_288787eb_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_eventpagecarouselitem
    ADD CONSTRAINT demo_eventpagecaro_link_page_id_288787eb_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_eventpagecarou_image_id_668fe754_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_eventpagecarouselitem
    ADD CONSTRAINT demo_eventpagecarou_image_id_668fe754_fk_wagtailimages_image_id FOREIGN KEY (image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_eventpagerel_page_id_de01a94_fk_demo_eventpage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_eventpagerelatedlink
    ADD CONSTRAINT demo_eventpagerel_page_id_de01a94_fk_demo_eventpage_page_ptr_id FOREIGN KEY (page_id) REFERENCES demo_eventpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_eventpagerela_link_page_id_76ade33a_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_eventpagerelatedlink
    ADD CONSTRAINT demo_eventpagerela_link_page_id_76ade33a_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_eventpagesp_page_id_57fa2002_fk_demo_eventpage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_eventpagespeaker
    ADD CONSTRAINT demo_eventpagesp_page_id_57fa2002_fk_demo_eventpage_page_ptr_id FOREIGN KEY (page_id) REFERENCES demo_eventpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_eventpagespea_link_page_id_480dbc90_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_eventpagespeaker
    ADD CONSTRAINT demo_eventpagespea_link_page_id_480dbc90_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_eventpagespeak_image_id_74f0da61_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_eventpagespeaker
    ADD CONSTRAINT demo_eventpagespeak_image_id_74f0da61_fk_wagtailimages_image_id FOREIGN KEY (image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_formfield_page_id_597b639f_fk_demo_formpage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_formfield
    ADD CONSTRAINT demo_formfield_page_id_597b639f_fk_demo_formpage_page_ptr_id FOREIGN KEY (page_id) REFERENCES demo_formpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_formpage_page_ptr_id_3535822_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_formpage
    ADD CONSTRAINT demo_formpage_page_ptr_id_3535822_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_homep_link_document_id_52f22401_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_homepagecarouselitem
    ADD CONSTRAINT demo_homep_link_document_id_52f22401_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_homep_link_document_id_77a65f16_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_homepagerelatedlink
    ADD CONSTRAINT demo_homep_link_document_id_77a65f16_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_homepage_br_link_id_422ed50d_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_homepage
    ADD CONSTRAINT demo_homepage_br_link_id_422ed50d_fk_wagtailcore_page_id FOREIGN KEY (br_link_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_homepage_page_ptr_id_1113091b_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_homepage
    ADD CONSTRAINT demo_homepage_page_ptr_id_1113091b_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_homepagecarou_link_page_id_5fa63059_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_homepagecarouselitem
    ADD CONSTRAINT demo_homepagecarou_link_page_id_5fa63059_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_homepagecarou_page_id_470dde7_fk_demo_homepage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_homepagecarouselitem
    ADD CONSTRAINT demo_homepagecarou_page_id_470dde7_fk_demo_homepage_page_ptr_id FOREIGN KEY (page_id) REFERENCES demo_homepage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_homepagecarouse_image_id_db8c44a_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_homepagecarouselitem
    ADD CONSTRAINT demo_homepagecarouse_image_id_db8c44a_fk_wagtailimages_image_id FOREIGN KEY (image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_homepagerelat_link_page_id_5dc4ce04_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_homepagerelatedlink
    ADD CONSTRAINT demo_homepagerelat_link_page_id_5dc4ce04_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_homepagerelat_page_id_380e0fe_fk_demo_homepage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_homepagerelatedlink
    ADD CONSTRAINT demo_homepagerelat_page_id_380e0fe_fk_demo_homepage_page_ptr_id FOREIGN KEY (page_id) REFERENCES demo_homepage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_languageredire_page_ptr_id_6daed337_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_languageredirectionpage
    ADD CONSTRAINT demo_languageredire_page_ptr_id_6daed337_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_perso_link_document_id_3c9e92ba_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_personpagerelatedlink
    ADD CONSTRAINT demo_perso_link_document_id_3c9e92ba_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_personpag_feed_image_id_23c100c5_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_personpage
    ADD CONSTRAINT demo_personpag_feed_image_id_23c100c5_fk_wagtailimages_image_id FOREIGN KEY (feed_image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_personpage_br_link_id_3481da1_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_personpage
    ADD CONSTRAINT demo_personpage_br_link_id_3481da1_fk_wagtailcore_page_id FOREIGN KEY (br_link_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_personpage_image_id_661e87c9_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_personpage
    ADD CONSTRAINT demo_personpage_image_id_661e87c9_fk_wagtailimages_image_id FOREIGN KEY (image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_personpage_page_id_2d386f2e_fk_demo_personpage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_personpagerelatedlink
    ADD CONSTRAINT demo_personpage_page_id_2d386f2e_fk_demo_personpage_page_ptr_id FOREIGN KEY (page_id) REFERENCES demo_personpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_personpage_page_ptr_id_370def1f_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_personpage
    ADD CONSTRAINT demo_personpage_page_ptr_id_370def1f_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_personpagerel_link_page_id_3a20f1a0_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_personpagerelatedlink
    ADD CONSTRAINT demo_personpagerel_link_page_id_3a20f1a0_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_sta_page_id_6572fde5_fk_demo_standardindexpage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_standardindexpagerelatedlink
    ADD CONSTRAINT demo_sta_page_id_6572fde5_fk_demo_standardindexpage_page_ptr_id FOREIGN KEY (page_id) REFERENCES demo_standardindexpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_stand_link_document_id_2f1935fd_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_standardindexpagerelatedlink
    ADD CONSTRAINT demo_stand_link_document_id_2f1935fd_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_stand_link_document_id_5133ac0f_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_standardpagecarouselitem
    ADD CONSTRAINT demo_stand_link_document_id_5133ac0f_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_stand_link_document_id_5e375d6c_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_standardpagerelatedlink
    ADD CONSTRAINT demo_stand_link_document_id_5e375d6c_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_standard_page_id_4b572554_fk_demo_standardpage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_standardpagerelatedlink
    ADD CONSTRAINT demo_standard_page_id_4b572554_fk_demo_standardpage_page_ptr_id FOREIGN KEY (page_id) REFERENCES demo_standardpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_standard_page_id_7bed0c09_fk_demo_standardpage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_standardpagecarouselitem
    ADD CONSTRAINT demo_standard_page_id_7bed0c09_fk_demo_standardpage_page_ptr_id FOREIGN KEY (page_id) REFERENCES demo_standardpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_standardi_feed_image_id_50c3d67c_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_standardindexpage
    ADD CONSTRAINT demo_standardi_feed_image_id_50c3d67c_fk_wagtailimages_image_id FOREIGN KEY (feed_image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_standardindex_link_page_id_670688e3_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_standardindexpagerelatedlink
    ADD CONSTRAINT demo_standardindex_link_page_id_670688e3_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_standardindexp_page_ptr_id_79913e1a_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_standardindexpage
    ADD CONSTRAINT demo_standardindexp_page_ptr_id_79913e1a_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_standardindexpag_br_link_id_1aeefa8_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_standardindexpage
    ADD CONSTRAINT demo_standardindexpag_br_link_id_1aeefa8_fk_wagtailcore_page_id FOREIGN KEY (br_link_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_standardp_feed_image_id_1b75b27f_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_standardpage
    ADD CONSTRAINT demo_standardp_feed_image_id_1b75b27f_fk_wagtailimages_image_id FOREIGN KEY (feed_image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_standardpage_br_link_id_4c137da3_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_standardpage
    ADD CONSTRAINT demo_standardpage_br_link_id_4c137da3_fk_wagtailcore_page_id FOREIGN KEY (br_link_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_standardpage_page_ptr_id_7488c425_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_standardpage
    ADD CONSTRAINT demo_standardpage_page_ptr_id_7488c425_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_standardpagec_link_page_id_43e76a29_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_standardpagecarouselitem
    ADD CONSTRAINT demo_standardpagec_link_page_id_43e76a29_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_standardpageca_image_id_2de3b3a8_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_standardpagecarouselitem
    ADD CONSTRAINT demo_standardpageca_image_id_2de3b3a8_fk_wagtailimages_image_id FOREIGN KEY (image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: demo_standardpager_link_page_id_3219ecae_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY demo_standardpagerelatedlink
    ADD CONSTRAINT demo_standardpager_link_page_id_3219ecae_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_content_type_id_5151027a_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_5151027a_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_1c5f563_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_1c5f563_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_tagged_content_type_id_5c3ec8f_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY taggit_taggeditem
    ADD CONSTRAINT taggit_tagged_content_type_id_5c3ec8f_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem_tag_id_d95e0d2_fk_taggit_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_tag_id_d95e0d2_fk_taggit_tag_id FOREIGN KEY (tag_id) REFERENCES taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore__content_type_id_534ebab2_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_page
    ADD CONSTRAINT wagtailcore__content_type_id_534ebab2_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_grouppageper_page_id_579bb7c_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppageper_page_id_579bb7c_fk_wagtailcore_page_id FOREIGN KEY (page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_grouppagepermiss_group_id_46d04d93_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppagepermiss_group_id_46d04d93_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_page_owner_id_767b30bc_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_owner_id_767b30bc_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_pagerevisio_page_id_3676feba_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_pagerevision
    ADD CONSTRAINT wagtailcore_pagerevisio_page_id_3676feba_fk_wagtailcore_page_id FOREIGN KEY (page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_pagerevision_user_id_1a218402_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_pagerevision
    ADD CONSTRAINT wagtailcore_pagerevision_user_id_1a218402_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_pageviewres_page_id_69258013_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_pageviewrestriction
    ADD CONSTRAINT wagtailcore_pageviewres_page_id_69258013_fk_wagtailcore_page_id FOREIGN KEY (page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_site_root_page_id_1fc080d7_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_site
    ADD CONSTRAINT wagtailcore_site_root_page_id_1fc080d7_fk_wagtailcore_page_id FOREIGN KEY (root_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtaildocs_docume_uploaded_by_user_id_69f4ec20_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtaildocs_document
    ADD CONSTRAINT wagtaildocs_docume_uploaded_by_user_id_69f4ec20_fk_auth_user_id FOREIGN KEY (uploaded_by_user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailforms_formsubmis_page_id_469192df_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailforms_formsubmission
    ADD CONSTRAINT wagtailforms_formsubmis_page_id_469192df_fk_wagtailcore_page_id FOREIGN KEY (page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailimages_imag_uploaded_by_user_id_181967a6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailimages_image
    ADD CONSTRAINT wagtailimages_imag_uploaded_by_user_id_181967a6_fk_auth_user_id FOREIGN KEY (uploaded_by_user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailimages_rend_filter_id_4fa1f7f_fk_wagtailimages_filter_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailimages_rendition
    ADD CONSTRAINT wagtailimages_rend_filter_id_4fa1f7f_fk_wagtailimages_filter_id FOREIGN KEY (filter_id) REFERENCES wagtailimages_filter(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailimages_rendi_image_id_4ebd24db_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailimages_rendition
    ADD CONSTRAINT wagtailimages_rendi_image_id_4ebd24db_fk_wagtailimages_image_id FOREIGN KEY (image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailredirec_redirect_page_id_195b3223_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailredirects_redirect
    ADD CONSTRAINT wagtailredirec_redirect_page_id_195b3223_fk_wagtailcore_page_id FOREIGN KEY (redirect_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailredirects_redire_site_id_40306d19_fk_wagtailcore_site_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailredirects_redirect
    ADD CONSTRAINT wagtailredirects_redire_site_id_40306d19_fk_wagtailcore_site_id FOREIGN KEY (site_id) REFERENCES wagtailcore_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailsearch_editor_query_id_c9e69bd_fk_wagtailsearch_query_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailsearch_editorspick
    ADD CONSTRAINT wagtailsearch_editor_query_id_c9e69bd_fk_wagtailsearch_query_id FOREIGN KEY (query_id) REFERENCES wagtailsearch_query(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailsearch_editorspi_page_id_50c44c9b_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailsearch_editorspick
    ADD CONSTRAINT wagtailsearch_editorspi_page_id_50c44c9b_fk_wagtailcore_page_id FOREIGN KEY (page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailsearch_query_query_id_4ca8351a_fk_wagtailsearch_query_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailsearch_querydailyhits
    ADD CONSTRAINT wagtailsearch_query_query_id_4ca8351a_fk_wagtailsearch_query_id FOREIGN KEY (query_id) REFERENCES wagtailsearch_query(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailusers_userprofile_user_id_6672458f_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailusers_userprofile
    ADD CONSTRAINT wagtailusers_userprofile_user_id_6672458f_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

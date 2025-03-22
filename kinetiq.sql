--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: accounting; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA accounting;


ALTER SCHEMA accounting OWNER TO postgres;

--
-- Name: admin; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA admin;


ALTER SCHEMA admin OWNER TO postgres;

--
-- Name: distribution; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA distribution;


ALTER SCHEMA distribution OWNER TO postgres;

--
-- Name: finance; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA finance;


ALTER SCHEMA finance OWNER TO postgres;

--
-- Name: human_resources; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA human_resources;


ALTER SCHEMA human_resources OWNER TO postgres;

--
-- Name: inventory; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA inventory;


ALTER SCHEMA inventory OWNER TO postgres;

--
-- Name: management; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA management;


ALTER SCHEMA management OWNER TO postgres;

--
-- Name: mrp; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA mrp;


ALTER SCHEMA mrp OWNER TO postgres;

--
-- Name: operations; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA operations;


ALTER SCHEMA operations OWNER TO postgres;

--
-- Name: production; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA production;


ALTER SCHEMA production OWNER TO postgres;

--
-- Name: project_management; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA project_management;


ALTER SCHEMA project_management OWNER TO postgres;

--
-- Name: purchasing; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA purchasing;


ALTER SCHEMA purchasing OWNER TO postgres;

--
-- Name: sales; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA sales;


ALTER SCHEMA sales OWNER TO postgres;

--
-- Name: services; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA services;


ALTER SCHEMA services OWNER TO postgres;

--
-- Name: solution_customizing; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA solution_customizing;


ALTER SCHEMA solution_customizing OWNER TO postgres;

--
-- Name: access_level; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.access_level AS ENUM (
    'Full Access',
    'Read-Only'
);


ALTER TYPE public.access_level OWNER TO postgres;

--
-- Name: agreement_method_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.agreement_method_enum AS ENUM (
    'Written',
    'Oral',
    'Electronic'
);


ALTER TYPE public.agreement_method_enum OWNER TO postgres;

--
-- Name: agreement_status_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.agreement_status_enum AS ENUM (
    'Active',
    'Expired',
    'Cancelled'
);


ALTER TYPE public.agreement_status_enum OWNER TO postgres;

--
-- Name: approval_status_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.approval_status_type AS ENUM (
    'Pending',
    'Approved',
    'Rejected'
);


ALTER TYPE public.approval_status_type OWNER TO postgres;

--
-- Name: availability_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.availability_status AS ENUM (
    'Available',
    'Out of Order',
    'Under Maintenance'
);


ALTER TYPE public.availability_status OWNER TO postgres;

--
-- Name: campaign_status_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.campaign_status_enum AS ENUM (
    'Planned',
    'Active',
    'Completed'
);


ALTER TYPE public.campaign_status_enum OWNER TO postgres;

--
-- Name: campaign_type_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.campaign_type_enum AS ENUM (
    'Email',
    'Social Media',
    'Referral',
    'Advertisement'
);


ALTER TYPE public.campaign_type_enum OWNER TO postgres;

--
-- Name: customer_type_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.customer_type_enum AS ENUM (
    'Lead',
    'Prospect',
    'Client'
);


ALTER TYPE public.customer_type_enum OWNER TO postgres;

--
-- Name: delivery_status_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.delivery_status_enum AS ENUM (
    'Pending',
    'Shipped',
    'Delivered',
    'Returned'
);


ALTER TYPE public.delivery_status_enum OWNER TO postgres;

--
-- Name: demand_level_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.demand_level_enum AS ENUM (
    'Low',
    'Medium',
    'High',
    'Very High',
    'Seasonal'
);


ALTER TYPE public.demand_level_enum OWNER TO postgres;

--
-- Name: document_type_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.document_type_enum AS ENUM (
    'GRPO',
    'Removal_Request',
    'Goods_Issue',
    'Rework_Order',
    'Goods_Receipt'
);


ALTER TYPE public.document_type_enum OWNER TO postgres;

--
-- Name: employment_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.employment_type AS ENUM (
    'fixed-term',
    'temporary employment',
    'freelance',
    'internships'
);


ALTER TYPE public.employment_type OWNER TO postgres;

--
-- Name: inspection_result; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.inspection_result AS ENUM (
    'Pass',
    'Fail'
);


ALTER TYPE public.inspection_result OWNER TO postgres;

--
-- Name: intrnl_project_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.intrnl_project_status AS ENUM (
    'not started',
    'in progress',
    'completed'
);


ALTER TYPE public.intrnl_project_status OWNER TO postgres;

--
-- Name: intrnl_task_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.intrnl_task_status AS ENUM (
    'pending',
    'in_progress',
    'completed',
    'canceled'
);


ALTER TYPE public.intrnl_task_status OWNER TO postgres;

--
-- Name: inventory_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.inventory_status AS ENUM (
    'Open',
    'In Progress',
    'Completed',
    'Closed',
    'Cancelled'
);


ALTER TYPE public.inventory_status OWNER TO postgres;

--
-- Name: inventory_time_period; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.inventory_time_period AS ENUM (
    'weekly',
    'monthly',
    'quarterly',
    'yearly'
);


ALTER TYPE public.inventory_time_period OWNER TO postgres;

--
-- Name: invoice_status_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.invoice_status_enum AS ENUM (
    'Pending',
    'Paid',
    'Overdue'
);


ALTER TYPE public.invoice_status_enum OWNER TO postgres;

--
-- Name: item_status_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.item_status_enum AS ENUM (
    'On Order',
    'Committed',
    'Available'
);


ALTER TYPE public.item_status_enum OWNER TO postgres;

--
-- Name: item_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.item_type AS ENUM (
    'Raw Material',
    'Asset',
    'Product'
);


ALTER TYPE public.item_type OWNER TO postgres;

--
-- Name: lead_source_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.lead_source_enum AS ENUM (
    'Website',
    'Referral',
    'Cold Call',
    'Email'
);


ALTER TYPE public.lead_source_enum OWNER TO postgres;

--
-- Name: lead_status_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.lead_status_enum AS ENUM (
    'New',
    'Contacted',
    'Qualified',
    'Converted',
    'Lost'
);


ALTER TYPE public.lead_status_enum OWNER TO postgres;

--
-- Name: module_request_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.module_request_enum AS ENUM (
    'Accounting',
    'Admin',
    'Distribution',
    'Finance',
    'Human Resources',
    'Inventory',
    'Management',
    'MRP',
    'Operations',
    'Production',
    'Project Management',
    'Purchasing',
    'Sales',
    'Services'
);


ALTER TYPE public.module_request_enum OWNER TO postgres;

--
-- Name: opportunity_stage_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.opportunity_stage_enum AS ENUM (
    'Prospecting',
    'Negotiation',
    'Closed'
);


ALTER TYPE public.opportunity_stage_enum OWNER TO postgres;

--
-- Name: opportunity_status_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.opportunity_status_enum AS ENUM (
    'Open',
    'Won',
    'Lost'
);


ALTER TYPE public.opportunity_status_enum OWNER TO postgres;

--
-- Name: order_status_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.order_status_enum AS ENUM (
    'Pending',
    'Processed',
    'Shipped',
    'Delivered',
    'Cancelled'
);


ALTER TYPE public.order_status_enum OWNER TO postgres;

--
-- Name: order_status_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.order_status_type AS ENUM (
    'Created',
    'Approved',
    'Rejected'
);


ALTER TYPE public.order_status_type OWNER TO postgres;

--
-- Name: order_type_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.order_type_enum AS ENUM (
    'Direct',
    'Scheduled',
    'Open',
    'D3 Sample'
);


ALTER TYPE public.order_type_enum OWNER TO postgres;

--
-- Name: organization_type_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.organization_type_enum AS ENUM (
    'Corporation',
    'LLC',
    'Sole Proprietorship',
    'Partnership',
    'Nonprofit'
);


ALTER TYPE public.organization_type_enum OWNER TO postgres;

--
-- Name: packing_status_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.packing_status_type AS ENUM (
    'Pending',
    'Packed',
    'Shipped'
);


ALTER TYPE public.packing_status_type OWNER TO postgres;

--
-- Name: packing_type_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.packing_type_enum AS ENUM (
    'Box',
    'Bubble Wrap',
    'Crate'
);


ALTER TYPE public.packing_type_enum OWNER TO postgres;

--
-- Name: partner_category; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.partner_category AS ENUM (
    'Employee',
    'Customer',
    'Vendor'
);


ALTER TYPE public.partner_category OWNER TO postgres;

--
-- Name: payment_method_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.payment_method_enum AS ENUM (
    'Credit Card',
    'Bank Transfer',
    'Cash'
);


ALTER TYPE public.payment_method_enum OWNER TO postgres;

--
-- Name: payment_status_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.payment_status_enum AS ENUM (
    'Pending',
    'Completed',
    'Failed'
);


ALTER TYPE public.payment_status_enum OWNER TO postgres;

--
-- Name: picked_status_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.picked_status_type AS ENUM (
    'Not Started',
    'In Progress',
    'Completed'
);


ALTER TYPE public.picked_status_type OWNER TO postgres;

--
-- Name: prod_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.prod_status AS ENUM (
    'Pending',
    'In Progress',
    'Completed',
    'Cancelled'
);


ALTER TYPE public.prod_status OWNER TO postgres;

--
-- Name: project_based_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.project_based_type AS ENUM (
    'Project Based',
    'Non-Project Based'
);


ALTER TYPE public.project_based_type OWNER TO postgres;

--
-- Name: project_budget_approval; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.project_budget_approval AS ENUM (
    'approved',
    'denied'
);


ALTER TYPE public.project_budget_approval OWNER TO postgres;

--
-- Name: project_milestone; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.project_milestone AS ENUM (
    'planning',
    'awaiting_approval',
    'manufacturing',
    'deployment',
    'installation',
    'completed'
);


ALTER TYPE public.project_milestone OWNER TO postgres;

--
-- Name: project_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.project_status AS ENUM (
    'not started',
    'in progress',
    'completed'
);


ALTER TYPE public.project_status OWNER TO postgres;

--
-- Name: project_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.project_type AS ENUM (
    'plans',
    'changes',
    'trainings'
);


ALTER TYPE public.project_type OWNER TO postgres;

--
-- Name: purchase_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.purchase_status AS ENUM (
    'Pending',
    'Approved',
    'Rejected',
    'Completed'
);


ALTER TYPE public.purchase_status OWNER TO postgres;

--
-- Name: quotation_status_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.quotation_status_enum AS ENUM (
    'Pending',
    'Approved',
    'Rejected'
);


ALTER TYPE public.quotation_status_enum OWNER TO postgres;

--
-- Name: quotation_type_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.quotation_type_enum AS ENUM (
    'Project-Based',
    'Non-Project-Based',
    'Service'
);


ALTER TYPE public.quotation_type_enum OWNER TO postgres;

--
-- Name: receipt_status_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.receipt_status_type AS ENUM (
    'Pending',
    'Received',
    'Rejected'
);


ALTER TYPE public.receipt_status_type OWNER TO postgres;

--
-- Name: rejection_status_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.rejection_status_type AS ENUM (
    'Pending',
    'Confirmed',
    'Resolved'
);


ALTER TYPE public.rejection_status_type OWNER TO postgres;

--
-- Name: renewal_status_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.renewal_status_enum AS ENUM (
    'Pending',
    'Approved',
    'Rejected'
);


ALTER TYPE public.renewal_status_enum OWNER TO postgres;

--
-- Name: request_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.request_type AS ENUM (
    'Material Request',
    'Finished Goods Request'
);


ALTER TYPE public.request_type OWNER TO postgres;

--
-- Name: resolution_status_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.resolution_status_type AS ENUM (
    'Pending',
    'Resolved'
);


ALTER TYPE public.resolution_status_type OWNER TO postgres;

--
-- Name: response_status_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.response_status_enum AS ENUM (
    'Interested',
    'Not Interested',
    'Pending'
);


ALTER TYPE public.response_status_enum OWNER TO postgres;

--
-- Name: return_status_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.return_status_enum AS ENUM (
    'Requested',
    'Approved',
    'Rejected',
    'Processed',
    'Refunded'
);


ALTER TYPE public.return_status_enum OWNER TO postgres;

--
-- Name: rework_status_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.rework_status_type AS ENUM (
    'Pending',
    'In Progress',
    'Completed'
);


ALTER TYPE public.rework_status_type OWNER TO postgres;

--
-- Name: service_type_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.service_type_enum AS ENUM (
    'Standard',
    'Express',
    'Same-day'
);


ALTER TYPE public.service_type_enum OWNER TO postgres;

--
-- Name: shipment_status_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.shipment_status_type AS ENUM (
    'Failed',
    'Pending',
    'Shipped',
    'Delivered'
);


ALTER TYPE public.shipment_status_type OWNER TO postgres;

--
-- Name: shipping_method_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.shipping_method_enum AS ENUM (
    'Standard',
    'Express',
    'Overnight',
    'Same-Day',
    'International',
    'Local'
);


ALTER TYPE public.shipping_method_enum OWNER TO postgres;

--
-- Name: status_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.status_enum AS ENUM (
    'Active',
    'Inactive',
    'Blocked'
);


ALTER TYPE public.status_enum OWNER TO postgres;

--
-- Name: task_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.task_status AS ENUM (
    'pending',
    'in_progress',
    'completed',
    'canceled'
);


ALTER TYPE public.task_status OWNER TO postgres;

--
-- Name: tax_type_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.tax_type_enum AS ENUM (
    'Sales Tax',
    'VAT',
    'Service Tax'
);


ALTER TYPE public.tax_type_enum OWNER TO postgres;

--
-- Name: ticket_priority_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.ticket_priority_enum AS ENUM (
    'Low',
    'Medium',
    'High',
    'Urgent'
);


ALTER TYPE public.ticket_priority_enum OWNER TO postgres;

--
-- Name: ticket_status_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.ticket_status_enum AS ENUM (
    'Open',
    'In Progress',
    'Closed'
);


ALTER TYPE public.ticket_status_enum OWNER TO postgres;

--
-- Name: unit_of_measure; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.unit_of_measure AS ENUM (
    'kg',
    'sh',
    'bx',
    'L',
    'm',
    'gal',
    'pcs',
    'set',
    'mm',
    'unit'
);


ALTER TYPE public.unit_of_measure OWNER TO postgres;

--
-- Name: user_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.user_status AS ENUM (
    'Active',
    'Inactive'
);


ALTER TYPE public.user_status OWNER TO postgres;

--
-- Name: user_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.user_type AS ENUM (
    'Customer',
    'Employee'
);


ALTER TYPE public.user_type OWNER TO postgres;

--
-- Name: vendor_application_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.vendor_application_status AS ENUM (
    'Pending',
    'Approved',
    'Rejected'
);


ALTER TYPE public.vendor_application_status OWNER TO postgres;

--
-- Name: yes_no_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.yes_no_type AS ENUM (
    'Yes',
    'No'
);


ALTER TYPE public.yes_no_type OWNER TO postgres;

--
-- Name: generate_account_id(); Type: FUNCTION; Schema: accounting; Owner: postgres
--

CREATE FUNCTION accounting.generate_account_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'COA'; 
    module_name TEXT := 'ACCOUNTING';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.account_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION accounting.generate_account_id() OWNER TO postgres;

--
-- Name: generate_currency_id(); Type: FUNCTION; Schema: accounting; Owner: postgres
--

CREATE FUNCTION accounting.generate_currency_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'CUR'; 
    module_name TEXT := 'ACCOUNTING';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.currency_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION accounting.generate_currency_id() OWNER TO postgres;

--
-- Name: generate_entry_line_id(); Type: FUNCTION; Schema: accounting; Owner: postgres
--

CREATE FUNCTION accounting.generate_entry_line_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'JEL'; 
    module_name TEXT := 'ACCOUNTING';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.entry_line_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION accounting.generate_entry_line_id() OWNER TO postgres;

--
-- Name: generate_gl_account_id(); Type: FUNCTION; Schema: accounting; Owner: postgres
--

CREATE FUNCTION accounting.generate_gl_account_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'GLA'; 
    module_name TEXT := 'ACCOUNTING';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.gl_account_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION accounting.generate_gl_account_id() OWNER TO postgres;

--
-- Name: generate_journal_id(); Type: FUNCTION; Schema: accounting; Owner: postgres
--

CREATE FUNCTION accounting.generate_journal_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'JOE'; 
    module_name TEXT := 'accounting';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.journal_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION accounting.generate_journal_id() OWNER TO postgres;

--
-- Name: generate_asset_id(); Type: FUNCTION; Schema: admin; Owner: postgres
--

CREATE FUNCTION admin.generate_asset_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'ASSET'; 
    module_name TEXT := 'ADMIN';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.asset_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION admin.generate_asset_id() OWNER TO postgres;

--
-- Name: generate_item_id(); Type: FUNCTION; Schema: admin; Owner: postgres
--

CREATE FUNCTION admin.generate_item_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'ITEM'; 
    module_name TEXT := 'ADMIN';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.item_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION admin.generate_item_id() OWNER TO postgres;

--
-- Name: generate_log_id(); Type: FUNCTION; Schema: admin; Owner: postgres
--

CREATE FUNCTION admin.generate_log_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'LOG'; 
    module_name TEXT := 'ADMIN';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.log_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION admin.generate_log_id() OWNER TO postgres;

--
-- Name: generate_material_id(); Type: FUNCTION; Schema: admin; Owner: postgres
--

CREATE FUNCTION admin.generate_material_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'MATERIAL'; 
    module_name TEXT := 'ADMIN';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.material_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION admin.generate_material_id() OWNER TO postgres;

--
-- Name: generate_partner_id(); Type: FUNCTION; Schema: admin; Owner: postgres
--

CREATE FUNCTION admin.generate_partner_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'PARTNER'; 
    module_name TEXT := 'ADMIN';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.partner_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION admin.generate_partner_id() OWNER TO postgres;

--
-- Name: generate_policy_id(); Type: FUNCTION; Schema: admin; Owner: postgres
--

CREATE FUNCTION admin.generate_policy_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'POLICY'; 
    module_name TEXT := 'ADMIN';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.policy_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION admin.generate_policy_id() OWNER TO postgres;

--
-- Name: generate_product_id(); Type: FUNCTION; Schema: admin; Owner: postgres
--

CREATE FUNCTION admin.generate_product_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'PROD'; 
    module_name TEXT := 'ADMIN';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.product_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION admin.generate_product_id() OWNER TO postgres;

--
-- Name: generate_role_id(); Type: FUNCTION; Schema: admin; Owner: postgres
--

CREATE FUNCTION admin.generate_role_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'ROLE'; 
    module_name TEXT := 'ADMIN';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.role_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION admin.generate_role_id() OWNER TO postgres;

--
-- Name: generate_user_id(); Type: FUNCTION; Schema: admin; Owner: postgres
--

CREATE FUNCTION admin.generate_user_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'USER'; 
    module_name TEXT := 'ADMIN';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.user_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION admin.generate_user_id() OWNER TO postgres;

--
-- Name: generate_vendor_code(); Type: FUNCTION; Schema: admin; Owner: postgres
--

CREATE FUNCTION admin.generate_vendor_code() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'VENDOR'; 
    module_name TEXT := 'ADMIN';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.vendor_code := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION admin.generate_vendor_code() OWNER TO postgres;

--
-- Name: generate_warehouse_id(); Type: FUNCTION; Schema: admin; Owner: postgres
--

CREATE FUNCTION admin.generate_warehouse_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'WARE'; 
    module_name TEXT := 'ADMIN';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.warehouse_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION admin.generate_warehouse_id() OWNER TO postgres;

--
-- Name: generate_approval_request_id(); Type: FUNCTION; Schema: distribution; Owner: postgres
--

CREATE FUNCTION distribution.generate_approval_request_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'LOR'; 
    module_name TEXT := 'DIS';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.approval_request_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION distribution.generate_approval_request_id() OWNER TO postgres;

--
-- Name: generate_billing_goods_issue_id(); Type: FUNCTION; Schema: distribution; Owner: postgres
--

CREATE FUNCTION distribution.generate_billing_goods_issue_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'GI'; 
    module_name TEXT := 'DIS';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.goods_issue_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION distribution.generate_billing_goods_issue_id() OWNER TO postgres;

--
-- Name: generate_billing_receipt_id(); Type: FUNCTION; Schema: distribution; Owner: postgres
--

CREATE FUNCTION distribution.generate_billing_receipt_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'BR'; 
    module_name TEXT := 'DIS';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.receipt_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION distribution.generate_billing_receipt_id() OWNER TO postgres;

--
-- Name: generate_carrier_id(); Type: FUNCTION; Schema: distribution; Owner: postgres
--

CREATE FUNCTION distribution.generate_carrier_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'CAR'; 
    module_name TEXT := 'DIS';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.carrier_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION distribution.generate_carrier_id() OWNER TO postgres;

--
-- Name: generate_delivery_order_id(); Type: FUNCTION; Schema: distribution; Owner: postgres
--

CREATE FUNCTION distribution.generate_delivery_order_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'DO'; 
    module_name TEXT := 'DIS';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.delivery_order_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION distribution.generate_delivery_order_id() OWNER TO postgres;

--
-- Name: generate_delivery_receipt_id(); Type: FUNCTION; Schema: distribution; Owner: postgres
--

CREATE FUNCTION distribution.generate_delivery_receipt_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'DR'; 
    module_name TEXT := 'DIS';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.delivery_receipt_id:= module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION distribution.generate_delivery_receipt_id() OWNER TO postgres;

--
-- Name: generate_failed_shipment_id(); Type: FUNCTION; Schema: distribution; Owner: postgres
--

CREATE FUNCTION distribution.generate_failed_shipment_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'FS'; 
    module_name TEXT := 'DIS';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.failed_shipment_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION distribution.generate_failed_shipment_id() OWNER TO postgres;

--
-- Name: generate_operational_cost_id(); Type: FUNCTION; Schema: distribution; Owner: postgres
--

CREATE FUNCTION distribution.generate_operational_cost_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'OS'; 
    module_name TEXT := 'DIS';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.operational_cost_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION distribution.generate_operational_cost_id() OWNER TO postgres;

--
-- Name: generate_packing_cost_id(); Type: FUNCTION; Schema: distribution; Owner: postgres
--

CREATE FUNCTION distribution.generate_packing_cost_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'PC'; 
    module_name TEXT := 'DIS';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.packing_cost_id  := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION distribution.generate_packing_cost_id() OWNER TO postgres;

--
-- Name: generate_packing_list_id(); Type: FUNCTION; Schema: distribution; Owner: postgres
--

CREATE FUNCTION distribution.generate_packing_list_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'PC'; 
    module_name TEXT := 'DIS';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.packing_list_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION distribution.generate_packing_list_id() OWNER TO postgres;

--
-- Name: generate_picking_list_id(); Type: FUNCTION; Schema: distribution; Owner: postgres
--

CREATE FUNCTION distribution.generate_picking_list_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'PIL'; 
    module_name TEXT := 'DIS';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.approval_request_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION distribution.generate_picking_list_id() OWNER TO postgres;

--
-- Name: generate_rejection_id(); Type: FUNCTION; Schema: distribution; Owner: postgres
--

CREATE FUNCTION distribution.generate_rejection_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'REJ'; 
    module_name TEXT := 'DIS';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.rejection_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION distribution.generate_rejection_id() OWNER TO postgres;

--
-- Name: generate_rework_id(); Type: FUNCTION; Schema: distribution; Owner: postgres
--

CREATE FUNCTION distribution.generate_rework_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'RO'; 
    module_name TEXT := 'DIS';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.rework_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION distribution.generate_rework_id() OWNER TO postgres;

--
-- Name: generate_shipping_cost_id(); Type: FUNCTION; Schema: distribution; Owner: postgres
--

CREATE FUNCTION distribution.generate_shipping_cost_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'SC'; 
    module_name TEXT := 'DIS';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.shipping_cost_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION distribution.generate_shipping_cost_id() OWNER TO postgres;

--
-- Name: generate_validation_id(); Type: FUNCTION; Schema: finance; Owner: postgres
--

CREATE FUNCTION finance.generate_validation_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'BUA'; 
    module_name TEXT := 'FINANCE';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.validation_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION finance.generate_validation_id() OWNER TO postgres;

--
-- Name: generate_allocation_id(); Type: FUNCTION; Schema: human_resources; Owner: postgres
--

CREATE FUNCTION human_resources.generate_allocation_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'ALLOC'; 
    module_name TEXT := 'HR';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.allocation_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION human_resources.generate_allocation_id() OWNER TO postgres;

--
-- Name: generate_attendance_id(); Type: FUNCTION; Schema: human_resources; Owner: postgres
--

CREATE FUNCTION human_resources.generate_attendance_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'ATT'; 
    module_name TEXT := 'HR';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.attendance_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION human_resources.generate_attendance_id() OWNER TO postgres;

--
-- Name: generate_candidate_id(); Type: FUNCTION; Schema: human_resources; Owner: postgres
--

CREATE FUNCTION human_resources.generate_candidate_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'CAND'; 
    module_name TEXT := 'HR';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.candidate_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION human_resources.generate_candidate_id() OWNER TO postgres;

--
-- Name: generate_department_id(); Type: FUNCTION; Schema: human_resources; Owner: postgres
--

CREATE FUNCTION human_resources.generate_department_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'DEPT'; 
    module_name TEXT := 'HR';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.dept_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION human_resources.generate_department_id() OWNER TO postgres;

--
-- Name: generate_employee_id(); Type: FUNCTION; Schema: human_resources; Owner: postgres
--

CREATE FUNCTION human_resources.generate_employee_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'EMP'; 
    module_name TEXT := 'HR';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.employee_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION human_resources.generate_employee_id() OWNER TO postgres;

--
-- Name: generate_interview_id(); Type: FUNCTION; Schema: human_resources; Owner: postgres
--

CREATE FUNCTION human_resources.generate_interview_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'INT'; 
    module_name TEXT := 'HR';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.interview_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION human_resources.generate_interview_id() OWNER TO postgres;

--
-- Name: generate_job_id(); Type: FUNCTION; Schema: human_resources; Owner: postgres
--

CREATE FUNCTION human_resources.generate_job_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'JOB'; 
    module_name TEXT := 'HR';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.job_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION human_resources.generate_job_id() OWNER TO postgres;

--
-- Name: generate_leave_id(); Type: FUNCTION; Schema: human_resources; Owner: postgres
--

CREATE FUNCTION human_resources.generate_leave_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'LV'; 
    module_name TEXT := 'HR';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.leave_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION human_resources.generate_leave_id() OWNER TO postgres;

--
-- Name: generate_payroll_id(); Type: FUNCTION; Schema: human_resources; Owner: postgres
--

CREATE FUNCTION human_resources.generate_payroll_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'PAY'; 
    module_name TEXT := 'HR';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.payroll_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION human_resources.generate_payroll_id() OWNER TO postgres;

--
-- Name: generate_performance_id(); Type: FUNCTION; Schema: human_resources; Owner: postgres
--

CREATE FUNCTION human_resources.generate_performance_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'PERF'; 
    module_name TEXT := 'HR';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.performance_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION human_resources.generate_performance_id() OWNER TO postgres;

--
-- Name: generate_salary_id(); Type: FUNCTION; Schema: human_resources; Owner: postgres
--

CREATE FUNCTION human_resources.generate_salary_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'SAL'; 
    module_name TEXT := 'HR';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.salary_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION human_resources.generate_salary_id() OWNER TO postgres;

--
-- Name: generate_adjustment_id(); Type: FUNCTION; Schema: inventory; Owner: postgres
--

CREATE FUNCTION inventory.generate_adjustment_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'IA'; 
    module_name TEXT := 'INV';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.adjustment_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION inventory.generate_adjustment_id() OWNER TO postgres;

--
-- Name: generate_deprecation_report_id(); Type: FUNCTION; Schema: inventory; Owner: postgres
--

CREATE FUNCTION inventory.generate_deprecation_report_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'DR'; 
    module_name TEXT := 'INV';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.deprecation_report_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION inventory.generate_deprecation_report_id() OWNER TO postgres;

--
-- Name: generate_inventory_count_id(); Type: FUNCTION; Schema: inventory; Owner: postgres
--

CREATE FUNCTION inventory.generate_inventory_count_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'ICC'; 
    module_name TEXT := 'INV';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.inventory_count_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION inventory.generate_inventory_count_id() OWNER TO postgres;

--
-- Name: generate_inventory_item_id(); Type: FUNCTION; Schema: inventory; Owner: postgres
--

CREATE FUNCTION inventory.generate_inventory_item_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'II'; 
    module_name TEXT := 'INV';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.inventory_item_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION inventory.generate_inventory_item_id() OWNER TO postgres;

--
-- Name: generate_item_md_id(); Type: FUNCTION; Schema: inventory; Owner: postgres
--

CREATE FUNCTION inventory.generate_item_md_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'IIMD'; 
    module_name TEXT := 'INV';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.item_md_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION inventory.generate_item_md_id() OWNER TO postgres;

--
-- Name: generate_movement_id(); Type: FUNCTION; Schema: inventory; Owner: postgres
--

CREATE FUNCTION inventory.generate_movement_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'WM'; 
    module_name TEXT := 'INV';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.movement_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION inventory.generate_movement_id() OWNER TO postgres;

--
-- Name: generate_bom_id(); Type: FUNCTION; Schema: mrp; Owner: postgres
--

CREATE FUNCTION mrp.generate_bom_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$ 
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'BOM'; 
    module_name TEXT := 'MRP';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.bom_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION mrp.generate_bom_id() OWNER TO postgres;

--
-- Name: generate_cost_id(); Type: FUNCTION; Schema: mrp; Owner: postgres
--

CREATE FUNCTION mrp.generate_cost_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$ 
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'CST'; 
    module_name TEXT := 'MRP';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.cost_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION mrp.generate_cost_id() OWNER TO postgres;

--
-- Name: generate_non_project_costing_id(); Type: FUNCTION; Schema: mrp; Owner: postgres
--

CREATE FUNCTION mrp.generate_non_project_costing_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$ 
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'NPC'; 
    module_name TEXT := 'MRP';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.non_project_costing_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION mrp.generate_non_project_costing_id() OWNER TO postgres;

--
-- Name: generate_principal_item_id(); Type: FUNCTION; Schema: mrp; Owner: postgres
--

CREATE FUNCTION mrp.generate_principal_item_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$ 
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'PI'; 
    module_name TEXT := 'MRP';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.principal_item_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION mrp.generate_principal_item_id() OWNER TO postgres;

--
-- Name: generate_content_id(); Type: FUNCTION; Schema: operations; Owner: postgres
--

CREATE FUNCTION operations.generate_content_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'DOI'; 
    module_name TEXT := 'OPERATIONS';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.content_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION operations.generate_content_id() OWNER TO postgres;

--
-- Name: generate_document_id(); Type: FUNCTION; Schema: operations; Owner: postgres
--

CREATE FUNCTION operations.generate_document_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'DOH'; 
    module_name TEXT := 'OPERATIONS';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.document_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION operations.generate_document_id() OWNER TO postgres;

--
-- Name: generate_external_id(); Type: FUNCTION; Schema: operations; Owner: postgres
--

CREATE FUNCTION operations.generate_external_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'EXM'; 
    module_name TEXT := 'OPERATIONS';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.external_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION operations.generate_external_id() OWNER TO postgres;

--
-- Name: generate_productdocu_id(); Type: FUNCTION; Schema: operations; Owner: postgres
--

CREATE FUNCTION operations.generate_productdocu_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'PDI'; 
    module_name TEXT := 'OPERATIONS';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.productdocu_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION operations.generate_productdocu_id() OWNER TO postgres;

--
-- Name: generate_serial_id(); Type: FUNCTION; Schema: operations; Owner: postgres
--

CREATE FUNCTION operations.generate_serial_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'SET'; 
    module_name TEXT := 'OPERATIONS';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.serial_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION operations.generate_serial_id() OWNER TO postgres;

--
-- Name: generate_component_id(); Type: FUNCTION; Schema: production; Owner: postgres
--

CREATE FUNCTION production.generate_component_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$ 
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'CMP'; 
    module_name TEXT := 'PROD';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.component_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION production.generate_component_id() OWNER TO postgres;

--
-- Name: generate_delivery_request_id(); Type: FUNCTION; Schema: production; Owner: postgres
--

CREATE FUNCTION production.generate_delivery_request_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$ 
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'DR'; 
    module_name TEXT := 'PROD';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.delivery_request_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION production.generate_delivery_request_id() OWNER TO postgres;

--
-- Name: generate_equipment_id(); Type: FUNCTION; Schema: production; Owner: postgres
--

CREATE FUNCTION production.generate_equipment_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$ 
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'EQP'; 
    module_name TEXT := 'PROD';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.equipment_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION production.generate_equipment_id() OWNER TO postgres;

--
-- Name: generate_labor_id(); Type: FUNCTION; Schema: production; Owner: postgres
--

CREATE FUNCTION production.generate_labor_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$ 
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'LAB'; 
    module_name TEXT := 'PROD';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.labor_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION production.generate_labor_id() OWNER TO postgres;

--
-- Name: generate_production_order_detail_id(); Type: FUNCTION; Schema: production; Owner: postgres
--

CREATE FUNCTION production.generate_production_order_detail_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$ 
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'POD'; 
    module_name TEXT := 'PROD';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.production_order_detail_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION production.generate_production_order_detail_id() OWNER TO postgres;

--
-- Name: generate_production_order_id(); Type: FUNCTION; Schema: production; Owner: postgres
--

CREATE FUNCTION production.generate_production_order_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$ 
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'PO'; 
    module_name TEXT := 'PROD';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.production_order_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION production.generate_production_order_id() OWNER TO postgres;

--
-- Name: generate_contractual_worker_request_id(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.generate_contractual_worker_request_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'CWR'; 
    module_name TEXT := 'PROJ';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.request_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.generate_contractual_worker_request_id() OWNER TO postgres;

--
-- Name: generate_external_project_details_id(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.generate_external_project_details_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'EPD'; 
    module_name TEXT := UPPER(LEFT('project_management', 4));          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.project_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;

    RETURN NEW;
END;
$$;


ALTER FUNCTION public.generate_external_project_details_id() OWNER TO postgres;

--
-- Name: generate_external_project_labor_id(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.generate_external_project_labor_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'EPL'; 
    module_name TEXT := UPPER(LEFT('project_management', 4));          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.project_labor_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;

    RETURN NEW;
END;
$$;


ALTER FUNCTION public.generate_external_project_labor_id() OWNER TO postgres;

--
-- Name: generate_external_project_request_id(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.generate_external_project_request_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'EPR'; 
    module_name TEXT := UPPER(LEFT('project_management', 4));          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.ext_project_request_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;

    RETURN NEW;
END;
$$;


ALTER FUNCTION public.generate_external_project_request_id() OWNER TO postgres;

--
-- Name: generate_external_project_resources_id(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.generate_external_project_resources_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'EPRM'; 
    module_name TEXT := 'PROJ';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.project_resources_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.generate_external_project_resources_id() OWNER TO postgres;

--
-- Name: generate_external_project_task_id(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.generate_external_project_task_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'EPT'; 
    module_name TEXT := 'PROJ';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.task_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.generate_external_project_task_id() OWNER TO postgres;

--
-- Name: generate_external_project_tracking_id(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.generate_external_project_tracking_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'EPTK'; 
    module_name TEXT := 'PROJ';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.project_tracking_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.generate_external_project_tracking_id() OWNER TO postgres;

--
-- Name: generate_external_project_warranty_id(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.generate_external_project_warranty_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'EPW'; 
    module_name TEXT := 'PROJ';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.project_warranty_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.generate_external_project_warranty_id() OWNER TO postgres;

--
-- Name: generate_internal_project_details_id(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.generate_internal_project_details_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'IPD'; 
    module_name TEXT := 'PROJ';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.intrnl_project_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.generate_internal_project_details_id() OWNER TO postgres;

--
-- Name: generate_internal_project_labor_id(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.generate_internal_project_labor_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'IPL'; 
    module_name TEXT := 'PROJ';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.intrnl_project_labor_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.generate_internal_project_labor_id() OWNER TO postgres;

--
-- Name: generate_internal_project_request_id(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.generate_internal_project_request_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'IPR'; 
    module_name TEXT := 'PROJ';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.project_request_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.generate_internal_project_request_id() OWNER TO postgres;

--
-- Name: generate_internal_project_task_id(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.generate_internal_project_task_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'IPT'; 
    module_name TEXT := 'PROJ';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.intrnl_task_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.generate_internal_project_task_id() OWNER TO postgres;

--
-- Name: generate_internal_project_tracking_id(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.generate_internal_project_tracking_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'IPT'; 
    module_name TEXT := 'PROJ';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.intrnl_project_tracking_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.generate_internal_project_tracking_id() OWNER TO postgres;

--
-- Name: generate_application_reference(); Type: FUNCTION; Schema: purchasing; Owner: postgres
--

CREATE FUNCTION purchasing.generate_application_reference() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'VEP'; 
    module_name TEXT := 'PURCHASING';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.application_reference := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION purchasing.generate_application_reference() OWNER TO postgres;

--
-- Name: generate_credit_memo_id(); Type: FUNCTION; Schema: purchasing; Owner: postgres
--

CREATE FUNCTION purchasing.generate_credit_memo_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'CRM'; 
    module_name TEXT := 'PURCHASING';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.credit_memo_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION purchasing.generate_credit_memo_id() OWNER TO postgres;

--
-- Name: generate_inspection_id(); Type: FUNCTION; Schema: purchasing; Owner: postgres
--

CREATE FUNCTION purchasing.generate_inspection_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'BAI'; 
    module_name TEXT := 'PURCHASING';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.inspection_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION purchasing.generate_inspection_id() OWNER TO postgres;

--
-- Name: generate_invoice_id(); Type: FUNCTION; Schema: purchasing; Owner: postgres
--

CREATE FUNCTION purchasing.generate_invoice_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'PUI'; 
    module_name TEXT := 'PURCHASING';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.invoice_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION purchasing.generate_invoice_id() OWNER TO postgres;

--
-- Name: generate_purchase_id(); Type: FUNCTION; Schema: purchasing; Owner: postgres
--

CREATE FUNCTION purchasing.generate_purchase_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'PUO'; 
    module_name TEXT := 'PURCHASING';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.purchase_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION purchasing.generate_purchase_id() OWNER TO postgres;

--
-- Name: generate_quotation_content_id(); Type: FUNCTION; Schema: purchasing; Owner: postgres
--

CREATE FUNCTION purchasing.generate_quotation_content_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'QUC'; 
    module_name TEXT := 'PURCHASING';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.quotation_content_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION purchasing.generate_quotation_content_id() OWNER TO postgres;

--
-- Name: generate_quotation_id(); Type: FUNCTION; Schema: purchasing; Owner: postgres
--

CREATE FUNCTION purchasing.generate_quotation_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'PUQ'; 
    module_name TEXT := 'PURCHASING';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.quotation_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION purchasing.generate_quotation_id() OWNER TO postgres;

--
-- Name: generate_request_id(); Type: FUNCTION; Schema: purchasing; Owner: postgres
--

CREATE FUNCTION purchasing.generate_request_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'PUR'; 
    module_name TEXT := 'PURCHASING';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.request_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION purchasing.generate_request_id() OWNER TO postgres;

--
-- Name: generate_shipment_id(); Type: FUNCTION; Schema: purchasing; Owner: postgres
--

CREATE FUNCTION purchasing.generate_shipment_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'RES'; 
    module_name TEXT := 'PURCHASING';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.shipment_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION purchasing.generate_shipment_id() OWNER TO postgres;

--
-- Name: generate_agreement_id(); Type: FUNCTION; Schema: sales; Owner: postgres
--

CREATE FUNCTION sales.generate_agreement_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'AGRMNT'; 
    module_name TEXT := 'SALES';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.agreement_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION sales.generate_agreement_id() OWNER TO postgres;

--
-- Name: generate_campaign_id(); Type: FUNCTION; Schema: sales; Owner: postgres
--

CREATE FUNCTION sales.generate_campaign_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'CMPGN'; 
    module_name TEXT := 'SALES';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.campaign_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION sales.generate_campaign_id() OWNER TO postgres;

--
-- Name: generate_contact_id(); Type: FUNCTION; Schema: sales; Owner: postgres
--

CREATE FUNCTION sales.generate_contact_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'CONTACT'; 
    module_name TEXT := 'SALES';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.contact_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION sales.generate_contact_id() OWNER TO postgres;

--
-- Name: generate_convo_id(); Type: FUNCTION; Schema: sales; Owner: postgres
--

CREATE FUNCTION sales.generate_convo_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'CONVO'; 
    module_name TEXT := 'SALES';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.convo_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION sales.generate_convo_id() OWNER TO postgres;

--
-- Name: generate_customer_id(); Type: FUNCTION; Schema: sales; Owner: postgres
--

CREATE FUNCTION sales.generate_customer_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'CUST'; 
    module_name TEXT := 'SALES';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.customer_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION sales.generate_customer_id() OWNER TO postgres;

--
-- Name: generate_invoice_id(); Type: FUNCTION; Schema: sales; Owner: postgres
--

CREATE FUNCTION sales.generate_invoice_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'INV'; 
    module_name TEXT := 'SALES';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.invoice_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION sales.generate_invoice_id() OWNER TO postgres;

--
-- Name: generate_lead_id(); Type: FUNCTION; Schema: sales; Owner: postgres
--

CREATE FUNCTION sales.generate_lead_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'LEAD'; 
    module_name TEXT := 'SALES';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.lead_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION sales.generate_lead_id() OWNER TO postgres;

--
-- Name: generate_opportunity_id(); Type: FUNCTION; Schema: sales; Owner: postgres
--

CREATE FUNCTION sales.generate_opportunity_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'OPP'; 
    module_name TEXT := 'SALES';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.opportunity_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION sales.generate_opportunity_id() OWNER TO postgres;

--
-- Name: generate_order_id(); Type: FUNCTION; Schema: sales; Owner: postgres
--

CREATE FUNCTION sales.generate_order_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'ORD'; 
    module_name TEXT := 'SALES';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.order_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION sales.generate_order_id() OWNER TO postgres;

--
-- Name: generate_payment_id(); Type: FUNCTION; Schema: sales; Owner: postgres
--

CREATE FUNCTION sales.generate_payment_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'PAY'; 
    module_name TEXT := 'SALES';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.payment_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION sales.generate_payment_id() OWNER TO postgres;

--
-- Name: generate_quotation_id(); Type: FUNCTION; Schema: sales; Owner: postgres
--

CREATE FUNCTION sales.generate_quotation_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'QT'; 
    module_name TEXT := 'SALES';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.quotation_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION sales.generate_quotation_id() OWNER TO postgres;

--
-- Name: generate_receipt_id(); Type: FUNCTION; Schema: sales; Owner: postgres
--

CREATE FUNCTION sales.generate_receipt_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'REC'; 
    module_name TEXT := 'SALES';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.receipt_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION sales.generate_receipt_id() OWNER TO postgres;

--
-- Name: generate_renewal_id(); Type: FUNCTION; Schema: sales; Owner: postgres
--

CREATE FUNCTION sales.generate_renewal_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'RENEW'; 
    module_name TEXT := 'SALES';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.renewal_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION sales.generate_renewal_id() OWNER TO postgres;

--
-- Name: generate_sales_costing_id(); Type: FUNCTION; Schema: sales; Owner: postgres
--

CREATE FUNCTION sales.generate_sales_costing_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'SC'; 
    module_name TEXT := 'SALES';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.sales_costing_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION sales.generate_sales_costing_id() OWNER TO postgres;

--
-- Name: generate_shipping_id(); Type: FUNCTION; Schema: sales; Owner: postgres
--

CREATE FUNCTION sales.generate_shipping_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'SHIP'; 
    module_name TEXT := 'SALES';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.shipping_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION sales.generate_shipping_id() OWNER TO postgres;

--
-- Name: generate_statement_id(); Type: FUNCTION; Schema: sales; Owner: postgres
--

CREATE FUNCTION sales.generate_statement_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'STM'; 
    module_name TEXT := 'SALES';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.statement_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION sales.generate_statement_id() OWNER TO postgres;

--
-- Name: generate_statement_item_id(); Type: FUNCTION; Schema: sales; Owner: postgres
--

CREATE FUNCTION sales.generate_statement_item_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'STI'; 
    module_name TEXT := 'SALES';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.statement_item_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION sales.generate_statement_item_id() OWNER TO postgres;

--
-- Name: generate_ticket_id(); Type: FUNCTION; Schema: sales; Owner: postgres
--

CREATE FUNCTION sales.generate_ticket_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'TICKET'; 
    module_name TEXT := 'SALES';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.ticket_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION sales.generate_ticket_id() OWNER TO postgres;

--
-- Name: generate_analysis_id(); Type: FUNCTION; Schema: services; Owner: postgres
--

CREATE FUNCTION services.generate_analysis_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'ANALYSIS'; 
    module_name TEXT := 'SERVICES';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.analysis_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION services.generate_analysis_id() OWNER TO postgres;

--
-- Name: generate_analysis_sched_id(); Type: FUNCTION; Schema: services; Owner: postgres
--

CREATE FUNCTION services.generate_analysis_sched_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'SCHED'; 
    module_name TEXT := 'SERVICES';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.analysis_sched_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION services.generate_analysis_sched_id() OWNER TO postgres;

--
-- Name: generate_contract_id(); Type: FUNCTION; Schema: services; Owner: postgres
--

CREATE FUNCTION services.generate_contract_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'CONT'; 
    module_name TEXT := 'SERVICES';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.contract_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION services.generate_contract_id() OWNER TO postgres;

--
-- Name: generate_delivery_order_id(); Type: FUNCTION; Schema: services; Owner: postgres
--

CREATE FUNCTION services.generate_delivery_order_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'DO'; 
    module_name TEXT := 'SERVICES';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.delivery_order_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION services.generate_delivery_order_id() OWNER TO postgres;

--
-- Name: generate_message_id(); Type: FUNCTION; Schema: services; Owner: postgres
--

CREATE FUNCTION services.generate_message_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'MSG'; 
    module_name TEXT := 'SERVICES';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.message_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION services.generate_message_id() OWNER TO postgres;

--
-- Name: generate_renewal_history_id(); Type: FUNCTION; Schema: services; Owner: postgres
--

CREATE FUNCTION services.generate_renewal_history_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'RENEWHIS'; 
    module_name TEXT := 'SERVICES';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.renewal_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION services.generate_renewal_history_id() OWNER TO postgres;

--
-- Name: generate_report_id(); Type: FUNCTION; Schema: services; Owner: postgres
--

CREATE FUNCTION services.generate_report_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'REPORT'; 
    module_name TEXT := 'SERVICES';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.report_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION services.generate_report_id() OWNER TO postgres;

--
-- Name: generate_service_billing_id(); Type: FUNCTION; Schema: services; Owner: postgres
--

CREATE FUNCTION services.generate_service_billing_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'BILL'; 
    module_name TEXT := 'SERVICES';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.service_billing_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION services.generate_service_billing_id() OWNER TO postgres;

--
-- Name: generate_service_call_history_id(); Type: FUNCTION; Schema: services; Owner: postgres
--

CREATE FUNCTION services.generate_service_call_history_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'CALLHIS'; 
    module_name TEXT := 'SERVICES';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.service_call_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION services.generate_service_call_history_id() OWNER TO postgres;

--
-- Name: generate_service_call_id(); Type: FUNCTION; Schema: services; Owner: postgres
--

CREATE FUNCTION services.generate_service_call_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'CALL'; 
    module_name TEXT := 'SERVICES';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.service_call_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION services.generate_service_call_id() OWNER TO postgres;

--
-- Name: generate_service_cost_id(); Type: FUNCTION; Schema: services; Owner: postgres
--

CREATE FUNCTION services.generate_service_cost_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'COST'; 
    module_name TEXT := 'SERVICES';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.service_cost_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION services.generate_service_cost_id() OWNER TO postgres;

--
-- Name: generate_service_order_id(); Type: FUNCTION; Schema: services; Owner: postgres
--

CREATE FUNCTION services.generate_service_order_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'SO'; 
    module_name TEXT := 'SERVICES';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.service_order_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION services.generate_service_order_id() OWNER TO postgres;

--
-- Name: generate_service_purchase_id(); Type: FUNCTION; Schema: services; Owner: postgres
--

CREATE FUNCTION services.generate_service_purchase_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'SO'; 
    module_name TEXT := 'SERVICES';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.service_purchase_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION services.generate_service_purchase_id() OWNER TO postgres;

--
-- Name: generate_service_request_id(); Type: FUNCTION; Schema: services; Owner: postgres
--

CREATE FUNCTION services.generate_service_request_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'SR'; 
    module_name TEXT := 'SERVICES';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.service_request_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION services.generate_service_request_id() OWNER TO postgres;

--
-- Name: generate_session_id(); Type: FUNCTION; Schema: services; Owner: postgres
--

CREATE FUNCTION services.generate_session_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'COMS'; 
    module_name TEXT := 'SERVICES';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.session_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION services.generate_session_id() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: chart_of_accounts; Type: TABLE; Schema: accounting; Owner: postgres
--

CREATE TABLE accounting.chart_of_accounts (
    account_id character varying(255) NOT NULL,
    account_name character varying(255) NOT NULL,
    account_type character varying(50) DEFAULT NULL::character varying
);


ALTER TABLE accounting.chart_of_accounts OWNER TO postgres;

--
-- Name: currency; Type: TABLE; Schema: accounting; Owner: postgres
--

CREATE TABLE accounting.currency (
    currency_id character varying(255) NOT NULL,
    currency_name character varying(255) NOT NULL,
    exchange_rate numeric(15,6) NOT NULL,
    is_active boolean DEFAULT true NOT NULL
);


ALTER TABLE accounting.currency OWNER TO postgres;

--
-- Name: general_ledger_accounts; Type: TABLE; Schema: accounting; Owner: postgres
--

CREATE TABLE accounting.general_ledger_accounts (
    gl_account_id character varying(255) NOT NULL,
    account_name character varying(255) NOT NULL,
    account_code integer NOT NULL,
    account_id character varying(255),
    status public.status_enum NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE accounting.general_ledger_accounts OWNER TO postgres;

--
-- Name: journal_entries; Type: TABLE; Schema: accounting; Owner: postgres
--

CREATE TABLE accounting.journal_entries (
    journal_id character varying(255) NOT NULL,
    journal_date date NOT NULL,
    description character varying(255) DEFAULT NULL::character varying,
    total_debit numeric(15,2) NOT NULL,
    total_credit numeric(15,2) NOT NULL,
    invoice_id character varying(255) DEFAULT NULL::character varying,
    currency_id character varying(255) NOT NULL
);


ALTER TABLE accounting.journal_entries OWNER TO postgres;

--
-- Name: journal_entry_lines; Type: TABLE; Schema: accounting; Owner: postgres
--

CREATE TABLE accounting.journal_entry_lines (
    entry_line_id character varying(255) NOT NULL,
    gl_account_id character varying(255) DEFAULT NULL::character varying,
    journal_id character varying(255) NOT NULL,
    debit_amount numeric(15,2) NOT NULL,
    credit_amount numeric(15,2) NOT NULL,
    description character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE accounting.journal_entry_lines OWNER TO postgres;

--
-- Name: assets; Type: TABLE; Schema: admin; Owner: postgres
--

CREATE TABLE admin.assets (
    asset_id character varying(255) NOT NULL,
    asset_name character varying(255) NOT NULL,
    purchase_date date DEFAULT now(),
    serial_no character varying(225)
);


ALTER TABLE admin.assets OWNER TO postgres;

--
-- Name: audit_log; Type: TABLE; Schema: admin; Owner: postgres
--

CREATE TABLE admin.audit_log (
    log_id character varying(255) NOT NULL,
    user_id character varying(255),
    action text NOT NULL,
    "timestamp" timestamp without time zone DEFAULT now(),
    ip_address character varying(255),
    suspicious_activity boolean DEFAULT false,
    security_measures text
);


ALTER TABLE admin.audit_log OWNER TO postgres;

--
-- Name: business_partner_master; Type: TABLE; Schema: admin; Owner: postgres
--

CREATE TABLE admin.business_partner_master (
    partner_id character varying(255) NOT NULL,
    employee_id character varying(255),
    partner_name character varying(255) NOT NULL,
    category public.partner_category DEFAULT 'Employee'::public.partner_category,
    contact_info character varying(255)
);


ALTER TABLE admin.business_partner_master OWNER TO postgres;

--
-- Name: item_master_data; Type: TABLE; Schema: admin; Owner: postgres
--

CREATE TABLE admin.item_master_data (
    item_id character varying(255) NOT NULL,
    item_type public.item_type DEFAULT 'Product'::public.item_type
);


ALTER TABLE admin.item_master_data OWNER TO postgres;

--
-- Name: policies; Type: TABLE; Schema: admin; Owner: postgres
--

CREATE TABLE admin.policies (
    policy_id character varying(255) NOT NULL,
    policy_name character varying(255) NOT NULL,
    description text,
    effective_date date DEFAULT now(),
    status public.user_status DEFAULT 'Active'::public.user_status
);


ALTER TABLE admin.policies OWNER TO postgres;

--
-- Name: products; Type: TABLE; Schema: admin; Owner: postgres
--

CREATE TABLE admin.products (
    product_id character varying(255) NOT NULL,
    product_name character varying(255) NOT NULL,
    description text,
    selling_price numeric,
    stock_level integer,
    warranty_period integer DEFAULT 12,
    policy_id character varying(255)
);


ALTER TABLE admin.products OWNER TO postgres;

--
-- Name: raw_materials; Type: TABLE; Schema: admin; Owner: postgres
--

CREATE TABLE admin.raw_materials (
    material_id character varying(255) NOT NULL,
    material_name character varying(255) NOT NULL,
    description text,
    unit_of_measure public.unit_of_measure DEFAULT 'kg'::public.unit_of_measure,
    cost_per_unit numeric
);


ALTER TABLE admin.raw_materials OWNER TO postgres;

--
-- Name: roles_permission; Type: TABLE; Schema: admin; Owner: postgres
--

CREATE TABLE admin.roles_permission (
    role_id character varying(255) NOT NULL,
    role_name character varying(255) NOT NULL,
    description text,
    permissions text,
    access_level public.access_level DEFAULT 'Full Access'::public.access_level
);


ALTER TABLE admin.roles_permission OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: admin; Owner: postgres
--

CREATE TABLE admin.users (
    user_id character varying(255) NOT NULL,
    employee_id character varying(255),
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    role_id character varying(255),
    status public.user_status DEFAULT 'Active'::public.user_status,
    type public.user_type DEFAULT 'Employee'::public.user_type,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE admin.users OWNER TO postgres;

--
-- Name: vendor; Type: TABLE; Schema: admin; Owner: postgres
--

CREATE TABLE admin.vendor (
    vendor_code character varying(255) NOT NULL,
    partner_id character varying(255),
    vendor_name character varying(255) NOT NULL,
    contact_person character varying(255),
    status public.user_status DEFAULT 'Active'::public.user_status
);


ALTER TABLE admin.vendor OWNER TO postgres;

--
-- Name: warehouse; Type: TABLE; Schema: admin; Owner: postgres
--

CREATE TABLE admin.warehouse (
    warehouse_id character varying(255) NOT NULL,
    warehouse_location character varying(255) NOT NULL,
    stored_materials text
);


ALTER TABLE admin.warehouse OWNER TO postgres;

--
-- Name: billing_receipt; Type: TABLE; Schema: distribution; Owner: postgres
--

CREATE TABLE distribution.billing_receipt (
    billing_receipt_id character varying(255) NOT NULL,
    delivery_receipt_id character varying(255),
    sales_invoice_id character varying(255),
    service_billing_id character varying(255)
);


ALTER TABLE distribution.billing_receipt OWNER TO postgres;

--
-- Name: carrier; Type: TABLE; Schema: distribution; Owner: postgres
--

CREATE TABLE distribution.carrier (
    carrier_id character varying(255) NOT NULL,
    carrier_name text NOT NULL,
    service_type public.service_type_enum,
    carrier_count integer
);


ALTER TABLE distribution.carrier OWNER TO postgres;

--
-- Name: delivery_order; Type: TABLE; Schema: distribution; Owner: postgres
--

CREATE TABLE distribution.delivery_order (
    delivery_order_id character varying(255) NOT NULL,
    order_status public.order_status_type,
    content_id character varying(255),
    is_project_based public.project_based_type,
    is_partial_delivery public.yes_no_type,
    service_order_id character varying(255),
    production_request_id character varying(255),
    stock_transfer_id character varying(255),
    sales_order_id character varying(255),
    approval_request_id character varying(255)
);


ALTER TABLE distribution.delivery_order OWNER TO postgres;

--
-- Name: delivery_receipt; Type: TABLE; Schema: distribution; Owner: postgres
--

CREATE TABLE distribution.delivery_receipt (
    delivery_receipt_id integer NOT NULL,
    delivery_date date,
    received_by integer NOT NULL,
    signature text NOT NULL,
    receipt_status public.receipt_status_type,
    shipment_id integer NOT NULL
);


ALTER TABLE distribution.delivery_receipt OWNER TO postgres;

--
-- Name: delivery_receipt_delivery_receipt_id_seq; Type: SEQUENCE; Schema: distribution; Owner: postgres
--

CREATE SEQUENCE distribution.delivery_receipt_delivery_receipt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE distribution.delivery_receipt_delivery_receipt_id_seq OWNER TO postgres;

--
-- Name: delivery_receipt_delivery_receipt_id_seq; Type: SEQUENCE OWNED BY; Schema: distribution; Owner: postgres
--

ALTER SEQUENCE distribution.delivery_receipt_delivery_receipt_id_seq OWNED BY distribution.delivery_receipt.delivery_receipt_id;


--
-- Name: failed_shipment; Type: TABLE; Schema: distribution; Owner: postgres
--

CREATE TABLE distribution.failed_shipment (
    failed_shipment_id character varying(255) NOT NULL,
    failure_date date,
    failure_reason text NOT NULL,
    resolution_status public.resolution_status_type,
    shipment_id character varying(255)
);


ALTER TABLE distribution.failed_shipment OWNER TO postgres;

--
-- Name: goods_issue; Type: TABLE; Schema: distribution; Owner: postgres
--

CREATE TABLE distribution.goods_issue (
    goods_issue_id character varying(255) NOT NULL,
    issue_date date,
    issued_by integer NOT NULL,
    billing_receipt_id integer
);


ALTER TABLE distribution.goods_issue OWNER TO postgres;

--
-- Name: logistics_approval_request; Type: TABLE; Schema: distribution; Owner: postgres
--

CREATE TABLE distribution.logistics_approval_request (
    approval_request_id character varying(255) NOT NULL,
    request_date date,
    approval_status public.approval_status_type,
    approval_date date,
    approved_by character varying(255) NOT NULL,
    delivery_order_id character varying(255) NOT NULL
);


ALTER TABLE distribution.logistics_approval_request OWNER TO postgres;

--
-- Name: operational_cost; Type: TABLE; Schema: distribution; Owner: postgres
--

CREATE TABLE distribution.operational_cost (
    operational_cost_id character varying(255) NOT NULL,
    additional_cost numeric(10,2),
    total_operational_cost numeric(10,2),
    shipping_cost_id character varying(255),
    packing_cost_id character varying(255)
);


ALTER TABLE distribution.operational_cost OWNER TO postgres;

--
-- Name: packing_cost; Type: TABLE; Schema: distribution; Owner: postgres
--

CREATE TABLE distribution.packing_cost (
    packing_cost_id character varying(255) NOT NULL,
    material_cost numeric(10,2) NOT NULL,
    labor_cost numeric(10,2) NOT NULL,
    total_packing_cost numeric(10,2) NOT NULL
);


ALTER TABLE distribution.packing_cost OWNER TO postgres;

--
-- Name: packing_list; Type: TABLE; Schema: distribution; Owner: postgres
--

CREATE TABLE distribution.packing_list (
    packing_list_id character varying(255) NOT NULL,
    packed_by character varying(255) NOT NULL,
    packing_status public.packing_status_type,
    packing_type public.packing_type_enum,
    total_items_packed integer,
    packing_cost_id character varying(255),
    picking_list_id character varying(255) NOT NULL
);


ALTER TABLE distribution.packing_list OWNER TO postgres;

--
-- Name: picking_list; Type: TABLE; Schema: distribution; Owner: postgres
--

CREATE TABLE distribution.picking_list (
    picking_list_id character varying(255) NOT NULL,
    warehouse_id character varying(255),
    picked_by character varying(255) NOT NULL,
    picked_status public.picked_status_type,
    picked_date date,
    approval_request_id character varying(255) NOT NULL
);


ALTER TABLE distribution.picking_list OWNER TO postgres;

--
-- Name: rejection; Type: TABLE; Schema: distribution; Owner: postgres
--

CREATE TABLE distribution.rejection (
    rejection_id character varying(255) NOT NULL,
    rejection_status public.rejection_status_type,
    rejection_reason text NOT NULL,
    rejection_date date,
    delivery_receipt_id character varying(255) NOT NULL
);


ALTER TABLE distribution.rejection OWNER TO postgres;

--
-- Name: rework_order; Type: TABLE; Schema: distribution; Owner: postgres
--

CREATE TABLE distribution.rework_order (
    rework_id character varying(255) NOT NULL,
    assigned_to character varying(255) NOT NULL,
    rework_status public.rework_status_type,
    rework_date date,
    expected_completion timestamp without time zone,
    rejection_id character varying(255),
    failed_shipment_id character varying(255)
);


ALTER TABLE distribution.rework_order OWNER TO postgres;

--
-- Name: shipment_details; Type: TABLE; Schema: distribution; Owner: postgres
--

CREATE TABLE distribution.shipment_details (
    shipment_id character varying(255) NOT NULL,
    carrier_id character varying(255) NOT NULL,
    shipment_date date,
    shipment_status public.shipment_status_type,
    tracking_number character varying(100) NOT NULL,
    estimated_arrival_date timestamp without time zone,
    actual_arrival_date timestamp without time zone,
    failed_shipment_id character varying(255),
    packing_list_id character varying(255) NOT NULL,
    shipping_cost_id character varying(255) NOT NULL
);


ALTER TABLE distribution.shipment_details OWNER TO postgres;

--
-- Name: shipping_cost; Type: TABLE; Schema: distribution; Owner: postgres
--

CREATE TABLE distribution.shipping_cost (
    shipping_cost_id character varying(255) NOT NULL,
    packing_list_id character varying(255),
    cost_per_kg numeric(10,2),
    cost_per_km numeric(10,2),
    weight_kg numeric(10,2),
    distance_km numeric(10,2),
    total_shipping_cost numeric(10,2)
);


ALTER TABLE distribution.shipping_cost OWNER TO postgres;

--
-- Name: budget_approvals; Type: TABLE; Schema: finance; Owner: postgres
--

CREATE TABLE finance.budget_approvals (
    validation_id character varying(255) NOT NULL,
    downpayments numeric(12,2),
    approval_status character varying(10) NOT NULL,
    CONSTRAINT budget_approvals_approval_status_check CHECK (((approval_status)::text = ANY ((ARRAY['Approved'::character varying, 'Pending'::character varying])::text[])))
);


ALTER TABLE finance.budget_approvals OWNER TO postgres;

--
-- Name: budget_validations; Type: TABLE; Schema: finance; Owner: postgres
--

CREATE TABLE finance.budget_validations (
    validation_id character varying(255) NOT NULL,
    dept_id character varying(255) NOT NULL,
    validation_date date NOT NULL,
    validated_by character varying(255) NOT NULL,
    validation_status character varying(10) NOT NULL,
    remarks character varying(20) NOT NULL,
    amount_requested numeric(12,2) NOT NULL,
    final_approved_amount numeric(12,2),
    CONSTRAINT budget_validations_remarks_check CHECK (((remarks)::text = ANY ((ARRAY['Approved'::character varying, 'Awaiting Validation'::character varying])::text[]))),
    CONSTRAINT budget_validations_validation_status_check CHECK (((validation_status)::text = ANY ((ARRAY['Approved'::character varying, 'Pending'::character varying])::text[])))
);


ALTER TABLE finance.budget_validations OWNER TO postgres;

--
-- Name: attendance_tracking; Type: TABLE; Schema: human_resources; Owner: postgres
--

CREATE TABLE human_resources.attendance_tracking (
    attendance_id character varying(255) NOT NULL,
    employee_id character varying(255) NOT NULL,
    time_in timestamp without time zone NOT NULL,
    time_out timestamp without time zone NOT NULL,
    work_hours numeric(5,2) GENERATED ALWAYS AS ((EXTRACT(epoch FROM (time_out - time_in)) / (3600)::numeric)) STORED,
    status character varying(20) DEFAULT 'Present'::character varying NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT attendance_tracking_status_check CHECK (((status)::text = ANY ((ARRAY['Present'::character varying, 'Late'::character varying, 'Absent'::character varying, 'Half-Day'::character varying, 'On Leave'::character varying])::text[])))
);


ALTER TABLE human_resources.attendance_tracking OWNER TO postgres;

--
-- Name: candidates; Type: TABLE; Schema: human_resources; Owner: postgres
--

CREATE TABLE human_resources.candidates (
    candidate_id character varying(255) NOT NULL,
    job_id character varying(255) NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    phone character varying(20),
    resume text,
    employment_type character varying(20) NOT NULL,
    contract_duration smallint,
    status character varying(20) DEFAULT 'Applied'::character varying,
    date_applied timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT candidates_employment_type_check CHECK (((employment_type)::text = ANY ((ARRAY['Permanent'::character varying, 'Contractual'::character varying])::text[]))),
    CONSTRAINT candidates_status_check CHECK (((status)::text = ANY ((ARRAY['Applied'::character varying, 'Interview Scheduled'::character varying, 'Hired'::character varying, 'Rejected'::character varying])::text[])))
);


ALTER TABLE human_resources.candidates OWNER TO postgres;

--
-- Name: departments; Type: TABLE; Schema: human_resources; Owner: postgres
--

CREATE TABLE human_resources.departments (
    dept_id character varying(255) NOT NULL,
    dept_name character varying(100) NOT NULL
);


ALTER TABLE human_resources.departments OWNER TO postgres;

--
-- Name: employee_performance; Type: TABLE; Schema: human_resources; Owner: postgres
--

CREATE TABLE human_resources.employee_performance (
    performance_id character varying(255) NOT NULL,
    employee_id character varying(255) NOT NULL,
    immediate_superior_id character varying(255) NOT NULL,
    rating integer NOT NULL,
    review_date date DEFAULT CURRENT_DATE,
    comments text,
    CONSTRAINT employee_performance_rating_check CHECK (((rating >= 1) AND (rating <= 5)))
);


ALTER TABLE human_resources.employee_performance OWNER TO postgres;

--
-- Name: employee_salary; Type: TABLE; Schema: human_resources; Owner: postgres
--

CREATE TABLE human_resources.employee_salary (
    salary_id character varying(255) NOT NULL,
    employee_id character varying(255) NOT NULL,
    base_salary numeric(10,2) DEFAULT NULL::numeric,
    contract_pay_type character varying(20) DEFAULT NULL::character varying,
    contract_pay_rate numeric(10,2) DEFAULT NULL::numeric,
    total_hours_worked numeric(10,2) DEFAULT NULL::numeric,
    total_contract_pay numeric(10,2) DEFAULT NULL::numeric,
    effective_date date DEFAULT CURRENT_DATE NOT NULL,
    CONSTRAINT employee_salary_contract_pay_type_check CHECK (((contract_pay_type)::text = ANY ((ARRAY['Hourly'::character varying, 'Daily'::character varying])::text[])))
);


ALTER TABLE human_resources.employee_salary OWNER TO postgres;

--
-- Name: employees; Type: TABLE; Schema: human_resources; Owner: postgres
--

CREATE TABLE human_resources.employees (
    employee_id character varying(255) NOT NULL,
    dept_id character varying(255) NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    phone character varying(20),
    job_title character varying(100),
    employment_type character varying(20) NOT NULL,
    status character varying(20) DEFAULT 'Active'::character varying NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT employees_employment_type_check CHECK (((employment_type)::text = ANY ((ARRAY['Permanent'::character varying, 'Contractual'::character varying])::text[]))),
    CONSTRAINT employees_status_check CHECK (((status)::text = ANY ((ARRAY['Active'::character varying, 'Inactive'::character varying, 'Terminated'::character varying])::text[])))
);


ALTER TABLE human_resources.employees OWNER TO postgres;

--
-- Name: interviews; Type: TABLE; Schema: human_resources; Owner: postgres
--

CREATE TABLE human_resources.interviews (
    interview_id character varying(255) NOT NULL,
    candidate_id character varying(255) NOT NULL,
    interviewer_id character varying(255) NOT NULL,
    interview_date timestamp without time zone NOT NULL,
    status character varying(20) DEFAULT 'Scheduled'::character varying,
    feedback text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT interviews_status_check CHECK (((status)::text = ANY ((ARRAY['Scheduled'::character varying, 'Completed'::character varying, 'Canceled'::character varying])::text[])))
);


ALTER TABLE human_resources.interviews OWNER TO postgres;

--
-- Name: job_posting; Type: TABLE; Schema: human_resources; Owner: postgres
--

CREATE TABLE human_resources.job_posting (
    job_id character varying(255) NOT NULL,
    request_id character varying(255) DEFAULT NULL::character varying,
    dept_id character varying(255) NOT NULL,
    "position" character varying(100) NOT NULL,
    description text NOT NULL,
    requirements text NOT NULL,
    employment_type character varying(20) NOT NULL,
    contract_duration smallint,
    contract_rate numeric(10,2) DEFAULT NULL::numeric,
    contract_pay_type character varying(20) DEFAULT NULL::character varying,
    status character varying(20) DEFAULT 'Open'::character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT job_posting_contract_duration_check CHECK ((contract_duration >= 1)),
    CONSTRAINT job_posting_contract_pay_type_check CHECK (((contract_pay_type)::text = ANY ((ARRAY['Hourly'::character varying, 'Daily'::character varying, 'Fixed'::character varying])::text[]))),
    CONSTRAINT job_posting_employment_type_check CHECK (((employment_type)::text = ANY ((ARRAY['Permanent'::character varying, 'Contractual'::character varying])::text[]))),
    CONSTRAINT job_posting_status_check CHECK (((status)::text = ANY ((ARRAY['Open'::character varying, 'Closed'::character varying])::text[])))
);


ALTER TABLE human_resources.job_posting OWNER TO postgres;

--
-- Name: leave_requests; Type: TABLE; Schema: human_resources; Owner: postgres
--

CREATE TABLE human_resources.leave_requests (
    leave_id character varying(255) NOT NULL,
    employee_id character varying(255) NOT NULL,
    dept_id character varying(255) NOT NULL,
    immediate_superior_id character varying(255) NOT NULL,
    management_approval_id character varying(255),
    leave_type character varying(20) NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    total_days integer GENERATED ALWAYS AS (((end_date - start_date) + 1)) STORED,
    is_paid boolean DEFAULT true NOT NULL,
    status character varying(50) DEFAULT 'Pending'::character varying,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT leave_requests_leave_type_check CHECK (((leave_type)::text = ANY ((ARRAY['Sick'::character varying, 'Vacation'::character varying, 'Personal'::character varying, 'Maternity'::character varying, 'Paternity'::character varying, 'Unpaid'::character varying])::text[]))),
    CONSTRAINT leave_requests_status_check CHECK (((status)::text = ANY ((ARRAY['Pending'::character varying, 'Approved by Superior'::character varying, 'Rejected by Superior'::character varying, 'Approved by Management'::character varying, 'Rejected by Management'::character varying, 'Recorded in HRIS'::character varying])::text[])))
);


ALTER TABLE human_resources.leave_requests OWNER TO postgres;

--
-- Name: payroll; Type: TABLE; Schema: human_resources; Owner: postgres
--

CREATE TABLE human_resources.payroll (
    payroll_id character varying(255) NOT NULL,
    employee_id character varying(255) NOT NULL,
    employment_type character varying(20) DEFAULT 'Permanent'::character varying NOT NULL,
    base_salary numeric(10,2),
    work_days integer,
    contract_pay_type character varying(20),
    contract_pay_rate numeric(10,2) DEFAULT NULL::numeric,
    total_hours_worked numeric(10,2) DEFAULT NULL::numeric,
    total_contract_pay numeric(10,2) DEFAULT 0,
    payment_date date DEFAULT CURRENT_DATE NOT NULL,
    payment_status character varying(20) DEFAULT 'Pending'::character varying,
    CONSTRAINT payroll_contract_pay_type_check CHECK (((contract_pay_type)::text = ANY ((ARRAY['Hourly'::character varying, 'Daily'::character varying, 'Fixed'::character varying])::text[]))),
    CONSTRAINT payroll_employment_type_check CHECK (((employment_type)::text = ANY ((ARRAY['Permanent'::character varying, 'Contractual'::character varying])::text[]))),
    CONSTRAINT payroll_payment_status_check CHECK (((payment_status)::text = ANY ((ARRAY['Pending'::character varying, 'Processed'::character varying, 'Paid'::character varying])::text[])))
);


ALTER TABLE human_resources.payroll OWNER TO postgres;

--
-- Name: workforce_allocation; Type: TABLE; Schema: human_resources; Owner: postgres
--

CREATE TABLE human_resources.workforce_allocation (
    allocation_id character varying(255) NOT NULL,
    requesting_dept_id character varying(255) NOT NULL,
    employee_id character varying(255) NOT NULL,
    current_dept_id character varying(255) NOT NULL,
    reason text NOT NULL,
    approval_status character varying(20) DEFAULT 'Pending'::character varying,
    status character varying(20) DEFAULT 'Active'::character varying,
    start_date date NOT NULL,
    end_date date,
    approval_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT workforce_allocation_approval_status_check CHECK (((approval_status)::text = ANY ((ARRAY['Pending'::character varying, 'Approved'::character varying, 'Rejected'::character varying])::text[]))),
    CONSTRAINT workforce_allocation_status_check CHECK (((status)::text = ANY ((ARRAY['Active'::character varying, 'Completed'::character varying, 'Canceled'::character varying])::text[])))
);


ALTER TABLE human_resources.workforce_allocation OWNER TO postgres;

--
-- Name: deprecation_report; Type: TABLE; Schema: inventory; Owner: postgres
--

CREATE TABLE inventory.deprecation_report (
    deprecation_report_id character varying(255) NOT NULL,
    item_id character varying(225) NOT NULL,
    content_id character varying(255) NOT NULL,
    quantity integer NOT NULL,
    reported_date timestamp without time zone NOT NULL,
    status public.status_enum NOT NULL,
    warehouse_id character varying(225) NOT NULL,
    employee_id character varying(255) NOT NULL
);


ALTER TABLE inventory.deprecation_report OWNER TO postgres;

--
-- Name: inventory_adjustments; Type: TABLE; Schema: inventory; Owner: postgres
--

CREATE TABLE inventory.inventory_adjustments (
    adjustment_id character varying(255) NOT NULL,
    item_id character varying(255) NOT NULL,
    adjustment_type public.inventory_status NOT NULL,
    quantity integer NOT NULL,
    adjustment_date timestamp without time zone NOT NULL,
    employee_id character varying(255) NOT NULL
);


ALTER TABLE inventory.inventory_adjustments OWNER TO postgres;

--
-- Name: inventory_cyclic_counts; Type: TABLE; Schema: inventory; Owner: postgres
--

CREATE TABLE inventory.inventory_cyclic_counts (
    inventory_count_id character varying(255) NOT NULL,
    item_md_id character varying(255) NOT NULL,
    item_onhand integer NOT NULL,
    item_actually_counted integer NOT NULL,
    difference_in_qty integer NOT NULL,
    employee_id character varying(255) NOT NULL,
    status public.inventory_status NOT NULL,
    remarks text NOT NULL,
    time_period public.inventory_time_period NOT NULL
);


ALTER TABLE inventory.inventory_cyclic_counts OWNER TO postgres;

--
-- Name: inventory_item; Type: TABLE; Schema: inventory; Owner: postgres
--

CREATE TABLE inventory.inventory_item (
    inventory_item_id character varying(255) NOT NULL,
    item_id character varying(225) NOT NULL,
    content_id integer NOT NULL,
    expiry_date date NOT NULL,
    unit_cost numeric(10,3) NOT NULL,
    unit_of_measure character varying(25) NOT NULL,
    item_status public.item_status_enum NOT NULL,
    warehouse_id character varying(225) NOT NULL
);


ALTER TABLE inventory.inventory_item OWNER TO postgres;

--
-- Name: inventory_item_master_data; Type: TABLE; Schema: inventory; Owner: postgres
--

CREATE TABLE inventory.inventory_item_master_data (
    item_md_id character varying(255) NOT NULL,
    item_id character varying(225) NOT NULL,
    unit_cost numeric(10,3) NOT NULL,
    minimum_threshold integer NOT NULL,
    maximum_threshold integer NOT NULL,
    total_stock integer NOT NULL,
    stock_on_order integer NOT NULL,
    stock_committed integer NOT NULL,
    available_stock integer NOT NULL,
    last_update timestamp without time zone NOT NULL
);


ALTER TABLE inventory.inventory_item_master_data OWNER TO postgres;

--
-- Name: warehouse_movement; Type: TABLE; Schema: inventory; Owner: postgres
--

CREATE TABLE inventory.warehouse_movement (
    movement_id character varying(255) NOT NULL,
    item_id character varying(225) NOT NULL,
    movement_type text NOT NULL,
    quantity integer NOT NULL,
    movement_date timestamp without time zone NOT NULL,
    destination character varying(225) NOT NULL,
    source character varying(225) NOT NULL,
    reference_id_purchase_order character varying(255),
    reference_id_order character varying(255)
);


ALTER TABLE inventory.warehouse_movement OWNER TO postgres;

--
-- Name: bill_of_materials; Type: TABLE; Schema: mrp; Owner: postgres
--

CREATE TABLE mrp.bill_of_materials (
    bom_id character varying(255) NOT NULL,
    product_description text,
    unit_of_measure character varying(255),
    specific_notes text,
    quantity_of_unit integer,
    cost_per_raw_material numeric(10,2),
    total_cost_of_raw_materials numeric(10,2)
);


ALTER TABLE mrp.bill_of_materials OWNER TO postgres;

--
-- Name: non_project_order_pricing; Type: TABLE; Schema: mrp; Owner: postgres
--

CREATE TABLE mrp.non_project_order_pricing (
    non_project_costing_id character varying(255) NOT NULL,
    quantity integer,
    mrp_base_price numeric(10,2),
    final_price numeric(10,2)
);


ALTER TABLE mrp.non_project_order_pricing OWNER TO postgres;

--
-- Name: overall_production; Type: TABLE; Schema: mrp; Owner: postgres
--

CREATE TABLE mrp.overall_production (
    cost_id character varying(255) NOT NULL,
    product_id character varying(255),
    bom_id character varying(255),
    cost_of_raw_materials numeric(10,2),
    cost_of_production numeric(10,2),
    labor_cost numeric(10,2),
    total_mrp_cost numeric(10,2)
);


ALTER TABLE mrp.overall_production OWNER TO postgres;

--
-- Name: principal_items; Type: TABLE; Schema: mrp; Owner: postgres
--

CREATE TABLE mrp.principal_items (
    principal_item_id character varying(255) NOT NULL,
    service_request_id character varying(255),
    service_order_id character varying(255),
    quantity integer,
    item_id character varying(255),
    unit_price numeric(10,2),
    markup_price numeric(10,2),
    pricing_date date
);


ALTER TABLE mrp.principal_items OWNER TO postgres;

--
-- Name: document_header; Type: TABLE; Schema: operations; Owner: postgres
--

CREATE TABLE operations.document_header (
    document_id character varying(255) NOT NULL,
    document_type public.document_type_enum NOT NULL,
    vendor_code character varying(255) NOT NULL,
    document_no integer NOT NULL,
    transaction_id character varying(255) NOT NULL,
    module_request public.module_request_enum NOT NULL,
    status public.status_enum NOT NULL,
    posting_date date NOT NULL,
    delivery_date date,
    document_date date NOT NULL,
    buyer character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    initial_amount numeric(18,2) NOT NULL,
    discount_rate numeric(5,2),
    discount_amount numeric(18,2),
    freight numeric(18,2) NOT NULL,
    tax_rate numeric(5,2) NOT NULL,
    tax_amount numeric(18,2) NOT NULL,
    transaction_cost numeric(18,2) NOT NULL
);


ALTER TABLE operations.document_header OWNER TO postgres;

--
-- Name: document_items; Type: TABLE; Schema: operations; Owner: postgres
--

CREATE TABLE operations.document_items (
    content_id character varying(255) NOT NULL,
    item_id character varying(255),
    document_id character varying(255),
    material_id character varying(255),
    serial_id character varying(255),
    productdocu_id character varying(255),
    external_id character varying(255),
    quantity integer DEFAULT 0 NOT NULL,
    total numeric(18,2) NOT NULL,
    batch_no character varying(100) NOT NULL,
    warehouse_loc character varying(255) NOT NULL
);


ALTER TABLE operations.document_items OWNER TO postgres;

--
-- Name: external_module; Type: TABLE; Schema: operations; Owner: postgres
--

CREATE TABLE operations.external_module (
    external_id character varying(255) NOT NULL,
    purchase_id character varying(255),
    approval_id character varying(255),
    goods_issue_id character varying(255),
    approval_request_id character varying(255),
    billing_receipt_id character varying(255),
    delivery_receipt_id character varying(255),
    project_resources_id character varying(255),
    project_tracking_id character varying(255),
    project_request_id character varying(255),
    production_order_detail_id character varying(255),
    rework_id character varying(255),
    depreciation_report_id character varying(255)
);


ALTER TABLE operations.external_module OWNER TO postgres;

--
-- Name: product_document_items; Type: TABLE; Schema: operations; Owner: postgres
--

CREATE TABLE operations.product_document_items (
    productdocu_id character varying(255) NOT NULL,
    product_id character varying(255) NOT NULL,
    quantity_rejected integer DEFAULT 0 NOT NULL,
    defect_type character varying(155) NOT NULL,
    selling_price numeric(18,2) NOT NULL,
    manuf_date date NOT NULL,
    expiry_date date NOT NULL
);


ALTER TABLE operations.product_document_items OWNER TO postgres;

--
-- Name: serial_tracking; Type: TABLE; Schema: operations; Owner: postgres
--

CREATE TABLE operations.serial_tracking (
    serial_id character varying(255) NOT NULL,
    document_id character varying(255),
    serial_no character varying(50) NOT NULL
);


ALTER TABLE operations.serial_tracking OWNER TO postgres;

--
-- Name: components; Type: TABLE; Schema: production; Owner: postgres
--

CREATE TABLE production.components (
    component_id character varying(255) NOT NULL,
    component_name character varying(255) NOT NULL,
    component_description text,
    unit_of_measure public.unit_of_measure DEFAULT 'kg'::public.unit_of_measure,
    reorder_point integer NOT NULL,
    current_stock integer NOT NULL
);


ALTER TABLE production.components OWNER TO postgres;

--
-- Name: delivery_requests; Type: TABLE; Schema: production; Owner: postgres
--

CREATE TABLE production.delivery_requests (
    delivery_request_id character varying(255) NOT NULL,
    production_order_id character varying(255) NOT NULL,
    request_type public.request_type NOT NULL,
    request_date timestamp without time zone DEFAULT now(),
    requested_delivery_date date DEFAULT now(),
    component_id character varying(255),
    quantity_requested integer NOT NULL
);


ALTER TABLE production.delivery_requests OWNER TO postgres;

--
-- Name: equipment; Type: TABLE; Schema: production; Owner: postgres
--

CREATE TABLE production.equipment (
    equipment_id character varying(255) NOT NULL,
    equipment_name character varying(255) NOT NULL,
    description text,
    availability_status public.availability_status DEFAULT 'Available'::public.availability_status,
    last_maintenance_date date DEFAULT now()
);


ALTER TABLE production.equipment OWNER TO postgres;

--
-- Name: labor; Type: TABLE; Schema: production; Owner: postgres
--

CREATE TABLE production.labor (
    labor_id character varying(255) NOT NULL,
    production_order_id character varying(255) NOT NULL,
    employee_id character varying(255) NOT NULL,
    date_worked timestamp without time zone DEFAULT now(),
    hours_worked integer NOT NULL
);


ALTER TABLE production.labor OWNER TO postgres;

--
-- Name: production_orders_details; Type: TABLE; Schema: production; Owner: postgres
--

CREATE TABLE production.production_orders_details (
    production_order_detail_id character varying(255) NOT NULL,
    production_order_id character varying(255) NOT NULL,
    actual_quantity integer NOT NULL,
    cost_of_production numeric(10,2) NOT NULL,
    miscellaneous_costs numeric(10,2) NOT NULL,
    equipment_id character varying(255) NOT NULL,
    rework_required boolean NOT NULL,
    rework_notes text,
    content_id character varying(255)
);


ALTER TABLE production.production_orders_details OWNER TO postgres;

--
-- Name: production_orders_header; Type: TABLE; Schema: production; Owner: postgres
--

CREATE TABLE production.production_orders_header (
    production_order_id character varying(255) NOT NULL,
    project_id character varying(255),
    bom_id character varying(255),
    start_date timestamp without time zone DEFAULT now(),
    end_date timestamp without time zone DEFAULT now(),
    status public.prod_status DEFAULT 'Pending'::public.prod_status,
    target_quantity integer NOT NULL,
    notes text
);


ALTER TABLE production.production_orders_header OWNER TO postgres;

--
-- Name: contractual_worker_request; Type: TABLE; Schema: project_management; Owner: postgres
--

CREATE TABLE project_management.contractual_worker_request (
    request_id character varying(255) NOT NULL,
    intrnl_project_id character varying(255) NOT NULL,
    dept_id character varying(255) NOT NULL,
    job_title character varying(50) NOT NULL,
    job_description text,
    required_position character varying(50) NOT NULL,
    employment_type public.employment_type NOT NULL
);


ALTER TABLE project_management.contractual_worker_request OWNER TO postgres;

--
-- Name: external_project_cost_management; Type: TABLE; Schema: project_management; Owner: postgres
--

CREATE TABLE project_management.external_project_cost_management (
    project_resources_id character varying(255) NOT NULL,
    project_id character varying(255) NOT NULL,
    cost_id character varying(255) NOT NULL,
    project_budget_approval public.project_budget_approval NOT NULL
);


ALTER TABLE project_management.external_project_cost_management OWNER TO postgres;

--
-- Name: external_project_details; Type: TABLE; Schema: project_management; Owner: postgres
--

CREATE TABLE project_management.external_project_details (
    project_id character varying(255) NOT NULL,
    ext_project_request_id character varying(255) NOT NULL,
    project_status public.project_status NOT NULL
);


ALTER TABLE project_management.external_project_details OWNER TO postgres;

--
-- Name: external_project_labor; Type: TABLE; Schema: project_management; Owner: postgres
--

CREATE TABLE project_management.external_project_labor (
    project_labor_id character varying(255) NOT NULL,
    project_id character varying(255) NOT NULL,
    employee_id character varying(255) NOT NULL
);


ALTER TABLE project_management.external_project_labor OWNER TO postgres;

--
-- Name: external_project_request; Type: TABLE; Schema: project_management; Owner: postgres
--

CREATE TABLE project_management.external_project_request (
    ext_project_request_id character varying(255) NOT NULL,
    ext_project_name character varying(50) NOT NULL,
    ext_project_description text,
    approval_id character varying(255) NOT NULL,
    item_id character varying(255) NOT NULL
);


ALTER TABLE project_management.external_project_request OWNER TO postgres;

--
-- Name: external_project_task_list; Type: TABLE; Schema: project_management; Owner: postgres
--

CREATE TABLE project_management.external_project_task_list (
    task_id character varying(255) NOT NULL,
    project_id character varying(255) NOT NULL,
    task_description text,
    task_status public.task_status NOT NULL,
    task_deadline date NOT NULL,
    employee_id character varying(255) NOT NULL
);


ALTER TABLE project_management.external_project_task_list OWNER TO postgres;

--
-- Name: external_project_tracking; Type: TABLE; Schema: project_management; Owner: postgres
--

CREATE TABLE project_management.external_project_tracking (
    project_tracking_id character varying(255) NOT NULL,
    project_id character varying(255) NOT NULL,
    project_milestone public.project_milestone NOT NULL,
    start_date date NOT NULL,
    estimated_end_date date NOT NULL,
    project_warranty_id character varying(255) NOT NULL,
    project_issue text
);


ALTER TABLE project_management.external_project_tracking OWNER TO postgres;

--
-- Name: external_project_warranty; Type: TABLE; Schema: project_management; Owner: postgres
--

CREATE TABLE project_management.external_project_warranty (
    project_warranty_id character varying(255) NOT NULL,
    project_id character varying(255) NOT NULL,
    warranty_coverage_yr integer NOT NULL,
    warranty_start_date date NOT NULL,
    warranty_end_date date NOT NULL,
    CONSTRAINT external_project_warranty_check CHECK ((warranty_end_date > warranty_start_date))
);


ALTER TABLE project_management.external_project_warranty OWNER TO postgres;

--
-- Name: internal_project_details; Type: TABLE; Schema: project_management; Owner: postgres
--

CREATE TABLE project_management.internal_project_details (
    intrnl_project_id character varying(255) NOT NULL,
    project_request_id character varying(255) NOT NULL,
    intrnl_project_status public.intrnl_project_status NOT NULL
);


ALTER TABLE project_management.internal_project_details OWNER TO postgres;

--
-- Name: internal_project_labor; Type: TABLE; Schema: project_management; Owner: postgres
--

CREATE TABLE project_management.internal_project_labor (
    intrnl_project_labor_id character varying(255) NOT NULL,
    intrnl_project_id character varying(255) NOT NULL,
    employee_id character varying(255) NOT NULL
);


ALTER TABLE project_management.internal_project_labor OWNER TO postgres;

--
-- Name: internal_project_request; Type: TABLE; Schema: project_management; Owner: postgres
--

CREATE TABLE project_management.internal_project_request (
    project_request_id character varying(255) NOT NULL,
    project_name character varying(50) NOT NULL,
    project_description text,
    request_date date NOT NULL,
    request_valid_date date NOT NULL,
    request_starting_date date NOT NULL,
    approval_id character varying(255) NOT NULL,
    employee_id character varying(255) NOT NULL,
    dept_id character varying(255) NOT NULL,
    project_type public.project_type NOT NULL
);


ALTER TABLE project_management.internal_project_request OWNER TO postgres;

--
-- Name: internal_project_task_list; Type: TABLE; Schema: project_management; Owner: postgres
--

CREATE TABLE project_management.internal_project_task_list (
    intrnl_task_id character varying(255) NOT NULL,
    intrnl_project_id character varying(255) NOT NULL,
    intrnl_task_description text,
    intrnl_task_status public.intrnl_task_status NOT NULL,
    intrnl_task_deadline date NOT NULL,
    employee_id character varying(255) NOT NULL
);


ALTER TABLE project_management.internal_project_task_list OWNER TO postgres;

--
-- Name: internal_project_tracking; Type: TABLE; Schema: project_management; Owner: postgres
--

CREATE TABLE project_management.internal_project_tracking (
    intrnl_project_tracking_id character varying(255) NOT NULL,
    intrnl_project_id character varying(255) NOT NULL,
    intrnl_start_date date NOT NULL,
    intrnl_estimated_end_date date NOT NULL,
    intrnl_project_issue text
);


ALTER TABLE project_management.internal_project_tracking OWNER TO postgres;

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

ALTER TABLE public.auth_group ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


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

ALTER TABLE public.auth_group_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


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

ALTER TABLE public.auth_permission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


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

ALTER TABLE public.auth_user_groups ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_user ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


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

ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


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

ALTER TABLE public.django_admin_log ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


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

ALTER TABLE public.django_content_type ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


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

ALTER TABLE public.django_migrations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


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
-- Name: batch_inspection; Type: TABLE; Schema: purchasing; Owner: postgres
--

CREATE TABLE purchasing.batch_inspection (
    inspection_id character varying(255) NOT NULL,
    shipment_id character varying(255) NOT NULL,
    inspection_date date,
    employee_id character varying(255) NOT NULL,
    inspection_result public.inspection_result,
    remarks character varying(255)
);


ALTER TABLE purchasing.batch_inspection OWNER TO postgres;

--
-- Name: credit_memo; Type: TABLE; Schema: purchasing; Owner: postgres
--

CREATE TABLE purchasing.credit_memo (
    credit_memo_id character varying(255) NOT NULL,
    inspection_id character varying(255) NOT NULL,
    status public.purchase_status,
    document_no integer,
    document_date date,
    delivery_date date,
    due_date date,
    total_credit numeric(10,2),
    credit_balance numeric(10,2),
    dpm_rate numeric(5,2),
    dpm_amount numeric(10,2),
    applied_amount numeric(10,2),
    balance_due numeric(10,2)
);


ALTER TABLE purchasing.credit_memo OWNER TO postgres;

--
-- Name: purchase_invoice; Type: TABLE; Schema: purchasing; Owner: postgres
--

CREATE TABLE purchasing.purchase_invoice (
    invoice_id character varying(255) NOT NULL,
    purchase_id character varying(255) NOT NULL,
    status public.purchase_status,
    document_no integer,
    document_date date,
    due_date date,
    total_credit numeric(10,2),
    credit_balance numeric(10,2),
    dpm_rate numeric(5,2),
    dpm_amount numeric(10,2),
    applied_amount numeric(10,2),
    balance_due numeric(10,2)
);


ALTER TABLE purchasing.purchase_invoice OWNER TO postgres;

--
-- Name: purchase_order; Type: TABLE; Schema: purchasing; Owner: postgres
--

CREATE TABLE purchasing.purchase_order (
    purchase_id character varying(255) NOT NULL,
    quotation_id character varying(255) NOT NULL,
    order_date date,
    delivery_date date,
    document_date date,
    status public.purchase_status
);


ALTER TABLE purchasing.purchase_order OWNER TO postgres;

--
-- Name: purchase_quotation; Type: TABLE; Schema: purchasing; Owner: postgres
--

CREATE TABLE purchasing.purchase_quotation (
    quotation_id character varying(255) NOT NULL,
    vendor_code character varying(255) NOT NULL,
    quotation_content_id character varying(255) NOT NULL,
    status public.purchase_status,
    document_no integer,
    valid_date date,
    document_date date,
    required_date date,
    total_before_discount numeric(10,2),
    discount_percent numeric(5,2),
    freight numeric(10,2),
    tax numeric(10,2),
    total_payment numeric(10,2)
);


ALTER TABLE purchasing.purchase_quotation OWNER TO postgres;

--
-- Name: purchase_requests; Type: TABLE; Schema: purchasing; Owner: postgres
--

CREATE TABLE purchasing.purchase_requests (
    request_id character varying(255) NOT NULL,
    employee_id character varying(255) NOT NULL,
    approval_id character varying(255) NOT NULL,
    item_id character varying(255),
    purchase_item character varying(255),
    purchase_description text,
    purchase_quantity integer,
    valid_date date,
    document_date date,
    required_date date
);


ALTER TABLE purchasing.purchase_requests OWNER TO postgres;

--
-- Name: quotation_contents; Type: TABLE; Schema: purchasing; Owner: postgres
--

CREATE TABLE purchasing.quotation_contents (
    quotation_content_id character varying(255) NOT NULL,
    request_id character varying(255) NOT NULL,
    unit_price numeric(10,2),
    discount numeric(10,2),
    tax_code character varying(50),
    total numeric(10,2)
);


ALTER TABLE purchasing.quotation_contents OWNER TO postgres;

--
-- Name: received_shipments; Type: TABLE; Schema: purchasing; Owner: postgres
--

CREATE TABLE purchasing.received_shipments (
    shipment_id character varying(255) NOT NULL,
    purchase_id character varying(255) NOT NULL,
    delivery_date date
);


ALTER TABLE purchasing.received_shipments OWNER TO postgres;

--
-- Name: vendor_application; Type: TABLE; Schema: purchasing; Owner: postgres
--

CREATE TABLE purchasing.vendor_application (
    application_reference character varying(255) NOT NULL,
    vendor_code character varying(255) NOT NULL,
    status public.vendor_application_status,
    company_name character varying,
    tax_number integer,
    contact_person character varying,
    title character varying,
    vendor_address character varying,
    phone bigint,
    fax bigint,
    vendor_email character varying,
    tax_exempt boolean,
    vendor_website character varying,
    organization_type public.organization_type_enum,
    separate_checks boolean,
    purchasing_card boolean,
    account_no bigint,
    routing_no integer,
    requestor character varying,
    date_requested date
);


ALTER TABLE purchasing.vendor_application OWNER TO postgres;

--
-- Name: blanket_agreement; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.blanket_agreement (
    agreement_id character varying(255) NOT NULL,
    statement_id character varying(255) NOT NULL,
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    status public.agreement_status_enum,
    description text,
    signed_date timestamp without time zone,
    agreement_method public.agreement_method_enum
);


ALTER TABLE sales.blanket_agreement OWNER TO postgres;

--
-- Name: campaign_contacts; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.campaign_contacts (
    contact_id character varying(255) NOT NULL,
    lead_id character varying(255),
    campaign_id character varying(255),
    response_status public.response_status_enum
);


ALTER TABLE sales.campaign_contacts OWNER TO postgres;

--
-- Name: campaigns; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.campaigns (
    campaign_id character varying(255) NOT NULL,
    campaign_name character varying(255),
    type public.campaign_type_enum DEFAULT 'Email'::public.campaign_type_enum,
    start_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    end_date timestamp without time zone,
    status public.campaign_status_enum
);


ALTER TABLE sales.campaigns OWNER TO postgres;

--
-- Name: customers; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.customers (
    customer_id character varying(255) NOT NULL,
    gl_account_id character varying(255),
    partner_id character varying(255),
    name character varying(255) NOT NULL,
    email_address character varying(255),
    phone_number character varying(20),
    address_line1 character varying(255),
    address_line2 character varying(255),
    city character varying(100),
    postal_code character varying(20),
    country character varying(100),
    customer_type public.customer_type_enum,
    status public.status_enum,
    debt numeric(10,2) DEFAULT 0.00,
    CONSTRAINT customers_debt_check CHECK ((debt >= (0)::numeric))
);


ALTER TABLE sales.customers OWNER TO postgres;

--
-- Name: leads; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.leads (
    lead_id character varying(255) NOT NULL,
    salesrep_id character varying(255) NOT NULL,
    lead_name character varying(255),
    lead_email character varying(255),
    lead_phonenum character varying(20),
    source public.lead_source_enum DEFAULT 'Website'::public.lead_source_enum,
    status public.lead_status_enum DEFAULT 'New'::public.lead_status_enum
);


ALTER TABLE sales.leads OWNER TO postgres;

--
-- Name: opportunities; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.opportunities (
    opportunity_id character varying(255) NOT NULL,
    customer_id character varying(255) NOT NULL,
    partner_id character varying(255) NOT NULL,
    salesrep_id character varying(255) NOT NULL,
    estimated_value numeric(10,2),
    expected_closed_date date,
    stage public.opportunity_stage_enum,
    status public.opportunity_status_enum,
    description text,
    reason_lost text
);


ALTER TABLE sales.opportunities OWNER TO postgres;

--
-- Name: orders; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.orders (
    order_id character varying(255) NOT NULL,
    statement_id character varying(255) NOT NULL,
    quotation_id character varying(255),
    rework_id character varying(255),
    goods_issue_id character varying(255),
    order_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    order_status public.order_status_enum,
    order_total_amount numeric(10,2),
    order_type public.order_type_enum
);


ALTER TABLE sales.orders OWNER TO postgres;

--
-- Name: payments; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.payments (
    payment_id character varying(255) NOT NULL,
    order_id character varying(255) NOT NULL,
    payment_method public.payment_method_enum,
    payment_status public.payment_status_enum DEFAULT 'Pending'::public.payment_status_enum,
    payment_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE sales.payments OWNER TO postgres;

--
-- Name: quotation; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.quotation (
    quotation_id character varying(255) NOT NULL,
    statement_id character varying(255) NOT NULL,
    agreement_id character varying(255),
    date_issued timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    status public.quotation_status_enum
);


ALTER TABLE sales.quotation OWNER TO postgres;

--
-- Name: receipt; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.receipt (
    receipt_id character varying(255) NOT NULL,
    shipping_id character varying(255) NOT NULL,
    customer_id character varying(255) NOT NULL,
    payments_id character varying(255) NOT NULL,
    policy_id character varying(255) NOT NULL,
    date_signed date,
    signed_docu character varying(255),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE sales.receipt OWNER TO postgres;

--
-- Name: renewal_warranty; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.renewal_warranty (
    renewal_id character varying(255) NOT NULL,
    order_id character varying(255) NOT NULL,
    customer_id character varying(255) NOT NULL,
    product_id character varying(255) NOT NULL,
    payments_id character varying(255) NOT NULL,
    service_request_id character varying(255),
    original_warranty_start date,
    original_warranty_end date,
    renewal_warranty_start date,
    renewal_warranty_end date,
    renewal_status public.renewal_status_enum,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    renewal_fee numeric(10,2)
);


ALTER TABLE sales.renewal_warranty OWNER TO postgres;

--
-- Name: sales_costing; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.sales_costing (
    sales_costing_id character varying(255) NOT NULL,
    non_project_costing_id character varying(255),
    project_resources_id character varying(255),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE sales.sales_costing OWNER TO postgres;

--
-- Name: sales_invoices; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.sales_invoices (
    invoice_id character varying(255) NOT NULL,
    order_id character varying(255) NOT NULL,
    invoice_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    total_amount numeric(10,2),
    invoice_status public.invoice_status_enum,
    payment_status public.payment_status_enum,
    due_date date
);


ALTER TABLE sales.sales_invoices OWNER TO postgres;

--
-- Name: shipping_details; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.shipping_details (
    shipping_id character varying(255) NOT NULL,
    order_id character varying(255) NOT NULL,
    operational_cost_id character varying(255) NOT NULL,
    shipment_id character varying(255) NOT NULL,
    shipping_method public.shipping_method_enum,
    tracking_num character varying(50),
    shipping_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    estimated_delivery timestamp without time zone,
    delivery_status public.delivery_status_enum
);


ALTER TABLE sales.shipping_details OWNER TO postgres;

--
-- Name: statement; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.statement (
    statement_id character varying(255) NOT NULL,
    customer_id character varying(255) NOT NULL,
    salesrep_id character varying(255) NOT NULL,
    total_amount numeric(10,2),
    discount numeric(10,2) DEFAULT 0,
    type public.quotation_type_enum,
    total_tax integer DEFAULT 0,
    CONSTRAINT statement_discount_check CHECK ((discount >= (0)::numeric))
);


ALTER TABLE sales.statement OWNER TO postgres;

--
-- Name: statement_item; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.statement_item (
    statement_item_id character varying(255) NOT NULL,
    statement_id character varying(255) NOT NULL,
    sales_costing_id character varying(255),
    product_id character varying(255),
    item_md_id character varying(255),
    quantity integer,
    unit_price numeric(10,2),
    total_price numeric(10,2),
    markup_percentage numeric(5,2) DEFAULT 0,
    demand_level public.demand_level_enum,
    discount numeric(10,2),
    tax_amount integer DEFAULT 0,
    CONSTRAINT statement_item_discount_check CHECK ((discount >= (0)::numeric)),
    CONSTRAINT statement_item_markup_percentage_check CHECK ((markup_percentage >= (0)::numeric))
);


ALTER TABLE sales.statement_item OWNER TO postgres;

--
-- Name: ticket; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.ticket (
    ticket_id character varying(255) NOT NULL,
    customer_id character varying(255) NOT NULL,
    salesrep_id character varying(255) NOT NULL,
    subject character varying(255),
    description text,
    status public.ticket_status_enum,
    priority public.ticket_priority_enum,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE sales.ticket OWNER TO postgres;

--
-- Name: ticket_convo; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.ticket_convo (
    convo_id character varying(255) NOT NULL,
    ticket_id character varying(255) NOT NULL,
    content character varying(255),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE sales.ticket_convo OWNER TO postgres;

--
-- Name: after_analysis_sched; Type: TABLE; Schema: services; Owner: postgres
--

CREATE TABLE services.after_analysis_sched (
    analysis_sched_id character varying(255) NOT NULL,
    service_request_id character varying(255) NOT NULL,
    service_date date,
    technician_id character varying(255) NOT NULL,
    description text,
    service_status text NOT NULL,
    CONSTRAINT after_analysis_sched_service_status_check CHECK ((service_status = ANY (ARRAY['Scheduled'::text, 'Completed'::text, 'Cancelled'::text, 'In Progress'::text])))
);


ALTER TABLE services.after_analysis_sched OWNER TO postgres;

--
-- Name: chat_message; Type: TABLE; Schema: services; Owner: postgres
--

CREATE TABLE services.chat_message (
    message_id character varying(255) NOT NULL,
    session_id character varying(255) NOT NULL,
    sender_id character varying(255) NOT NULL,
    sender_role text NOT NULL,
    message_text text NOT NULL,
    "timestamp" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chat_message_sender_role_check CHECK ((sender_role = ANY (ARRAY['Technician'::text, 'Customer'::text])))
);


ALTER TABLE services.chat_message OWNER TO postgres;

--
-- Name: comm_session; Type: TABLE; Schema: services; Owner: postgres
--

CREATE TABLE services.comm_session (
    session_id character varying(255) NOT NULL,
    technician_id character varying(255) NOT NULL,
    customer_id character varying(255) NOT NULL,
    session_type text NOT NULL,
    start_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    end_time timestamp without time zone,
    status text NOT NULL,
    CONSTRAINT comm_session_session_type_check CHECK ((session_type = ANY (ARRAY['Support'::text, 'Consultation'::text, 'Follow-up'::text]))),
    CONSTRAINT comm_session_status_check CHECK ((status = ANY (ARRAY['Scheduled'::text, 'Ongoing'::text, 'Completed'::text, 'Cancelled'::text])))
);


ALTER TABLE services.comm_session OWNER TO postgres;

--
-- Name: delivery_order; Type: TABLE; Schema: services; Owner: postgres
--

CREATE TABLE services.delivery_order (
    delivery_order_id character varying(255) NOT NULL,
    service_purchase_id character varying(255),
    service_order_id character varying(255),
    service_billing_id character varying(255),
    customer_id character varying(255) NOT NULL,
    customer_address text,
    delivery_status text NOT NULL,
    service_billing_amount numeric(10,2),
    delivery_date date,
    CONSTRAINT delivery_order_delivery_status_check CHECK ((delivery_status = ANY (ARRAY['Pending'::text, 'Shipped'::text, 'Delivered'::text])))
);


ALTER TABLE services.delivery_order OWNER TO postgres;

--
-- Name: renewal_history; Type: TABLE; Schema: services; Owner: postgres
--

CREATE TABLE services.renewal_history (
    renewal_id character varying(255) NOT NULL,
    contract_id character varying(255) NOT NULL,
    customer_id character varying(255) NOT NULL,
    previous_start_date date,
    previous_end_date date,
    renewal_date date,
    date_renewed date,
    new_end_date date,
    status text NOT NULL,
    CONSTRAINT renewal_history_status_check CHECK ((status = ANY (ARRAY['Pending'::text, 'Approved'::text, 'Rejected'::text])))
);


ALTER TABLE services.renewal_history OWNER TO postgres;

--
-- Name: service_analysis; Type: TABLE; Schema: services; Owner: postgres
--

CREATE TABLE services.service_analysis (
    analysis_id character varying(255) NOT NULL,
    service_request_id character varying(255) NOT NULL,
    analysis_date date,
    technician_id character varying(255) NOT NULL,
    customer_id character varying(255) NOT NULL,
    analysis_description text,
    product_id character varying(255)
);


ALTER TABLE services.service_analysis OWNER TO postgres;

--
-- Name: service_billing; Type: TABLE; Schema: services; Owner: postgres
--

CREATE TABLE services.service_billing (
    service_billing_id character varying(255) NOT NULL,
    service_purchase_id character varying(255),
    service_order_id character varying(255),
    service_request_id character varying(255) NOT NULL,
    charge_type text NOT NULL,
    product_id character varying(255),
    warranty_status text NOT NULL,
    service_billing_amount numeric(10,2),
    billing_status text NOT NULL,
    date_paid date,
    CONSTRAINT service_billing_billing_status_check CHECK ((billing_status = ANY (ARRAY['Unpaid'::text, 'Paid'::text, 'Pending'::text]))),
    CONSTRAINT service_billing_charge_type_check CHECK ((charge_type = ANY (ARRAY['Labor'::text, 'Parts'::text, 'Other'::text]))),
    CONSTRAINT service_billing_service_billing_amount_check CHECK ((service_billing_amount >= (0)::numeric)),
    CONSTRAINT service_billing_warranty_status_check CHECK ((warranty_status = ANY (ARRAY['Valid'::text, 'Expired'::text, 'N/A'::text])))
);


ALTER TABLE services.service_billing OWNER TO postgres;

--
-- Name: service_call; Type: TABLE; Schema: services; Owner: postgres
--

CREATE TABLE services.service_call (
    service_call_id character varying(255) NOT NULL,
    date_created timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    customer_id character varying(255) NOT NULL,
    customer_name character varying(255),
    queue integer NOT NULL,
    call_type text NOT NULL,
    technician_id character varying(255) NOT NULL,
    call_status text NOT NULL,
    date_closed timestamp without time zone,
    origin text NOT NULL,
    contract_id character varying(255) NOT NULL,
    end_date date,
    priority_level text NOT NULL,
    resolution text,
    CONSTRAINT service_call_call_status_check CHECK ((call_status = ANY (ARRAY['Open'::text, 'Closed'::text, 'In Progress'::text]))),
    CONSTRAINT service_call_call_type_check CHECK ((call_type = ANY (ARRAY['Inquiry'::text, 'Request'::text, 'Other'::text]))),
    CONSTRAINT service_call_origin_check CHECK ((origin = ANY (ARRAY['Phone'::text, 'Email'::text, 'Walk-in'::text]))),
    CONSTRAINT service_call_priority_level_check CHECK ((priority_level = ANY (ARRAY['Low'::text, 'Medium'::text, 'High'::text])))
);


ALTER TABLE services.service_call OWNER TO postgres;

--
-- Name: service_call_history; Type: TABLE; Schema: services; Owner: postgres
--

CREATE TABLE services.service_call_history (
    service_call_id character varying(255) NOT NULL,
    date_update date NOT NULL,
    time_update timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    status text NOT NULL,
    description text,
    CONSTRAINT service_call_history_status_check CHECK ((status = ANY (ARRAY['Open'::text, 'In Progress'::text, 'Closed'::text])))
);


ALTER TABLE services.service_call_history OWNER TO postgres;

--
-- Name: service_call_queue_seq; Type: SEQUENCE; Schema: services; Owner: postgres
--

ALTER TABLE services.service_call ALTER COLUMN queue ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME services.service_call_queue_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: service_contract; Type: TABLE; Schema: services; Owner: postgres
--

CREATE TABLE services.service_contract (
    contract_id character varying(255) NOT NULL,
    customer_id character varying(255) NOT NULL,
    contract_description text,
    start_date date,
    end_date date,
    termination_date date,
    service_type text NOT NULL,
    contract_type text NOT NULL,
    product_id character varying(255) NOT NULL,
    contract_status text NOT NULL,
    active_items integer,
    remarks text,
    renewal boolean DEFAULT false,
    date_renewed date,
    date_last_renewed date,
    approval_remarks text,
    approval_date date,
    approved_by character varying(255),
    CONSTRAINT service_contract_contract_status_check CHECK ((contract_status = ANY (ARRAY['Active'::text, 'Expired'::text, 'Terminated'::text]))),
    CONSTRAINT service_contract_contract_type_check CHECK ((contract_type = ANY (ARRAY['Regular'::text, 'Extended'::text, 'Other'::text]))),
    CONSTRAINT service_contract_service_type_check CHECK ((service_type = ANY (ARRAY['Repair'::text, 'Installation'::text, 'Maintenance'::text, 'Other'::text])))
);


ALTER TABLE services.service_contract OWNER TO postgres;

--
-- Name: service_cost; Type: TABLE; Schema: services; Owner: postgres
--

CREATE TABLE services.service_cost (
    service_cost_id character varying(255) NOT NULL,
    analysis_id character varying(255) NOT NULL,
    service_billing_id character varying(255) NOT NULL,
    cost_type text NOT NULL,
    outsource_fee numeric(10,2) DEFAULT 0.00,
    cost_amount numeric(10,2) DEFAULT 0.00,
    CONSTRAINT service_cost_cost_amount_check CHECK ((cost_amount >= (0)::numeric)),
    CONSTRAINT service_cost_cost_type_check CHECK ((cost_type = ANY (ARRAY['Labor'::text, 'Materials'::text, 'Other'::text]))),
    CONSTRAINT service_cost_outsource_fee_check CHECK ((outsource_fee >= (0)::numeric))
);


ALTER TABLE services.service_cost OWNER TO postgres;

--
-- Name: service_order; Type: TABLE; Schema: services; Owner: postgres
--

CREATE TABLE services.service_order (
    service_order_id character varying(255) NOT NULL,
    analysis_id character varying(255) NOT NULL,
    customer_id character varying(255) NOT NULL,
    item_id character varying(255) NOT NULL,
    item_name character varying(255),
    item_availability text NOT NULL,
    item_price numeric(10,2),
    CONSTRAINT service_order_item_availability_check CHECK ((item_availability = ANY (ARRAY['Available'::text, 'Out of Stock'::text])))
);


ALTER TABLE services.service_order OWNER TO postgres;

--
-- Name: service_purchase; Type: TABLE; Schema: services; Owner: postgres
--

CREATE TABLE services.service_purchase (
    service_purchase_id character varying(255) NOT NULL,
    service_order_id character varying(255) NOT NULL,
    principal_item_id character varying(255),
    item_id character varying(255) NOT NULL,
    item_name character varying(255),
    request_date date,
    quantity integer,
    markup_price numeric(10,2),
    customer_id character varying(255)
);


ALTER TABLE services.service_purchase OWNER TO postgres;

--
-- Name: service_report; Type: TABLE; Schema: services; Owner: postgres
--

CREATE TABLE services.service_report (
    report_id character varying(255) NOT NULL,
    service_call_id character varying(255) NOT NULL,
    service_billing_id character varying(255) NOT NULL,
    technician_id character varying(255) NOT NULL,
    description text,
    report_status text NOT NULL,
    submission_date date,
    CONSTRAINT service_report_report_status_check CHECK ((report_status = ANY (ARRAY['Draft'::text, 'Submitted'::text, 'Reviewed'::text])))
);


ALTER TABLE services.service_report OWNER TO postgres;

--
-- Name: service_request; Type: TABLE; Schema: services; Owner: postgres
--

CREATE TABLE services.service_request (
    service_request_id character varying(255) NOT NULL,
    service_call_id character varying(255) NOT NULL,
    request_date date,
    customer_id character varying(255) NOT NULL,
    technician_id character varying(255) NOT NULL,
    request_type text NOT NULL,
    request_status text NOT NULL,
    contract_type text NOT NULL,
    request_description text,
    request_remarks text,
    CONSTRAINT service_request_contract_type_check CHECK ((contract_type = ANY (ARRAY['Regular'::text, 'Extended'::text, 'Other'::text]))),
    CONSTRAINT service_request_request_status_check CHECK ((request_status = ANY (ARRAY['Pending'::text, 'Approved'::text, 'Rejected'::text]))),
    CONSTRAINT service_request_request_type_check CHECK ((request_type = ANY (ARRAY['Repair'::text, 'Installation'::text, 'Maintenance'::text, 'Other'::text])))
);


ALTER TABLE services.service_request OWNER TO postgres;

--
-- Name: service_ticket; Type: TABLE; Schema: services; Owner: postgres
--

CREATE TABLE services.service_ticket (
    service_ticket_id character varying(255) NOT NULL
);


ALTER TABLE services.service_ticket OWNER TO postgres;

--
-- Name: technician; Type: TABLE; Schema: services; Owner: postgres
--

CREATE TABLE services.technician (
    technician_id character varying(255) NOT NULL
);


ALTER TABLE services.technician OWNER TO postgres;

--
-- Name: delivery_receipt delivery_receipt_id; Type: DEFAULT; Schema: distribution; Owner: postgres
--

ALTER TABLE ONLY distribution.delivery_receipt ALTER COLUMN delivery_receipt_id SET DEFAULT nextval('distribution.delivery_receipt_delivery_receipt_id_seq'::regclass);


--
-- Data for Name: chart_of_accounts; Type: TABLE DATA; Schema: accounting; Owner: postgres
--

COPY accounting.chart_of_accounts (account_id, account_name, account_type) FROM stdin;
\.


--
-- Data for Name: currency; Type: TABLE DATA; Schema: accounting; Owner: postgres
--

COPY accounting.currency (currency_id, currency_name, exchange_rate, is_active) FROM stdin;
\.


--
-- Data for Name: general_ledger_accounts; Type: TABLE DATA; Schema: accounting; Owner: postgres
--

COPY accounting.general_ledger_accounts (gl_account_id, account_name, account_code, account_id, status, created_at) FROM stdin;
\.


--
-- Data for Name: journal_entries; Type: TABLE DATA; Schema: accounting; Owner: postgres
--

COPY accounting.journal_entries (journal_id, journal_date, description, total_debit, total_credit, invoice_id, currency_id) FROM stdin;
\.


--
-- Data for Name: journal_entry_lines; Type: TABLE DATA; Schema: accounting; Owner: postgres
--

COPY accounting.journal_entry_lines (entry_line_id, gl_account_id, journal_id, debit_amount, credit_amount, description) FROM stdin;
\.


--
-- Data for Name: assets; Type: TABLE DATA; Schema: admin; Owner: postgres
--

COPY admin.assets (asset_id, asset_name, purchase_date, serial_no) FROM stdin;
\.


--
-- Data for Name: audit_log; Type: TABLE DATA; Schema: admin; Owner: postgres
--

COPY admin.audit_log (log_id, user_id, action, "timestamp", ip_address, suspicious_activity, security_measures) FROM stdin;
\.


--
-- Data for Name: business_partner_master; Type: TABLE DATA; Schema: admin; Owner: postgres
--

COPY admin.business_partner_master (partner_id, employee_id, partner_name, category, contact_info) FROM stdin;
ADMIN-PARTNER-2025-3c2564	\N	Robert Santiago	Employee	09187654321
ADMIN-PARTNER-2025-afee8b	HR-EMP-2025-c8223f	James Marticio	Employee	09123456789
ADMIN-PARTNER-2025-95223d	HR-EMP-2025-c8223f	Kate Tan	Employee	09165824756
ADMIN-PARTNER-2025-adcdfc	\N	Maria Lopez	Employee	09154321876
ADMIN-PARTNER-2025-ead71e	\N	BioFlex Composites	Vendor	(312) 867-5309
ADMIN-PARTNER-2025-036cb7	\N	BioGrade Metals	Vendor	(415) 293-8274
ADMIN-PARTNER-2025-37f764	\N	Ethan Caldwell	Customer	ethan.caldwell@google.com
ADMIN-PARTNER-2025-f3081d	\N	Sophia Ramirez	Customer	sophia.ramirez@google.com
\.


--
-- Data for Name: item_master_data; Type: TABLE DATA; Schema: admin; Owner: postgres
--

COPY admin.item_master_data (item_id, item_type) FROM stdin;
\.


--
-- Data for Name: policies; Type: TABLE DATA; Schema: admin; Owner: postgres
--

COPY admin.policies (policy_id, policy_name, description, effective_date, status) FROM stdin;
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: admin; Owner: postgres
--

COPY admin.products (product_id, product_name, description, selling_price, stock_level, warranty_period, policy_id) FROM stdin;
ADMIN-PROD-2025-09e97d	A9	Used for critical patient or longer surgery, close-loop anesthesia.	47726.64	631	3	POL008
ADMIN-PROD-2025-a83254	AirStart10	CPAP therapy device for sleep apnea treatment.	10951.20	443	1	POL008
ADMIN-PROD-2025-328a5f	B2 Infant Incubator	Controlled environment for newborn care for optimal temperature and humidity.	1114666.00	540	1	POL008
ADMIN-PROD-2025-bb2e86	B3 Neonatal Incubator	Advanced life support system for premature infants, regulating vital parameters.	218400.00	599	1	POL008
ADMIN-PROD-2025-fdabb5	B8/B6 Neonatal Incubator	Intensive care unit for critically ill newborns, providing advanced monitoring and treatment capabilities	249756.00	693	1	POL008
ADMIN-PROD-2025-0274af	BeneFusion 5 Series	Infusion pumps for precise medication and fluid delivery.	135266.04	496	1	POL008
ADMIN-PROD-2025-ac0665	BeneFusion e Series	Infusion pumps for precise medication and fluid delivery.	135266.04	496	1	POL008
ADMIN-PROD-2025-04fd80	BeneFusion n Series	Portable infusion pumps for ambulatory patient care.	128700.00	554	1	POL008
ADMIN-PROD-2025-e9ce12	BeneHeart AED C2 and D1 PRO	Automated external defibrillators for emergency cardiac resuscitation.	259543.44	407	1	POL008
ADMIN-PROD-2025-ea1ddb	BeneHeart D3	Professional defibrillator monitor for cardiac resuscitation and patient monitoring.	218673.00	585	1	POL008
\.


--
-- Data for Name: raw_materials; Type: TABLE DATA; Schema: admin; Owner: postgres
--

COPY admin.raw_materials (material_id, material_name, description, unit_of_measure, cost_per_unit) FROM stdin;
\.


--
-- Data for Name: roles_permission; Type: TABLE DATA; Schema: admin; Owner: postgres
--

COPY admin.roles_permission (role_id, role_name, description, permissions, access_level) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: admin; Owner: postgres
--

COPY admin.users (user_id, employee_id, first_name, last_name, email, password, role_id, status, type, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: vendor; Type: TABLE DATA; Schema: admin; Owner: postgres
--

COPY admin.vendor (vendor_code, partner_id, vendor_name, contact_person, status) FROM stdin;
\.


--
-- Data for Name: warehouse; Type: TABLE DATA; Schema: admin; Owner: postgres
--

COPY admin.warehouse (warehouse_id, warehouse_location, stored_materials) FROM stdin;
\.


--
-- Data for Name: billing_receipt; Type: TABLE DATA; Schema: distribution; Owner: postgres
--

COPY distribution.billing_receipt (billing_receipt_id, delivery_receipt_id, sales_invoice_id, service_billing_id) FROM stdin;
\.


--
-- Data for Name: carrier; Type: TABLE DATA; Schema: distribution; Owner: postgres
--

COPY distribution.carrier (carrier_id, carrier_name, service_type, carrier_count) FROM stdin;
\.


--
-- Data for Name: delivery_order; Type: TABLE DATA; Schema: distribution; Owner: postgres
--

COPY distribution.delivery_order (delivery_order_id, order_status, content_id, is_project_based, is_partial_delivery, service_order_id, production_request_id, stock_transfer_id, sales_order_id, approval_request_id) FROM stdin;
\.


--
-- Data for Name: delivery_receipt; Type: TABLE DATA; Schema: distribution; Owner: postgres
--

COPY distribution.delivery_receipt (delivery_receipt_id, delivery_date, received_by, signature, receipt_status, shipment_id) FROM stdin;
\.


--
-- Data for Name: failed_shipment; Type: TABLE DATA; Schema: distribution; Owner: postgres
--

COPY distribution.failed_shipment (failed_shipment_id, failure_date, failure_reason, resolution_status, shipment_id) FROM stdin;
\.


--
-- Data for Name: goods_issue; Type: TABLE DATA; Schema: distribution; Owner: postgres
--

COPY distribution.goods_issue (goods_issue_id, issue_date, issued_by, billing_receipt_id) FROM stdin;
\.


--
-- Data for Name: logistics_approval_request; Type: TABLE DATA; Schema: distribution; Owner: postgres
--

COPY distribution.logistics_approval_request (approval_request_id, request_date, approval_status, approval_date, approved_by, delivery_order_id) FROM stdin;
\.


--
-- Data for Name: operational_cost; Type: TABLE DATA; Schema: distribution; Owner: postgres
--

COPY distribution.operational_cost (operational_cost_id, additional_cost, total_operational_cost, shipping_cost_id, packing_cost_id) FROM stdin;
DIS-OS-2025-5b37de	50.00	350.00	1	1
DIS-OS-2025-48963a	75.00	650.00	2	2
DIS-OS-2025-ad8e07	60.00	400.00	3	3
DIS-OS-2025-40855e	100.00	417.00	4	4
DIS-OS-2025-3de59c	0.00	175.00	5	5
DIS-OS-2025-30d8db	65.00	427.00	6	6
DIS-OS-2025-1bc391	80.00	669.00	7	7
DIS-OS-2025-129b85	45.00	367.00	8	8
DIS-OS-2025-9f398e	110.00	464.00	9	9
DIS-OS-2025-30ba25	0.00	210.00	10	10
\.


--
-- Data for Name: packing_cost; Type: TABLE DATA; Schema: distribution; Owner: postgres
--

COPY distribution.packing_cost (packing_cost_id, material_cost, labor_cost, total_packing_cost) FROM stdin;
\.


--
-- Data for Name: packing_list; Type: TABLE DATA; Schema: distribution; Owner: postgres
--

COPY distribution.packing_list (packing_list_id, packed_by, packing_status, packing_type, total_items_packed, packing_cost_id, picking_list_id) FROM stdin;
\.


--
-- Data for Name: picking_list; Type: TABLE DATA; Schema: distribution; Owner: postgres
--

COPY distribution.picking_list (picking_list_id, warehouse_id, picked_by, picked_status, picked_date, approval_request_id) FROM stdin;
\.


--
-- Data for Name: rejection; Type: TABLE DATA; Schema: distribution; Owner: postgres
--

COPY distribution.rejection (rejection_id, rejection_status, rejection_reason, rejection_date, delivery_receipt_id) FROM stdin;
\.


--
-- Data for Name: rework_order; Type: TABLE DATA; Schema: distribution; Owner: postgres
--

COPY distribution.rework_order (rework_id, assigned_to, rework_status, rework_date, expected_completion, rejection_id, failed_shipment_id) FROM stdin;
\.


--
-- Data for Name: shipment_details; Type: TABLE DATA; Schema: distribution; Owner: postgres
--

COPY distribution.shipment_details (shipment_id, carrier_id, shipment_date, shipment_status, tracking_number, estimated_arrival_date, actual_arrival_date, failed_shipment_id, packing_list_id, shipping_cost_id) FROM stdin;
a	1	2025-03-22	Delivered	123456	2025-03-22 14:00:00	2025-03-22 08:12:36	\N	1	1
\.


--
-- Data for Name: shipping_cost; Type: TABLE DATA; Schema: distribution; Owner: postgres
--

COPY distribution.shipping_cost (shipping_cost_id, packing_list_id, cost_per_kg, cost_per_km, weight_kg, distance_km, total_shipping_cost) FROM stdin;
\.


--
-- Data for Name: budget_approvals; Type: TABLE DATA; Schema: finance; Owner: postgres
--

COPY finance.budget_approvals (validation_id, downpayments, approval_status) FROM stdin;
\.


--
-- Data for Name: budget_validations; Type: TABLE DATA; Schema: finance; Owner: postgres
--

COPY finance.budget_validations (validation_id, dept_id, validation_date, validated_by, validation_status, remarks, amount_requested, final_approved_amount) FROM stdin;
\.


--
-- Data for Name: attendance_tracking; Type: TABLE DATA; Schema: human_resources; Owner: postgres
--

COPY human_resources.attendance_tracking (attendance_id, employee_id, time_in, time_out, status, updated_at) FROM stdin;
\.


--
-- Data for Name: candidates; Type: TABLE DATA; Schema: human_resources; Owner: postgres
--

COPY human_resources.candidates (candidate_id, job_id, first_name, last_name, email, phone, resume, employment_type, contract_duration, status, date_applied) FROM stdin;
\.


--
-- Data for Name: departments; Type: TABLE DATA; Schema: human_resources; Owner: postgres
--

COPY human_resources.departments (dept_id, dept_name) FROM stdin;
\.


--
-- Data for Name: employee_performance; Type: TABLE DATA; Schema: human_resources; Owner: postgres
--

COPY human_resources.employee_performance (performance_id, employee_id, immediate_superior_id, rating, review_date, comments) FROM stdin;
\.


--
-- Data for Name: employee_salary; Type: TABLE DATA; Schema: human_resources; Owner: postgres
--

COPY human_resources.employee_salary (salary_id, employee_id, base_salary, contract_pay_type, contract_pay_rate, total_hours_worked, total_contract_pay, effective_date) FROM stdin;
\.


--
-- Data for Name: employees; Type: TABLE DATA; Schema: human_resources; Owner: postgres
--

COPY human_resources.employees (employee_id, dept_id, first_name, last_name, email, phone, job_title, employment_type, status, updated_at) FROM stdin;
HR-EMP-2025-0bf227	DEPT-000001	Kate	Tan	katetan@kinetiq.ph	09165824756	\N	Permanent	Active	2025-03-21 11:13:35
HR-EMP-2025-bf22fd	DEPT-000001	James	Marticio	jamesmarticio@kinetiq.ph	\N	\N	Permanent	Active	2025-03-21 11:14:11
HR-EMP-2025-c8223f	DEPT-000001	Robert	Santiago	robertsantiago@kinetiq.ph	\N	\N	Permanent	Active	2025-03-21 11:14:49
\.


--
-- Data for Name: interviews; Type: TABLE DATA; Schema: human_resources; Owner: postgres
--

COPY human_resources.interviews (interview_id, candidate_id, interviewer_id, interview_date, status, feedback, created_at) FROM stdin;
\.


--
-- Data for Name: job_posting; Type: TABLE DATA; Schema: human_resources; Owner: postgres
--

COPY human_resources.job_posting (job_id, request_id, dept_id, "position", description, requirements, employment_type, contract_duration, contract_rate, contract_pay_type, status, created_at) FROM stdin;
\.


--
-- Data for Name: leave_requests; Type: TABLE DATA; Schema: human_resources; Owner: postgres
--

COPY human_resources.leave_requests (leave_id, employee_id, dept_id, immediate_superior_id, management_approval_id, leave_type, start_date, end_date, is_paid, status, updated_at) FROM stdin;
\.


--
-- Data for Name: payroll; Type: TABLE DATA; Schema: human_resources; Owner: postgres
--

COPY human_resources.payroll (payroll_id, employee_id, employment_type, base_salary, work_days, contract_pay_type, contract_pay_rate, total_hours_worked, total_contract_pay, payment_date, payment_status) FROM stdin;
\.


--
-- Data for Name: workforce_allocation; Type: TABLE DATA; Schema: human_resources; Owner: postgres
--

COPY human_resources.workforce_allocation (allocation_id, requesting_dept_id, employee_id, current_dept_id, reason, approval_status, status, start_date, end_date, approval_date) FROM stdin;
\.


--
-- Data for Name: deprecation_report; Type: TABLE DATA; Schema: inventory; Owner: postgres
--

COPY inventory.deprecation_report (deprecation_report_id, item_id, content_id, quantity, reported_date, status, warehouse_id, employee_id) FROM stdin;
\.


--
-- Data for Name: inventory_adjustments; Type: TABLE DATA; Schema: inventory; Owner: postgres
--

COPY inventory.inventory_adjustments (adjustment_id, item_id, adjustment_type, quantity, adjustment_date, employee_id) FROM stdin;
\.


--
-- Data for Name: inventory_cyclic_counts; Type: TABLE DATA; Schema: inventory; Owner: postgres
--

COPY inventory.inventory_cyclic_counts (inventory_count_id, item_md_id, item_onhand, item_actually_counted, difference_in_qty, employee_id, status, remarks, time_period) FROM stdin;
\.


--
-- Data for Name: inventory_item; Type: TABLE DATA; Schema: inventory; Owner: postgres
--

COPY inventory.inventory_item (inventory_item_id, item_id, content_id, expiry_date, unit_cost, unit_of_measure, item_status, warehouse_id) FROM stdin;
\.


--
-- Data for Name: inventory_item_master_data; Type: TABLE DATA; Schema: inventory; Owner: postgres
--

COPY inventory.inventory_item_master_data (item_md_id, item_id, unit_cost, minimum_threshold, maximum_threshold, total_stock, stock_on_order, stock_committed, available_stock, last_update) FROM stdin;
\.


--
-- Data for Name: warehouse_movement; Type: TABLE DATA; Schema: inventory; Owner: postgres
--

COPY inventory.warehouse_movement (movement_id, item_id, movement_type, quantity, movement_date, destination, source, reference_id_purchase_order, reference_id_order) FROM stdin;
\.


--
-- Data for Name: bill_of_materials; Type: TABLE DATA; Schema: mrp; Owner: postgres
--

COPY mrp.bill_of_materials (bom_id, product_description, unit_of_measure, specific_notes, quantity_of_unit, cost_per_raw_material, total_cost_of_raw_materials) FROM stdin;
\.


--
-- Data for Name: non_project_order_pricing; Type: TABLE DATA; Schema: mrp; Owner: postgres
--

COPY mrp.non_project_order_pricing (non_project_costing_id, quantity, mrp_base_price, final_price) FROM stdin;
\.


--
-- Data for Name: overall_production; Type: TABLE DATA; Schema: mrp; Owner: postgres
--

COPY mrp.overall_production (cost_id, product_id, bom_id, cost_of_raw_materials, cost_of_production, labor_cost, total_mrp_cost) FROM stdin;
\.


--
-- Data for Name: principal_items; Type: TABLE DATA; Schema: mrp; Owner: postgres
--

COPY mrp.principal_items (principal_item_id, service_request_id, service_order_id, quantity, item_id, unit_price, markup_price, pricing_date) FROM stdin;
\.


--
-- Data for Name: document_header; Type: TABLE DATA; Schema: operations; Owner: postgres
--

COPY operations.document_header (document_id, document_type, vendor_code, document_no, transaction_id, module_request, status, posting_date, delivery_date, document_date, buyer, owner, initial_amount, discount_rate, discount_amount, freight, tax_rate, tax_amount, transaction_cost) FROM stdin;
\.


--
-- Data for Name: document_items; Type: TABLE DATA; Schema: operations; Owner: postgres
--

COPY operations.document_items (content_id, item_id, document_id, material_id, serial_id, productdocu_id, external_id, quantity, total, batch_no, warehouse_loc) FROM stdin;
\.


--
-- Data for Name: external_module; Type: TABLE DATA; Schema: operations; Owner: postgres
--

COPY operations.external_module (external_id, purchase_id, approval_id, goods_issue_id, approval_request_id, billing_receipt_id, delivery_receipt_id, project_resources_id, project_tracking_id, project_request_id, production_order_detail_id, rework_id, depreciation_report_id) FROM stdin;
\.


--
-- Data for Name: product_document_items; Type: TABLE DATA; Schema: operations; Owner: postgres
--

COPY operations.product_document_items (productdocu_id, product_id, quantity_rejected, defect_type, selling_price, manuf_date, expiry_date) FROM stdin;
\.


--
-- Data for Name: serial_tracking; Type: TABLE DATA; Schema: operations; Owner: postgres
--

COPY operations.serial_tracking (serial_id, document_id, serial_no) FROM stdin;
\.


--
-- Data for Name: components; Type: TABLE DATA; Schema: production; Owner: postgres
--

COPY production.components (component_id, component_name, component_description, unit_of_measure, reorder_point, current_stock) FROM stdin;
\.


--
-- Data for Name: delivery_requests; Type: TABLE DATA; Schema: production; Owner: postgres
--

COPY production.delivery_requests (delivery_request_id, production_order_id, request_type, request_date, requested_delivery_date, component_id, quantity_requested) FROM stdin;
\.


--
-- Data for Name: equipment; Type: TABLE DATA; Schema: production; Owner: postgres
--

COPY production.equipment (equipment_id, equipment_name, description, availability_status, last_maintenance_date) FROM stdin;
\.


--
-- Data for Name: labor; Type: TABLE DATA; Schema: production; Owner: postgres
--

COPY production.labor (labor_id, production_order_id, employee_id, date_worked, hours_worked) FROM stdin;
\.


--
-- Data for Name: production_orders_details; Type: TABLE DATA; Schema: production; Owner: postgres
--

COPY production.production_orders_details (production_order_detail_id, production_order_id, actual_quantity, cost_of_production, miscellaneous_costs, equipment_id, rework_required, rework_notes, content_id) FROM stdin;
\.


--
-- Data for Name: production_orders_header; Type: TABLE DATA; Schema: production; Owner: postgres
--

COPY production.production_orders_header (production_order_id, project_id, bom_id, start_date, end_date, status, target_quantity, notes) FROM stdin;
\.


--
-- Data for Name: contractual_worker_request; Type: TABLE DATA; Schema: project_management; Owner: postgres
--

COPY project_management.contractual_worker_request (request_id, intrnl_project_id, dept_id, job_title, job_description, required_position, employment_type) FROM stdin;
\.


--
-- Data for Name: external_project_cost_management; Type: TABLE DATA; Schema: project_management; Owner: postgres
--

COPY project_management.external_project_cost_management (project_resources_id, project_id, cost_id, project_budget_approval) FROM stdin;
\.


--
-- Data for Name: external_project_details; Type: TABLE DATA; Schema: project_management; Owner: postgres
--

COPY project_management.external_project_details (project_id, ext_project_request_id, project_status) FROM stdin;
\.


--
-- Data for Name: external_project_labor; Type: TABLE DATA; Schema: project_management; Owner: postgres
--

COPY project_management.external_project_labor (project_labor_id, project_id, employee_id) FROM stdin;
\.


--
-- Data for Name: external_project_request; Type: TABLE DATA; Schema: project_management; Owner: postgres
--

COPY project_management.external_project_request (ext_project_request_id, ext_project_name, ext_project_description, approval_id, item_id) FROM stdin;
\.


--
-- Data for Name: external_project_task_list; Type: TABLE DATA; Schema: project_management; Owner: postgres
--

COPY project_management.external_project_task_list (task_id, project_id, task_description, task_status, task_deadline, employee_id) FROM stdin;
\.


--
-- Data for Name: external_project_tracking; Type: TABLE DATA; Schema: project_management; Owner: postgres
--

COPY project_management.external_project_tracking (project_tracking_id, project_id, project_milestone, start_date, estimated_end_date, project_warranty_id, project_issue) FROM stdin;
\.


--
-- Data for Name: external_project_warranty; Type: TABLE DATA; Schema: project_management; Owner: postgres
--

COPY project_management.external_project_warranty (project_warranty_id, project_id, warranty_coverage_yr, warranty_start_date, warranty_end_date) FROM stdin;
\.


--
-- Data for Name: internal_project_details; Type: TABLE DATA; Schema: project_management; Owner: postgres
--

COPY project_management.internal_project_details (intrnl_project_id, project_request_id, intrnl_project_status) FROM stdin;
\.


--
-- Data for Name: internal_project_labor; Type: TABLE DATA; Schema: project_management; Owner: postgres
--

COPY project_management.internal_project_labor (intrnl_project_labor_id, intrnl_project_id, employee_id) FROM stdin;
\.


--
-- Data for Name: internal_project_request; Type: TABLE DATA; Schema: project_management; Owner: postgres
--

COPY project_management.internal_project_request (project_request_id, project_name, project_description, request_date, request_valid_date, request_starting_date, approval_id, employee_id, dept_id, project_type) FROM stdin;
\.


--
-- Data for Name: internal_project_task_list; Type: TABLE DATA; Schema: project_management; Owner: postgres
--

COPY project_management.internal_project_task_list (intrnl_task_id, intrnl_project_id, intrnl_task_description, intrnl_task_status, intrnl_task_deadline, employee_id) FROM stdin;
\.


--
-- Data for Name: internal_project_tracking; Type: TABLE DATA; Schema: project_management; Owner: postgres
--

COPY project_management.internal_project_tracking (intrnl_project_tracking_id, intrnl_project_id, intrnl_start_date, intrnl_estimated_end_date, intrnl_project_issue) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can view permission	1	view_permission
5	Can add group	2	add_group
6	Can change group	2	change_group
7	Can delete group	2	delete_group
8	Can view group	2	view_group
9	Can add user	3	add_user
10	Can change user	3	change_user
11	Can delete user	3	delete_user
12	Can view user	3	view_user
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add log entry	6	add_logentry
22	Can change log entry	6	change_logentry
23	Can delete log entry	6	delete_logentry
24	Can view log entry	6	view_logentry
25	Can add blanket agreement	8	add_blanketagreement
26	Can change blanket agreement	8	change_blanketagreement
27	Can delete blanket agreement	8	delete_blanketagreement
28	Can view blanket agreement	8	view_blanketagreement
29	Can add sales costing	9	add_salescosting
30	Can change sales costing	9	change_salescosting
31	Can delete sales costing	9	delete_salescosting
32	Can view sales costing	9	view_salescosting
33	Can add campaigns	10	add_campaigns
34	Can change campaigns	10	change_campaigns
35	Can delete campaigns	10	delete_campaigns
36	Can view campaigns	10	view_campaigns
37	Can add leads	11	add_leads
38	Can change leads	11	change_leads
39	Can delete leads	11	delete_leads
40	Can view leads	11	view_leads
41	Can add campaign contacts	12	add_campaigncontacts
42	Can change campaign contacts	12	change_campaigncontacts
43	Can delete campaign contacts	12	delete_campaigncontacts
44	Can view campaign contacts	12	view_campaigncontacts
45	Can add opportunities	13	add_opportunities
46	Can change opportunities	13	change_opportunities
47	Can delete opportunities	13	delete_opportunities
48	Can view opportunities	13	view_opportunities
49	Can add ticket	14	add_ticket
50	Can change ticket	14	change_ticket
51	Can delete ticket	14	delete_ticket
52	Can view ticket	14	view_ticket
53	Can add ticket convo	15	add_ticketconvo
54	Can change ticket convo	15	change_ticketconvo
55	Can delete ticket convo	15	delete_ticketconvo
56	Can view ticket convo	15	view_ticketconvo
57	Can add customer	16	add_customer
58	Can change customer	16	change_customer
59	Can delete customer	16	delete_customer
60	Can view customer	16	view_customer
61	Can add shipping details	17	add_shippingdetails
62	Can change shipping details	17	change_shippingdetails
63	Can delete shipping details	17	delete_shippingdetails
64	Can view shipping details	17	view_shippingdetails
65	Can add sales invoices	18	add_salesinvoices
66	Can change sales invoices	18	change_salesinvoices
67	Can delete sales invoices	18	delete_salesinvoices
68	Can view sales invoices	18	view_salesinvoices
69	Can add order	19	add_order
70	Can change order	19	change_order
71	Can delete order	19	delete_order
72	Can view order	19	view_order
73	Can add quotation	20	add_quotation
74	Can change quotation	20	change_quotation
75	Can delete quotation	20	delete_quotation
76	Can view quotation	20	view_quotation
77	Can add statement	21	add_statement
78	Can change statement	21	change_statement
79	Can delete statement	21	delete_statement
80	Can view statement	21	view_statement
81	Can add statement item	7	add_statementitem
82	Can change statement item	7	change_statementitem
83	Can delete statement item	7	delete_statementitem
84	Can view statement item	7	view_statementitem
85	Can add payments	25	add_payments
86	Can change payments	25	change_payments
87	Can delete payments	25	delete_payments
88	Can view payments	25	view_payments
89	Can add receipt	26	add_receipt
90	Can change receipt	26	change_receipt
91	Can delete receipt	26	delete_receipt
92	Can view receipt	26	view_receipt
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$870000$1SUH5uhi1c8c1TQ3n0wr7u$hqwmH9tEAsqzGlFyXcrHB9tsqIxMnwfbFu9d2uZpXiI=	2025-03-22 15:43:24.696383+08	t	admin				t	t	2025-03-22 01:31:07.652069+08
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2025-03-22 01:37:10.366265+08	SALES-QT-2025-640e87	Quotation object (SALES-QT-2025-640e87)	2	[{"changed": {"fields": ["Statement"]}}]	20	1
2	2025-03-22 01:37:15.218201+08	SALES-QT-2025-6ab1ab	Quotation object (SALES-QT-2025-6ab1ab)	2	[{"changed": {"fields": ["Statement"]}}]	20	1
3	2025-03-22 01:37:18.91358+08	SALES-QT-2025-9f9e0a	Quotation object (SALES-QT-2025-9f9e0a)	2	[{"changed": {"fields": ["Statement"]}}]	20	1
4	2025-03-22 01:37:23.258041+08	SALES-QT-2025-a23d37	Quotation object (SALES-QT-2025-a23d37)	2	[{"changed": {"fields": ["Statement"]}}]	20	1
5	2025-03-22 01:37:30.124389+08	SALES-QT-2025-c45dbc	Quotation object (SALES-QT-2025-c45dbc)	2	[{"changed": {"fields": ["Statement"]}}]	20	1
6	2025-03-22 01:37:36.194919+08	SALES-QT-2025-cd75f0	Quotation object (SALES-QT-2025-cd75f0)	2	[{"changed": {"fields": ["Statement"]}}]	20	1
7	2025-03-22 01:37:45.334043+08	SALES-QT-2025-d3f461	Quotation object (SALES-QT-2025-d3f461)	2	[{"changed": {"fields": ["Statement"]}}]	20	1
8	2025-03-22 01:37:49.792446+08	SALES-QT-2025-d57143	Quotation object (SALES-QT-2025-d57143)	2	[{"changed": {"fields": ["Statement"]}}]	20	1
9	2025-03-22 01:37:53.297009+08	SALES-QT-2025-d5d1e7	Quotation object (SALES-QT-2025-d5d1e7)	2	[{"changed": {"fields": ["Statement"]}}]	20	1
10	2025-03-22 01:37:56.763286+08	SALES-QT-2025-f1469f	Quotation object (SALES-QT-2025-f1469f)	2	[{"changed": {"fields": ["Statement"]}}]	20	1
11	2025-03-22 01:38:12.42929+08	SALES-STI-2025-fa61e8	StatementItem object (SALES-STI-2025-fa61e8)	2	[{"changed": {"fields": ["Statement", "Product"]}}]	7	1
12	2025-03-22 01:38:20.929452+08	SALES-STI-2025-fa61e8	StatementItem object (SALES-STI-2025-fa61e8)	2	[{"changed": {"fields": ["Statement"]}}]	7	1
13	2025-03-22 01:38:26.020156+08	SALES-STI-2025-eeb086	StatementItem object (SALES-STI-2025-eeb086)	2	[{"changed": {"fields": ["Statement", "Product"]}}]	7	1
14	2025-03-22 01:38:29.965055+08	SALES-STI-2025-d66c43	StatementItem object (SALES-STI-2025-d66c43)	2	[{"changed": {"fields": ["Statement", "Product"]}}]	7	1
15	2025-03-22 01:38:34.033841+08	SALES-STI-2025-cee3fb	StatementItem object (SALES-STI-2025-cee3fb)	2	[{"changed": {"fields": ["Statement", "Product"]}}]	7	1
16	2025-03-22 01:38:39.89074+08	SALES-STI-2025-19e80b	StatementItem object (SALES-STI-2025-19e80b)	2	[{"changed": {"fields": ["Statement", "Product"]}}]	7	1
17	2025-03-22 01:38:43.510457+08	SALES-STI-2025-217edd	StatementItem object (SALES-STI-2025-217edd)	2	[{"changed": {"fields": ["Statement", "Product"]}}]	7	1
18	2025-03-22 01:38:47.504213+08	SALES-STI-2025-29d6a9	StatementItem object (SALES-STI-2025-29d6a9)	2	[{"changed": {"fields": ["Statement", "Product"]}}]	7	1
19	2025-03-22 01:38:51.454907+08	SALES-STI-2025-378a01	StatementItem object (SALES-STI-2025-378a01)	2	[{"changed": {"fields": ["Statement", "Product"]}}]	7	1
20	2025-03-22 01:38:57.337582+08	SALES-STI-2025-3834ab	StatementItem object (SALES-STI-2025-3834ab)	2	[{"changed": {"fields": ["Statement", "Product"]}}]	7	1
21	2025-03-22 01:39:06.183699+08	SALES-STI-2025-3ae348	StatementItem object (SALES-STI-2025-3ae348)	2	[{"changed": {"fields": ["Statement", "Product"]}}]	7	1
22	2025-03-22 01:39:09.886098+08	SALES-STI-2025-3ae348	StatementItem object (SALES-STI-2025-3ae348)	2	[]	7	1
23	2025-03-22 01:39:15.573697+08	SALES-STI-2025-4794e4	StatementItem object (SALES-STI-2025-4794e4)	2	[{"changed": {"fields": ["Statement", "Product"]}}]	7	1
24	2025-03-22 01:39:19.907013+08	SALES-STI-2025-4794e4	StatementItem object (SALES-STI-2025-4794e4)	2	[]	7	1
25	2025-03-22 01:39:26.023852+08	SALES-STI-2025-6db696	StatementItem object (SALES-STI-2025-6db696)	2	[{"changed": {"fields": ["Statement", "Product"]}}]	7	1
26	2025-03-22 01:39:34.30619+08	SALES-STI-2025-9affb3	StatementItem object (SALES-STI-2025-9affb3)	2	[{"changed": {"fields": ["Statement", "Product"]}}]	7	1
27	2025-03-22 01:39:39.523988+08	SALES-STI-2025-b3d86b	StatementItem object (SALES-STI-2025-b3d86b)	2	[{"changed": {"fields": ["Statement", "Product"]}}]	7	1
28	2025-03-22 01:39:47.46544+08	SALES-STI-2025-d66c43	StatementItem object (SALES-STI-2025-d66c43)	2	[]	7	1
29	2025-03-22 01:40:23.40104+08	SALES-STI-2025-19e80b	StatementItem object (SALES-STI-2025-19e80b)	2	[{"changed": {"fields": ["Product"]}}]	7	1
30	2025-03-22 01:40:27.817036+08	SALES-STI-2025-217edd	StatementItem object (SALES-STI-2025-217edd)	2	[{"changed": {"fields": ["Product"]}}]	7	1
31	2025-03-22 01:40:32.378359+08	SALES-STI-2025-29d6a9	StatementItem object (SALES-STI-2025-29d6a9)	2	[{"changed": {"fields": ["Product"]}}]	7	1
32	2025-03-22 01:40:57.139663+08	SALES-STI-2025-378a01	StatementItem object (SALES-STI-2025-378a01)	2	[{"changed": {"fields": ["Statement"]}}]	7	1
33	2025-03-22 01:41:12.96623+08	SALES-STI-2025-19e80b	StatementItem object (SALES-STI-2025-19e80b)	2	[{"changed": {"fields": ["Product"]}}]	7	1
34	2025-03-22 01:41:16.732299+08	SALES-STI-2025-217edd	StatementItem object (SALES-STI-2025-217edd)	2	[]	7	1
35	2025-03-22 01:41:20.914288+08	SALES-STI-2025-29d6a9	StatementItem object (SALES-STI-2025-29d6a9)	2	[]	7	1
36	2025-03-22 01:41:24.19196+08	SALES-STI-2025-378a01	StatementItem object (SALES-STI-2025-378a01)	2	[]	7	1
37	2025-03-22 01:41:27.406257+08	SALES-STI-2025-3834ab	StatementItem object (SALES-STI-2025-3834ab)	2	[]	7	1
38	2025-03-22 01:41:29.911558+08	SALES-STI-2025-4794e4	StatementItem object (SALES-STI-2025-4794e4)	2	[]	7	1
39	2025-03-22 01:41:41.827907+08	SALES-STI-2025-19e80b	StatementItem object (SALES-STI-2025-19e80b)	2	[]	7	1
40	2025-03-22 01:41:53.37407+08	SALES-STI-2025-217edd	StatementItem object (SALES-STI-2025-217edd)	2	[{"changed": {"fields": ["Product"]}}]	7	1
41	2025-03-22 01:42:09.168552+08	SALES-STI-2025-29d6a9	StatementItem object (SALES-STI-2025-29d6a9)	2	[{"changed": {"fields": ["Product"]}}]	7	1
42	2025-03-22 01:42:44.977361+08	SALES-STI-2025-3834ab	StatementItem object (SALES-STI-2025-3834ab)	2	[{"changed": {"fields": ["Product"]}}]	7	1
43	2025-03-22 01:42:53.111818+08	SALES-STI-2025-3ae348	StatementItem object (SALES-STI-2025-3ae348)	2	[{"changed": {"fields": ["Product"]}}]	7	1
44	2025-03-22 01:43:07.186032+08	SALES-STI-2025-4794e4	StatementItem object (SALES-STI-2025-4794e4)	2	[{"changed": {"fields": ["Product"]}}]	7	1
45	2025-03-22 01:43:14.76894+08	SALES-STI-2025-6db696	StatementItem object (SALES-STI-2025-6db696)	2	[{"changed": {"fields": ["Product"]}}]	7	1
46	2025-03-22 01:43:29.632473+08	SALES-STI-2025-9affb3	StatementItem object (SALES-STI-2025-9affb3)	2	[{"changed": {"fields": ["Product"]}}]	7	1
47	2025-03-22 01:43:47.106047+08	SALES-STI-2025-b3d86b	StatementItem object (SALES-STI-2025-b3d86b)	2	[{"changed": {"fields": ["Product"]}}]	7	1
48	2025-03-22 01:44:05.148289+08	SALES-STI-2025-cee3fb	StatementItem object (SALES-STI-2025-cee3fb)	2	[{"changed": {"fields": ["Product"]}}]	7	1
49	2025-03-22 01:44:19.052117+08	SALES-STI-2025-d66c43	StatementItem object (SALES-STI-2025-d66c43)	2	[{"changed": {"fields": ["Product"]}}]	7	1
50	2025-03-22 01:44:29.108655+08	SALES-STI-2025-eeb086	StatementItem object (SALES-STI-2025-eeb086)	2	[{"changed": {"fields": ["Product"]}}]	7	1
51	2025-03-22 01:44:44.733482+08	SALES-STI-2025-fa61e8	StatementItem object (SALES-STI-2025-fa61e8)	2	[{"changed": {"fields": ["Product"]}}]	7	1
52	2025-03-22 01:45:17.777921+08	SALES-STI-2025-378a01	StatementItem object (SALES-STI-2025-378a01)	2	[{"changed": {"fields": ["Product"]}}]	7	1
53	2025-03-22 01:46:44.93864+08	SALES-ORD-2025-ee1ff2	Order object (SALES-ORD-2025-ee1ff2)	2	[{"changed": {"fields": ["Quotation", "Statement"]}}]	19	1
54	2025-03-22 01:46:48.969102+08	SALES-ORD-2025-e150d2	Order object (SALES-ORD-2025-e150d2)	2	[{"changed": {"fields": ["Quotation", "Statement"]}}]	19	1
55	2025-03-22 01:46:54.599595+08	SALES-ORD-2025-e0deca	Order object (SALES-ORD-2025-e0deca)	2	[{"changed": {"fields": ["Quotation", "Statement"]}}]	19	1
56	2025-03-22 01:47:02.462389+08	SALES-ORD-2025-dc2b39	Order object (SALES-ORD-2025-dc2b39)	2	[{"changed": {"fields": ["Quotation", "Statement"]}}]	19	1
57	2025-03-22 01:47:09.657981+08	SALES-ORD-2025-8a5f44	Order object (SALES-ORD-2025-8a5f44)	2	[{"changed": {"fields": ["Quotation", "Statement"]}}]	19	1
58	2025-03-22 01:47:17.436836+08	SALES-ORD-2025-889575	Order object (SALES-ORD-2025-889575)	2	[{"changed": {"fields": ["Quotation", "Statement"]}}]	19	1
59	2025-03-22 01:47:25.323082+08	SALES-ORD-2025-5ae409	Order object (SALES-ORD-2025-5ae409)	2	[{"changed": {"fields": ["Quotation", "Statement"]}}]	19	1
60	2025-03-22 01:47:31.578685+08	SALES-ORD-2025-26f2f7	Order object (SALES-ORD-2025-26f2f7)	2	[{"changed": {"fields": ["Quotation", "Statement"]}}]	19	1
61	2025-03-22 01:47:36.907181+08	SALES-ORD-2025-1722d3	Order object (SALES-ORD-2025-1722d3)	2	[{"changed": {"fields": ["Quotation", "Statement"]}}]	19	1
62	2025-03-22 01:47:42.181822+08	SALES-ORD-2025-04a32f	Order object (SALES-ORD-2025-04a32f)	2	[{"changed": {"fields": ["Quotation", "Statement"]}}]	19	1
63	2025-03-22 15:00:39.936904+08	a	SalesInvoices object (a)	1	[{"added": {}}]	18	1
64	2025-03-22 15:01:27.447997+08	a	SalesInvoices object (a)	1	[{"added": {}}]	18	1
65	2025-03-22 15:01:45.933569+08	a	SalesInvoices object (a)	1	[{"added": {}}]	18	1
66	2025-03-22 15:02:02.426398+08	a	SalesInvoices object (a)	1	[{"added": {}}]	18	1
67	2025-03-22 15:02:26.846213+08	a	SalesInvoices object (a)	1	[{"added": {}}]	18	1
68	2025-03-22 15:02:46.930036+08	a	SalesInvoices object (a)	1	[{"added": {}}]	18	1
69	2025-03-22 15:03:08.81314+08	a	SalesInvoices object (a)	1	[{"added": {}}]	18	1
70	2025-03-22 15:03:31.432569+08	a	SalesInvoices object (a)	1	[{"added": {}}]	18	1
71	2025-03-22 15:03:58.330267+08	a	SalesInvoices object (a)	1	[{"added": {}}]	18	1
72	2025-03-22 15:04:19.032578+08	a	SalesInvoices object (a)	1	[{"added": {}}]	18	1
73	2025-03-22 15:28:42.570503+08	a	Campaigns object (a)	1	[{"added": {}}]	10	1
74	2025-03-22 15:29:19.668156+08	a	Campaigns object (a)	1	[{"added": {}}]	10	1
75	2025-03-22 15:29:54.986661+08	a	Campaigns object (a)	1	[{"added": {}}]	10	1
76	2025-03-22 15:30:21.31509+08	a	Campaigns object (a)	1	[{"added": {}}]	10	1
77	2025-03-22 15:30:51.055823+08	a	Campaigns object (a)	1	[{"added": {}}]	10	1
78	2025-03-22 15:31:31.541901+08	a	Campaigns object (a)	1	[{"added": {}}]	10	1
79	2025-03-22 15:32:00.684792+08	a	Campaigns object (a)	1	[{"added": {}}]	10	1
80	2025-03-22 15:32:29.396795+08	a	Campaigns object (a)	1	[{"added": {}}]	10	1
81	2025-03-22 15:32:53.120303+08	a	Campaigns object (a)	1	[{"added": {}}]	10	1
82	2025-03-22 15:33:18.788552+08	a	Campaigns object (a)	1	[{"added": {}}]	10	1
83	2025-03-22 15:34:15.83503+08	a	Leads object (a)	1	[{"added": {}}]	11	1
84	2025-03-22 15:34:37.668223+08	a	Leads object (a)	1	[{"added": {}}]	11	1
85	2025-03-22 15:34:59.580035+08	a	Leads object (a)	1	[{"added": {}}]	11	1
86	2025-03-22 15:35:22.841044+08	a	Leads object (a)	1	[{"added": {}}]	11	1
87	2025-03-22 15:35:49.097813+08	a	Leads object (a)	1	[{"added": {}}]	11	1
88	2025-03-22 15:36:14.086945+08	a	Leads object (a)	1	[{"added": {}}]	11	1
89	2025-03-22 15:36:38.983131+08	a	Leads object (a)	1	[{"added": {}}]	11	1
90	2025-03-22 15:36:59.474231+08	a	Leads object (a)	1	[{"added": {}}]	11	1
91	2025-03-22 15:37:18.749874+08	a	Leads object (a)	1	[{"added": {}}]	11	1
92	2025-03-22 15:37:36.746605+08	a	Leads object (a)	1	[{"added": {}}]	11	1
93	2025-03-22 15:37:55.246886+08	a	CampaignContacts object (a)	1	[{"added": {}}]	12	1
94	2025-03-22 15:38:16.53007+08	a	CampaignContacts object (a)	1	[{"added": {}}]	12	1
95	2025-03-22 15:38:35.156533+08	a	CampaignContacts object (a)	1	[{"added": {}}]	12	1
96	2025-03-22 15:39:12.811588+08	SALES-CONTACT-2025-05ef71	CampaignContacts object (SALES-CONTACT-2025-05ef71)	2	[]	12	1
97	2025-03-22 15:39:25.44467+08	SALES-CONTACT-2025-8a5985	CampaignContacts object (SALES-CONTACT-2025-8a5985)	2	[{"changed": {"fields": ["Campaign", "Response status"]}}]	12	1
98	2025-03-22 15:39:35.650302+08	SALES-CONTACT-2025-cee938	CampaignContacts object (SALES-CONTACT-2025-cee938)	2	[{"changed": {"fields": ["Lead", "Response status"]}}]	12	1
99	2025-03-22 15:39:50.263493+08	a	CampaignContacts object (a)	1	[{"added": {}}]	12	1
100	2025-03-22 15:40:02.917705+08	a	CampaignContacts object (a)	1	[{"added": {}}]	12	1
101	2025-03-22 15:40:27.70812+08	a	CampaignContacts object (a)	1	[{"added": {}}]	12	1
102	2025-03-22 15:40:40.090387+08	a	CampaignContacts object (a)	1	[{"added": {}}]	12	1
103	2025-03-22 15:40:54.726247+08	a	CampaignContacts object (a)	1	[{"added": {}}]	12	1
104	2025-03-22 15:41:04.651334+08	a	CampaignContacts object (a)	1	[{"added": {}}]	12	1
105	2025-03-22 15:41:10.938705+08	a	CampaignContacts object (a)	1	[{"added": {}}]	12	1
106	2025-03-22 15:46:46.638925+08	a	BusinessPartnerMaster object (a)	1	[{"added": {}}]	23	1
107	2025-03-22 15:47:32.061463+08	a	BusinessPartnerMaster object (a)	1	[{"added": {}}]	23	1
108	2025-03-22 15:47:48.431442+08	a	BusinessPartnerMaster object (a)	1	[{"added": {}}]	23	1
109	2025-03-22 15:48:16.362988+08	a	BusinessPartnerMaster object (a)	1	[{"added": {}}]	23	1
110	2025-03-22 15:48:22.178102+08	ADMIN-PARTNER-2025-3c2564	BusinessPartnerMaster object (ADMIN-PARTNER-2025-3c2564)	2	[{"changed": {"fields": ["Category"]}}]	23	1
111	2025-03-22 15:48:24.913037+08	ADMIN-PARTNER-2025-3c2564	BusinessPartnerMaster object (ADMIN-PARTNER-2025-3c2564)	2	[]	23	1
112	2025-03-22 15:48:30.224645+08	ADMIN-PARTNER-2025-95223d	BusinessPartnerMaster object (ADMIN-PARTNER-2025-95223d)	2	[{"changed": {"fields": ["Category"]}}]	23	1
113	2025-03-22 15:48:35.000371+08	ADMIN-PARTNER-2025-adcdfc	BusinessPartnerMaster object (ADMIN-PARTNER-2025-adcdfc)	2	[{"changed": {"fields": ["Category"]}}]	23	1
114	2025-03-22 15:48:41.656695+08	ADMIN-PARTNER-2025-afee8b	BusinessPartnerMaster object (ADMIN-PARTNER-2025-afee8b)	2	[{"changed": {"fields": ["Category"]}}]	23	1
115	2025-03-22 15:48:44.719013+08	ADMIN-PARTNER-2025-95223d	BusinessPartnerMaster object (ADMIN-PARTNER-2025-95223d)	2	[]	23	1
116	2025-03-22 15:48:48.427452+08	ADMIN-PARTNER-2025-adcdfc	BusinessPartnerMaster object (ADMIN-PARTNER-2025-adcdfc)	2	[]	23	1
117	2025-03-22 15:49:10.664392+08	a	BusinessPartnerMaster object (a)	1	[{"added": {}}]	23	1
118	2025-03-22 15:49:26.288765+08	a	BusinessPartnerMaster object (a)	1	[{"added": {}}]	23	1
119	2025-03-22 15:49:41.620995+08	a	BusinessPartnerMaster object (a)	1	[{"added": {}}]	23	1
120	2025-03-22 15:49:56.969232+08	a	BusinessPartnerMaster object (a)	1	[{"added": {}}]	23	1
121	2025-03-22 15:50:58.404157+08	a	Opportunities object (a)	1	[{"added": {}}]	13	1
122	2025-03-22 15:51:34.233174+08	a	Opportunities object (a)	1	[{"added": {}}]	13	1
123	2025-03-22 15:52:00.741656+08	a	Opportunities object (a)	1	[{"added": {}}]	13	1
124	2025-03-22 15:52:39.303759+08	a	Opportunities object (a)	1	[{"added": {}}]	13	1
125	2025-03-22 15:53:34.45473+08	a	Opportunities object (a)	1	[{"added": {}}]	13	1
126	2025-03-22 15:54:34.903816+08	a	Opportunities object (a)	1	[{"added": {}}]	13	1
127	2025-03-22 15:55:15.771363+08	a	Opportunities object (a)	1	[{"added": {}}]	13	1
128	2025-03-22 15:55:46.76954+08	a	Opportunities object (a)	1	[{"added": {}}]	13	1
129	2025-03-22 15:56:21.556113+08	a	Opportunities object (a)	1	[{"added": {}}]	13	1
130	2025-03-22 15:56:51.057739+08	a	Opportunities object (a)	1	[{"added": {}}]	13	1
131	2025-03-22 15:57:23.825559+08	a	Ticket object (a)	1	[{"added": {}}]	14	1
132	2025-03-22 15:57:47.251512+08	a	Ticket object (a)	1	[{"added": {}}]	14	1
133	2025-03-22 15:58:06.620696+08	a	Ticket object (a)	1	[{"added": {}}]	14	1
134	2025-03-22 15:58:35.278004+08	a	Ticket object (a)	1	[{"added": {}}]	14	1
135	2025-03-22 15:58:59.004711+08	a	Ticket object (a)	1	[{"added": {}}]	14	1
136	2025-03-22 15:59:26.677603+08	a	Ticket object (a)	1	[{"added": {}}]	14	1
137	2025-03-22 15:59:50.76351+08	a	Ticket object (a)	1	[{"added": {}}]	14	1
138	2025-03-22 16:00:09.030421+08	a	Ticket object (a)	1	[{"added": {}}]	14	1
139	2025-03-22 16:00:33.671249+08	a	Ticket object (a)	1	[{"added": {}}]	14	1
140	2025-03-22 16:00:54.532733+08	a	Ticket object (a)	1	[{"added": {}}]	14	1
141	2025-03-22 16:01:09.080757+08	a	TicketConvo object (a)	1	[{"added": {}}]	15	1
142	2025-03-22 16:01:18.532963+08	a	TicketConvo object (a)	1	[{"added": {}}]	15	1
143	2025-03-22 16:01:24.427953+08	a	TicketConvo object (a)	1	[{"added": {}}]	15	1
144	2025-03-22 16:01:33.342922+08	a	TicketConvo object (a)	1	[{"added": {}}]	15	1
145	2025-03-22 16:01:41.008414+08	a	TicketConvo object (a)	1	[{"added": {}}]	15	1
146	2025-03-22 16:01:49.525054+08	a	TicketConvo object (a)	1	[{"added": {}}]	15	1
147	2025-03-22 16:01:57.02158+08	a	TicketConvo object (a)	1	[{"added": {}}]	15	1
148	2025-03-22 16:02:06.363152+08	a	TicketConvo object (a)	1	[{"added": {}}]	15	1
149	2025-03-22 16:02:16.208987+08	a	TicketConvo object (a)	1	[{"added": {}}]	15	1
150	2025-03-22 16:02:26.564357+08	a	TicketConvo object (a)	1	[{"added": {}}]	15	1
151	2025-03-22 16:09:18.768739+08	a	OperationalCost object (a)	1	[{"added": {}}]	27	1
152	2025-03-22 16:09:41.184672+08	a	OperationalCost object (a)	1	[{"added": {}}]	27	1
153	2025-03-22 16:09:52.960073+08	a	OperationalCost object (a)	1	[{"added": {}}]	27	1
154	2025-03-22 16:10:05.054675+08	a	OperationalCost object (a)	1	[{"added": {}}]	27	1
155	2025-03-22 16:10:12.950495+08	a	OperationalCost object (a)	1	[{"added": {}}]	27	1
156	2025-03-22 16:10:20.554863+08	a	OperationalCost object (a)	1	[{"added": {}}]	27	1
157	2025-03-22 16:10:32.019498+08	a	OperationalCost object (a)	1	[{"added": {}}]	27	1
158	2025-03-22 16:10:42.51072+08	a	OperationalCost object (a)	1	[{"added": {}}]	27	1
159	2025-03-22 16:10:52.151296+08	a	OperationalCost object (a)	1	[{"added": {}}]	27	1
160	2025-03-22 16:11:04.959048+08	a	OperationalCost object (a)	1	[{"added": {}}]	27	1
161	2025-03-22 16:12:46.546368+08	a	ShipmentDetails object (a)	1	[{"added": {}}]	28	1
162	2025-03-22 16:13:57.995986+08	a	ShippingDetails object (a)	1	[{"added": {}}]	17	1
163	2025-03-22 16:14:19.741606+08	a	ShippingDetails object (a)	1	[{"added": {}}]	17	1
164	2025-03-22 16:14:49.061464+08	a	ShippingDetails object (a)	1	[{"added": {}}]	17	1
165	2025-03-22 16:15:20.043458+08	a	ShippingDetails object (a)	1	[{"added": {}}]	17	1
166	2025-03-22 16:15:53.359145+08	a	ShippingDetails object (a)	1	[{"added": {}}]	17	1
167	2025-03-22 16:16:37.496506+08	a	ShippingDetails object (a)	1	[{"added": {}}]	17	1
168	2025-03-22 16:17:09.154923+08	a	ShippingDetails object (a)	1	[{"added": {}}]	17	1
169	2025-03-22 16:17:46.034617+08	a	ShippingDetails object (a)	1	[{"added": {}}]	17	1
170	2025-03-22 16:18:18.27518+08	a	ShippingDetails object (a)	1	[{"added": {}}]	17	1
171	2025-03-22 16:18:45.29849+08	a	ShippingDetails object (a)	1	[{"added": {}}]	17	1
172	2025-03-22 16:19:42.952074+08	a	SalesInvoices object (a)	1	[{"added": {}}]	18	1
173	2025-03-22 16:20:18.029828+08	a	SalesInvoices object (a)	1	[{"added": {}}]	18	1
174	2025-03-22 16:20:44.239733+08	a	SalesInvoices object (a)	1	[{"added": {}}]	18	1
175	2025-03-22 16:21:13.303567+08	SALES-ORD-2025-dc2b39	Order object (SALES-ORD-2025-dc2b39)	2	[]	19	1
176	2025-03-22 16:21:20.424663+08	a	SalesInvoices object (a)	1	[{"added": {}}]	18	1
177	2025-03-22 16:21:59.378386+08	a	SalesInvoices object (a)	1	[{"added": {}}]	18	1
178	2025-03-22 16:22:22.418202+08	a	SalesInvoices object (a)	1	[{"added": {}}]	18	1
179	2025-03-22 16:22:39.337115+08	a	SalesInvoices object (a)	1	[{"added": {}}]	18	1
180	2025-03-22 16:23:04.986826+08	a	SalesInvoices object (a)	1	[{"added": {}}]	18	1
181	2025-03-22 16:23:24.249591+08	a	SalesInvoices object (a)	1	[{"added": {}}]	18	1
182	2025-03-22 16:23:44.674099+08	a	Payments object (a)	1	[{"added": {}}]	25	1
183	2025-03-22 16:23:53.351921+08	a	Payments object (a)	1	[{"added": {}}]	25	1
184	2025-03-22 16:24:07.958499+08	a	Payments object (a)	1	[{"added": {}}]	25	1
185	2025-03-22 16:24:17.589669+08	a	Payments object (a)	1	[{"added": {}}]	25	1
186	2025-03-22 16:24:38.575038+08	a	Payments object (a)	1	[{"added": {}}]	25	1
187	2025-03-22 16:24:51.631785+08	a	Payments object (a)	1	[{"added": {}}]	25	1
188	2025-03-22 16:25:01.870759+08	a	Payments object (a)	1	[{"added": {}}]	25	1
189	2025-03-22 16:25:12.332845+08	a	Payments object (a)	1	[{"added": {}}]	25	1
190	2025-03-22 16:25:20.754386+08	a	Payments object (a)	1	[{"added": {}}]	25	1
191	2025-03-22 16:25:37.32174+08	a	Payments object (a)	1	[{"added": {}}]	25	1
192	2025-03-22 16:26:49.523407+08	a	Receipt object (a)	1	[{"added": {}}]	26	1
193	2025-03-22 16:27:15.079646+08	a	Receipt object (a)	1	[{"added": {}}]	26	1
194	2025-03-22 16:27:33.545431+08	a	Receipt object (a)	1	[{"added": {}}]	26	1
195	2025-03-22 16:27:54.050112+08	a	Receipt object (a)	1	[{"added": {}}]	26	1
196	2025-03-22 16:28:13.622545+08	a	Receipt object (a)	1	[{"added": {}}]	26	1
197	2025-03-22 16:28:33.747293+08	a	Receipt object (a)	1	[{"added": {}}]	26	1
198	2025-03-22 16:28:54.948723+08	a	Receipt object (a)	1	[{"added": {}}]	26	1
199	2025-03-22 16:29:12.592097+08	a	Receipt object (a)	1	[{"added": {}}]	26	1
200	2025-03-22 16:29:31.392894+08	a	Receipt object (a)	1	[{"added": {}}]	26	1
201	2025-03-22 16:30:42.369503+08	a	Receipt object (a)	1	[{"added": {}}]	26	1
202	2025-03-22 17:13:09.37104+08	SALES-STM-2025-ee064d	Statement object (SALES-STM-2025-ee064d)	3		21	1
203	2025-03-22 17:21:42.352277+08	SALES-STM-2025-ffb6c1	Statement object (SALES-STM-2025-ffb6c1)	3		21	1
204	2025-03-22 17:22:08.864027+08	SALES-STM-2025-e2aaf8	Statement object (SALES-STM-2025-e2aaf8)	3		21	1
205	2025-03-22 17:28:10.989724+08	SALES-STM-2025-ac5694	Statement object (SALES-STM-2025-ac5694)	3		21	1
206	2025-03-22 17:54:05.216455+08	SALES-STM-2025-3ea420	Statement object (SALES-STM-2025-3ea420)	3		21	1
207	2025-03-22 17:55:29.812749+08	SALES-STM-2025-e4c672	Statement object (SALES-STM-2025-e4c672)	3		21	1
208	2025-03-22 17:55:52.458471+08	SALES-STM-2025-baa13c	Statement object (SALES-STM-2025-baa13c)	3		21	1
209	2025-03-22 17:59:20.9113+08	SALES-STM-2025-200dc3	Statement object (SALES-STM-2025-200dc3)	3		21	1
210	2025-03-22 18:22:40.652393+08	SALES-STM-2025-3453ca	Statement object (SALES-STM-2025-3453ca)	3		21	1
211	2025-03-22 18:23:21.681491+08	SALES-STM-2025-94f5f8	Statement object (SALES-STM-2025-94f5f8)	3		21	1
212	2025-03-22 18:34:22.271672+08	SALES-STM-2025-9097bb	Statement object (SALES-STM-2025-9097bb)	3		21	1
213	2025-03-22 18:34:27.177563+08	SALES-STM-2025-64031e	Statement object (SALES-STM-2025-64031e)	3		21	1
214	2025-03-22 18:41:17.933647+08	SALES-STM-2025-af4bfb	Statement object (SALES-STM-2025-af4bfb)	3		21	1
215	2025-03-22 18:41:52.71887+08	SALES-STM-2025-151935	Statement object (SALES-STM-2025-151935)	3		21	1
216	2025-03-22 18:58:29.067131+08	SALES-STM-2025-4e095d	Statement object (SALES-STM-2025-4e095d)	3		21	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	auth	permission
2	auth	group
3	auth	user
4	contenttypes	contenttype
5	sessions	session
6	admin	logentry
7	statement	statementitem
8	agreement	blanketagreement
9	costing	salescosting
10	CRM	campaigns
11	CRM	leads
12	CRM	campaigncontacts
13	CRM	opportunities
14	CRM	ticket
15	CRM	ticketconvo
16	customer	customer
17	delivery	shippingdetails
18	invoice	salesinvoices
19	order	order
20	quotation	quotation
21	statement	statement
22	misc	products
23	misc	businesspartnermaster
24	misc	employees
25	invoice	payments
26	invoice	receipt
27	misc	operationalcost
28	misc	shipmentdetails
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	misc	0001_initial	2025-03-22 01:26:56.678373+08
2	contenttypes	0001_initial	2025-03-22 01:29:06.589114+08
3	auth	0001_initial	2025-03-22 01:29:06.635629+08
4	contenttypes	0002_remove_content_type_name	2025-03-22 01:29:06.660729+08
5	auth	0002_alter_permission_name_max_length	2025-03-22 01:29:06.667054+08
6	auth	0003_alter_user_email_max_length	2025-03-22 01:29:06.673056+08
7	auth	0004_alter_user_username_opts	2025-03-22 01:29:06.678247+08
8	auth	0005_alter_user_last_login_null	2025-03-22 01:29:06.6845+08
9	auth	0006_require_contenttypes_0002	2025-03-22 01:29:06.685501+08
10	auth	0007_alter_validators_add_error_messages	2025-03-22 01:29:06.690598+08
11	auth	0008_alter_user_username_max_length	2025-03-22 01:29:06.698025+08
12	auth	0009_alter_user_last_name_max_length	2025-03-22 01:29:06.704025+08
13	auth	0010_alter_group_name_max_length	2025-03-22 01:29:06.711219+08
14	auth	0011_update_proxy_permissions	2025-03-22 01:29:06.73051+08
15	auth	0012_alter_user_first_name_max_length	2025-03-22 01:29:06.735643+08
16	sessions	0001_initial	2025-03-22 01:29:10.712341+08
17	admin	0001_initial	2025-03-22 01:29:33.834834+08
18	admin	0002_logentry_remove_auto_add	2025-03-22 01:29:33.84084+08
19	admin	0003_logentry_add_action_flag_choices	2025-03-22 01:29:33.846978+08
20	customer	0001_initial	2025-03-22 01:30:50.80796+08
21	CRM	0001_initial	2025-03-22 01:30:50.813141+08
22	CRM	0002_alter_campaigns_end_date_alter_campaigns_start_date_and_more	2025-03-22 01:30:50.814144+08
23	costing	0001_initial	2025-03-22 01:30:50.815141+08
24	statement	0001_initial	2025-03-22 01:30:50.815394+08
25	agreement	0001_initial	2025-03-22 01:30:50.815394+08
26	costing	0002_alter_salescosting_created_at	2025-03-22 01:30:50.816409+08
27	quotation	0001_initial	2025-03-22 01:30:50.816409+08
28	order	0001_initial	2025-03-22 01:30:50.817409+08
29	delivery	0001_initial	2025-03-22 01:30:50.817409+08
30	invoice	0001_initial	2025-03-22 01:30:50.818407+08
31	invoice	0002_alter_salesinvoices_invoice_date	2025-03-22 01:30:50.81941+08
32	CRM	0003_alter_campaigns_end_date_alter_campaigns_start_date_and_more	2025-03-22 01:35:27.369567+08
33	costing	0003_alter_salescosting_created_at	2025-03-22 01:35:27.383718+08
34	invoice	0003_alter_salesinvoices_invoice_date	2025-03-22 01:35:27.389856+08
35	CRM	0004_alter_campaigns_end_date_alter_campaigns_start_date_and_more	2025-03-22 01:36:12.183561+08
36	costing	0004_rename_project_resources_id_salescosting_project_resources_and_more	2025-03-22 01:36:23.473259+08
37	invoice	0004_alter_salesinvoices_invoice_date	2025-03-22 01:36:23.478251+08
38	CRM	0005_alter_campaigns_end_date_alter_campaigns_start_date_and_more	2025-03-22 15:26:32.03084+08
39	costing	0005_alter_salescosting_created_at	2025-03-22 15:26:32.037779+08
40	invoice	0005_payments_alter_salesinvoices_invoice_date_and_more	2025-03-22 15:26:32.038524+08
41	delivery	0002_auto_20250322_1607	2025-03-22 16:07:43.309387+08
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
19llfvc2kz55n2kkyiyppamjj7087bqt	.eJxVjDkOwjAUBe_iGll24iWhpOcM1l_8SQDZUpxUiLtDpBTQvpl5L5VgW6e0tbykmdVZWXX63RDokcsO-A7lVjXVsi4z6l3RB236Wjk_L4f7dzBBm751h0Io1nRMXT94CYZpQOrHmK0LyCgmOsgjOLGEBsXH2EvwzN6MA6J6fwALpTjr:1tvgG7:SEyVpXPbAs_XyhOX-0zMoHHOfHulOq6VF9mOweNvGBw	2025-04-05 01:34:15.06466+08
jpujl1a12xo78zwl9fihjcwm0hbno4z2	.eJxVjDkOwjAUBe_iGll24iWhpOcM1l_8SQDZUpxUiLtDpBTQvpl5L5VgW6e0tbykmdVZWXX63RDokcsO-A7lVjXVsi4z6l3RB236Wjk_L4f7dzBBm751h0Io1nRMXT94CYZpQOrHmK0LyCgmOsgjOLGEBsXH2EvwzN6MA6J6fwALpTjr:1tvtVs:66gY7PTXYpUaFaIBXlKoVl_vJVNSY7TiWVqQqMuuVtw	2025-04-05 15:43:24.699377+08
\.


--
-- Data for Name: batch_inspection; Type: TABLE DATA; Schema: purchasing; Owner: postgres
--

COPY purchasing.batch_inspection (inspection_id, shipment_id, inspection_date, employee_id, inspection_result, remarks) FROM stdin;
\.


--
-- Data for Name: credit_memo; Type: TABLE DATA; Schema: purchasing; Owner: postgres
--

COPY purchasing.credit_memo (credit_memo_id, inspection_id, status, document_no, document_date, delivery_date, due_date, total_credit, credit_balance, dpm_rate, dpm_amount, applied_amount, balance_due) FROM stdin;
\.


--
-- Data for Name: purchase_invoice; Type: TABLE DATA; Schema: purchasing; Owner: postgres
--

COPY purchasing.purchase_invoice (invoice_id, purchase_id, status, document_no, document_date, due_date, total_credit, credit_balance, dpm_rate, dpm_amount, applied_amount, balance_due) FROM stdin;
\.


--
-- Data for Name: purchase_order; Type: TABLE DATA; Schema: purchasing; Owner: postgres
--

COPY purchasing.purchase_order (purchase_id, quotation_id, order_date, delivery_date, document_date, status) FROM stdin;
\.


--
-- Data for Name: purchase_quotation; Type: TABLE DATA; Schema: purchasing; Owner: postgres
--

COPY purchasing.purchase_quotation (quotation_id, vendor_code, quotation_content_id, status, document_no, valid_date, document_date, required_date, total_before_discount, discount_percent, freight, tax, total_payment) FROM stdin;
\.


--
-- Data for Name: purchase_requests; Type: TABLE DATA; Schema: purchasing; Owner: postgres
--

COPY purchasing.purchase_requests (request_id, employee_id, approval_id, item_id, purchase_item, purchase_description, purchase_quantity, valid_date, document_date, required_date) FROM stdin;
\.


--
-- Data for Name: quotation_contents; Type: TABLE DATA; Schema: purchasing; Owner: postgres
--

COPY purchasing.quotation_contents (quotation_content_id, request_id, unit_price, discount, tax_code, total) FROM stdin;
\.


--
-- Data for Name: received_shipments; Type: TABLE DATA; Schema: purchasing; Owner: postgres
--

COPY purchasing.received_shipments (shipment_id, purchase_id, delivery_date) FROM stdin;
\.


--
-- Data for Name: vendor_application; Type: TABLE DATA; Schema: purchasing; Owner: postgres
--

COPY purchasing.vendor_application (application_reference, vendor_code, status, company_name, tax_number, contact_person, title, vendor_address, phone, fax, vendor_email, tax_exempt, vendor_website, organization_type, separate_checks, purchasing_card, account_no, routing_no, requestor, date_requested) FROM stdin;
\.


--
-- Data for Name: blanket_agreement; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.blanket_agreement (agreement_id, statement_id, start_date, end_date, status, description, signed_date, agreement_method) FROM stdin;
\.


--
-- Data for Name: campaign_contacts; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.campaign_contacts (contact_id, lead_id, campaign_id, response_status) FROM stdin;
SALES-CONTACT-2025-05ef71	SALES-LEAD-2025-f1283f	SALES-CMPGN-2025-69a6c1	Interested
SALES-CONTACT-2025-8a5985	SALES-LEAD-2025-3d8bfa	SALES-CMPGN-2025-69a6c1	Not Interested
SALES-CONTACT-2025-cee938	SALES-LEAD-2025-f02fda	SALES-CMPGN-2025-9cf2f8	Pending
SALES-CONTACT-2025-6ee3b7	SALES-LEAD-2025-f1283f	SALES-CMPGN-2025-4c5dc7	Not Interested
SALES-CONTACT-2025-1bd47c	SALES-LEAD-2025-1415f3	SALES-CMPGN-2025-dd1c17	Not Interested
SALES-CONTACT-2025-e0c11c	SALES-LEAD-2025-08a7b4	SALES-CMPGN-2025-576de3	Interested
SALES-CONTACT-2025-e901eb	SALES-LEAD-2025-86b33c	SALES-CMPGN-2025-f369d7	Pending
SALES-CONTACT-2025-f24222	SALES-LEAD-2025-2e0761	SALES-CMPGN-2025-a4143a	Not Interested
SALES-CONTACT-2025-190e01	SALES-LEAD-2025-f4c5ba	SALES-CMPGN-2025-2f6b81	Interested
SALES-CONTACT-2025-773ffa	SALES-LEAD-2025-816089	SALES-CMPGN-2025-ed1260	Pending
\.


--
-- Data for Name: campaigns; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.campaigns (campaign_id, campaign_name, type, start_date, end_date, status) FROM stdin;
SALES-CMPGN-2025-69a6c1	New Medical Equipment Launch	Email	2025-04-01 08:00:00	2025-04-15 23:59:59	Planned
SALES-CMPGN-2025-9cf2f8	Exclusive Discount for Clinics	Email	2025-03-20 08:00:00	2025-04-15 23:59:59	Active
SALES-CMPGN-2025-4c5dc7	Hospital Procurement Webinar	Email	2025-03-10 08:00:00	2025-03-15 23:59:59	Completed
SALES-CMPGN-2025-dd1c17	Free Sample: Surgical Masks	Email	2025-04-10 08:00:00	2025-04-20 23:59:59	Planned
SALES-CMPGN-2025-576de3	Loyalty Rewards for Pharmacies	Email	2025-03-01 08:00:00	2025-03-31 23:59:59	Active
SALES-CMPGN-2025-f369d7	Medical Device Compliance Update	Email	2025-02-20 08:00:00	2025-03-05 23:59:59	Completed
SALES-CMPGN-2025-a4143a	Healthcare Expo Invitation	Email	2025-04-05 08:00:00	2025-04-25 23:59:59	Completed
SALES-CMPGN-2025-2f6b81	Exclusive Bulk Order Offer	Email	2025-03-15 08:00:00	2025-03-30 23:59:59	Active
SALES-CMPGN-2025-ed1260	New FDA-Approved Products	Email	2025-02-10 08:00:00	2025-02-28 23:59:59	Completed
SALES-CMPGN-2025-c48d93	Emergency Medical Supplies Sale	Email	2025-04-12 08:00:00	2025-04-22 23:59:59	Planned
\.


--
-- Data for Name: customers; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.customers (customer_id, gl_account_id, partner_id, name, email_address, phone_number, address_line1, address_line2, city, postal_code, country, customer_type, status, debt) FROM stdin;
SALES-CUST-2025-e1cdff	\N	\N	St. Luke’s Medical Center	contact@stlukes.com.ph	+63-2-8723-0101\t279	E. Rodriguez Sr. Avenue	Quezon City	Quezon City	1112	Philippines	Client	Active	1500.00
SALES-CUST-2025-d39ed9	\N	\N	Makati Medical Center	info@makatimed.com.ph	+63-2-8888-9999	2 Amorsolo Street	Legaspi Village	Makati	1229	Philippines	Client	Active	2500.00
SALES-CUST-2025-ad49b6	\N	\N	The Medical City	support@medicalcity.com.ph	+63-2-8639-2000	Ortigas Avenue	Pasig City	Pasig	1605	Philippines	Client	Active	0.00
SALES-CUST-2025-5e9b82	\N	\N	Asian Hospital and Medical Center	sales@asianhospital.com.ph	+63-2-8771-9000\t2205	Civic Drive	Filinvest City	Muntinlupa	1781	Philippines	Prospect	Active	500.00
SALES-CUST-2025-8a8cdd	\N	\N	Philippine General Hospital	contact@pgh.gov.ph	+63-2-8554-8400	Taft Avenue	Ermita	Manila	1000	Philippines	Client	Active	2000.00
SALES-CUST-2025-dd5896	\N	\N	Manila Doctors Hospital	support@maniladoctors.com.ph	+63-2-8558-0888	667 United Nations Avenue	Ermita	Manila	1000	Philippines	Client	Active	300.00
SALES-CUST-2025-189efd	\N	\N	Cardinal Santos Medical Center	info@cardinalsantos.com.ph	+63-2-8727-0001	10 Wilson Street	Greenhills	San Juan	1502	Philippines	Client	Active	750.00
SALES-CUST-2025-21c090	\N	\N	World Citi Medical Center	billing@worldciti.com.ph	+63-2-8913-8380	960 Aurora Blvd	Cubao	Quezon City	1109	Philippines	Prospect	Active	500.00
SALES-CUST-2025-e482c1	\N	\N	Davao Doctors Hospital	orders@davaodoctors.com.ph	+63-82-222-8000	118 E. Quirino Avenue	Poblacion	Davao City	8000	Philippines	Client	Active	650.00
SALES-CUST-2025-2d4994	\N	\N	Cebu Doctors University Hospital	contact@cebudoctors.com.ph	+63-32-255-5555	Osmeña Boulevard	Capitol Site	Cebu City	6000	Philippines	Client	Active	0.00
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.leads (lead_id, salesrep_id, lead_name, lead_email, lead_phonenum, source, status) FROM stdin;
SALES-LEAD-2025-f1283f	HR-EMP-2025-0bf227	Dr. Jose Martinez	jose.martinez@healthclinic.com	+63-917-555-1001	Referral	Contacted
SALES-LEAD-2025-3d8bfa	HR-EMP-2025-bf22fd	Maria Santos	maria.santos@meditechph.com	+63-917-555-1002	Website	Qualified
SALES-LEAD-2025-f02fda	HR-EMP-2025-c8223f	Carlos Dela Cruz	carlos.dc@lifelinediag.com	+63-917-555-1003	Cold Call	New
SALES-LEAD-2025-906e99	HR-EMP-2025-0bf227	Anna Reyes	anna.reyes@biopharmph.com	+63-917-555-1004	Email	Converted
SALES-LEAD-2025-1415f3	HR-EMP-2025-bf22fd	Rafael Gonzales	rafael.gonzales@pharmasolutions.com	+63-917-555-1005	Referral	Lost
SALES-LEAD-2025-08a7b4	HR-EMP-2025-c8223f	Isabel Flores	isabel.flores@mediserveph.com	+63-917-555-1006	Website	Qualified
SALES-LEAD-2025-86b33c	HR-EMP-2025-0bf227	Michael Torres	michael.torres@healthplus.com.ph	+63-917-555-1007	Cold Call	Contacted
SALES-LEAD-2025-2e0761	HR-EMP-2025-bf22fd	Elena Cruz	elena.cruz@philmedpharma.com	63-917-555-1008	Email	Converted
SALES-LEAD-2025-f4c5ba	HR-EMP-2025-c8223f	Luis Navarro	luis.navarro@vitalcareph.com	+63-917-555-1009	Referral	Qualified
SALES-LEAD-2025-816089	HR-EMP-2025-0bf227	Patricia Mendoza	patricia.mendoza@pediacareph.com	+63-917-555-1010	Website	New
\.


--
-- Data for Name: opportunities; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.opportunities (opportunity_id, customer_id, partner_id, salesrep_id, estimated_value, expected_closed_date, stage, status, description, reason_lost) FROM stdin;
SALES-OPP-2025-d1ce3b	SALES-CUST-2025-e1cdff	ADMIN-PARTNER-2025-3c2564	HR-EMP-2025-0bf227	250000.00	2025-05-15	Prospecting	Open	Potential MRI scanner bulk order for hospital.	
SALES-OPP-2025-78fc41	SALES-CUST-2025-d39ed9	ADMIN-PARTNER-2025-afee8b	HR-EMP-2025-0bf227	150000.00	2025-04-20	Negotiation	Open	Negotiating pricing for ventilators.	
SALES-OPP-2025-cf6eee	SALES-CUST-2025-ad49b6	ADMIN-PARTNER-2025-95223d	HR-EMP-2025-bf22fd	10000.00	2025-03-30	Closed	Won	Sold 500 surgical gloves.	
SALES-OPP-2025-9c439a	SALES-CUST-2025-5e9b82	ADMIN-PARTNER-2025-adcdfc	HR-EMP-2025-0bf227	75000.00	2025-06-01	Prospecting	Open	New client interested in defibrillators.	
SALES-OPP-2025-ecf9df	SALES-CUST-2025-8a8cdd	ADMIN-PARTNER-2025-ead71e	HR-EMP-2025-c8223f	500000.00	2025-07-01	Negotiation	Lost	Large order for hospital beds.	Customer chose competitor.
SALES-OPP-2025-c001fe	SALES-CUST-2025-dd5896	ADMIN-PARTNER-2025-036cb7	HR-EMP-2025-c8223f	20000.00	2025-05-10	Closed	Won	Sold 200 syringes and 50 BP monitors.	
SALES-OPP-2025-2c1db6	SALES-CUST-2025-189efd	ADMIN-PARTNER-2025-37f764	HR-EMP-2025-bf22fd	8000.00	2025-04-25	Closed	Lost	Small clinic interested in ECG machine.	Budget constraints.
SALES-OPP-2025-f119f5	SALES-CUST-2025-21c090	ADMIN-PARTNER-2025-f3081d	HR-EMP-2025-0bf227	95000.00	2025-05-20	Prospecting	Open	Potential deal for 3 new dialysis machines.	
SALES-OPP-2025-49ece9	SALES-CUST-2025-e482c1	ADMIN-PARTNER-2025-3c2564	HR-EMP-2025-bf22fd	12000.00	2025-06-10	Negotiation	Open	Service maintenance contract for medical equipment.	
SALES-OPP-2025-5e32c8	SALES-CUST-2025-2d4994	ADMIN-PARTNER-2025-ead71e	HR-EMP-2025-0bf227	180000.00	2025-06-30	Closed	Won	Bulk order for surgical gloves and hospital furniture.	
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.orders (order_id, statement_id, quotation_id, rework_id, goods_issue_id, order_date, order_status, order_total_amount, order_type) FROM stdin;
SALES-ORD-2025-ee1ff2	SALES-STM-2025-543ad0	SALES-QT-2025-640e87	\N	\N	2025-03-21 20:03:37.472554	Pending	437073.00	Scheduled
SALES-ORD-2025-e150d2	SALES-STM-2025-e0f54f	SALES-QT-2025-6ab1ab	\N	\N	2025-03-21 20:03:08.777183	Pending	3544677.76	Direct
SALES-ORD-2025-e0deca	SALES-STM-2025-95c41b	SALES-QT-2025-9f9e0a	\N	\N	2025-03-21 20:05:45.01596	Pending	244608.00	Direct
SALES-ORD-2025-8a5f44	SALES-STM-2025-a51eff	SALES-QT-2025-c45dbc	\N	\N	2025-03-21 20:04:45.987747	Pending	290688.65	Direct
SALES-ORD-2025-889575	SALES-STM-2025-5c03b9	SALES-QT-2025-cd75f0	\N	\N	2025-03-21 20:07:26.988051	Processed	404832.65	Direct
SALES-ORD-2025-5ae409	SALES-STM-2025-001bc5	SALES-QT-2025-d3f461	\N	\N	2025-03-21 20:05:16.729245	Pending	333180.56	Scheduled
SALES-ORD-2025-26f2f7	SALES-STM-2025-d979d6	SALES-QT-2025-d57143	\N	\N	2025-03-21 20:06:19.062515	Processed	12265.34	Direct
SALES-ORD-2025-1722d3	SALES-STM-2025-52cff7	SALES-QT-2025-d5d1e7	\N	\N	2025-03-21 20:06:56.285375	Pending	234913.76	Direct
SALES-ORD-2025-04a32f	SALES-STM-2025-54d93c	SALES-QT-2025-f1469f	\N	\N	2025-03-21 20:02:12.32394	Pending	77984.53	Direct
SALES-ORD-2025-dc2b39	SALES-STM-2025-357582	SALES-QT-2025-a23d37	\N	\N	2025-03-21 20:04:05.814368	Pending	135266.04	Direct
\.


--
-- Data for Name: payments; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.payments (payment_id, order_id, payment_method, payment_status, payment_date) FROM stdin;
SALES-PAY-2025-769113	SALES-ORD-2025-ee1ff2	Credit Card	Completed	2025-03-22 08:23:43
SALES-PAY-2025-ce174d	SALES-ORD-2025-e150d2	Bank Transfer	Pending	2025-03-22 08:23:52
SALES-PAY-2025-df2c35	SALES-ORD-2025-e0deca	Cash	Completed	2025-03-22 08:24:07
SALES-PAY-2025-531409	SALES-ORD-2025-8a5f44	Credit Card	Failed	2025-03-22 08:24:16
SALES-PAY-2025-faaefe	SALES-ORD-2025-889575	Bank Transfer	Completed	2025-03-22 08:24:37
SALES-PAY-2025-baa287	SALES-ORD-2025-5ae409	Cash	Pending	2025-03-22 08:24:50
SALES-PAY-2025-444af9	SALES-ORD-2025-26f2f7	Credit Card	Completed	2025-03-22 08:25:01
SALES-PAY-2025-c52f69	SALES-ORD-2025-1722d3	Bank Transfer	Failed	2025-03-22 08:25:11
SALES-PAY-2025-3899d1	SALES-ORD-2025-04a32f	Cash	Completed	2025-03-22 08:25:19
SALES-PAY-2025-6323fd	SALES-ORD-2025-dc2b39	Credit Card	Pending	2025-03-22 08:25:32
\.


--
-- Data for Name: quotation; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.quotation (quotation_id, statement_id, agreement_id, date_issued, status) FROM stdin;
SALES-QT-2025-640e87	SALES-STM-2025-543ad0	\N	2025-03-21 19:55:55.959812	Pending
SALES-QT-2025-6ab1ab	SALES-STM-2025-e0f54f	\N	2025-03-21 19:56:02.079125	Pending
SALES-QT-2025-9f9e0a	SALES-STM-2025-95c41b	\N	2025-03-21 19:55:29.491708	Pending
SALES-QT-2025-a23d37	SALES-STM-2025-357582	\N	2025-03-21 19:54:59.786193	Pending
SALES-QT-2025-c45dbc	SALES-STM-2025-a51eff	\N	2025-03-21 19:55:48.106718	Pending
SALES-QT-2025-cd75f0	SALES-STM-2025-5c03b9	\N	2025-03-21 19:55:22.12001	Pending
SALES-QT-2025-d3f461	SALES-STM-2025-001bc5	\N	2025-03-21 19:55:14.223794	Pending
SALES-QT-2025-d57143	SALES-STM-2025-d979d6	\N	2025-03-21 19:55:41.775823	Pending
SALES-QT-2025-d5d1e7	SALES-STM-2025-52cff7	\N	2025-03-21 19:54:49.552681	Pending
SALES-QT-2025-f1469f	SALES-STM-2025-54d93c	\N	2025-03-21 19:55:06.977934	Pending
SALES-QT-2025-dde3e4	SALES-STM-2025-5fc4f3	\N	2025-03-22 10:58:35.654454	Pending
\.


--
-- Data for Name: receipt; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.receipt (receipt_id, shipping_id, customer_id, payments_id, policy_id, date_signed, signed_docu, created_at) FROM stdin;
SALES-REC-2025-3b7536	SALES-SHIP-2025-e5786a	SALES-CUST-2025-e1cdff	SALES-PAY-2025-769113	1	2025-03-22	receipt_1.pdf	2025-03-18 08:26:48
SALES-REC-2025-5fcf88	SALES-SHIP-2025-32000a	SALES-CUST-2025-d39ed9	SALES-PAY-2025-ce174d	2	2025-03-19	receipt_2.pdf	2025-03-22 08:27:13
SALES-REC-2025-cdbbfa	SALES-SHIP-2025-6e91d8	SALES-CUST-2025-ad49b6	SALES-PAY-2025-df2c35	a	2025-03-20	receipt_3.pdf	2025-03-22 08:27:26
SALES-REC-2025-03f221	SALES-SHIP-2025-c34d24	SALES-CUST-2025-5e9b82	SALES-PAY-2025-531409	4	2025-03-21	receipt_4.pdf	2025-03-22 08:27:53
SALES-REC-2025-b63949	SALES-SHIP-2025-5a4857	SALES-CUST-2025-8a8cdd	SALES-PAY-2025-faaefe	5	2025-03-22	receipt_5.pdf	2025-03-22 08:28:12
SALES-REC-2025-e0d9d9	SALES-SHIP-2025-ac591e	SALES-CUST-2025-dd5896	SALES-PAY-2025-baa287	6	2025-03-23	receipt_5.pdf	2025-03-22 08:28:32
SALES-REC-2025-0a319a	SALES-SHIP-2025-8b5148	SALES-CUST-2025-189efd	SALES-PAY-2025-444af9	7	2025-03-24	receipt_7.pdf	2025-03-22 08:28:54
SALES-REC-2025-5cf577	SALES-SHIP-2025-1699a2	SALES-CUST-2025-21c090	SALES-PAY-2025-c52f69	8	2025-03-25	receipt_8.pdf	2025-03-22 08:29:11
SALES-REC-2025-6abb08	SALES-SHIP-2025-185532	SALES-CUST-2025-e482c1	SALES-PAY-2025-3899d1	9	2025-03-26	receipt_9.pdf	2025-03-22 08:29:30
SALES-REC-2025-b83b7e	SALES-SHIP-2025-b43c1d	SALES-CUST-2025-2d4994	SALES-PAY-2025-6323fd	10	2025-03-27	receipt_10.pdf	2025-03-22 08:30:40
\.


--
-- Data for Name: renewal_warranty; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.renewal_warranty (renewal_id, order_id, customer_id, product_id, payments_id, service_request_id, original_warranty_start, original_warranty_end, renewal_warranty_start, renewal_warranty_end, renewal_status, created_at, updated_at, renewal_fee) FROM stdin;
\.


--
-- Data for Name: sales_costing; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.sales_costing (sales_costing_id, non_project_costing_id, project_resources_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: sales_invoices; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.sales_invoices (invoice_id, order_id, invoice_date, total_amount, invoice_status, payment_status, due_date) FROM stdin;
SALES-INV-2025-ff0877	SALES-ORD-2025-ee1ff2	2025-03-22 14:59:44	437073.00	Pending	Pending	2025-04-01
SALES-INV-2025-7d6ccf	SALES-ORD-2025-e150d2	2025-03-16 14:59:44	3544677.76	Pending	Pending	2025-04-17
SALES-INV-2025-1dc625	SALES-ORD-2025-e0deca	2025-03-22 14:59:44	244608.00	Pending	Pending	2025-03-30
SALES-INV-2025-28f8b5	SALES-ORD-2025-dc2b39	2025-03-22 14:59:44	135266.04	Pending	Pending	2025-03-23
SALES-INV-2025-bce93a	SALES-ORD-2025-8a5f44	2025-03-22 14:59:44	290688.65	Pending	Pending	2025-03-24
SALES-INV-2025-2b8f41	SALES-ORD-2025-889575	2025-03-22 14:59:44	404832.65	Paid	Completed	2025-03-23
SALES-INV-2025-805837	SALES-ORD-2025-5ae409	2025-03-22 14:59:44	333180.56	Pending	Pending	2025-03-29
SALES-INV-2025-420b51	SALES-ORD-2025-26f2f7	2025-03-22 14:59:44	12265.34	Paid	Pending	2025-03-23
SALES-INV-2025-62acc3	SALES-ORD-2025-1722d3	2025-03-22 14:59:44	234913.76	Pending	Pending	2025-03-24
SALES-INV-2025-f27bbf	SALES-ORD-2025-04a32f	2025-03-22 14:59:44	77984.53	Pending	Pending	2025-03-24
SALES-INV-2025-4cab2b	SALES-ORD-2025-ee1ff2	2025-03-22 16:06:06	437073.00	Pending	Pending	2025-04-01
SALES-INV-2025-d7d36d	SALES-ORD-2025-e150d2	2025-03-22 16:06:06	3544677.76	Paid	Completed	2025-03-25
SALES-INV-2025-acdf1b	SALES-ORD-2025-e0deca	2025-03-22 16:06:06	244608.00	Overdue	Pending	2025-03-28
SALES-INV-2025-20d6ce	SALES-ORD-2025-dc2b39	2025-03-22 16:06:06	135266.04	Paid	Completed	2025-03-23
SALES-INV-2025-90d7f2	SALES-ORD-2025-889575	2025-03-22 16:06:06	290688.65	Pending	Failed	2025-03-22
SALES-INV-2025-8218c9	SALES-ORD-2025-5ae409	2025-03-22 16:06:06	404832.65	Paid	Completed	2025-03-23
SALES-INV-2025-9727c6	SALES-ORD-2025-26f2f7	2025-03-22 16:06:06	12265.34	Paid	Completed	2025-03-28
SALES-INV-2025-b060f6	SALES-ORD-2025-04a32f	2025-03-22 16:06:06	234913.76	Overdue	Pending	2025-03-21
SALES-INV-2025-e63d35	SALES-ORD-2025-dc2b39	2025-03-22 16:06:06	77984.53	Pending	Pending	2025-03-25
\.


--
-- Data for Name: shipping_details; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.shipping_details (shipping_id, order_id, operational_cost_id, shipment_id, shipping_method, tracking_num, shipping_date, estimated_delivery, delivery_status) FROM stdin;
SALES-SHIP-2025-e5786a	SALES-ORD-2025-ee1ff2	DIS-OS-2025-5b37de	a	Standard	TRK1001	2025-03-22 08:13:34	2025-04-01 10:00:00	Pending
SALES-SHIP-2025-32000a	SALES-ORD-2025-e150d2	DIS-OS-2025-48963a	a	Express	TRK1002	2025-03-22 08:14:13	2025-03-22 08:14:14	Shipped
SALES-SHIP-2025-6e91d8	SALES-ORD-2025-e0deca	DIS-OS-2025-ad8e07	a	Overnight	TRK1003	2025-03-20 08:14:40	2025-03-21 08:14:42	Delivered
SALES-SHIP-2025-c34d24	SALES-ORD-2025-dc2b39	DIS-OS-2025-40855e	a	Same-Day	TRK1004	2025-03-19 08:15:09	2025-03-19 14:15:13	Delivered
SALES-SHIP-2025-5a4857	SALES-ORD-2025-8a5f44	DIS-OS-2025-3de59c	a	International	TRK1005	2025-03-22 08:15:42	2025-04-10 08:15:52	Pending
SALES-SHIP-2025-ac591e	SALES-ORD-2025-889575	DIS-OS-2025-30d8db	a	Local	TRK1006	2025-03-22 08:16:28	2025-03-25 08:16:35	Shipped
SALES-SHIP-2025-8b5148	SALES-ORD-2025-5ae409	DIS-OS-2025-1bc391	a	Standard	TRK1007	2025-03-22 08:16:52	2025-03-23 09:00:00	Pending
SALES-SHIP-2025-1699a2	SALES-ORD-2025-26f2f7	DIS-OS-2025-129b85	a	Express	TRK1008	2025-03-17 08:17:31	2025-03-21 08:17:43	Delivered
SALES-SHIP-2025-185532	SALES-ORD-2025-1722d3	DIS-OS-2025-9f398e	a	Overnight	TRK1009	2025-03-23 08:18:02	2025-03-24 08:18:10	Pending
SALES-SHIP-2025-b43c1d	SALES-ORD-2025-04a32f	DIS-OS-2025-30ba25	a	Same-Day	TRK1010	2025-03-22 08:18:33	2025-03-22 11:18:35	Shipped
\.


--
-- Data for Name: statement; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.statement (statement_id, customer_id, salesrep_id, total_amount, discount, type, total_tax) FROM stdin;
SALES-STM-2025-543ad0	SALES-CUST-2025-2ab5ef	HR-EMP-2025-74bbe0	77984.53	0.00	Non-Project-Based	12500
SALES-STM-2025-e0f54f	SALES-CUST-2025-3a8030	HR-EMP-2025-0d2686	3744677.76	200000.00	Non-Project-Based	401280
SALES-STM-2025-95c41b	SALES-CUST-2025-3d056a	HR-EMP-2025-d4c668	437073.00	0.00	Project-Based	244881
SALES-STM-2025-357582	SALES-CUST-2025-4924d8	HR-EMP-2025-74bbe0	135266.04	0.00	Non-Project-Based	16232
SALES-STM-2025-a51eff	SALES-CUST-2025-5f1828	HR-EMP-2025-0d2686	259543.44	0.00	Non-Project-Based	31145
SALES-STM-2025-5c03b9	SALES-CUST-2025-bd4084	HR-EMP-2025-d4c668	297482.64	0.00	Non-Project-Based	35698
SALES-STM-2025-001bc5	SALES-CUST-2025-bf996e	HR-EMP-2025-74bbe0	218400.00	0.00	Non-Project-Based	26208
SALES-STM-2025-d979d6	SALES-CUST-2025-856b59	HR-EMP-2025-0d2686	10951.20	0.00	Non-Project-Based	1314
SALES-STM-2025-52cff7	SALES-CUST-2025-94a450	HR-EMP-2025-d4c668	218673.00	10000.00	Non-Project-Based	26241
SALES-STM-2025-54d93c	SALES-CUST-2025-83a030	HR-EMP-2025-74bbe0	388243.44	30000.00	Non-Project-Based	46589
SALES-STM-2025-633f58	SALES-CUST-2025-d39ed9	HR-EMP-2025-c8223f	80580.24	2560.00	Non-Project-Based	9670
SALES-STM-2025-01ae9c	SALES-CUST-2025-ad49b6	HR-EMP-2025-c8223f	5051292.80	0.00	Non-Project-Based	496829
SALES-STM-2025-5fc4f3	SALES-CUST-2025-ad49b6	HR-EMP-2025-c8223f	5051292.80	0.00	Non-Project-Based	496829
\.


--
-- Data for Name: statement_item; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.statement_item (statement_item_id, statement_id, sales_costing_id, product_id, item_md_id, quantity, unit_price, total_price, markup_percentage, demand_level, discount, tax_amount) FROM stdin;
SALES-STI-2025-378a01	SALES-STM-2025-e0f54f	\N	ADMIN-PROD-2025-a83254	\N	1	10951.20	10951.20	20.00	Low	0.00	1314
SALES-STI-2025-b81438	SALES-STM-2025-5fc4f3	\N	ADMIN-PROD-2025-a83254	\N	150	10951.20	1642680.00	20.00	Low	0.00	197122
SALES-STI-2025-e45446	SALES-STM-2025-5fc4f3	\N	ADMIN-PROD-2025-fdabb5	\N	10	249756.00	2497560.00	20.00	Low	0.00	299707
SALES-STI-2025-19e80b	SALES-STM-2025-543ad0	\N	ADMIN-PROD-2025-ea1ddb	\N	1	218673.00	218673.00	20.00	Low	0.00	26241
SALES-STI-2025-217edd	SALES-STM-2025-543ad0	\N	ADMIN-PROD-2025-bb2e86	\N	1	218400.00	218400.00	20.00	Low	0.00	26208
SALES-STI-2025-29d6a9	SALES-STM-2025-e0f54f	\N	ADMIN-PROD-2025-ac0665	\N	1	135266.04	135266.04	20.00	Low	0.00	16232
SALES-STI-2025-3834ab	SALES-STM-2025-357582	\N	ADMIN-PROD-2025-e9ce12	\N	1	259543.44	259543.44	20.00	Low	0.00	31145
SALES-STI-2025-3ae348	SALES-STM-2025-a51eff	\N	ADMIN-PROD-2025-09e97d	\N	1	47726.64	47726.64	20.00	Low	0.00	5727
SALES-STI-2025-4794e4	SALES-STM-2025-5c03b9	\N	ADMIN-PROD-2025-09e97d	\N	1	47726.64	47726.64	20.00	Low	0.00	5727
SALES-STI-2025-6db696	SALES-STM-2025-5c03b9	\N	ADMIN-PROD-2025-a83254	\N	2	10951.20	21902.40	20.00	Low	0.00	2628
SALES-STI-2025-9affb3	SALES-STM-2025-001bc5	\N	ADMIN-PROD-2025-ea1ddb	\N	2	218673.00	437346.00	20.00	Low	0.00	52482
SALES-STI-2025-b3d86b	SALES-STM-2025-d979d6	\N	ADMIN-PROD-2025-fdabb5	\N	1	249756.00	249756.00	20.00	Low	0.00	29971
SALES-STI-2025-cee3fb	SALES-STM-2025-001bc5	\N	ADMIN-PROD-2025-04fd80	\N	1	128700.00	128700.00	20.00	Low	0.00	15444
SALES-STI-2025-d66c43	SALES-STM-2025-d979d6	\N	ADMIN-PROD-2025-328a5f	\N	3	1114666.00	3343998.00	20.00	Low	0.00	401280
SALES-STI-2025-eeb086	SALES-STM-2025-52cff7	\N	ADMIN-PROD-2025-bb2e86	\N	1	218400.00	218400.00	20.00	Low	10000.00	26208
SALES-STI-2025-fa61e8	SALES-STM-2025-54d93c	\N	ADMIN-PROD-2025-e9ce12	\N	1	259543.44	259543.44	20.00	Low	0.00	31145
\.


--
-- Data for Name: ticket; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.ticket (ticket_id, customer_id, salesrep_id, subject, description, status, priority, created_at) FROM stdin;
SALES-TICKET-2025-e017e3	SALES-CUST-2025-e1cdff	HR-EMP-2025-0bf227	MRI Machine Maintenance	Scheduled preventive maintenance for MRI scanner.	Open	High	2025-03-22 15:42:09
SALES-TICKET-2025-45e1d1	SALES-CUST-2025-d39ed9	HR-EMP-2025-bf22fd	X-ray Calibration	X-ray machines require recalibration due to accuracy issues.	In Progress	Urgent	2025-03-22 15:42:09
SALES-TICKET-2025-81301c	SALES-CUST-2025-ad49b6	HR-EMP-2025-c8223f	Training Request - ECG Machine	Hospital staff need hands-on training for ECG machines.	Open	Medium	2025-03-22 15:42:09
SALES-TICKET-2025-8833c0	SALES-CUST-2025-5e9b82	HR-EMP-2025-0bf227	Software Update - Ventilators	Need to update ventilator software for new compliance regulations.	Closed	Low	2025-03-22 15:42:09
SALES-TICKET-2025-234095	SALES-CUST-2025-8a8cdd	HR-EMP-2025-bf22fd	Warranty Repair - Defibrillator	Defibrillator malfunction under warranty claim.	Open	High	2025-03-22 15:42:09
SALES-TICKET-2025-ea6204	SALES-CUST-2025-dd5896	HR-EMP-2025-c8223f	Technical Support - Ultrasound	Ultrasound machine displaying error code during operation.	In Progress	Medium	2025-03-22 15:42:09
SALES-TICKET-2025-dbd816	SALES-CUST-2025-189efd	HR-EMP-2025-0bf227	Equipment Relocation Assistance	Need assistance in relocating an MRI scanner to another facility.	Closed	Low	2025-03-22 15:42:09
SALES-TICKET-2025-72f8f2	SALES-CUST-2025-21c090	HR-EMP-2025-bf22fd	Hospital Bed Malfunction	Motorized hospital beds not adjusting properly	Open	Urgent	2025-03-22 15:42:09
SALES-TICKET-2025-f50510	SALES-CUST-2025-e482c1	HR-EMP-2025-c8223f	Battery Replacement - Portable Monitors	Request to replace batteries for 20 portable patient monitors.	In Progress	High	2025-03-22 15:42:09
SALES-TICKET-2025-6ba730	SALES-CUST-2025-2d4994	HR-EMP-2025-bf22fd	On-Site Inspection - Operating Room Equipment	Request for technician visit to inspect all OR equipment.	Open	Medium	2025-03-22 15:42:09
\.


--
-- Data for Name: ticket_convo; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.ticket_convo (convo_id, ticket_id, content, created_at) FROM stdin;
SALES-CONVO-2025-851a86	SALES-TICKET-2025-e017e3	Technician scheduled for MRI maintenance on April 5.	2025-03-22 15:42:09
SALES-CONVO-2025-075f2c	SALES-TICKET-2025-45e1d1	Calibration tools dispatched, technician visit confirmed.	2025-03-22 15:42:09
SALES-CONVO-2025-ebb3dd	SALES-TICKET-2025-81301c	ECG training session scheduled for March 15.	2025-03-22 15:42:09
SALES-CONVO-2025-e39c6d	SALES-TICKET-2025-8833c0	Software update package sent, remote installation guide provided.	2025-03-22 15:42:09
SALES-CONVO-2025-226f05	SALES-TICKET-2025-234095	Warranty repair approved, dispatching service team.	2025-03-22 15:42:09
SALES-CONVO-2025-7f80e7	SALES-TICKET-2025-ea6204	Ultrasound troubleshooting guide sent, remote support scheduled.	2025-03-22 15:42:09
SALES-CONVO-2025-62eefd	SALES-TICKET-2025-dbd816	MRI relocation assistance team confirmed for March 20.	2025-03-22 15:42:09
SALES-CONVO-2025-aa866b	SALES-TICKET-2025-72f8f2	Investigating motorized hospital bed issues, awaiting technician report.	2025-03-22 15:42:09
SALES-CONVO-2025-220719	SALES-TICKET-2025-f50510	Battery order placed, estimated arrival March 10.	2025-03-22 15:42:09
SALES-CONVO-2025-eb1c61	SALES-TICKET-2025-6ba730	On-site inspection scheduled for April 1, report to follow.	2025-03-22 15:42:09
\.


--
-- Data for Name: after_analysis_sched; Type: TABLE DATA; Schema: services; Owner: postgres
--

COPY services.after_analysis_sched (analysis_sched_id, service_request_id, service_date, technician_id, description, service_status) FROM stdin;
\.


--
-- Data for Name: chat_message; Type: TABLE DATA; Schema: services; Owner: postgres
--

COPY services.chat_message (message_id, session_id, sender_id, sender_role, message_text, "timestamp") FROM stdin;
\.


--
-- Data for Name: comm_session; Type: TABLE DATA; Schema: services; Owner: postgres
--

COPY services.comm_session (session_id, technician_id, customer_id, session_type, start_time, end_time, status) FROM stdin;
\.


--
-- Data for Name: delivery_order; Type: TABLE DATA; Schema: services; Owner: postgres
--

COPY services.delivery_order (delivery_order_id, service_purchase_id, service_order_id, service_billing_id, customer_id, customer_address, delivery_status, service_billing_amount, delivery_date) FROM stdin;
\.


--
-- Data for Name: renewal_history; Type: TABLE DATA; Schema: services; Owner: postgres
--

COPY services.renewal_history (renewal_id, contract_id, customer_id, previous_start_date, previous_end_date, renewal_date, date_renewed, new_end_date, status) FROM stdin;
\.


--
-- Data for Name: service_analysis; Type: TABLE DATA; Schema: services; Owner: postgres
--

COPY services.service_analysis (analysis_id, service_request_id, analysis_date, technician_id, customer_id, analysis_description, product_id) FROM stdin;
\.


--
-- Data for Name: service_billing; Type: TABLE DATA; Schema: services; Owner: postgres
--

COPY services.service_billing (service_billing_id, service_purchase_id, service_order_id, service_request_id, charge_type, product_id, warranty_status, service_billing_amount, billing_status, date_paid) FROM stdin;
\.


--
-- Data for Name: service_call; Type: TABLE DATA; Schema: services; Owner: postgres
--

COPY services.service_call (service_call_id, date_created, customer_id, customer_name, queue, call_type, technician_id, call_status, date_closed, origin, contract_id, end_date, priority_level, resolution) FROM stdin;
\.


--
-- Data for Name: service_call_history; Type: TABLE DATA; Schema: services; Owner: postgres
--

COPY services.service_call_history (service_call_id, date_update, time_update, status, description) FROM stdin;
\.


--
-- Data for Name: service_contract; Type: TABLE DATA; Schema: services; Owner: postgres
--

COPY services.service_contract (contract_id, customer_id, contract_description, start_date, end_date, termination_date, service_type, contract_type, product_id, contract_status, active_items, remarks, renewal, date_renewed, date_last_renewed, approval_remarks, approval_date, approved_by) FROM stdin;
\.


--
-- Data for Name: service_cost; Type: TABLE DATA; Schema: services; Owner: postgres
--

COPY services.service_cost (service_cost_id, analysis_id, service_billing_id, cost_type, outsource_fee, cost_amount) FROM stdin;
\.


--
-- Data for Name: service_order; Type: TABLE DATA; Schema: services; Owner: postgres
--

COPY services.service_order (service_order_id, analysis_id, customer_id, item_id, item_name, item_availability, item_price) FROM stdin;
\.


--
-- Data for Name: service_purchase; Type: TABLE DATA; Schema: services; Owner: postgres
--

COPY services.service_purchase (service_purchase_id, service_order_id, principal_item_id, item_id, item_name, request_date, quantity, markup_price, customer_id) FROM stdin;
\.


--
-- Data for Name: service_report; Type: TABLE DATA; Schema: services; Owner: postgres
--

COPY services.service_report (report_id, service_call_id, service_billing_id, technician_id, description, report_status, submission_date) FROM stdin;
\.


--
-- Data for Name: service_request; Type: TABLE DATA; Schema: services; Owner: postgres
--

COPY services.service_request (service_request_id, service_call_id, request_date, customer_id, technician_id, request_type, request_status, contract_type, request_description, request_remarks) FROM stdin;
\.


--
-- Data for Name: service_ticket; Type: TABLE DATA; Schema: services; Owner: postgres
--

COPY services.service_ticket (service_ticket_id) FROM stdin;
\.


--
-- Data for Name: technician; Type: TABLE DATA; Schema: services; Owner: postgres
--

COPY services.technician (technician_id) FROM stdin;
\.


--
-- Name: delivery_receipt_delivery_receipt_id_seq; Type: SEQUENCE SET; Schema: distribution; Owner: postgres
--

SELECT pg_catalog.setval('distribution.delivery_receipt_delivery_receipt_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 92, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 216, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 28, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 41, true);


--
-- Name: service_call_queue_seq; Type: SEQUENCE SET; Schema: services; Owner: postgres
--

SELECT pg_catalog.setval('services.service_call_queue_seq', 1, false);


--
-- Name: chart_of_accounts chart_of_accounts_pkey; Type: CONSTRAINT; Schema: accounting; Owner: postgres
--

ALTER TABLE ONLY accounting.chart_of_accounts
    ADD CONSTRAINT chart_of_accounts_pkey PRIMARY KEY (account_id);


--
-- Name: currency currency_pkey; Type: CONSTRAINT; Schema: accounting; Owner: postgres
--

ALTER TABLE ONLY accounting.currency
    ADD CONSTRAINT currency_pkey PRIMARY KEY (currency_id);


--
-- Name: general_ledger_accounts general_ledger_accounts_pkey; Type: CONSTRAINT; Schema: accounting; Owner: postgres
--

ALTER TABLE ONLY accounting.general_ledger_accounts
    ADD CONSTRAINT general_ledger_accounts_pkey PRIMARY KEY (gl_account_id);


--
-- Name: journal_entries journal_entries_pkey; Type: CONSTRAINT; Schema: accounting; Owner: postgres
--

ALTER TABLE ONLY accounting.journal_entries
    ADD CONSTRAINT journal_entries_pkey PRIMARY KEY (journal_id);


--
-- Name: journal_entry_lines journal_entry_lines_pkey; Type: CONSTRAINT; Schema: accounting; Owner: postgres
--

ALTER TABLE ONLY accounting.journal_entry_lines
    ADD CONSTRAINT journal_entry_lines_pkey PRIMARY KEY (entry_line_id);


--
-- Name: assets assets_pkey; Type: CONSTRAINT; Schema: admin; Owner: postgres
--

ALTER TABLE ONLY admin.assets
    ADD CONSTRAINT assets_pkey PRIMARY KEY (asset_id);


--
-- Name: audit_log audit_log_pkey; Type: CONSTRAINT; Schema: admin; Owner: postgres
--

ALTER TABLE ONLY admin.audit_log
    ADD CONSTRAINT audit_log_pkey PRIMARY KEY (log_id);


--
-- Name: business_partner_master business_partner_master_pkey; Type: CONSTRAINT; Schema: admin; Owner: postgres
--

ALTER TABLE ONLY admin.business_partner_master
    ADD CONSTRAINT business_partner_master_pkey PRIMARY KEY (partner_id);


--
-- Name: item_master_data item_master_data_pkey; Type: CONSTRAINT; Schema: admin; Owner: postgres
--

ALTER TABLE ONLY admin.item_master_data
    ADD CONSTRAINT item_master_data_pkey PRIMARY KEY (item_id);


--
-- Name: policies policies_pkey; Type: CONSTRAINT; Schema: admin; Owner: postgres
--

ALTER TABLE ONLY admin.policies
    ADD CONSTRAINT policies_pkey PRIMARY KEY (policy_id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: admin; Owner: postgres
--

ALTER TABLE ONLY admin.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- Name: raw_materials raw_materials_pkey; Type: CONSTRAINT; Schema: admin; Owner: postgres
--

ALTER TABLE ONLY admin.raw_materials
    ADD CONSTRAINT raw_materials_pkey PRIMARY KEY (material_id);


--
-- Name: roles_permission roles_permission_pkey; Type: CONSTRAINT; Schema: admin; Owner: postgres
--

ALTER TABLE ONLY admin.roles_permission
    ADD CONSTRAINT roles_permission_pkey PRIMARY KEY (role_id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: admin; Owner: postgres
--

ALTER TABLE ONLY admin.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: admin; Owner: postgres
--

ALTER TABLE ONLY admin.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: vendor vendor_pkey; Type: CONSTRAINT; Schema: admin; Owner: postgres
--

ALTER TABLE ONLY admin.vendor
    ADD CONSTRAINT vendor_pkey PRIMARY KEY (vendor_code);


--
-- Name: warehouse warehouse_pkey; Type: CONSTRAINT; Schema: admin; Owner: postgres
--

ALTER TABLE ONLY admin.warehouse
    ADD CONSTRAINT warehouse_pkey PRIMARY KEY (warehouse_id);


--
-- Name: billing_receipt billing_receipt_pkey; Type: CONSTRAINT; Schema: distribution; Owner: postgres
--

ALTER TABLE ONLY distribution.billing_receipt
    ADD CONSTRAINT billing_receipt_pkey PRIMARY KEY (billing_receipt_id);


--
-- Name: carrier carrier_pkey; Type: CONSTRAINT; Schema: distribution; Owner: postgres
--

ALTER TABLE ONLY distribution.carrier
    ADD CONSTRAINT carrier_pkey PRIMARY KEY (carrier_id);


--
-- Name: delivery_order delivery_order_pkey; Type: CONSTRAINT; Schema: distribution; Owner: postgres
--

ALTER TABLE ONLY distribution.delivery_order
    ADD CONSTRAINT delivery_order_pkey PRIMARY KEY (delivery_order_id);


--
-- Name: delivery_receipt delivery_receipt_pkey; Type: CONSTRAINT; Schema: distribution; Owner: postgres
--

ALTER TABLE ONLY distribution.delivery_receipt
    ADD CONSTRAINT delivery_receipt_pkey PRIMARY KEY (delivery_receipt_id);


--
-- Name: failed_shipment failed_shipment_pkey; Type: CONSTRAINT; Schema: distribution; Owner: postgres
--

ALTER TABLE ONLY distribution.failed_shipment
    ADD CONSTRAINT failed_shipment_pkey PRIMARY KEY (failed_shipment_id);


--
-- Name: goods_issue goods_issue_pkey; Type: CONSTRAINT; Schema: distribution; Owner: postgres
--

ALTER TABLE ONLY distribution.goods_issue
    ADD CONSTRAINT goods_issue_pkey PRIMARY KEY (goods_issue_id);


--
-- Name: logistics_approval_request logistics_approval_request_pkey; Type: CONSTRAINT; Schema: distribution; Owner: postgres
--

ALTER TABLE ONLY distribution.logistics_approval_request
    ADD CONSTRAINT logistics_approval_request_pkey PRIMARY KEY (approval_request_id);


--
-- Name: operational_cost operational_cost_pkey; Type: CONSTRAINT; Schema: distribution; Owner: postgres
--

ALTER TABLE ONLY distribution.operational_cost
    ADD CONSTRAINT operational_cost_pkey PRIMARY KEY (operational_cost_id);


--
-- Name: packing_cost packing_cost_pkey; Type: CONSTRAINT; Schema: distribution; Owner: postgres
--

ALTER TABLE ONLY distribution.packing_cost
    ADD CONSTRAINT packing_cost_pkey PRIMARY KEY (packing_cost_id);


--
-- Name: packing_list packing_list_pkey; Type: CONSTRAINT; Schema: distribution; Owner: postgres
--

ALTER TABLE ONLY distribution.packing_list
    ADD CONSTRAINT packing_list_pkey PRIMARY KEY (packing_list_id);


--
-- Name: picking_list picking_list_pkey; Type: CONSTRAINT; Schema: distribution; Owner: postgres
--

ALTER TABLE ONLY distribution.picking_list
    ADD CONSTRAINT picking_list_pkey PRIMARY KEY (picking_list_id);


--
-- Name: rejection rejection_pkey; Type: CONSTRAINT; Schema: distribution; Owner: postgres
--

ALTER TABLE ONLY distribution.rejection
    ADD CONSTRAINT rejection_pkey PRIMARY KEY (rejection_id);


--
-- Name: rework_order rework_order_pkey; Type: CONSTRAINT; Schema: distribution; Owner: postgres
--

ALTER TABLE ONLY distribution.rework_order
    ADD CONSTRAINT rework_order_pkey PRIMARY KEY (rework_id);


--
-- Name: shipment_details shipment_details_pkey; Type: CONSTRAINT; Schema: distribution; Owner: postgres
--

ALTER TABLE ONLY distribution.shipment_details
    ADD CONSTRAINT shipment_details_pkey PRIMARY KEY (shipment_id);


--
-- Name: shipping_cost shipping_cost_pkey; Type: CONSTRAINT; Schema: distribution; Owner: postgres
--

ALTER TABLE ONLY distribution.shipping_cost
    ADD CONSTRAINT shipping_cost_pkey PRIMARY KEY (shipping_cost_id);


--
-- Name: budget_approvals budget_approvals_pkey; Type: CONSTRAINT; Schema: finance; Owner: postgres
--

ALTER TABLE ONLY finance.budget_approvals
    ADD CONSTRAINT budget_approvals_pkey PRIMARY KEY (validation_id);


--
-- Name: budget_validations budget_validations_pkey; Type: CONSTRAINT; Schema: finance; Owner: postgres
--

ALTER TABLE ONLY finance.budget_validations
    ADD CONSTRAINT budget_validations_pkey PRIMARY KEY (validation_id);


--
-- Name: attendance_tracking attendance_tracking_pkey; Type: CONSTRAINT; Schema: human_resources; Owner: postgres
--

ALTER TABLE ONLY human_resources.attendance_tracking
    ADD CONSTRAINT attendance_tracking_pkey PRIMARY KEY (attendance_id);


--
-- Name: candidates candidates_email_key; Type: CONSTRAINT; Schema: human_resources; Owner: postgres
--

ALTER TABLE ONLY human_resources.candidates
    ADD CONSTRAINT candidates_email_key UNIQUE (email);


--
-- Name: candidates candidates_pkey; Type: CONSTRAINT; Schema: human_resources; Owner: postgres
--

ALTER TABLE ONLY human_resources.candidates
    ADD CONSTRAINT candidates_pkey PRIMARY KEY (candidate_id);


--
-- Name: departments departments_dept_name_key; Type: CONSTRAINT; Schema: human_resources; Owner: postgres
--

ALTER TABLE ONLY human_resources.departments
    ADD CONSTRAINT departments_dept_name_key UNIQUE (dept_name);


--
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: human_resources; Owner: postgres
--

ALTER TABLE ONLY human_resources.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (dept_id);


--
-- Name: employee_performance employee_performance_pkey; Type: CONSTRAINT; Schema: human_resources; Owner: postgres
--

ALTER TABLE ONLY human_resources.employee_performance
    ADD CONSTRAINT employee_performance_pkey PRIMARY KEY (performance_id);


--
-- Name: employee_salary employee_salary_pkey; Type: CONSTRAINT; Schema: human_resources; Owner: postgres
--

ALTER TABLE ONLY human_resources.employee_salary
    ADD CONSTRAINT employee_salary_pkey PRIMARY KEY (salary_id);


--
-- Name: employees employees_email_key; Type: CONSTRAINT; Schema: human_resources; Owner: postgres
--

ALTER TABLE ONLY human_resources.employees
    ADD CONSTRAINT employees_email_key UNIQUE (email);


--
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: human_resources; Owner: postgres
--

ALTER TABLE ONLY human_resources.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (employee_id);


--
-- Name: interviews interviews_pkey; Type: CONSTRAINT; Schema: human_resources; Owner: postgres
--

ALTER TABLE ONLY human_resources.interviews
    ADD CONSTRAINT interviews_pkey PRIMARY KEY (interview_id);


--
-- Name: job_posting job_posting_pkey; Type: CONSTRAINT; Schema: human_resources; Owner: postgres
--

ALTER TABLE ONLY human_resources.job_posting
    ADD CONSTRAINT job_posting_pkey PRIMARY KEY (job_id);


--
-- Name: leave_requests leave_requests_pkey; Type: CONSTRAINT; Schema: human_resources; Owner: postgres
--

ALTER TABLE ONLY human_resources.leave_requests
    ADD CONSTRAINT leave_requests_pkey PRIMARY KEY (leave_id);


--
-- Name: payroll payroll_pkey; Type: CONSTRAINT; Schema: human_resources; Owner: postgres
--

ALTER TABLE ONLY human_resources.payroll
    ADD CONSTRAINT payroll_pkey PRIMARY KEY (payroll_id);


--
-- Name: workforce_allocation workforce_allocation_pkey; Type: CONSTRAINT; Schema: human_resources; Owner: postgres
--

ALTER TABLE ONLY human_resources.workforce_allocation
    ADD CONSTRAINT workforce_allocation_pkey PRIMARY KEY (allocation_id);


--
-- Name: deprecation_report deprecation_report_pkey; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

ALTER TABLE ONLY inventory.deprecation_report
    ADD CONSTRAINT deprecation_report_pkey PRIMARY KEY (deprecation_report_id);


--
-- Name: inventory_adjustments inventory_adjustments_pkey; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

ALTER TABLE ONLY inventory.inventory_adjustments
    ADD CONSTRAINT inventory_adjustments_pkey PRIMARY KEY (adjustment_id);


--
-- Name: inventory_cyclic_counts inventory_cyclic_counts_pkey; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

ALTER TABLE ONLY inventory.inventory_cyclic_counts
    ADD CONSTRAINT inventory_cyclic_counts_pkey PRIMARY KEY (inventory_count_id);


--
-- Name: inventory_item_master_data inventory_item_master_data_pkey; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

ALTER TABLE ONLY inventory.inventory_item_master_data
    ADD CONSTRAINT inventory_item_master_data_pkey PRIMARY KEY (item_md_id);


--
-- Name: inventory_item inventory_item_pkey; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

ALTER TABLE ONLY inventory.inventory_item
    ADD CONSTRAINT inventory_item_pkey PRIMARY KEY (inventory_item_id);


--
-- Name: warehouse_movement warehouse_movement_pkey; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

ALTER TABLE ONLY inventory.warehouse_movement
    ADD CONSTRAINT warehouse_movement_pkey PRIMARY KEY (movement_id);


--
-- Name: bill_of_materials bill_of_materials_pkey; Type: CONSTRAINT; Schema: mrp; Owner: postgres
--

ALTER TABLE ONLY mrp.bill_of_materials
    ADD CONSTRAINT bill_of_materials_pkey PRIMARY KEY (bom_id);


--
-- Name: non_project_order_pricing non_project_order_pricing_pkey; Type: CONSTRAINT; Schema: mrp; Owner: postgres
--

ALTER TABLE ONLY mrp.non_project_order_pricing
    ADD CONSTRAINT non_project_order_pricing_pkey PRIMARY KEY (non_project_costing_id);


--
-- Name: overall_production overall_production_pkey; Type: CONSTRAINT; Schema: mrp; Owner: postgres
--

ALTER TABLE ONLY mrp.overall_production
    ADD CONSTRAINT overall_production_pkey PRIMARY KEY (cost_id);


--
-- Name: principal_items principal_items_pkey; Type: CONSTRAINT; Schema: mrp; Owner: postgres
--

ALTER TABLE ONLY mrp.principal_items
    ADD CONSTRAINT principal_items_pkey PRIMARY KEY (principal_item_id);


--
-- Name: document_header document_header_pkey; Type: CONSTRAINT; Schema: operations; Owner: postgres
--

ALTER TABLE ONLY operations.document_header
    ADD CONSTRAINT document_header_pkey PRIMARY KEY (document_id);


--
-- Name: document_items document_items_pkey; Type: CONSTRAINT; Schema: operations; Owner: postgres
--

ALTER TABLE ONLY operations.document_items
    ADD CONSTRAINT document_items_pkey PRIMARY KEY (content_id);


--
-- Name: external_module external_module_pkey; Type: CONSTRAINT; Schema: operations; Owner: postgres
--

ALTER TABLE ONLY operations.external_module
    ADD CONSTRAINT external_module_pkey PRIMARY KEY (external_id);


--
-- Name: product_document_items product_document_items_pkey; Type: CONSTRAINT; Schema: operations; Owner: postgres
--

ALTER TABLE ONLY operations.product_document_items
    ADD CONSTRAINT product_document_items_pkey PRIMARY KEY (productdocu_id);


--
-- Name: serial_tracking serial_tracking_pkey; Type: CONSTRAINT; Schema: operations; Owner: postgres
--

ALTER TABLE ONLY operations.serial_tracking
    ADD CONSTRAINT serial_tracking_pkey PRIMARY KEY (serial_id);


--
-- Name: serial_tracking serial_tracking_serial_no_key; Type: CONSTRAINT; Schema: operations; Owner: postgres
--

ALTER TABLE ONLY operations.serial_tracking
    ADD CONSTRAINT serial_tracking_serial_no_key UNIQUE (serial_no);


--
-- Name: components components_pkey; Type: CONSTRAINT; Schema: production; Owner: postgres
--

ALTER TABLE ONLY production.components
    ADD CONSTRAINT components_pkey PRIMARY KEY (component_id);


--
-- Name: delivery_requests delivery_requests_pkey; Type: CONSTRAINT; Schema: production; Owner: postgres
--

ALTER TABLE ONLY production.delivery_requests
    ADD CONSTRAINT delivery_requests_pkey PRIMARY KEY (delivery_request_id);


--
-- Name: equipment equipment_pkey; Type: CONSTRAINT; Schema: production; Owner: postgres
--

ALTER TABLE ONLY production.equipment
    ADD CONSTRAINT equipment_pkey PRIMARY KEY (equipment_id);


--
-- Name: labor labor_pkey; Type: CONSTRAINT; Schema: production; Owner: postgres
--

ALTER TABLE ONLY production.labor
    ADD CONSTRAINT labor_pkey PRIMARY KEY (labor_id);


--
-- Name: production_orders_details production_orders_details_pkey; Type: CONSTRAINT; Schema: production; Owner: postgres
--

ALTER TABLE ONLY production.production_orders_details
    ADD CONSTRAINT production_orders_details_pkey PRIMARY KEY (production_order_detail_id);


--
-- Name: production_orders_header production_orders_header_pkey; Type: CONSTRAINT; Schema: production; Owner: postgres
--

ALTER TABLE ONLY production.production_orders_header
    ADD CONSTRAINT production_orders_header_pkey PRIMARY KEY (production_order_id);


--
-- Name: contractual_worker_request contractual_worker_request_pkey; Type: CONSTRAINT; Schema: project_management; Owner: postgres
--

ALTER TABLE ONLY project_management.contractual_worker_request
    ADD CONSTRAINT contractual_worker_request_pkey PRIMARY KEY (request_id);


--
-- Name: external_project_cost_management external_project_cost_management_pkey; Type: CONSTRAINT; Schema: project_management; Owner: postgres
--

ALTER TABLE ONLY project_management.external_project_cost_management
    ADD CONSTRAINT external_project_cost_management_pkey PRIMARY KEY (project_resources_id);


--
-- Name: external_project_details external_project_details_pkey; Type: CONSTRAINT; Schema: project_management; Owner: postgres
--

ALTER TABLE ONLY project_management.external_project_details
    ADD CONSTRAINT external_project_details_pkey PRIMARY KEY (project_id);


--
-- Name: external_project_labor external_project_labor_pkey; Type: CONSTRAINT; Schema: project_management; Owner: postgres
--

ALTER TABLE ONLY project_management.external_project_labor
    ADD CONSTRAINT external_project_labor_pkey PRIMARY KEY (project_labor_id);


--
-- Name: external_project_request external_project_request_pkey; Type: CONSTRAINT; Schema: project_management; Owner: postgres
--

ALTER TABLE ONLY project_management.external_project_request
    ADD CONSTRAINT external_project_request_pkey PRIMARY KEY (ext_project_request_id);


--
-- Name: external_project_task_list external_project_task_list_pkey; Type: CONSTRAINT; Schema: project_management; Owner: postgres
--

ALTER TABLE ONLY project_management.external_project_task_list
    ADD CONSTRAINT external_project_task_list_pkey PRIMARY KEY (task_id);


--
-- Name: external_project_tracking external_project_tracking_pkey; Type: CONSTRAINT; Schema: project_management; Owner: postgres
--

ALTER TABLE ONLY project_management.external_project_tracking
    ADD CONSTRAINT external_project_tracking_pkey PRIMARY KEY (project_tracking_id);


--
-- Name: external_project_warranty external_project_warranty_pkey; Type: CONSTRAINT; Schema: project_management; Owner: postgres
--

ALTER TABLE ONLY project_management.external_project_warranty
    ADD CONSTRAINT external_project_warranty_pkey PRIMARY KEY (project_warranty_id);


--
-- Name: internal_project_details internal_project_details_pkey; Type: CONSTRAINT; Schema: project_management; Owner: postgres
--

ALTER TABLE ONLY project_management.internal_project_details
    ADD CONSTRAINT internal_project_details_pkey PRIMARY KEY (intrnl_project_id);


--
-- Name: internal_project_labor internal_project_labor_pkey; Type: CONSTRAINT; Schema: project_management; Owner: postgres
--

ALTER TABLE ONLY project_management.internal_project_labor
    ADD CONSTRAINT internal_project_labor_pkey PRIMARY KEY (intrnl_project_labor_id);


--
-- Name: internal_project_request internal_project_request_pkey; Type: CONSTRAINT; Schema: project_management; Owner: postgres
--

ALTER TABLE ONLY project_management.internal_project_request
    ADD CONSTRAINT internal_project_request_pkey PRIMARY KEY (project_request_id);


--
-- Name: internal_project_task_list internal_project_task_list_pkey; Type: CONSTRAINT; Schema: project_management; Owner: postgres
--

ALTER TABLE ONLY project_management.internal_project_task_list
    ADD CONSTRAINT internal_project_task_list_pkey PRIMARY KEY (intrnl_task_id);


--
-- Name: internal_project_tracking internal_project_tracking_pkey; Type: CONSTRAINT; Schema: project_management; Owner: postgres
--

ALTER TABLE ONLY project_management.internal_project_tracking
    ADD CONSTRAINT internal_project_tracking_pkey PRIMARY KEY (intrnl_project_tracking_id);


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
-- Name: batch_inspection batch_inspection_pkey; Type: CONSTRAINT; Schema: purchasing; Owner: postgres
--

ALTER TABLE ONLY purchasing.batch_inspection
    ADD CONSTRAINT batch_inspection_pkey PRIMARY KEY (inspection_id);


--
-- Name: credit_memo credit_memo_pkey; Type: CONSTRAINT; Schema: purchasing; Owner: postgres
--

ALTER TABLE ONLY purchasing.credit_memo
    ADD CONSTRAINT credit_memo_pkey PRIMARY KEY (credit_memo_id);


--
-- Name: purchase_invoice purchase_invoice_pkey; Type: CONSTRAINT; Schema: purchasing; Owner: postgres
--

ALTER TABLE ONLY purchasing.purchase_invoice
    ADD CONSTRAINT purchase_invoice_pkey PRIMARY KEY (invoice_id);


--
-- Name: purchase_order purchase_order_pkey; Type: CONSTRAINT; Schema: purchasing; Owner: postgres
--

ALTER TABLE ONLY purchasing.purchase_order
    ADD CONSTRAINT purchase_order_pkey PRIMARY KEY (purchase_id);


--
-- Name: purchase_quotation purchase_quotation_pkey; Type: CONSTRAINT; Schema: purchasing; Owner: postgres
--

ALTER TABLE ONLY purchasing.purchase_quotation
    ADD CONSTRAINT purchase_quotation_pkey PRIMARY KEY (quotation_id);


--
-- Name: purchase_requests purchase_requests_pkey; Type: CONSTRAINT; Schema: purchasing; Owner: postgres
--

ALTER TABLE ONLY purchasing.purchase_requests
    ADD CONSTRAINT purchase_requests_pkey PRIMARY KEY (request_id);


--
-- Name: quotation_contents quotation_contents_pkey; Type: CONSTRAINT; Schema: purchasing; Owner: postgres
--

ALTER TABLE ONLY purchasing.quotation_contents
    ADD CONSTRAINT quotation_contents_pkey PRIMARY KEY (quotation_content_id);


--
-- Name: received_shipments received_shipments_pkey; Type: CONSTRAINT; Schema: purchasing; Owner: postgres
--

ALTER TABLE ONLY purchasing.received_shipments
    ADD CONSTRAINT received_shipments_pkey PRIMARY KEY (shipment_id);


--
-- Name: vendor_application vendor_application_pkey; Type: CONSTRAINT; Schema: purchasing; Owner: postgres
--

ALTER TABLE ONLY purchasing.vendor_application
    ADD CONSTRAINT vendor_application_pkey PRIMARY KEY (application_reference);


--
-- Name: blanket_agreement blanket_agreement_pkey; Type: CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.blanket_agreement
    ADD CONSTRAINT blanket_agreement_pkey PRIMARY KEY (agreement_id);


--
-- Name: campaign_contacts campaign_contacts_pkey; Type: CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.campaign_contacts
    ADD CONSTRAINT campaign_contacts_pkey PRIMARY KEY (contact_id);


--
-- Name: campaigns campaigns_pkey; Type: CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.campaigns
    ADD CONSTRAINT campaigns_pkey PRIMARY KEY (campaign_id);


--
-- Name: customers customers_email_address_key; Type: CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.customers
    ADD CONSTRAINT customers_email_address_key UNIQUE (email_address);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);


--
-- Name: leads leads_lead_email_key; Type: CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.leads
    ADD CONSTRAINT leads_lead_email_key UNIQUE (lead_email);


--
-- Name: leads leads_pkey; Type: CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.leads
    ADD CONSTRAINT leads_pkey PRIMARY KEY (lead_id);


--
-- Name: opportunities opportunities_pkey; Type: CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.opportunities
    ADD CONSTRAINT opportunities_pkey PRIMARY KEY (opportunity_id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (payment_id);


--
-- Name: quotation quotation_pkey; Type: CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.quotation
    ADD CONSTRAINT quotation_pkey PRIMARY KEY (quotation_id);


--
-- Name: receipt receipt_pkey; Type: CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.receipt
    ADD CONSTRAINT receipt_pkey PRIMARY KEY (receipt_id);


--
-- Name: renewal_warranty renewal_warranty_pkey; Type: CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.renewal_warranty
    ADD CONSTRAINT renewal_warranty_pkey PRIMARY KEY (renewal_id);


--
-- Name: sales_costing sales_costing_pkey; Type: CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.sales_costing
    ADD CONSTRAINT sales_costing_pkey PRIMARY KEY (sales_costing_id);


--
-- Name: sales_invoices sales_invoices_pkey; Type: CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.sales_invoices
    ADD CONSTRAINT sales_invoices_pkey PRIMARY KEY (invoice_id);


--
-- Name: shipping_details shipping_details_pkey; Type: CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.shipping_details
    ADD CONSTRAINT shipping_details_pkey PRIMARY KEY (shipping_id);


--
-- Name: shipping_details shipping_details_tracking_num_key; Type: CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.shipping_details
    ADD CONSTRAINT shipping_details_tracking_num_key UNIQUE (tracking_num);


--
-- Name: statement_item statement_item_pkey; Type: CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.statement_item
    ADD CONSTRAINT statement_item_pkey PRIMARY KEY (statement_item_id);


--
-- Name: statement statement_pkey; Type: CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.statement
    ADD CONSTRAINT statement_pkey PRIMARY KEY (statement_id);


--
-- Name: ticket_convo ticket_convo_pkey; Type: CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.ticket_convo
    ADD CONSTRAINT ticket_convo_pkey PRIMARY KEY (convo_id);


--
-- Name: ticket ticket_pkey; Type: CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.ticket
    ADD CONSTRAINT ticket_pkey PRIMARY KEY (ticket_id);


--
-- Name: after_analysis_sched after_analysis_sched_pkey; Type: CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.after_analysis_sched
    ADD CONSTRAINT after_analysis_sched_pkey PRIMARY KEY (analysis_sched_id);


--
-- Name: chat_message chat_message_pkey; Type: CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.chat_message
    ADD CONSTRAINT chat_message_pkey PRIMARY KEY (message_id);


--
-- Name: comm_session comm_session_pkey; Type: CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.comm_session
    ADD CONSTRAINT comm_session_pkey PRIMARY KEY (session_id);


--
-- Name: delivery_order delivery_order_pkey; Type: CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.delivery_order
    ADD CONSTRAINT delivery_order_pkey PRIMARY KEY (delivery_order_id);


--
-- Name: renewal_history renewal_history_pkey; Type: CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.renewal_history
    ADD CONSTRAINT renewal_history_pkey PRIMARY KEY (renewal_id);


--
-- Name: service_analysis service_analysis_pkey; Type: CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.service_analysis
    ADD CONSTRAINT service_analysis_pkey PRIMARY KEY (analysis_id);


--
-- Name: service_billing service_billing_pkey; Type: CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.service_billing
    ADD CONSTRAINT service_billing_pkey PRIMARY KEY (service_billing_id);


--
-- Name: service_call_history service_call_history_pkey; Type: CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.service_call_history
    ADD CONSTRAINT service_call_history_pkey PRIMARY KEY (service_call_id);


--
-- Name: service_call service_call_pkey; Type: CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.service_call
    ADD CONSTRAINT service_call_pkey PRIMARY KEY (service_call_id);


--
-- Name: service_contract service_contract_pkey; Type: CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.service_contract
    ADD CONSTRAINT service_contract_pkey PRIMARY KEY (contract_id);


--
-- Name: service_cost service_cost_pkey; Type: CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.service_cost
    ADD CONSTRAINT service_cost_pkey PRIMARY KEY (service_cost_id);


--
-- Name: service_order service_order_pkey; Type: CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.service_order
    ADD CONSTRAINT service_order_pkey PRIMARY KEY (service_order_id);


--
-- Name: service_purchase service_purchase_pkey; Type: CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.service_purchase
    ADD CONSTRAINT service_purchase_pkey PRIMARY KEY (service_purchase_id);


--
-- Name: service_report service_report_pkey; Type: CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.service_report
    ADD CONSTRAINT service_report_pkey PRIMARY KEY (report_id);


--
-- Name: service_request service_request_pkey; Type: CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.service_request
    ADD CONSTRAINT service_request_pkey PRIMARY KEY (service_request_id);


--
-- Name: service_ticket service_ticket_pkey; Type: CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.service_ticket
    ADD CONSTRAINT service_ticket_pkey PRIMARY KEY (service_ticket_id);


--
-- Name: technician technician_pkey; Type: CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.technician
    ADD CONSTRAINT technician_pkey PRIMARY KEY (technician_id);


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
-- Name: chart_of_accounts before_insert_chart_of_accounts; Type: TRIGGER; Schema: accounting; Owner: postgres
--

CREATE TRIGGER before_insert_chart_of_accounts BEFORE INSERT ON accounting.chart_of_accounts FOR EACH ROW EXECUTE FUNCTION accounting.generate_account_id();


--
-- Name: currency before_insert_currency; Type: TRIGGER; Schema: accounting; Owner: postgres
--

CREATE TRIGGER before_insert_currency BEFORE INSERT ON accounting.currency FOR EACH ROW EXECUTE FUNCTION accounting.generate_currency_id();


--
-- Name: general_ledger_accounts before_insert_general_ledger_accounts; Type: TRIGGER; Schema: accounting; Owner: postgres
--

CREATE TRIGGER before_insert_general_ledger_accounts BEFORE INSERT ON accounting.general_ledger_accounts FOR EACH ROW EXECUTE FUNCTION accounting.generate_gl_account_id();


--
-- Name: journal_entries before_insert_journal_entries; Type: TRIGGER; Schema: accounting; Owner: postgres
--

CREATE TRIGGER before_insert_journal_entries BEFORE INSERT ON accounting.journal_entries FOR EACH ROW EXECUTE FUNCTION accounting.generate_journal_id();


--
-- Name: journal_entry_lines before_insert_journal_entry_lines; Type: TRIGGER; Schema: accounting; Owner: postgres
--

CREATE TRIGGER before_insert_journal_entry_lines BEFORE INSERT ON accounting.journal_entry_lines FOR EACH ROW EXECUTE FUNCTION accounting.generate_entry_line_id();


--
-- Name: assets before_insert_asset; Type: TRIGGER; Schema: admin; Owner: postgres
--

CREATE TRIGGER before_insert_asset BEFORE INSERT ON admin.assets FOR EACH ROW EXECUTE FUNCTION admin.generate_asset_id();


--
-- Name: audit_log before_insert_audit_log; Type: TRIGGER; Schema: admin; Owner: postgres
--

CREATE TRIGGER before_insert_audit_log BEFORE INSERT ON admin.audit_log FOR EACH ROW EXECUTE FUNCTION admin.generate_log_id();


--
-- Name: business_partner_master before_insert_business_partner_master; Type: TRIGGER; Schema: admin; Owner: postgres
--

CREATE TRIGGER before_insert_business_partner_master BEFORE INSERT ON admin.business_partner_master FOR EACH ROW EXECUTE FUNCTION admin.generate_partner_id();


--
-- Name: item_master_data before_insert_item_master_data; Type: TRIGGER; Schema: admin; Owner: postgres
--

CREATE TRIGGER before_insert_item_master_data BEFORE INSERT ON admin.item_master_data FOR EACH ROW EXECUTE FUNCTION admin.generate_item_id();


--
-- Name: policies before_insert_policies; Type: TRIGGER; Schema: admin; Owner: postgres
--

CREATE TRIGGER before_insert_policies BEFORE INSERT ON admin.policies FOR EACH ROW EXECUTE FUNCTION admin.generate_policy_id();


--
-- Name: products before_insert_products; Type: TRIGGER; Schema: admin; Owner: postgres
--

CREATE TRIGGER before_insert_products BEFORE INSERT ON admin.products FOR EACH ROW EXECUTE FUNCTION admin.generate_product_id();


--
-- Name: raw_materials before_insert_raw_materials; Type: TRIGGER; Schema: admin; Owner: postgres
--

CREATE TRIGGER before_insert_raw_materials BEFORE INSERT ON admin.raw_materials FOR EACH ROW EXECUTE FUNCTION admin.generate_material_id();


--
-- Name: roles_permission before_insert_role_permission; Type: TRIGGER; Schema: admin; Owner: postgres
--

CREATE TRIGGER before_insert_role_permission BEFORE INSERT ON admin.roles_permission FOR EACH ROW EXECUTE FUNCTION admin.generate_role_id();


--
-- Name: users before_insert_user; Type: TRIGGER; Schema: admin; Owner: postgres
--

CREATE TRIGGER before_insert_user BEFORE INSERT ON admin.users FOR EACH ROW EXECUTE FUNCTION admin.generate_user_id();


--
-- Name: vendor before_insert_vendor; Type: TRIGGER; Schema: admin; Owner: postgres
--

CREATE TRIGGER before_insert_vendor BEFORE INSERT ON admin.vendor FOR EACH ROW EXECUTE FUNCTION admin.generate_vendor_code();


--
-- Name: warehouse before_insert_warehouse; Type: TRIGGER; Schema: admin; Owner: postgres
--

CREATE TRIGGER before_insert_warehouse BEFORE INSERT ON admin.warehouse FOR EACH ROW EXECUTE FUNCTION admin.generate_warehouse_id();


--
-- Name: billing_receipt before_insert_billing_receipt; Type: TRIGGER; Schema: distribution; Owner: postgres
--

CREATE TRIGGER before_insert_billing_receipt BEFORE INSERT ON distribution.billing_receipt FOR EACH ROW EXECUTE FUNCTION distribution.generate_billing_receipt_id();


--
-- Name: carrier before_insert_carrier; Type: TRIGGER; Schema: distribution; Owner: postgres
--

CREATE TRIGGER before_insert_carrier BEFORE INSERT ON distribution.carrier FOR EACH ROW EXECUTE FUNCTION distribution.generate_carrier_id();


--
-- Name: delivery_order before_insert_delivery_order; Type: TRIGGER; Schema: distribution; Owner: postgres
--

CREATE TRIGGER before_insert_delivery_order BEFORE INSERT ON distribution.delivery_order FOR EACH ROW EXECUTE FUNCTION distribution.generate_delivery_order_id();


--
-- Name: delivery_receipt before_insert_delivery_receipt; Type: TRIGGER; Schema: distribution; Owner: postgres
--

CREATE TRIGGER before_insert_delivery_receipt BEFORE INSERT ON distribution.delivery_receipt FOR EACH ROW EXECUTE FUNCTION distribution.generate_delivery_receipt_id();


--
-- Name: failed_shipment before_insert_failed_shipment; Type: TRIGGER; Schema: distribution; Owner: postgres
--

CREATE TRIGGER before_insert_failed_shipment BEFORE INSERT ON distribution.failed_shipment FOR EACH ROW EXECUTE FUNCTION distribution.generate_failed_shipment_id();


--
-- Name: goods_issue before_insert_goods_issue; Type: TRIGGER; Schema: distribution; Owner: postgres
--

CREATE TRIGGER before_insert_goods_issue BEFORE INSERT ON distribution.goods_issue FOR EACH ROW EXECUTE FUNCTION distribution.generate_billing_goods_issue_id();


--
-- Name: logistics_approval_request before_insert_logistics_approval_request; Type: TRIGGER; Schema: distribution; Owner: postgres
--

CREATE TRIGGER before_insert_logistics_approval_request BEFORE INSERT ON distribution.logistics_approval_request FOR EACH ROW EXECUTE FUNCTION distribution.generate_approval_request_id();


--
-- Name: operational_cost before_insert_operational_cost; Type: TRIGGER; Schema: distribution; Owner: postgres
--

CREATE TRIGGER before_insert_operational_cost BEFORE INSERT ON distribution.operational_cost FOR EACH ROW EXECUTE FUNCTION distribution.generate_operational_cost_id();


--
-- Name: packing_cost before_insert_packing_cost; Type: TRIGGER; Schema: distribution; Owner: postgres
--

CREATE TRIGGER before_insert_packing_cost BEFORE INSERT ON distribution.packing_cost FOR EACH ROW EXECUTE FUNCTION distribution.generate_packing_cost_id();


--
-- Name: packing_list before_insert_packing_list; Type: TRIGGER; Schema: distribution; Owner: postgres
--

CREATE TRIGGER before_insert_packing_list BEFORE INSERT ON distribution.packing_list FOR EACH ROW EXECUTE FUNCTION distribution.generate_packing_list_id();


--
-- Name: picking_list before_insert_picking_list; Type: TRIGGER; Schema: distribution; Owner: postgres
--

CREATE TRIGGER before_insert_picking_list BEFORE INSERT ON distribution.picking_list FOR EACH ROW EXECUTE FUNCTION distribution.generate_picking_list_id();


--
-- Name: rejection before_insert_rejection; Type: TRIGGER; Schema: distribution; Owner: postgres
--

CREATE TRIGGER before_insert_rejection BEFORE INSERT ON distribution.rejection FOR EACH ROW EXECUTE FUNCTION distribution.generate_rejection_id();


--
-- Name: rework_order before_insert_rework_order; Type: TRIGGER; Schema: distribution; Owner: postgres
--

CREATE TRIGGER before_insert_rework_order BEFORE INSERT ON distribution.rework_order FOR EACH ROW EXECUTE FUNCTION distribution.generate_rework_id();


--
-- Name: shipping_cost before_insert_shipping_cost; Type: TRIGGER; Schema: distribution; Owner: postgres
--

CREATE TRIGGER before_insert_shipping_cost BEFORE INSERT ON distribution.shipping_cost FOR EACH ROW EXECUTE FUNCTION distribution.generate_shipping_cost_id();


--
-- Name: budget_approvals before_insert_budget_approvals; Type: TRIGGER; Schema: finance; Owner: postgres
--

CREATE TRIGGER before_insert_budget_approvals BEFORE INSERT ON finance.budget_approvals FOR EACH ROW EXECUTE FUNCTION finance.generate_validation_id();


--
-- Name: budget_validations before_insert_budget_validations; Type: TRIGGER; Schema: finance; Owner: postgres
--

CREATE TRIGGER before_insert_budget_validations BEFORE INSERT ON finance.budget_validations FOR EACH ROW EXECUTE FUNCTION finance.generate_validation_id();


--
-- Name: workforce_allocation before_insert_allocation; Type: TRIGGER; Schema: human_resources; Owner: postgres
--

CREATE TRIGGER before_insert_allocation BEFORE INSERT ON human_resources.workforce_allocation FOR EACH ROW EXECUTE FUNCTION human_resources.generate_allocation_id();


--
-- Name: attendance_tracking before_insert_attendance; Type: TRIGGER; Schema: human_resources; Owner: postgres
--

CREATE TRIGGER before_insert_attendance BEFORE INSERT ON human_resources.attendance_tracking FOR EACH ROW EXECUTE FUNCTION human_resources.generate_attendance_id();


--
-- Name: candidates before_insert_candidate; Type: TRIGGER; Schema: human_resources; Owner: postgres
--

CREATE TRIGGER before_insert_candidate BEFORE INSERT ON human_resources.candidates FOR EACH ROW EXECUTE FUNCTION human_resources.generate_candidate_id();


--
-- Name: departments before_insert_department; Type: TRIGGER; Schema: human_resources; Owner: postgres
--

CREATE TRIGGER before_insert_department BEFORE INSERT ON human_resources.departments FOR EACH ROW EXECUTE FUNCTION human_resources.generate_department_id();


--
-- Name: employees before_insert_employee; Type: TRIGGER; Schema: human_resources; Owner: postgres
--

CREATE TRIGGER before_insert_employee BEFORE INSERT ON human_resources.employees FOR EACH ROW EXECUTE FUNCTION human_resources.generate_employee_id();


--
-- Name: interviews before_insert_interview; Type: TRIGGER; Schema: human_resources; Owner: postgres
--

CREATE TRIGGER before_insert_interview BEFORE INSERT ON human_resources.interviews FOR EACH ROW EXECUTE FUNCTION human_resources.generate_interview_id();


--
-- Name: job_posting before_insert_job; Type: TRIGGER; Schema: human_resources; Owner: postgres
--

CREATE TRIGGER before_insert_job BEFORE INSERT ON human_resources.job_posting FOR EACH ROW EXECUTE FUNCTION human_resources.generate_job_id();


--
-- Name: leave_requests before_insert_leave; Type: TRIGGER; Schema: human_resources; Owner: postgres
--

CREATE TRIGGER before_insert_leave BEFORE INSERT ON human_resources.leave_requests FOR EACH ROW EXECUTE FUNCTION human_resources.generate_leave_id();


--
-- Name: payroll before_insert_payroll; Type: TRIGGER; Schema: human_resources; Owner: postgres
--

CREATE TRIGGER before_insert_payroll BEFORE INSERT ON human_resources.payroll FOR EACH ROW EXECUTE FUNCTION human_resources.generate_payroll_id();


--
-- Name: employee_performance before_insert_performance; Type: TRIGGER; Schema: human_resources; Owner: postgres
--

CREATE TRIGGER before_insert_performance BEFORE INSERT ON human_resources.employee_performance FOR EACH ROW EXECUTE FUNCTION human_resources.generate_performance_id();


--
-- Name: employee_salary before_insert_salary; Type: TRIGGER; Schema: human_resources; Owner: postgres
--

CREATE TRIGGER before_insert_salary BEFORE INSERT ON human_resources.employee_salary FOR EACH ROW EXECUTE FUNCTION human_resources.generate_salary_id();


--
-- Name: deprecation_report before_insert_deprecation_report; Type: TRIGGER; Schema: inventory; Owner: postgres
--

CREATE TRIGGER before_insert_deprecation_report BEFORE INSERT ON inventory.deprecation_report FOR EACH ROW EXECUTE FUNCTION inventory.generate_deprecation_report_id();


--
-- Name: inventory_adjustments before_insert_inventory_adjustments; Type: TRIGGER; Schema: inventory; Owner: postgres
--

CREATE TRIGGER before_insert_inventory_adjustments BEFORE INSERT ON inventory.inventory_adjustments FOR EACH ROW EXECUTE FUNCTION inventory.generate_adjustment_id();


--
-- Name: inventory_cyclic_counts before_insert_inventory_cyclic_counts; Type: TRIGGER; Schema: inventory; Owner: postgres
--

CREATE TRIGGER before_insert_inventory_cyclic_counts BEFORE INSERT ON inventory.inventory_cyclic_counts FOR EACH ROW EXECUTE FUNCTION inventory.generate_inventory_count_id();


--
-- Name: inventory_item before_insert_inventory_item; Type: TRIGGER; Schema: inventory; Owner: postgres
--

CREATE TRIGGER before_insert_inventory_item BEFORE INSERT ON inventory.inventory_item FOR EACH ROW EXECUTE FUNCTION inventory.generate_inventory_item_id();


--
-- Name: inventory_item_master_data before_insert_inventory_item_master_data; Type: TRIGGER; Schema: inventory; Owner: postgres
--

CREATE TRIGGER before_insert_inventory_item_master_data BEFORE INSERT ON inventory.inventory_item_master_data FOR EACH ROW EXECUTE FUNCTION inventory.generate_item_md_id();


--
-- Name: warehouse_movement before_insert_warehouse_movement; Type: TRIGGER; Schema: inventory; Owner: postgres
--

CREATE TRIGGER before_insert_warehouse_movement BEFORE INSERT ON inventory.warehouse_movement FOR EACH ROW EXECUTE FUNCTION inventory.generate_movement_id();


--
-- Name: bill_of_materials before_insert_bom; Type: TRIGGER; Schema: mrp; Owner: postgres
--

CREATE TRIGGER before_insert_bom BEFORE INSERT ON mrp.bill_of_materials FOR EACH ROW EXECUTE FUNCTION mrp.generate_bom_id();


--
-- Name: overall_production before_insert_cost; Type: TRIGGER; Schema: mrp; Owner: postgres
--

CREATE TRIGGER before_insert_cost BEFORE INSERT ON mrp.overall_production FOR EACH ROW EXECUTE FUNCTION mrp.generate_cost_id();


--
-- Name: non_project_order_pricing before_insert_non_project_costing; Type: TRIGGER; Schema: mrp; Owner: postgres
--

CREATE TRIGGER before_insert_non_project_costing BEFORE INSERT ON mrp.non_project_order_pricing FOR EACH ROW EXECUTE FUNCTION mrp.generate_non_project_costing_id();


--
-- Name: principal_items before_insert_principal_item; Type: TRIGGER; Schema: mrp; Owner: postgres
--

CREATE TRIGGER before_insert_principal_item BEFORE INSERT ON mrp.principal_items FOR EACH ROW EXECUTE FUNCTION mrp.generate_principal_item_id();


--
-- Name: document_header before_insert_document_header; Type: TRIGGER; Schema: operations; Owner: postgres
--

CREATE TRIGGER before_insert_document_header BEFORE INSERT ON operations.document_header FOR EACH ROW EXECUTE FUNCTION operations.generate_document_id();


--
-- Name: document_items before_insert_document_items; Type: TRIGGER; Schema: operations; Owner: postgres
--

CREATE TRIGGER before_insert_document_items BEFORE INSERT ON operations.document_items FOR EACH ROW EXECUTE FUNCTION operations.generate_content_id();


--
-- Name: external_module before_insert_external_module; Type: TRIGGER; Schema: operations; Owner: postgres
--

CREATE TRIGGER before_insert_external_module BEFORE INSERT ON operations.external_module FOR EACH ROW EXECUTE FUNCTION operations.generate_external_id();


--
-- Name: product_document_items before_insert_product_document_items; Type: TRIGGER; Schema: operations; Owner: postgres
--

CREATE TRIGGER before_insert_product_document_items BEFORE INSERT ON operations.product_document_items FOR EACH ROW EXECUTE FUNCTION operations.generate_productdocu_id();


--
-- Name: serial_tracking before_insert_serial_tracking; Type: TRIGGER; Schema: operations; Owner: postgres
--

CREATE TRIGGER before_insert_serial_tracking BEFORE INSERT ON operations.serial_tracking FOR EACH ROW EXECUTE FUNCTION operations.generate_serial_id();


--
-- Name: components before_insert_component; Type: TRIGGER; Schema: production; Owner: postgres
--

CREATE TRIGGER before_insert_component BEFORE INSERT ON production.components FOR EACH ROW EXECUTE FUNCTION production.generate_component_id();


--
-- Name: delivery_requests before_insert_delivery_request; Type: TRIGGER; Schema: production; Owner: postgres
--

CREATE TRIGGER before_insert_delivery_request BEFORE INSERT ON production.delivery_requests FOR EACH ROW EXECUTE FUNCTION production.generate_delivery_request_id();


--
-- Name: equipment before_insert_equipment; Type: TRIGGER; Schema: production; Owner: postgres
--

CREATE TRIGGER before_insert_equipment BEFORE INSERT ON production.equipment FOR EACH ROW EXECUTE FUNCTION production.generate_equipment_id();


--
-- Name: labor before_insert_labor; Type: TRIGGER; Schema: production; Owner: postgres
--

CREATE TRIGGER before_insert_labor BEFORE INSERT ON production.labor FOR EACH ROW EXECUTE FUNCTION production.generate_labor_id();


--
-- Name: production_orders_header before_insert_production_order; Type: TRIGGER; Schema: production; Owner: postgres
--

CREATE TRIGGER before_insert_production_order BEFORE INSERT ON production.production_orders_header FOR EACH ROW EXECUTE FUNCTION production.generate_production_order_id();


--
-- Name: production_orders_details before_insert_production_order_detail; Type: TRIGGER; Schema: production; Owner: postgres
--

CREATE TRIGGER before_insert_production_order_detail BEFORE INSERT ON production.production_orders_details FOR EACH ROW EXECUTE FUNCTION production.generate_production_order_detail_id();


--
-- Name: contractual_worker_request before_insert_contractual_worker_request; Type: TRIGGER; Schema: project_management; Owner: postgres
--

CREATE TRIGGER before_insert_contractual_worker_request BEFORE INSERT ON project_management.contractual_worker_request FOR EACH ROW EXECUTE FUNCTION public.generate_contractual_worker_request_id();


--
-- Name: external_project_cost_management before_insert_external_project_cost_management; Type: TRIGGER; Schema: project_management; Owner: postgres
--

CREATE TRIGGER before_insert_external_project_cost_management BEFORE INSERT ON project_management.external_project_cost_management FOR EACH ROW EXECUTE FUNCTION public.generate_external_project_resources_id();


--
-- Name: external_project_details before_insert_external_project_details; Type: TRIGGER; Schema: project_management; Owner: postgres
--

CREATE TRIGGER before_insert_external_project_details BEFORE INSERT ON project_management.external_project_details FOR EACH ROW EXECUTE FUNCTION public.generate_external_project_details_id();


--
-- Name: external_project_labor before_insert_external_project_labor; Type: TRIGGER; Schema: project_management; Owner: postgres
--

CREATE TRIGGER before_insert_external_project_labor BEFORE INSERT ON project_management.external_project_labor FOR EACH ROW EXECUTE FUNCTION public.generate_external_project_labor_id();


--
-- Name: external_project_request before_insert_external_project_request; Type: TRIGGER; Schema: project_management; Owner: postgres
--

CREATE TRIGGER before_insert_external_project_request BEFORE INSERT ON project_management.external_project_request FOR EACH ROW EXECUTE FUNCTION public.generate_external_project_request_id();


--
-- Name: external_project_task_list before_insert_external_project_task; Type: TRIGGER; Schema: project_management; Owner: postgres
--

CREATE TRIGGER before_insert_external_project_task BEFORE INSERT ON project_management.external_project_task_list FOR EACH ROW EXECUTE FUNCTION public.generate_external_project_task_id();


--
-- Name: external_project_tracking before_insert_external_project_tracking; Type: TRIGGER; Schema: project_management; Owner: postgres
--

CREATE TRIGGER before_insert_external_project_tracking BEFORE INSERT ON project_management.external_project_tracking FOR EACH ROW EXECUTE FUNCTION public.generate_external_project_tracking_id();


--
-- Name: external_project_warranty before_insert_external_project_warranty; Type: TRIGGER; Schema: project_management; Owner: postgres
--

CREATE TRIGGER before_insert_external_project_warranty BEFORE INSERT ON project_management.external_project_warranty FOR EACH ROW EXECUTE FUNCTION public.generate_external_project_warranty_id();


--
-- Name: internal_project_details before_insert_internal_project_details; Type: TRIGGER; Schema: project_management; Owner: postgres
--

CREATE TRIGGER before_insert_internal_project_details BEFORE INSERT ON project_management.internal_project_details FOR EACH ROW EXECUTE FUNCTION public.generate_internal_project_details_id();


--
-- Name: internal_project_labor before_insert_internal_project_labor; Type: TRIGGER; Schema: project_management; Owner: postgres
--

CREATE TRIGGER before_insert_internal_project_labor BEFORE INSERT ON project_management.internal_project_labor FOR EACH ROW EXECUTE FUNCTION public.generate_internal_project_labor_id();


--
-- Name: internal_project_request before_insert_internal_project_request; Type: TRIGGER; Schema: project_management; Owner: postgres
--

CREATE TRIGGER before_insert_internal_project_request BEFORE INSERT ON project_management.internal_project_request FOR EACH ROW EXECUTE FUNCTION public.generate_internal_project_request_id();


--
-- Name: internal_project_task_list before_insert_internal_project_task; Type: TRIGGER; Schema: project_management; Owner: postgres
--

CREATE TRIGGER before_insert_internal_project_task BEFORE INSERT ON project_management.internal_project_task_list FOR EACH ROW EXECUTE FUNCTION public.generate_internal_project_task_id();


--
-- Name: internal_project_tracking before_insert_internal_project_tracking; Type: TRIGGER; Schema: project_management; Owner: postgres
--

CREATE TRIGGER before_insert_internal_project_tracking BEFORE INSERT ON project_management.internal_project_tracking FOR EACH ROW EXECUTE FUNCTION public.generate_internal_project_tracking_id();


--
-- Name: batch_inspection before_insert_batch_inspection; Type: TRIGGER; Schema: purchasing; Owner: postgres
--

CREATE TRIGGER before_insert_batch_inspection BEFORE INSERT ON purchasing.batch_inspection FOR EACH ROW EXECUTE FUNCTION purchasing.generate_inspection_id();


--
-- Name: credit_memo before_insert_credit_memo; Type: TRIGGER; Schema: purchasing; Owner: postgres
--

CREATE TRIGGER before_insert_credit_memo BEFORE INSERT ON purchasing.credit_memo FOR EACH ROW EXECUTE FUNCTION purchasing.generate_credit_memo_id();


--
-- Name: purchase_invoice before_insert_purchase_invoice; Type: TRIGGER; Schema: purchasing; Owner: postgres
--

CREATE TRIGGER before_insert_purchase_invoice BEFORE INSERT ON purchasing.purchase_invoice FOR EACH ROW EXECUTE FUNCTION purchasing.generate_invoice_id();


--
-- Name: purchase_order before_insert_purchase_order; Type: TRIGGER; Schema: purchasing; Owner: postgres
--

CREATE TRIGGER before_insert_purchase_order BEFORE INSERT ON purchasing.purchase_order FOR EACH ROW EXECUTE FUNCTION purchasing.generate_purchase_id();


--
-- Name: purchase_quotation before_insert_purchase_quotation; Type: TRIGGER; Schema: purchasing; Owner: postgres
--

CREATE TRIGGER before_insert_purchase_quotation BEFORE INSERT ON purchasing.purchase_quotation FOR EACH ROW EXECUTE FUNCTION purchasing.generate_quotation_id();


--
-- Name: purchase_requests before_insert_purchase_requests; Type: TRIGGER; Schema: purchasing; Owner: postgres
--

CREATE TRIGGER before_insert_purchase_requests BEFORE INSERT ON purchasing.purchase_requests FOR EACH ROW EXECUTE FUNCTION purchasing.generate_request_id();


--
-- Name: quotation_contents before_insert_quotation_contents; Type: TRIGGER; Schema: purchasing; Owner: postgres
--

CREATE TRIGGER before_insert_quotation_contents BEFORE INSERT ON purchasing.quotation_contents FOR EACH ROW EXECUTE FUNCTION purchasing.generate_quotation_content_id();


--
-- Name: received_shipments before_insert_received_shipments; Type: TRIGGER; Schema: purchasing; Owner: postgres
--

CREATE TRIGGER before_insert_received_shipments BEFORE INSERT ON purchasing.received_shipments FOR EACH ROW EXECUTE FUNCTION purchasing.generate_shipment_id();


--
-- Name: vendor_application before_insert_vendor_application; Type: TRIGGER; Schema: purchasing; Owner: postgres
--

CREATE TRIGGER before_insert_vendor_application BEFORE INSERT ON purchasing.vendor_application FOR EACH ROW EXECUTE FUNCTION purchasing.generate_application_reference();


--
-- Name: blanket_agreement before_insert_blanket_agreement; Type: TRIGGER; Schema: sales; Owner: postgres
--

CREATE TRIGGER before_insert_blanket_agreement BEFORE INSERT ON sales.blanket_agreement FOR EACH ROW EXECUTE FUNCTION sales.generate_agreement_id();


--
-- Name: campaigns before_insert_campaign; Type: TRIGGER; Schema: sales; Owner: postgres
--

CREATE TRIGGER before_insert_campaign BEFORE INSERT ON sales.campaigns FOR EACH ROW EXECUTE FUNCTION sales.generate_campaign_id();


--
-- Name: campaign_contacts before_insert_campaign_contact; Type: TRIGGER; Schema: sales; Owner: postgres
--

CREATE TRIGGER before_insert_campaign_contact BEFORE INSERT ON sales.campaign_contacts FOR EACH ROW EXECUTE FUNCTION sales.generate_contact_id();


--
-- Name: ticket_convo before_insert_convo; Type: TRIGGER; Schema: sales; Owner: postgres
--

CREATE TRIGGER before_insert_convo BEFORE INSERT ON sales.ticket_convo FOR EACH ROW EXECUTE FUNCTION sales.generate_convo_id();


--
-- Name: customers before_insert_customer; Type: TRIGGER; Schema: sales; Owner: postgres
--

CREATE TRIGGER before_insert_customer BEFORE INSERT ON sales.customers FOR EACH ROW EXECUTE FUNCTION sales.generate_customer_id();


--
-- Name: sales_invoices before_insert_invoice; Type: TRIGGER; Schema: sales; Owner: postgres
--

CREATE TRIGGER before_insert_invoice BEFORE INSERT ON sales.sales_invoices FOR EACH ROW EXECUTE FUNCTION sales.generate_invoice_id();


--
-- Name: leads before_insert_lead; Type: TRIGGER; Schema: sales; Owner: postgres
--

CREATE TRIGGER before_insert_lead BEFORE INSERT ON sales.leads FOR EACH ROW EXECUTE FUNCTION sales.generate_lead_id();


--
-- Name: opportunities before_insert_opportunity; Type: TRIGGER; Schema: sales; Owner: postgres
--

CREATE TRIGGER before_insert_opportunity BEFORE INSERT ON sales.opportunities FOR EACH ROW EXECUTE FUNCTION sales.generate_opportunity_id();


--
-- Name: orders before_insert_order; Type: TRIGGER; Schema: sales; Owner: postgres
--

CREATE TRIGGER before_insert_order BEFORE INSERT ON sales.orders FOR EACH ROW EXECUTE FUNCTION sales.generate_order_id();


--
-- Name: payments before_insert_payment; Type: TRIGGER; Schema: sales; Owner: postgres
--

CREATE TRIGGER before_insert_payment BEFORE INSERT ON sales.payments FOR EACH ROW EXECUTE FUNCTION sales.generate_payment_id();


--
-- Name: quotation before_insert_quotation; Type: TRIGGER; Schema: sales; Owner: postgres
--

CREATE TRIGGER before_insert_quotation BEFORE INSERT ON sales.quotation FOR EACH ROW EXECUTE FUNCTION sales.generate_quotation_id();


--
-- Name: receipt before_insert_receipt; Type: TRIGGER; Schema: sales; Owner: postgres
--

CREATE TRIGGER before_insert_receipt BEFORE INSERT ON sales.receipt FOR EACH ROW EXECUTE FUNCTION sales.generate_receipt_id();


--
-- Name: renewal_warranty before_insert_renewal_warranty; Type: TRIGGER; Schema: sales; Owner: postgres
--

CREATE TRIGGER before_insert_renewal_warranty BEFORE INSERT ON sales.renewal_warranty FOR EACH ROW EXECUTE FUNCTION sales.generate_renewal_id();


--
-- Name: sales_costing before_insert_sales_costing; Type: TRIGGER; Schema: sales; Owner: postgres
--

CREATE TRIGGER before_insert_sales_costing BEFORE INSERT ON sales.sales_costing FOR EACH ROW EXECUTE FUNCTION sales.generate_sales_costing_id();


--
-- Name: shipping_details before_insert_shipping; Type: TRIGGER; Schema: sales; Owner: postgres
--

CREATE TRIGGER before_insert_shipping BEFORE INSERT ON sales.shipping_details FOR EACH ROW EXECUTE FUNCTION sales.generate_shipping_id();


--
-- Name: statement before_insert_statement; Type: TRIGGER; Schema: sales; Owner: postgres
--

CREATE TRIGGER before_insert_statement BEFORE INSERT ON sales.statement FOR EACH ROW EXECUTE FUNCTION sales.generate_statement_id();


--
-- Name: statement_item before_insert_statement_item; Type: TRIGGER; Schema: sales; Owner: postgres
--

CREATE TRIGGER before_insert_statement_item BEFORE INSERT ON sales.statement_item FOR EACH ROW EXECUTE FUNCTION sales.generate_statement_item_id();


--
-- Name: ticket before_insert_ticket; Type: TRIGGER; Schema: sales; Owner: postgres
--

CREATE TRIGGER before_insert_ticket BEFORE INSERT ON sales.ticket FOR EACH ROW EXECUTE FUNCTION sales.generate_ticket_id();


--
-- Name: after_analysis_sched before_insert_after_analysis_sched; Type: TRIGGER; Schema: services; Owner: postgres
--

CREATE TRIGGER before_insert_after_analysis_sched BEFORE INSERT ON services.after_analysis_sched FOR EACH ROW EXECUTE FUNCTION services.generate_analysis_sched_id();


--
-- Name: chat_message before_insert_chat_message; Type: TRIGGER; Schema: services; Owner: postgres
--

CREATE TRIGGER before_insert_chat_message BEFORE INSERT ON services.chat_message FOR EACH ROW EXECUTE FUNCTION services.generate_message_id();


--
-- Name: comm_session before_insert_comm_session; Type: TRIGGER; Schema: services; Owner: postgres
--

CREATE TRIGGER before_insert_comm_session BEFORE INSERT ON services.comm_session FOR EACH ROW EXECUTE FUNCTION services.generate_session_id();


--
-- Name: delivery_order before_insert_delivery_order; Type: TRIGGER; Schema: services; Owner: postgres
--

CREATE TRIGGER before_insert_delivery_order BEFORE INSERT ON services.delivery_order FOR EACH ROW EXECUTE FUNCTION services.generate_delivery_order_id();


--
-- Name: renewal_history before_insert_renewal_history; Type: TRIGGER; Schema: services; Owner: postgres
--

CREATE TRIGGER before_insert_renewal_history BEFORE INSERT ON services.renewal_history FOR EACH ROW EXECUTE FUNCTION services.generate_renewal_history_id();


--
-- Name: service_analysis before_insert_service_analysis; Type: TRIGGER; Schema: services; Owner: postgres
--

CREATE TRIGGER before_insert_service_analysis BEFORE INSERT ON services.service_analysis FOR EACH ROW EXECUTE FUNCTION services.generate_analysis_id();


--
-- Name: service_billing before_insert_service_billing; Type: TRIGGER; Schema: services; Owner: postgres
--

CREATE TRIGGER before_insert_service_billing BEFORE INSERT ON services.service_billing FOR EACH ROW EXECUTE FUNCTION services.generate_service_billing_id();


--
-- Name: service_call before_insert_service_call; Type: TRIGGER; Schema: services; Owner: postgres
--

CREATE TRIGGER before_insert_service_call BEFORE INSERT ON services.service_call FOR EACH ROW EXECUTE FUNCTION services.generate_service_call_id();


--
-- Name: service_call_history before_insert_service_call_history; Type: TRIGGER; Schema: services; Owner: postgres
--

CREATE TRIGGER before_insert_service_call_history BEFORE INSERT ON services.service_call_history FOR EACH ROW EXECUTE FUNCTION services.generate_service_call_history_id();


--
-- Name: service_contract before_insert_service_contract; Type: TRIGGER; Schema: services; Owner: postgres
--

CREATE TRIGGER before_insert_service_contract BEFORE INSERT ON services.service_contract FOR EACH ROW EXECUTE FUNCTION services.generate_contract_id();


--
-- Name: service_cost before_insert_service_cost; Type: TRIGGER; Schema: services; Owner: postgres
--

CREATE TRIGGER before_insert_service_cost BEFORE INSERT ON services.service_cost FOR EACH ROW EXECUTE FUNCTION services.generate_service_cost_id();


--
-- Name: service_order before_insert_service_order; Type: TRIGGER; Schema: services; Owner: postgres
--

CREATE TRIGGER before_insert_service_order BEFORE INSERT ON services.service_order FOR EACH ROW EXECUTE FUNCTION services.generate_service_order_id();


--
-- Name: service_purchase before_insert_service_purchase; Type: TRIGGER; Schema: services; Owner: postgres
--

CREATE TRIGGER before_insert_service_purchase BEFORE INSERT ON services.service_purchase FOR EACH ROW EXECUTE FUNCTION services.generate_service_purchase_id();


--
-- Name: service_report before_insert_service_report; Type: TRIGGER; Schema: services; Owner: postgres
--

CREATE TRIGGER before_insert_service_report BEFORE INSERT ON services.service_report FOR EACH ROW EXECUTE FUNCTION services.generate_report_id();


--
-- Name: service_request before_insert_service_request; Type: TRIGGER; Schema: services; Owner: postgres
--

CREATE TRIGGER before_insert_service_request BEFORE INSERT ON services.service_request FOR EACH ROW EXECUTE FUNCTION services.generate_service_request_id();


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
-- Name: SCHEMA accounting; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA accounting TO PUBLIC;


--
-- Name: SCHEMA admin; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA admin TO PUBLIC;


--
-- Name: SCHEMA distribution; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA distribution TO PUBLIC;


--
-- Name: SCHEMA finance; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA finance TO PUBLIC;


--
-- Name: SCHEMA human_resources; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA human_resources TO PUBLIC;


--
-- Name: SCHEMA inventory; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA inventory TO PUBLIC;


--
-- Name: SCHEMA management; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA management TO PUBLIC;


--
-- Name: SCHEMA mrp; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA mrp TO PUBLIC;


--
-- Name: SCHEMA operations; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA operations TO PUBLIC;


--
-- Name: SCHEMA production; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA production TO PUBLIC;


--
-- Name: SCHEMA project_management; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA project_management TO PUBLIC;


--
-- Name: SCHEMA purchasing; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA purchasing TO PUBLIC;


--
-- Name: SCHEMA sales; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA sales TO PUBLIC;


--
-- Name: SCHEMA services; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA services TO PUBLIC;


--
-- Name: SCHEMA solution_customizing; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA solution_customizing TO PUBLIC;


--
-- Name: TABLE chart_of_accounts; Type: ACL; Schema: accounting; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE accounting.chart_of_accounts TO erp_user;


--
-- Name: TABLE currency; Type: ACL; Schema: accounting; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE accounting.currency TO erp_user;


--
-- Name: TABLE general_ledger_accounts; Type: ACL; Schema: accounting; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE accounting.general_ledger_accounts TO erp_user;


--
-- Name: TABLE journal_entries; Type: ACL; Schema: accounting; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE accounting.journal_entries TO erp_user;


--
-- Name: TABLE journal_entry_lines; Type: ACL; Schema: accounting; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE accounting.journal_entry_lines TO erp_user;


--
-- Name: TABLE assets; Type: ACL; Schema: admin; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE admin.assets TO erp_user;


--
-- Name: TABLE audit_log; Type: ACL; Schema: admin; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE admin.audit_log TO erp_user;


--
-- Name: TABLE business_partner_master; Type: ACL; Schema: admin; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE admin.business_partner_master TO erp_user;


--
-- Name: TABLE item_master_data; Type: ACL; Schema: admin; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE admin.item_master_data TO erp_user;


--
-- Name: TABLE policies; Type: ACL; Schema: admin; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE admin.policies TO erp_user;


--
-- Name: TABLE products; Type: ACL; Schema: admin; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE admin.products TO erp_user;


--
-- Name: TABLE raw_materials; Type: ACL; Schema: admin; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE admin.raw_materials TO erp_user;


--
-- Name: TABLE roles_permission; Type: ACL; Schema: admin; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE admin.roles_permission TO erp_user;


--
-- Name: TABLE users; Type: ACL; Schema: admin; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE admin.users TO erp_user;


--
-- Name: TABLE vendor; Type: ACL; Schema: admin; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE admin.vendor TO erp_user;


--
-- Name: TABLE warehouse; Type: ACL; Schema: admin; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE admin.warehouse TO erp_user;


--
-- Name: TABLE billing_receipt; Type: ACL; Schema: distribution; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE distribution.billing_receipt TO erp_user;


--
-- Name: TABLE carrier; Type: ACL; Schema: distribution; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE distribution.carrier TO erp_user;


--
-- Name: TABLE delivery_order; Type: ACL; Schema: distribution; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE distribution.delivery_order TO erp_user;


--
-- Name: TABLE delivery_receipt; Type: ACL; Schema: distribution; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE distribution.delivery_receipt TO erp_user;


--
-- Name: TABLE failed_shipment; Type: ACL; Schema: distribution; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE distribution.failed_shipment TO erp_user;


--
-- Name: TABLE goods_issue; Type: ACL; Schema: distribution; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE distribution.goods_issue TO erp_user;


--
-- Name: TABLE logistics_approval_request; Type: ACL; Schema: distribution; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE distribution.logistics_approval_request TO erp_user;


--
-- Name: TABLE operational_cost; Type: ACL; Schema: distribution; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE distribution.operational_cost TO erp_user;


--
-- Name: TABLE packing_cost; Type: ACL; Schema: distribution; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE distribution.packing_cost TO erp_user;


--
-- Name: TABLE packing_list; Type: ACL; Schema: distribution; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE distribution.packing_list TO erp_user;


--
-- Name: TABLE picking_list; Type: ACL; Schema: distribution; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE distribution.picking_list TO erp_user;


--
-- Name: TABLE rejection; Type: ACL; Schema: distribution; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE distribution.rejection TO erp_user;


--
-- Name: TABLE rework_order; Type: ACL; Schema: distribution; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE distribution.rework_order TO erp_user;


--
-- Name: TABLE shipment_details; Type: ACL; Schema: distribution; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE distribution.shipment_details TO erp_user;


--
-- Name: TABLE shipping_cost; Type: ACL; Schema: distribution; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE distribution.shipping_cost TO erp_user;


--
-- Name: TABLE budget_approvals; Type: ACL; Schema: finance; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE finance.budget_approvals TO erp_user;


--
-- Name: TABLE budget_validations; Type: ACL; Schema: finance; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE finance.budget_validations TO erp_user;


--
-- Name: TABLE attendance_tracking; Type: ACL; Schema: human_resources; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE human_resources.attendance_tracking TO erp_user;


--
-- Name: TABLE candidates; Type: ACL; Schema: human_resources; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE human_resources.candidates TO erp_user;


--
-- Name: TABLE departments; Type: ACL; Schema: human_resources; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE human_resources.departments TO erp_user;


--
-- Name: TABLE employee_performance; Type: ACL; Schema: human_resources; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE human_resources.employee_performance TO erp_user;


--
-- Name: TABLE employee_salary; Type: ACL; Schema: human_resources; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE human_resources.employee_salary TO erp_user;


--
-- Name: TABLE employees; Type: ACL; Schema: human_resources; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE human_resources.employees TO erp_user;


--
-- Name: TABLE interviews; Type: ACL; Schema: human_resources; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE human_resources.interviews TO erp_user;


--
-- Name: TABLE job_posting; Type: ACL; Schema: human_resources; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE human_resources.job_posting TO erp_user;


--
-- Name: TABLE leave_requests; Type: ACL; Schema: human_resources; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE human_resources.leave_requests TO erp_user;


--
-- Name: TABLE payroll; Type: ACL; Schema: human_resources; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE human_resources.payroll TO erp_user;


--
-- Name: TABLE workforce_allocation; Type: ACL; Schema: human_resources; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE human_resources.workforce_allocation TO erp_user;


--
-- Name: TABLE deprecation_report; Type: ACL; Schema: inventory; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE inventory.deprecation_report TO erp_user;


--
-- Name: TABLE inventory_adjustments; Type: ACL; Schema: inventory; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE inventory.inventory_adjustments TO erp_user;


--
-- Name: TABLE inventory_cyclic_counts; Type: ACL; Schema: inventory; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE inventory.inventory_cyclic_counts TO erp_user;


--
-- Name: TABLE inventory_item; Type: ACL; Schema: inventory; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE inventory.inventory_item TO erp_user;


--
-- Name: TABLE inventory_item_master_data; Type: ACL; Schema: inventory; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE inventory.inventory_item_master_data TO erp_user;


--
-- Name: TABLE warehouse_movement; Type: ACL; Schema: inventory; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE inventory.warehouse_movement TO erp_user;


--
-- Name: TABLE bill_of_materials; Type: ACL; Schema: mrp; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE mrp.bill_of_materials TO erp_user;


--
-- Name: TABLE non_project_order_pricing; Type: ACL; Schema: mrp; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE mrp.non_project_order_pricing TO erp_user;


--
-- Name: TABLE overall_production; Type: ACL; Schema: mrp; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE mrp.overall_production TO erp_user;


--
-- Name: TABLE principal_items; Type: ACL; Schema: mrp; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE mrp.principal_items TO erp_user;


--
-- Name: TABLE document_header; Type: ACL; Schema: operations; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE operations.document_header TO erp_user;


--
-- Name: TABLE document_items; Type: ACL; Schema: operations; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE operations.document_items TO erp_user;


--
-- Name: TABLE external_module; Type: ACL; Schema: operations; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE operations.external_module TO erp_user;


--
-- Name: TABLE product_document_items; Type: ACL; Schema: operations; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE operations.product_document_items TO erp_user;


--
-- Name: TABLE serial_tracking; Type: ACL; Schema: operations; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE operations.serial_tracking TO erp_user;


--
-- Name: TABLE components; Type: ACL; Schema: production; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE production.components TO erp_user;


--
-- Name: TABLE delivery_requests; Type: ACL; Schema: production; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE production.delivery_requests TO erp_user;


--
-- Name: TABLE equipment; Type: ACL; Schema: production; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE production.equipment TO erp_user;


--
-- Name: TABLE labor; Type: ACL; Schema: production; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE production.labor TO erp_user;


--
-- Name: TABLE production_orders_details; Type: ACL; Schema: production; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE production.production_orders_details TO erp_user;


--
-- Name: TABLE production_orders_header; Type: ACL; Schema: production; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE production.production_orders_header TO erp_user;


--
-- Name: TABLE contractual_worker_request; Type: ACL; Schema: project_management; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE project_management.contractual_worker_request TO erp_user;


--
-- Name: TABLE external_project_cost_management; Type: ACL; Schema: project_management; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE project_management.external_project_cost_management TO erp_user;


--
-- Name: TABLE external_project_details; Type: ACL; Schema: project_management; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE project_management.external_project_details TO erp_user;


--
-- Name: TABLE external_project_labor; Type: ACL; Schema: project_management; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE project_management.external_project_labor TO erp_user;


--
-- Name: TABLE external_project_request; Type: ACL; Schema: project_management; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE project_management.external_project_request TO erp_user;


--
-- Name: TABLE external_project_task_list; Type: ACL; Schema: project_management; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE project_management.external_project_task_list TO erp_user;


--
-- Name: TABLE external_project_tracking; Type: ACL; Schema: project_management; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE project_management.external_project_tracking TO erp_user;


--
-- Name: TABLE external_project_warranty; Type: ACL; Schema: project_management; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE project_management.external_project_warranty TO erp_user;


--
-- Name: TABLE internal_project_details; Type: ACL; Schema: project_management; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE project_management.internal_project_details TO erp_user;


--
-- Name: TABLE internal_project_labor; Type: ACL; Schema: project_management; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE project_management.internal_project_labor TO erp_user;


--
-- Name: TABLE internal_project_request; Type: ACL; Schema: project_management; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE project_management.internal_project_request TO erp_user;


--
-- Name: TABLE internal_project_task_list; Type: ACL; Schema: project_management; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE project_management.internal_project_task_list TO erp_user;


--
-- Name: TABLE internal_project_tracking; Type: ACL; Schema: project_management; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE project_management.internal_project_tracking TO erp_user;


--
-- Name: TABLE batch_inspection; Type: ACL; Schema: purchasing; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE purchasing.batch_inspection TO erp_user;


--
-- Name: TABLE credit_memo; Type: ACL; Schema: purchasing; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE purchasing.credit_memo TO erp_user;


--
-- Name: TABLE purchase_invoice; Type: ACL; Schema: purchasing; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE purchasing.purchase_invoice TO erp_user;


--
-- Name: TABLE purchase_order; Type: ACL; Schema: purchasing; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE purchasing.purchase_order TO erp_user;


--
-- Name: TABLE purchase_quotation; Type: ACL; Schema: purchasing; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE purchasing.purchase_quotation TO erp_user;


--
-- Name: TABLE purchase_requests; Type: ACL; Schema: purchasing; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE purchasing.purchase_requests TO erp_user;


--
-- Name: TABLE quotation_contents; Type: ACL; Schema: purchasing; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE purchasing.quotation_contents TO erp_user;


--
-- Name: TABLE received_shipments; Type: ACL; Schema: purchasing; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE purchasing.received_shipments TO erp_user;


--
-- Name: TABLE vendor_application; Type: ACL; Schema: purchasing; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE purchasing.vendor_application TO erp_user;


--
-- Name: TABLE blanket_agreement; Type: ACL; Schema: sales; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE sales.blanket_agreement TO erp_user;


--
-- Name: TABLE campaign_contacts; Type: ACL; Schema: sales; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE sales.campaign_contacts TO erp_user;


--
-- Name: TABLE campaigns; Type: ACL; Schema: sales; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE sales.campaigns TO erp_user;


--
-- Name: TABLE customers; Type: ACL; Schema: sales; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE sales.customers TO erp_user;


--
-- Name: TABLE leads; Type: ACL; Schema: sales; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE sales.leads TO erp_user;


--
-- Name: TABLE opportunities; Type: ACL; Schema: sales; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE sales.opportunities TO erp_user;


--
-- Name: TABLE orders; Type: ACL; Schema: sales; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE sales.orders TO erp_user;


--
-- Name: TABLE payments; Type: ACL; Schema: sales; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE sales.payments TO erp_user;


--
-- Name: TABLE quotation; Type: ACL; Schema: sales; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE sales.quotation TO erp_user;


--
-- Name: TABLE receipt; Type: ACL; Schema: sales; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE sales.receipt TO erp_user;


--
-- Name: TABLE renewal_warranty; Type: ACL; Schema: sales; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE sales.renewal_warranty TO erp_user;


--
-- Name: TABLE sales_costing; Type: ACL; Schema: sales; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE sales.sales_costing TO erp_user;


--
-- Name: TABLE sales_invoices; Type: ACL; Schema: sales; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE sales.sales_invoices TO erp_user;


--
-- Name: TABLE shipping_details; Type: ACL; Schema: sales; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE sales.shipping_details TO erp_user;


--
-- Name: TABLE statement; Type: ACL; Schema: sales; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE sales.statement TO erp_user;


--
-- Name: TABLE statement_item; Type: ACL; Schema: sales; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE sales.statement_item TO erp_user;


--
-- Name: TABLE ticket; Type: ACL; Schema: sales; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE sales.ticket TO erp_user;


--
-- Name: TABLE ticket_convo; Type: ACL; Schema: sales; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE sales.ticket_convo TO erp_user;


--
-- Name: TABLE after_analysis_sched; Type: ACL; Schema: services; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE services.after_analysis_sched TO erp_user;


--
-- Name: TABLE chat_message; Type: ACL; Schema: services; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE services.chat_message TO erp_user;


--
-- Name: TABLE comm_session; Type: ACL; Schema: services; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE services.comm_session TO erp_user;


--
-- Name: TABLE delivery_order; Type: ACL; Schema: services; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE services.delivery_order TO erp_user;


--
-- Name: TABLE renewal_history; Type: ACL; Schema: services; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE services.renewal_history TO erp_user;


--
-- Name: TABLE service_analysis; Type: ACL; Schema: services; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE services.service_analysis TO erp_user;


--
-- Name: TABLE service_billing; Type: ACL; Schema: services; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE services.service_billing TO erp_user;


--
-- Name: TABLE service_call; Type: ACL; Schema: services; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE services.service_call TO erp_user;


--
-- Name: TABLE service_call_history; Type: ACL; Schema: services; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE services.service_call_history TO erp_user;


--
-- Name: TABLE service_contract; Type: ACL; Schema: services; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE services.service_contract TO erp_user;


--
-- Name: TABLE service_cost; Type: ACL; Schema: services; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE services.service_cost TO erp_user;


--
-- Name: TABLE service_order; Type: ACL; Schema: services; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE services.service_order TO erp_user;


--
-- Name: TABLE service_purchase; Type: ACL; Schema: services; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE services.service_purchase TO erp_user;


--
-- Name: TABLE service_report; Type: ACL; Schema: services; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE services.service_report TO erp_user;


--
-- Name: TABLE service_request; Type: ACL; Schema: services; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE services.service_request TO erp_user;


--
-- Name: TABLE service_ticket; Type: ACL; Schema: services; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE services.service_ticket TO erp_user;


--
-- Name: TABLE technician; Type: ACL; Schema: services; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE services.technician TO erp_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: accounting; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA accounting GRANT SELECT,INSERT,UPDATE ON TABLES TO erp_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: admin; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA admin GRANT SELECT,INSERT,UPDATE ON TABLES TO erp_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: distribution; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA distribution GRANT SELECT,INSERT,UPDATE ON TABLES TO erp_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: finance; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA finance GRANT SELECT,INSERT,UPDATE ON TABLES TO erp_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: human_resources; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA human_resources GRANT SELECT,INSERT,UPDATE ON TABLES TO erp_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: inventory; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA inventory GRANT SELECT,INSERT,UPDATE ON TABLES TO erp_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: management; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA management GRANT SELECT,INSERT,UPDATE ON TABLES TO erp_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: mrp; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA mrp GRANT SELECT,INSERT,UPDATE ON TABLES TO erp_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: operations; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA operations GRANT SELECT,INSERT,UPDATE ON TABLES TO erp_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: production; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA production GRANT SELECT,INSERT,UPDATE ON TABLES TO erp_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: project_management; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA project_management GRANT SELECT,INSERT,UPDATE ON TABLES TO erp_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: purchasing; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA purchasing GRANT SELECT,INSERT,UPDATE ON TABLES TO erp_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: sales; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA sales GRANT SELECT,INSERT,UPDATE ON TABLES TO erp_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: services; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA services GRANT SELECT,INSERT,UPDATE ON TABLES TO erp_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: solution_customizing; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA solution_customizing GRANT SELECT,INSERT,UPDATE ON TABLES TO erp_user;


--
-- PostgreSQL database dump complete
--


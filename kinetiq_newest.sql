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
-- Name: adjustment_type_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.adjustment_type_enum AS ENUM (
    'Inbound',
    'Outbound-Distribution',
    'Outbound-Production',
    'Outbound-Deprecated'
);


ALTER TYPE public.adjustment_type_enum OWNER TO postgres;

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
    'SMS',
    'Referral'
);


ALTER TYPE public.campaign_type_enum OWNER TO postgres;

--
-- Name: completion_status_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.completion_status_enum AS ENUM (
    'Open',
    'Partially Delivered',
    'Completed'
);


ALTER TYPE public.completion_status_enum OWNER TO postgres;

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
    'Goods Receipt PO',
    'Goods Issue',
    'Goods Receipt'
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
-- Name: ext_modules; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.ext_modules AS ENUM (
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
    'Services',
    'Solution Customizing'
);


ALTER TYPE public.ext_modules OWNER TO postgres;

--
-- Name: inspection_result; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.inspection_result AS ENUM (
    'Pass',
    'Fail'
);


ALTER TYPE public.inspection_result OWNER TO postgres;

--
-- Name: interest_level_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.interest_level_enum AS ENUM (
    'Low',
    'Medium',
    'High',
    'Very High'
);


ALTER TYPE public.interest_level_enum OWNER TO postgres;

--
-- Name: internal_external_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.internal_external_type AS ENUM (
    'Internal Delivery',
    'External Delivery'
);


ALTER TYPE public.internal_external_type OWNER TO postgres;

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
-- Name: inventory_status_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.inventory_status_enum AS ENUM (
    'Pending',
    'Approved'
);


ALTER TYPE public.inventory_status_enum OWNER TO postgres;

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
-- Name: manage_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.manage_type AS ENUM (
    'None',
    'Serial Number',
    'Batches'
);


ALTER TYPE public.manage_type OWNER TO postgres;

--
-- Name: management_approval_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.management_approval_status AS ENUM (
    'approved',
    'pending',
    'rejected'
);


ALTER TYPE public.management_approval_status OWNER TO postgres;

--
-- Name: notifications_status_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.notifications_status_enum AS ENUM (
    'Read',
    'Unread',
    'Archived'
);


ALTER TYPE public.notifications_status_enum OWNER TO postgres;

--
-- Name: operations_status_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.operations_status_enum AS ENUM (
    'Open',
    'Closed',
    'Cancelled',
    'Draft'
);


ALTER TYPE public.operations_status_enum OWNER TO postgres;

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
    'Non-Project-Based',
    'Project-Based',
    'Service'
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
    'Unpaid',
    'Partially Paid',
    'Fully Paid'
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
-- Name: project_status_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.project_status_enum AS ENUM (
    'Approved',
    'Pending',
    'Rejected',
    'In Progress',
    'Completed'
);


ALTER TYPE public.project_status_enum OWNER TO postgres;

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
    'Expired'
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
-- Name: receiving_module_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.receiving_module_enum AS ENUM (
    'Inventory',
    'Production'
);


ALTER TYPE public.receiving_module_enum OWNER TO postgres;

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
-- Name: report_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.report_type AS ENUM (
    'Sales Order',
    'Resource Availability',
    'Bill of Material',
    'Information',
    'Progress Report',
    'Project Details'
);


ALTER TYPE public.report_type OWNER TO postgres;

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
-- Name: return_action; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.return_action AS ENUM (
    'Credit',
    'Repair',
    'Replace',
    'Return',
    'Define New'
);


ALTER TYPE public.return_action OWNER TO postgres;

--
-- Name: return_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.return_status AS ENUM (
    'Success',
    'Failed',
    'Pending'
);


ALTER TYPE public.return_status OWNER TO postgres;

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
-- Name: rework_types_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.rework_types_type AS ENUM (
    'Rejection',
    'Failed Shipment'
);


ALTER TYPE public.rework_types_type OWNER TO postgres;

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
-- Name: single_payment_status_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.single_payment_status_enum AS ENUM (
    'Pending',
    'Completed',
    'Failed'
);


ALTER TYPE public.single_payment_status_enum OWNER TO postgres;

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
-- Name: generate_entry_line_id(); Type: FUNCTION; Schema: accounting; Owner: postgres
--

CREATE FUNCTION accounting.generate_entry_line_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'JEL'; 
    module_name TEXT := 'ACC';          
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
    module_name TEXT := 'ACC';          
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
    module_name TEXT := 'ACC';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.journal_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION accounting.generate_journal_id() OWNER TO postgres;

--
-- Name: generate_or_id(); Type: FUNCTION; Schema: accounting; Owner: postgres
--

CREATE FUNCTION accounting.generate_or_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'OFR'; 
    module_name TEXT := 'ACC';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.or_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION accounting.generate_or_id() OWNER TO postgres;

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
-- Name: generate_currency_id(); Type: FUNCTION; Schema: admin; Owner: postgres
--

CREATE FUNCTION admin.generate_currency_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'CUR'; 
    module_name TEXT := 'ADMIN';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.currency_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION admin.generate_currency_id() OWNER TO postgres;

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
-- Name: sync_item_master_data(); Type: FUNCTION; Schema: admin; Owner: postgres
--

CREATE FUNCTION admin.sync_item_master_data() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF TG_TABLE_NAME = 'assets' THEN
        INSERT INTO admin.item_master_data (asset_id, item_type, item_name, manage_item_by)
        VALUES (NEW.asset_id, 'Asset', NEW.asset_name, 'Serial Number');

    ELSIF TG_TABLE_NAME = 'products' THEN
        INSERT INTO admin.item_master_data (product_id, item_type, item_name, unit_of_measure, manage_item_by, item_status)
        VALUES (NEW.product_id, 'Product', NEW.product_name, NEW.unit_of_measure, 'Batches', NEW.item_status);

    ELSIF TG_TABLE_NAME = 'raw_materials' THEN
        INSERT INTO admin.item_master_data (material_id, item_type, item_name, unit_of_measure, manage_item_by, preferred_vendor, purchasing_uom)
        VALUES (NEW.material_id, 'Raw Material', NEW.material_name, NEW.unit_of_measure, 'None', NEW.vendor_code, NEW.unit_of_measure);
    END IF;
    
    RETURN NEW;
END;
$$;


ALTER FUNCTION admin.sync_item_master_data() OWNER TO postgres;

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
    NEW.billing_receipt_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
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
-- Name: generate_del_order_id(); Type: FUNCTION; Schema: distribution; Owner: postgres
--

CREATE FUNCTION distribution.generate_del_order_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'DO'; 
    module_name TEXT := 'DIS';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.del_order_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION distribution.generate_del_order_id() OWNER TO postgres;

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
-- Name: generate_goods_issue_id(); Type: FUNCTION; Schema: distribution; Owner: postgres
--

CREATE FUNCTION distribution.generate_goods_issue_id() RETURNS trigger
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


ALTER FUNCTION distribution.generate_goods_issue_id() OWNER TO postgres;

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
    NEW.picking_list_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
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
-- Name: generate_shipment_details_id(); Type: FUNCTION; Schema: distribution; Owner: postgres
--

CREATE FUNCTION distribution.generate_shipment_details_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'SD'; 
    module_name TEXT := 'DIS';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.shipment_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION distribution.generate_shipment_details_id() OWNER TO postgres;

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
-- Name: generate_budget_approvals_id(); Type: FUNCTION; Schema: finance; Owner: postgres
--

CREATE FUNCTION finance.generate_budget_approvals_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'BUA'; 
    module_name TEXT := 'FNC';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.budget_approvals_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION finance.generate_budget_approvals_id() OWNER TO postgres;

--
-- Name: generate_validation_id(); Type: FUNCTION; Schema: finance; Owner: postgres
--

CREATE FUNCTION finance.generate_validation_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'BVA'; 
    module_name TEXT := 'FNC';          
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
    module_prefix TEXT := 'IIPD'; 
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
-- Name: generate_approval_id(); Type: FUNCTION; Schema: management; Owner: postgres
--

CREATE FUNCTION management.generate_approval_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'APP'; 
    module_name TEXT := 'MNG';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.approval_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION management.generate_approval_id() OWNER TO postgres;

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
-- Name: generate_asset_serial(); Type: FUNCTION; Schema: operations; Owner: postgres
--

CREATE FUNCTION operations.generate_asset_serial() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN

    NEW.serial_no := 'KNTP' || LPAD(nextval('operations.asset_serial_seq')::TEXT, 4, '0');
    RETURN NEW;
END;
$$;


ALTER FUNCTION operations.generate_asset_serial() OWNER TO postgres;

--
-- Name: generate_batch_number(); Type: FUNCTION; Schema: operations; Owner: postgres
--

CREATE FUNCTION operations.generate_batch_number() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    batch_date TEXT;
    batch_count TEXT;
BEGIN
    batch_date := to_char(CURRENT_DATE, 'YYYYMMDD');
    batch_count := LPAD(nextval('operations.batch_number_seq')::TEXT, 4, '0');
    NEW.batch_no := 'BN' || batch_date || '-' || batch_count;

    RETURN NEW;
END;
$$;


ALTER FUNCTION operations.generate_batch_number() OWNER TO postgres;

--
-- Name: generate_content_id(); Type: FUNCTION; Schema: operations; Owner: postgres
--

CREATE FUNCTION operations.generate_content_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'DOI'; 
    module_name TEXT := 'OPS';          
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
    module_name TEXT := 'OPS';          
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
    module_name TEXT := 'OPS';          
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
    module_name TEXT := 'OPS';          
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
    module_name TEXT := 'OPS';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.serial_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION operations.generate_serial_id() OWNER TO postgres;

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
-- Name: calculate_product_pricing(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.calculate_product_pricing() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    base_price DECIMAL(10, 2); 
BEGIN
    -- Retrieve the quotation type directly
    SELECT selling_price INTO base_price FROM admin.products WHERE product_id = NEW.admin_product_id;
    NEW.selling_price := ROUND(base_price * (1 + (NEW.markup_percentage / 100)), 2);
    IF TG_OP = 'UPDATE' AND NEW.demand_level <> OLD.demand_level THEN
	NEW.markup_percentage := CASE
	WHEN NEW.demand_level = 'Very High'::demand_level_enum THEN 100.00
	WHEN NEW.demand_level = 'High'::demand_level_enum THEN 80.00
	WHEN NEW.demand_level = 'Medium'::demand_level_enum THEN 60.00
	WHEN NEW.demand_level = 'Low'::demand_level_enum THEN 20.00
	ELSE 20.00
	END;
    END IF;
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.calculate_product_pricing() OWNER TO postgres;

--
-- Name: create_product_pricing(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.create_product_pricing() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO sales.product_pricing (admin_product_id) VALUES (NEW.product_id);
	RETURN NEW;
END;
$$;


ALTER FUNCTION public.create_product_pricing() OWNER TO postgres;

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
-- Name: generate_notifications_id(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.generate_notifications_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'EPR'; 
    module_name TEXT := UPPER(LEFT('project_management', 4));          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.notifications_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;

    RETURN NEW;
END;
$$;


ALTER FUNCTION public.generate_notifications_id() OWNER TO postgres;

--
-- Name: generate_product_pricing_id(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.generate_product_pricing_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'PRDP'; 
    module_name TEXT := UPPER(LEFT('sales', 4));          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.product_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;

    RETURN NEW;
END;
$$;


ALTER FUNCTION public.generate_product_pricing_id() OWNER TO postgres;

--
-- Name: generate_report_monitoring_id(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.generate_report_monitoring_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'RPM'; 
    module_name TEXT := UPPER(LEFT('project_management', 4));          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.report_monitoring_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;

    RETURN NEW;
END;
$$;


ALTER FUNCTION public.generate_report_monitoring_id() OWNER TO postgres;

--
-- Name: insert_order_based_on_type(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.insert_order_based_on_type() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    order_type order_type_enum; 
    ext_id VARCHAR(255);
BEGIN
    -- Retrieve the quotation type directly
    SELECT o.order_type INTO order_type
    FROM sales.orders o;
    

    -- Insert into the correct table based on quotation type
    IF order_type = 'Non-Project-Based'::order_type_enum THEN
        INSERT INTO mrp.non_project_order_pricing (non_project_costing_id, order_id, product_id, quantity, mrp_base_price, final_price)
        VALUES (NEW.order_id, NEW.order_id, NULL, 0, 0.00, 0.00);
    
    ELSIF order_type = 'Project-Based'::order_type_enum THEN
        INSERT INTO project_management.external_project_request (ext_project_request_id, ext_project_name, ext_project_description, approval_id, item_id)
        VALUES (NEW.order_id, 'Project for Order ' || NEW.order_id, 'Automatically generated project request', NULL, NEW.order_id) RETURNING ext_project_request_id INTO ext_id;

        UPDATE sales.orders SET ext_project_request_id = ext_id WHERE order_id = NEW.order_id;
    END IF;
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.insert_order_based_on_type() OWNER TO postgres;

--
-- Name: update_demand_level(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.update_demand_level() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- Compute total quantity sold per product and rank using NTILE
    WITH demand_ranking AS (
        SELECT product_id,
               SUM(quantity) AS total_quantity,
               NTILE(10) OVER (ORDER BY SUM(quantity) DESC) AS demand_rank
        FROM sales.statement_item
        GROUP BY product_id
    ),
    recent_sales AS (
        SELECT product_id,
               SUM(quantity) AS recent_quantity
        FROM sales.statement_item
        WHERE created_at >= NOW() - INTERVAL '60 days'
        GROUP BY product_id
    ),
    total_sales AS (
        SELECT product_id, SUM(quantity) AS total_quantity
        FROM sales.statement_item
        GROUP BY product_id
    )
    UPDATE sales.product_pricing pp
    SET demand_level = CASE
        WHEN dr.demand_rank <= 1 THEN 'Very High'::demand_level_enum
        WHEN dr.demand_rank <= 3 THEN 'High'::demand_level_enum
        WHEN dr.demand_rank BETWEEN 4 AND 7 THEN 'Medium'::demand_level_enum
        WHEN dr.demand_rank BETWEEN 8 AND 10 THEN 'Low'::demand_level_enum
        WHEN rs.recent_quantity >= 0.9 * ts.total_quantity THEN 'Seasonal'::demand_level_enum
    END
    FROM demand_ranking dr
    LEFT JOIN recent_sales rs ON dr.product_id = rs.product_id
    LEFT JOIN total_sales ts ON dr.product_id = ts.product_id
    WHERE pp.product_id = dr.product_id;

    RETURN NULL;
END;
$$;


ALTER FUNCTION public.update_demand_level() OWNER TO postgres;

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
-- Name: create_business_partner(); Type: FUNCTION; Schema: sales; Owner: postgres
--

CREATE FUNCTION sales.create_business_partner() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    new_partner_id VARCHAR(255);
BEGIN
    INSERT INTO admin.business_partner_master (customer_id, partner_name, category, contact_info)
    VALUES (NEW.customer_id, NEW.name, 'Customer', NEW.phone_number)
    RETURNING partner_id INTO new_partner_id;
	
    UPDATE sales.customers SET partner_id = new_partner_id
    WHERE  customer_id = NEW.customer_id;
    RETURN NEW;
END;
$$;


ALTER FUNCTION sales.create_business_partner() OWNER TO postgres;

--
-- Name: create_gl_account(); Type: FUNCTION; Schema: sales; Owner: postgres
--

CREATE FUNCTION sales.create_gl_account() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    new_gl_account_id VARCHAR (255);
BEGIN
    INSERT INTO accounting.general_ledger_accounts (account_id, account_name, account_code, status)
    VALUES (NEW.customer_id, NEW.name, 'ACC-COA-2025-CA1030', 'Active')
    RETURNING gl_account_id INTO new_gl_account_id;
    
    UPDATE sales.customers SET gl_account_id = new_gl_account_id WHERE customer_id = NEW.customer_id;
    RETURN NEW;
END;
$$;


ALTER FUNCTION sales.create_gl_account() OWNER TO postgres;

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
-- Name: generate_credit_memo_id(); Type: FUNCTION; Schema: sales; Owner: postgres
--

CREATE FUNCTION sales.generate_credit_memo_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'CM';  
    module_name TEXT := 'SALES'; 
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.credit_memo_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION sales.generate_credit_memo_id() OWNER TO postgres;

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
-- Name: generate_delivery_note_id(); Type: FUNCTION; Schema: sales; Owner: postgres
--

CREATE FUNCTION sales.generate_delivery_note_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'SHIP'; 
    module_name TEXT := 'SALES';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.delivery_note_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION sales.generate_delivery_note_id() OWNER TO postgres;

--
-- Name: generate_invoice(); Type: FUNCTION; Schema: sales; Owner: postgres
--

CREATE FUNCTION sales.generate_invoice() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 
  amount DECIMAL(10, 2);
BEGIN 
    SELECT total_amount INTO amount FROM sales.statement WHERE statement_id = NEW.statement_id;
    INSERT INTO sales.sales_invoices(delivery_note_id, total_amount)
    VALUES (NEW.delivery_note_id, amount);
    RETURN NEW;
END;
$$;


ALTER FUNCTION sales.generate_invoice() OWNER TO postgres;

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
-- Name: generate_return_id(); Type: FUNCTION; Schema: sales; Owner: postgres
--

CREATE FUNCTION sales.generate_return_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'RTN'; 
    module_name TEXT := 'SALES';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.return_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION sales.generate_return_id() OWNER TO postgres;

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
-- Name: update_order_delivery(); Type: FUNCTION; Schema: sales; Owner: postgres
--

CREATE FUNCTION sales.update_order_delivery() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 
   qty_delivered INT;
   tracking_no VARCHAR(255);
   shipped_date TIMESTAMP;
   est_delivery TIMESTAMP;
   shipping_cost DECIMAL(10,2);
BEGIN
   IF OLD.goods_issue_id IS NULL AND NEW.goods_issue_id IS NOT NULL THEN
       SELECT si.quantity INTO qty_delivered 
        FROM sales.statement_item si 
        INNER JOIN sales.statement s on s.statement_id = si.statement_id 
        WHERE s.statement_id = NEW.statement_id;
       
       UPDATE sales.statement_item si 
       SET quantity_delivered = si.quantity_delivered + qty_delivered 
       FROM sales.statement s
       WHERE s.statement_id = si.statement_id AND s.statement_id = NEW.statement_id;
       
       UPDATE sales.delivery_note SET delivery_status = 'Delivered'::delivery_status_enum WHERE delivery_note_id = NEW.delivery_note_id;
   ELSIF OLD.rework_id IS NULL AND NEW.rework_id IS NOT NULL THEN 
        UPDATE sales.delivery_note SET delivery_status = 'Failed'::delivery_status_enum WHERE delivery_note_id = NEW.delivery_note_id;
        -- DO SOMETHING SA INVOICE IF FAILED DELIVERY ?
   ELSIF OLD.shipment_id IS NULL AND NEW.shipment_id is NOT NULL THEN 
       SELECT sd.tracking_number, sd.shipment_date, sd.estimated_arrival_date, sc.total_shipping_cost INTO 
       tracking_no, shipped_date, est_delivery, shipping_cost 
        FROM distribution.shipment_details sd 
        INNER JOIN distribution.shipping_cost sc ON sd.shipping_cost_id = sc.shipping_cost_id 
        WHERE sd.shipment_id = NEW.shipment_id;
       
       UPDATE sales.delivery_note SET delivery_status = 'Shipped'::delivery_status_enum, tracking_num = tracking_no, shipping_date = shipped_date, estimated_delivery = est_delivery 
        WHERE delivery_note_id = NEW.delivery_note_id;
       
       UPDATE sales.sales_invoices SET total_amount = COALESCE(total_amount, 0) + shipping_cost 
        WHERE delivery_note_id = NEW.delivery_note_id;

   END IF;
   RETURN NEW;
END;
$$;


ALTER FUNCTION sales.update_order_delivery() OWNER TO postgres;

--
-- Name: generate_additional_service_id(); Type: FUNCTION; Schema: services; Owner: postgres
--

CREATE FUNCTION services.generate_additional_service_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'ADDSER'; 
    module_name TEXT := 'SERVICES';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.additional_service_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION services.generate_additional_service_id() OWNER TO postgres;

--
-- Name: generate_additional_service_type_id(); Type: FUNCTION; Schema: services; Owner: postgres
--

CREATE FUNCTION services.generate_additional_service_type_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'ADDSERTYPE'; 
    module_name TEXT := 'SERVICES';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.additional_service_type_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION services.generate_additional_service_type_id() OWNER TO postgres;

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
-- Name: generate_service_contract_id(); Type: FUNCTION; Schema: services; Owner: postgres
--

CREATE FUNCTION services.generate_service_contract_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'SERCON'; 
    module_name TEXT := 'SERVICES';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.contract_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION services.generate_service_contract_id() OWNER TO postgres;

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
-- Name: generate_service_order_item_id(); Type: FUNCTION; Schema: services; Owner: postgres
--

CREATE FUNCTION services.generate_service_order_item_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'SOIT'; 
    module_name TEXT := 'SERVICES';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.service_order_item_id := module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION services.generate_service_order_item_id() OWNER TO postgres;

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
-- Name: generate_technician_id(); Type: FUNCTION; Schema: services; Owner: postgres
--

CREATE FUNCTION services.generate_technician_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'TECH';
    module_name TEXT := 'SERVICES';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.technician_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION services.generate_technician_id() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: chart_of_accounts; Type: TABLE; Schema: accounting; Owner: postgres
--

CREATE TABLE accounting.chart_of_accounts (
    account_code character varying(255) NOT NULL,
    account_name character varying(255) NOT NULL,
    account_type character varying(50) DEFAULT NULL::character varying
);


ALTER TABLE accounting.chart_of_accounts OWNER TO postgres;

--
-- Name: general_ledger_accounts; Type: TABLE; Schema: accounting; Owner: postgres
--

CREATE TABLE accounting.general_ledger_accounts (
    gl_account_id character varying(255) NOT NULL,
    account_name character varying(255) NOT NULL,
    account_code character varying(255) NOT NULL,
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
    currency_id character varying(255)
);


ALTER TABLE accounting.journal_entries OWNER TO postgres;

--
-- Name: journal_entry_lines; Type: TABLE; Schema: accounting; Owner: postgres
--

CREATE TABLE accounting.journal_entry_lines (
    entry_line_id character varying(255) NOT NULL,
    gl_account_id character varying(255) DEFAULT NULL::character varying,
    journal_id character varying(255),
    debit_amount numeric(15,2) NOT NULL,
    credit_amount numeric(15,2) NOT NULL,
    description character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE accounting.journal_entry_lines OWNER TO postgres;

--
-- Name: official_receipts; Type: TABLE; Schema: accounting; Owner: postgres
--

CREATE TABLE accounting.official_receipts (
    or_id character varying(255) NOT NULL,
    invoice_id character varying(255),
    customer_id character varying(255),
    or_date date NOT NULL,
    settled_amount numeric(15,2) NOT NULL,
    remaining_amount numeric(15,2),
    payment_method public.payment_method_enum NOT NULL,
    reference_number character varying(100),
    created_by character varying(255)
);


ALTER TABLE accounting.official_receipts OWNER TO postgres;

--
-- Name: assets; Type: TABLE; Schema: admin; Owner: postgres
--

CREATE TABLE admin.assets (
    asset_id character varying(255) NOT NULL,
    asset_name character varying(255) NOT NULL,
    purchase_date date DEFAULT now(),
    purchase_price numeric DEFAULT 0 NOT NULL,
    serial_no character varying(225),
    content_id character varying(255)
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
    ip_address character varying(255)
);


ALTER TABLE admin.audit_log OWNER TO postgres;

--
-- Name: business_partner_master; Type: TABLE; Schema: admin; Owner: postgres
--

CREATE TABLE admin.business_partner_master (
    partner_id character varying(255) NOT NULL,
    employee_id character varying(255),
    vendor_code character varying(255),
    customer_id character varying(255),
    partner_name character varying(255) NOT NULL,
    category public.partner_category DEFAULT 'Employee'::public.partner_category,
    contact_info character varying(255)
);


ALTER TABLE admin.business_partner_master OWNER TO postgres;

--
-- Name: currency; Type: TABLE; Schema: admin; Owner: postgres
--

CREATE TABLE admin.currency (
    currency_id character varying(255) NOT NULL,
    currency_name character varying(255) NOT NULL,
    exchange_rate numeric(15,6) NOT NULL,
    valid_from date NOT NULL,
    valid_to date
);


ALTER TABLE admin.currency OWNER TO postgres;

--
-- Name: item_master_data; Type: TABLE; Schema: admin; Owner: postgres
--

CREATE TABLE admin.item_master_data (
    item_id character varying(255) NOT NULL,
    asset_id character varying(255),
    product_id character varying(255),
    material_id character varying(255),
    item_name character varying(255) NOT NULL,
    item_type public.item_type DEFAULT 'Product'::public.item_type,
    unit_of_measure public.unit_of_measure,
    item_status public.status_enum DEFAULT 'Active'::public.status_enum,
    manage_item_by public.manage_type DEFAULT 'Batches'::public.manage_type,
    preferred_vendor character varying(255),
    purchasing_uom public.unit_of_measure,
    items_per_purchase_unit integer,
    purchase_quantity_per_package integer,
    sales_uom public.unit_of_measure,
    items_per_sale_unit integer,
    sales_quantity_per_package integer
);


ALTER TABLE admin.item_master_data OWNER TO postgres;

--
-- Name: notifications; Type: TABLE; Schema: admin; Owner: postgres
--

CREATE TABLE admin.notifications (
    notifications_id character varying(255) NOT NULL,
    to_user_id character varying NOT NULL,
    message text NOT NULL,
    notifications_status public.notifications_status_enum NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE admin.notifications OWNER TO postgres;

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
    description text NOT NULL,
    selling_price numeric NOT NULL,
    stock_level integer,
    unit_of_measure public.unit_of_measure DEFAULT 'set'::public.unit_of_measure NOT NULL,
    batch_no character varying(255),
    item_status public.status_enum DEFAULT 'Active'::public.status_enum,
    warranty_period integer DEFAULT 12,
    policy_id character varying(255),
    content_id character varying(255)
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
    cost_per_unit numeric,
    vendor_code character varying(255)
);


ALTER TABLE admin.raw_materials OWNER TO postgres;

--
-- Name: roles_permission; Type: TABLE; Schema: admin; Owner: postgres
--

CREATE TABLE admin.roles_permission (
    role_id character varying(255) NOT NULL,
    role_name character varying(255),
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
    application_reference character varying(255),
    vendor_name character varying(255) NOT NULL,
    contact_person character varying(255),
    status public.user_status DEFAULT 'Active'::public.user_status
);


ALTER TABLE admin.vendor OWNER TO postgres;

--
-- Name: view_customer_users; Type: VIEW; Schema: admin; Owner: postgres
--

CREATE VIEW admin.view_customer_users AS
 SELECT user_id,
    first_name,
    last_name,
    email,
    status,
    created_at,
    updated_at
   FROM admin.users
  WHERE (type = 'Customer'::public.user_type);


ALTER VIEW admin.view_customer_users OWNER TO postgres;

--
-- Name: view_employee_users; Type: VIEW; Schema: admin; Owner: postgres
--

CREATE VIEW admin.view_employee_users AS
 SELECT user_id,
    employee_id,
    first_name,
    last_name,
    email,
    role_id,
    status,
    created_at,
    updated_at
   FROM admin.users
  WHERE (type = 'Employee'::public.user_type);


ALTER VIEW admin.view_employee_users OWNER TO postgres;

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
    service_billing_id character varying(255),
    total_receipt numeric(10,2)
);


ALTER TABLE distribution.billing_receipt OWNER TO postgres;

--
-- Name: carrier; Type: TABLE; Schema: distribution; Owner: postgres
--

CREATE TABLE distribution.carrier (
    carrier_id character varying(255) NOT NULL,
    carrier_name character varying(255),
    service_type public.service_type_enum,
    carrier_count integer
);


ALTER TABLE distribution.carrier OWNER TO postgres;

--
-- Name: delivery_order; Type: TABLE; Schema: distribution; Owner: postgres
--

CREATE TABLE distribution.delivery_order (
    del_order_id character varying(255) NOT NULL,
    order_status public.order_status_type,
    content_id character varying(255),
    is_project_based public.project_based_type,
    is_partial_delivery public.yes_no_type,
    service_order_id character varying(255),
    stock_transfer_id character varying(255),
    sales_order_id character varying(255),
    approval_request_id character varying(255),
    del_type public.internal_external_type
);


ALTER TABLE distribution.delivery_order OWNER TO postgres;

--
-- Name: delivery_receipt; Type: TABLE; Schema: distribution; Owner: postgres
--

CREATE TABLE distribution.delivery_receipt (
    delivery_receipt_id character varying(255) NOT NULL,
    delivery_date date,
    received_by character varying(255),
    signature text,
    receipt_status public.receipt_status_type,
    shipment_id character varying(255),
    total_amount numeric(10,2)
);


ALTER TABLE distribution.delivery_receipt OWNER TO postgres;

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
    issued_by character varying(255),
    billing_receipt_id character varying(255)
);


ALTER TABLE distribution.goods_issue OWNER TO postgres;

--
-- Name: logistics_approval_request; Type: TABLE; Schema: distribution; Owner: postgres
--

CREATE TABLE distribution.logistics_approval_request (
    approval_request_id character varying(255) NOT NULL,
    request_date date DEFAULT CURRENT_DATE,
    approval_status public.approval_status_type,
    approval_date date,
    approved_by character varying(255),
    del_order_id character varying(255)
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
    total_packing_cost numeric(10,2)
);


ALTER TABLE distribution.packing_cost OWNER TO postgres;

--
-- Name: packing_list; Type: TABLE; Schema: distribution; Owner: postgres
--

CREATE TABLE distribution.packing_list (
    packing_list_id character varying(255) NOT NULL,
    packed_by character varying(255),
    packing_status public.packing_status_type,
    packing_type public.packing_type_enum,
    total_items_packed integer,
    packing_cost_id character varying(255),
    picking_list_id character varying(255)
);


ALTER TABLE distribution.packing_list OWNER TO postgres;

--
-- Name: picking_list; Type: TABLE; Schema: distribution; Owner: postgres
--

CREATE TABLE distribution.picking_list (
    picking_list_id character varying(255) NOT NULL,
    warehouse_id character varying(255),
    picked_by character varying(255),
    picked_status public.picked_status_type,
    picked_date date,
    approval_request_id character varying(255)
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
    delivery_receipt_id character varying(255)
);


ALTER TABLE distribution.rejection OWNER TO postgres;

--
-- Name: rework_order; Type: TABLE; Schema: distribution; Owner: postgres
--

CREATE TABLE distribution.rework_order (
    rework_id character varying(255) NOT NULL,
    assigned_to character varying(255),
    rework_status public.rework_status_type,
    rework_date date,
    expected_completion timestamp without time zone,
    rejection_id character varying(255),
    failed_shipment_id character varying(255),
    rework_types public.rework_types_type
);


ALTER TABLE distribution.rework_order OWNER TO postgres;

--
-- Name: shipment_details; Type: TABLE; Schema: distribution; Owner: postgres
--

CREATE TABLE distribution.shipment_details (
    shipment_id character varying(255) NOT NULL,
    carrier_id character varying(255),
    shipment_date date,
    shipment_status public.shipment_status_type,
    tracking_number character varying(100) NOT NULL,
    estimated_arrival_date timestamp without time zone,
    actual_arrival_date timestamp without time zone,
    packing_list_id character varying(255),
    shipping_cost_id character varying(255)
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
    budget_approvals_id character varying(255) NOT NULL,
    validation_id character varying(255),
    approval_status character varying(10) NOT NULL,
    CONSTRAINT budget_approvals_approval_status_check CHECK (((approval_status)::text = ANY ((ARRAY['Approved'::character varying, 'Pending'::character varying])::text[])))
);


ALTER TABLE finance.budget_approvals OWNER TO postgres;

--
-- Name: budget_validations; Type: TABLE; Schema: finance; Owner: postgres
--

CREATE TABLE finance.budget_validations (
    validation_id character varying(255) NOT NULL,
    dept_id character varying(255),
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
    employee_id character varying(255),
    time_in timestamp without time zone,
    time_out timestamp without time zone,
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
    job_id character varying(255),
    first_name character varying(50),
    last_name character varying(50),
    email character varying(100),
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
    employee_id character varying(255),
    immediate_superior_id character varying(255),
    rating integer,
    bonus_percentage numeric(5,2),
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
    employee_id character varying(255),
    base_salary numeric(10,2),
    contract_pay_type character varying(20),
    contract_pay_rate numeric(10,2),
    total_hours_worked numeric(10,2),
    total_contract_pay numeric(10,2),
    effective_date date DEFAULT CURRENT_DATE,
    CONSTRAINT employee_salary_contract_pay_type_check CHECK (((contract_pay_type)::text = ANY ((ARRAY['Hourly'::character varying, 'Daily'::character varying])::text[])))
);


ALTER TABLE human_resources.employee_salary OWNER TO postgres;

--
-- Name: employees; Type: TABLE; Schema: human_resources; Owner: postgres
--

CREATE TABLE human_resources.employees (
    employee_id character varying(255) NOT NULL,
    dept_id character varying(255),
    first_name character varying(50),
    last_name character varying(50),
    email character varying(100),
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
    candidate_id character varying(255),
    interviewer_id character varying(255),
    interview_date timestamp without time zone,
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
    request_id character varying(255),
    dept_id character varying(255),
    "position" character varying(100),
    description text,
    requirements text,
    employment_type character varying(20) NOT NULL,
    contract_duration smallint,
    contract_rate numeric(10,2),
    contract_pay_type character varying(20),
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
    employee_id character varying(255),
    dept_id character varying(255),
    immediate_superior_id character varying(255),
    management_approval_id character varying(255),
    leave_type character varying(20) NOT NULL,
    start_date date,
    end_date date,
    total_days integer GENERATED ALWAYS AS (((end_date - start_date) + 1)) STORED,
    is_paid boolean DEFAULT true,
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
    employee_id character varying(255),
    employment_type character varying(20) DEFAULT 'Permanent'::character varying NOT NULL,
    base_salary numeric(10,2),
    work_days integer,
    contract_pay_type character varying(20),
    contract_pay_rate numeric(10,2),
    total_hours_worked numeric(10,2),
    total_contract_pay numeric(10,2) DEFAULT 0,
    overtime_hours numeric(5,2) DEFAULT 0,
    overtime_pay numeric(10,2) DEFAULT 0,
    undertime_hours numeric(5,2) DEFAULT 0,
    undertime_deductions numeric(10,2) DEFAULT 0,
    unpaid_leave_days integer DEFAULT 0,
    leave_deductions numeric(10,2) DEFAULT 0,
    taxable_income numeric(10,2) DEFAULT 0,
    tax numeric(10,2) DEFAULT 0,
    sss_deduction numeric(10,2) DEFAULT 0,
    philhealth_deduction numeric(10,2) DEFAULT 0,
    pagibig_deduction numeric(10,2) DEFAULT 0,
    thirteenth_month_pay numeric(10,2) DEFAULT 0,
    performance_bonus numeric(10,2) DEFAULT 0,
    net_salary numeric(10,2) DEFAULT 0,
    payment_date date DEFAULT CURRENT_DATE,
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
    requesting_dept_id character varying(255),
    employee_id character varying(255),
    current_dept_id character varying(255),
    reason text,
    approval_status character varying(20) DEFAULT 'Pending'::character varying,
    status character varying(20) DEFAULT 'Active'::character varying,
    start_date date,
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
    content_id character varying(255),
    reported_date timestamp without time zone NOT NULL,
    status public.inventory_status_enum NOT NULL,
    employee_id character varying(255)
);


ALTER TABLE inventory.deprecation_report OWNER TO postgres;

--
-- Name: inventory_adjustments; Type: TABLE; Schema: inventory; Owner: postgres
--

CREATE TABLE inventory.inventory_adjustments (
    adjustment_id character varying(255) NOT NULL,
    item_id character varying(255),
    adjustment_type public.adjustment_type_enum NOT NULL,
    quantity integer NOT NULL,
    adjustment_date timestamp without time zone NOT NULL,
    employee_id character varying(255)
);


ALTER TABLE inventory.inventory_adjustments OWNER TO postgres;

--
-- Name: inventory_cyclic_counts; Type: TABLE; Schema: inventory; Owner: postgres
--

CREATE TABLE inventory.inventory_cyclic_counts (
    inventory_count_id character varying(255) NOT NULL,
    item_md_id integer NOT NULL,
    item_onhand integer NOT NULL,
    item_actually_counted integer NOT NULL,
    difference_in_qty integer NOT NULL,
    employee_id character varying(255),
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
    item_id character varying(255),
    minimum_threshold integer NOT NULL,
    maximum_threshold integer NOT NULL,
    total_stock integer NOT NULL,
    available_stock integer NOT NULL,
    last_update timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE inventory.inventory_item OWNER TO postgres;

--
-- Name: inventory_product_data; Type: TABLE; Schema: inventory; Owner: postgres
--

CREATE TABLE inventory.inventory_product_data (
    item_md_id character varying(255) NOT NULL,
    inventory_item_id character varying(255),
    stock_on_order integer NOT NULL,
    stock_committed integer NOT NULL
);


ALTER TABLE inventory.inventory_product_data OWNER TO postgres;

--
-- Name: warehouse_movement; Type: TABLE; Schema: inventory; Owner: postgres
--

CREATE TABLE inventory.warehouse_movement (
    movement_id character varying(255) NOT NULL,
    item_id character varying(255),
    movement_type text NOT NULL,
    quantity integer NOT NULL,
    movement_date timestamp without time zone NOT NULL,
    destination character varying(255),
    source character varying(255),
    reference_id_purchase_order character varying(255),
    reference_id_order character varying(255)
);


ALTER TABLE inventory.warehouse_movement OWNER TO postgres;

--
-- Name: management_approvals; Type: TABLE; Schema: management; Owner: postgres
--

CREATE TABLE management.management_approvals (
    approval_id character varying(255) NOT NULL,
    request_id character varying(255),
    external_id character varying(255),
    decision_date date,
    issue_date date,
    checked_by character varying(255),
    checked_date date DEFAULT CURRENT_DATE,
    status public.management_approval_status,
    due_date date,
    remarks text
);


ALTER TABLE management.management_approvals OWNER TO postgres;

--
-- Name: bill_of_materials; Type: TABLE; Schema: mrp; Owner: postgres
--

CREATE TABLE mrp.bill_of_materials (
    bom_id character varying(255) NOT NULL,
    product_id character varying(255),
    quantity_of_product integer,
    material_id character varying(255),
    quantity_of_material integer,
    unit_of_measure public.unit_of_measure,
    product_description text,
    specific_notes text,
    production_order_detail_id character varying(255),
    cost_per_raw_material numeric(10,2),
    total_cost_of_raw_materials numeric(10,2),
    labor_cost numeric(10,2),
    total_cost numeric(10,2)
);


ALTER TABLE mrp.bill_of_materials OWNER TO postgres;

--
-- Name: non_project_order_pricing; Type: TABLE; Schema: mrp; Owner: postgres
--

CREATE TABLE mrp.non_project_order_pricing (
    non_project_costing_id character varying(255) NOT NULL,
    order_id character varying(255),
    product_id character varying(255),
    quantity integer NOT NULL,
    mrp_base_price numeric(10,2),
    final_price numeric(10,2)
);


ALTER TABLE mrp.non_project_order_pricing OWNER TO postgres;

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
    pricing_date date
);


ALTER TABLE mrp.principal_items OWNER TO postgres;

--
-- Name: asset_serial_seq; Type: SEQUENCE; Schema: operations; Owner: postgres
--

CREATE SEQUENCE operations.asset_serial_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE operations.asset_serial_seq OWNER TO postgres;

--
-- Name: batch_number_seq; Type: SEQUENCE; Schema: operations; Owner: postgres
--

CREATE SEQUENCE operations.batch_number_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE operations.batch_number_seq OWNER TO postgres;

--
-- Name: document_header; Type: TABLE; Schema: operations; Owner: postgres
--

CREATE TABLE operations.document_header (
    document_id character varying(255) NOT NULL,
    document_type public.document_type_enum NOT NULL,
    vendor_code character varying(255),
    document_no integer NOT NULL,
    transaction_id character varying(255) NOT NULL,
    content_id character varying(255),
    status public.operations_status_enum NOT NULL,
    posting_date date NOT NULL,
    delivery_date date,
    document_date date NOT NULL,
    buyer character varying(255) NOT NULL,
    employee_id character varying(255),
    initial_amount numeric(18,2) NOT NULL,
    discount_rate numeric(5,2),
    discount_amount numeric(18,2),
    freight numeric(18,2) NOT NULL,
    tax_rate numeric(5,2) NOT NULL,
    tax_amount numeric(18,2) NOT NULL,
    transaction_cost numeric(18,2)
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
    delivery_request_id character varying(255),
    request_date date,
    quantity integer DEFAULT 0 NOT NULL,
    total numeric(18,2),
    batch_no character varying(100),
    warehouse_id character varying(255),
    cost numeric(18,2),
    delivery_type public.request_type,
    receiving_module public.receiving_module_enum,
    status public.approval_status_type DEFAULT 'Pending'::public.approval_status_type
);


ALTER TABLE operations.document_items OWNER TO postgres;

--
-- Name: external_module; Type: TABLE; Schema: operations; Owner: postgres
--

CREATE TABLE operations.external_module (
    external_id character varying(255) NOT NULL,
    content_id character varying(255),
    purchase_id character varying(255),
    request_id character varying(255),
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
    deprecation_report_id character varying(255)
);


ALTER TABLE operations.external_module OWNER TO postgres;

--
-- Name: product_document_items; Type: TABLE; Schema: operations; Owner: postgres
--

CREATE TABLE operations.product_document_items (
    productdocu_id character varying(255) NOT NULL,
    product_id character varying(255),
    quantity_rejected integer DEFAULT 0 NOT NULL,
    defect_type character varying(155) NOT NULL,
    manuf_date date NOT NULL,
    expiry_date date NOT NULL,
    content_id character varying(255)
);


ALTER TABLE operations.product_document_items OWNER TO postgres;

--
-- Name: serial_tracking; Type: TABLE; Schema: operations; Owner: postgres
--

CREATE TABLE operations.serial_tracking (
    serial_id character varying(255) NOT NULL,
    document_id character varying(255),
    serial_no character varying(50)
);


ALTER TABLE operations.serial_tracking OWNER TO postgres;

--
-- Name: equipment; Type: TABLE; Schema: production; Owner: postgres
--

CREATE TABLE production.equipment (
    equipment_id character varying(255) NOT NULL,
    equipment_name character varying(255) NOT NULL,
    description text,
    availability_status public.availability_status DEFAULT 'Available'::public.availability_status,
    last_maintenance_date date DEFAULT now(),
    equipment_cost numeric(10,2) NOT NULL
);


ALTER TABLE production.equipment OWNER TO postgres;

--
-- Name: labor; Type: TABLE; Schema: production; Owner: postgres
--

CREATE TABLE production.labor (
    labor_id character varying(255) NOT NULL,
    production_order_id character varying(255),
    employee_id character varying(255),
    date_worked timestamp without time zone DEFAULT now(),
    hours_worked integer NOT NULL
);


ALTER TABLE production.labor OWNER TO postgres;

--
-- Name: production_orders_details; Type: TABLE; Schema: production; Owner: postgres
--

CREATE TABLE production.production_orders_details (
    production_order_detail_id character varying(255) NOT NULL,
    production_order_id character varying(255),
    actual_quantity integer NOT NULL,
    cost_of_production numeric(10,2) NOT NULL,
    miscellaneous_costs numeric(10,2) NOT NULL,
    equipment_id character varying(255),
    rework_required boolean NOT NULL,
    rework_notes text,
    productdocu_id character varying(255)
);


ALTER TABLE production.production_orders_details OWNER TO postgres;

--
-- Name: production_orders_header; Type: TABLE; Schema: production; Owner: postgres
--

CREATE TABLE production.production_orders_header (
    production_order_id character varying(255) NOT NULL,
    task_id character varying(255),
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
    intrnl_project_id character varying(255),
    job_title character varying(50) NOT NULL,
    job_description text,
    required_position character varying(50) NOT NULL,
    employment_type public.employment_type NOT NULL,
    dept_id character varying(255)
);


ALTER TABLE project_management.contractual_worker_request OWNER TO postgres;

--
-- Name: external_project_cost_management; Type: TABLE; Schema: project_management; Owner: postgres
--

CREATE TABLE project_management.external_project_cost_management (
    project_resources_id character varying(255) NOT NULL,
    project_id character varying(255),
    bom_id character varying(255),
    project_budget_approval public.project_budget_approval NOT NULL
);


ALTER TABLE project_management.external_project_cost_management OWNER TO postgres;

--
-- Name: external_project_details; Type: TABLE; Schema: project_management; Owner: postgres
--

CREATE TABLE project_management.external_project_details (
    project_id character varying(255) NOT NULL,
    ext_project_request_id character varying(255),
    project_status public.project_status NOT NULL
);


ALTER TABLE project_management.external_project_details OWNER TO postgres;

--
-- Name: external_project_labor; Type: TABLE; Schema: project_management; Owner: postgres
--

CREATE TABLE project_management.external_project_labor (
    project_labor_id character varying(255) NOT NULL,
    project_id character varying(255),
    employee_id character varying(255)
);


ALTER TABLE project_management.external_project_labor OWNER TO postgres;

--
-- Name: external_project_request; Type: TABLE; Schema: project_management; Owner: postgres
--

CREATE TABLE project_management.external_project_request (
    ext_project_request_id character varying(255) NOT NULL,
    ext_project_name character varying(50),
    ext_project_description text,
    approval_id character varying(255),
    item_id character varying(255)
);


ALTER TABLE project_management.external_project_request OWNER TO postgres;

--
-- Name: external_project_task_list; Type: TABLE; Schema: project_management; Owner: postgres
--

CREATE TABLE project_management.external_project_task_list (
    task_id character varying(255) NOT NULL,
    project_id character varying(255),
    task_description text,
    task_status public.task_status NOT NULL,
    task_deadline date NOT NULL,
    project_labor_id character varying(255)
);


ALTER TABLE project_management.external_project_task_list OWNER TO postgres;

--
-- Name: external_project_tracking; Type: TABLE; Schema: project_management; Owner: postgres
--

CREATE TABLE project_management.external_project_tracking (
    project_tracking_id character varying(255) NOT NULL,
    project_id character varying(255),
    project_milestone public.project_milestone NOT NULL,
    start_date date NOT NULL,
    estimated_end_date date NOT NULL,
    project_warranty_id character varying(255),
    project_issue text
);


ALTER TABLE project_management.external_project_tracking OWNER TO postgres;

--
-- Name: external_project_warranty; Type: TABLE; Schema: project_management; Owner: postgres
--

CREATE TABLE project_management.external_project_warranty (
    project_warranty_id character varying(255) NOT NULL,
    project_id character varying(255),
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
    project_request_id character varying(255),
    intrnl_project_status public.intrnl_project_status NOT NULL
);


ALTER TABLE project_management.internal_project_details OWNER TO postgres;

--
-- Name: internal_project_labor; Type: TABLE; Schema: project_management; Owner: postgres
--

CREATE TABLE project_management.internal_project_labor (
    intrnl_project_labor_id character varying(255) NOT NULL,
    intrnl_project_id character varying(255),
    employee_id character varying(255)
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
    approval_id character varying(255),
    employee_id character varying(255),
    dept_id character varying(255),
    project_type public.project_type NOT NULL
);


ALTER TABLE project_management.internal_project_request OWNER TO postgres;

--
-- Name: internal_project_task_list; Type: TABLE; Schema: project_management; Owner: postgres
--

CREATE TABLE project_management.internal_project_task_list (
    intrnl_task_id character varying(255) NOT NULL,
    intrnl_project_id character varying(255),
    intrnl_task_description text,
    intrnl_task_status public.intrnl_task_status NOT NULL,
    intrnl_task_deadline date NOT NULL,
    intrnl_project_labor_id character varying(255)
);


ALTER TABLE project_management.internal_project_task_list OWNER TO postgres;

--
-- Name: internal_project_tracking; Type: TABLE; Schema: project_management; Owner: postgres
--

CREATE TABLE project_management.internal_project_tracking (
    intrnl_project_tracking_id character varying(255) NOT NULL,
    intrnl_project_id character varying(255),
    intrnl_start_date date NOT NULL,
    intrnl_estimated_end_date date NOT NULL,
    intrnl_project_issue text
);


ALTER TABLE project_management.internal_project_tracking OWNER TO postgres;

--
-- Name: report_monitoring; Type: TABLE; Schema: project_management; Owner: postgres
--

CREATE TABLE project_management.report_monitoring (
    report_monitoring_id character varying(255) NOT NULL,
    report_type public.report_type NOT NULL,
    report_title character varying(255),
    received_from public.ext_modules,
    date_created date NOT NULL,
    assigned_to public.ext_modules,
    description text
);


ALTER TABLE project_management.report_monitoring OWNER TO postgres;

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
    shipment_id character varying(255),
    inspection_date date,
    employee_id character varying(255),
    inspection_result public.inspection_result,
    remarks character varying(255)
);


ALTER TABLE purchasing.batch_inspection OWNER TO postgres;

--
-- Name: credit_memo; Type: TABLE; Schema: purchasing; Owner: postgres
--

CREATE TABLE purchasing.credit_memo (
    credit_memo_id character varying(255) NOT NULL,
    inspection_id character varying(255),
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
    purchase_id character varying(255),
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
    quotation_id character varying(255),
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
    vendor_code character varying(255),
    quotation_content_id character varying(255),
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
    employee_id character varying(255),
    approval_id character varying(255),
    material_id character varying(255),
    asset_id character varying(255),
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
    request_id character varying(255),
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
    purchase_id character varying(255),
    delivery_date date
);


ALTER TABLE purchasing.received_shipments OWNER TO postgres;

--
-- Name: vendor_application; Type: TABLE; Schema: purchasing; Owner: postgres
--

CREATE TABLE purchasing.vendor_application (
    application_reference character varying(255) NOT NULL,
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
-- Name: auth_group; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE sales.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: sales; Owner: postgres
--

ALTER TABLE sales.auth_group ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME sales.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_group_permissions; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE sales.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: sales; Owner: postgres
--

ALTER TABLE sales.auth_group_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME sales.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_permission; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE sales.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: sales; Owner: postgres
--

ALTER TABLE sales.auth_permission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME sales.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.auth_user (
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


ALTER TABLE sales.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE sales.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: sales; Owner: postgres
--

ALTER TABLE sales.auth_user_groups ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME sales.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: sales; Owner: postgres
--

ALTER TABLE sales.auth_user ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME sales.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE sales.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: sales; Owner: postgres
--

ALTER TABLE sales.auth_user_user_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME sales.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: blanket_agreement; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.blanket_agreement (
    agreement_id character varying(255) NOT NULL,
    statement_id character varying(255),
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
    customer_id character varying(255),
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
    end_date timestamp without time zone
);


ALTER TABLE sales.campaigns OWNER TO postgres;

--
-- Name: campaign_status_view; Type: VIEW; Schema: sales; Owner: postgres
--

CREATE VIEW sales.campaign_status_view AS
 SELECT campaign_id,
    campaign_name,
    type,
    start_date,
    end_date,
        CASE
            WHEN (start_date > now()) THEN 'Planned'::text
            WHEN ((now() >= start_date) AND (now() <= end_date)) THEN 'Active'::text
            ELSE 'Completed'::text
        END AS status
   FROM sales.campaigns c;


ALTER VIEW sales.campaign_status_view OWNER TO postgres;

--
-- Name: credit_memo; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.credit_memo (
    credit_memo_id character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    due_date date,
    total_amount numeric(10,2)
);


ALTER TABLE sales.credit_memo OWNER TO postgres;

--
-- Name: customers; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.customers (
    customer_id character varying(255) NOT NULL,
    gl_account_id character varying(255),
    partner_id character varying(255),
    name character varying(255),
    contact_person character varying(255),
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
-- Name: delivery_note; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.delivery_note (
    delivery_note_id character varying(255) NOT NULL,
    order_id character varying(255),
    statement_id character varying(255),
    rework_id character varying(255),
    goods_issue_id character varying(255),
    shipment_id character varying(255),
    shipping_method public.shipping_method_enum DEFAULT 'Standard'::public.shipping_method_enum,
    tracking_num character varying(255),
    shipping_date timestamp without time zone,
    estimated_delivery timestamp without time zone,
    delivery_status public.delivery_status_enum DEFAULT 'Pending'::public.delivery_status_enum,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE sales.delivery_note OWNER TO postgres;

--
-- Name: django_admin_log; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.django_admin_log (
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


ALTER TABLE sales.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: sales; Owner: postgres
--

ALTER TABLE sales.django_admin_log ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME sales.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_content_type; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE sales.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: sales; Owner: postgres
--

ALTER TABLE sales.django_content_type ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME sales.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_migrations; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE sales.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: sales; Owner: postgres
--

ALTER TABLE sales.django_migrations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME sales.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_session; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE sales.django_session OWNER TO postgres;

--
-- Name: opportunities; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.opportunities (
    opportunity_id character varying(255) NOT NULL,
    customer_id character varying(255),
    partner_id character varying(255),
    salesrep_id character varying(255),
    estimated_value numeric(10,2),
    weighted_amount numeric(10,2),
    gross_profit_percentage numeric(10,2),
    gross_profit_total numeric(10,2),
    starting_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    expected_closed_date date,
    stage public.opportunity_stage_enum,
    status public.opportunity_status_enum,
    description text,
    reason_lost text,
    interest_level public.interest_level_enum
);


ALTER TABLE sales.opportunities OWNER TO postgres;

--
-- Name: orders; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.orders (
    order_id character varying(255) NOT NULL,
    quotation_id character varying(255),
    statement_id character varying(255),
    ext_project_request_id character varying(255),
    order_date timestamp without time zone DEFAULT now(),
    order_type public.order_type_enum
);


ALTER TABLE sales.orders OWNER TO postgres;

--
-- Name: statement_item; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.statement_item (
    statement_item_id character varying(255) NOT NULL,
    statement_id character varying(255),
    product_id character varying(255),
    additional_service_id character varying(255),
    renewal_id character varying(255),
    quantity integer,
    quantity_to_deliver integer,
    unit_price numeric(10,2),
    discount numeric(10,2),
    total_price numeric(10,2),
    tax_amount numeric(10,2),
    return_reason text,
    return_action public.return_action,
    quantity_delivered integer DEFAULT 0,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE sales.statement_item OWNER TO postgres;

--
-- Name: order_view; Type: VIEW; Schema: sales; Owner: postgres
--

CREATE VIEW sales.order_view AS
 WITH requiredquantities AS (
         SELECT o_1.order_id,
            sum(si.quantity) AS required_quantity
           FROM (sales.orders o_1
             JOIN sales.statement_item si ON (((o_1.statement_id)::text = (si.statement_id)::text)))
          GROUP BY o_1.order_id
        ), deliveredquantities AS (
         SELECT dn.order_id,
            COALESCE(sum(si.quantity_delivered), (0)::bigint) AS total_delivered
           FROM (sales.delivery_note dn
             JOIN sales.statement_item si ON (((dn.statement_id)::text = (si.statement_id)::text)))
          GROUP BY dn.order_id
        )
 SELECT o.order_id,
    o.quotation_id,
    o.statement_id,
    o.ext_project_request_id,
    o.order_date,
    o.order_type,
        CASE
            WHEN (dq.total_delivered >= rq.required_quantity) THEN 'Completed'::public.completion_status_enum
            WHEN ((dq.total_delivered = 0) OR (dq.* IS NULL)) THEN 'Open'::public.completion_status_enum
            ELSE 'Partially Delivered'::public.completion_status_enum
        END AS completion_status
   FROM ((sales.orders o
     LEFT JOIN requiredquantities rq ON (((rq.order_id)::text = (o.order_id)::text)))
     LEFT JOIN deliveredquantities dq ON (((dq.order_id)::text = (o.order_id)::text)));


ALTER VIEW sales.order_view OWNER TO postgres;

--
-- Name: payments; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.payments (
    payment_id character varying(255) NOT NULL,
    order_id character varying(255),
    payment_method public.payment_method_enum,
    payment_status public.single_payment_status_enum DEFAULT 'Pending'::public.single_payment_status_enum,
    payment_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE sales.payments OWNER TO postgres;

--
-- Name: product_pricing; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.product_pricing (
    product_id character varying(255) NOT NULL,
    admin_product_id character varying(255),
    markup_percentage numeric(5,2) DEFAULT 20.00,
    selling_price numeric(10,2),
    demand_level public.demand_level_enum DEFAULT 'Low'::public.demand_level_enum
);


ALTER TABLE sales.product_pricing OWNER TO postgres;

--
-- Name: quotation; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.quotation (
    quotation_id character varying(255) NOT NULL,
    statement_id character varying(255),
    agreement_id character varying(255),
    date_issued timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE sales.quotation OWNER TO postgres;

--
-- Name: quotation_view; Type: VIEW; Schema: sales; Owner: postgres
--

CREATE VIEW sales.quotation_view AS
 SELECT quotation_id,
    statement_id,
    agreement_id,
    date_issued,
        CASE
            WHEN (date_issued >= (CURRENT_DATE + '7 days'::interval)) THEN 'Expired'::public.quotation_status_enum
            WHEN (EXISTS ( SELECT 1
               FROM sales.orders o
              WHERE ((o.quotation_id)::text = (q.quotation_id)::text))) THEN 'Approved'::public.quotation_status_enum
            ELSE 'Pending'::public.quotation_status_enum
        END AS status
   FROM sales.quotation q;


ALTER VIEW sales.quotation_view OWNER TO postgres;

--
-- Name: renewal_warranty; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.renewal_warranty (
    renewal_id character varying(255) NOT NULL,
    order_id character varying(255),
    customer_id character varying(255),
    product_id character varying(255),
    payments_id character varying(255),
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
-- Name: return; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.return (
    return_id character varying(255) NOT NULL,
    statement_id character varying(255),
    delivery_note_id character varying(255),
    return_date timestamp without time zone,
    status public.return_status,
    remarks text
);


ALTER TABLE sales.return OWNER TO postgres;

--
-- Name: sales_invoices; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.sales_invoices (
    invoice_id character varying(255) NOT NULL,
    delivery_note_id character varying(255),
    invoice_date timestamp without time zone DEFAULT now(),
    total_amount numeric(10,2),
    total_amount_paid numeric(10,2) DEFAULT 0,
    remaining_balance numeric(10,2) GENERATED ALWAYS AS ((total_amount - total_amount_paid)) STORED
);


ALTER TABLE sales.sales_invoices OWNER TO postgres;

--
-- Name: sales_invoices_view; Type: VIEW; Schema: sales; Owner: postgres
--

CREATE VIEW sales.sales_invoices_view AS
 SELECT invoice_id,
    delivery_note_id,
    invoice_date,
    total_amount,
    total_amount_paid,
    remaining_balance,
        CASE
            WHEN (total_amount = total_amount_paid) THEN 'Fully Paid'::public.payment_status_enum
            WHEN (total_amount_paid = (0)::numeric) THEN 'Unpaid'::public.payment_status_enum
            ELSE 'Partially Paid'::public.payment_status_enum
        END AS payment_status
   FROM sales.sales_invoices si;


ALTER VIEW sales.sales_invoices_view OWNER TO postgres;

--
-- Name: statement; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.statement (
    statement_id character varying(255) NOT NULL,
    customer_id character varying(255),
    salesrep_id character varying(255),
    total_amount numeric(10,2) DEFAULT 0,
    discount numeric(10,2) DEFAULT 0,
    total_tax numeric(10,2),
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE sales.statement OWNER TO postgres;

--
-- Name: ticket; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.ticket (
    ticket_id character varying(255) NOT NULL,
    customer_id character varying(255),
    salesrep_id character varying(255),
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
    ticket_id character varying(255),
    content character varying(255),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE sales.ticket_convo OWNER TO postgres;

--
-- Name: additional_service; Type: TABLE; Schema: services; Owner: postgres
--

CREATE TABLE services.additional_service (
    additional_service_id character varying(255) NOT NULL,
    total_fee numeric(10,2) DEFAULT 0.00
);


ALTER TABLE services.additional_service OWNER TO postgres;

--
-- Name: additional_service_type; Type: TABLE; Schema: services; Owner: postgres
--

CREATE TABLE services.additional_service_type (
    additional_service_type_id character varying(255) NOT NULL,
    additional_service_id character varying(255),
    service_type text NOT NULL,
    service_fee numeric(10,2) NOT NULL,
    duration integer,
    date_start date NOT NULL,
    status text NOT NULL,
    total_service_fee numeric(10,2) NOT NULL,
    CONSTRAINT additional_service_type_service_type_check CHECK ((service_type = ANY (ARRAY['Maintenance'::text, 'Extended Warranty'::text, 'Priority Service'::text]))),
    CONSTRAINT additional_service_type_status_check CHECK ((status = ANY (ARRAY['Active'::text, 'Expired'::text])))
);


ALTER TABLE services.additional_service_type OWNER TO postgres;

--
-- Name: after_analysis_sched; Type: TABLE; Schema: services; Owner: postgres
--

CREATE TABLE services.after_analysis_sched (
    analysis_sched_id character varying(255) NOT NULL,
    analysis_id character varying(255),
    service_date date NOT NULL,
    technician_id character varying(255),
    description text,
    service_status text NOT NULL,
    CONSTRAINT after_analysis_sched_service_status_check CHECK ((service_status = ANY (ARRAY['Scheduled'::text, 'Completed'::text, 'Cancelled'::text, 'In Progress'::text])))
);


ALTER TABLE services.after_analysis_sched OWNER TO postgres;

--
-- Name: delivery_order; Type: TABLE; Schema: services; Owner: postgres
--

CREATE TABLE services.delivery_order (
    delivery_order_id character varying(255) NOT NULL,
    service_order_id character varying(255),
    customer_id character varying(255),
    customer_address text,
    delivery_status text NOT NULL,
    delivery_date date,
    CONSTRAINT delivery_order_delivery_status_check CHECK ((delivery_status = ANY (ARRAY['Pending'::text, 'Shipped'::text, 'Delivered'::text])))
);


ALTER TABLE services.delivery_order OWNER TO postgres;

--
-- Name: service_analysis; Type: TABLE; Schema: services; Owner: postgres
--

CREATE TABLE services.service_analysis (
    analysis_id character varying(255) NOT NULL,
    service_request_id character varying(255),
    analysis_date date,
    technician_id character varying(255),
    customer_id character varying(255),
    analysis_status text NOT NULL,
    analysis_description text,
    product_id character varying(255),
    contract_id character varying(255),
    labor_cost numeric(10,2),
    CONSTRAINT service_analysis_analysis_status_check CHECK ((analysis_status = ANY (ARRAY['Scheduled'::text, 'Done'::text])))
);


ALTER TABLE services.service_analysis OWNER TO postgres;

--
-- Name: service_billing; Type: TABLE; Schema: services; Owner: postgres
--

CREATE TABLE services.service_billing (
    service_billing_id character varying(255) NOT NULL,
    service_order_id character varying(255),
    analysis_id character varying(255),
    service_request_id character varying(255),
    item_name character varying(255),
    service_billing_amount numeric(10,2),
    labor_cost numeric(10,2),
    outsource_fee numeric(10,2) DEFAULT 0.00,
    operational_cost_id character varying(255),
    order_item_price numeric(10,2) DEFAULT 0.00,
    total_payable numeric(10,2) DEFAULT 0.00,
    billing_status text NOT NULL,
    date_paid date,
    CONSTRAINT service_billing_billing_status_check CHECK ((billing_status = ANY (ARRAY['Unpaid'::text, 'Paid'::text]))),
    CONSTRAINT service_billing_outsource_fee_check CHECK ((outsource_fee >= (0)::numeric)),
    CONSTRAINT service_billing_service_billing_amount_check CHECK ((service_billing_amount >= (0)::numeric))
);


ALTER TABLE services.service_billing OWNER TO postgres;

--
-- Name: service_call; Type: TABLE; Schema: services; Owner: postgres
--

CREATE TABLE services.service_call (
    service_call_id character varying(255) NOT NULL,
    date_created timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    service_ticket_id character varying(255),
    customer_id character varying(255),
    call_type text NOT NULL,
    technician_id character varying(255),
    call_status text NOT NULL,
    date_closed timestamp without time zone,
    contract_id character varying(255),
    product_id character varying(255),
    end_date date,
    priority_level text NOT NULL,
    resolution text,
    CONSTRAINT service_call_call_status_check CHECK ((call_status = ANY (ARRAY['Open'::text, 'Closed'::text, 'In Progress'::text]))),
    CONSTRAINT service_call_call_type_check CHECK ((call_type = ANY (ARRAY['Inquiry'::text, 'Request'::text, 'Other'::text]))),
    CONSTRAINT service_call_priority_level_check CHECK ((priority_level = ANY (ARRAY['Low'::text, 'Medium'::text, 'High'::text])))
);


ALTER TABLE services.service_call OWNER TO postgres;

--
-- Name: service_contract; Type: TABLE; Schema: services; Owner: postgres
--

CREATE TABLE services.service_contract (
    contract_id character varying(255) NOT NULL,
    statement_item_id character varying(255),
    customer_id character varying(255),
    additional_service_id character varying(255),
    contract_description text,
    date_issued date,
    end_date date,
    product_id character varying(255),
    contract_status text NOT NULL,
    product_quantity integer DEFAULT 1,
    renewal_id character varying(255),
    renewal_date date,
    renewal_end_date date,
    CONSTRAINT service_contract_contract_status_check CHECK ((contract_status = ANY (ARRAY['Pending'::text, 'Active'::text, 'Expired'::text, 'Terminated'::text])))
);


ALTER TABLE services.service_contract OWNER TO postgres;

--
-- Name: service_order; Type: TABLE; Schema: services; Owner: postgres
--

CREATE TABLE services.service_order (
    service_order_id character varying(255) NOT NULL,
    analysis_id character varying(255),
    customer_id character varying(255),
    order_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE services.service_order OWNER TO postgres;

--
-- Name: service_order_item; Type: TABLE; Schema: services; Owner: postgres
--

CREATE TABLE services.service_order_item (
    service_order_item_id character varying(255) NOT NULL,
    service_order_id character varying(255),
    item_id character varying(255),
    principal_item_id character varying(255),
    item_name character varying(255),
    item_quantity integer DEFAULT 1,
    item_price numeric(10,2),
    total_price numeric(10,2) NOT NULL,
    CONSTRAINT service_order_item_item_quantity_check CHECK ((item_quantity > 0))
);


ALTER TABLE services.service_order_item OWNER TO postgres;

--
-- Name: service_report; Type: TABLE; Schema: services; Owner: postgres
--

CREATE TABLE services.service_report (
    report_id character varying(255) NOT NULL,
    service_call_id character varying(255),
    service_ticket_id character varying(255),
    service_billing_id character varying(255),
    renewal_id character varying(255),
    technician_id character varying(255),
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
    service_call_id character varying(255),
    request_date date,
    customer_id character varying(255),
    technician_id character varying(255),
    request_type text NOT NULL,
    request_status text NOT NULL,
    request_description text,
    request_remarks text,
    CONSTRAINT service_request_request_status_check CHECK ((request_status = ANY (ARRAY['Pending'::text, 'Approved'::text, 'Rejected'::text, 'In Progress'::text]))),
    CONSTRAINT service_request_request_type_check CHECK ((request_type = ANY (ARRAY['Repair'::text, 'Installation'::text, 'Maintenance'::text, 'Renewal'::text, 'Other'::text])))
);


ALTER TABLE services.service_request OWNER TO postgres;

--
-- Name: technician; Type: TABLE; Schema: services; Owner: postgres
--

CREATE TABLE services.technician (
    technician_id character varying(255) NOT NULL,
    employee_id character varying(255)
);


ALTER TABLE services.technician OWNER TO postgres;

--
-- Data for Name: chart_of_accounts; Type: TABLE DATA; Schema: accounting; Owner: postgres
--

COPY accounting.chart_of_accounts (account_code, account_name, account_type) FROM stdin;
ACC-COA-2025-CA1010	Cash on Hand	Current Asset
ACC-COA-2025-CA1020	Cash in Bank	Current Asset
ACC-COA-2025-CA1030	Accounts Receivable	Current Asset
ACC-COA-2025-CA1040	Allowance for Doubtful Accounts	Contra-Asset
ACC-COA-2025-CA1050	Raw Materials Inventory	Current Asset
ACC-COA-2025-CA1060	Work-in-Process (WIP) Inventory	Current Asset
ACC-COA-2025-CA1070	Finished Goods Inventory	Current Asset
ACC-COA-2025-CA1080	Prepaid Expenses	Current Asset
ACC-COA-2025-CA1090	Supplier Advances	Current Asset
ACC-COA-2025-NA1100	Land & Buildings	Non-Current Asset
ACC-COA-2025-NA1110	Machinery & Equipment	Non-Current Asset
ACC-COA-2025-NA1120	Vehicles	Non-Current Asset
ACC-COA-2025-NA1130	Office Furniture & Fixtures	Non-Current Asset
ACC-COA-2025-NA1140	Computers & IT Equipment	Non-Current Asset
ACC-COA-2025-NA1150	Intangible Assets	Non-Current Asset
ACC-COA-2025-NA1160	Accumulated Depreciation	Contra-Asset
ACC-COA-2025-CL2010	Accounts Payable	Current Liability
ACC-COA-2025-CL2020	Accrued Expenses	Current Liability
ACC-COA-2025-CL2030	Taxes Payable	Current Liability
ACC-COA-2025-CL2040	Short-Term Loans Payable	Current Liability
ACC-COA-2025-CL2050	Customer Deposits	Current Liability
ACC-COA-2025-NL2100	Long-Term Loans Payable	Non-Current Liability
ACC-COA-2025-NL2110	Bonds Payable	Non-Current Liability
ACC-COA-2025-NL2120	Lease Liabilities	Non-Current Liability
ACC-COA-2025-EE3010	Owners Capital / Shareholders Equity	Equity
ACC-COA-2025-EE3020	Retained Earnings	Equity
ACC-COA-2025-EE3030	Dividends Payable	Equity
ACC-COA-2025-RR4010	Sales Revenue	Revenue
ACC-COA-2025-RR4020	Service Revenue	Revenue
ACC-COA-2025-RR4030	Discounts Allowed	Contra-Revenue
ACC-COA-2025-CG5010	Raw Materials Used	Cost of Goods Sold
ACC-COA-2025-CG5020	Direct Labor	Cost of Goods Sold
ACC-COA-2025-CG5030	Factory Overhead	Cost of Goods Sold
ACC-COA-2025-CG5040	Work-in-Process Adjustments	Cost of Goods Sold
ACC-COA-2025-CG5050	Cost of Finished Goods Sold	Cost of Goods Sold
ACC-COA-2025-AE6010	Salaries & Wages	Operating Expense
ACC-COA-2025-AE6020	Office Supplies & Equipment	Operating Expense
ACC-COA-2025-AE6030	Rent & Utilities	Operating Expense
ACC-COA-2025-AE6040	Depreciation	Operating Expense
ACC-COA-2025-AE6050	Software & IT Expenses	Operating Expense
ACC-COA-2025-AE6060	Legal & Professional Fees	Operating Expense
ACC-COA-2025-SD6100	Marketing & Advertising	Operating Expense
ACC-COA-2025-SD6110	Sales Commissions	Operating Expense
ACC-COA-2025-SD6120	Shipping & Freight Costs	Operating Expense
ACC-COA-2025-SD6130	Packaging Costs	Operating Expense
ACC-COA-2025-OI7010	Interest Income	Other Income
ACC-COA-2025-OI7020	Gain on Sale of Assets	Other Income
ACC-COA-2025-OI7030	Investment Income	Other Income
ACC-COA-2025-OE7100	Interest Expense	Other Expense
ACC-COA-2025-OE7110	Exchange Rate Losses	Other Expense
ACC-COA-2025-OE7120	Penalties & Fines	Other Expense
\.


--
-- Data for Name: general_ledger_accounts; Type: TABLE DATA; Schema: accounting; Owner: postgres
--

COPY accounting.general_ledger_accounts (gl_account_id, account_name, account_code, account_id, status, created_at) FROM stdin;
ACC-GLA-2025-d99563	Bank - 1122	ACC-COA-2025-CA1020	\N	Active	2025-03-08 02:00:00
ACC-GLA-2025-325576	Inventory	ACC-COA-2025-CA1070	\N	Active	2025-03-08 02:00:00
ACC-GLA-2025-7d091f	Mr. Zubair & Co.	ACC-COA-2025-CL2010	\N	Active	2025-03-08 02:00:00
ACC-GLA-2025-8b2f9e	Kazim Ahmed	ACC-COA-2025-CL2050	\N	Active	2025-03-08 02:00:00
ACC-GLA-2025-89709a	Kineteq/Oweners Equity	ACC-COA-2025-EE3010	\N	Active	2025-03-08 02:00:00
ACC-GLA-2025-045271	Salary Expense	ACC-COA-2025-AE6010	\N	Active	2025-03-08 02:00:00
ACC-GLA-2025-5f14f4	Sales Revenue	ACC-COA-2025-RR4010	\N	Active	2025-03-08 02:00:00
ACC-GLA-2025-9aef6a	Cost of Goods Sold	ACC-COA-2025-CG5050	\N	Active	2025-03-08 02:00:00
ACC-GLA-2025-562c91	Electricity Expense	ACC-COA-2025-AE6030	\N	Active	2025-03-08 02:00:00
ACC-GLA-2025-753474	Government Taxes Payable	ACC-COA-2025-CL2030	\N	Active	2025-03-08 02:00:00
ACC-GLA-2025-79c350	Raw Materials Used	ACC-COA-2025-CG5010	\N	Active	2025-03-18 08:15:14
ACC-GLA-2025-6693dd	BANK - BDO	ACC-COA-2025-CL2010	\N	Active	2025-03-08 02:00:00
ACC-GLA-2025-475b6b	Shipping Cost	ACC-COA-2025-SD6120	\N	Active	2025-03-18 21:06:48
ACC-GLA-2025-b2e6a0	Customer - botik	ACC-COA-2025-CA1030	\N	Active	2025-03-18 21:23:27
ACC-GLA-2025-7b3d46	Work-in-Process Inventory	ACC-COA-2025-CA1060	\N	Active	2025-03-18 21:06:48
ACC-GLA-2025-8c3735	Raw Materials Inventory	ACC-COA-2025-CA1050	\N	Active	2025-03-18 21:06:48
ACC-GLA-2025-bc37bf	Raw Materials Used	ACC-COA-2025-CG5010	\N	Active	2025-03-18 21:06:48
ACC-GLA-2025-cb4278	Customer - St. Luke Medical Center	ACC-COA-2025-CA1030	\N	Active	2025-03-18 21:06:48
ACC-GLA-2025-154519	Customer - Makati Medical Center	ACC-COA-2025-CA1030	\N	Active	2025-03-18 21:06:48
ACC-GLA-2025-5bb9e0	Customer - Manila Doctors Hospital	ACC-COA-2025-CA1030	\N	Active	2025-03-18 21:06:48
ACC-GLA-2025-59cc91	Customer - Cardinal Santos Medical Center	ACC-COA-2025-CA1030	\N	Active	2025-03-18 21:06:48
ACC-GLA-2025-dab34c	Customer - Philippines General Hospital	ACC-COA-2025-CA1030	\N	Active	2025-03-18 21:06:48
ACC-GLA-2025-b38baa	Customer - World Citi Medical Center	ACC-COA-2025-CA1030	\N	Active	2025-03-18 21:06:48
ACC-GLA-2025-c6c865	Customer - Metro Manila Medical Center	ACC-COA-2025-CA1030	\N	Active	2025-03-18 21:06:48
ACC-GLA-2025-00b178	Customer - Capitol Medical Center	ACC-COA-2025-CA1030	\N	Active	2025-03-18 21:06:48
ACC-GLA-2025-f023f7	Vendor- BioFlex Composites	ACC-COA-2025-CL2010	\N	Active	2025-03-18 21:23:27
ACC-GLA-2025-ea1e90	Vendor- BioGrade Metals	ACC-COA-2025-CL2010	\N	Active	2025-03-18 21:23:27
ACC-GLA-2025-e6b765	Vendor- CryoBond Precision	ACC-COA-2025-CL2010	\N	Active	2025-03-18 21:23:27
ACC-GLA-2025-adfac3	Vendor- DuraWell Pro Ltd.	ACC-COA-2025-CL2010	\N	Active	2025-03-18 21:23:27
ACC-GLA-2025-b84cac	Vendor- MedicalTradingCorps	ACC-COA-2025-CL2010	\N	Active	2025-03-18 21:23:27
ACC-GLA-2025-800b82	Vendor- MediCore Materials Inc.	ACC-COA-2025-CL2010	\N	Active	2025-03-18 21:23:27
ACC-GLA-2025-9d7a21	Vendor- NeoCarewell Industries Ltd.	ACC-COA-2025-CL2010	\N	Active	2025-03-18 21:23:27
ACC-GLA-2025-62ac13	Vendor- PharmaTools Ltd.	ACC-COA-2025-CL2010	\N	Active	2025-03-18 21:23:27
ACC-GLA-2025-734f1c	Vendor- PureForm Medical	ACC-COA-2025-CL2010	\N	Active	2025-03-18 21:23:27
ACC-GLA-2025-975385	Employee- Kate Tan	ACC-COA-2025-AE6010	\N	Active	2025-03-18 21:23:27
ACC-GLA-2025-037760	Employee- James Marticio	ACC-COA-2025-AE6010	\N	Active	2025-03-18 21:23:27
ACC-GLA-2025-15e51d	Employee- Robert Santiago	ACC-COA-2025-AE6010	\N	Active	2025-03-18 21:23:27
ACC-GLA-2025-f78e36	Employee- Maria Lopez	ACC-COA-2025-AE6010	\N	Active	2025-03-18 21:23:27
ACC-GLA-2025-8b1613	Employee- David Cruz	ACC-COA-2025-AE6010	\N	Active	2025-03-18 21:23:27
ACC-GLA-2025-8c1a03	St. Luke's Medical Center	ACC-COA-2025-CA1030	SALES-CUST-2025-a69232	Active	2025-04-01 20:26:50.269297
ACC-GLA-2025-e73ded	Makati Medical Center	ACC-COA-2025-CA1030	SALES-CUST-2025-6e52b0	Active	2025-04-01 20:26:50.269297
ACC-GLA-2025-5adc04	The Medical City	ACC-COA-2025-CA1030	SALES-CUST-2025-cd3925	Active	2025-04-01 20:26:50.269297
ACC-GLA-2025-59a2c5	Asian Hospital and Medical Center	ACC-COA-2025-CA1030	SALES-CUST-2025-12765a	Active	2025-04-01 20:26:50.269297
ACC-GLA-2025-2847f3	Philippine General Hospital	ACC-COA-2025-CA1030	SALES-CUST-2025-12ab0e	Active	2025-04-01 20:26:50.269297
ACC-GLA-2025-0d54e9	Manila Doctors Hospital	ACC-COA-2025-CA1030	SALES-CUST-2025-16e575	Active	2025-04-01 20:26:50.269297
ACC-GLA-2025-9b003c	Cardinal Santos Medical Center	ACC-COA-2025-CA1030	SALES-CUST-2025-72570c	Active	2025-04-01 20:26:50.269297
ACC-GLA-2025-8b24f4	World Citi Medical Center	ACC-COA-2025-CA1030	SALES-CUST-2025-78f344	Active	2025-04-01 20:26:50.269297
ACC-GLA-2025-b445f1	Davao Doctors Hospital	ACC-COA-2025-CA1030	SALES-CUST-2025-868810	Active	2025-04-01 20:26:50.269297
ACC-GLA-2025-67d978	Cebu Doctors University Hospital	ACC-COA-2025-CA1030	SALES-CUST-2025-4ff5f8	Active	2025-04-01 20:26:50.269297
ACC-GLA-2025-213205	Metro Manila Medical Center	ACC-COA-2025-CA1030	SALES-CUST-2025-1fc7a8	Active	2025-04-01 20:26:50.269297
ACC-GLA-2025-25cd68	East Avenue Medical Center	ACC-COA-2025-CA1030	SALES-CUST-2025-290d05	Active	2025-04-01 20:26:50.269297
ACC-GLA-2025-6bc018	Capitol Medical Center	ACC-COA-2025-CA1030	SALES-CUST-2025-8151a1	Active	2025-04-01 20:26:50.269297
ACC-GLA-2025-174d6a	Ospital ng Makati	ACC-COA-2025-CA1030	SALES-CUST-2025-9594b6	Active	2025-04-01 20:26:50.269297
ACC-GLA-2025-8b0e21	Lung Center of the Philippines	ACC-COA-2025-CA1030	SALES-CUST-2025-be5085	Active	2025-04-01 20:26:50.269297
ACC-GLA-2025-9c7d3b	National Kidney and Transplant Institute	ACC-COA-2025-CA1030	SALES-CUST-2025-673faf	Active	2025-04-01 20:26:50.269297
ACC-GLA-2025-5f8439	Rizal Medical Center	ACC-COA-2025-CA1030	SALES-CUST-2025-0a646e	Active	2025-04-01 20:26:50.269297
ACC-GLA-2025-74d3c2	Quirino Memorial Medical Center	ACC-COA-2025-CA1030	SALES-CUST-2025-67e405	Active	2025-04-01 20:26:50.269297
ACC-GLA-2025-f48054	Jose R. Reyes Memorial Medical Center	ACC-COA-2025-CA1030	SALES-CUST-2025-63b81d	Active	2025-04-01 20:26:50.269297
ACC-GLA-2025-a63cc3	Perpetual Help Medical Center	ACC-COA-2025-CA1030	SALES-CUST-2025-8b435b	Active	2025-04-01 20:26:50.269297
\.


--
-- Data for Name: journal_entries; Type: TABLE DATA; Schema: accounting; Owner: postgres
--

COPY accounting.journal_entries (journal_id, journal_date, description, total_debit, total_credit, invoice_id, currency_id) FROM stdin;
ACC-JOE-2025-7367dd	2022-01-05	Sales Order	77984.53	77984.53	\N	\N
ACC-JOE-2025-5e5fb7	2022-01-05	Sales Order	3544677.76	3544677.76	\N	\N
ACC-JOE-2025-a8703e	2022-01-05	Sales Order	437073.00	437073.00	\N	\N
ACC-JOE-2025-ebed42	2022-01-06	Production Document Transaction	150.00	150.00	\N	\N
ACC-JOE-2025-cd9824	2022-01-06	Production Document Transaction	175.00	175.00	\N	\N
ACC-JOE-2025-9cec49	2022-01-07	MRP Overall Production Cost	2000.00	2000.00	\N	\N
ACC-JOE-2025-973cdd	2022-01-07	MRP Overall Production Cost	1830.00	1830.00	\N	\N
ACC-JOE-2025-d5cfc3	2022-01-07	MRP Overall Production Cost	2600.00	2600.00	\N	\N
ACC-JOE-2025-580c37	2022-01-08	Payroll Expense	5854.55	5854.55	\N	\N
ACC-JOE-2025-cd192c	2022-01-08	Payroll Expense	1850.00	1850.00	\N	\N
ACC-JOE-2025-4954eb	2022-01-09	Production Order Cost	1500.00	1500.00	\N	\N
ACC-JOE-2025-954f25	2022-01-09	Production Order Cost	800.00	800.00	\N	\N
\.


--
-- Data for Name: journal_entry_lines; Type: TABLE DATA; Schema: accounting; Owner: postgres
--

COPY accounting.journal_entry_lines (entry_line_id, gl_account_id, journal_id, debit_amount, credit_amount, description) FROM stdin;
ACC-JEL-2025-a038c9	\N	\N	77984.53	0.00	Accounts Receivable - Sales Order
ACC-JEL-2025-16b164	\N	\N	0.00	77984.53	Sales Revenue
ACC-JEL-2025-6fa1db	\N	\N	3544677.76	0.00	Accounts Receivable - Sales Order
ACC-JEL-2025-44b8ac	\N	\N	0.00	3544677.76	Sales Revenue
ACC-JEL-2025-b0fa3f	\N	\N	437073.00	0.00	Accounts Receivable - Sales Order
ACC-JEL-2025-b6b50f	\N	\N	0.00	437073.00	Sales Revenue
ACC-JEL-2025-5ec9ae	\N	\N	150.00	0.00	Work-in-Process Inventory
ACC-JEL-2025-a961ec	\N	\N	0.00	150.00	Raw Materials Used for Production
ACC-JEL-2025-e6a391	\N	\N	175.00	0.00	Work-in-Process Inventory
ACC-JEL-2025-97462d	\N	\N	0.00	175.00	Raw Materials Used for Production
ACC-JEL-2025-345aaa	\N	\N	2000.00	0.00	Cost of Finished Goods Sold
ACC-JEL-2025-1330cc	\N	\N	0.00	2000.00	Sales Revenue
ACC-JEL-2025-e50a5e	\N	\N	1830.00	0.00	Cost of Finished Goods Sold
ACC-JEL-2025-affc80	\N	\N	0.00	1830.00	Sales Revenue
ACC-JEL-2025-860655	\N	\N	2600.00	0.00	Cost of Finished Goods Sold
ACC-JEL-2025-c1da1b	\N	\N	0.00	2600.00	Sales Revenue
ACC-JEL-2025-f23976	\N	\N	5854.55	0.00	Payroll Expense
ACC-JEL-2025-7ee07b	\N	\N	0.00	5854.55	Payroll Payment
ACC-JEL-2025-129845	\N	\N	1850.00	0.00	Payroll Expense
ACC-JEL-2025-0ffa37	\N	\N	0.00	1850.00	Payroll Payment
ACC-JEL-2025-74bfc8	\N	\N	1500.00	0.00	Work-in-Process Inventory Increase
ACC-JEL-2025-1afe4f	\N	\N	0.00	1500.00	Raw Materials Used
ACC-JEL-2025-75d86b	\N	\N	800.00	0.00	Work-in-Process Inventory Increase
ACC-JEL-2025-dc79e7	\N	\N	0.00	800.00	Raw Materials Used
\.


--
-- Data for Name: official_receipts; Type: TABLE DATA; Schema: accounting; Owner: postgres
--

COPY accounting.official_receipts (or_id, invoice_id, customer_id, or_date, settled_amount, remaining_amount, payment_method, reference_number, created_by) FROM stdin;
ACC-OFR-2025-b7c647	\N	\N	2025-04-02	250.00	250.00	Credit Card	REF-1001	Admin
ACC-OFR-2025-2f50a4	\N	\N	2025-03-20	1200.00	0.00	Bank Transfer	REF-1002	Admin
ACC-OFR-2025-c0faa7	\N	\N	2025-03-12	1000.00	1500.00	Cash	REF-1003	Admin
ACC-OFR-2025-8cd5da	\N	\N	2025-03-25	1800.00	0.00	Credit Card	REF-1004	Admin
ACC-OFR-2025-f365dc	\N	\N	2025-04-06	400.00	350.00	Bank Transfer	REF-1005	Admin
ACC-OFR-2025-3901a4	\N	\N	2025-03-17	1500.00	1500.00	Cash	REF-1006	Admin
ACC-OFR-2025-d39c5d	\N	\N	2025-03-22	950.00	0.00	Credit Card	REF-1007	Admin
ACC-OFR-2025-1558ad	\N	\N	2025-04-11	2000.00	2000.00	Bank Transfer	REF-1008	Admin
ACC-OFR-2025-c2fd5b	\N	\N	2025-03-14	750.00	2000.00	Cash	REF-1009	Admin
ACC-OFR-2025-5a13ef	\N	\N	2025-03-18	600.00	0.00	Credit Card	REF-1010	Admin
\.


--
-- Data for Name: assets; Type: TABLE DATA; Schema: admin; Owner: postgres
--

COPY admin.assets (asset_id, asset_name, purchase_date, purchase_price, serial_no, content_id) FROM stdin;
ADMIN-ASSET-2025-90d673	Laptop - Dell XPS 15	2024-01-10	1800.00	SN0001	\N
ADMIN-ASSET-2025-0b237b	Office Chair - Ergonomic	2023-12-15	250.00	SN0002	\N
ADMIN-ASSET-2025-f05b07	Printer - HP LaserJet Pro	2024-02-05	350.00	SN0003	\N
ADMIN-ASSET-2025-ff6033	Projector - Epson X500	2023-11-20	700.00	SN0004	\N
ADMIN-ASSET-2025-b2c02b	Desk - Wooden Executive	2024-03-01	500.00	SN0005	\N
ADMIN-ASSET-2025-ddc1b8	Monitor - LG UltraWide	2024-02-10	900.00	SN0006	\N
ADMIN-ASSET-2025-6c21b4	Keyboard - Mechanical RGB	2023-12-25	150.00	SN0007	\N
ADMIN-ASSET-2025-c53100	Mouse - Logitech MX Master 3	2024-01-15	100.00	SN0008	\N
ADMIN-ASSET-2025-324416	External Hard Drive - 2TB	2024-02-28	180.00	SN0009	\N
ADMIN-ASSET-2025-53b631	Conference Speaker - Jabra Speak 750	2023-11-30	300.00	SN0010	\N
ADMIN-ASSET-2025-dd68b9	Tablet - iPad Pro	2024-03-05	1200.00	SN0011	\N
ADMIN-ASSET-2025-5ea4c2	Smartphone - Samsung Galaxy S24	2024-02-18	1100.00	SN0012	\N
ADMIN-ASSET-2025-71b212	Scanner - Canon imageFORMULA	2024-01-22	400.00	SN0013	\N
ADMIN-ASSET-2025-6929da	Router - Cisco RV340	2024-03-02	250.00	SN0014	\N
ADMIN-ASSET-2025-77c8f2	Filing Cabinet - Steel 4-Drawer	2024-02-14	350.00	SN0015	\N
ADMIN-ASSET-2025-09de5f	Webcam - Logitech Brio	2024-03-09	200.00	SN0016	\N
ADMIN-ASSET-2025-7a5a6e	Whiteboard - Magnetic	2024-01-29	120.00	SN0017	\N
ADMIN-ASSET-2025-144a0c	Speaker System - Bose Companion	2024-02-08	450.00	SN0018	\N
ADMIN-ASSET-2025-32b480	UPS - APC Smart-UPS	2024-03-04	600.00	SN0019	\N
ADMIN-ASSET-2025-7f3745	Air Purifier - Dyson Pure Cool	2024-02-27	550.00	SN0020	\N
\.


--
-- Data for Name: audit_log; Type: TABLE DATA; Schema: admin; Owner: postgres
--

COPY admin.audit_log (log_id, user_id, action, "timestamp", ip_address) FROM stdin;
ADMIN-LOG-2025-08dbb0	\N	User login	2025-03-01 08:00:00	192.168.1.1
ADMIN-LOG-2025-d9c7a4	\N	Password change	2025-03-02 09:15:00	192.168.1.2
ADMIN-LOG-2025-d8d287	\N	Failed login attempt	2025-03-03 10:20:00	192.168.1.3
ADMIN-LOG-2025-860dd3	\N	Updated profile	2025-03-04 11:30:00	192.168.1.4
ADMIN-LOG-2025-d2207c	\N	Deleted user record	2025-03-05 12:40:00	192.168.1.5
ADMIN-LOG-2025-8f5397	\N	Accessed sensitive data	2025-03-06 13:50:00	192.168.1.6
ADMIN-LOG-2025-4cd6f9	\N	User logout	2025-03-07 14:00:00	192.168.1.7
ADMIN-LOG-2025-df0987	\N	Permission change	2025-03-08 15:10:00	192.168.1.8
ADMIN-LOG-2025-5e9e73	\N	Password reset	2025-03-09 16:20:00	192.168.1.9
ADMIN-LOG-2025-2873d3	\N	Exported report	2025-03-10 17:30:00	192.168.1.10
ADMIN-LOG-2025-5e161f	\N	Added new vendor	2025-03-11 18:40:00	192.168.1.11
ADMIN-LOG-2025-459a3b	\N	Failed login attempt	2025-03-12 19:50:00	192.168.1.12
ADMIN-LOG-2025-01bc81	\N	Edited invoice data	2025-03-13 20:00:00	192.168.1.13
ADMIN-LOG-2025-a1f5ef	\N	Updated security settings	2025-03-14 21:10:00	192.168.1.14
ADMIN-LOG-2025-030b9e	\N	Added new user	2025-03-15 22:20:00	192.168.1.15
ADMIN-LOG-2025-481478	\N	Uploaded sensitive document	2025-03-16 23:30:00	192.168.1.16
ADMIN-LOG-2025-011f18	\N	Deleted inventory record	2025-03-17 08:40:00	192.168.1.17
ADMIN-LOG-2025-f868df	\N	Updated purchase order	2025-03-18 09:50:00	192.168.1.18
ADMIN-LOG-2025-d0cac5	\N	Failed login attempt	2025-03-19 10:00:00	192.168.1.19
ADMIN-LOG-2025-5bfa25	\N	Exported financial data	2025-03-20 11:15:00	192.168.1.20
\.


--
-- Data for Name: business_partner_master; Type: TABLE DATA; Schema: admin; Owner: postgres
--

COPY admin.business_partner_master (partner_id, employee_id, vendor_code, customer_id, partner_name, category, contact_info) FROM stdin;
ADMIN-PARTNER-2025-0e9c21	\N	\N	\N	Kate Tan	Employee	09165824756
ADMIN-PARTNER-2025-bfafb2	\N	\N	\N	James Marticio	Employee	09123456789
ADMIN-PARTNER-2025-2d107b	\N	\N	\N	Robert Santiago	Employee	09187654321
ADMIN-PARTNER-2025-a51fd6	\N	\N	\N	Maria Lopez	Employee	09154321876
ADMIN-PARTNER-2025-2fb9b7	\N	\N	\N	David Cruz	Employee	09192837465
ADMIN-PARTNER-2025-df0278	\N	\N	\N	BioFlex Composites	Vendor	(312) 867-5309
ADMIN-PARTNER-2025-888eda	\N	\N	\N	BioGrade Metals	Vendor	(415) 293-8274
ADMIN-PARTNER-2025-10189b	\N	\N	\N	CryoBond Precision	Vendor	(646) 918-3742
ADMIN-PARTNER-2025-5eb68a	\N	\N	\N	DuraWell Pro Ltd.	Vendor	(702) 555-8291
ADMIN-PARTNER-2025-bf03cf	\N	\N	\N	MedicalTradingCorps	Vendor	(818) 320-4657
ADMIN-PARTNER-2025-5e2618	\N	\N	\N	MediCore Materials Inc.	Vendor	(213) 555-0184
ADMIN-PARTNER-2025-934fa8	\N	\N	\N	NeoCarewell Industries Ltd.	Vendor	(415) 678-9012
ADMIN-PARTNER-2025-a001e3	\N	\N	\N	PharmaTools Ltd.	Vendor	(646) 555-4321
ADMIN-PARTNER-2025-fbf64c	\N	\N	\N	PureForm Medical	Vendor	(702) 123-4567
ADMIN-PARTNER-2025-9bdd35	\N	\N	\N	Sterilite Components	Vendor	(818) 876-5432
ADMIN-PARTNER-2025-96fe86	\N	\N	\N	MediTech Solutions Inc.	Customer	contact@meditechph.com
ADMIN-PARTNER-2025-362493	\N	\N	\N	PhilCare Medical Supplies	Customer	info@philcaremed.com
ADMIN-PARTNER-2025-c04a32	\N	\N	\N	LifeLine Diagnostics	Customer	support@lifelinediag.com
ADMIN-PARTNER-2025-7bf33f	\N	\N	\N	BioPharm Innovations	Customer	sales@biopharmph.com
ADMIN-PARTNER-2025-7c39e3	\N	\N	\N	Wellness Pharma Corp.	Customer	contact@wellnesspharma.com
ADMIN-PARTNER-2025-bf0a9c	\N	\N	SALES-CUST-2025-a69232	St. Luke's Medical Center	Customer	+63-2-8723-0101
ADMIN-PARTNER-2025-bb4208	\N	\N	SALES-CUST-2025-6e52b0	Makati Medical Center	Customer	+63-2-8888-9999
ADMIN-PARTNER-2025-ec82df	\N	\N	SALES-CUST-2025-cd3925	The Medical City	Customer	+63-2-8639-2000
ADMIN-PARTNER-2025-a64113	\N	\N	SALES-CUST-2025-12765a	Asian Hospital and Medical Center	Customer	+63-2-8771-9000
ADMIN-PARTNER-2025-e0ed39	\N	\N	SALES-CUST-2025-12ab0e	Philippine General Hospital	Customer	+63-2-8554-8400
ADMIN-PARTNER-2025-b892ae	\N	\N	SALES-CUST-2025-16e575	Manila Doctors Hospital	Customer	+63-2-8558-0888
ADMIN-PARTNER-2025-1ab567	\N	\N	SALES-CUST-2025-72570c	Cardinal Santos Medical Center	Customer	+63-2-8727-0001
ADMIN-PARTNER-2025-dc8622	\N	\N	SALES-CUST-2025-78f344	World Citi Medical Center	Customer	+63-2-8913-8380
ADMIN-PARTNER-2025-aaa05a	\N	\N	SALES-CUST-2025-868810	Davao Doctors Hospital	Customer	+63-82-222-8000
ADMIN-PARTNER-2025-d2555e	\N	\N	SALES-CUST-2025-4ff5f8	Cebu Doctors University Hospital	Customer	+63-32-255-5555
ADMIN-PARTNER-2025-ca6128	\N	\N	SALES-CUST-2025-1fc7a8	Metro Manila Medical Center	Customer	+63-2-8711-4141
ADMIN-PARTNER-2025-e820cf	\N	\N	SALES-CUST-2025-290d05	East Avenue Medical Center	Customer	+63-2-8928-0611
ADMIN-PARTNER-2025-e20486	\N	\N	SALES-CUST-2025-8151a1	Capitol Medical Center	Customer	+63-2-8372-3825
ADMIN-PARTNER-2025-048e24	\N	\N	SALES-CUST-2025-9594b6	Ospital ng Makati	Customer	+63-2-8828-8443
ADMIN-PARTNER-2025-52a74d	\N	\N	SALES-CUST-2025-be5085	Lung Center of the Philippines	Customer	+63-2-8924-6101
ADMIN-PARTNER-2025-f2d6e6	\N	\N	SALES-CUST-2025-673faf	National Kidney and Transplant Institute	Customer	+63-2-8981-0300
ADMIN-PARTNER-2025-4acaea	\N	\N	SALES-CUST-2025-0a646e	Rizal Medical Center	Customer	+63-2-8941-2911
ADMIN-PARTNER-2025-c08b60	\N	\N	SALES-CUST-2025-67e405	Quirino Memorial Medical Center	Customer	+63-2-8913-7890
ADMIN-PARTNER-2025-177300	\N	\N	SALES-CUST-2025-63b81d	Jose R. Reyes Memorial Medical Center	Customer	+63-2-8731-3229
ADMIN-PARTNER-2025-c5758e	\N	\N	SALES-CUST-2025-8b435b	Perpetual Help Medical Center	Customer	+63-2-8871-0639
\.


--
-- Data for Name: currency; Type: TABLE DATA; Schema: admin; Owner: postgres
--

COPY admin.currency (currency_id, currency_name, exchange_rate, valid_from, valid_to) FROM stdin;
ADMIN-CUR-2025-86217e	Philippine Peso	1.000000	2025-04-01	\N
ADMIN-CUR-2025-6e4784	US Dollar	0.017500	2025-04-01	\N
ADMIN-CUR-2025-2cdcfb	Euro	0.016260	2025-04-01	\N
ADMIN-CUR-2025-716f81	British Pound	0.013930	2025-04-01	\N
ADMIN-CUR-2025-7327c5	Japanese Yen	0.002650	2025-04-01	\N
ADMIN-CUR-2025-60e106	Canadian Dollar	0.023940	2025-04-01	\N
ADMIN-CUR-2025-898493	Australian Dollar	0.026380	2025-04-01	\N
ADMIN-CUR-2025-11afb1	Swiss Franc	0.015570	2025-04-01	\N
ADMIN-CUR-2025-ad21cf	Chinese Yuan	0.127400	2025-04-01	\N
ADMIN-CUR-2025-6a33c7	Hong Kong Dollar	0.128500	2025-04-01	\N
ADMIN-CUR-2025-d15852	Singapore Dollar	0.023740	2025-04-01	\N
ADMIN-CUR-2025-8bbeec	South Korean Won	0.000750	2025-04-01	\N
ADMIN-CUR-2025-246788	United Arab Emirates Dirham	0.004760	2025-04-01	\N
ADMIN-CUR-2025-ddbc41	Saudi Riyal	0.004690	2025-04-01	\N
ADMIN-CUR-2025-4bbac1	Thai Baht	0.027820	2025-04-01	\N
ADMIN-CUR-2025-847e6c	Vietnamese Dong	0.000044	2025-04-01	\N
ADMIN-CUR-2025-749c3b	Indonesian Rupiah	0.000064	2025-04-01	\N
ADMIN-CUR-2025-f74ecf	Indian Rupee	0.013500	2025-04-01	\N
ADMIN-CUR-2025-2d2d06	Malaysian Ringgit	0.023400	2025-04-01	\N
ADMIN-CUR-2025-949082	New Zealand Dollar	0.028800	2025-04-01	\N
\.


--
-- Data for Name: item_master_data; Type: TABLE DATA; Schema: admin; Owner: postgres
--

COPY admin.item_master_data (item_id, asset_id, product_id, material_id, item_name, item_type, unit_of_measure, item_status, manage_item_by, preferred_vendor, purchasing_uom, items_per_purchase_unit, purchase_quantity_per_package, sales_uom, items_per_sale_unit, sales_quantity_per_package) FROM stdin;
ADMIN-ITEM-2025-601e39	\N	\N	ADMIN-MATERIAL-2025-30318d	AI Driven Electronics Component	Raw Material	set	Active	None	\N	set	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-6c2ab5	\N	\N	ADMIN-MATERIAL-2025-997915	Casing	Raw Material	pcs	Active	None	\N	pcs	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-7fce9b	\N	\N	ADMIN-MATERIAL-2025-e6013c	Chambers	Raw Material	unit	Active	None	\N	unit	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-f264ff	\N	\N	ADMIN-MATERIAL-2025-b1a646	Clamps	Raw Material	pcs	Active	None	\N	pcs	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-221d76	\N	\N	ADMIN-MATERIAL-2025-4f44e9	Coatings	Raw Material	pcs	Active	None	\N	pcs	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-d0b2d5	\N	\N	ADMIN-MATERIAL-2025-d868b8	Heating and Drying System	Raw Material	unit	Active	None	\N	unit	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-a647ea	\N	\N	ADMIN-MATERIAL-2025-5435cf	Polycarbonate	Raw Material	kg	Active	None	\N	kg	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-3509d8	\N	\N	ADMIN-MATERIAL-2025-688041	Polyethylene	Raw Material	kg	Active	None	\N	kg	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-7bc371	\N	\N	ADMIN-MATERIAL-2025-87de7a	Power System	Raw Material	unit	Active	None	\N	unit	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-c3662b	\N	\N	ADMIN-MATERIAL-2025-3b6578	Pump	Raw Material	pcs	Active	None	\N	pcs	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-1cf839	\N	\N	ADMIN-MATERIAL-2025-714457	Purification Media	Raw Material	kg	Active	None	\N	kg	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-af01e8	\N	\N	ADMIN-MATERIAL-2025-1093e8	Sensors	Raw Material	pcs	Active	None	\N	pcs	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-1f86e1	\N	\N	ADMIN-MATERIAL-2025-8cda35	Structural Frame & Casing	Raw Material	set	Active	None	\N	set	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-91a53a	\N	\N	ADMIN-MATERIAL-2025-ab2fb1	Suction	Raw Material	pcs	Active	None	\N	pcs	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-0911be	\N	\N	ADMIN-MATERIAL-2025-c093d1	Ultrasound Transducer	Raw Material	unit	Active	None	\N	unit	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-ea5c03	\N	\N	ADMIN-MATERIAL-2025-7931a1	Acrylic	Raw Material	kg	Active	None	\N	kg	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-6df67c	\N	\N	ADMIN-MATERIAL-2025-c2e5a6	Acrylonitrile Butadiene Styrene (ABS)	Raw Material	pcs	Active	None	\N	pcs	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-283ee9	\N	\N	ADMIN-MATERIAL-2025-780688	Airflow Components	Raw Material	set	Active	None	\N	set	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-4c9f90	\N	\N	ADMIN-MATERIAL-2025-636733	Aluminum	Raw Material	kg	Active	None	\N	kg	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-620100	\N	\N	ADMIN-MATERIAL-2025-46b5ce	Aluminum Alloys	Raw Material	set	Active	None	\N	set	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-7c0cfa	\N	\N	ADMIN-MATERIAL-2025-975cf4	Anesthetic Delivery System	Raw Material	set	Active	None	\N	set	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-731436	\N	\N	ADMIN-MATERIAL-2025-2ff914	Bacterial Filters	Raw Material	pcs	Active	None	\N	pcs	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-8d2068	\N	\N	ADMIN-MATERIAL-2025-303aab	Battery	Raw Material	pcs	Active	None	\N	pcs	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-cb0916	\N	\N	ADMIN-MATERIAL-2025-242eb3	Borosilicate Glass	Raw Material	kg	Active	None	\N	kg	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-303bf9	\N	\N	ADMIN-MATERIAL-2025-ed11fc	Buffering Agent	Raw Material	kg	Active	None	\N	kg	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-3d0852	\N	\N	ADMIN-MATERIAL-2025-98a502	Buttons	Raw Material	pcs	Active	None	\N	pcs	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-350195	\N	\N	ADMIN-MATERIAL-2025-fed9ef	Cables	Raw Material	mm	Active	None	\N	mm	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-227599	\N	\N	ADMIN-MATERIAL-2025-d47a80	Canister Body	Raw Material	pcs	Active	None	\N	pcs	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-77fc08	\N	\N	ADMIN-MATERIAL-2025-16d4e2	Capacitors	Raw Material	pcs	Active	None	\N	pcs	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-51e1e9	\N	\N	ADMIN-MATERIAL-2025-1f38a4	Capnography Sensor	Raw Material	kg	Active	None	\N	kg	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-874686	ADMIN-ASSET-2025-90d673	\N	\N	Laptop - Dell XPS 15	Asset	\N	Active	Serial Number	\N	\N	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-488d96	ADMIN-ASSET-2025-0b237b	\N	\N	Office Chair - Ergonomic	Asset	\N	Active	Serial Number	\N	\N	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-d8d094	ADMIN-ASSET-2025-f05b07	\N	\N	Printer - HP LaserJet Pro	Asset	\N	Active	Serial Number	\N	\N	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-faa49b	ADMIN-ASSET-2025-ff6033	\N	\N	Projector - Epson X500	Asset	\N	Active	Serial Number	\N	\N	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-7f4f6f	ADMIN-ASSET-2025-b2c02b	\N	\N	Desk - Wooden Executive	Asset	\N	Active	Serial Number	\N	\N	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-a544ed	ADMIN-ASSET-2025-ddc1b8	\N	\N	Monitor - LG UltraWide	Asset	\N	Active	Serial Number	\N	\N	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-794f46	ADMIN-ASSET-2025-6c21b4	\N	\N	Keyboard - Mechanical RGB	Asset	\N	Active	Serial Number	\N	\N	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-581924	ADMIN-ASSET-2025-c53100	\N	\N	Mouse - Logitech MX Master 3	Asset	\N	Active	Serial Number	\N	\N	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-d414a5	ADMIN-ASSET-2025-324416	\N	\N	External Hard Drive - 2TB	Asset	\N	Active	Serial Number	\N	\N	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-ebb0e8	ADMIN-ASSET-2025-53b631	\N	\N	Conference Speaker - Jabra Speak 750	Asset	\N	Active	Serial Number	\N	\N	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-4fa0da	ADMIN-ASSET-2025-dd68b9	\N	\N	Tablet - iPad Pro	Asset	\N	Active	Serial Number	\N	\N	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-5ec77c	ADMIN-ASSET-2025-5ea4c2	\N	\N	Smartphone - Samsung Galaxy S24	Asset	\N	Active	Serial Number	\N	\N	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-aab79e	ADMIN-ASSET-2025-71b212	\N	\N	Scanner - Canon imageFORMULA	Asset	\N	Active	Serial Number	\N	\N	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-3822bd	ADMIN-ASSET-2025-6929da	\N	\N	Router - Cisco RV340	Asset	\N	Active	Serial Number	\N	\N	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-a98064	ADMIN-ASSET-2025-77c8f2	\N	\N	Filing Cabinet - Steel 4-Drawer	Asset	\N	Active	Serial Number	\N	\N	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-c80285	ADMIN-ASSET-2025-09de5f	\N	\N	Webcam - Logitech Brio	Asset	\N	Active	Serial Number	\N	\N	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-1a9358	ADMIN-ASSET-2025-7a5a6e	\N	\N	Whiteboard - Magnetic	Asset	\N	Active	Serial Number	\N	\N	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-9f7253	ADMIN-ASSET-2025-144a0c	\N	\N	Speaker System - Bose Companion	Asset	\N	Active	Serial Number	\N	\N	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-06d3a0	ADMIN-ASSET-2025-32b480	\N	\N	UPS - APC Smart-UPS	Asset	\N	Active	Serial Number	\N	\N	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-07e0bc	ADMIN-ASSET-2025-7f3745	\N	\N	Air Purifier - Dyson Pure Cool	Asset	\N	Active	Serial Number	\N	\N	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-cfb21a	\N	ADMIN-PROD-2025-d1d28f	\N	A9	Product	set	Active	Batches	\N	\N	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-ba9465	\N	ADMIN-PROD-2025-451316	\N	AirStart10	Product	pcs	Active	Batches	\N	\N	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-a05aae	\N	ADMIN-PROD-2025-c676ee	\N	B2 Infant Incubator	Product	set	Active	Batches	\N	\N	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-95d435	\N	ADMIN-PROD-2025-ab43a3	\N	B3 Neonatal Incubator	Product	set	Active	Batches	\N	\N	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-f087d5	\N	ADMIN-PROD-2025-42859a	\N	B8/B6 Neonatal Incubator	Product	set	Active	Batches	\N	\N	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-4e8973	\N	ADMIN-PROD-2025-279e71	\N	BeneFusion 5 Series	Product	set	Active	Batches	\N	\N	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-205269	\N	ADMIN-PROD-2025-fcf095	\N	BeneFusion e Series	Product	set	Active	Batches	\N	\N	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-93bb5c	\N	ADMIN-PROD-2025-0e8d5d	\N	BeneFusion n Series	Product	set	Active	Batches	\N	\N	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-1c0211	\N	ADMIN-PROD-2025-88bc68	\N	BeneHeart AED C2 and D1 PRO	Product	set	Active	Batches	\N	\N	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-3a41de	\N	ADMIN-PROD-2025-126bfc	\N	BeneHeart D3	Product	pcs	Active	Batches	\N	\N	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-dee5ea	\N	ADMIN-PROD-2025-9b3fcc	\N	BeneHeart D6	Product	pcs	Active	Batches	\N	\N	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-a3d635	\N	ADMIN-PROD-2025-14a1f6	\N	BeneHeart R12	Product	pcs	Active	Batches	\N	\N	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-1c9605	\N	ADMIN-PROD-2025-09cd4c	\N	BeneHeart R3	Product	pcs	Active	Batches	\N	\N	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-f2e5f8	\N	ADMIN-PROD-2025-832b17	\N	BeneVision CMS	Product	pcs	Active	Batches	\N	\N	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-132d33	\N	ADMIN-PROD-2025-495de1	\N	BeneVision N Series	Product	set	Active	Batches	\N	\N	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-e60ea0	\N	ADMIN-PROD-2025-69b24a	\N	BeneVision N1	Product	set	Active	Batches	\N	\N	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-3989ee	\N	ADMIN-PROD-2025-f2d420	\N	BL70 Infant Phototherapy Equipment	Product	pcs	Active	Batches	\N	\N	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-096bd8	\N	ADMIN-PROD-2025-5e91ee	\N	BQ80 Infant Radiant Warmer	Product	set	Active	Batches	\N	\N	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-fea71d	\N	ADMIN-PROD-2025-b74a90	\N	EMMA Capnograph	Product	pcs	Active	Batches	\N	\N	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-806154	\N	ADMIN-PROD-2025-6f64c1	\N	ePM Series	Product	set	Active	Batches	\N	\N	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-545798	\N	ADMIN-PROD-2025-abdb73	\N	HyBase 3000	Product	set	Active	Batches	\N	\N	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-382e29	\N	ADMIN-PROD-2025-c4eadf	\N	HyBase 6100/6100 PLUS	Product	set	Active	Batches	\N	\N	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-1e6cf0	\N	ADMIN-PROD-2025-af5a62	\N	HyBase V8/V8 Classic	Product	set	Active	Batches	\N	\N	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-0788af	\N	ADMIN-PROD-2025-6cf90c	\N	HyBase V9	Product	set	Active	Batches	\N	\N	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-8e298d	\N	ADMIN-PROD-2025-4a8582	\N	HyLED 200 M	Product	pcs	Active	Batches	\N	\N	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-1aec32	\N	ADMIN-PROD-2025-fb8af3	\N	HyLED 600	Product	pcs	Active	Batches	\N	\N	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-70bf9b	\N	ADMIN-PROD-2025-d8547c	\N	HyLED 600M	Product	pcs	Active	Batches	\N	\N	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-141ffd	\N	ADMIN-PROD-2025-aea873	\N	HyLED 7 Series	Product	set	Active	Batches	\N	\N	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-1e9394	\N	ADMIN-PROD-2025-b68e92	\N	HyLED 760	Product	set	Active	Batches	\N	\N	\N	\N	\N	\N	\N
ADMIN-ITEM-2025-016599	\N	ADMIN-PROD-2025-2d990a	\N	HyLED 760M	Product	pcs	Active	Batches	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: admin; Owner: postgres
--

COPY admin.notifications (notifications_id, to_user_id, message, notifications_status, created_at) FROM stdin;
\.


--
-- Data for Name: policies; Type: TABLE DATA; Schema: admin; Owner: postgres
--

COPY admin.policies (policy_id, policy_name, description, effective_date, status) FROM stdin;
ADMIN-POLICY-2025-7b7357	Equal Employment Opportunity	Ensures fair treatment and prohibits discrimination in the workplace.	2025-04-01	Active
ADMIN-POLICY-2025-c3e3b4	Policy Against Workplace Harassment	Prohibits harassment and provides reporting and resolution procedures.	2025-04-01	Active
ADMIN-POLICY-2025-0a9e1c	Hiring and Onboarding Procedures	Details the recruitment, hiring, and onboarding process.	2025-04-01	Active
ADMIN-POLICY-2025-468810	Hours of Work, Attendance, and Punctuality	Establishes work schedules and attendance requirements.	2025-04-01	Active
ADMIN-POLICY-2025-dd3ba5	Overtime Policy	Outlines overtime compensation for eligible employees.	2025-04-01	Active
ADMIN-POLICY-2025-ad743b	Position Description and Salary Administration	Defines job descriptions, salary ranges, and pay schedules.	2025-04-01	Active
ADMIN-POLICY-2025-de6843	Health/Life Insurance Policy	Provides individual health and dental insurance for eligible employees.	2025-04-01	Active
ADMIN-POLICY-2025-90b064	Retirement and Tax Deferred Annuity Plan	Outlines employee retirement benefits and annuity options.	2025-04-01	Active
ADMIN-POLICY-2025-49de30	Leave Benefits Policy	Details vacation, sick leave, personal, bereavement, and extended leave benefits.	2025-04-01	Active
ADMIN-POLICY-2025-99ac0c	Maternity and Paternity Leave Policy	Provides guidelines for maternity, paternity, and parental leave.	2025-04-01	Active
ADMIN-POLICY-2025-cfc335	Separation Policy	Outlines the process for resignation, termination, and layoffs.	2025-04-01	Active
ADMIN-POLICY-2025-500665	Return of Property Policy	Requires employees to return company property upon separation.	2025-04-01	Active
ADMIN-POLICY-2025-613769	Personnel Records Policy	Governs the maintenance and confidentiality of personnel records.	2025-04-01	Active
ADMIN-POLICY-2025-15030b	Non-Disclosure of Confidential Information	Protects confidential company and customer information.	2025-04-01	Active
ADMIN-POLICY-2025-bf41ec	Computer and Information Security	Defines IT security protocols for system and data protection.	2025-04-01	Active
ADMIN-POLICY-2025-15e2e7	Internet Acceptable Use Policy	Regulates internet use to ensure compliance and professionalism.	2025-04-01	Active
ADMIN-POLICY-2025-2f7724	Accounting Standards Policy	Adheres to GAAP or IFRS for financial reporting.	2025-04-01	Active
ADMIN-POLICY-2025-c2422e	Detailed Accounting Procedures	Outlines financial controls including petty cash and fund disbursements.	2025-04-01	Active
ADMIN-POLICY-2025-19c966	Corporate Credit Card Policy	Regulates use of corporate credit cards for business expenses.	2025-04-01	Active
ADMIN-POLICY-2025-e5145f	Travel and Reimbursement Policy	Defines rules for employee travel and expense reimbursement.	2025-04-01	Active
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: admin; Owner: postgres
--

COPY admin.products (product_id, product_name, description, selling_price, stock_level, unit_of_measure, batch_no, item_status, warranty_period, policy_id, content_id) FROM stdin;
ADMIN-PROD-2025-d1d28f	A9	Used for critical patient or longer surgery, close-loop anesthesia.	47726.64	631	set	BN-20240331	Active	12	\N	\N
ADMIN-PROD-2025-451316	AirStart10	CPAP therapy device for sleep apnea treatment.	10951.20	443	pcs	BN-20240331	Active	12	\N	\N
ADMIN-PROD-2025-c676ee	B2 Infant Incubator	Controlled environment for newborn care for optimal temperature and humidity.	1114666.00	540	set	BN-20240331	Active	12	\N	\N
ADMIN-PROD-2025-ab43a3	B3 Neonatal Incubator	Advanced life support system for premature infants, regulating vital parameters.	218400.00	599	set	BN-20240331	Active	12	\N	\N
ADMIN-PROD-2025-42859a	B8/B6 Neonatal Incubator	Intensive care unit for critically ill newborns, providing advanced monitoring and treatment capabilities.	249756.00	693	set	BN-20240331	Active	12	\N	\N
ADMIN-PROD-2025-279e71	BeneFusion 5 Series	Infusion pumps for precise medication and fluid delivery.	135266.04	496	set	BN-20240331	Active	12	\N	\N
ADMIN-PROD-2025-fcf095	BeneFusion e Series	Advanced infusion systems with smart features for enhanced safety.	128700.00	331	set	BN-20240331	Active	12	\N	\N
ADMIN-PROD-2025-0e8d5d	BeneFusion n Series	Portable infusion pumps for ambulatory patient care.	128700.00	554	set	BN-20240331	Active	12	\N	\N
ADMIN-PROD-2025-88bc68	BeneHeart AED C2 and D1 PRO	Automated external defibrillators for emergency cardiac resuscitation.	259543.44	407	set	BN-20240331	Active	12	\N	\N
ADMIN-PROD-2025-126bfc	BeneHeart D3	Professional defibrillator monitor for cardiac resuscitation and patient monitoring.	218673.00	585	pcs	BN-20240331	Active	12	\N	\N
ADMIN-PROD-2025-9b3fcc	BeneHeart D6	Portable defibrillator monitor with advanced monitoring capabilities.	3954.60	400	pcs	BN-20240331	Active	12	\N	\N
ADMIN-PROD-2025-14a1f6	BeneHeart R12	Electrocardiograph (ECG) device for cardiac diagnostic testing.	3954.60	636	pcs	BN-20240331	Active	12	\N	\N
ADMIN-PROD-2025-09cd4c	BeneHeart R3	Compact electrocardiograph for routine ECG measurements.	3954.60	366	pcs	BN-20240331	Active	12	\N	\N
ADMIN-PROD-2025-832b17	BeneVision CMS	Central monitoring system for patient data management.	3954.60	492	pcs	BN-20240331	Active	12	\N	\N
ADMIN-PROD-2025-495de1	BeneVision N Series	Patient monitors providing comprehensive physiological measurements.	3954.60	421	set	BN-20240331	Active	12	\N	\N
ADMIN-PROD-2025-69b24a	BeneVision N1	Portable patient monitor for continuous vital signs monitoring.	3954.60	613	set	BN-20240331	Active	12	\N	\N
ADMIN-PROD-2025-f2d420	BL70 Infant Phototherapy Equipment	Light therapy device for treating neonatal jaundice.	6076.20	557	pcs	BN-20240331	Active	12	\N	\N
ADMIN-PROD-2025-5e91ee	BQ80 Infant Radiant Warmer	Radiant heat source for maintaining newborn body temperature.	10756.20	508	set	BN-20240331	Active	12	\N	\N
ADMIN-PROD-2025-b74a90	EMMA Capnograph	Device for measuring carbon dioxide levels in exhaled breath.	3900.00	511	pcs	BN-20240331	Active	12	\N	\N
ADMIN-PROD-2025-6f64c1	ePM Series	Patient monitors for vital signs measurement and display.	2457.00	597	set	BN-20240331	Active	12	\N	\N
ADMIN-PROD-2025-abdb73	HyBase 3000	Operating table for surgical procedures.	32104.80	372	set	BN-20240331	Active	12	\N	\N
ADMIN-PROD-2025-c4eadf	HyBase 6100/6100 PLUS	Advanced operating tables with specialized features.	33290.40	424	set	BN-20240331	Active	12	\N	\N
ADMIN-PROD-2025-af5a62	HyBase V8/V8 Classic	Versatile operating tables for various surgical specialties.	33290.40	642	set	BN-20240331	Active	12	\N	\N
ADMIN-PROD-2025-6cf90c	HyBase V9	High-end operating table with advanced positioning capabilities.	33290.40	439	set	BN-20240331	Active	12	\N	\N
ADMIN-PROD-2025-4a8582	HyLED 200 M	Surgical light for operating room illumination.	834.60	380	pcs	BN-20240331	Active	12	\N	\N
ADMIN-PROD-2025-fb8af3	HyLED 600	High-performance surgical light with adjustable settings.	834.60	606	pcs	BN-20240331	Active	12	\N	\N
ADMIN-PROD-2025-d8547c	HyLED 600M	Mobile surgical light for flexible use.	780.00	619	pcs	BN-20240331	Active	12	\N	\N
ADMIN-PROD-2025-aea873	HyLED 7 Series	Advanced surgical lights with optimal illumination and control.	1872.00	453	set	BN-20240331	Active	12	\N	\N
ADMIN-PROD-2025-b68e92	HyLED 760	High-quality surgical light with excellent light output.	1872.00	580	set	BN-20240331	Active	12	\N	\N
ADMIN-PROD-2025-2d990a	HyLED 760M	Mobile version of HyLED 760 surgical light.	5616.00	384	pcs	BN-20240331	Active	12	\N	\N
\.


--
-- Data for Name: raw_materials; Type: TABLE DATA; Schema: admin; Owner: postgres
--

COPY admin.raw_materials (material_id, material_name, description, unit_of_measure, cost_per_unit, vendor_code) FROM stdin;
ADMIN-MATERIAL-2025-30318d	AI Driven Electronics Component	A durable, shatter-resistant plastic for medical enclosures.	set	3600.00	\N
ADMIN-MATERIAL-2025-997915	Casing	Outer shell, made of plastic or metal.	pcs	1900.00	\N
ADMIN-MATERIAL-2025-e6013c	Chambers	A scintillation material used in X-ray detectors for imaging.	unit	5198.00	\N
ADMIN-MATERIAL-2025-b1a646	Clamps	Enclosed spaces within medical devices that regulate gas or fluid flow.	pcs	70.00	\N
ADMIN-MATERIAL-2025-4f44e9	Coatings	Fasteners that secure tubing, wires, or components in place.	pcs	1055.00	\N
ADMIN-MATERIAL-2025-d868b8	Heating and Drying System	A highly conductive metal used in electronic circuits and medical sensors.	unit	8500.00	\N
ADMIN-MATERIAL-2025-5435cf	Polycarbonate	Durable plastic used in eyewear and medical devices.	kg	549.00	\N
ADMIN-MATERIAL-2025-688041	Polyethylene	A flexible plastic used in medical tubing and packaging.	kg	55.00	\N
ADMIN-MATERIAL-2025-87de7a	Power System	Components for generating, storing, and distributing electrical power.	unit	1480.00	\N
ADMIN-MATERIAL-2025-3b6578	Pump	A device that moves fluids or gases in medical applications.	pcs	16600.00	\N
ADMIN-MATERIAL-2025-714457	Purification Media	Materials that filter and remove impurities in medical applications.	kg	140.00	\N
ADMIN-MATERIAL-2025-1093e8	Sensors	Detect physical properties and convert them into signals.	pcs	4500.00	\N
ADMIN-MATERIAL-2025-8cda35	Structural Frame & Casing	The main framework and enclosure of medical equipment.	set	2500.00	\N
ADMIN-MATERIAL-2025-ab2fb1	Suction	A process that removes fluids or gases using negative pressure.	pcs	399.00	\N
ADMIN-MATERIAL-2025-c093d1	Ultrasound Transducer	A sensor that converts electricity into ultrasound for diagnostics.	unit	27800.00	\N
ADMIN-MATERIAL-2025-7931a1	Acrylic	A clear, durable plastic used in optics, and displays.	kg	200.00	\N
ADMIN-MATERIAL-2025-c2e5a6	Acrylonitrile Butadiene Styrene (ABS)	Tough plastic used in consumer products, electronics, and medical devices.	pcs	90.00	\N
ADMIN-MATERIAL-2025-780688	Airflow Components	Measure air movement, used in HVAC and respiratory devices.	set	1250.00	\N
ADMIN-MATERIAL-2025-636733	Aluminum	A metal used in frames and casings.	kg	250.00	\N
ADMIN-MATERIAL-2025-46b5ce	Aluminum Alloys	Aluminum mixed with other metals for improved strength and resistance.	set	2500.00	\N
ADMIN-MATERIAL-2025-975cf4	Anesthetic Delivery System	System for safely delivering anesthetics to patients.	set	450000.00	\N
ADMIN-MATERIAL-2025-2ff914	Bacterial Filters	Traps and removes bacteria from air.	pcs	500.00	\N
ADMIN-MATERIAL-2025-303aab	Battery	Power source that stores and releases electrical energy.	pcs	18900.00	\N
ADMIN-MATERIAL-2025-242eb3	Borosilicate Glass	A power source of medical device, rechargeable or disposable.	kg	60.00	\N
ADMIN-MATERIAL-2025-ed11fc	Buffering Agent	Substance that stabilizes pH, used in biological and chemical applications.	kg	1000.00	\N
ADMIN-MATERIAL-2025-98a502	Buttons	Switches that initiate controls in devices.	pcs	400.00	\N
ADMIN-MATERIAL-2025-fed9ef	Cables	Transmit electrical signals or power between components.	mm	1000.00	\N
ADMIN-MATERIAL-2025-d47a80	Canister Body	Electrical wiring used to connect and transmit signals between components.	pcs	703.00	\N
ADMIN-MATERIAL-2025-16d4e2	Capacitors	Store and release electrical energy to filter signals.	pcs	95.00	\N
ADMIN-MATERIAL-2025-1f38a4	Capnography Sensor	A sensor used to monitor CO₂ levels in respiratory systems.	kg	100.00	\N
\.


--
-- Data for Name: roles_permission; Type: TABLE DATA; Schema: admin; Owner: postgres
--

COPY admin.roles_permission (role_id, role_name, description, permissions, access_level) FROM stdin;
ADMIN-ROLE-2025-1d2ed2	Chief Accountant	Oversees financial reporting and tax compliance.	Accounting, Finance	Full Access
ADMIN-ROLE-2025-a3b55d	Accounting Supervisor	Manages accounting staff and ensures accurate bookkeeping.	Accounting, Finance	Full Access
ADMIN-ROLE-2025-798350	Accounts Payable Specialist	Handles invoice payments and vendor reconciliations.	Accounting	Read-Only
ADMIN-ROLE-2025-6188de	Accounts Receivable Specialist	Manages customer invoicing and collections.	Accounting	Read-Only
ADMIN-ROLE-2025-e113d9	Payroll Officer	Prepares and processes payroll.	Payroll, Accounting	Full Access
ADMIN-ROLE-2025-ee5978	Bookkeeper	Maintains financial records and transactions.	Accounting	Read-Only
ADMIN-ROLE-2025-21ca4a	Financial Analyst	Conducts financial analysis and forecasting.	Finance, Accounting	Full Access
ADMIN-ROLE-2025-154c4f	Audit Officer	Performs internal audits and ensures regulatory compliance.	Audit, Finance	Full Access
ADMIN-ROLE-2025-5e07b4	Administrative Manager	Oversees office operations and support staff.	Administration	Full Access
ADMIN-ROLE-2025-47d908	Office Administrator	Provides clerical and administrative support.	Administration	Read-Only
ADMIN-ROLE-2025-5669fe	Data Entry Specialist	Inputs and maintains data records.	Administration	Read-Only
ADMIN-ROLE-2025-29c4b0	Receptionist	Manages front desk and visitor coordination.	Administration	Read-Only
ADMIN-ROLE-2025-70157c	Executive Assistant	Provides high-level administrative support to executives.	Administration, Management	Full Access
ADMIN-ROLE-2025-3f424e	Distribution Manager	Oversees distribution and logistics operations.	Distribution, Logistics	Full Access
ADMIN-ROLE-2025-cfbe21	Logistics Coordinator	Coordinates transportation and warehouse operations.	Logistics	Full Access
ADMIN-ROLE-2025-ca3e4e	Warehouse Supervisor	Supervises warehouse staff and inventory control.	Warehouse, Inventory	Full Access
ADMIN-ROLE-2025-88c5c7	Inventory Clerk	Maintains inventory records and stock levels.	Inventory	Read-Only
ADMIN-ROLE-2025-cfe321	Chief Financial Officer (CFO)	Leads financial planning and reporting.	Finance, Management	Full Access
ADMIN-ROLE-2025-b50663	HR Director	Oversees HR policies and employee relations.	Human Resources	Full Access
ADMIN-ROLE-2025-0f413e	Recruitment Officer	Manages recruitment and hiring processes.	Human Resources	Full Access
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: admin; Owner: postgres
--

COPY admin.users (user_id, employee_id, first_name, last_name, email, password, role_id, status, type, created_at, updated_at) FROM stdin;
ADMIN-USER-2025-ca0624	\N	Kate	Tan	katetan@kinetic.ph	Pass12345	\N	Active	Employee	2025-02-01 08:30:15	2025-02-10 12:45:30
ADMIN-USER-2025-92598c	\N	James	Marticio	jamesmarticio@kinetic.ph	Secure9876	\N	Active	Employee	2025-02-05 10:15:45	2025-02-15 14:20:10
ADMIN-USER-2025-778745	\N	Robert	Santiago	robertsantiago@kinetic.ph	Unique54321	\N	Active	Employee	2025-02-07 11:05:50	2025-02-18 16:30:20
ADMIN-USER-2025-cb3cc9	\N	Maria	Lopez	marialopez@kinetic.ph	SafeKey678	\N	Active	Employee	2025-02-09 13:25:40	2025-02-20 17:15:05
ADMIN-USER-2025-d175fc	\N	David	Cruz	davidcruz@kinetic.ph	RandomKey456	\N	Active	Employee	2025-02-12 09:50:30	2025-02-22 18:10:45
ADMIN-USER-2025-a6fbda	\N	Carla	Ramirez	carlaramirez@kinetic.ph	StrongPass789	\N	Active	Employee	2025-02-14 14:10:25	2025-02-25 19:20:30
ADMIN-USER-2025-53b07a	\N	Miguel	Narabal	miguelnarabal@kinetic.ph	AccessCode321	\N	Active	Employee	2025-02-17 08:40:20	2025-02-27 20:05:50
ADMIN-USER-2025-6e4d2e	\N	Angela	Tores	angelatores@kinetic.ph	Protect654	\N	Active	Employee	2025-02-19 15:55:10	2025-02-28 21:10:15
ADMIN-USER-2025-49ecff	\N	Henry	Vallespin	henryvallespin@kinetic.ph	Defend890	\N	Active	Employee	2025-02-21 10:30:35	2025-03-01 08:15:25
ADMIN-USER-2025-31e2a5	\N	Karen	Mendoza	karenmendoza@kinetic.ph	UltraSafe012	\N	Active	Employee	2025-02-23 12:05:55	2025-03-02 09:50:40
ADMIN-USER-2025-9cc3a8	\N	Daniel	Bautista	danielbautista@kinetic.ph	Daniel1234	\N	Active	Employee	2025-02-24 09:30:00	2025-03-03 11:00:00
ADMIN-USER-2025-fa22a5	\N	Sofia	Reyes	sofiareyes@kinetic.ph	Sofia5678	\N	Active	Employee	2025-02-25 10:15:00	2025-03-04 10:45:00
ADMIN-USER-2025-0babeb	\N	John	Dela Cruz	johndelacruz@kinetic.ph	John9012	\N	Active	Employee	2025-02-26 08:40:00	2025-03-05 09:50:00
ADMIN-USER-2025-32c5a5	\N	Michelle	Ken	michelleken@kinetic.ph	Michelle3456	\N	Active	Employee	2025-02-27 11:20:00	2025-03-06 12:30:00
ADMIN-USER-2025-f82d2f	\N	Paul	Hernandez	paulhernandez@kinetic.ph	Paul7890	\N	Active	Employee	2025-02-28 14:10:00	2025-03-07 13:15:00
ADMIN-USER-2025-05d2b4	\N	Emily	Gonzales	emilygonzales@kinetic.ph	Emily4321	\N	Active	Employee	2025-03-01 08:00:00	2025-03-08 09:05:00
ADMIN-USER-2025-7d644f	\N	Kevin	Ramirez	kevinramirez@kinetic.ph	Kevin6543	\N	Active	Employee	2025-03-02 09:45:00	2025-03-09 10:30:00
ADMIN-USER-2025-0f2132	\N	Patricia	Morales	patriciamorales@kinetic.ph	Patricia8765	\N	Active	Employee	2025-03-03 10:30:00	2025-03-10 11:50:00
ADMIN-USER-2025-2830cb	\N	Juan	Dela Cruz	juan.delacruz@kinetiq.ph	Juan1122	\N	Active	Employee	2025-03-04 11:15:00	2025-03-11 12:00:00
ADMIN-USER-2025-d97d24	\N	Maria	Santos	maria.santos@kinetiq.ph	Maria3344	\N	Active	Employee	2025-03-05 12:00:00	2025-03-12 13:00:00
ADMIN-USER-2025-e132bf	\N	Jose	Ramirez	jose.ramirez@kinetiq.ph	Jose5566	\N	Active	Employee	2025-03-06 09:20:00	2025-03-13 11:30:00
ADMIN-USER-2025-413752	\N	Ana	Mendoza	ana.mendoza@kinetiq.ph	Ana7788	\N	Active	Employee	2025-03-07 10:10:00	2025-03-14 12:15:00
ADMIN-USER-2025-3bb49f	\N	Mark	Villanueva	mark.villanueva@kinetiq.ph	Mark1122	\N	Active	Employee	2025-03-08 08:55:00	2025-03-15 10:50:00
ADMIN-USER-2025-8fb577	\N	Miguel	Fernandez	miguel.fernandez@kinetiq.ph	Miguel3344	\N	Active	Employee	2025-03-09 11:45:00	2025-03-16 12:25:00
ADMIN-USER-2025-eba014	\N	Daniel	Gonzales	daniel.gonzales@kinetiq.ph	Daniel5566	\N	Active	Employee	2025-03-10 09:35:00	2025-03-17 11:15:00
ADMIN-USER-2025-b312d4	\N	Carlo	Reyes	carlo.reyes@kinetiq.ph	Carlo7788	\N	Active	Employee	2025-03-11 10:25:00	2025-03-18 12:45:00
ADMIN-USER-2025-9757f0	\N	Sofia	Cruz	sofia.cruz@kinetiq.ph	Sofia9900	\N	Active	Employee	2025-03-12 08:15:00	2025-03-19 10:05:00
ADMIN-USER-2025-6bf15f	\N	Katrina	Lopez	katrina.lopez@kinetiq.ph	Katrina1122	\N	Active	Employee	2025-03-13 09:05:00	2025-03-20 11:55:00
ADMIN-USER-2025-ccb848	\N	Patrick	Fernandez	patrick.fernande@kinetiq.ph	Patrick3344	\N	Active	Employee	2025-03-14 10:50:00	2025-03-21 12:35:00
ADMIN-USER-2025-970d3c	\N	Andrea	Bautista	andrea.bautista@kinetiq.ph	Andrea5566	\N	Active	Employee	2025-03-15 08:25:00	2025-03-22 10:45:00
\.


--
-- Data for Name: vendor; Type: TABLE DATA; Schema: admin; Owner: postgres
--

COPY admin.vendor (vendor_code, application_reference, vendor_name, contact_person, status) FROM stdin;
ADMIN-VENDOR-2025-3069a0	\N	BioFlex Composites	Francisco Lopez	Active
ADMIN-VENDOR-2025-ba6c06	\N	BioGrade Metals	Benjamin Ramos	Active
ADMIN-VENDOR-2025-50c5b3	\N	CryoBond Precision	Kyla Villamor	Active
ADMIN-VENDOR-2025-acc693	\N	DuraWell Pro Ltd.	Mariel De Guzman	Active
ADMIN-VENDOR-2025-476f01	\N	MedicalTradingCorps	Juan Carlos Perez	Active
ADMIN-VENDOR-2025-69ae39	\N	MediCore Materials Inc.	Xzanelle Garcia	Active
ADMIN-VENDOR-2025-da9aa4	\N	NeoCarewell Industries Ltd.	Shaira Fernandez	Active
ADMIN-VENDOR-2025-73c992	\N	PharmaTools Ltd.	Andrew Enriquez	Active
ADMIN-VENDOR-2025-904f0e	\N	PureForm Medical	Jefferson Callanta	Active
ADMIN-VENDOR-2025-0b7186	\N	Sterilite Components	Luis Santos	Active
ADMIN-VENDOR-2025-b0c3e0	\N	SupplyLife Pty Ltd	Clyden Reyes	Active
ADMIN-VENDOR-2025-f09c87	\N	TheraMat Solutions	Michael Ocampo	Active
ADMIN-VENDOR-2025-528465	\N	UltraMed Alloys	Clemente Yambao	Active
ADMIN-VENDOR-2025-9bf65e	\N	VitalCore Tech	Ivan Hernandez	Active
ADMIN-VENDOR-2025-30f343	\N	Zenith BioCeramics	Carlito Macabe	Active
ADMIN-VENDOR-2025-b3b7d7	\N	ZenPlast Innovations	Wilson Guevarra	Active
\.


--
-- Data for Name: warehouse; Type: TABLE DATA; Schema: admin; Owner: postgres
--

COPY admin.warehouse (warehouse_id, warehouse_location, stored_materials) FROM stdin;
ADMIN-WARE-2025-c976bc	Manila	AI-Driven Electronic Components, Casing, Chambers
ADMIN-WARE-2025-33223d	Cebu	Clamps, Coatings, Heating & Drying System
ADMIN-WARE-2025-f1b4d4	Davao	Polycarbonate, Polyethylene, Power system
ADMIN-WARE-2025-fe6d8c	Quezon City	Pump, Purification Media, Sensors
ADMIN-WARE-2025-39d371	Pasig	Structural Frame & Casing, Suction, Ultrasound Transducer
ADMIN-WARE-2025-19f5e0	Makati	Acrylic, Acrylonitrile Butadiene Styrene (ABS), Airflow Components
ADMIN-WARE-2025-121c15	Taguig	Aluminum, Aluminum Alloys, Anesthetic Delivery System
ADMIN-WARE-2025-0ed240	Bacolod	Bacterial filters, Battery, Borosilicate Glass
ADMIN-WARE-2025-db2746	Iloilo	Buffering Agent, Buttons, Cables
ADMIN-WARE-2025-1bdc6d	Cagayan de Oro	Canister Body, Capacitors, Capnography Sensor
ADMIN-WARE-2025-ba325e	General Santos	AI-Driven Electronic Components, Polycarbonate, Sensors
ADMIN-WARE-2025-5d119d	Baguio	Casing, Battery, Borosilicate Glass
ADMIN-WARE-2025-47a7cc	Zamboanga	Power System, Suction, Clamps
ADMIN-WARE-2025-f81086	Batangas	Pump, Heating and Drying System, Airflow Components
ADMIN-WARE-2025-95c210	Cavite	Aluminum, Purification Media, Coatings
ADMIN-WARE-2025-49614c	Laguna	Polyethylene, Capacitors, Buttons
ADMIN-WARE-2025-138311	Pampanga	Acrylic, Structural Frame & Casing, Buffering Agent
ADMIN-WARE-2025-90047f	Tarlac	Chambers, Anesthetic Delivery System, Capnography Sensor
ADMIN-WARE-2025-d4331d	Naga	Filing Cabinet - Steel, Monitor - LG UltraWide, Whiteboard - Magnetic
ADMIN-WARE-2025-4d7afb	Dumaguete	UPS - APC Smart-UPS, Router - Cisco RV340, Logitech Brio Webcam
\.


--
-- Data for Name: billing_receipt; Type: TABLE DATA; Schema: distribution; Owner: postgres
--

COPY distribution.billing_receipt (billing_receipt_id, delivery_receipt_id, sales_invoice_id, service_billing_id, total_receipt) FROM stdin;
DIS-BR-2025-fa4eec	\N	\N	\N	100.50
DIS-BR-2025-e66aa9	\N	\N	\N	250.75
DIS-BR-2025-e4accf	\N	\N	\N	175.30
DIS-BR-2025-e1b6bb	\N	\N	\N	300.00
DIS-BR-2025-972272	\N	\N	\N	90.45
DIS-BR-2025-b58f39	\N	\N	\N	120.99
DIS-BR-2025-fcd8bc	\N	\N	\N	450.25
DIS-BR-2025-9eaa66	\N	\N	\N	210.60
DIS-BR-2025-b2e72d	\N	\N	\N	315.80
DIS-BR-2025-ffa9b7	\N	\N	\N	500.00
\.


--
-- Data for Name: carrier; Type: TABLE DATA; Schema: distribution; Owner: postgres
--

COPY distribution.carrier (carrier_id, carrier_name, service_type, carrier_count) FROM stdin;
DIS-CAR-2025-a5ba27	\N	Express	15
DIS-CAR-2025-9fbcd3	\N	Standard	25
DIS-CAR-2025-941081	\N	Same-day	10
DIS-CAR-2025-3e2a4b	\N	Express	18
DIS-CAR-2025-633532	\N	Standard	20
DIS-CAR-2025-1ee4ff	\N	Same-day	12
DIS-CAR-2025-bc10e4	\N	Express	22
DIS-CAR-2025-8fd05b	\N	Standard	17
DIS-CAR-2025-71bcb2	\N	Same-day	1
DIS-CAR-2025-4bd33b	\N	Express	30
\.


--
-- Data for Name: delivery_order; Type: TABLE DATA; Schema: distribution; Owner: postgres
--

COPY distribution.delivery_order (del_order_id, order_status, content_id, is_project_based, is_partial_delivery, service_order_id, stock_transfer_id, sales_order_id, approval_request_id, del_type) FROM stdin;
DIS-DO-2025-192b78	Approved	\N	Non-Project Based	No	\N	\N	\N	\N	Internal Delivery
DIS-DO-2025-ef1fc7	Approved	\N	Project Based	No	\N	\N	\N	\N	External Delivery
DIS-DO-2025-63ec85	Approved	\N	Non-Project Based	Yes	\N	\N	\N	\N	Internal Delivery
DIS-DO-2025-26b98e	Approved	\N	Project Based	No	\N	\N	\N	\N	Internal Delivery
DIS-DO-2025-46d526	Created	\N	Non-Project Based	No	\N	\N	\N	\N	Internal Delivery
DIS-DO-2025-dbef59	Approved	\N	Project Based	Yes	\N	\N	\N	\N	External Delivery
DIS-DO-2025-67d829	Rejected	\N	Non-Project Based	No	\N	\N	\N	\N	Internal Delivery
DIS-DO-2025-be40d4	Approved	\N	Project Based	Yes	\N	\N	\N	\N	Internal Delivery
DIS-DO-2025-760b52	Created	\N	Non-Project Based	No	\N	\N	\N	\N	Internal Delivery
DIS-DO-2025-ab0e84	Approved	\N	Project Based	No	\N	\N	\N	\N	External Delivery
\.


--
-- Data for Name: delivery_receipt; Type: TABLE DATA; Schema: distribution; Owner: postgres
--

COPY distribution.delivery_receipt (delivery_receipt_id, delivery_date, received_by, signature, receipt_status, shipment_id, total_amount) FROM stdin;
DIS-DR-2025-70a8e1	2023-01-19	\N	J. Williams	Received	\N	1500.00
DIS-DR-2025-c34369	2023-01-27	\N	T. Rogers	Received	\N	1200.00
DIS-DR-2025-ff3b33	2023-02-10	\N	L. Martinez	Received	\N	1800.00
DIS-DR-2025-d627f0	\N	\N	aaa7	Pending	\N	900.00
DIS-DR-2025-96d60f	\N	\N	aaa6	Pending	\N	800.00
DIS-DR-2025-c7f666	2023-03-16	\N	M. Johnson	Received	\N	1600.00
DIS-DR-2025-226451	2023-03-25	\N	S. Brown	Received	\N	1400.00
DIS-DR-2025-4e5e59	\N	\N	aaa3	Rejected	\N	0.00
DIS-DR-2025-b420ab	\N	\N	aaa2	Pending	\N	700.00
DIS-DR-2025-61ebba	\N	\N	aaa1	Rejected	\N	0.00
\.


--
-- Data for Name: failed_shipment; Type: TABLE DATA; Schema: distribution; Owner: postgres
--

COPY distribution.failed_shipment (failed_shipment_id, failure_date, failure_reason, resolution_status, shipment_id) FROM stdin;
DIS-FS-2025-6c5f93	\N	asqw	\N	\N
DIS-FS-2025-081ca0	\N	asqw8	\N	\N
DIS-FS-2025-3dae0c	\N	asqw7	\N	\N
DIS-FS-2025-5432dc	\N	asqw6	\N	\N
DIS-FS-2025-f99b24	\N	asqw5	\N	\N
DIS-FS-2025-86be47	\N	asqw4	\N	\N
DIS-FS-2025-a31e1e	\N	asqw3	\N	\N
DIS-FS-2025-8b758a	2023-04-06	Missing documentation	Pending	\N
DIS-FS-2025-123d04	\N	asqw1	\N	\N
DIS-FS-2025-fdf090	\N	asqw2	\N	\N
\.


--
-- Data for Name: goods_issue; Type: TABLE DATA; Schema: distribution; Owner: postgres
--

COPY distribution.goods_issue (goods_issue_id, issue_date, issued_by, billing_receipt_id) FROM stdin;
DIS-GI-2025-e66416	2023-01-19	\N	\N
DIS-GI-2025-dbeccd	2023-01-27	\N	\N
DIS-GI-2025-ee4a27	2023-02-10	\N	\N
DIS-GI-2025-c5499a	\N	\N	\N
DIS-GI-2025-1ab838	\N	\N	\N
DIS-GI-2025-d5e0c0	2023-03-16	\N	\N
DIS-GI-2025-411c6c	2023-03-25	\N	\N
DIS-GI-2025-f61e4a	\N	\N	\N
DIS-GI-2025-38c73c	\N	\N	\N
DIS-GI-2025-dc3c46	\N	\N	\N
\.


--
-- Data for Name: logistics_approval_request; Type: TABLE DATA; Schema: distribution; Owner: postgres
--

COPY distribution.logistics_approval_request (approval_request_id, request_date, approval_status, approval_date, approved_by, del_order_id) FROM stdin;
DIS-LOR-2025-ea28c7	2023-01-13	Approved	2023-01-14	\N	\N
DIS-LOR-2025-f1b7a7	2023-01-21	Approved	2023-01-22	\N	\N
DIS-LOR-2025-5f44a4	2023-02-06	Approved	2023-02-07	\N	\N
DIS-LOR-2025-7aa4e8	2023-02-19	Approved	2023-02-20	\N	\N
DIS-LOR-2025-c25274	2023-03-04	Pending	\N	\N	\N
DIS-LOR-2025-e7394d	2023-03-12	Approved	2023-03-13	\N	\N
DIS-LOR-2025-bcc270	2023-03-20	Rejected	2023-03-21	\N	\N
DIS-LOR-2025-98989a	2023-04-03	Approved	2023-04-04	\N	\N
DIS-LOR-2025-1315d8	2023-04-17	Pending	\N	\N	\N
DIS-LOR-2025-6801b3	2023-04-25	Approved	2023-04-26	\N	\N
\.


--
-- Data for Name: operational_cost; Type: TABLE DATA; Schema: distribution; Owner: postgres
--

COPY distribution.operational_cost (operational_cost_id, additional_cost, total_operational_cost, shipping_cost_id, packing_cost_id) FROM stdin;
DIS-OS-2025-ed7d01	50.00	350.00	\N	\N
DIS-OS-2025-704c96	75.00	650.00	\N	\N
DIS-OS-2025-aced17	60.00	400.00	\N	\N
DIS-OS-2025-c2935e	100.00	417.50	\N	\N
DIS-OS-2025-57be25	\N	\N	\N	\N
DIS-OS-2025-39acee	65.00	427.50	\N	\N
DIS-OS-2025-310983	\N	\N	\N	\N
DIS-OS-2025-0e94ca	45.00	367.50	\N	\N
DIS-OS-2025-fc4bbd	\N	\N	\N	\N
DIS-OS-2025-872757	\N	\N	\N	\N
\.


--
-- Data for Name: packing_cost; Type: TABLE DATA; Schema: distribution; Owner: postgres
--

COPY distribution.packing_cost (packing_cost_id, material_cost, labor_cost, total_packing_cost) FROM stdin;
DIS-PC-2025-f6987d	50.00	75.00	125.00
DIS-PC-2025-988348	75.00	100.00	175.00
DIS-PC-2025-d1e3d4	60.00	90.00	150.00
DIS-PC-2025-6c93dd	100.00	120.00	220.00
DIS-PC-2025-354a56	80.00	95.00	175.00
DIS-PC-2025-8a9a34	55.00	85.00	140.00
DIS-PC-2025-2bf78e	70.00	110.00	180.00
DIS-PC-2025-d7961f	90.00	100.00	190.00
DIS-PC-2025-33d6fa	65.00	75.00	140.00
DIS-PC-2025-69d007	85.00	125.00	210.00
\.


--
-- Data for Name: packing_list; Type: TABLE DATA; Schema: distribution; Owner: postgres
--

COPY distribution.packing_list (packing_list_id, packed_by, packing_status, packing_type, total_items_packed, packing_cost_id, picking_list_id) FROM stdin;
DIS-PC-2025-ef5456	\N	Shipped	Box	15	\N	\N
DIS-PC-2025-dbaab9	\N	Shipped	Crate	10	\N	\N
DIS-PC-2025-d6799d	\N	Shipped	Box	8	\N	\N
DIS-PC-2025-ac8ba6	\N	Packed	Bubble Wrap	20	\N	\N
DIS-PC-2025-38f843	\N	\N	\N	\N	\N	\N
DIS-PC-2025-350f40	\N	Shipped	Box	12	\N	\N
DIS-PC-2025-f2f9f2	\N	\N	\N	\N	\N	\N
DIS-PC-2025-7f3858	\N	Shipped	Box	5	\N	\N
DIS-PC-2025-d77777	\N	\N	\N	\N	\N	\N
DIS-PC-2025-1ea915	\N	Pending	\N	\N	\N	\N
\.


--
-- Data for Name: picking_list; Type: TABLE DATA; Schema: distribution; Owner: postgres
--

COPY distribution.picking_list (picking_list_id, warehouse_id, picked_by, picked_status, picked_date, approval_request_id) FROM stdin;
DIS-PIL-2025-2e096c	\N	\N	Completed	2023-01-15	\N
DIS-PIL-2025-e09797	\N	\N	Completed	2023-01-23	\N
DIS-PIL-2025-37e210	\N	\N	Completed	2023-02-08	\N
DIS-PIL-2025-0ee6db	\N	\N	In Progress	2023-02-21	\N
DIS-PIL-2025-c29596	\N	\N	\N	\N	\N
DIS-PIL-2025-a2c29f	\N	\N	Completed	2023-03-14	\N
DIS-PIL-2025-81c6d1	\N	\N	\N	\N	\N
DIS-PIL-2025-de0a5f	\N	\N	Completed	2023-04-05	\N
DIS-PIL-2025-4965e8	\N	\N	\N	\N	\N
DIS-PIL-2025-47da2a	\N	\N	Not Started	\N	\N
\.


--
-- Data for Name: rejection; Type: TABLE DATA; Schema: distribution; Owner: postgres
--

COPY distribution.rejection (rejection_id, rejection_status, rejection_reason, rejection_date, delivery_receipt_id) FROM stdin;
DIS-REJ-2025-d44356	Resolved	Damaged packaging	2023-01-19	\N
DIS-REJ-2025-a86795	Confirmed	Wrong items delivered	2023-01-27	\N
DIS-REJ-2025-641a30	Pending	Late delivery	2023-02-10	\N
DIS-REJ-2025-35077f	\N	aaac	\N	\N
DIS-REJ-2025-73b12f	\N	aaav	\N	\N
DIS-REJ-2025-fafadc	Resolved	Incomplete delivery	2023-03-16	\N
DIS-REJ-2025-aa8d1f	Confirmed	Product quality issues	2023-03-25	\N
DIS-REJ-2025-2e9416	Confirmed	Documentation errors	2023-04-06	\N
DIS-REJ-2025-5e3399	\N	aaaa	\N	\N
DIS-REJ-2025-df07aa	Confirmed	Damaged goods	2023-04-27	\N
\.


--
-- Data for Name: rework_order; Type: TABLE DATA; Schema: distribution; Owner: postgres
--

COPY distribution.rework_order (rework_id, assigned_to, rework_status, rework_date, expected_completion, rejection_id, failed_shipment_id, rework_types) FROM stdin;
DIS-RO-2025-e394e4	\N	Completed	2023-01-20	2023-01-21 17:00:00	\N	\N	Rejection
DIS-RO-2025-6ce6ad	\N	In Progress	2023-01-28	2023-01-30 17:00:00	\N	\N	Failed Shipment
DIS-RO-2025-6ce7bd	\N	Pending	2023-02-11	2023-02-12 17:00:00	\N	\N	Rejection
DIS-RO-2025-0a43fa	\N	\N	\N	\N	\N	\N	\N
DIS-RO-2025-03f11a	\N	\N	\N	\N	\N	\N	\N
DIS-RO-2025-fdab23	\N	Completed	2023-03-17	2023-03-18 16:00:00	\N	\N	Failed Shipment
DIS-RO-2025-2effaa	\N	\N	\N	\N	\N	\N	\N
DIS-RO-2025-a14ff8	\N	Pending	2023-04-07	2023-04-09 12:00:00	\N	\N	Rejection
DIS-RO-2025-853429	\N	\N	\N	\N	\N	\N	\N
DIS-RO-2025-f9242d	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: shipment_details; Type: TABLE DATA; Schema: distribution; Owner: postgres
--

COPY distribution.shipment_details (shipment_id, carrier_id, shipment_date, shipment_status, tracking_number, estimated_arrival_date, actual_arrival_date, packing_list_id, shipping_cost_id) FROM stdin;
DIS-SD-2025-784f7e	\N	2023-01-16	Delivered	asd1	2023-01-18 14:00:00	2023-01-19 11:30:00	\N	\N
DIS-SD-2025-345649	\N	2023-01-24	Delivered	asd2	2023-01-27 16:00:00	2023-01-27 15:45:00	\N	\N
DIS-SD-2025-18edf4	\N	2023-02-09	Delivered	asd3	2023-02-09 18:00:00	2023-02-10 09:15:00	\N	\N
DIS-SD-2025-68fa7f	\N	2023-02-22	Shipped	asd4	2023-02-24 12:00:00	\N	\N	\N
DIS-SD-2025-a764f7	\N	\N	Pending	asd5	\N	\N	\N	\N
DIS-SD-2025-20a23b	\N	\N	Delivered	asd7	2023-03-25 13:00:00	2023-03-25 14:05:00	\N	\N
DIS-SD-2025-acdcf0	\N	2023-04-06	Failed	asd8	2023-04-08 11:00:00	\N	\N	\N
DIS-SD-2025-40a36e	\N	\N	Pending	asd9	2023-04-21 15:00:00	\N	\N	\N
DIS-SD-2025-6a0809	\N	\N	Pending	asd10	2023-04-29 12:00:00	\N	\N	\N
DIS-SD-2025-e53c03	\N	2023-03-15	Delivered	asd6	2023-03-16 10:00:00	2023-03-16 16:20:00	\N	DIS-SC-2025-650bde
\.


--
-- Data for Name: shipping_cost; Type: TABLE DATA; Schema: distribution; Owner: postgres
--

COPY distribution.shipping_cost (shipping_cost_id, packing_list_id, cost_per_kg, cost_per_km, weight_kg, distance_km, total_shipping_cost) FROM stdin;
DIS-SC-2025-e8ec2c	\N	2.50	0.75	25.00	150.00	175.00
DIS-SC-2025-650bde	\N	2.50	0.75	100.00	200.00	400.00
DIS-SC-2025-3346bc	\N	2.50	0.75	40.00	120.00	190.00
DIS-SC-2025-14ec01	\N	2.50	0.75	15.00	80.00	97.50
DIS-SC-2025-74bb1b	\N	\N	\N	\N	\N	\N
DIS-SC-2025-326b1d	\N	2.75	0.80	30.00	175.00	222.50
DIS-SC-2025-edc0a0	\N	\N	\N	\N	\N	\N
DIS-SC-2025-59f04f	\N	2.75	0.80	22.00	90.00	132.50
DIS-SC-2025-ba70b6	\N	\N	\N	\N	\N	\N
DIS-SC-2025-3a31b1	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: budget_approvals; Type: TABLE DATA; Schema: finance; Owner: postgres
--

COPY finance.budget_approvals (budget_approvals_id, validation_id, approval_status) FROM stdin;
\.


--
-- Data for Name: budget_validations; Type: TABLE DATA; Schema: finance; Owner: postgres
--

COPY finance.budget_validations (validation_id, dept_id, validation_date, validated_by, validation_status, remarks, amount_requested, final_approved_amount) FROM stdin;
FNC-BVA-2025-0e929c	\N	2024-10-26	Jenny Jimenez	Approved	Approved	2400.00	2400.00
FNC-BVA-2025-a456e2	\N	2024-10-26	Yori Perdigon	Pending	Awaiting Validation	100000.00	\N
FNC-BVA-2025-fd6cbb	\N	2024-10-27	Jenny Jimenez	Pending	Awaiting Validation	50000.00	\N
FNC-BVA-2025-a3bd57	\N	2024-10-27	Jenny Jimenez	Approved	Approved	2400.00	2000.00
FNC-BVA-2025-3ec375	\N	2024-10-28	Julianne Rico	Pending	Awaiting Validation	2000.00	\N
FNC-BVA-2025-45fbbe	\N	2024-10-28	Janna Sudla	Approved	Approved	100000.00	100000.00
FNC-BVA-2025-123c73	\N	2024-10-29	Julianne Rico	Approved	Approved	70000.00	70000.00
FNC-BVA-2025-a17b32	\N	2024-10-29	Edelyn Bercasio	Approved	Approved	70000.00	50000.00
FNC-BVA-2025-c72099	\N	2024-10-30	Yori Perdigon	Pending	Awaiting Validation	250000.00	\N
FNC-BVA-2025-87d48e	\N	2024-10-30	Julianne Rico	Approved	Approved	100000.00	100000.00
FNC-BVA-2025-69f06a	\N	2024-11-28	Janna Sudla	Approved	Approved	1000000.00	1000000.00
FNC-BVA-2025-783483	\N	2024-11-29	Julianne Rico	Approved	Approved	700000.00	700000.00
FNC-BVA-2025-5dfd0a	\N	2024-11-29	Edelyn Bercasio	Approved	Approved	700000.00	700000.00
FNC-BVA-2025-39448c	\N	2024-11-30	Yori Perdigon	Pending	Awaiting Validation	250000.00	\N
FNC-BVA-2025-4cc309	\N	2024-11-30	Julianne Rico	Approved	Approved	100000.00	100000.00
FNC-BVA-2025-9a55f0	\N	2024-11-28	Janna Sudla	Approved	Approved	100000.00	100000.00
FNC-BVA-2025-89ca5a	\N	2024-11-29	Julianne Rico	Approved	Approved	70000.00	70000.00
FNC-BVA-2025-3062d2	\N	2024-11-29	Edelyn Bercasio	Approved	Approved	70000.00	50000.00
FNC-BVA-2025-bb4ddb	\N	2024-11-30	Yori Perdigon	Pending	Awaiting Validation	250000.00	\N
FNC-BVA-2025-c4eac5	\N	2024-11-30	Julianne Rico	Approved	Approved	100000.00	100000.00
\.


--
-- Data for Name: attendance_tracking; Type: TABLE DATA; Schema: human_resources; Owner: postgres
--

COPY human_resources.attendance_tracking (attendance_id, employee_id, time_in, time_out, status, updated_at) FROM stdin;
HR-ATT-2025-4191ce	\N	2025-03-08 08:05:00	2025-03-08 17:00:00	Present	2025-04-01 20:26:50.269297
HR-ATT-2025-21dd46	\N	2025-03-08 08:30:00	2025-03-08 17:00:00	Late	2025-04-01 20:26:50.269297
HR-ATT-2025-b8b3b4	\N	2025-03-08 08:00:00	2025-03-08 12:00:00	Half-Day	2025-04-01 20:26:50.269297
HR-ATT-2025-48f291	\N	2025-03-08 00:00:00	2025-03-08 00:00:00	On Leave	2025-04-01 20:26:50.269297
HR-ATT-2025-872eae	\N	2025-03-08 08:15:00	2025-03-08 17:00:00	Late	2025-04-01 20:26:50.269297
HR-ATT-2025-f68490	\N	2025-03-08 08:00:00	2025-03-08 17:00:00	Present	2025-04-01 20:26:50.269297
HR-ATT-2025-6c96d3	\N	2025-03-08 08:45:00	2025-03-08 17:00:00	Late	2025-04-01 20:26:50.269297
HR-ATT-2025-461961	\N	2025-03-08 08:00:00	2025-03-08 17:30:00	Present	2025-04-01 20:26:50.269297
HR-ATT-2025-7247dc	\N	2025-03-08 08:00:00	2025-03-08 16:00:00	Present	2025-04-01 20:26:50.269297
HR-ATT-2025-c9d184	\N	2025-03-08 00:00:00	2025-03-08 00:00:00	Absent	2025-04-01 20:26:50.269297
\.


--
-- Data for Name: candidates; Type: TABLE DATA; Schema: human_resources; Owner: postgres
--

COPY human_resources.candidates (candidate_id, job_id, first_name, last_name, email, phone, resume, employment_type, contract_duration, status, date_applied) FROM stdin;
HR-CAND-2025-b9445d	\N	John	Dela Cruz	johndelacruz@email.com	09171234567	Experienced accountant with CPA certification.	Permanent	\N	Applied	2025-04-01 20:26:50.269297
HR-CAND-2025-50e63f	\N	Anna	Reyes	annareyes@email.com	09175678901	Skilled administrative assistant with 3 years of experience.	Contractual	6	Interview Scheduled	2025-04-01 20:26:50.269297
HR-CAND-2025-8d2ed0	\N	Michael	Santos	michaelsantos@email.com	09179876543	Logistics professional with expertise in supply chain management.	Permanent	\N	Applied	2025-04-01 20:26:50.269297
HR-CAND-2025-7e3616	\N	Rachel	Gomez	rachelgomez@email.com	09172345678	Finance analyst with a background in risk assessment and investment.	Permanent	\N	Hired	2025-04-01 20:26:50.269297
HR-CAND-2025-547982	\N	David	Tan	davidtan@email.com	09176543219	HR specialist with 5+ years of experience in talent acquisition.	Contractual	12	Interview Scheduled	2025-04-01 20:26:50.269297
HR-CAND-2025-128ccc	\N	Sophia	Lim	sophialim@email.com	09173456789	Inventory management professional with ERP system experience.	Permanent	\N	Applied	2025-04-01 20:26:50.269297
HR-CAND-2025-0f8acb	\N	Carlos	Fernandez	carlosfernandez@email.com	09179998877	Business strategist with strong analytical and leadership skills.	Contractual	24	Applied	2025-04-01 20:26:50.269297
HR-CAND-2025-48cc0a	\N	Emily	Chan	emilychan@email.com	09171239876	Materials planning officer with supply chain experience.	Permanent	\N	Interview Scheduled	2025-04-01 20:26:50.269297
HR-CAND-2025-3129c7	\N	James	Villanueva	jamesvillanueva@email.com	09176667777	Operations supervisor with experience in large-scale logistics.	Permanent	\N	Rejected	2025-04-01 20:26:50.269297
HR-CAND-2025-c9fa4f	\N	Ben	Cruz	bencruz@email.com	09172348999	Manufacturing worker with hands-on assembly line experience.	Contractual	3	Hired	2025-04-01 20:26:50.269297
\.


--
-- Data for Name: departments; Type: TABLE DATA; Schema: human_resources; Owner: postgres
--

COPY human_resources.departments (dept_id, dept_name) FROM stdin;
HR-DEPT-2025-bdb274	Accounting
HR-DEPT-2025-e5517e	Administration
HR-DEPT-2025-71f9cc	Distribution
HR-DEPT-2025-fc882e	Finance
HR-DEPT-2025-cd47f2	Human Resource
HR-DEPT-2025-f28d85	Inventory
HR-DEPT-2025-f4efba	Management
HR-DEPT-2025-b69941	Material Resource Planning
HR-DEPT-2025-1e6bd6	Operations
HR-DEPT-2025-231434	Production
HR-DEPT-2025-660f0b	Project Management
HR-DEPT-2025-0b40c8	Purchasing
HR-DEPT-2025-990934	Sales
HR-DEPT-2025-1e7f74	Services
\.


--
-- Data for Name: employee_performance; Type: TABLE DATA; Schema: human_resources; Owner: postgres
--

COPY human_resources.employee_performance (performance_id, employee_id, immediate_superior_id, rating, bonus_percentage, review_date, comments) FROM stdin;
HR-PERF-2025-7a6ac5	\N	\N	5	\N	2025-03-01	Kate consistently delivers accurate financial reports and demonstrates exceptional leadership.
HR-PERF-2025-924fee	\N	\N	4	\N	2025-03-02	James has excellent accounting knowledge and manages the team effectively.
HR-PERF-2025-f19c08	\N	\N	3	\N	2025-03-03	Robert maintains good accuracy in payables processing but needs to improve speed.
HR-PERF-2025-9227b1	\N	\N	5	\N	2025-03-04	Maria is proactive and ensures receivables are up-to-date without delays.
HR-PERF-2025-2ac2f1	\N	\N	4	\N	2025-03-05	David is meticulous in payroll processing and always meets deadlines.
HR-PERF-2025-49973d	\N	\N	3	\N	2025-03-06	Carla is reliable in bookkeeping but should work on handling pressure better.
HR-PERF-2025-99b956	\N	\N	2	\N	2025-03-07	Miguel shows potential but has been inconsistent in performance this quarter.
HR-PERF-2025-6a081f	\N	\N	5	\N	2025-03-08	Angela provides deep financial insights that significantly help decision-making.
HR-PERF-2025-35e2ca	\N	\N	4	\N	2025-03-09	Henry conducts thorough audits and follows compliance effectively.
HR-PERF-2025-aadf47	\N	\N	3	\N	2025-03-10	Miguel is detail-oriented but needs to enhance efficiency in daily tasks.
\.


--
-- Data for Name: employee_salary; Type: TABLE DATA; Schema: human_resources; Owner: postgres
--

COPY human_resources.employee_salary (salary_id, employee_id, base_salary, contract_pay_type, contract_pay_rate, total_hours_worked, total_contract_pay, effective_date) FROM stdin;
HR-SAL-2025-1d54fe	\N	65000.00	\N	\N	\N	\N	2025-03-01
HR-SAL-2025-5aad7b	\N	37000.00	\N	\N	\N	\N	2025-03-01
HR-SAL-2025-e58419	\N	32000.00	\N	\N	\N	\N	2025-03-01
HR-SAL-2025-58e7ac	\N	31000.00	\N	\N	\N	\N	2025-03-01
HR-SAL-2025-20730a	\N	30000.00	\N	\N	\N	\N	2025-03-01
HR-SAL-2025-3ca7ba	\N	27500.00	\N	\N	\N	\N	2025-03-01
HR-SAL-2025-628e12	\N	43000.00	\N	\N	\N	\N	2025-03-01
HR-SAL-2025-b6029f	\N	29000.00	\N	\N	\N	\N	2025-03-01
HR-SAL-2025-92d7ac	\N	45000.00	\N	\N	\N	\N	2025-03-01
HR-SAL-2025-6ed83d	\N	\N	Hourly	180.00	160.00	28800.00	2025-03-01
HR-SAL-2025-4c3714	\N	\N	Daily	1200.00	20.00	24000.00	2025-03-01
\.


--
-- Data for Name: employees; Type: TABLE DATA; Schema: human_resources; Owner: postgres
--

COPY human_resources.employees (employee_id, dept_id, first_name, last_name, email, phone, job_title, employment_type, status, updated_at) FROM stdin;
HR-EMP-2025-1ea1c2	\N	Kate	Tan	katetan@kinetic.ph	09165824756	Chief Accountant	Permanent	Active	2025-04-01 20:26:50.269297
HR-EMP-2025-490629	\N	James	Marticio	jamesmarticio@kinetic.ph	09123456789	Accounting Supervisor	Permanent	Active	2025-04-01 20:26:50.269297
HR-EMP-2025-ce9580	\N	Robert	Santiago	robertsantiago@kinetic.ph	09187654321	Accounts Payable Specialist	Permanent	Active	2025-04-01 20:26:50.269297
HR-EMP-2025-4e10a5	\N	Maria	Lopez	marialopez@kinetic.ph	09154321876	Accounts Receivable Specialist	Permanent	Active	2025-04-01 20:26:50.269297
HR-EMP-2025-8ab976	\N	David	Cruz	davidcruz@kinetic.ph	09192837465	Payroll Officer	Permanent	Active	2025-04-01 20:26:50.269297
HR-EMP-2025-b850ed	\N	Carla	Ramirez	carlaramirez@kinetic.ph	09175648392	Bookkeeper	Permanent	Active	2025-04-01 20:26:50.269297
HR-EMP-2025-95807c	\N	Miguel	Narabal	miguelnarabal@kinetic.ph	09164738291	Bookkeeper	Contractual	Active	2025-04-01 20:26:50.269297
HR-EMP-2025-1ff01a	\N	Angela	Tores	angelatores@kinetic.ph	09183948572	Financial Analyst	Permanent	Active	2025-04-01 20:26:50.269297
HR-EMP-2025-320946	\N	Henry	Vallespin	henryvallespin@kinetic.ph	09195847263	Audit Officer	Permanent	Active	2025-04-01 20:26:50.269297
HR-EMP-2025-777fd9	\N	Liza	Domingo	lizadomingo@kinetic.ph	09172345678	Tax Consultant	Contractual	Active	2025-04-01 20:26:50.269297
HR-EMP-2025-653ba1	\N	Karen	Mendoza	karenmendoza@kinetic.ph	09139485762	Administrative Manager	Permanent	Active	2025-04-01 20:26:50.269297
HR-EMP-2025-4c4f53	HR-DEPT-2025-990934	Jordan	Belfort	jordanbelfort@kinetiq.ph	09123456789	Sales Representative	Permanent	Active	2025-04-01 13:33:25
\.


--
-- Data for Name: interviews; Type: TABLE DATA; Schema: human_resources; Owner: postgres
--

COPY human_resources.interviews (interview_id, candidate_id, interviewer_id, interview_date, status, feedback, created_at) FROM stdin;
HR-INT-2025-e4a60d	\N	\N	2025-03-15 10:00:00	Scheduled	\N	2025-04-01 20:26:50.269297
HR-INT-2025-80e4bd	\N	\N	2025-03-15 13:00:00	Scheduled	\N	2025-04-01 20:26:50.269297
HR-INT-2025-047821	\N	\N	2025-03-16 09:30:00	Scheduled	\N	2025-04-01 20:26:50.269297
HR-INT-2025-eb7962	\N	\N	2025-03-16 14:00:00	Scheduled	\N	2025-04-01 20:26:50.269297
HR-INT-2025-63d779	\N	\N	2025-03-17 11:00:00	Scheduled	\N	2025-04-01 20:26:50.269297
\.


--
-- Data for Name: job_posting; Type: TABLE DATA; Schema: human_resources; Owner: postgres
--

COPY human_resources.job_posting (job_id, request_id, dept_id, "position", description, requirements, employment_type, contract_duration, contract_rate, contract_pay_type, status, created_at) FROM stdin;
HR-JOB-2025-36f654	\N	\N	Junior Accountant	Assist in financial record-keeping and report preparation.	Bachelor’s degree in Accounting, 1+ years experience, CPA preferred.	Permanent	\N	\N	\N	Open	2025-04-01 20:26:50.269297
HR-JOB-2025-3fc98d	\N	\N	Administrative Assistant	Support office operations, manage schedules, and handle correspondence.	High school diploma or equivalent, proficient in MS Office, strong communication skills.	Contractual	6	18000.00	Fixed	Open	2025-04-01 20:26:50.269297
HR-JOB-2025-e43591	\N	\N	Logistics Coordinator	Oversee transportation and delivery of goods.	Experience in distribution/logistics, knowledge of inventory software.	Permanent	\N	\N	\N	Open	2025-04-01 20:26:50.269297
HR-JOB-2025-020ef1	\N	\N	Finance Analyst	Analyze financial data and assist in decision-making.	Degree in Finance or Accounting, 2+ years experience, strong analytical skills.	Permanent	\N	\N	\N	Open	2025-04-01 20:26:50.269297
HR-JOB-2025-bc92bf	\N	\N	Recruitment Specialist	Handle end-to-end recruitment process.	Degree in HR or Psychology, experience in talent acquisition.	Contractual	12	25000.00	Fixed	Open	2025-04-01 20:26:50.269297
HR-JOB-2025-158aab	\N	\N	Inventory Supervisor	Manage stock levels and ensure inventory accuracy.	Experience in inventory control, knowledge of ERP systems.	Permanent	\N	\N	\N	Open	2025-04-01 20:26:50.269297
HR-JOB-2025-1b778d	\N	\N	Business Strategy Consultant	Develop and optimize business strategies.	MBA preferred, 5+ years experience in corporate strategy.	Contractual	24	120000.00	Fixed	Open	2025-04-01 20:26:50.269297
HR-JOB-2025-3e74f0	\N	\N	Material Planning Officer	Ensure timely procurement and availability of materials.	Degree in Supply Chain or related field, experience in planning.	Permanent	\N	\N	\N	Open	2025-04-01 20:26:50.269297
HR-JOB-2025-967d17	\N	\N	Operations Supervisor	Oversee daily operations and manage staff.	Experience in operations management, leadership skills.	Permanent	\N	\N	\N	Open	2025-04-01 20:26:50.269297
HR-JOB-2025-0a9dc4	\N	\N	Production Line Worker	Work on the manufacturing assembly line.	No experience required, physically fit, willing to work shifts.	Contractual	3	500.00	Daily	Open	2025-04-01 20:26:50.269297
\.


--
-- Data for Name: leave_requests; Type: TABLE DATA; Schema: human_resources; Owner: postgres
--

COPY human_resources.leave_requests (leave_id, employee_id, dept_id, immediate_superior_id, management_approval_id, leave_type, start_date, end_date, is_paid, status, updated_at) FROM stdin;
HR-LV-2025-466115	\N	\N	\N	\N	Sick	2025-03-01	2025-03-03	t	Approved by Superior	2025-04-01 20:26:50.269297
HR-LV-2025-b599f7	\N	\N	\N	\N	Vacation	2025-04-10	2025-04-14	t	Approved by Superior	2025-04-01 20:26:50.269297
HR-LV-2025-e2d8bf	\N	\N	\N	\N	Personal	2025-05-02	2025-05-02	t	Rejected by Superior	2025-04-01 20:26:50.269297
HR-LV-2025-139cc2	\N	\N	\N	\N	Maternity	2025-06-01	2025-08-01	t	Approved by Management	2025-04-01 20:26:50.269297
HR-LV-2025-b5d6fa	\N	\N	\N	\N	Paternity	2025-07-15	2025-07-20	t	Approved by Management	2025-04-01 20:26:50.269297
HR-LV-2025-3b51ad	\N	\N	\N	\N	Sick	2025-03-05	2025-03-07	t	Recorded in HRIS	2025-04-01 20:26:50.269297
HR-LV-2025-0b8e2b	\N	\N	\N	\N	Unpaid	2025-03-18	2025-03-19	f	Approved by Superior	2025-04-01 20:26:50.269297
HR-LV-2025-5cb1a0	\N	\N	\N	\N	Personal	2025-04-01	2025-04-02	t	Pending	2025-04-01 20:26:50.269297
HR-LV-2025-b3c088	\N	\N	\N	\N	Vacation	2025-05-15	2025-05-22	t	Pending	2025-04-01 20:26:50.269297
HR-LV-2025-38df70	\N	\N	\N	\N	Unpaid	2025-06-10	2025-06-12	f	Rejected by Management	2025-04-01 20:26:50.269297
\.


--
-- Data for Name: payroll; Type: TABLE DATA; Schema: human_resources; Owner: postgres
--

COPY human_resources.payroll (payroll_id, employee_id, employment_type, base_salary, work_days, contract_pay_type, contract_pay_rate, total_hours_worked, total_contract_pay, overtime_hours, overtime_pay, undertime_hours, undertime_deductions, unpaid_leave_days, leave_deductions, taxable_income, tax, sss_deduction, philhealth_deduction, pagibig_deduction, thirteenth_month_pay, performance_bonus, net_salary, payment_date, payment_status) FROM stdin;
HR-PAY-2025-351160	\N	Permanent	65000.00	22	\N	\N	\N	\N	5.00	2500.00	2.00	1000.00	1	2954.55	58545.45	5854.55	3250.00	3250.00	1300.00	5416.67	7800.00	53557.57	2025-03-01	Processed
HR-PAY-2025-e5989e	\N	Permanent	37000.00	22	\N	\N	\N	\N	3.00	1350.00	1.00	500.00	0	0.00	35150.00	3515.00	1850.00	1850.00	740.00	3083.33	2775.00	31478.33	2025-03-01	Processed
HR-PAY-2025-c2199f	\N	Permanent	32000.00	22	\N	\N	\N	\N	2.00	800.00	0.00	0.00	0	0.00	32000.00	3200.00	1600.00	1600.00	640.00	2666.67	1600.00	27026.67	2025-03-01	Processed
HR-PAY-2025-8cbe19	\N	Permanent	31000.00	22	\N	\N	\N	\N	4.00	1600.00	1.00	500.00	0	0.00	29900.00	2990.00	1550.00	1550.00	620.00	2583.33	1550.00	26423.33	2025-03-01	Processed
HR-PAY-2025-b0be73	\N	Permanent	30000.00	22	\N	\N	\N	\N	3.00	1200.00	0.00	0.00	2	2727.27	26072.73	2607.27	1500.00	1500.00	600.00	2500.00	1500.00	23065.46	2025-03-01	Processed
HR-PAY-2025-11b4c4	\N	Permanent	27500.00	22	\N	\N	\N	\N	1.00	400.00	0.00	0.00	0	0.00	27500.00	2750.00	1375.00	1375.00	550.00	2291.67	1375.00	22646.67	2025-03-01	Processed
HR-PAY-2025-c38e35	\N	Permanent	43000.00	22	\N	\N	\N	\N	5.00	2000.00	2.00	1000.00	0	0.00	42000.00	4200.00	2150.00	2150.00	860.00	3583.33	3225.00	34958.33	2025-03-01	Processed
HR-PAY-2025-e107d0	\N	Permanent	29000.00	22	\N	\N	\N	\N	2.00	800.00	0.00	0.00	0	0.00	29000.00	2900.00	1450.00	1450.00	580.00	2416.67	1450.00	24386.67	2025-03-01	Processed
HR-PAY-2025-35fbd2	\N	Contractual	\N	\N	Hourly	180.00	160.00	28800.00	5.00	900.00	1.00	180.00	0	0.00	29620.00	2962.00	1440.00	1440.00	576.00	0.00	0.00	23202.00	2025-03-01	Processed
HR-PAY-2025-d57ac8	\N	Contractual	\N	\N	Daily	1200.00	20.00	24000.00	3.00	3600.00	0.00	0.00	0	0.00	27600.00	2760.00	1200.00	1200.00	480.00	0.00	0.00	21560.00	2025-03-01	Processed
\.


--
-- Data for Name: workforce_allocation; Type: TABLE DATA; Schema: human_resources; Owner: postgres
--

COPY human_resources.workforce_allocation (allocation_id, requesting_dept_id, employee_id, current_dept_id, reason, approval_status, status, start_date, end_date, approval_date) FROM stdin;
HR-ALLOC-2025-332eb7	\N	\N	\N	Temporary assignment to assist with financial reconciliation for a major project.	Approved	Completed	2025-02-01	2025-02-28	2025-04-01 20:26:50.269297
HR-ALLOC-2025-19dd00	\N	\N	\N	Payroll Officer assigned to help with operational budgeting.	Approved	Completed	2025-01-15	2025-01-31	2025-04-01 20:26:50.269297
HR-ALLOC-2025-e957dc	\N	\N	\N	Supervisory expertise needed for budget restructuring.	Pending	Active	2025-03-10	\N	2025-04-01 20:26:50.269297
HR-ALLOC-2025-1d04d7	\N	\N	\N	Bookkeeper assisting with purchasing audit.	Approved	Active	2025-03-05	2025-03-15	2025-04-01 20:26:50.269297
HR-ALLOC-2025-6c4fd2	\N	\N	\N	Financial Analyst required for material resource planning.	Rejected	Canceled	2025-02-20	2025-03-05	2025-04-01 20:26:50.269297
HR-ALLOC-2025-1c28b0	\N	\N	\N	Bookkeeper support for production cost analysis.	Approved	Active	2025-03-01	2025-03-20	2025-04-01 20:26:50.269297
HR-ALLOC-2025-218692	\N	\N	\N	Accounts Receivable Specialist temporarily assigned for inventory reconciliation.	Pending	Active	2025-03-08	\N	2025-04-01 20:26:50.269297
HR-ALLOC-2025-b3f874	\N	\N	\N	Audit Officer assisting distribution finance team.	Approved	Completed	2025-01-05	2025-01-25	2025-04-01 20:26:50.269297
HR-ALLOC-2025-cb47ae	\N	\N	\N	Tax Consultant supporting sales tax review.	Approved	Completed	2025-02-10	2025-02-28	2025-04-01 20:26:50.269297
HR-ALLOC-2025-431815	\N	\N	\N	Chief Accountant assigned to oversee HR payroll compliance.	Rejected	Canceled	2025-02-15	2025-03-10	2025-04-01 20:26:50.269297
\.


--
-- Data for Name: deprecation_report; Type: TABLE DATA; Schema: inventory; Owner: postgres
--

COPY inventory.deprecation_report (deprecation_report_id, content_id, reported_date, status, employee_id) FROM stdin;
INV-DR-2025-190d48	\N	2025-04-01 20:26:50.269297	Pending	\N
INV-DR-2025-a18af6	\N	2025-04-01 20:26:50.269297	Approved	\N
INV-DR-2025-86d07e	\N	2025-04-01 20:26:50.269297	Pending	\N
\.


--
-- Data for Name: inventory_adjustments; Type: TABLE DATA; Schema: inventory; Owner: postgres
--

COPY inventory.inventory_adjustments (adjustment_id, item_id, adjustment_type, quantity, adjustment_date, employee_id) FROM stdin;
INV-IA-2025-8b0ada	\N	Inbound	10	2025-04-01 20:26:50.269297	\N
INV-IA-2025-db6572	\N	Outbound-Distribution	5	2025-04-01 20:26:50.269297	\N
INV-IA-2025-1e3f0f	\N	Outbound-Production	3	2025-04-01 20:26:50.269297	\N
\.


--
-- Data for Name: inventory_cyclic_counts; Type: TABLE DATA; Schema: inventory; Owner: postgres
--

COPY inventory.inventory_cyclic_counts (inventory_count_id, item_md_id, item_onhand, item_actually_counted, difference_in_qty, employee_id, status, remarks, time_period) FROM stdin;
INV-ICC-2025-3745b7	1	50	48	2	\N	Completed	Routine check	monthly
INV-ICC-2025-1286c5	2	20	20	0	\N	Completed	No discrepancies	weekly
INV-ICC-2025-fa736f	3	150	145	5	\N	In Progress	Pending verification	quarterly
\.


--
-- Data for Name: inventory_item; Type: TABLE DATA; Schema: inventory; Owner: postgres
--

COPY inventory.inventory_item (inventory_item_id, item_id, minimum_threshold, maximum_threshold, total_stock, available_stock, last_update) FROM stdin;
INV-II-2025-5c31d7	\N	10	100	50	30	2025-04-01 20:26:50.269297
INV-II-2025-fd9a72	\N	5	50	20	15	2025-04-01 20:26:50.269297
INV-II-2025-32f6aa	\N	0	200	150	100	2025-04-01 20:26:50.269297
\.


--
-- Data for Name: inventory_product_data; Type: TABLE DATA; Schema: inventory; Owner: postgres
--

COPY inventory.inventory_product_data (item_md_id, inventory_item_id, stock_on_order, stock_committed) FROM stdin;
INV-IIPD-2025-791a36	\N	20	10
INV-IIPD-2025-109692	\N	15	5
INV-IIPD-2025-0ab4c4	\N	30	25
\.


--
-- Data for Name: warehouse_movement; Type: TABLE DATA; Schema: inventory; Owner: postgres
--

COPY inventory.warehouse_movement (movement_id, item_id, movement_type, quantity, movement_date, destination, source, reference_id_purchase_order, reference_id_order) FROM stdin;
INV-WM-2025-6fe0b9	\N	Inbound	20	2025-04-01 20:26:50.269297	\N	\N	\N	\N
INV-WM-2025-1a9fdb	\N	Outbound	15	2025-04-01 20:26:50.269297	\N	\N	\N	\N
INV-WM-2025-d7cf39	\N	Outbound	10	2025-04-01 20:26:50.269297	\N	\N	\N	\N
\.


--
-- Data for Name: management_approvals; Type: TABLE DATA; Schema: management; Owner: postgres
--

COPY management.management_approvals (approval_id, request_id, external_id, decision_date, issue_date, checked_by, checked_date, status, due_date, remarks) FROM stdin;
MNG-APP-2025-952a04	\N	\N	2025-03-15	2025-03-10	\N	2025-04-01	approved	2025-03-20	Approved after review.
MNG-APP-2025-a9c939	\N	\N	2025-03-16	2025-03-11	\N	2025-04-01	pending	2025-03-25	Pending further verification.
MNG-APP-2025-2fce91	\N	\N	2025-03-17	2025-03-12	\N	2025-04-01	rejected	2025-03-18	Rejected due to incomplete documents.
MNG-APP-2025-93bcc8	\N	\N	2025-03-18	2025-03-14	\N	2025-04-01	approved	2025-03-22	Approved after additional checks.
MNG-APP-2025-4c46d8	\N	\N	2025-03-19	2025-03-15	\N	2025-04-01	approved	2025-03-21	Approved without issues.
MNG-APP-2025-26c162	\N	\N	2025-03-20	2025-03-16	\N	2025-04-01	pending	2025-03-23	Pending further information.
MNG-APP-2025-413131	\N	\N	2025-03-21	2025-03-17	\N	2025-04-01	rejected	2025-03-24	Rejected due to non-compliance.
MNG-APP-2025-a6a5e8	\N	\N	2025-03-22	2025-03-18	\N	2025-04-01	approved	2025-03-26	Approved after successful review.
MNG-APP-2025-b6a7de	\N	\N	2025-03-23	2025-03-19	\N	2025-04-01	pending	2025-03-27	Pending confirmation from department.
MNG-APP-2025-f5beec	\N	\N	2025-03-24	2025-03-20	\N	2025-04-01	approved	2025-03-28	Approved after final inspection.
\.


--
-- Data for Name: bill_of_materials; Type: TABLE DATA; Schema: mrp; Owner: postgres
--

COPY mrp.bill_of_materials (bom_id, product_id, quantity_of_product, material_id, quantity_of_material, unit_of_measure, product_description, specific_notes, production_order_detail_id, cost_per_raw_material, total_cost_of_raw_materials, labor_cost, total_cost) FROM stdin;
MRP-BOM-2025-42a5e3	\N	12	\N	6	pcs	Carbon Fiber Sheets	Lightweight and strong	\N	150.00	900.00	500.00	1400.00
MRP-BOM-2025-3236f6	\N	18	\N	9	kg	Silicone Rubber	Flexible and heat resistant	\N	80.00	720.00	400.00	1120.00
MRP-BOM-2025-0217a9	\N	22	\N	11	L	Graphene Coating	High conductivity and durability	\N	200.00	2200.00	1200.00	3400.00
MRP-BOM-2025-9e3bb5	\N	30	\N	14	m	Copper Wiring	Electrical conductivity	\N	45.00	630.00	350.00	980.00
MRP-BOM-2025-9bbab5	\N	16	\N	8	unit	Polycarbonate Panel	Impact resistant	\N	55.00	440.00	300.00	740.00
MRP-BOM-2025-043258	\N	10	\N	5	kg	Nickel Alloy	Rust and corrosion-resistant	\N	75.00	375.00	250.00	625.00
MRP-BOM-2025-99f206	\N	28	\N	12	L	Zinc Coating	Anti-corrosion layer	\N	30.00	360.00	180.00	540.00
MRP-BOM-2025-72bd35	\N	24	\N	7	pcs	Titanium Screws	Lightweight and high strength	\N	25.00	175.00	100.00	275.00
MRP-BOM-2025-378146	\N	35	\N	20	kg	Aluminum Frame	Lightweight and durable	\N	95.00	1900.00	800.00	2700.00
MRP-BOM-2025-5779a5	\N	40	\N	25	set	Steel Bolts	High-strength fastening	\N	20.00	500.00	300.00	800.00
MRP-BOM-2025-6331dd	\N	50	\N	30	m	Plastic Tubing	Durable and flexible	\N	10.00	300.00	150.00	450.00
MRP-BOM-2025-e354eb	\N	60	\N	35	mm	Iron Rods	Heavy-duty construction	\N	40.00	1400.00	700.00	2100.00
MRP-BOM-2025-035b33	\N	18	\N	9	pcs	Brass Hinges	High durability	\N	35.00	315.00	250.00	565.00
MRP-BOM-2025-c7afe4	\N	25	\N	15	kg	Composite Material	Used in aerospace	\N	250.00	3750.00	1250.00	5000.00
MRP-BOM-2025-100095	\N	55	\N	28	bx	Wooden Panels	For furniture making	\N	60.00	1680.00	720.00	2400.00
\.


--
-- Data for Name: non_project_order_pricing; Type: TABLE DATA; Schema: mrp; Owner: postgres
--

COPY mrp.non_project_order_pricing (non_project_costing_id, order_id, product_id, quantity, mrp_base_price, final_price) FROM stdin;
MRP-NPC-2025-9365ae	\N	\N	5	1200.00	6000.00
MRP-NPC-2025-3a98a4	\N	\N	3	1100.00	3300.00
MRP-NPC-2025-d1ff02	\N	\N	7	1500.00	10500.00
MRP-NPC-2025-6b704f	\N	\N	10	800.00	8000.00
MRP-NPC-2025-0ff1fe	\N	\N	15	500.00	7500.00
MRP-NPC-2025-19cfbd	\N	\N	2	2500.00	5000.00
MRP-NPC-2025-540448	\N	\N	8	900.00	7200.00
MRP-NPC-2025-cddaa0	\N	\N	12	300.00	3600.00
MRP-NPC-2025-5948c0	\N	\N	20	200.00	4000.00
MRP-NPC-2025-1770dd	\N	\N	1	10000.00	10000.00
MRP-NPC-2025-436938	\N	\N	6	1300.00	7800.00
MRP-NPC-2025-836b59	\N	\N	9	1400.00	12600.00
MRP-NPC-2025-a4cba9	\N	\N	3	1600.00	4800.00
MRP-NPC-2025-f81b2d	\N	\N	4	1700.00	6800.00
MRP-NPC-2025-e10b67	\N	\N	12	1800.00	21600.00
MRP-NPC-2025-c71a84	\N	\N	10	1900.00	19000.00
MRP-NPC-2025-c7741a	\N	\N	7	2000.00	14000.00
MRP-NPC-2025-abe204	\N	\N	11	1500.00	16500.00
MRP-NPC-2025-547e6d	\N	\N	14	2200.00	30800.00
MRP-NPC-2025-18f79e	\N	\N	8	2500.00	20000.00
MRP-NPC-2025-34c1cd	\N	\N	5	2100.00	10500.00
MRP-NPC-2025-23ba0e	\N	\N	13	2300.00	29900.00
MRP-NPC-2025-942ece	\N	\N	2	2400.00	4800.00
MRP-NPC-2025-b2af90	\N	\N	6	2600.00	15600.00
MRP-NPC-2025-7005d2	\N	\N	9	2700.00	24300.00
MRP-NPC-2025-2e00fa	SALES-ORD-2025-f789f0	\N	0	0.00	0.00
MRP-NPC-2025-e43512	SALES-ORD-2025-1273fc	\N	0	0.00	0.00
MRP-NPC-2025-81dc49	SALES-ORD-2025-1619c8	\N	0	0.00	0.00
MRP-NPC-2025-568a64	SALES-ORD-2025-3fd685	\N	0	0.00	0.00
MRP-NPC-2025-4ccf5e	SALES-ORD-2025-27df58	\N	0	0.00	0.00
MRP-NPC-2025-6dc7cd	SALES-ORD-2025-88bdf8	\N	0	0.00	0.00
MRP-NPC-2025-025afe	SALES-ORD-2025-314a10	\N	0	0.00	0.00
MRP-NPC-2025-687b5b	SALES-ORD-2025-02d80f	\N	0	0.00	0.00
MRP-NPC-2025-951892	SALES-ORD-2025-1323c9	\N	0	0.00	0.00
MRP-NPC-2025-ea20de	SALES-ORD-2025-5ea3d9	\N	0	0.00	0.00
MRP-NPC-2025-26034c	SALES-ORD-2025-970600	\N	0	0.00	0.00
MRP-NPC-2025-e3f13b	SALES-ORD-2025-dca0d6	\N	0	0.00	0.00
\.


--
-- Data for Name: principal_items; Type: TABLE DATA; Schema: mrp; Owner: postgres
--

COPY mrp.principal_items (principal_item_id, service_request_id, service_order_id, quantity, item_id, unit_price, pricing_date) FROM stdin;
MRP-PI-2025-f5c70a	\N	\N	10	\N	100.00	2024-03-09
MRP-PI-2025-9b9c28	\N	\N	8	\N	120.00	2024-03-09
MRP-PI-2025-ee654d	\N	\N	15	\N	90.00	2024-03-09
MRP-PI-2025-6fd915	\N	\N	12	\N	80.00	2024-03-10
MRP-PI-2025-a957a8	\N	\N	20	\N	70.00	2024-03-10
MRP-PI-2025-e717ba	\N	\N	5	\N	150.00	2024-03-11
MRP-PI-2025-b6fc48	\N	\N	18	\N	60.00	2024-03-11
MRP-PI-2025-0c7b8e	\N	\N	25	\N	40.00	2024-03-12
MRP-PI-2025-f382fe	\N	\N	30	\N	50.00	2024-03-12
MRP-PI-2025-1f6a8d	\N	\N	2	\N	200.00	2024-03-13
MRP-PI-2025-0ab3a7	\N	\N	7	\N	80.00	2024-03-14
MRP-PI-2025-800822	\N	\N	5	\N	100.00	2024-03-14
MRP-PI-2025-4d708c	\N	\N	3	\N	120.00	2024-03-15
MRP-PI-2025-469ee0	\N	\N	4	\N	90.00	2024-03-15
MRP-PI-2025-69f9da	\N	\N	8	\N	85.00	2024-03-16
MRP-PI-2025-1011b7	\N	\N	6	\N	95.00	2024-03-16
MRP-PI-2025-95e995	\N	\N	10	\N	110.00	2024-03-17
MRP-PI-2025-06fdff	\N	\N	12	\N	105.00	2024-03-17
MRP-PI-2025-4a4b08	\N	\N	15	\N	60.00	2024-03-18
MRP-PI-2025-6f098e	\N	\N	20	\N	70.00	2024-03-18
MRP-PI-2025-c8b829	\N	\N	9	\N	75.00	2024-03-19
MRP-PI-2025-ec87ff	\N	\N	11	\N	115.00	2024-03-19
MRP-PI-2025-02738a	\N	\N	13	\N	125.00	2024-03-20
MRP-PI-2025-cd4f8b	\N	\N	14	\N	130.00	2024-03-20
MRP-PI-2025-d77460	\N	\N	16	\N	140.00	2024-03-21
\.


--
-- Data for Name: document_header; Type: TABLE DATA; Schema: operations; Owner: postgres
--

COPY operations.document_header (document_id, document_type, vendor_code, document_no, transaction_id, content_id, status, posting_date, delivery_date, document_date, buyer, employee_id, initial_amount, discount_rate, discount_amount, freight, tax_rate, tax_amount, transaction_cost) FROM stdin;
OPS-DOH-2025-2887c4	Goods Receipt PO	\N	1001	2001	\N	Open	2025-01-01	2025-01-05	2025-01-01	Alice Johnson	\N	5000.00	5.00	250.00	100.00	10.00	500.00	150.00
OPS-DOH-2025-8c664d	Goods Issue	\N	1003	2003	\N	Cancelled	2025-01-03	2025-01-07	2025-01-03	Ethan Wright	\N	3000.00	4.50	135.00	90.00	8.50	255.00	100.00
OPS-DOH-2025-0c9810	Goods Receipt	\N	1005	2005	\N	Open	2025-01-05	2025-01-09	2025-01-05	Isaac Clark	\N	6000.00	5.50	330.00	105.00	11.00	660.00	160.00
OPS-DOH-2025-1e3955	Goods Receipt PO	\N	1006	2006	\N	Closed	2025-01-06	2025-01-10	2025-01-06	Kevin Brown	\N	8000.00	6.50	520.00	130.00	12.50	1000.00	190.00
OPS-DOH-2025-d21c7e	Goods Issue	\N	1008	2008	\N	Draft	2025-01-08	2025-01-12	2025-01-08	Oliver Scott	\N	5500.00	5.25	288.75	95.00	9.75	536.25	145.00
OPS-DOH-2025-0fed9a	Goods Receipt	\N	1010	2010	\N	Closed	2025-01-10	2025-01-14	2025-01-10	Samuel Carter	\N	7200.00	6.25	450.00	125.00	10.50	756.00	170.00
OPS-DOH-2025-4f56ac	Goods Receipt PO	\N	1011	2011	\N	Open	2025-01-11	2025-01-15	2025-01-11	Ursula Lane	\N	6300.00	5.75	362.25	110.00	10.25	645.75	165.00
OPS-DOH-2025-dc2b9d	Goods Issue	\N	1012	2012	\N	Closed	2025-01-12	2025-01-16	2025-01-12	Walter Perry	\N	4800.00	5.00	240.00	108.00	9.50	456.00	140.00
OPS-DOH-2025-1201fb	Goods Receipt	\N	1014	2014	\N	Draft	2025-01-14	2025-01-18	2025-01-14	Adam Reed	\N	5700.00	5.00	285.00	103.00	9.75	555.75	155.00
OPS-DOH-2025-ebd54b	Goods Receipt PO	\N	1016	2016	\N	Open	2025-01-16	2025-01-20	2025-01-16	Ella Grant	\N	6900.00	6.00	414.00	120.00	11.00	759.00	180.00
OPS-DOH-2025-70fffb	Goods Issue	\N	1017	2017	\N	Open	2025-01-17	2025-01-21	2025-01-17	Grace Hunter	\N	5100.00	5.50	280.50	107.00	9.50	484.50	145.00
OPS-DOH-2025-3face3	Goods Receipt	\N	1019	2019	\N	Draft	2025-01-19	2025-01-23	2025-01-19	Karen Patel	\N	6100.00	5.75	350.75	115.00	10.50	640.50	165.00
OPS-DOH-2025-084f5d	Goods Receipt PO	\N	1021	2021	\N	Closed	2025-01-21	2025-01-25	2025-01-21	Liam Foster	\N	7200.00	6.00	432.00	125.00	11.50	828.00	185.00
OPS-DOH-2025-6c9e6e	Goods Issue	\N	1022	2022	\N	Draft	2025-01-22	2025-01-26	2025-01-22	Nina Carter	\N	4600.00	4.75	218.50	98.00	9.00	414.00	135.00
OPS-DOH-2025-78effe	Goods Receipt	\N	1023	2023	\N	Open	2025-01-23	2025-01-27	2025-01-23	Oscar Bennett	\N	5900.00	5.25	309.75	110.00	10.25	605.25	160.00
OPS-DOH-2025-00809c	Goods Receipt PO	\N	1024	2024	\N	Cancelled	2025-01-24	2025-01-28	2025-01-24	Paul Griffin	\N	6800.00	5.75	391.00	118.00	10.75	731.00	175.00
OPS-DOH-2025-c9cebb	Goods Issue	\N	1025	2025	\N	Closed	2025-01-25	2025-01-29	2025-01-25	Quinn Sanders	\N	5300.00	5.50	291.50	108.00	9.50	503.50	150.00
OPS-DOH-2025-646f74	Goods Receipt	\N	1026	2026	\N	Draft	2025-01-26	2025-01-30	2025-01-26	Rebecca Moore	\N	6100.00	5.50	335.50	112.00	10.50	640.50	165.00
\.


--
-- Data for Name: document_items; Type: TABLE DATA; Schema: operations; Owner: postgres
--

COPY operations.document_items (content_id, item_id, document_id, material_id, serial_id, productdocu_id, external_id, delivery_request_id, request_date, quantity, total, batch_no, warehouse_id, cost, delivery_type, receiving_module, status) FROM stdin;
OPS-DOI-2025-316e85	\N	\N	\N	\N	\N	\N	DR001	2025-01-01	10	100.00	BN20250401-0001	\N	50.00	Material Request	Production	Pending
OPS-DOI-2025-228f74	\N	\N	\N	\N	\N	\N	DR002	2025-01-02	15	150.00	BN20250401-0002	\N	75.00	Finished Goods Request	Inventory	Approved
OPS-DOI-2025-0bbe16	\N	\N	\N	\N	\N	\N	DR003	2025-01-03	20	200.00	BN20250401-0003	\N	100.00	Material Request	Production	Rejected
OPS-DOI-2025-8e6493	\N	\N	\N	\N	\N	\N	DR004	2025-01-04	25	250.00	BN20250401-0004	\N	125.00	Finished Goods Request	Inventory	Pending
OPS-DOI-2025-43a39a	\N	\N	\N	\N	\N	\N	DR005	2025-01-05	30	300.00	BN20250401-0005	\N	150.00	Material Request	Production	Approved
OPS-DOI-2025-5989d9	\N	\N	\N	\N	\N	\N	DR006	2025-01-06	18	180.00	BN20250401-0006	\N	90.00	Finished Goods Request	Inventory	Rejected
OPS-DOI-2025-333bd7	\N	\N	\N	\N	\N	\N	DR007	2025-01-07	12	120.00	BN20250401-0007	\N	60.00	Material Request	Production	Pending
OPS-DOI-2025-6623ef	\N	\N	\N	\N	\N	\N	DR008	2025-01-08	22	220.00	BN20250401-0008	\N	110.00	Finished Goods Request	Inventory	Approved
OPS-DOI-2025-195b5e	\N	\N	\N	\N	\N	\N	DR009	2025-01-09	28	280.00	BN20250401-0009	\N	140.00	Material Request	Production	Rejected
OPS-DOI-2025-a85527	\N	\N	\N	\N	\N	\N	DR010	2025-01-10	32	320.00	BN20250401-0010	\N	160.00	Finished Goods Request	Inventory	Pending
OPS-DOI-2025-11938b	\N	\N	\N	\N	\N	\N	DR011	2025-01-11	14	140.00	BN20250401-0011	\N	70.00	Material Request	Production	Approved
OPS-DOI-2025-4bae3c	\N	\N	\N	\N	\N	\N	DR012	2025-01-12	26	260.00	BN20250401-0012	\N	130.00	Finished Goods Request	Inventory	Rejected
OPS-DOI-2025-d6b411	\N	\N	\N	\N	\N	\N	DR013	2025-01-13	19	190.00	BN20250401-0013	\N	95.00	Material Request	Production	Pending
OPS-DOI-2025-8e55d8	\N	\N	\N	\N	\N	\N	DR014	2025-01-14	35	350.00	BN20250401-0014	\N	175.00	Finished Goods Request	Inventory	Approved
OPS-DOI-2025-b4b732	\N	\N	\N	\N	\N	\N	DR015	2025-01-15	40	400.00	BN20250401-0015	\N	200.00	Material Request	Production	Rejected
OPS-DOI-2025-9653ae	\N	\N	\N	\N	\N	\N	DR016	2025-01-16	16	160.00	BN20250401-0016	\N	80.00	Finished Goods Request	Inventory	Pending
OPS-DOI-2025-557796	\N	\N	\N	\N	\N	\N	DR017	2025-01-17	21	210.00	BN20250401-0017	\N	105.00	Material Request	Production	Approved
OPS-DOI-2025-a34356	\N	\N	\N	\N	\N	\N	DR018	2025-01-18	29	290.00	BN20250401-0018	\N	145.00	Finished Goods Request	Inventory	Rejected
OPS-DOI-2025-1a68d6	\N	\N	\N	\N	\N	\N	DR019	2025-01-19	33	330.00	BN20250401-0019	\N	165.00	Material Request	Production	Pending
OPS-DOI-2025-43daf8	\N	\N	\N	\N	\N	\N	DR020	2025-01-20	24	240.00	BN20250401-0020	\N	120.00	Finished Goods Request	Inventory	Approved
\.


--
-- Data for Name: external_module; Type: TABLE DATA; Schema: operations; Owner: postgres
--

COPY operations.external_module (external_id, content_id, purchase_id, request_id, approval_id, goods_issue_id, approval_request_id, billing_receipt_id, delivery_receipt_id, project_resources_id, project_tracking_id, project_request_id, production_order_detail_id, rework_id, deprecation_report_id) FROM stdin;
OPS-EXM-2025-5ab77e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
OPS-EXM-2025-896b78	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
OPS-EXM-2025-41e1c6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
OPS-EXM-2025-cfcb66	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
OPS-EXM-2025-95abdf	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
OPS-EXM-2025-756680	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
OPS-EXM-2025-9e4abd	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
OPS-EXM-2025-5b42ed	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
OPS-EXM-2025-caf05a	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
OPS-EXM-2025-b61380	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
OPS-EXM-2025-559aaa	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
OPS-EXM-2025-f5fa40	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
OPS-EXM-2025-b731e3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
OPS-EXM-2025-a793c3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
OPS-EXM-2025-341f70	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
OPS-EXM-2025-7986bd	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
OPS-EXM-2025-e991b0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
OPS-EXM-2025-b37bb8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
OPS-EXM-2025-6a2e5b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
OPS-EXM-2025-5c806d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: product_document_items; Type: TABLE DATA; Schema: operations; Owner: postgres
--

COPY operations.product_document_items (productdocu_id, product_id, quantity_rejected, defect_type, manuf_date, expiry_date, content_id) FROM stdin;
OPS-PDI-2025-2057f2	\N	2	Performance Defect	2024-01-01	2026-01-01	\N
OPS-PDI-2025-24d2ce	\N	1	Safety Defect	2024-02-01	2026-02-01	\N
OPS-PDI-2025-bad37e	\N	3	Functional Defect	2024-03-01	2026-03-01	\N
OPS-PDI-2025-565002	\N	0	Performance Defect	2024-04-01	2026-04-01	\N
OPS-PDI-2025-c66974	\N	5	Safety Defect	2024-05-01	2026-05-01	\N
OPS-PDI-2025-b68622	\N	2	Functional Defect	2024-06-01	2026-06-01	\N
OPS-PDI-2025-331b86	\N	1	Performance Defect	2024-07-01	2026-07-01	\N
OPS-PDI-2025-1021ca	\N	3	Safety Defect	2024-08-01	2026-08-01	\N
OPS-PDI-2025-d5c174	\N	0	Functional Defect	2024-09-01	2026-09-01	\N
OPS-PDI-2025-c9e91f	\N	5	Performance Defect	2024-10-01	2026-10-01	\N
OPS-PDI-2025-63a123	\N	4	Material Defect	2024-11-01	2026-11-01	\N
OPS-PDI-2025-f67366	\N	2	Durability Defect	2024-12-01	2026-12-01	\N
OPS-PDI-2025-492a3f	\N	3	Performance Defect	2025-01-01	2027-01-01	\N
OPS-PDI-2025-c40df7	\N	0	Safety Defect	2025-02-01	2027-02-01	\N
OPS-PDI-2025-281846	\N	1	Functional Defect	2025-03-01	2027-03-01	\N
OPS-PDI-2025-ff3dd8	\N	5	Durability Defect	2025-04-01	2027-04-01	\N
OPS-PDI-2025-6ae498	\N	2	Material Defect	2025-05-01	2027-05-01	\N
OPS-PDI-2025-a68327	\N	3	Performance Defect	2025-06-01	2027-06-01	\N
OPS-PDI-2025-7de740	\N	0	Functional Defect	2025-07-01	2027-07-01	\N
OPS-PDI-2025-0123fa	\N	4	Safety Defect	2025-08-01	2027-08-01	\N
\.


--
-- Data for Name: serial_tracking; Type: TABLE DATA; Schema: operations; Owner: postgres
--

COPY operations.serial_tracking (serial_id, document_id, serial_no) FROM stdin;
OPS-SET-2025-49548a	\N	KNTP0001
OPS-SET-2025-506d6d	\N	KNTP0002
OPS-SET-2025-1dacdb	\N	KNTP0003
OPS-SET-2025-627a1d	\N	KNTP0004
OPS-SET-2025-2e85d8	\N	KNTP0005
OPS-SET-2025-f948ec	\N	KNTP0006
OPS-SET-2025-67ad72	\N	KNTP0007
OPS-SET-2025-c5e43e	\N	KNTP0008
OPS-SET-2025-918e99	\N	KNTP0009
OPS-SET-2025-f9d070	\N	KNTP0010
OPS-SET-2025-906f6c	\N	KNTP0011
OPS-SET-2025-5193c5	\N	KNTP0012
OPS-SET-2025-f6dca2	\N	KNTP0013
OPS-SET-2025-854d18	\N	KNTP0014
OPS-SET-2025-8fe2eb	\N	KNTP0015
OPS-SET-2025-f75c78	\N	KNTP0016
OPS-SET-2025-6225eb	\N	KNTP0017
OPS-SET-2025-51a350	\N	KNTP0018
OPS-SET-2025-54fe83	\N	KNTP0019
OPS-SET-2025-d080ad	\N	KNTP0020
\.


--
-- Data for Name: equipment; Type: TABLE DATA; Schema: production; Owner: postgres
--

COPY production.equipment (equipment_id, equipment_name, description, availability_status, last_maintenance_date, equipment_cost) FROM stdin;
PROD-EQP-2025-3e4bb5	CNC Milling Machine (5-axis)	High-precision 5 axis CNC milling machine for complex metal parts with intricate geometries	Available	2025-04-01	750000.00
PROD-EQP-2025-738c45	Laser Cutting & Engraving Machine	CO2 laser cutter and engraver for precise cutting and marking of various materials, including metals, plastics, and wood	Under Maintenance	2025-04-01	350000.00
PROD-EQP-2025-745b7b	Industrial 3D Printer (SLA)	Stereolithography (SLA) 3D printer for high-resolution prototypes and custom parts with fine details and smooth surfaces	Available	2025-04-01	450000.00
PROD-EQP-2025-3f1ef9	Welding Station	Multi-process welding station with MIG, TIG, and stick welding capabilities	Available	2025-04-01	80000.00
PROD-EQP-2025-e5053c	Paint Booth	Enclosed paint booth with ventilation system for applying custom finishes	Available	2025-04-01	150000.00
PROD-EQP-2025-d4a684	Industrial Sewing Machine	Heavy-duty sewing machine for various fabrics and materials	Available	2025-04-01	30000.00
PROD-EQP-2025-27a94e	Pick and Place Machine	Automated pick and place machine for precise placement of electronic components on printed circuit boards (PCBs)	Available	2025-04-01	600000.00
PROD-EQP-2025-ff62d7	Reflow Oven	Reflow oven for soldering electronic components to PCBs	Available	2024-03-05	200000.00
PROD-EQP-2025-2d52a3	Optical Inspection (AOI) Machine	AOI machine for visual inspection of PCBs for defects and quality control	Available	2025-04-01	400000.00
PROD-EQP-2025-122053	Wave Soldering Machine	Wave soldering machine for soldering through-hole components to PCBs	Out of Order	2025-04-01	250000.00
PROD-EQP-2025-aff176	Molding Machine	A machine for molding plastic components for medical devices	Available	2025-04-01	380000.00
PROD-EQP-2025-40490a	Precision Grinding Machine	Grinding machine for shaping metal parts to precise dimensions	Available	2025-04-01	220000.00
PROD-EQP-2025-c545fb	Robotic Assembly Arm	Robotic arm for precise and repetitive assembly of medical device components	Available	2025-04-01	550000.00
PROD-EQP-2025-e50b49	Cleanroom Injection Molder	Injection molding machine designed for cleanroom environments	Under Maintenance	2025-04-01	800000.00
PROD-EQP-2025-3c4987	Dispensing System	System for precise dispensing of adhesives and other fluids in medical device manufacturing	Available	2025-04-01	180000.00
PROD-EQP-2025-2972ef	Wire EDM Machine	Electrical discharge machine for cutting intricate shapes in conductive materials	Available	2025-04-01	480000.00
PROD-EQP-2025-8727b7	Precision Stamping Press	Stamping press for forming sheet metal components with high accuracy	Available	2025-04-01	200000.00
PROD-EQP-2025-fbcc18	Automated Labeling Machine	Machine for automated labeling of medical devices and components	Available	2025-04-01	60000.00
PROD-EQP-2025-9e7966	Ultrasonic Cleaner	Industrial ultrasonic cleaner for cleaning medical device components	Available	2025-04-01	20000.00
PROD-EQP-2025-221cad	Automated Cutting Machine	Automated machine for cutting materials like tubing and fabrics to precise lengths	Available	2025-04-01	120000.00
\.


--
-- Data for Name: labor; Type: TABLE DATA; Schema: production; Owner: postgres
--

COPY production.labor (labor_id, production_order_id, employee_id, date_worked, hours_worked) FROM stdin;
PROD-LAB-2025-752129	\N	\N	2024-03-05 13:00:00	8
PROD-LAB-2025-755af9	\N	\N	2024-03-06 12:00:00	7
PROD-LAB-2025-aec228	\N	\N	2024-03-10 12:30:00	6
PROD-LAB-2025-7b3709	\N	\N	2024-03-11 13:00:00	5
PROD-LAB-2025-cbde9b	\N	\N	2024-03-15 11:00:00	8
PROD-LAB-2025-fd8c95	\N	\N	2024-04-01 11:00:00	7
PROD-LAB-2025-636384	\N	\N	2024-04-05 10:30:00	6
PROD-LAB-2025-85647f	\N	\N	2024-04-10 10:00:00	5
PROD-LAB-2025-a9e9bd	\N	\N	2024-04-15 11:00:00	8
PROD-LAB-2025-92004c	\N	\N	2024-04-20 11:00:00	7
PROD-LAB-2025-4fde37	\N	\N	2024-04-25 09:00:00	6
PROD-LAB-2025-a34684	\N	\N	2024-04-30 14:00:00	8
PROD-LAB-2025-bdbd53	\N	\N	2024-05-05 10:00:00	7
PROD-LAB-2025-9e72a1	\N	\N	2024-05-10 13:30:00	5
PROD-LAB-2025-037156	\N	\N	2024-05-15 08:00:00	9
PROD-LAB-2025-eb0d21	\N	\N	2024-05-20 15:00:00	7
PROD-LAB-2025-083415	\N	\N	2024-05-25 11:00:00	6
PROD-LAB-2025-eefc37	\N	\N	2024-05-30 09:00:00	8
PROD-LAB-2025-c88c8c	\N	\N	2024-06-05 14:00:00	7
PROD-LAB-2025-5745a0	\N	\N	2024-06-10 12:00:00	6
\.


--
-- Data for Name: production_orders_details; Type: TABLE DATA; Schema: production; Owner: postgres
--

COPY production.production_orders_details (production_order_detail_id, production_order_id, actual_quantity, cost_of_production, miscellaneous_costs, equipment_id, rework_required, rework_notes, productdocu_id) FROM stdin;
PROD-POD-2025-7b9009	\N	10	1500.00	50.00	\N	f	\N	\N
PROD-POD-2025-acee28	\N	5	800.00	20.00	\N	t	Minor adjustments needed due to tube leaks	\N
PROD-POD-2025-229eb5	\N	20	800.00	60.00	\N	f	\N	\N
PROD-POD-2025-eee14e	\N	8	1200.00	30.00	\N	f	\N	\N
PROD-POD-2025-798c13	\N	16	1800.00	100.00	\N	f	\N	\N
PROD-POD-2025-af194c	\N	12	900.00	40.00	\N	f	\N	\N
PROD-POD-2025-31164d	\N	25	1100.00	70.00	\N	t	Recalibration needed for 3D printer	\N
PROD-POD-2025-fd1837	\N	15	1600.00	80.00	\N	f	\N	\N
PROD-POD-2025-d101e0	\N	30	2000.00	120.00	\N	f	\N	\N
PROD-POD-2025-8e19f4	\N	20	1300.00	90.00	\N	f	\N	\N
PROD-POD-2025-979f3c	\N	18	2500.00	150.00	\N	f	\N	\N
PROD-POD-2025-4a306c	\N	10	1200.00	80.00	\N	t	Calibration needed for accuracy	\N
PROD-POD-2025-990423	\N	22	1800.00	110.00	\N	f	\N	\N
PROD-POD-2025-35ae59	\N	12	1000.00	60.00	\N	f	\N	\N
PROD-POD-2025-1659e4	\N	20	2200.00	140.00	\N	f	\N	\N
PROD-POD-2025-5d3898	\N	15	1400.00	90.00	\N	t	Re-assembly required for one unit	\N
PROD-POD-2025-a1c190	\N	28	3000.00	180.00	\N	f	\N	\N
PROD-POD-2025-e720a3	\N	18	2000.00	130.00	\N	f	\N	\N
PROD-POD-2025-761b71	\N	35	2800.00	170.00	\N	f	\N	\N
PROD-POD-2025-08a2c6	\N	25	1700.00	100.00	\N	t	Final adjustments needed	\N
\.


--
-- Data for Name: production_orders_header; Type: TABLE DATA; Schema: production; Owner: postgres
--

COPY production.production_orders_header (production_order_id, task_id, bom_id, start_date, end_date, status, target_quantity, notes) FROM stdin;
PROD-PO-2025-59ceda	\N	\N	2024-03-05 09:00:00	2024-03-15 17:00:00	Completed	10	Custom metal bed
PROD-PO-2025-8c4762	\N	\N	2024-03-10 10:00:00	2024-03-22 16:00:00	In Progress	5	Plastic tubes components
PROD-PO-2025-18e3b7	\N	\N	2024-03-15 11:00:00	2024-04-05 15:00:00	Pending	20	Laser-cut panels for Project Gamma
PROD-PO-2025-b57a05	\N	\N	2024-03-20 13:00:00	2024-03-28 17:00:00	Completed	8	Custom welded frame for Project Delta
PROD-PO-2025-262add	\N	\N	2024-03-25 08:00:00	2024-04-10 16:00:00	In Progress	16	Custom painted casings for Project Epsilon
PROD-PO-2025-1c7a99	\N	\N	2024-04-01 14:00:00	2024-04-12 10:00:00	Pending	12	Wooden display stands
PROD-PO-2025-fbbd69	\N	\N	2024-04-05 09:00:00	2024-04-18 17:00:00	Completed	25	3D printed components for drone
PROD-PO-2025-164965	\N	\N	2024-04-10 10:00:00	2024-04-25 16:00:00	In Progress	15	Custom copper wiring for electronics
PROD-PO-2025-2a1c2d	\N	\N	2024-04-15 11:00:00	2024-05-02 15:00:00	Pending	30	Painted metal casings for machinery
PROD-PO-2025-4331c9	\N	\N	2024-04-20 13:00:00	2024-04-30 17:00:00	Completed	20	Assembled electronic kits
PROD-PO-2025-ec14b1	\N	\N	2024-04-25 08:00:00	2024-05-05 17:00:00	Pending	18	Assembly of surgical tool
PROD-PO-2025-c0ff13	\N	\N	2024-04-30 10:00:00	2024-05-12 16:00:00	In Progress	10	Production of diagnostic device
PROD-PO-2025-622c5b	\N	\N	2024-05-05 11:00:00	2024-05-20 15:00:00	Pending	22	Manufacturing of patient monitor
PROD-PO-2025-901f3d	\N	\N	2024-05-10 13:00:00	2024-05-25 17:00:00	Completed	12	Fabrication of medical cart
PROD-PO-2025-152842	\N	\N	2024-05-15 08:00:00	2024-06-01 16:00:00	In Progress	20	Production of infusion pump
PROD-PO-2025-23f2a2	\N	\N	2024-05-20 14:00:00	2024-06-05 10:00:00	Pending	15	Assembly of patient handling equipment
PROD-PO-2025-407216	\N	\N	2024-05-25 09:00:00	2024-06-10 17:00:00	Completed	28	Manufacturing of surgical robot arm
PROD-PO-2025-31596c	\N	\N	2024-05-30 10:00:00	2024-06-15 16:00:00	In Progress	18	Production of medical imaging system
PROD-PO-2025-275545	\N	\N	2024-06-05 11:00:00	2024-06-22 15:00:00	Pending	35	Fabrication of hospital bed frames
PROD-PO-2025-017bec	\N	\N	2024-06-10 13:00:00	2024-06-30 17:00:00	Completed	25	Assembly of surgical equipment
\.


--
-- Data for Name: contractual_worker_request; Type: TABLE DATA; Schema: project_management; Owner: postgres
--

COPY project_management.contractual_worker_request (request_id, intrnl_project_id, job_title, job_description, required_position, employment_type, dept_id) FROM stdin;
PROJ-CWR-2025-2d437b	\N	ERP Security Analyst	Ensure security compliance and system upgrades.	Cybersecurity Specialist	fixed-term	\N
PROJ-CWR-2025-9580d2	\N	Training Coordinator	Organize and conduct employee training sessions.	Training Specialist	temporary employment	\N
PROJ-CWR-2025-bc18dd	\N	Business Process Consultant	Analyze and optimize department workflows.	Process Analyst	freelance	\N
PROJ-CWR-2025-89fa62	\N	Network Engineer	Enhance ERP cybersecurity and firewall setup.	Network Security Engineer	fixed-term	\N
PROJ-CWR-2025-e54b39	\N	Compliance Officer	Develop compliance training modules.	Regulatory Specialist	temporary employment	\N
PROJ-CWR-2025-d07bc2	\N	Inventory System Analyst	Revamp and optimize inventory tracking.	Supply Chain Analyst	freelance	\N
PROJ-CWR-2025-441bdc	\N	Software Integration Developer	Implement third-party software integrations.	Software Developer	fixed-term	\N
PROJ-CWR-2025-d44724	\N	Leadership Coach	Conduct leadership development workshops.	Executive Trainer	freelance	\N
PROJ-CWR-2025-3abd83	\N	HR Policy Analyst	Review and update HR policies.	HR Consultant	temporary employment	\N
PROJ-CWR-2025-c02474	\N	IT Infrastructure Technician	Assist in upgrading IT infrastructure.	Infrastructure Specialist	internships	\N
PROJ-CWR-2025-a2a561	\N	Software Developer	Develop and maintain ERP modules.	Backend Developer	fixed-term	\N
PROJ-CWR-2025-67d24a	\N	Data Analyst	Analyze project performance data.	Business Intelligence Analyst	freelance	\N
PROJ-CWR-2025-49176c	\N	Cybersecurity Specialist	Enhance security measures for ERP.	Security Engineer	temporary employment	\N
PROJ-CWR-2025-cfd81c	\N	Training Coordinator	Organize internal training sessions.	Training Manager	internships	\N
PROJ-CWR-2025-17ab73	\N	Project Manager	Oversee internal project execution.	Senior Project Manager	fixed-term	\N
PROJ-CWR-2025-d3caf0	\N	Quality Assurance Tester	Test new system functionalities.	QA Engineer	freelance	\N
PROJ-CWR-2025-af561d	\N	Network Administrator	Manage internal network infrastructure.	Network Engineer	temporary employment	\N
PROJ-CWR-2025-c461dd	\N	UX/UI Designer	Redesign ERP user interface.	Senior Designer	fixed-term	\N
PROJ-CWR-2025-4b7613	\N	HR Consultant	Improve employee onboarding strategies.	HR Specialist	freelance	\N
PROJ-CWR-2025-6e237f	\N	Database Administrator	Optimize internal database performance.	DBA	temporary employment	\N
\.


--
-- Data for Name: external_project_cost_management; Type: TABLE DATA; Schema: project_management; Owner: postgres
--

COPY project_management.external_project_cost_management (project_resources_id, project_id, bom_id, project_budget_approval) FROM stdin;
PROJ-EPRM-2025-00d7a6	\N	\N	approved
PROJ-EPRM-2025-0943ae	\N	\N	approved
PROJ-EPRM-2025-6bd2b5	\N	\N	denied
PROJ-EPRM-2025-52dc3a	\N	\N	approved
PROJ-EPRM-2025-50bba1	\N	\N	approved
PROJ-EPRM-2025-20b306	\N	\N	denied
PROJ-EPRM-2025-6faf89	\N	\N	approved
PROJ-EPRM-2025-54e21c	\N	\N	approved
PROJ-EPRM-2025-c5d980	\N	\N	denied
PROJ-EPRM-2025-0ee2f6	\N	\N	approved
PROJ-EPRM-2025-e46a82	\N	\N	approved
PROJ-EPRM-2025-5e741c	\N	\N	approved
PROJ-EPRM-2025-d478b2	\N	\N	denied
PROJ-EPRM-2025-472fc8	\N	\N	approved
PROJ-EPRM-2025-61f2bf	\N	\N	approved
PROJ-EPRM-2025-f97cb5	\N	\N	denied
PROJ-EPRM-2025-26688a	\N	\N	approved
PROJ-EPRM-2025-b3e630	\N	\N	approved
PROJ-EPRM-2025-21d267	\N	\N	denied
PROJ-EPRM-2025-0b2272	\N	\N	approved
\.


--
-- Data for Name: external_project_details; Type: TABLE DATA; Schema: project_management; Owner: postgres
--

COPY project_management.external_project_details (project_id, ext_project_request_id, project_status) FROM stdin;
PROJ-EPD-2025-0a4726	\N	not started
PROJ-EPD-2025-5dbcd7	\N	in progress
PROJ-EPD-2025-e05722	\N	completed
PROJ-EPD-2025-954aae	\N	in progress
PROJ-EPD-2025-6c133f	\N	not started
PROJ-EPD-2025-2f8e73	\N	completed
PROJ-EPD-2025-173f91	\N	in progress
PROJ-EPD-2025-609b02	\N	not started
PROJ-EPD-2025-aea085	\N	completed
PROJ-EPD-2025-454df7	\N	in progress
PROJ-EPD-2025-e08828	\N	not started
PROJ-EPD-2025-282a70	\N	in progress
PROJ-EPD-2025-3add4a	\N	completed
PROJ-EPD-2025-8e3c55	\N	in progress
PROJ-EPD-2025-078a9c	\N	not started
PROJ-EPD-2025-d82d36	\N	completed
PROJ-EPD-2025-22b6b2	\N	in progress
PROJ-EPD-2025-013d50	\N	not started
PROJ-EPD-2025-4cc871	\N	completed
PROJ-EPD-2025-9399fb	\N	in progress
\.


--
-- Data for Name: external_project_labor; Type: TABLE DATA; Schema: project_management; Owner: postgres
--

COPY project_management.external_project_labor (project_labor_id, project_id, employee_id) FROM stdin;
PROJ-EPL-2025-254e04	\N	\N
PROJ-EPL-2025-8b6a3b	\N	\N
PROJ-EPL-2025-b0cee3	\N	\N
PROJ-EPL-2025-824b95	\N	\N
PROJ-EPL-2025-b51c32	\N	\N
PROJ-EPL-2025-f2fc57	\N	\N
PROJ-EPL-2025-8a69cb	\N	\N
PROJ-EPL-2025-5f83fa	\N	\N
PROJ-EPL-2025-d19298	\N	\N
PROJ-EPL-2025-9914c5	\N	\N
PROJ-EPL-2025-ff5ff0	\N	\N
PROJ-EPL-2025-601b53	\N	\N
PROJ-EPL-2025-6d209f	\N	\N
PROJ-EPL-2025-99f55a	\N	\N
PROJ-EPL-2025-944481	\N	\N
PROJ-EPL-2025-53ddfb	\N	\N
PROJ-EPL-2025-3ca299	\N	\N
PROJ-EPL-2025-bd9f11	\N	\N
PROJ-EPL-2025-1fddaa	\N	\N
PROJ-EPL-2025-ce38fc	\N	\N
\.


--
-- Data for Name: external_project_request; Type: TABLE DATA; Schema: project_management; Owner: postgres
--

COPY project_management.external_project_request (ext_project_request_id, ext_project_name, ext_project_description, approval_id, item_id) FROM stdin;
PROJ-EPR-2025-9777a2	OEC Elite x10	Manufacturing 10 units of OEC Elite C-arm X-ray machines for the client.	\N	\N
PROJ-EPR-2025-77d776	Aquadis 56 x5	Producing 5 units of Aquadis 56 medical washer-disinfectors.	\N	\N
PROJ-EPR-2025-bfb165	UA-66 x20	Client placed an order for 20 UA-66 ultrasound machines.	\N	\N
PROJ-EPR-2025-33edca	BeneVision N22/N19 x15	Hospital requires 15 BeneVision N22/N19 patient monitors.	\N	\N
PROJ-EPR-2025-290192	Senographe Pristina x8	Manufacturing 8 units of Senographe Pristina mammography systems.	\N	\N
PROJ-EPR-2025-f17d70	uMEC Series x12	Client ordered 12 uMEC Series patient monitors.	\N	\N
PROJ-EPR-2025-895281	TNI HighFlow x25	Producing 25 TNI HighFlow respiratory therapy units.	\N	\N
PROJ-EPR-2025-e974b6	uMed 20 x30	Manufacturing 30 units of uMed 20 portable patient monitors.	\N	\N
PROJ-EPR-2025-fb81bb	Wato EX-20 x7	Client requested 7 Wato EX-20 anesthesia machines.	\N	\N
PROJ-EPR-2025-b01efd	Rad-97 Pulse CO-Oximeter x18	Producing 18 Rad-97 Pulse CO-Oximeters for the hospital.	\N	\N
PROJ-EPR-2025-c4b690	OEC Elite x12	Manufacturing 12 units of OEC Elite C-arm X-ray machines for the client.	\N	\N
PROJ-EPR-2025-3f0e1e	Aquadis 56 x8	Producing 8 units of Aquadis 56 medical washer-disinfectors.	\N	\N
PROJ-EPR-2025-a40545	UA-66 x15	Client placed an order for 15 UA-66 ultrasound machines.	\N	\N
PROJ-EPR-2025-5165ea	BeneVision N22/N19 x20	Hospital requires 20 BeneVision N22/N19 patient monitors.	\N	\N
PROJ-EPR-2025-00e6c4	Senographe Pristina x10	Manufacturing 10 units of Senographe Pristina mammography systems.	\N	\N
PROJ-EPR-2025-6ad56c	uMEC Series x18	Client ordered 18 uMEC Series patient monitors.	\N	\N
PROJ-EPR-2025-0d64f2	TNI HighFlow x30	Producing 30 TNI HighFlow respiratory therapy units.	\N	\N
PROJ-EPR-2025-58633a	uMed 20 x35	Manufacturing 35 units of uMed 20 portable patient monitors.	\N	\N
PROJ-EPR-2025-16698a	Wato EX-20 x9	Client requested 9 Wato EX-20 anesthesia machines.	\N	\N
PROJ-EPR-2025-ed1506	Rad-97 Pulse CO-Oximeter x22	Producing 22 Rad-97 Pulse CO-Oximeters for the hospital.	\N	\N
\.


--
-- Data for Name: external_project_task_list; Type: TABLE DATA; Schema: project_management; Owner: postgres
--

COPY project_management.external_project_task_list (task_id, project_id, task_description, task_status, task_deadline, project_labor_id) FROM stdin;
PROJ-EPT-2025-f9a811	\N	Assemble OEC Elite frame	in_progress	2025-03-20	\N
PROJ-EPT-2025-1dad51	\N	Install imaging software	pending	2025-03-25	\N
PROJ-EPT-2025-4eb8c7	\N	Quality check for Aquadis 56	completed	2025-03-10	\N
PROJ-EPT-2025-e30b2d	\N	Calibrate UA-66 ultrasound sensors	in_progress	2025-03-18	\N
PROJ-EPT-2025-8b8715	\N	Integrate BeneVision N22/N19 with hospital systems	pending	2025-03-30	\N
PROJ-EPT-2025-b55d0d	\N	Final assembly of Senographe Pristina	completed	2025-03-12	\N
PROJ-EPT-2025-8517a4	\N	Software update for uMEC Series monitors	in_progress	2025-03-22	\N
PROJ-EPT-2025-6022cc	\N	Test airflow mechanism in TNI HighFlow devices	pending	2025-03-28	\N
PROJ-EPT-2025-3419d2	\N	Assemble battery unit for uMed 20	completed	2025-03-15	\N
PROJ-EPT-2025-6c3746	\N	Verify gas flow calibration for Wato EX-20	in_progress	2025-03-24	\N
PROJ-EPT-2025-58a588	\N	Connect Rad-97 Pulse CO-Oximeter to wireless system	canceled	2025-03-26	\N
PROJ-EPT-2025-7790ad	\N	Assemble components for OEC Elite units	in_progress	2025-04-15	\N
PROJ-EPT-2025-490889	\N	Test quality control for Aquadis 56 units	pending	2025-04-20	\N
PROJ-EPT-2025-79a164	\N	Conduct performance calibration for UA-66	completed	2025-03-30	\N
PROJ-EPT-2025-790f31	\N	Prepare software installation for BeneVision N22/N19	in_progress	2025-04-10	\N
PROJ-EPT-2025-563e68	\N	Finalize packaging for Senographe Pristina units	pending	2025-04-25	\N
PROJ-EPT-2025-212886	\N	Perform electrical safety tests on uMEC Series	completed	2025-03-28	\N
PROJ-EPT-2025-421411	\N	Ensure airflow accuracy for TNI HighFlow devices	in_progress	2025-05-01	\N
PROJ-EPT-2025-90447d	\N	Update firmware on uMed 20 units	pending	2025-05-05	\N
PROJ-EPT-2025-df23a7	\N	Verify gas flow on Wato EX-20 anesthesia machines	in_progress	2025-04-12	\N
PROJ-EPT-2025-e251fb	\N	Check SpO2 sensor calibration on Rad-97 Pulse CO-Oximeter	completed	2025-06-01	\N
\.


--
-- Data for Name: external_project_tracking; Type: TABLE DATA; Schema: project_management; Owner: postgres
--

COPY project_management.external_project_tracking (project_tracking_id, project_id, project_milestone, start_date, estimated_end_date, project_warranty_id, project_issue) FROM stdin;
PROJ-EPTK-2025-fb3391	\N	planning	2025-03-01	2025-03-10	\N	\N
PROJ-EPTK-2025-9cd017	\N	awaiting_approval	2025-03-05	2025-03-15	\N	Pending final client confirmation
PROJ-EPTK-2025-b06119	\N	manufacturing	2025-03-10	2025-04-01	\N	\N
PROJ-EPTK-2025-900a42	\N	deployment	2025-03-12	2025-04-05	\N	Logistics delay in shipment
PROJ-EPTK-2025-be8fe8	\N	installation	2025-03-15	2025-04-10	\N	\N
PROJ-EPTK-2025-b187d6	\N	completed	2025-02-20	2025-03-01	\N	\N
PROJ-EPTK-2025-4fe291	\N	manufacturing	2025-03-18	2025-04-12	\N	Supplier delay in component delivery
PROJ-EPTK-2025-833c98	\N	awaiting_approval	2025-03-22	2025-03-30	\N	\N
PROJ-EPTK-2025-4f0aab	\N	deployment	2025-03-25	2025-04-15	\N	Client requested last-minute customization
PROJ-EPTK-2025-cdeb80	\N	completed	2025-02-28	2025-03-08	\N	\N
PROJ-EPTK-2025-186379	\N	planning	2025-03-01	2025-04-15	\N	\N
PROJ-EPTK-2025-0feec6	\N	awaiting_approval	2025-03-05	2025-04-20	\N	Pending client feedback
PROJ-EPTK-2025-aaf28b	\N	manufacturing	2025-03-10	2025-05-01	\N	\N
PROJ-EPTK-2025-5ddadf	\N	deployment	2025-03-15	2025-05-10	\N	Supply chain delays
PROJ-EPTK-2025-118489	\N	installation	2025-03-20	2025-05-20	\N	\N
PROJ-EPTK-2025-6659ea	\N	completed	2025-03-25	2025-04-30	\N	\N
PROJ-EPTK-2025-57a2f8	\N	planning	2025-04-01	2025-05-15	\N	Design revisions required
PROJ-EPTK-2025-f3a686	\N	awaiting_approval	2025-04-05	2025-05-20	\N	\N
PROJ-EPTK-2025-90b33a	\N	manufacturing	2025-04-10	2025-06-01	\N	Material shortage
PROJ-EPTK-2025-a106bc	\N	deployment	2025-04-15	2025-06-10	\N	\N
\.


--
-- Data for Name: external_project_warranty; Type: TABLE DATA; Schema: project_management; Owner: postgres
--

COPY project_management.external_project_warranty (project_warranty_id, project_id, warranty_coverage_yr, warranty_start_date, warranty_end_date) FROM stdin;
PROJ-EPW-2025-070a3b	\N	3	2025-04-01	2028-04-01
PROJ-EPW-2025-94bec0	\N	2	2025-05-15	2027-05-15
PROJ-EPW-2025-983f6e	\N	5	2025-06-10	2030-06-10
PROJ-EPW-2025-b1183a	\N	3	2025-07-20	2028-07-20
PROJ-EPW-2025-419e0d	\N	4	2025-08-05	2029-08-05
PROJ-EPW-2025-8bc8fe	\N	2	2025-09-12	2027-09-12
PROJ-EPW-2025-a72890	\N	3	2025-10-18	2028-10-18
PROJ-EPW-2025-3833f8	\N	1	2025-11-22	2026-11-22
PROJ-EPW-2025-3a65b5	\N	5	2025-12-30	2030-12-30
PROJ-EPW-2025-8bab1a	\N	4	2026-01-15	2030-01-15
PROJ-EPW-2025-4d7923	\N	2	2025-04-01	2027-04-01
PROJ-EPW-2025-b686cb	\N	3	2025-05-15	2028-05-15
PROJ-EPW-2025-4c8963	\N	1	2025-06-10	2026-06-10
PROJ-EPW-2025-cfc976	\N	5	2025-07-20	2030-07-20
PROJ-EPW-2025-c465dd	\N	2	2025-08-05	2027-08-05
PROJ-EPW-2025-c84633	\N	4	2025-09-12	2029-09-12
PROJ-EPW-2025-2a3096	\N	3	2025-10-18	2028-10-18
PROJ-EPW-2025-8ba85b	\N	2	2025-11-25	2027-11-25
PROJ-EPW-2025-10d2ec	\N	1	2025-12-30	2026-12-30
PROJ-EPW-2025-a348a7	\N	5	2026-01-15	2031-01-15
\.


--
-- Data for Name: internal_project_details; Type: TABLE DATA; Schema: project_management; Owner: postgres
--

COPY project_management.internal_project_details (intrnl_project_id, project_request_id, intrnl_project_status) FROM stdin;
PROJ-IPD-2025-04e096	\N	not started
PROJ-IPD-2025-299fc8	\N	in progress
PROJ-IPD-2025-65b8bc	\N	completed
PROJ-IPD-2025-4578eb	\N	in progress
PROJ-IPD-2025-04efa8	\N	not started
PROJ-IPD-2025-9d1c19	\N	completed
PROJ-IPD-2025-526991	\N	in progress
PROJ-IPD-2025-275206	\N	not started
PROJ-IPD-2025-7f74df	\N	completed
PROJ-IPD-2025-a2c100	\N	in progress
PROJ-IPD-2025-f58908	\N	not started
PROJ-IPD-2025-e14789	\N	in progress
PROJ-IPD-2025-fb265a	\N	completed
PROJ-IPD-2025-287273	\N	in progress
PROJ-IPD-2025-757e52	\N	not started
PROJ-IPD-2025-183859	\N	completed
PROJ-IPD-2025-ac1e9a	\N	in progress
PROJ-IPD-2025-3ec731	\N	not started
PROJ-IPD-2025-51e115	\N	completed
PROJ-IPD-2025-b8d1a6	\N	in progress
\.


--
-- Data for Name: internal_project_labor; Type: TABLE DATA; Schema: project_management; Owner: postgres
--

COPY project_management.internal_project_labor (intrnl_project_labor_id, intrnl_project_id, employee_id) FROM stdin;
PROJ-IPL-2025-7a2251	\N	\N
PROJ-IPL-2025-688d47	\N	\N
PROJ-IPL-2025-feeff0	\N	\N
PROJ-IPL-2025-106259	\N	\N
PROJ-IPL-2025-d6bd4c	\N	\N
PROJ-IPL-2025-19b04c	\N	\N
PROJ-IPL-2025-b8dcd2	\N	\N
PROJ-IPL-2025-9c8687	\N	\N
PROJ-IPL-2025-f35707	\N	\N
PROJ-IPL-2025-2c3add	\N	\N
PROJ-IPL-2025-4ae888	\N	\N
PROJ-IPL-2025-90eeb9	\N	\N
PROJ-IPL-2025-6d7df1	\N	\N
PROJ-IPL-2025-daa6de	\N	\N
PROJ-IPL-2025-07ec0c	\N	\N
PROJ-IPL-2025-cac200	\N	\N
PROJ-IPL-2025-8f4301	\N	\N
PROJ-IPL-2025-670372	\N	\N
PROJ-IPL-2025-5d0fa8	\N	\N
PROJ-IPL-2025-8d17d9	\N	\N
PROJ-IPL-2025-609a0e	\N	\N
PROJ-IPL-2025-c13fc7	\N	\N
PROJ-IPL-2025-580442	\N	\N
PROJ-IPL-2025-9696a0	\N	\N
PROJ-IPL-2025-c3628e	\N	\N
PROJ-IPL-2025-faa561	\N	\N
PROJ-IPL-2025-958225	\N	\N
PROJ-IPL-2025-d7d818	\N	\N
\.


--
-- Data for Name: internal_project_request; Type: TABLE DATA; Schema: project_management; Owner: postgres
--

COPY project_management.internal_project_request (project_request_id, project_name, project_description, request_date, request_valid_date, request_starting_date, approval_id, employee_id, dept_id, project_type) FROM stdin;
PROJ-IPR-2025-502a43	ERP System Upgrade	Upgrade the ERP system with new security patches and features.	2025-03-01	2025-03-10	2025-03-15	\N	\N	\N	changes
PROJ-IPR-2025-2ed91f	Employee Training Program	Conduct training sessions for new ERP functionalities.	2025-03-05	2025-03-12	2025-03-20	\N	\N	\N	trainings
PROJ-IPR-2025-c7b15a	Department Workflow Optimization	Revise department workflow for efficiency improvements.	2025-03-07	2025-03-14	2025-03-22	\N	\N	\N	plans
PROJ-IPR-2025-8e05aa	Cybersecurity Enhancement	Implement new security measures in the ERP system.	2025-03-10	2025-03-18	2025-03-25	\N	\N	\N	changes
PROJ-IPR-2025-5e0e29	Compliance Training	Train employees on new regulatory compliance policies.	2025-03-12	2025-03-20	2025-03-28	\N	\N	\N	trainings
PROJ-IPR-2025-aa22f3	Inventory Management Optimization	Redesign the inventory tracking system for better performance.	2025-03-15	2025-03-25	2025-04-01	\N	\N	\N	plans
PROJ-IPR-2025-e21362	Software Integration Plan	Integrate third-party applications with the ERP system.	2025-03-18	2025-03-27	2025-04-05	\N	\N	\N	changes
PROJ-IPR-2025-81d599	Leadership Training	Conduct leadership workshops for department managers.	2025-03-20	2025-03-30	2025-04-10	\N	\N	\N	trainings
PROJ-IPR-2025-6e1674	HR Policy Review	Analyze and update HR policies in accordance with new labor laws.	2025-03-22	2025-04-01	2025-04-08	\N	\N	\N	plans
PROJ-IPR-2025-c60a70	IT Infrastructure Upgrade	Upgrade servers and network infrastructure for better performance.	2025-03-25	2025-04-05	2025-04-12	\N	\N	\N	changes
PROJ-IPR-2025-1363b2	ERP System Upgrade	Upgrade the ERP system to improve performance and security.	2025-03-01	2025-03-10	2025-03-15	\N	\N	\N	plans
PROJ-IPR-2025-ba7404	New Compliance Training	Conduct training sessions for new regulatory compliance.	2025-03-05	2025-03-15	2025-03-20	\N	\N	\N	trainings
PROJ-IPR-2025-3c74df	Inventory Management Overhaul	Redesign inventory tracking processes.	2025-03-10	2025-03-20	2025-03-25	\N	\N	\N	changes
PROJ-IPR-2025-5ec27e	Cybersecurity Enhancement	Implement additional security protocols.	2025-03-12	2025-03-22	2025-03-30	\N	\N	\N	plans
PROJ-IPR-2025-805581	Employee Onboarding Program	Develop a structured onboarding process.	2025-03-15	2025-03-25	2025-04-01	\N	\N	\N	trainings
PROJ-IPR-2025-4fc654	New Module Development	Add a new project tracking module.	2025-03-18	2025-03-28	2025-04-05	\N	\N	\N	changes
PROJ-IPR-2025-34d3e8	Medical Equipment Maintenance Plan	Create a preventive maintenance schedule.	2025-03-20	2025-03-30	2025-04-10	\N	\N	\N	plans
PROJ-IPR-2025-e33679	Customer Support Training	Enhance training for customer support staff.	2025-03-22	2025-04-01	2025-04-12	\N	\N	\N	trainings
PROJ-IPR-2025-2209ce	Data Migration Strategy	Plan for migrating legacy data to the new system.	2025-03-25	2025-04-05	2025-04-15	\N	\N	\N	plans
PROJ-IPR-2025-f84ca5	Compliance Audit Preparation	Prepare for an external compliance audit.	2025-03-28	2025-04-08	2025-04-20	\N	\N	\N	changes
\.


--
-- Data for Name: internal_project_task_list; Type: TABLE DATA; Schema: project_management; Owner: postgres
--

COPY project_management.internal_project_task_list (intrnl_task_id, intrnl_project_id, intrnl_task_description, intrnl_task_status, intrnl_task_deadline, intrnl_project_labor_id) FROM stdin;
PROJ-IPT-2025-2bf4b9	\N	Gather requirements for ERP upgrade	in_progress	2025-04-15	\N
PROJ-IPT-2025-480e1a	\N	Review security patches	pending	2025-04-20	\N
PROJ-IPT-2025-99ae67	\N	Schedule training sessions	in_progress	2025-04-10	\N
PROJ-IPT-2025-2ee52b	\N	Prepare training materials	completed	2025-03-30	\N
PROJ-IPT-2025-4d085c	\N	Analyze current workflow	completed	2025-03-15	\N
PROJ-IPT-2025-52b3a9	\N	Develop cybersecurity guidelines	in_progress	2025-04-25	\N
PROJ-IPT-2025-0ed00a	\N	Implement firewall upgrades	pending	2025-05-10	\N
PROJ-IPT-2025-92ca0a	\N	Prepare compliance training module	completed	2025-03-28	\N
PROJ-IPT-2025-54f1c3	\N	Revise inventory tracking system	pending	2025-05-01	\N
PROJ-IPT-2025-9bbec3	\N	Evaluate third-party integrations	in_progress	2025-05-05	\N
PROJ-IPT-2025-7645a9	\N	Organize leadership workshops	completed	2025-04-08	\N
PROJ-IPT-2025-144fc5	\N	Update HR policies	pending	2025-04-12	\N
PROJ-IPT-2025-2277eb	\N	Upgrade IT infrastructure	in_progress	2025-06-01	\N
PROJ-IPT-2025-15d90d	\N	Gather requirements from department heads.	pending	2025-04-10	\N
PROJ-IPT-2025-82b166	\N	Develop training materials for new ERP users.	in_progress	2025-04-15	\N
PROJ-IPT-2025-5f2aa1	\N	Conduct initial cybersecurity risk assessment.	pending	2025-04-20	\N
PROJ-IPT-2025-e607c1	\N	Review current inventory tracking methods.	in_progress	2025-04-25	\N
PROJ-IPT-2025-514b5a	\N	Perform software testing on the upgraded module.	pending	2025-05-01	\N
PROJ-IPT-2025-688904	\N	Create compliance checklist for upcoming audit.	completed	2025-05-05	\N
PROJ-IPT-2025-1e46d5	\N	Schedule system migration meeting with IT team.	canceled	2025-05-10	\N
PROJ-IPT-2025-1b3672	\N	Finalize new employee onboarding process.	in_progress	2025-05-15	\N
PROJ-IPT-2025-7161d2	\N	Develop data backup strategy before migration.	pending	2025-05-20	\N
PROJ-IPT-2025-fb3f28	\N	Implement new customer support workflow.	completed	2025-05-25	\N
\.


--
-- Data for Name: internal_project_tracking; Type: TABLE DATA; Schema: project_management; Owner: postgres
--

COPY project_management.internal_project_tracking (intrnl_project_tracking_id, intrnl_project_id, intrnl_start_date, intrnl_estimated_end_date, intrnl_project_issue) FROM stdin;
PROJ-IPT-2025-8f5422	\N	2025-04-01	2025-06-01	\N
PROJ-IPT-2025-4cc288	\N	2025-03-15	2025-05-20	Delayed due to scheduling conflicts
PROJ-IPT-2025-1cd6dd	\N	2025-02-10	2025-03-30	\N
PROJ-IPT-2025-e6ee6e	\N	2025-03-20	2025-06-15	Technical issue with implementation
PROJ-IPT-2025-3bb7f4	\N	2025-04-05	2025-06-10	\N
PROJ-IPT-2025-6d8a89	\N	2025-01-25	2025-03-01	\N
PROJ-IPT-2025-3f4535	\N	2025-03-18	2025-05-12	Resource allocation issue
PROJ-IPT-2025-627d33	\N	2025-04-10	2025-07-01	\N
PROJ-IPT-2025-7306d1	\N	2025-02-28	2025-04-15	Revisions needed in project scope
PROJ-IPT-2025-8c236d	\N	2025-03-25	2025-06-05	\N
PROJ-IPT-2025-34ba3a	\N	2025-04-01	2025-05-15	\N
PROJ-IPT-2025-74796d	\N	2025-04-05	2025-06-01	Resource allocation conflict
PROJ-IPT-2025-6d7547	\N	2025-04-10	2025-05-25	\N
PROJ-IPT-2025-959683	\N	2025-04-15	2025-06-10	Delay in software implementation
PROJ-IPT-2025-2f35ad	\N	2025-04-20	2025-06-15	\N
PROJ-IPT-2025-6d18df	\N	2025-04-25	2025-06-20	Pending final approval
PROJ-IPT-2025-8222fd	\N	2025-05-01	2025-06-30	\N
PROJ-IPT-2025-21d557	\N	2025-05-05	2025-07-10	System testing required additional time
PROJ-IPT-2025-61fed2	\N	2025-05-10	2025-07-15	\N
PROJ-IPT-2025-e64160	\N	2025-05-15	2025-07-20	Unexpected technical challenges
\.


--
-- Data for Name: report_monitoring; Type: TABLE DATA; Schema: project_management; Owner: postgres
--

COPY project_management.report_monitoring (report_monitoring_id, report_type, report_title, received_from, date_created, assigned_to, description) FROM stdin;
PROJ-RPM-2025-86b60a	Sales Order	Quarterly Sales Performance	Sales	2025-03-01	Management	Analysis of quarterly sales trends.
PROJ-RPM-2025-cfbb10	Resource Availability	HR Resource Utilization	Human Resources	2025-03-02	Operations	Report on current staff allocation.
PROJ-RPM-2025-82dead	Bill of Material	Component Breakdown for Model X	Production	2025-03-03	Inventory	Detailed BoM for upcoming production.
PROJ-RPM-2025-5c3598	Information	ERP User Guide Update	Admin	2025-03-04	Solution Customizing	Revision of user guide for latest ERP version.
PROJ-RPM-2025-db8223	Progress Report	Project Alpha Status	Project Management	2025-03-05	Management	Current project progress and blockers.
PROJ-RPM-2025-dd194e	Project Details	Warehouse Expansion Plan	Operations	2025-03-06	Finance	Financial projection for expansion.
PROJ-RPM-2025-bf0da1	Sales Order	Regional Sales Analysis	Sales	2025-03-07	Accounting	Comparison of sales performance across regions.
PROJ-RPM-2025-92b353	Resource Availability	Machine Availability in Plant A	MRP	2025-03-08	Production	List of operational and under-maintenance machines.
PROJ-RPM-2025-d92259	Bill of Material	BoM for Custom Order 2345	Purchasing	2025-03-09	Inventory	Itemized bill for a specific order.
PROJ-RPM-2025-5107c1	Information	Tax Compliance Updates	Finance	2025-03-10	Accounting	Latest tax regulations affecting the company.
PROJ-RPM-2025-74a61a	Progress Report	IT Infrastructure Upgrade	Admin	2025-03-11	Management	Status of ongoing IT infrastructure enhancements.
PROJ-RPM-2025-d82b3e	Project Details	New Product Development Timeline	Project Management	2025-03-12	Operations	Projected milestones for product launch.
PROJ-RPM-2025-3fb294	Sales Order	Major Client Orders Overview	Sales	2025-03-13	Distribution	List of key clients and their orders.
PROJ-RPM-2025-6b0072	Resource Availability	On-Site Workforce Report	Human Resources	2025-03-14	Operations	Summary of available staff per site.
PROJ-RPM-2025-f6e148	Bill of Material	Raw Material Requirements	Inventory	2025-03-15	Purchasing	Monthly forecast for required materials.
PROJ-RPM-2025-bde47d	Information	ERP System Security Report	Solution Customizing	2025-03-16	Admin	Review of security measures in place.
PROJ-RPM-2025-5f2a4f	Progress Report	Marketing Campaign Results	Management	2025-03-17	Sales	Performance of recent marketing initiatives.
PROJ-RPM-2025-9ea9e5	Project Details	Supply Chain Optimization Plan	Distribution	2025-03-18	Finance	Cost-benefit analysis of supply chain improvements.
PROJ-RPM-2025-fbb99b	Sales Order	E-commerce Sales Trends	Sales	2025-03-19	Management	Online sales performance breakdown.
PROJ-RPM-2025-eb93fd	Resource Availability	Fleet Utilization Report	Operations	2025-03-20	Distribution	Usage analysis of company logistics vehicles.
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
17	Can add return	5	add_return
18	Can change return	5	change_return
19	Can delete return	5	delete_return
20	Can view return	5	view_return
21	Can add credit memo	6	add_creditmemo
22	Can change credit memo	6	change_creditmemo
23	Can delete credit memo	6	delete_creditmemo
24	Can view credit memo	6	view_creditmemo
25	Can add log entry	7	add_logentry
26	Can change log entry	7	change_logentry
27	Can delete log entry	7	delete_logentry
28	Can view log entry	7	view_logentry
29	Can add session	8	add_session
30	Can change session	8	change_session
31	Can delete session	8	delete_session
32	Can view session	8	view_session
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$870000$ZSKEcjfgCbUmHnOyxqvAO5$zWiCkt7r2UliZB5XeNu0xic4092hH5H9XVHi87vwWDU=	2025-04-02 00:02:45.212407+08	t	admin				t	t	2025-04-02 00:02:37.243901+08
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
1	2025-04-02 00:10:01.343944+08	SALES-SHIP-2025-600585	DeliveryNote object (SALES-SHIP-2025-600585)	2	[{"changed": {"fields": ["Shipment"]}}]	11	1
2	2025-04-02 00:10:59.072043+08	SALES-SHIP-2025-600585	DeliveryNote object (SALES-SHIP-2025-600585)	2	[{"changed": {"fields": ["Shipment"]}}]	11	1
3	2025-04-02 00:11:11.463721+08	SALES-SHIP-2025-600585	DeliveryNote object (SALES-SHIP-2025-600585)	2	[{"changed": {"fields": ["Shipment"]}}]	11	1
4	2025-04-02 00:13:04.723785+08	DIS-SD-2025-e53c03	ShipmentDetails object (DIS-SD-2025-e53c03)	2	[{"changed": {"fields": ["Shipping cost"]}}]	9	1
5	2025-04-02 00:13:09.69699+08	SALES-SHIP-2025-600585	DeliveryNote object (SALES-SHIP-2025-600585)	2	[{"changed": {"fields": ["Shipment"]}}]	11	1
6	2025-04-02 00:13:33.2215+08	SALES-SHIP-2025-600585	DeliveryNote object (SALES-SHIP-2025-600585)	2	[{"changed": {"fields": ["Shipment"]}}]	11	1
7	2025-04-02 00:24:29.156011+08	SALES-SHIP-2025-600585	DeliveryNote object (SALES-SHIP-2025-600585)	2	[{"changed": {"fields": ["Shipment"]}}]	11	1
8	2025-04-02 00:24:36.267871+08	SALES-SHIP-2025-600585	DeliveryNote object (SALES-SHIP-2025-600585)	2	[{"changed": {"fields": ["Shipment"]}}]	11	1
9	2025-04-02 00:26:54.881314+08	SALES-SHIP-2025-600585	DeliveryNote object (SALES-SHIP-2025-600585)	2	[{"changed": {"fields": ["Shipment"]}}]	11	1
10	2025-04-02 00:27:12.905751+08	SALES-SHIP-2025-600585	DeliveryNote object (SALES-SHIP-2025-600585)	2	[{"changed": {"fields": ["Shipment"]}}]	11	1
11	2025-04-02 00:29:51.560547+08	SALES-SHIP-2025-600585	DeliveryNote object (SALES-SHIP-2025-600585)	2	[{"changed": {"fields": ["Shipment"]}}]	11	1
12	2025-04-02 00:29:56.655144+08	SALES-SHIP-2025-600585	DeliveryNote object (SALES-SHIP-2025-600585)	2	[{"changed": {"fields": ["Shipment"]}}]	11	1
13	2025-04-02 01:00:49.839594+08	SALES-SHIP-2025-9c320b	DeliveryNote object (SALES-SHIP-2025-9c320b)	2	[{"changed": {"fields": ["Shipment"]}}]	11	1
14	2025-04-02 01:01:53.618142+08	SALES-SHIP-2025-9c320b	DeliveryNote object (SALES-SHIP-2025-9c320b)	2	[{"changed": {"fields": ["Goods issue"]}}]	11	1
15	2025-04-02 01:18:20.868263+08	SALES-SHIP-2025-9a000d	DeliveryNote object (SALES-SHIP-2025-9a000d)	2	[{"changed": {"fields": ["Shipment"]}}]	11	1
16	2025-04-02 01:18:30.804333+08	SALES-SHIP-2025-9a000d	DeliveryNote object (SALES-SHIP-2025-9a000d)	2	[{"changed": {"fields": ["Shipment"]}}]	11	1
17	2025-04-02 01:18:35.783156+08	SALES-SHIP-2025-9a000d	DeliveryNote object (SALES-SHIP-2025-9a000d)	2	[{"changed": {"fields": ["Shipment"]}}]	11	1
18	2025-04-02 01:25:28.954339+08	SALES-SHIP-2025-9a000d	DeliveryNote object (SALES-SHIP-2025-9a000d)	2	[{"changed": {"fields": ["Shipment"]}}]	11	1
19	2025-04-02 01:25:44.834127+08	SALES-SHIP-2025-9a000d	DeliveryNote object (SALES-SHIP-2025-9a000d)	2	[{"changed": {"fields": ["Shipment"]}}]	11	1
20	2025-04-02 01:31:24.023312+08	SALES-SHIP-2025-6afaad	DeliveryNote object (SALES-SHIP-2025-6afaad)	2	[{"changed": {"fields": ["Shipment"]}}]	11	1
21	2025-04-02 01:41:57.28358+08	SALES-SHIP-2025-6afaad	DeliveryNote object (SALES-SHIP-2025-6afaad)	2	[{"changed": {"fields": ["Goods issue"]}}]	11	1
22	2025-04-02 01:55:02.531342+08	SALES-SHIP-2025-255686	DeliveryNote object (SALES-SHIP-2025-255686)	2	[{"changed": {"fields": ["Shipment"]}}]	11	1
23	2025-04-02 01:55:44.026685+08	SALES-SHIP-2025-255686	DeliveryNote object (SALES-SHIP-2025-255686)	2	[{"changed": {"fields": ["Goods issue", "Tracking num"]}}]	11	1
24	2025-04-02 01:55:53.564165+08	SALES-SHIP-2025-255686	DeliveryNote object (SALES-SHIP-2025-255686)	2	[{"changed": {"fields": ["Goods issue"]}}]	11	1
25	2025-04-02 01:57:38.115356+08	SALES-SHIP-2025-255686	DeliveryNote object (SALES-SHIP-2025-255686)	2	[{"changed": {"fields": ["Shipment"]}}]	11	1
26	2025-04-02 01:57:50.036048+08	SALES-SHIP-2025-255686	DeliveryNote object (SALES-SHIP-2025-255686)	2	[{"changed": {"fields": ["Tracking num"]}}]	11	1
27	2025-04-02 01:58:03.189813+08	SALES-SHIP-2025-255686	DeliveryNote object (SALES-SHIP-2025-255686)	2	[{"changed": {"fields": ["Goods issue"]}}]	11	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	auth	permission
2	auth	group
3	auth	user
4	contenttypes	contenttype
5	returns	return
6	returns	creditmemo
7	admin	logentry
8	sessions	session
9	misc	shipmentdetails
10	invoice	salesinvoices
11	delivery	deliverynote
12	misc	shippingcost
13	misc	goodsissue
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2025-04-02 00:02:22.357363+08
2	auth	0001_initial	2025-04-02 00:02:22.407509+08
3	contenttypes	0002_remove_content_type_name	2025-04-02 00:02:22.416838+08
4	auth	0002_alter_permission_name_max_length	2025-04-02 00:02:22.421404+08
5	auth	0003_alter_user_email_max_length	2025-04-02 00:02:22.424433+08
6	auth	0004_alter_user_username_opts	2025-04-02 00:02:22.431067+08
7	auth	0005_alter_user_last_login_null	2025-04-02 00:02:22.434933+08
8	auth	0006_require_contenttypes_0002	2025-04-02 00:02:22.434933+08
9	auth	0007_alter_validators_add_error_messages	2025-04-02 00:02:22.441729+08
10	auth	0008_alter_user_username_max_length	2025-04-02 00:02:22.448676+08
11	auth	0009_alter_user_last_name_max_length	2025-04-02 00:02:22.454072+08
12	auth	0010_alter_group_name_max_length	2025-04-02 00:02:22.460875+08
13	auth	0011_update_proxy_permissions	2025-04-02 00:02:22.465634+08
14	auth	0012_alter_user_first_name_max_length	2025-04-02 00:02:22.469516+08
15	admin	0001_initial	2025-04-02 00:02:25.270165+08
16	admin	0002_logentry_remove_auto_add	2025-04-02 00:02:25.276215+08
17	admin	0003_logentry_add_action_flag_choices	2025-04-02 00:02:25.280834+08
18	sessions	0001_initial	2025-04-02 00:02:28.293894+08
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
uviif8jz54l8xzw1hvzbs6tchezr1c64	.eJxVjEEOwiAQRe_C2pAMUAIu3XsGMswMUjUlKe3KeHcl6UK3_733XyrhvtW0d1nTzOqsQJ1-t4z0kGUAvuNya5rasq1z1kPRB-362liel8P9O6jY66hBipDlTBahlEDRszHFAEqZoiPPZCRPAJ6-yEp01nDwDj1aDGjV-wMiYDju:1tze4b:5qm7Xmg66jOvjrTTiAVmyDVnJL09Jz3i77Ojgp7XWw4	2025-04-16 00:02:45.213924+08
\.


--
-- Data for Name: batch_inspection; Type: TABLE DATA; Schema: purchasing; Owner: postgres
--

COPY purchasing.batch_inspection (inspection_id, shipment_id, inspection_date, employee_id, inspection_result, remarks) FROM stdin;
PURCHASING-BAI-2025-20de4a	\N	2025-03-15	\N	Pass	All items in good condition
PURCHASING-BAI-2025-749d3d	\N	2025-03-16	\N	Pass	Minor cosmetic issues but acceptable
PURCHASING-BAI-2025-e26a35	\N	2025-03-17	\N	Fail	One laptop has screen damage
PURCHASING-BAI-2025-737cf9	\N	2025-03-18	\N	Pass	All printers functioning properly
PURCHASING-BAI-2025-91023f	\N	2025-03-19	\N	Pass	Server rack assembled correctly
PURCHASING-BAI-2025-e4c825	\N	2025-03-20	\N	Fail	Two switches not functioning
PURCHASING-BAI-2025-29b129	\N	2025-03-21	\N	Pass	UPS batteries checked and working
PURCHASING-BAI-2025-f12d8f	\N	2025-03-22	\N	Pass	Conference table in perfect condition
PURCHASING-BAI-2025-24b554	\N	2025-03-23	\N	Fail	One projector has color issues
PURCHASING-BAI-2025-ca2ca7	\N	2025-03-24	\N	Pass	All filing cabinets properly assembled
\.


--
-- Data for Name: credit_memo; Type: TABLE DATA; Schema: purchasing; Owner: postgres
--

COPY purchasing.credit_memo (credit_memo_id, inspection_id, status, document_no, document_date, delivery_date, due_date, total_credit, credit_balance, dpm_rate, dpm_amount, applied_amount, balance_due) FROM stdin;
PURCHASING-CRM-2025-ba6fbe	\N	Approved	30001	2025-03-16	2025-03-15	2025-04-15	0.00	0.00	0.00	0.00	0.00	0.00
PURCHASING-CRM-2025-eebff1	\N	Approved	30002	2025-03-17	2025-03-16	2025-04-16	50.00	50.00	0.00	0.00	0.00	0.00
PURCHASING-CRM-2025-4fe5c1	\N	Pending	30003	2025-03-18	2025-03-17	2025-04-17	1299.99	1299.99	0.00	0.00	0.00	0.00
PURCHASING-CRM-2025-d9687e	\N	Approved	30004	2025-03-19	2025-03-18	2025-04-18	0.00	0.00	0.00	0.00	0.00	0.00
PURCHASING-CRM-2025-cb12d3	\N	Approved	30005	2025-03-20	2025-03-19	2025-04-19	0.00	0.00	0.00	0.00	0.00	0.00
PURCHASING-CRM-2025-6b8327	\N	Pending	30006	2025-03-21	2025-03-20	2025-04-20	299.98	299.98	0.00	0.00	0.00	0.00
PURCHASING-CRM-2025-8c527d	\N	Approved	30007	2025-03-22	2025-03-21	2025-04-21	0.00	0.00	0.00	0.00	0.00	0.00
PURCHASING-CRM-2025-4c19a9	\N	Approved	30008	2025-03-23	2025-03-22	2025-04-22	0.00	0.00	0.00	0.00	0.00	0.00
PURCHASING-CRM-2025-8ec5d3	\N	Pending	30009	2025-03-24	2025-03-23	2025-04-23	699.99	699.99	0.00	0.00	0.00	0.00
PURCHASING-CRM-2025-aa4586	\N	Approved	30010	2025-03-25	2025-03-24	2025-04-24	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- Data for Name: purchase_invoice; Type: TABLE DATA; Schema: purchasing; Owner: postgres
--

COPY purchasing.purchase_invoice (invoice_id, purchase_id, status, document_no, document_date, due_date, total_credit, credit_balance, dpm_rate, dpm_amount, applied_amount, balance_due) FROM stdin;
PURCHASING-PUI-2025-628096	\N	Completed	20001	2025-03-16	2025-04-15	0.00	0.00	0.00	0.00	1269.95	0.00
PURCHASING-PUI-2025-88f884	\N	Pending	20002	2025-03-17	2025-04-16	0.00	0.00	0.00	0.00	0.00	1924.90
PURCHASING-PUI-2025-2954e3	\N	Approved	20003	2025-03-18	2025-04-17	0.00	0.00	0.00	0.00	1000.00	2899.97
PURCHASING-PUI-2025-ecf97f	\N	Rejected	20004	2025-03-19	2025-04-18	0.00	0.00	0.00	0.00	0.00	900.48
PURCHASING-PUI-2025-74e331	\N	Completed	20005	2025-03-20	2025-04-19	0.00	0.00	0.00	0.00	1199.99	0.00
PURCHASING-PUI-2025-2bae7f	\N	Pending	20006	2025-03-21	2025-04-20	0.00	0.00	0.00	0.00	0.00	416.72
PURCHASING-PUI-2025-d651e3	\N	Approved	20007	2025-03-22	2025-04-21	0.00	0.00	0.00	0.00	350.00	349.97
PURCHASING-PUI-2025-eb9f3d	\N	Rejected	20008	2025-03-23	2025-04-22	0.00	0.00	0.00	0.00	0.00	779.99
PURCHASING-PUI-2025-43e7fe	\N	Completed	20009	2025-03-24	2025-04-23	0.00	0.00	0.00	0.00	1404.98	0.00
PURCHASING-PUI-2025-f563c9	\N	Pending	20010	2025-03-25	2025-04-24	0.00	0.00	0.00	0.00	0.00	518.96
\.


--
-- Data for Name: purchase_order; Type: TABLE DATA; Schema: purchasing; Owner: postgres
--

COPY purchasing.purchase_order (purchase_id, quotation_id, order_date, delivery_date, document_date, status) FROM stdin;
PURCHASING-PUO-2025-786ba4	\N	2025-03-05	2025-03-15	2025-03-05	Completed
PURCHASING-PUO-2025-a808cd	\N	2025-03-06	2025-03-16	2025-03-06	Pending
PURCHASING-PUO-2025-95a05e	\N	2025-03-07	2025-03-17	2025-03-07	Approved
PURCHASING-PUO-2025-8f0054	\N	2025-03-08	2025-03-18	2025-03-08	Rejected
PURCHASING-PUO-2025-06eea4	\N	2025-03-09	2025-03-19	2025-03-09	Completed
PURCHASING-PUO-2025-4822d4	\N	2025-03-10	2025-03-20	2025-03-10	Pending
PURCHASING-PUO-2025-83f2aa	\N	2025-03-11	2025-03-21	2025-03-11	Approved
PURCHASING-PUO-2025-5014a9	\N	2025-03-12	2025-03-22	2025-03-12	Rejected
PURCHASING-PUO-2025-4dbb0d	\N	2025-03-13	2025-03-23	2025-03-13	Completed
PURCHASING-PUO-2025-8cec0c	\N	2025-03-14	2025-03-24	2025-03-14	Pending
\.


--
-- Data for Name: purchase_quotation; Type: TABLE DATA; Schema: purchasing; Owner: postgres
--

COPY purchasing.purchase_quotation (quotation_id, vendor_code, quotation_content_id, status, document_no, valid_date, document_date, required_date, total_before_discount, discount_percent, freight, tax, total_payment) FROM stdin;
PURCHASING-PUQ-2025-72b0e7	\N	\N	Approved	10001	2025-04-01	2025-03-01	2025-03-15	1249.95	10.00	50.00	93.75	1269.95
PURCHASING-PUQ-2025-8fae8b	\N	\N	Pending	10002	2025-04-02	2025-03-02	2025-03-16	1899.90	5.00	75.00	142.49	1924.90
PURCHASING-PUQ-2025-51c2c9	\N	\N	Approved	10003	2025-04-03	2025-03-03	2025-03-17	3899.97	10.00	0.00	389.99	3899.97
PURCHASING-PUQ-2025-680ff7	\N	\N	Rejected	10004	2025-04-04	2025-03-04	2025-03-18	899.98	5.00	45.00	67.50	900.48
PURCHASING-PUQ-2025-91d1e6	\N	\N	Approved	10005	2025-04-05	2025-03-05	2025-03-19	999.99	0.00	100.00	100.00	1199.99
PURCHASING-PUQ-2025-985ded	\N	\N	Pending	10006	2025-04-06	2025-03-06	2025-03-20	449.97	15.00	30.00	33.75	416.72
PURCHASING-PUQ-2025-0c48c7	\N	\N	Approved	10007	2025-04-07	2025-03-07	2025-03-21	599.98	0.00	40.00	59.99	699.97
PURCHASING-PUQ-2025-96d21b	\N	\N	Rejected	10008	2025-04-08	2025-03-08	2025-03-22	799.99	10.00	60.00	72.00	779.99
PURCHASING-PUQ-2025-b9494f	\N	\N	Approved	10009	2025-04-09	2025-03-09	2025-03-23	1399.98	5.00	70.00	105.00	1404.98
PURCHASING-PUQ-2025-f60f34	\N	\N	Pending	10010	2025-04-10	2025-03-10	2025-03-24	519.96	5.00	35.00	39.00	518.96
\.


--
-- Data for Name: purchase_requests; Type: TABLE DATA; Schema: purchasing; Owner: postgres
--

COPY purchasing.purchase_requests (request_id, employee_id, approval_id, material_id, asset_id, purchase_description, purchase_quantity, valid_date, document_date, required_date) FROM stdin;
PURCHASING-PUR-2025-e988ac	\N	\N	\N	\N	Standard office desk 150x70cm	5	2025-04-01	2025-03-01	2025-03-15
PURCHASING-PUR-2025-91ed03	\N	\N	\N	\N	Ergonomic office chair with adjustable armrests	10	2025-04-02	2025-03-02	2025-03-16
PURCHASING-PUR-2025-cc151a	\N	\N	\N	\N	Business laptop with i7 processor and 16GB RAM	3	2025-04-03	2025-03-03	2025-03-17
PURCHASING-PUR-2025-203f7e	\N	\N	\N	\N	Color laser printer with scanner	2	2025-04-04	2025-03-04	2025-03-18
PURCHASING-PUR-2025-300c37	\N	\N	\N	\N	Server rack 42U	1	2025-04-05	2025-03-05	2025-03-19
PURCHASING-PUR-2025-86ab57	\N	\N	\N	\N	24-port gigabit network switch	3	2025-04-06	2025-03-06	2025-03-20
PURCHASING-PUR-2025-2893d5	\N	\N	\N	\N	Uninterruptible power supply 1500VA	2	2025-04-07	2025-03-07	2025-03-21
PURCHASING-PUR-2025-1b62f6	\N	\N	\N	\N	Large conference table for 12 people	1	2025-04-08	2025-03-08	2025-03-22
PURCHASING-PUR-2025-d4d46f	\N	\N	\N	\N	4K business projector	2	2025-04-09	2025-03-09	2025-03-23
PURCHASING-PUR-2025-ef807d	\N	\N	\N	\N	Metal filing cabinet with 4 drawers	4	2025-04-10	2025-03-10	2025-03-24
\.


--
-- Data for Name: quotation_contents; Type: TABLE DATA; Schema: purchasing; Owner: postgres
--

COPY purchasing.quotation_contents (quotation_content_id, request_id, unit_price, discount, tax_code, total) FROM stdin;
PURCHASING-QUC-2025-f3884b	\N	249.99	10.00	TAX-001	1124.96
PURCHASING-QUC-2025-618622	\N	189.99	5.00	TAX-002	1804.91
PURCHASING-QUC-2025-74a6d0	\N	1299.99	100.00	TAX-003	3599.97
PURCHASING-QUC-2025-2ccd37	\N	449.99	20.00	TAX-004	859.98
PURCHASING-QUC-2025-d7475c	\N	999.99	0.00	TAX-005	999.99
PURCHASING-QUC-2025-296335	\N	149.99	15.00	TAX-006	382.47
PURCHASING-QUC-2025-a1ab6b	\N	299.99	0.00	TAX-007	599.98
PURCHASING-QUC-2025-3effdf	\N	799.99	50.00	TAX-008	749.99
PURCHASING-QUC-2025-fe89c6	\N	699.99	30.00	TAX-009	1369.98
PURCHASING-QUC-2025-15bd0d	\N	129.99	5.00	TAX-010	494.96
\.


--
-- Data for Name: received_shipments; Type: TABLE DATA; Schema: purchasing; Owner: postgres
--

COPY purchasing.received_shipments (shipment_id, purchase_id, delivery_date) FROM stdin;
PURCHASING-RES-2025-3d3fd4	\N	2025-03-15
PURCHASING-RES-2025-153803	\N	2025-03-16
PURCHASING-RES-2025-1f9296	\N	2025-03-17
PURCHASING-RES-2025-2b08d3	\N	2025-03-18
PURCHASING-RES-2025-e3ee11	\N	2025-03-19
PURCHASING-RES-2025-cdc1d4	\N	2025-03-20
PURCHASING-RES-2025-2eb58d	\N	2025-03-21
PURCHASING-RES-2025-29a621	\N	2025-03-22
PURCHASING-RES-2025-40b421	\N	2025-03-23
PURCHASING-RES-2025-fc095d	\N	2025-03-24
\.


--
-- Data for Name: vendor_application; Type: TABLE DATA; Schema: purchasing; Owner: postgres
--

COPY purchasing.vendor_application (application_reference, status, company_name, tax_number, contact_person, title, vendor_address, phone, fax, vendor_email, tax_exempt, vendor_website, organization_type, separate_checks, purchasing_card, account_no, routing_no, requestor, date_requested) FROM stdin;
PURCHASING-VEP-2025-fe23a1	Pending	Tech Solutions Inc	123456789	John Smith	CEO	123 Tech St, San Francisco, CA	5551234567	5551234568	contact@techsolutions.com	t	www.techsolutions.com	Corporation	f	t	987654321	123456	Mary Johnson	2025-01-15
PURCHASING-VEP-2025-a9c1a7	Approved	Office Supplies Co	234567890	Jane Doe	Sales Manager	456 Supply Ave, Chicago, IL	5552345678	5552345679	sales@officesupplies.com	f	www.officesupplies.com	LLC	t	t	876543210	234567	Bob Williams	2025-01-16
PURCHASING-VEP-2025-635bf3	Rejected	Industrial Parts Ltd	345678901	Mike Brown	Director	789 Industry Blvd, Detroit, MI	5553456789	5553456780	info@industrialparts.com	f	www.industrialparts.com	Corporation	f	f	765432109	345678	Sarah Davis	2025-01-17
PURCHASING-VEP-2025-aac665	Pending	Global Traders	456789012	Lisa Chen	Procurement Officer	101 Trade Center, New York, NY	5554567890	5554567891	info@globaltraders.com	t	www.globaltraders.com	Partnership	t	f	654321098	456789	Tom Wilson	2025-01-18
PURCHASING-VEP-2025-c67a79	Approved	Green Energy Solutions	567890123	David Green	Founder	202 Solar Way, Phoenix, AZ	5555678901	5555678902	contact@greenenergy.com	t	www.greenenergy.com	Nonprofit	f	t	543210987	567890	Emma Brown	2025-01-19
PURCHASING-VEP-2025-279551	Pending	Quality Manufacturing	678901234	Robert Taylor	Operations Manager	303 Quality Dr, Seattle, WA	5556789012	5556789013	operations@qualitymfg.com	f	www.qualitymfg.com	LLC	f	f	432109876	678901	Alex Johnson	2025-01-20
PURCHASING-VEP-2025-bd0e30	Approved	Food Distributors Inc	789012345	Maria Rodriguez	Supply Chain Manager	404 Food Way, Miami, FL	5557890123	5557890124	supply@fooddist.com	f	www.fooddist.com	Corporation	t	t	321098765	789012	Chris Lee	2025-01-21
PURCHASING-VEP-2025-c92ab1	Rejected	Construction Materials Co	890123456	James Wilson	President	505 Builder Ave, Denver, CO	5558901234	5558901235	info@constructionmat.com	f	www.constructionmat.com	Corporation	f	t	210987654	890123	Jennifer Adams	2025-01-22
PURCHASING-VEP-2025-d41bcf	Pending	Medical Supplies Ltd	901234567	Susan White	CEO	606 Health St, Boston, MA	5559012345	5559012346	contact@medicalsupplies.com	t	www.medicalsupplies.com	LLC	t	f	109876543	901234	Kevin Park	2025-01-23
PURCHASING-VEP-2025-5ee00a	Approved	Tech Innovations	123789456	Andrew Miller	Director	707 Innovation Way, Austin, TX	5551237894	5551237895	info@techinnovations.com	t	www.techinnovations.com	Sole Proprietorship	f	t	987123456	123789	Michelle Garcia	2025-01-24
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add return	6	add_return
22	Can change return	6	change_return
23	Can delete return	6	delete_return
24	Can view return	6	view_return
25	Can add credit memo	7	add_creditmemo
26	Can change credit memo	7	change_creditmemo
27	Can delete credit memo	7	delete_creditmemo
28	Can view credit memo	7	view_creditmemo
29	Can add session	8	add_session
30	Can change session	8	change_session
31	Can delete session	8	delete_session
32	Can view session	8	view_session
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
3	pbkdf2_sha256$870000$Ffm38VfMbR0BNRX2wQ7RzG$4Ym31peqUWG0FBYQ0E/LkFv8Sy1dvEnFpooZcdwL3NU=	2025-04-01 21:32:04.910386+08	t	admin				t	t	2025-04-01 21:32:00.187958+08
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: blanket_agreement; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.blanket_agreement (agreement_id, statement_id, start_date, end_date, status, description, signed_date, agreement_method) FROM stdin;
\.


--
-- Data for Name: campaign_contacts; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.campaign_contacts (contact_id, customer_id, campaign_id, response_status) FROM stdin;
SALES-CONTACT-2025-d4d849	\N	\N	Interested
SALES-CONTACT-2025-ad02f5	\N	\N	Not Interested
SALES-CONTACT-2025-32f144	\N	\N	Pending
SALES-CONTACT-2025-42419c	\N	\N	Interested
SALES-CONTACT-2025-58aa23	\N	\N	Not Interested
SALES-CONTACT-2025-94e3e8	\N	\N	Interested
SALES-CONTACT-2025-56c619	\N	\N	Pending
SALES-CONTACT-2025-be6c07	\N	\N	Not Interested
SALES-CONTACT-2025-9e7baa	\N	\N	Interested
SALES-CONTACT-2025-65ad4f	\N	\N	Pending
SALES-CONTACT-2025-426954	\N	\N	Interested
SALES-CONTACT-2025-6f4cbe	\N	\N	Not Interested
SALES-CONTACT-2025-70f7b2	\N	\N	Pending
SALES-CONTACT-2025-c11416	\N	\N	Interested
SALES-CONTACT-2025-d3c850	\N	\N	Not Interested
SALES-CONTACT-2025-4db949	\N	\N	Interested
SALES-CONTACT-2025-eccef0	\N	\N	Pending
SALES-CONTACT-2025-2330d1	\N	\N	Not Interested
SALES-CONTACT-2025-dfd649	\N	\N	Interested
SALES-CONTACT-2025-b846a8	\N	\N	Pending
\.


--
-- Data for Name: campaigns; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.campaigns (campaign_id, campaign_name, type, start_date, end_date) FROM stdin;
SALES-CMPGN-2025-53556f	New Medical Equipment Launch	Email	2025-04-01 08:00:00	2025-04-15 23:59:59
SALES-CMPGN-2025-8f4be3	Exclusive Discount for Clinics	Email	2025-03-20 08:00:00	2025-04-05 23:59:59
SALES-CMPGN-2025-4e9d6d	Hospital Procurement Webinar	Email	2025-03-10 08:00:00	2025-03-15 23:59:59
SALES-CMPGN-2025-c40919	Free Sample: Surgical Masks	Email	2025-04-10 08:00:00	2025-04-20 23:59:59
SALES-CMPGN-2025-af99c5	Loyalty Rewards for Pharmacies	Email	2025-03-01 08:00:00	2025-03-31 23:59:59
SALES-CMPGN-2025-9a8a70	Medical Device Compliance Update	Email	2025-02-20 08:00:00	2025-03-05 23:59:59
SALES-CMPGN-2025-5a3fa7	Healthcare Expo Invitation	Email	2025-04-05 08:00:00	2025-04-25 23:59:59
SALES-CMPGN-2025-2007ef	Exclusive Bulk Order Offer	Email	2025-03-15 08:00:00	2025-03-30 23:59:59
SALES-CMPGN-2025-240efc	New FDA-Approved Products	Email	2025-02-10 08:00:00	2025-02-28 23:59:59
SALES-CMPGN-2025-4e26ea	Emergency Medical Supplies Sale	Email	2025-04-12 08:00:00	2025-04-22 23:59:59
SALES-CMPGN-2025-407f1e	Medical Equipment Expo 2025	Email	2025-05-01 08:00:00	2025-05-15 23:59:59
SALES-CMPGN-2025-b128e9	Pharmacy Discount Campaign	Email	2025-04-10 08:00:00	2025-04-25 23:59:59
SALES-CMPGN-2025-2b482e	Healthcare Innovation Webinar	Email	2025-03-25 08:00:00	2025-04-05 23:59:59
SALES-CMPGN-2025-3a4583	Free Sample: Diagnostic Kits	Email	2025-05-05 08:00:00	2025-05-20 23:59:59
SALES-CMPGN-2025-62b65b	Loyalty Program for Hospitals	Email	2025-04-01 08:00:00	2025-04-30 23:59:59
SALES-CMPGN-2025-61b8b2	Medical Compliance Training	Email	2025-03-15 08:00:00	2025-03-25 23:59:59
SALES-CMPGN-2025-23e94d	Healthcare Summit Invitation	Email	2025-05-10 08:00:00	2025-05-30 23:59:59
SALES-CMPGN-2025-8f06a9	Exclusive Offer: Lab Equipment	Email	2025-04-15 08:00:00	2025-04-30 23:59:59
SALES-CMPGN-2025-ef1fc3	New Product Launch: Ventilators	Email	2025-03-20 08:00:00	2025-04-10 23:59:59
SALES-CMPGN-2025-ed1830	Emergency Supplies Discount	Email	2025-05-12 08:00:00	2025-05-25 23:59:59
\.


--
-- Data for Name: credit_memo; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.credit_memo (credit_memo_id, created_at, due_date, total_amount) FROM stdin;
SALES-CM-2025-655eea	2024-03-01 10:00:00	2024-04-01	100.50
SALES-CM-2025-6016ed	2024-03-02 11:15:00	2024-04-02	250.00
SALES-CM-2025-952e10	2024-03-03 09:30:00	2024-04-03	75.99
SALES-CM-2025-3ef6aa	2024-03-04 14:20:00	2024-04-04	190.75
SALES-CM-2025-e239da	2024-03-05 16:45:00	2024-04-05	325.40
SALES-CM-2025-713350	2024-03-06 08:10:00	2024-04-06	50.00
SALES-CM-2025-3d7773	2024-03-07 13:25:00	2024-04-07	410.25
SALES-CM-2025-e7e82e	2024-03-08 12:40:00	2024-04-08	90.99
SALES-CM-2025-5f7dc8	2024-03-09 15:55:00	2024-04-09	210.60
SALES-CM-2025-533c19	2024-03-10 10:05:00	2024-04-10	500.00
SALES-CM-2025-6051b2	2024-03-11 17:20:00	2024-04-11	150.30
SALES-CM-2025-ea7677	2024-03-12 08:30:00	2024-04-12	275.90
SALES-CM-2025-bca470	2024-03-13 14:10:00	2024-04-13	30.75
SALES-CM-2025-d22827	2024-03-14 12:50:00	2024-04-14	105.00
SALES-CM-2025-84cfc2	2024-03-15 09:45:00	2024-04-15	495.60
SALES-CM-2025-5d8d68	2024-03-16 11:35:00	2024-04-16	350.00
SALES-CM-2025-b067ec	2024-03-17 16:05:00	2024-04-17	225.20
SALES-CM-2025-f357f1	2024-03-18 13:15:00	2024-04-18	89.99
SALES-CM-2025-4df451	2024-03-19 10:50:00	2024-04-19	190.00
SALES-CM-2025-3ceb16	2024-03-20 15:25:00	2024-04-20	99.99
\.


--
-- Data for Name: customers; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.customers (customer_id, gl_account_id, partner_id, name, contact_person, email_address, phone_number, address_line1, address_line2, city, postal_code, country, customer_type, status, debt) FROM stdin;
SALES-CUST-2025-a69232	ACC-GLA-2025-8c1a03	ADMIN-PARTNER-2025-bf0a9c	St. Luke's Medical Center	Dr. Maria Santos	contact@stlukes.com.ph	+63-2-8723-0101	279 E. Rodriguez Sr. Avenue	Quezon City	Quezon City	1112	Philippines	Client	Active	1500.00
SALES-CUST-2025-6e52b0	ACC-GLA-2025-e73ded	ADMIN-PARTNER-2025-bb4208	Makati Medical Center	Mr. Juan Dela Cruz	info@makatimed.com.ph	+63-2-8888-9999	2 Amorsolo Street	Legaspi Village	Makati	1229	Philippines	Client	Active	2500.00
SALES-CUST-2025-cd3925	ACC-GLA-2025-5adc04	ADMIN-PARTNER-2025-ec82df	The Medical City	Dr. Robert Lim	support@medicalcity.com.ph	+63-2-8639-2000	Ortigas Avenue	Pasig City	Pasig	1605	Philippines	Client	Active	0.00
SALES-CUST-2025-12765a	ACC-GLA-2025-59a2c5	ADMIN-PARTNER-2025-a64113	Asian Hospital and Medical Center	Ms. Anna Reyes	sales@asianhospital.com.ph	+63-2-8771-9000	2205 Civic Drive	Filinvest City	Muntinlupa	1781	Philippines	Prospect	Active	500.00
SALES-CUST-2025-12ab0e	ACC-GLA-2025-2847f3	ADMIN-PARTNER-2025-e0ed39	Philippine General Hospital	Dr. Carlos Garcia	contact@pgh.gov.ph	+63-2-8554-8400	Taft Avenue	Ermita	Manila	1000	Philippines	Client	Active	2000.00
SALES-CUST-2025-16e575	ACC-GLA-2025-0d54e9	ADMIN-PARTNER-2025-b892ae	Manila Doctors Hospital	Mr. Luis Tan	support@maniladoctors.com.ph	+63-2-8558-0888	667 United Nations Avenue	Ermita	Manila	1000	Philippines	Client	Active	300.00
SALES-CUST-2025-72570c	ACC-GLA-2025-9b003c	ADMIN-PARTNER-2025-1ab567	Cardinal Santos Medical Center	Dr. Sofia Ramirez	info@cardinalsantos.com.ph	+63-2-8727-0001	10 Wilson Street	Greenhills	San Juan	1502	Philippines	Client	Active	750.00
SALES-CUST-2025-78f344	ACC-GLA-2025-8b24f4	ADMIN-PARTNER-2025-dc8622	World Citi Medical Center	Ms. Patricia Go	billing@worldciti.com.ph	+63-2-8913-8380	960 Aurora Blvd	Cubao	Quezon City	1109	Philippines	Prospect	Active	500.00
SALES-CUST-2025-868810	ACC-GLA-2025-b445f1	ADMIN-PARTNER-2025-aaa05a	Davao Doctors Hospital	Dr. Miguel Torres	orders@davaodoctors.com.ph	+63-82-222-8000	118 E. Quirino Avenue	Poblacion	Davao City	8000	Philippines	Client	Active	650.00
SALES-CUST-2025-4ff5f8	ACC-GLA-2025-67d978	ADMIN-PARTNER-2025-d2555e	Cebu Doctors University Hospital	Dr. Elena Wong	contact@cebudoctors.com.ph	+63-32-255-5555	Osmeña Boulevard	Capitol Site	Cebu City	6000	Philippines	Client	Active	0.00
SALES-CUST-2025-1fc7a8	ACC-GLA-2025-213205	ADMIN-PARTNER-2025-ca6128	Metro Manila Medical Center	Mr. Daniel Lim	info@metromanilamed.com.ph	+63-2-8711-4141	1357 G. Masangkay Street	Binondo	Manila	1006	Philippines	Client	Active	1250.00
SALES-CUST-2025-290d05	ACC-GLA-2025-25cd68	ADMIN-PARTNER-2025-e820cf	East Avenue Medical Center	Dr. Andrea Cruz	contact@eastave.com.ph	+63-2-8928-0611	East Avenue	Diliman	Quezon City	1101	Philippines	Client	Active	950.00
SALES-CUST-2025-8151a1	ACC-GLA-2025-6bc018	ADMIN-PARTNER-2025-e20486	Capitol Medical Center	Ms. Grace Sy	support@capitolmedical.com.ph	+63-2-8372-3825	Quezon Avenue	Diliman	Quezon City	1101	Philippines	Client	Active	1800.00
SALES-CUST-2025-9594b6	ACC-GLA-2025-174d6a	ADMIN-PARTNER-2025-048e24	Ospital ng Makati	Dr. Mark Villanueva	info@ospitalngmakati.com.ph	+63-2-8828-8443	J.P. Rizal Avenue	Poblacion	Makati	1210	Philippines	Prospect	Active	600.00
SALES-CUST-2025-be5085	ACC-GLA-2025-8b0e21	ADMIN-PARTNER-2025-52a74d	Lung Center of the Philippines	Dr. Susan Chua	contact@lungcenter.com.ph	+63-2-8924-6101	Quezon Avenue	Diliman	Quezon City	1101	Philippines	Client	Active	0.00
SALES-CUST-2025-673faf	ACC-GLA-2025-9c7d3b	ADMIN-PARTNER-2025-f2d6e6	National Kidney and Transplant Institute	Dr. Paul Chen	support@nkti.gov.ph	+63-2-8981-0300	East Avenue	Diliman	Quezon City	1100	Philippines	Client	Active	2300.00
SALES-CUST-2025-0a646e	ACC-GLA-2025-5f8439	ADMIN-PARTNER-2025-4acaea	Rizal Medical Center	Ms. Lourdes Mendoza	info@rizalmed.com.ph	+63-2-8941-2911	Pasig Boulevard	Maybunga	Pasig	1607	Philippines	Client	Active	3000.00
SALES-CUST-2025-67e405	ACC-GLA-2025-74d3c2	ADMIN-PARTNER-2025-c08b60	Quirino Memorial Medical Center	Dr. Henry Ong	support@quirinomemorial.com.ph	+63-2-8913-7890	Katipunan Avenue	Project 4	Quezon City	1109	Philippines	Client	Active	700.00
SALES-CUST-2025-63b81d	ACC-GLA-2025-f48054	ADMIN-PARTNER-2025-177300	Jose R. Reyes Memorial Medical Center	Dr. Carmen Lim	info@jrrmmc.gov.ph	+63-2-8731-3229	Rizal Avenue	Sta. Cruz	Manila	1003	Philippines	Prospect	Active	400.00
SALES-CUST-2025-8b435b	ACC-GLA-2025-a63cc3	ADMIN-PARTNER-2025-c5758e	Perpetual Help Medical Center	Mr. Anthony Yu	contact@perpetualhelp.com.ph	+63-2-8871-0639	Alabang-Zapote Road	Pamplona	Las Piñas	1740	Philippines	Client	Active	1250.00
\.


--
-- Data for Name: delivery_note; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.delivery_note (delivery_note_id, order_id, statement_id, rework_id, goods_issue_id, shipment_id, shipping_method, tracking_num, shipping_date, estimated_delivery, delivery_status, created_at) FROM stdin;
SALES-SHIP-2025-255686	SALES-ORD-2025-1273fc	SALES-STM-2025-e55775	\N	DIS-GI-2025-e66416	DIS-SD-2025-6a0809	Standard	asd10	2023-03-15 00:00:00	2023-03-16 10:00:00	Delivered	2025-04-01 17:08:48
SALES-SHIP-2025-9164cf	SALES-ORD-2025-3fd685	SALES-STM-2025-777837	\N	\N	\N	Standard	\N	\N	\N	Pending	2025-04-01 18:16:26.064724
SALES-SHIP-2025-fbec42	SALES-ORD-2025-27df58	SALES-STM-2025-49bc49	\N	\N	\N	Standard	\N	\N	\N	Pending	2025-04-01 18:17:07.754678
SALES-SHIP-2025-9fd7b4	SALES-ORD-2025-88bdf8	SALES-STM-2025-81931a	\N	\N	\N	Standard	\N	\N	\N	Pending	2025-04-01 18:18:04.603952
SALES-SHIP-2025-28609a	SALES-ORD-2025-314a10	SALES-STM-2025-67ee83	\N	\N	\N	Standard	\N	\N	\N	Pending	2025-04-01 18:29:05.473124
SALES-SHIP-2025-50a335	SALES-ORD-2025-02d80f	SALES-STM-2025-04c0f4	\N	\N	\N	Standard	\N	\N	\N	Pending	2025-04-01 18:32:22.677136
SALES-SHIP-2025-430176	SALES-ORD-2025-1323c9	SALES-STM-2025-70b4a1	\N	\N	\N	Standard	\N	\N	\N	Pending	2025-04-01 18:34:22.385346
SALES-SHIP-2025-c4d8de	SALES-ORD-2025-5ea3d9	SALES-STM-2025-1105c7	\N	\N	\N	Standard	\N	\N	\N	Pending	2025-04-01 18:36:56.841702
SALES-SHIP-2025-961a75	SALES-ORD-2025-970600	SALES-STM-2025-8885de	\N	\N	\N	Standard	\N	\N	\N	Pending	2025-04-01 19:03:38.941069
SALES-SHIP-2025-49d7a9	SALES-ORD-2025-dca0d6	SALES-STM-2025-75dfc8	\N	\N	\N	Standard	\N	\N	\N	Pending	2025-04-01 19:13:08.624965
SALES-SHIP-2025-04a7c8	SALES-ORD-2025-f789f0	SALES-STM-2025-fb1cfd	\N	\N	\N	Standard	\N	\N	\N	Pending	2025-04-01 16:49:04.4549
SALES-SHIP-2025-6afaad	SALES-ORD-2025-1273fc	SALES-STM-2025-fd67dd	\N	DIS-GI-2025-dc3c46	DIS-SD-2025-e53c03	Standard	asd6	2023-03-15 00:00:00	2023-03-16 10:00:00	Delivered	2025-04-01 17:28:37
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2025-04-01 21:33:26.181714+08	a	Employees object (a)	1	[{"added": {}}]	9	3
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	returns	return
7	returns	creditmemo
8	sessions	session
9	misc	employees
10	misc	departments
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2025-04-01 21:30:12.106376+08
2	auth	0001_initial	2025-04-01 21:30:12.163641+08
3	admin	0001_initial	2025-04-01 21:30:12.177911+08
4	admin	0002_logentry_remove_auto_add	2025-04-01 21:30:12.180844+08
5	admin	0003_logentry_add_action_flag_choices	2025-04-01 21:30:12.188001+08
6	sessions	0001_initial	2025-04-01 21:30:15.756861+08
7	contenttypes	0002_remove_content_type_name	2025-04-01 21:31:42.988123+08
8	auth	0002_alter_permission_name_max_length	2025-04-01 21:31:42.995737+08
9	auth	0003_alter_user_email_max_length	2025-04-01 21:31:43.000564+08
10	auth	0004_alter_user_username_opts	2025-04-01 21:31:43.00458+08
11	auth	0005_alter_user_last_login_null	2025-04-01 21:31:43.010565+08
12	auth	0006_require_contenttypes_0002	2025-04-01 21:31:43.010565+08
13	auth	0007_alter_validators_add_error_messages	2025-04-01 21:31:43.01639+08
14	auth	0008_alter_user_username_max_length	2025-04-01 21:31:43.026921+08
15	auth	0009_alter_user_last_name_max_length	2025-04-01 21:31:43.032702+08
16	auth	0010_alter_group_name_max_length	2025-04-01 21:31:43.040857+08
17	auth	0011_update_proxy_permissions	2025-04-01 21:31:43.04626+08
18	auth	0012_alter_user_first_name_max_length	2025-04-01 21:31:43.050691+08
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.django_session (session_key, session_data, expire_date) FROM stdin;
5yww8pzh6fzx4ndoi1tq11sarlza6va1	.eJxVjDsOwjAQBe_iGllW1l9Kes5grb1rHEC2FCcV4u4QKQW0b2beS0Tc1hq3wUucSZwFiNPvljA_uO2A7thuXebe1mVOclfkQYe8duLn5XD_DiqO-q2D5YxUvEINJoC3SQU0wA4omBx0IZeUVpZSmVRGj6Am770D5lx0KeL9AemxOEc:1tzbim:JxF1WHexR5eCRdH6a0VPt3zCYxAtUj2jPZvEnL_sP3E	2025-04-15 21:32:04.912403+08
\.


--
-- Data for Name: opportunities; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.opportunities (opportunity_id, customer_id, partner_id, salesrep_id, estimated_value, weighted_amount, gross_profit_percentage, gross_profit_total, starting_date, expected_closed_date, stage, status, description, reason_lost, interest_level) FROM stdin;
SALES-OPP-2025-f4e88e	\N	\N	\N	250000.00	200000.00	20.00	50000.00	2025-04-01 20:26:50.269297	2025-05-15	Prospecting	Open	Potential MRI scanner bulk order for hospital.	\N	High
SALES-OPP-2025-581618	\N	\N	\N	150000.00	120000.00	15.00	22500.00	2025-04-01 20:26:50.269297	2025-04-20	Negotiation	Open	Negotiating pricing for ventilators.	\N	Medium
SALES-OPP-2025-594333	\N	\N	\N	10000.00	9000.00	10.00	1000.00	2025-04-01 20:26:50.269297	2025-03-30	Closed	Won	Sold 500 surgical gloves.	\N	Low
SALES-OPP-2025-2396e9	\N	\N	\N	75000.00	60000.00	18.00	13500.00	2025-04-01 20:26:50.269297	2025-06-01	Prospecting	Open	New client interested in defibrillators.	\N	Medium
SALES-OPP-2025-97e5fd	\N	\N	\N	500000.00	450000.00	12.00	60000.00	2025-04-01 20:26:50.269297	2025-07-01	Negotiation	Lost	Large order for hospital beds.	Customer chose competitor.	High
SALES-OPP-2025-b6880a	\N	\N	\N	20000.00	18000.00	10.00	2000.00	2025-04-01 20:26:50.269297	2025-05-10	Closed	Won	Sold 200 syringes and 50 BP monitors.	\N	Low
SALES-OPP-2025-315606	\N	\N	\N	8000.00	7000.00	12.50	1000.00	2025-04-01 20:26:50.269297	2025-04-25	Closed	Lost	Small clinic interested in ECG machine.	Budget constraints.	Low
SALES-OPP-2025-970cd8	\N	\N	\N	95000.00	85000.00	15.00	14250.00	2025-04-01 20:26:50.269297	2025-05-20	Prospecting	Open	Potential deal for 3 new dialysis machines.	\N	Medium
SALES-OPP-2025-c1a32c	\N	\N	\N	12000.00	10000.00	20.00	2400.00	2025-04-01 20:26:50.269297	2025-06-10	Negotiation	Open	Service maintenance contract for medical equipment.	\N	High
SALES-OPP-2025-0f2f34	\N	\N	\N	180000.00	160000.00	11.00	19800.00	2025-04-01 20:26:50.269297	2025-06-30	Closed	Won	Bulk order for surgical gloves and hospital furniture.	\N	Medium
SALES-OPP-2025-e96b1a	\N	\N	\N	300000.00	270000.00	10.00	30000.00	2025-04-01 20:26:50.269297	2025-06-15	Prospecting	Open	Potential deal for CT scanners.	\N	High
SALES-OPP-2025-abb8f3	\N	\N	\N	120000.00	110000.00	8.00	9600.00	2025-04-01 20:26:50.269297	2025-05-20	Negotiation	Open	Negotiating pricing for ultrasound machines.	\N	Medium
SALES-OPP-2025-70d97d	\N	\N	\N	15000.00	14000.00	6.00	900.00	2025-04-01 20:26:50.269297	2025-04-30	Closed	Won	Sold 1000 surgical masks.	\N	Low
SALES-OPP-2025-937aae	\N	\N	\N	90000.00	85000.00	5.00	4500.00	2025-04-01 20:26:50.269297	2025-07-01	Prospecting	Open	New client interested in MRI machines.	\N	Medium
SALES-OPP-2025-bc3b3c	\N	\N	\N	600000.00	550000.00	9.00	54000.00	2025-04-01 20:26:50.269297	2025-08-01	Negotiation	Lost	Large order for ventilators.	Customer chose competitor.	High
SALES-OPP-2025-9778cf	\N	\N	\N	25000.00	23000.00	7.00	1750.00	2025-04-01 20:26:50.269297	2025-06-10	Closed	Won	Sold 300 syringes and 100 BP monitors.	\N	Low
SALES-OPP-2025-6e881a	\N	\N	\N	10000.00	8000.00	12.50	1250.00	2025-04-01 20:26:50.269297	2025-05-25	Closed	Lost	Small clinic interested in X-ray machine.	Budget constraints.	Low
SALES-OPP-2025-b2136f	\N	\N	\N	110000.00	95000.00	14.00	15400.00	2025-04-01 20:26:50.269297	2025-06-20	Prospecting	Open	Potential deal for 5 new dialysis machines.	\N	Medium
SALES-OPP-2025-d3062f	\N	\N	\N	18000.00	16000.00	10.00	1800.00	2025-04-01 20:26:50.269297	2025-07-10	Negotiation	Open	Service maintenance contract for lab equipment.	\N	Medium
SALES-OPP-2025-f6aa3f	\N	\N	\N	200000.00	175000.00	12.00	24000.00	2025-04-01 20:26:50.269297	2025-07-30	Closed	Won	Bulk order for surgical gloves and hospital beds.	\N	High
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.orders (order_id, quotation_id, statement_id, ext_project_request_id, order_date, order_type) FROM stdin;
SALES-ORD-2025-f789f0	SALES-QT-2025-5be120	SALES-STM-2025-9105e1	\N	2025-04-01 16:48:44.151	Non-Project-Based
SALES-ORD-2025-1273fc	SALES-QT-2025-7c7680	SALES-STM-2025-f8b841	\N	2025-04-01 16:52:52.331	Non-Project-Based
SALES-ORD-2025-1619c8	\N	SALES-STM-2025-2aa597	\N	2025-04-01 18:06:52.553	Non-Project-Based
SALES-ORD-2025-3fd685	SALES-QT-2025-04ee28	SALES-STM-2025-3c22a1	\N	2025-04-01 18:16:19.127	Non-Project-Based
SALES-ORD-2025-27df58	SALES-QT-2025-1ca651	SALES-STM-2025-1999b1	\N	2025-04-01 18:17:02.572	Non-Project-Based
SALES-ORD-2025-88bdf8	SALES-QT-2025-8da121	SALES-STM-2025-51e50c	\N	2025-04-01 18:17:59.088	Non-Project-Based
SALES-ORD-2025-314a10	SALES-QT-2025-fc8487	SALES-STM-2025-be0b7c	\N	2025-04-01 18:28:19.876	Non-Project-Based
SALES-ORD-2025-02d80f	SALES-QT-2025-35770a	SALES-STM-2025-bb52c2	\N	2025-04-01 18:32:14.972	Non-Project-Based
SALES-ORD-2025-1323c9	SALES-QT-2025-3a8d21	SALES-STM-2025-da2976	\N	2025-04-01 18:34:14.518	Non-Project-Based
SALES-ORD-2025-5ea3d9	SALES-QT-2025-09002a	SALES-STM-2025-0ec1b5	\N	2025-04-01 18:36:50.751	Non-Project-Based
SALES-ORD-2025-970600	SALES-QT-2025-52d934	SALES-STM-2025-ecc6d5	\N	2025-04-01 19:03:28.694	Non-Project-Based
SALES-ORD-2025-dca0d6	SALES-QT-2025-6b338e	SALES-STM-2025-864320	\N	2025-04-01 19:12:43.354	Non-Project-Based
\.


--
-- Data for Name: payments; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.payments (payment_id, order_id, payment_method, payment_status, payment_date) FROM stdin;
\.


--
-- Data for Name: product_pricing; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.product_pricing (product_id, admin_product_id, markup_percentage, selling_price, demand_level) FROM stdin;
SALE-PRDP-2025-68abee	ADMIN-PROD-2025-d1d28f	20.00	57271.97	Low
SALE-PRDP-2025-574e0d	ADMIN-PROD-2025-451316	20.00	13141.44	Low
SALE-PRDP-2025-2594ad	ADMIN-PROD-2025-c676ee	20.00	1337599.20	Low
SALE-PRDP-2025-638ba9	ADMIN-PROD-2025-ab43a3	20.00	262080.00	Low
SALE-PRDP-2025-34d7a3	ADMIN-PROD-2025-42859a	20.00	299707.20	Low
SALE-PRDP-2025-445e26	ADMIN-PROD-2025-279e71	20.00	162319.25	Low
SALE-PRDP-2025-757a8a	ADMIN-PROD-2025-fcf095	20.00	154440.00	Low
SALE-PRDP-2025-b6e42b	ADMIN-PROD-2025-0e8d5d	20.00	154440.00	Low
SALE-PRDP-2025-ec59a4	ADMIN-PROD-2025-88bc68	20.00	311452.13	Low
SALE-PRDP-2025-4cafc6	ADMIN-PROD-2025-126bfc	20.00	262407.60	Low
SALE-PRDP-2025-37fc4f	ADMIN-PROD-2025-9b3fcc	20.00	4745.52	Low
SALE-PRDP-2025-780d8b	ADMIN-PROD-2025-14a1f6	20.00	4745.52	Low
SALE-PRDP-2025-431ded	ADMIN-PROD-2025-09cd4c	20.00	4745.52	Low
SALE-PRDP-2025-4f978a	ADMIN-PROD-2025-832b17	20.00	4745.52	Low
SALE-PRDP-2025-e3dfc3	ADMIN-PROD-2025-495de1	20.00	4745.52	Low
SALE-PRDP-2025-5dfb1b	ADMIN-PROD-2025-69b24a	20.00	4745.52	Low
SALE-PRDP-2025-7b0813	ADMIN-PROD-2025-f2d420	20.00	7291.44	Low
SALE-PRDP-2025-074e81	ADMIN-PROD-2025-5e91ee	20.00	12907.44	Low
SALE-PRDP-2025-b788cb	ADMIN-PROD-2025-b74a90	20.00	4680.00	Low
SALE-PRDP-2025-960a47	ADMIN-PROD-2025-6f64c1	20.00	2948.40	Low
SALE-PRDP-2025-908e06	ADMIN-PROD-2025-abdb73	20.00	38525.76	Low
SALE-PRDP-2025-4b5c38	ADMIN-PROD-2025-c4eadf	20.00	39948.48	Low
SALE-PRDP-2025-000b68	ADMIN-PROD-2025-af5a62	20.00	39948.48	Low
SALE-PRDP-2025-dfb33e	ADMIN-PROD-2025-6cf90c	20.00	39948.48	Low
SALE-PRDP-2025-1702fd	ADMIN-PROD-2025-4a8582	20.00	1001.52	Low
SALE-PRDP-2025-915bbc	ADMIN-PROD-2025-fb8af3	20.00	1001.52	Low
SALE-PRDP-2025-080bf8	ADMIN-PROD-2025-d8547c	20.00	936.00	Low
SALE-PRDP-2025-9e82f9	ADMIN-PROD-2025-aea873	20.00	2246.40	Low
SALE-PRDP-2025-f2394f	ADMIN-PROD-2025-b68e92	20.00	2246.40	Low
SALE-PRDP-2025-0741dc	ADMIN-PROD-2025-2d990a	20.00	6739.20	Low
\.


--
-- Data for Name: quotation; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.quotation (quotation_id, statement_id, agreement_id, date_issued) FROM stdin;
SALES-QT-2025-5be120	SALES-STM-2025-a27845	\N	2025-04-01 16:48:29.339612
SALES-QT-2025-7c7680	SALES-STM-2025-d346b6	\N	2025-04-01 16:52:43.410282
SALES-QT-2025-04ee28	SALES-STM-2025-87fffb	\N	2025-04-01 18:16:12.587358
SALES-QT-2025-1ca651	SALES-STM-2025-2ae8b9	\N	2025-04-01 18:16:57.598508
SALES-QT-2025-8da121	SALES-STM-2025-ee7a8b	\N	2025-04-01 18:17:40.617778
SALES-QT-2025-fc8487	SALES-STM-2025-7c5162	\N	2025-04-01 18:28:11.232004
SALES-QT-2025-35770a	SALES-STM-2025-c84d63	\N	2025-04-01 18:32:09.394827
SALES-QT-2025-3a8d21	SALES-STM-2025-e4dcd3	\N	2025-04-01 18:33:28.142157
SALES-QT-2025-09002a	SALES-STM-2025-56744a	\N	2025-04-01 18:36:26.412221
SALES-QT-2025-52d934	SALES-STM-2025-7d1c9d	\N	2025-04-01 19:02:58.774078
SALES-QT-2025-6b338e	SALES-STM-2025-fff6e5	\N	2025-04-01 19:12:08.301165
\.


--
-- Data for Name: renewal_warranty; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.renewal_warranty (renewal_id, order_id, customer_id, product_id, payments_id, service_request_id, original_warranty_start, original_warranty_end, renewal_warranty_start, renewal_warranty_end, renewal_status, created_at, updated_at, renewal_fee) FROM stdin;
SALES-RENEW-2025-3bad70	\N	\N	\N	\N	\N	2023-04-01	2024-04-01	2024-04-02	2025-04-01	Approved	2025-04-01 20:26:50.269297	2025-04-01 20:26:50.269297	5000.00
SALES-RENEW-2025-3e5aef	\N	\N	\N	\N	\N	2023-06-01	2024-06-01	2024-06-02	2025-06-01	Pending	2025-04-01 20:26:50.269297	2025-04-01 20:26:50.269297	3000.00
SALES-RENEW-2025-2adf49	\N	\N	\N	\N	\N	2023-07-15	2024-07-15	2024-07-16	2025-07-15	Rejected	2025-04-01 20:26:50.269297	2025-04-01 20:26:50.269297	2000.00
SALES-RENEW-2025-2987fe	\N	\N	\N	\N	\N	2022-08-01	2023-08-01	2023-08-02	2024-08-01	Approved	2025-04-01 20:26:50.269297	2025-04-01 20:26:50.269297	7000.00
SALES-RENEW-2025-665cd2	\N	\N	\N	\N	\N	2023-05-01	2024-05-01	2024-05-02	2025-05-01	Pending	2025-04-01 20:26:50.269297	2025-04-01 20:26:50.269297	4000.00
SALES-RENEW-2025-e7ed97	\N	\N	\N	\N	\N	2023-09-10	2024-09-10	2024-09-11	2025-09-10	Approved	2025-04-01 20:26:50.269297	2025-04-01 20:26:50.269297	1500.00
SALES-RENEW-2025-0528aa	\N	\N	\N	\N	\N	2023-10-20	2024-10-20	2024-10-21	2025-10-20	Rejected	2025-04-01 20:26:50.269297	2025-04-01 20:26:50.269297	2500.00
SALES-RENEW-2025-37ef1a	\N	\N	\N	\N	\N	2023-11-05	2024-11-05	2024-11-06	2025-11-05	Approved	2025-04-01 20:26:50.269297	2025-04-01 20:26:50.269297	6000.00
SALES-RENEW-2025-1e0399	\N	\N	\N	\N	\N	2023-12-01	2024-12-01	2024-12-02	2025-12-01	Pending	2025-04-01 20:26:50.269297	2025-04-01 20:26:50.269297	5000.00
SALES-RENEW-2025-3740ea	\N	\N	\N	\N	\N	2023-03-15	2024-03-15	2024-03-16	2025-03-15	Approved	2025-04-01 20:26:50.269297	2025-04-01 20:26:50.269297	3500.00
SALES-RENEW-2025-f4ad9b	\N	\N	\N	\N	\N	2023-05-01	2024-05-01	2024-05-02	2025-05-01	Approved	2025-04-01 20:26:50.269297	2025-04-01 20:26:50.269297	5500.00
SALES-RENEW-2025-959e05	\N	\N	\N	\N	\N	2023-07-01	2024-07-01	2024-07-02	2025-07-01	Pending	2025-04-01 20:26:50.269297	2025-04-01 20:26:50.269297	3200.00
SALES-RENEW-2025-294a09	\N	\N	\N	\N	\N	2023-08-15	2024-08-15	2024-08-16	2025-08-15	Rejected	2025-04-01 20:26:50.269297	2025-04-01 20:26:50.269297	2200.00
SALES-RENEW-2025-5bf4a0	\N	\N	\N	\N	\N	2022-09-01	2023-09-01	2023-09-02	2024-09-01	Approved	2025-04-01 20:26:50.269297	2025-04-01 20:26:50.269297	7500.00
SALES-RENEW-2025-3ac3d7	\N	\N	\N	\N	\N	2023-06-01	2024-06-01	2024-06-02	2025-06-01	Pending	2025-04-01 20:26:50.269297	2025-04-01 20:26:50.269297	4200.00
SALES-RENEW-2025-9770a5	\N	\N	\N	\N	\N	2023-10-10	2024-10-10	2024-10-11	2025-10-10	Approved	2025-04-01 20:26:50.269297	2025-04-01 20:26:50.269297	1600.00
SALES-RENEW-2025-82e51b	\N	\N	\N	\N	\N	2023-11-20	2024-11-20	2024-11-21	2025-11-20	Rejected	2025-04-01 20:26:50.269297	2025-04-01 20:26:50.269297	2600.00
SALES-RENEW-2025-3dea60	\N	\N	\N	\N	\N	2023-12-05	2024-12-05	2024-12-06	2025-12-05	Approved	2025-04-01 20:26:50.269297	2025-04-01 20:26:50.269297	6200.00
SALES-RENEW-2025-ffd3c7	\N	\N	\N	\N	\N	2024-01-01	2025-01-01	2025-01-02	2026-01-01	Pending	2025-04-01 20:26:50.269297	2025-04-01 20:26:50.269297	5100.00
SALES-RENEW-2025-b864c9	\N	\N	\N	\N	\N	2023-04-15	2024-04-15	2024-04-16	2025-04-15	Approved	2025-04-01 20:26:50.269297	2025-04-01 20:26:50.269297	3600.00
\.


--
-- Data for Name: return; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.return (return_id, statement_id, delivery_note_id, return_date, status, remarks) FROM stdin;
SALES-RTN-2025-a01973	\N	\N	2024-03-01 10:00:00	Pending	Customer requested return
SALES-RTN-2025-ad44d0	\N	\N	2024-03-02 11:15:00	Pending	Damaged item
SALES-RTN-2025-1b9b86	\N	\N	2024-03-03 09:30:00	Pending	Incorrect order
SALES-RTN-2025-3b6d68	\N	\N	2024-03-04 14:20:00	Pending	Customer changed mind
SALES-RTN-2025-5b2f7c	\N	\N	2024-03-05 16:45:00	Pending	Late delivery
SALES-RTN-2025-d62db5	\N	\N	2024-03-06 08:10:00	Pending	Quality issue
SALES-RTN-2025-221829	\N	\N	2024-03-07 13:25:00	Pending	Wrong size
SALES-RTN-2025-00328a	\N	\N	2024-03-08 12:40:00	Pending	Non-returnable item
SALES-RTN-2025-389c65	\N	\N	2024-03-09 15:55:00	Pending	Item defect
SALES-RTN-2025-118a45	\N	\N	2024-03-10 10:05:00	Pending	Wrong item shipped
SALES-RTN-2025-99b698	\N	\N	2024-03-11 17:20:00	Pending	Received incomplete package
SALES-RTN-2025-7f6bcf	\N	\N	2024-03-12 08:30:00	Pending	Return period expired
SALES-RTN-2025-fb8d88	\N	\N	2024-03-13 14:10:00	Pending	Product recall
SALES-RTN-2025-869dba	\N	\N	2024-03-14 12:50:00	Pending	Customer dissatisfaction
SALES-RTN-2025-0d0352	\N	\N	2024-03-15 09:45:00	Pending	No valid reason
SALES-RTN-2025-602455	\N	\N	2024-03-16 11:35:00	Pending	Missing parts
SALES-RTN-2025-67ec6c	\N	\N	2024-03-17 16:05:00	Pending	Delayed shipment
SALES-RTN-2025-479a31	\N	\N	2024-03-18 13:15:00	Pending	Warranty claim
SALES-RTN-2025-6b8dc4	\N	\N	2024-03-19 10:50:00	Pending	Defective packaging
SALES-RTN-2025-1a10fa	\N	\N	2024-03-20 15:25:00	Pending	Opened package
\.


--
-- Data for Name: sales_invoices; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.sales_invoices (invoice_id, delivery_note_id, invoice_date, total_amount, total_amount_paid) FROM stdin;
SALES-INV-2025-6e78dd	SALES-SHIP-2025-04a7c8	2025-04-01 16:49:04.4549	1897927.77	0.00
SALES-INV-2025-fa8aa1	SALES-SHIP-2025-9164cf	2025-04-01 18:16:26.064724	1503426.09	0.00
SALES-INV-2025-a908e3	SALES-SHIP-2025-fbec42	2025-04-01 18:17:07.754678	64144.61	0.00
SALES-INV-2025-1e5605	SALES-SHIP-2025-9fd7b4	2025-04-01 18:18:04.603952	225828.97	0.00
SALES-INV-2025-710a69	SALES-SHIP-2025-28609a	2025-04-01 18:29:05.473124	335672.06	0.00
SALES-INV-2025-7ae2a1	SALES-SHIP-2025-50a335	2025-04-01 18:32:22.677136	304306.33	0.00
SALES-INV-2025-c9abbb	SALES-SHIP-2025-430176	2025-04-01 18:34:22.385346	438495.89	0.00
SALES-INV-2025-ac24f7	SALES-SHIP-2025-c4d8de	2025-04-01 18:36:56.841702	1613013.93	0.00
SALES-INV-2025-3a8166	SALES-SHIP-2025-961a75	2025-04-01 19:03:38.941069	1572785.17	0.00
SALES-INV-2025-9b689c	SALES-SHIP-2025-49d7a9	2025-04-01 19:13:08.624965	4319.98	0.00
SALES-INV-2025-382810	SALES-SHIP-2025-6afaad	2025-04-01 17:28:37.855621	3702.21	3702.21
SALES-INV-2025-59a45e	SALES-SHIP-2025-255686	2025-04-01 17:08:48.231566	1060371.04	300000.00
\.


--
-- Data for Name: statement; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.statement (statement_id, customer_id, salesrep_id, total_amount, discount, total_tax, created_at) FROM stdin;
SALES-STM-2025-188dde	SALES-CUST-2025-a69232	HR-EMP-2025-4c4f53	1701942.83	0.00	167384.54	2025-04-01 13:51:53.570563
SALES-STM-2025-d0474b	SALES-CUST-2025-a69232	HR-EMP-2025-4c4f53	1701942.83	0.00	167384.54	2025-04-01 13:53:44.852507
SALES-STM-2025-a11266	SALES-CUST-2025-a69232	HR-EMP-2025-4c4f53	1701942.83	0.00	167384.54	2025-04-01 13:54:49.448863
SALES-STM-2025-fa9c0e	SALES-CUST-2025-a69232	HR-EMP-2025-4c4f53	1701942.83	0.00	167384.54	2025-04-01 13:55:24.472234
SALES-STM-2025-b16184	SALES-CUST-2025-a69232	HR-EMP-2025-4c4f53	1701942.83	0.00	167384.54	2025-04-01 13:56:28.565793
SALES-STM-2025-afdc0e	SALES-CUST-2025-a69232	HR-EMP-2025-4c4f53	1701942.83	0.00	167384.54	2025-04-01 14:09:46.899058
SALES-STM-2025-393a8f	SALES-CUST-2025-a69232	HR-EMP-2025-4c4f53	1701942.83	0.00	167384.54	2025-04-01 15:33:50.635766
SALES-STM-2025-a27845	SALES-CUST-2025-a69232	HR-EMP-2025-4c4f53	2067385.61	0.00	203349.40	2025-04-01 16:48:29.321426
SALES-STM-2025-9105e1	SALES-CUST-2025-a69232	HR-EMP-2025-4c4f53	1897927.77	0.00	203349.40	2025-04-01 16:48:44.199785
SALES-STM-2025-fb1cfd	SALES-CUST-2025-a69232	HR-EMP-2025-4c4f53	1897927.77	0.00	203349.40	2025-04-01 16:49:04.4549
SALES-STM-2025-d346b6	SALES-CUST-2025-6e52b0	HR-EMP-2025-4c4f53	1158208.35	0.00	113922.13	2025-04-01 16:52:43.389455
SALES-STM-2025-f8b841	SALES-CUST-2025-6e52b0	HR-EMP-2025-4c4f53	1063273.24	0.00	113922.13	2025-04-01 16:52:52.379446
SALES-STM-2025-6c32a2	SALES-CUST-2025-6e52b0	HR-EMP-2025-4c4f53	1059971.04	0.00	113568.33	2025-04-01 16:53:11.990171
SALES-STM-2025-2f1179	SALES-CUST-2025-6e52b0	HR-EMP-2025-4c4f53	3302.21	0.00	353.81	2025-04-01 16:54:19.251878
SALES-STM-2025-e55775	SALES-CUST-2025-6e52b0	HR-EMP-2025-4c4f53	1059971.04	0.00	113568.33	2025-04-01 17:08:48.231566
SALES-STM-2025-fa27ea	SALES-CUST-2025-6e52b0	HR-EMP-2025-4c4f53	3302.21	0.00	353.81	2025-04-01 17:11:50.082587
SALES-STM-2025-fd67dd	SALES-CUST-2025-6e52b0	HR-EMP-2025-4c4f53	3302.21	0.00	353.81	2025-04-01 17:28:37.855621
SALES-STM-2025-75123f	SALES-CUST-2025-cd3925	HR-EMP-2025-4c4f53	19629.60	0.00	1930.78	2025-04-01 18:06:49.330511
SALES-STM-2025-2aa597	SALES-CUST-2025-cd3925	HR-EMP-2025-4c4f53	18020.62	0.00	1930.78	2025-04-01 18:06:52.599064
SALES-STM-2025-87fffb	SALES-CUST-2025-cd3925	HR-EMP-2025-4c4f53	1637660.56	0.00	161081.37	2025-04-01 18:16:12.571195
SALES-STM-2025-3c22a1	SALES-CUST-2025-cd3925	HR-EMP-2025-4c4f53	1503426.09	0.00	161081.37	2025-04-01 18:16:19.285381
SALES-STM-2025-777837	SALES-CUST-2025-cd3925	HR-EMP-2025-4c4f53	1503426.09	0.00	161081.37	2025-04-01 18:16:26.064724
SALES-STM-2025-2ae8b9	SALES-CUST-2025-12765a	HR-EMP-2025-4c4f53	69871.81	0.00	6872.64	2025-04-01 18:16:57.583191
SALES-STM-2025-1999b1	SALES-CUST-2025-12765a	HR-EMP-2025-4c4f53	64144.61	0.00	6872.64	2025-04-01 18:17:02.73937
SALES-STM-2025-49bc49	SALES-CUST-2025-12765a	HR-EMP-2025-4c4f53	64144.61	0.00	6872.64	2025-04-01 18:17:07.754678
SALES-STM-2025-ee7a8b	SALES-CUST-2025-12ab0e	HR-EMP-2025-4c4f53	256884.04	0.00	25267.28	2025-04-01 18:17:40.595599
SALES-STM-2025-51e50c	SALES-CUST-2025-12ab0e	HR-EMP-2025-4c4f53	225828.97	9999.00	25267.28	2025-04-01 18:17:59.137843
SALES-STM-2025-81931a	SALES-CUST-2025-12ab0e	HR-EMP-2025-4c4f53	225828.97	9999.00	25267.28	2025-04-01 18:18:04.603952
SALES-STM-2025-7c5162	SALES-CUST-2025-16e575	HR-EMP-2025-4c4f53	365642.78	0.00	35964.86	2025-04-01 18:28:11.21864
SALES-STM-2025-be0b7c	SALES-CUST-2025-16e575	HR-EMP-2025-4c4f53	335672.06	0.00	35964.86	2025-04-01 18:28:19.933144
SALES-STM-2025-67ee83	SALES-CUST-2025-16e575	HR-EMP-2025-4c4f53	335672.06	0.00	35964.86	2025-04-01 18:29:05.473124
SALES-STM-2025-c84d63	SALES-CUST-2025-72570c	HR-EMP-2025-4c4f53	331476.54	0.00	32604.25	2025-04-01 18:32:09.373484
SALES-STM-2025-bb52c2	SALES-CUST-2025-72570c	HR-EMP-2025-4c4f53	304306.33	0.00	32604.25	2025-04-01 18:32:15.134312
SALES-STM-2025-04c0f4	SALES-CUST-2025-72570c	HR-EMP-2025-4c4f53	304306.33	0.00	32604.25	2025-04-01 18:32:22.677136
SALES-STM-2025-e4dcd3	SALES-CUST-2025-78f344	HR-EMP-2025-4c4f53	526173.90	0.00	51754.81	2025-04-01 18:33:28.101904
SALES-STM-2025-da2976	SALES-CUST-2025-78f344	HR-EMP-2025-4c4f53	438495.89	44549.00	51754.81	2025-04-01 18:34:14.566532
SALES-STM-2025-70b4a1	SALES-CUST-2025-78f344	HR-EMP-2025-4c4f53	438495.89	44549.00	51754.81	2025-04-01 18:34:22.385346
SALES-STM-2025-56744a	SALES-CUST-2025-868810	HR-EMP-2025-4c4f53	2014050.00	0.00	198103.28	2025-04-01 18:36:26.394095
SALES-STM-2025-0ec1b5	SALES-CUST-2025-868810	HR-EMP-2025-4c4f53	1613013.93	235950.00	198103.28	2025-04-01 18:36:50.92362
SALES-STM-2025-1105c7	SALES-CUST-2025-868810	HR-EMP-2025-4c4f53	1613013.93	235950.00	198103.28	2025-04-01 18:36:56.841702
SALES-STM-2025-7d1c9d	SALES-CUST-2025-4ff5f8	HR-EMP-2025-4c4f53	1572785.17	260998.00	196476.77	2025-04-01 19:02:58.747424
SALES-STM-2025-ecc6d5	SALES-CUST-2025-4ff5f8	HR-EMP-2025-4c4f53	1572785.17	260998.00	196476.77	2025-04-01 19:03:28.745651
SALES-STM-2025-8885de	SALES-CUST-2025-4ff5f8	HR-EMP-2025-4c4f53	1572785.17	260998.00	196476.77	2025-04-01 19:03:38.941069
SALES-STM-2025-fff6e5	SALES-CUST-2025-1fc7a8	HR-EMP-2025-4c4f53	4319.98	995.00	569.46	2025-04-01 19:12:08.284456
SALES-STM-2025-864320	SALES-CUST-2025-1fc7a8	HR-EMP-2025-4c4f53	4319.98	995.00	569.46	2025-04-01 19:12:43.398919
SALES-STM-2025-75dfc8	SALES-CUST-2025-1fc7a8	HR-EMP-2025-4c4f53	4319.98	995.00	569.46	2025-04-01 19:13:08.624965
\.


--
-- Data for Name: statement_item; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.statement_item (statement_item_id, statement_id, product_id, additional_service_id, renewal_id, quantity, quantity_to_deliver, unit_price, discount, total_price, tax_amount, return_reason, return_action, quantity_delivered, created_at) FROM stdin;
SALES-STI-2025-ef3b10	SALES-STM-2025-188dde	ADMIN-PROD-2025-c676ee	\N	\N	1	1	1337599.20	0.00	1337599.20	0.00	\N	\N	0	2025-04-01 13:51:13.50734
SALES-STI-2025-8d3802	SALES-STM-2025-188dde	ADMIN-PROD-2025-d1d28f	\N	\N	1	1	57271.97	0.00	57271.97	0.00	\N	\N	0	2025-04-01 13:51:13.50734
SALES-STI-2025-fe90a4	SALES-STM-2025-d0474b	ADMIN-PROD-2025-c676ee	\N	\N	1	1	1337599.20	0.00	1337599.20	0.00	\N	\N	0	2025-04-01 13:53:44.242549
SALES-STI-2025-940037	SALES-STM-2025-d0474b	ADMIN-PROD-2025-d1d28f	\N	\N	1	1	57271.97	0.00	57271.97	0.00	\N	\N	0	2025-04-01 13:53:44.242549
SALES-STI-2025-657d46	SALES-STM-2025-a11266	ADMIN-PROD-2025-c676ee	\N	\N	1	1	1337599.20	0.00	1337599.20	0.00	\N	\N	0	2025-04-01 13:54:47.855611
SALES-STI-2025-8f7558	SALES-STM-2025-a11266	ADMIN-PROD-2025-d1d28f	\N	\N	1	1	57271.97	0.00	57271.97	0.00	\N	\N	0	2025-04-01 13:54:47.855611
SALES-STI-2025-64b0a8	SALES-STM-2025-fa9c0e	ADMIN-PROD-2025-c676ee	\N	\N	1	1	1337599.20	0.00	1337599.20	0.00	\N	\N	0	2025-04-01 13:55:12.558637
SALES-STI-2025-dc2f1e	SALES-STM-2025-fa9c0e	ADMIN-PROD-2025-d1d28f	\N	\N	1	1	57271.97	0.00	57271.97	0.00	\N	\N	0	2025-04-01 13:55:12.558637
SALES-STI-2025-d76d67	SALES-STM-2025-b16184	ADMIN-PROD-2025-c676ee	\N	\N	1	1	1337599.20	0.00	1337599.20	0.00	\N	\N	0	2025-04-01 13:56:20.965966
SALES-STI-2025-2e92e1	SALES-STM-2025-b16184	ADMIN-PROD-2025-d1d28f	\N	\N	1	1	57271.97	0.00	57271.97	0.00	\N	\N	0	2025-04-01 13:56:20.965966
SALES-STI-2025-815a14	SALES-STM-2025-afdc0e	ADMIN-PROD-2025-c676ee	\N	\N	1	1	1337599.20	0.00	1337599.20	0.00	\N	\N	0	2025-04-01 14:06:03.118627
SALES-STI-2025-205030	SALES-STM-2025-afdc0e	ADMIN-PROD-2025-d1d28f	\N	\N	1	1	57271.97	0.00	57271.97	0.00	\N	\N	0	2025-04-01 14:06:03.118627
SALES-STI-2025-281260	SALES-STM-2025-393a8f	ADMIN-PROD-2025-c676ee	\N	\N	1	1	1337599.20	0.00	1337599.20	160511.90	\N	\N	0	2025-04-01 15:32:19.17578
SALES-STI-2025-a98f96	SALES-STM-2025-393a8f	ADMIN-PROD-2025-d1d28f	\N	\N	1	1	57271.97	0.00	57271.97	6872.64	\N	\N	0	2025-04-01 15:32:19.17578
SALES-STI-2025-d4c3a7	SALES-STM-2025-a27845	ADMIN-PROD-2025-d1d28f	\N	\N	1	1	57271.97	0.00	57271.97	0.00	\N	\N	0	2025-04-01 16:38:39.988096
SALES-STI-2025-b65238	SALES-STM-2025-a27845	ADMIN-PROD-2025-c676ee	\N	\N	1	1	1337599.20	0.00	1337599.20	0.00	\N	\N	0	2025-04-01 16:38:39.988096
SALES-STI-2025-655914	SALES-STM-2025-a27845	ADMIN-PROD-2025-42859a	\N	\N	1	1	299707.20	0.00	299707.20	0.00	\N	\N	0	2025-04-01 16:38:39.988096
SALES-STI-2025-51786a	SALES-STM-2025-9105e1	ADMIN-PROD-2025-d1d28f	\N	\N	1	1	57271.97	0.00	57271.97	0.00	\N	\N	0	2025-04-01 16:38:39.988096
SALES-STI-2025-ec2d25	SALES-STM-2025-9105e1	ADMIN-PROD-2025-c676ee	\N	\N	1	1	1337599.20	0.00	1337599.20	0.00	\N	\N	0	2025-04-01 16:38:39.988096
SALES-STI-2025-3a79e1	SALES-STM-2025-9105e1	ADMIN-PROD-2025-42859a	\N	\N	1	1	299707.20	0.00	299707.20	0.00	\N	\N	0	2025-04-01 16:38:39.988096
SALES-STI-2025-dddbf6	SALES-STM-2025-fb1cfd	ADMIN-PROD-2025-d1d28f	\N	\N	1	1	57271.97	0.00	57271.97	6872.64	\N	\N	0	2025-04-01 16:38:39.988096
SALES-STI-2025-58b181	SALES-STM-2025-fb1cfd	ADMIN-PROD-2025-c676ee	\N	\N	1	1	1337599.20	0.00	1337599.20	160511.90	\N	\N	0	2025-04-01 16:38:39.988096
SALES-STI-2025-5b83d4	SALES-STM-2025-fb1cfd	ADMIN-PROD-2025-42859a	\N	\N	1	1	299707.20	0.00	299707.20	35964.86	\N	\N	0	2025-04-01 16:38:39.988096
SALES-STI-2025-59b892	SALES-STM-2025-d346b6	ADMIN-PROD-2025-279e71	\N	\N	1	1	162319.25	0.00	162319.25	19478.31	\N	\N	0	2025-04-01 16:51:05.68012
SALES-STI-2025-80db92	SALES-STM-2025-d346b6	ADMIN-PROD-2025-88bc68	\N	\N	2	2	311452.13	0.00	622904.26	74748.51	\N	\N	0	2025-04-01 16:51:05.68012
SALES-STI-2025-f42673	SALES-STM-2025-d346b6	ADMIN-PROD-2025-fcf095	\N	\N	1	1	154440.00	0.00	154440.00	18532.80	\N	\N	0	2025-04-01 16:51:05.68012
SALES-STI-2025-464b18	SALES-STM-2025-d346b6	ADMIN-PROD-2025-2d990a	\N	\N	1	1	6739.20	0.00	6739.20	808.70	\N	\N	0	2025-04-01 16:51:05.68012
SALES-STI-2025-711cca	SALES-STM-2025-d346b6	ADMIN-PROD-2025-6f64c1	\N	\N	1	1	2948.40	0.00	2948.40	353.81	\N	\N	0	2025-04-01 16:51:05.68012
SALES-STI-2025-1a786a	SALES-STM-2025-f8b841	ADMIN-PROD-2025-279e71	\N	\N	1	1	162319.25	0.00	162319.25	19478.31	\N	\N	0	2025-04-01 16:51:05.68012
SALES-STI-2025-e24f8e	SALES-STM-2025-f8b841	ADMIN-PROD-2025-88bc68	\N	\N	2	2	311452.13	0.00	622904.26	74748.51	\N	\N	0	2025-04-01 16:51:05.68012
SALES-STI-2025-86f45a	SALES-STM-2025-f8b841	ADMIN-PROD-2025-fcf095	\N	\N	1	1	154440.00	0.00	154440.00	18532.80	\N	\N	0	2025-04-01 16:51:05.68012
SALES-STI-2025-7529f2	SALES-STM-2025-f8b841	ADMIN-PROD-2025-2d990a	\N	\N	1	1	6739.20	0.00	6739.20	808.70	\N	\N	0	2025-04-01 16:51:05.68012
SALES-STI-2025-eb0aba	SALES-STM-2025-f8b841	ADMIN-PROD-2025-6f64c1	\N	\N	1	1	2948.40	0.00	2948.40	353.81	\N	\N	0	2025-04-01 16:51:05.68012
SALES-STI-2025-0dc0a4	SALES-STM-2025-2f1179	ADMIN-PROD-2025-6f64c1	\N	\N	1	1	2948.40	0.00	2948.40	353.81	\N	\N	0	2025-04-01 16:51:05.68012
SALES-STI-2025-74a664	SALES-STM-2025-6c32a2	ADMIN-PROD-2025-279e71	\N	\N	1	1	162319.25	0.00	162319.25	19478.31	\N	\N	1	2025-04-01 16:51:05.68012
SALES-STI-2025-07a189	SALES-STM-2025-6c32a2	ADMIN-PROD-2025-88bc68	\N	\N	2	2	311452.13	0.00	622904.26	74748.51	\N	\N	1	2025-04-01 16:51:05.68012
SALES-STI-2025-2ce425	SALES-STM-2025-6c32a2	ADMIN-PROD-2025-fcf095	\N	\N	1	1	154440.00	0.00	154440.00	18532.80	\N	\N	1	2025-04-01 16:51:05.68012
SALES-STI-2025-5fca22	SALES-STM-2025-6c32a2	ADMIN-PROD-2025-2d990a	\N	\N	1	1	6739.20	0.00	6739.20	808.70	\N	\N	1	2025-04-01 16:51:05.68012
SALES-STI-2025-dbda1e	SALES-STM-2025-fa27ea	ADMIN-PROD-2025-6f64c1	\N	\N	1	1	2948.40	0.00	2948.40	353.81	\N	\N	0	2025-04-01 17:10:24.293349
SALES-STI-2025-f21345	SALES-STM-2025-fd67dd	ADMIN-PROD-2025-6f64c1	\N	\N	1	1	2948.40	0.00	2948.40	353.81	\N	\N	1	2025-04-01 17:27:38.77314
SALES-STI-2025-a501f3	SALES-STM-2025-81931a	ADMIN-PROD-2025-279e71	\N	\N	1	1	162319.25	9999.00	162319.25	19478.31	\N	\N	0	2025-04-01 18:07:20.136359
SALES-STI-2025-0ecde6	SALES-STM-2025-81931a	ADMIN-PROD-2025-f2d420	\N	\N	1	1	7291.44	0.00	7291.44	874.97	\N	\N	0	2025-04-01 18:07:20.136359
SALES-STI-2025-6ef829	SALES-STM-2025-81931a	ADMIN-PROD-2025-af5a62	\N	\N	1	1	39948.48	0.00	39948.48	4793.82	\N	\N	0	2025-04-01 18:07:20.136359
SALES-STI-2025-c19479	SALES-STM-2025-81931a	ADMIN-PROD-2025-fb8af3	\N	\N	1	1	1001.52	0.00	1001.52	120.18	\N	\N	0	2025-04-01 18:07:20.136359
SALES-STI-2025-8b6c48	SALES-STM-2025-e55775	ADMIN-PROD-2025-279e71	\N	\N	1	1	162319.25	0.00	162319.25	19478.31	\N	\N	2	2025-04-01 16:59:18.606144
SALES-STI-2025-c9e72a	SALES-STM-2025-e55775	ADMIN-PROD-2025-88bc68	\N	\N	2	2	311452.13	0.00	622904.26	74748.51	\N	\N	2	2025-04-01 16:59:18.606144
SALES-STI-2025-dbf1fb	SALES-STM-2025-e55775	ADMIN-PROD-2025-fcf095	\N	\N	1	1	154440.00	0.00	154440.00	18532.80	\N	\N	2	2025-04-01 16:59:18.606144
SALES-STI-2025-b73cf9	SALES-STM-2025-e55775	ADMIN-PROD-2025-2d990a	\N	\N	1	1	6739.20	0.00	6739.20	808.70	\N	\N	2	2025-04-01 16:59:18.606144
SALES-STI-2025-435cd0	SALES-STM-2025-75123f	ADMIN-PROD-2025-451316	\N	\N	1	1	13141.44	0.00	13141.44	0.00	\N	\N	0	2025-04-01 17:39:33.036722
SALES-STI-2025-ef9b0d	SALES-STM-2025-75123f	ADMIN-PROD-2025-6f64c1	\N	\N	1	1	2948.40	0.00	2948.40	0.00	\N	\N	0	2025-04-01 17:39:33.036722
SALES-STI-2025-1c8c82	SALES-STM-2025-2aa597	ADMIN-PROD-2025-451316	\N	\N	1	1	13141.44	0.00	13141.44	0.00	\N	\N	0	2025-04-01 17:39:33.036722
SALES-STI-2025-c3f94c	SALES-STM-2025-2aa597	ADMIN-PROD-2025-6f64c1	\N	\N	1	1	2948.40	0.00	2948.40	0.00	\N	\N	0	2025-04-01 17:39:33.036722
SALES-STI-2025-943de8	SALES-STM-2025-87fffb	ADMIN-PROD-2025-c676ee	\N	\N	1	1	1337599.20	0.00	1337599.20	0.00	\N	\N	0	2025-04-01 18:07:20.136359
SALES-STI-2025-e31b4a	SALES-STM-2025-87fffb	ADMIN-PROD-2025-09cd4c	\N	\N	1	1	4745.52	0.00	4745.52	0.00	\N	\N	0	2025-04-01 18:07:20.136359
SALES-STI-2025-26de9f	SALES-STM-2025-3c22a1	ADMIN-PROD-2025-c676ee	\N	\N	1	1	1337599.20	0.00	1337599.20	0.00	\N	\N	0	2025-04-01 18:07:20.136359
SALES-STI-2025-f41976	SALES-STM-2025-3c22a1	ADMIN-PROD-2025-09cd4c	\N	\N	1	1	4745.52	0.00	4745.52	0.00	\N	\N	0	2025-04-01 18:07:20.136359
SALES-STI-2025-145cd2	SALES-STM-2025-777837	ADMIN-PROD-2025-c676ee	\N	\N	1	1	1337599.20	0.00	1337599.20	0.00	\N	\N	0	2025-04-01 18:07:20.136359
SALES-STI-2025-3ba19b	SALES-STM-2025-777837	ADMIN-PROD-2025-09cd4c	\N	\N	1	1	4745.52	0.00	4745.52	0.00	\N	\N	0	2025-04-01 18:07:20.136359
SALES-STI-2025-07f0ac	SALES-STM-2025-2ae8b9	ADMIN-PROD-2025-d1d28f	\N	\N	1	1	57271.97	0.00	57271.97	0.00	\N	\N	0	2025-04-01 18:07:20.136359
SALES-STI-2025-ed599d	SALES-STM-2025-1999b1	ADMIN-PROD-2025-d1d28f	\N	\N	1	1	57271.97	0.00	57271.97	0.00	\N	\N	0	2025-04-01 18:07:20.136359
SALES-STI-2025-176c3d	SALES-STM-2025-49bc49	ADMIN-PROD-2025-d1d28f	\N	\N	1	1	57271.97	0.00	57271.97	0.00	\N	\N	0	2025-04-01 18:07:20.136359
SALES-STI-2025-3917b8	SALES-STM-2025-ee7a8b	ADMIN-PROD-2025-279e71	\N	\N	1	1	162319.25	0.00	162319.25	0.00	\N	\N	0	2025-04-01 18:07:20.136359
SALES-STI-2025-927068	SALES-STM-2025-ee7a8b	ADMIN-PROD-2025-f2d420	\N	\N	1	1	7291.44	0.00	7291.44	0.00	\N	\N	0	2025-04-01 18:07:20.136359
SALES-STI-2025-e0feec	SALES-STM-2025-ee7a8b	ADMIN-PROD-2025-af5a62	\N	\N	1	1	39948.48	0.00	39948.48	0.00	\N	\N	0	2025-04-01 18:07:20.136359
SALES-STI-2025-f3b1fe	SALES-STM-2025-ee7a8b	ADMIN-PROD-2025-fb8af3	\N	\N	1	1	1001.52	0.00	1001.52	0.00	\N	\N	0	2025-04-01 18:07:20.136359
SALES-STI-2025-8c59d6	SALES-STM-2025-51e50c	ADMIN-PROD-2025-279e71	\N	\N	1	1	162319.25	9999.00	162319.25	19478.31	\N	\N	0	2025-04-01 18:07:20.136359
SALES-STI-2025-75c621	SALES-STM-2025-51e50c	ADMIN-PROD-2025-f2d420	\N	\N	1	1	7291.44	0.00	7291.44	874.97	\N	\N	0	2025-04-01 18:07:20.136359
SALES-STI-2025-901b9a	SALES-STM-2025-51e50c	ADMIN-PROD-2025-af5a62	\N	\N	1	1	39948.48	0.00	39948.48	4793.82	\N	\N	0	2025-04-01 18:07:20.136359
SALES-STI-2025-e74d13	SALES-STM-2025-51e50c	ADMIN-PROD-2025-fb8af3	\N	\N	1	1	1001.52	0.00	1001.52	120.18	\N	\N	0	2025-04-01 18:07:20.136359
SALES-STI-2025-73a5a4	SALES-STM-2025-7c5162	ADMIN-PROD-2025-42859a	\N	\N	1	1	299707.20	0.00	299707.20	0.00	\N	\N	0	2025-04-01 18:26:42.453194
SALES-STI-2025-ab124c	SALES-STM-2025-be0b7c	ADMIN-PROD-2025-42859a	\N	\N	1	1	299707.20	0.00	299707.20	0.00	\N	\N	0	2025-04-01 18:26:42.453194
SALES-STI-2025-18fdc7	SALES-STM-2025-67ee83	ADMIN-PROD-2025-42859a	\N	\N	1	1	299707.20	0.00	299707.20	0.00	\N	\N	0	2025-04-01 18:26:42.453194
SALES-STI-2025-6abd02	SALES-STM-2025-c84d63	ADMIN-PROD-2025-14a1f6	\N	\N	20	20	4745.52	0.00	94910.40	11389.25	\N	\N	0	2025-04-01 18:30:44.378415
SALES-STI-2025-3514ea	SALES-STM-2025-c84d63	ADMIN-PROD-2025-09cd4c	\N	\N	12	12	4745.52	0.00	56946.24	6833.55	\N	\N	0	2025-04-01 18:30:44.378415
SALES-STI-2025-017fc2	SALES-STM-2025-c84d63	ADMIN-PROD-2025-af5a62	\N	\N	3	3	39948.48	0.00	119845.44	14381.45	\N	\N	0	2025-04-01 18:30:44.378415
SALES-STI-2025-ef5f6d	SALES-STM-2025-bb52c2	ADMIN-PROD-2025-14a1f6	\N	\N	20	20	4745.52	0.00	94910.40	11389.25	\N	\N	0	2025-04-01 18:30:44.378415
SALES-STI-2025-10d73a	SALES-STM-2025-bb52c2	ADMIN-PROD-2025-09cd4c	\N	\N	12	12	4745.52	0.00	56946.24	6833.55	\N	\N	0	2025-04-01 18:30:44.378415
SALES-STI-2025-8e29e7	SALES-STM-2025-bb52c2	ADMIN-PROD-2025-af5a62	\N	\N	3	3	39948.48	0.00	119845.44	14381.45	\N	\N	0	2025-04-01 18:30:44.378415
SALES-STI-2025-57dd64	SALES-STM-2025-04c0f4	ADMIN-PROD-2025-14a1f6	\N	\N	20	20	4745.52	0.00	94910.40	11389.25	\N	\N	0	2025-04-01 18:30:44.378415
SALES-STI-2025-8010cd	SALES-STM-2025-04c0f4	ADMIN-PROD-2025-09cd4c	\N	\N	12	12	4745.52	0.00	56946.24	6833.55	\N	\N	0	2025-04-01 18:30:44.378415
SALES-STI-2025-55ac0a	SALES-STM-2025-04c0f4	ADMIN-PROD-2025-af5a62	\N	\N	3	3	39948.48	0.00	119845.44	14381.45	\N	\N	0	2025-04-01 18:30:44.378415
SALES-STI-2025-d9dd2d	SALES-STM-2025-e4dcd3	ADMIN-PROD-2025-2d990a	\N	\N	1	1	6739.20	0.00	6739.20	808.70	\N	\N	0	2025-04-01 18:30:44.378415
SALES-STI-2025-5b2455	SALES-STM-2025-e4dcd3	ADMIN-PROD-2025-451316	\N	\N	13	13	13141.44	0.00	170838.72	20500.65	\N	\N	0	2025-04-01 18:30:44.378415
SALES-STI-2025-cb6926	SALES-STM-2025-e4dcd3	ADMIN-PROD-2025-0e8d5d	\N	\N	1	1	154440.00	0.00	154440.00	18532.80	\N	\N	0	2025-04-01 18:30:44.378415
SALES-STI-2025-af4c36	SALES-STM-2025-e4dcd3	ADMIN-PROD-2025-5e91ee	\N	\N	4	4	12907.44	0.00	51629.76	6195.57	\N	\N	0	2025-04-01 18:30:44.378415
SALES-STI-2025-f0bc31	SALES-STM-2025-e4dcd3	ADMIN-PROD-2025-495de1	\N	\N	1	1	4745.52	0.00	4745.52	0.00	\N	\N	0	2025-04-01 18:30:44.378415
SALES-STI-2025-c0c5be	SALES-STM-2025-e4dcd3	ADMIN-PROD-2025-af5a62	\N	\N	1	1	39948.48	0.00	39948.48	0.00	\N	\N	0	2025-04-01 18:30:44.378415
SALES-STI-2025-ab6f29	SALES-STM-2025-e4dcd3	ADMIN-PROD-2025-6f64c1	\N	\N	1	1	2948.40	0.00	2948.40	0.00	\N	\N	0	2025-04-01 18:30:44.378415
SALES-STI-2025-d9037d	SALES-STM-2025-da2976	ADMIN-PROD-2025-2d990a	\N	\N	1	1	6739.20	0.00	6739.20	808.70	\N	\N	0	2025-04-01 18:30:44.378415
SALES-STI-2025-efb675	SALES-STM-2025-da2976	ADMIN-PROD-2025-451316	\N	\N	13	13	13141.44	34550.00	170838.72	20500.65	\N	\N	0	2025-04-01 18:30:44.378415
SALES-STI-2025-0972f9	SALES-STM-2025-da2976	ADMIN-PROD-2025-0e8d5d	\N	\N	1	1	154440.00	9999.00	154440.00	18532.80	\N	\N	0	2025-04-01 18:30:44.378415
SALES-STI-2025-dfb460	SALES-STM-2025-da2976	ADMIN-PROD-2025-5e91ee	\N	\N	4	4	12907.44	0.00	51629.76	6195.57	\N	\N	0	2025-04-01 18:30:44.378415
SALES-STI-2025-11decd	SALES-STM-2025-da2976	ADMIN-PROD-2025-495de1	\N	\N	1	1	4745.52	0.00	4745.52	569.46	\N	\N	0	2025-04-01 18:30:44.378415
SALES-STI-2025-69f25c	SALES-STM-2025-da2976	ADMIN-PROD-2025-af5a62	\N	\N	1	1	39948.48	0.00	39948.48	4793.82	\N	\N	0	2025-04-01 18:30:44.378415
SALES-STI-2025-62d4fa	SALES-STM-2025-da2976	ADMIN-PROD-2025-6f64c1	\N	\N	1	1	2948.40	0.00	2948.40	353.81	\N	\N	0	2025-04-01 18:30:44.378415
SALES-STI-2025-879c58	SALES-STM-2025-70b4a1	ADMIN-PROD-2025-2d990a	\N	\N	1	1	6739.20	0.00	6739.20	808.70	\N	\N	0	2025-04-01 18:30:44.378415
SALES-STI-2025-39c19d	SALES-STM-2025-70b4a1	ADMIN-PROD-2025-451316	\N	\N	13	13	13141.44	34550.00	170838.72	20500.65	\N	\N	0	2025-04-01 18:30:44.378415
SALES-STI-2025-072979	SALES-STM-2025-70b4a1	ADMIN-PROD-2025-0e8d5d	\N	\N	1	1	154440.00	9999.00	154440.00	18532.80	\N	\N	0	2025-04-01 18:30:44.378415
SALES-STI-2025-f3e670	SALES-STM-2025-70b4a1	ADMIN-PROD-2025-5e91ee	\N	\N	4	4	12907.44	0.00	51629.76	6195.57	\N	\N	0	2025-04-01 18:30:44.378415
SALES-STI-2025-dd1acf	SALES-STM-2025-70b4a1	ADMIN-PROD-2025-495de1	\N	\N	1	1	4745.52	0.00	4745.52	569.46	\N	\N	0	2025-04-01 18:30:44.378415
SALES-STI-2025-8f0cda	SALES-STM-2025-70b4a1	ADMIN-PROD-2025-af5a62	\N	\N	1	1	39948.48	0.00	39948.48	4793.82	\N	\N	0	2025-04-01 18:30:44.378415
SALES-STI-2025-e0ae07	SALES-STM-2025-70b4a1	ADMIN-PROD-2025-6f64c1	\N	\N	1	1	2948.40	0.00	2948.40	353.81	\N	\N	0	2025-04-01 18:30:44.378415
SALES-STI-2025-af6b87	SALES-STM-2025-56744a	ADMIN-PROD-2025-b74a90	\N	\N	20	20	4680.00	0.00	93600.00	11232.00	\N	\N	0	2025-04-01 18:35:25.770756
SALES-STI-2025-c01c29	SALES-STM-2025-56744a	ADMIN-PROD-2025-88bc68	\N	\N	5	5	311452.13	0.00	1557260.65	186871.28	\N	\N	0	2025-04-01 18:35:25.770756
SALES-STI-2025-481677	SALES-STM-2025-0ec1b5	ADMIN-PROD-2025-b74a90	\N	\N	20	20	4680.00	0.00	93600.00	11232.00	\N	\N	0	2025-04-01 18:35:25.770756
SALES-STI-2025-00f33f	SALES-STM-2025-0ec1b5	ADMIN-PROD-2025-88bc68	\N	\N	5	5	311452.13	235950.00	1557260.65	186871.28	\N	\N	0	2025-04-01 18:35:25.770756
SALES-STI-2025-6ff72f	SALES-STM-2025-1105c7	ADMIN-PROD-2025-b74a90	\N	\N	20	20	4680.00	0.00	93600.00	11232.00	\N	\N	0	2025-04-01 18:35:25.770756
SALES-STI-2025-5b7d9d	SALES-STM-2025-1105c7	ADMIN-PROD-2025-88bc68	\N	\N	5	5	311452.13	235950.00	1557260.65	186871.28	\N	\N	0	2025-04-01 18:35:25.770756
SALES-STI-2025-0c04f1	SALES-STM-2025-7d1c9d	ADMIN-PROD-2025-c676ee	\N	\N	1	1	1337599.20	237999.00	1337599.20	160511.90	\N	\N	0	2025-04-01 19:02:12.385792
SALES-STI-2025-e986a5	SALES-STM-2025-7d1c9d	ADMIN-PROD-2025-42859a	\N	\N	1	1	299707.20	22999.00	299707.20	35964.86	\N	\N	0	2025-04-01 19:02:12.385792
SALES-STI-2025-a3e8dd	SALES-STM-2025-ecc6d5	ADMIN-PROD-2025-c676ee	\N	\N	1	1	1337599.20	237999.00	1337599.20	160511.90	\N	\N	0	2025-04-01 19:02:12.385792
SALES-STI-2025-e34163	SALES-STM-2025-ecc6d5	ADMIN-PROD-2025-42859a	\N	\N	1	1	299707.20	22999.00	299707.20	35964.86	\N	\N	0	2025-04-01 19:02:12.385792
SALES-STI-2025-b439dd	SALES-STM-2025-8885de	ADMIN-PROD-2025-c676ee	\N	\N	1	1	1337599.20	237999.00	1337599.20	160511.90	\N	\N	0	2025-04-01 19:02:12.385792
SALES-STI-2025-ef5db3	SALES-STM-2025-8885de	ADMIN-PROD-2025-42859a	\N	\N	1	1	299707.20	22999.00	299707.20	35964.86	\N	\N	0	2025-04-01 19:02:12.385792
SALES-STI-2025-c67fca	SALES-STM-2025-fff6e5	ADMIN-PROD-2025-9b3fcc	\N	\N	1	1	4745.52	995.00	4745.52	569.46	\N	\N	0	2025-04-01 19:09:10.344873
SALES-STI-2025-de80db	SALES-STM-2025-864320	ADMIN-PROD-2025-9b3fcc	\N	\N	1	1	4745.52	995.00	4745.52	569.46	\N	\N	0	2025-04-01 19:09:10.344873
SALES-STI-2025-a912ed	SALES-STM-2025-75dfc8	ADMIN-PROD-2025-9b3fcc	\N	\N	1	1	4745.52	995.00	4745.52	569.46	\N	\N	0	2025-04-01 19:09:10.344873
\.


--
-- Data for Name: ticket; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.ticket (ticket_id, customer_id, salesrep_id, subject, description, status, priority, created_at) FROM stdin;
SALES-TICKET-2025-361369	\N	\N	MRI Machine Maintenance	Scheduled preventive maintenance for MRI scanner.	Open	High	2025-04-01 20:26:50.269297
SALES-TICKET-2025-159fcb	\N	\N	X-ray Calibration	X-ray machines require recalibration due to accuracy issues.	In Progress	Urgent	2025-04-01 20:26:50.269297
SALES-TICKET-2025-5b8b8d	\N	\N	Training Request - ECG Machine	Hospital staff need hands-on training for ECG machines.	Open	Medium	2025-04-01 20:26:50.269297
SALES-TICKET-2025-49ba7b	\N	\N	Software Update - Ventilators	Need to update ventilator software for new compliance regulations.	Closed	Low	2025-04-01 20:26:50.269297
SALES-TICKET-2025-095f52	\N	\N	Warranty Repair - Defibrillator	Defibrillator malfunction under warranty claim.	Open	High	2025-04-01 20:26:50.269297
SALES-TICKET-2025-b2efc4	\N	\N	Technical Support - Ultrasound	Ultrasound machine displaying error code during operation.	In Progress	Medium	2025-04-01 20:26:50.269297
SALES-TICKET-2025-588c78	\N	\N	Equipment Relocation Assistance	Need assistance in relocating an MRI scanner to another facility.	Closed	Low	2025-04-01 20:26:50.269297
SALES-TICKET-2025-6a1972	\N	\N	Hospital Bed Malfunction	Motorized hospital beds not adjusting properly.	Open	Urgent	2025-04-01 20:26:50.269297
SALES-TICKET-2025-5036fd	\N	\N	Battery Replacement - Portable Monitors	Request to replace batteries for 20 portable patient monitors.	In Progress	High	2025-04-01 20:26:50.269297
SALES-TICKET-2025-404d83	\N	\N	On-Site Inspection - Operating Room Equipment	Request for technician visit to inspect all OR equipment.	Open	Medium	2025-04-01 20:26:50.269297
SALES-TICKET-2025-0f8479	\N	\N	CT Scanner Calibration	CT scanner requires recalibration for accurate imaging.	Open	High	2025-04-01 20:26:50.269297
SALES-TICKET-2025-b034d2	\N	\N	Training Request - Ultrasound	Staff training needed for new ultrasound machines.	In Progress	Medium	2025-04-01 20:26:50.269297
SALES-TICKET-2025-81672c	\N	\N	Warranty Repair - X-ray Machine	X-ray machine malfunction under warranty.	Open	Urgent	2025-04-01 20:26:50.269297
SALES-TICKET-2025-896dab	\N	\N	Software Update - MRI Scanner	MRI software update required for compliance.	Closed	Low	2025-04-01 20:26:50.269297
SALES-TICKET-2025-afa4df	\N	\N	Equipment Relocation - Ventilators	Assistance needed to relocate ventilators.	Open	Medium	2025-04-01 20:26:50.269297
SALES-TICKET-2025-9c430d	\N	\N	Technical Support - Defibrillator	Defibrillator displaying error codes.	In Progress	High	2025-04-01 20:26:50.269297
SALES-TICKET-2025-bead02	\N	\N	Hospital Bed Repair	Motorized hospital beds not functioning.	Closed	Low	2025-04-01 20:26:50.269297
SALES-TICKET-2025-fdeabe	\N	\N	Battery Replacement - Monitors	Request to replace batteries for patient monitors.	Open	Medium	2025-04-01 20:26:50.269297
SALES-TICKET-2025-037435	\N	\N	On-Site Inspection - Lab Equipment	Inspection needed for lab equipment.	In Progress	High	2025-04-01 20:26:50.269297
SALES-TICKET-2025-ef4cf9	\N	\N	Training Request - Surgical Tools	Training required for new surgical tools.	Open	Medium	2025-04-01 20:26:50.269297
\.


--
-- Data for Name: ticket_convo; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.ticket_convo (convo_id, ticket_id, content, created_at) FROM stdin;
SALES-CONVO-2025-1ef31d	\N	Technician scheduled for MRI maintenance on April 5.	2025-04-01 20:26:50.269297
SALES-CONVO-2025-1bc0cf	\N	Calibration tools dispatched, technician visit confirmed.	2025-04-01 20:26:50.269297
SALES-CONVO-2025-263a71	\N	ECG training session scheduled for March 15.	2025-04-01 20:26:50.269297
SALES-CONVO-2025-3ab4de	\N	Software update package sent, remote installation guide provided.	2025-04-01 20:26:50.269297
SALES-CONVO-2025-4ce890	\N	Warranty repair approved, dispatching service team.	2025-04-01 20:26:50.269297
SALES-CONVO-2025-544257	\N	Ultrasound troubleshooting guide sent, remote support scheduled.	2025-04-01 20:26:50.269297
SALES-CONVO-2025-c018cc	\N	MRI relocation assistance team confirmed for March 20.	2025-04-01 20:26:50.269297
SALES-CONVO-2025-157f5d	\N	Investigating motorized hospital bed issues, awaiting technician report.	2025-04-01 20:26:50.269297
SALES-CONVO-2025-d71f98	\N	Battery order placed, estimated arrival March 10.	2025-04-01 20:26:50.269297
SALES-CONVO-2025-41b0dd	\N	On-site inspection scheduled for April 1, report to follow.	2025-04-01 20:26:50.269297
SALES-CONVO-2025-aa2979	\N	CT scanner calibration scheduled for April 10.	2025-04-01 20:26:50.269297
SALES-CONVO-2025-c9d53d	\N	Ultrasound training session confirmed for March 25.	2025-04-01 20:26:50.269297
SALES-CONVO-2025-d8ae3a	\N	Warranty repair approved, technician dispatched.	2025-04-01 20:26:50.269297
SALES-CONVO-2025-91f6bb	\N	MRI software update completed remotely.	2025-04-01 20:26:50.269297
SALES-CONVO-2025-f22ba5	\N	Ventilator relocation team confirmed for April 5.	2025-04-01 20:26:50.269297
SALES-CONVO-2025-5ae041	\N	Defibrillator troubleshooting guide sent.	2025-04-01 20:26:50.269297
SALES-CONVO-2025-9f4779	\N	Hospital bed repair completed successfully.	2025-04-01 20:26:50.269297
SALES-CONVO-2025-448788	\N	Battery replacement order placed, ETA March 15.	2025-04-01 20:26:50.269297
SALES-CONVO-2025-f4b137	\N	Lab equipment inspection scheduled for April 8.	2025-04-01 20:26:50.269297
SALES-CONVO-2025-0c0a73	\N	Surgical tools training session confirmed for March 30.	2025-04-01 20:26:50.269297
\.


--
-- Data for Name: additional_service; Type: TABLE DATA; Schema: services; Owner: postgres
--

COPY services.additional_service (additional_service_id, total_fee) FROM stdin;
SERVICES-ADDSER-2025-d0bcc6	100.00
SERVICES-ADDSER-2025-7e6235	250.00
SERVICES-ADDSER-2025-951edb	75.50
SERVICES-ADDSER-2025-4f3244	300.00
SERVICES-ADDSER-2025-aacfb7	150.75
SERVICES-ADDSER-2025-393f4b	200.00
SERVICES-ADDSER-2025-9b3f2d	500.00
SERVICES-ADDSER-2025-a0aac4	80.00
SERVICES-ADDSER-2025-587a86	600.00
SERVICES-ADDSER-2025-5e0dda	175.25
SERVICES-ADDSER-2025-21d450	120.00
SERVICES-ADDSER-2025-23f3ed	90.50
SERVICES-ADDSER-2025-124d73	110.00
SERVICES-ADDSER-2025-d470d0	400.00
SERVICES-ADDSER-2025-942b15	60.00
SERVICES-ADDSER-2025-4291db	95.00
SERVICES-ADDSER-2025-8fddfb	180.00
SERVICES-ADDSER-2025-ff6340	220.50
SERVICES-ADDSER-2025-ee4ff9	275.00
SERVICES-ADDSER-2025-396282	140.00
\.


--
-- Data for Name: additional_service_type; Type: TABLE DATA; Schema: services; Owner: postgres
--

COPY services.additional_service_type (additional_service_type_id, additional_service_id, service_type, service_fee, duration, date_start, status, total_service_fee) FROM stdin;
SERVICES-ADDSERTYPE-2025-f056c7	\N	Maintenance	50.00	6	2024-01-01	Active	300.00
SERVICES-ADDSERTYPE-2025-b4e64b	\N	Extended Warranty	100.00	12	2023-07-01	Expired	1200.00
SERVICES-ADDSERTYPE-2025-4449ac	\N	Priority Service	30.00	3	2024-03-10	Active	90.00
SERVICES-ADDSERTYPE-2025-c8607c	\N	Maintenance	40.00	5	2023-08-15	Expired	200.00
SERVICES-ADDSERTYPE-2025-d44757	\N	Extended Warranty	75.00	8	2024-02-20	Active	600.00
SERVICES-ADDSERTYPE-2025-9106ee	\N	Priority Service	90.00	4	2023-06-01	Expired	360.00
SERVICES-ADDSERTYPE-2025-fc794c	\N	Maintenance	60.00	7	2024-04-05	Active	420.00
SERVICES-ADDSERTYPE-2025-ac47c4	\N	Extended Warranty	125.00	10	2023-09-20	Expired	1250.00
SERVICES-ADDSERTYPE-2025-5b9a9a	\N	Priority Service	45.00	6	2024-05-01	Active	270.00
SERVICES-ADDSERTYPE-2025-a1b449	\N	Maintenance	70.00	5	2023-12-15	Expired	350.00
SERVICES-ADDSERTYPE-2025-314fec	\N	Extended Warranty	55.00	9	2024-06-10	Active	495.00
SERVICES-ADDSERTYPE-2025-e072d9	\N	Priority Service	35.00	2	2023-11-25	Expired	70.00
SERVICES-ADDSERTYPE-2025-1472fa	\N	Maintenance	85.00	11	2024-07-01	Active	935.00
SERVICES-ADDSERTYPE-2025-5efbbc	\N	Extended Warranty	95.00	6	2023-05-20	Expired	570.00
SERVICES-ADDSERTYPE-2025-0cb5ba	\N	Priority Service	120.00	4	2024-03-15	Active	480.00
SERVICES-ADDSERTYPE-2025-bff86f	\N	Maintenance	25.00	3	2023-09-05	Expired	75.00
SERVICES-ADDSERTYPE-2025-b5e16c	\N	Extended Warranty	110.00	7	2024-02-10	Active	770.00
SERVICES-ADDSERTYPE-2025-c38be5	\N	Priority Service	130.00	5	2023-08-01	Expired	650.00
SERVICES-ADDSERTYPE-2025-0ae73b	\N	Maintenance	95.00	8	2024-01-20	Active	760.00
SERVICES-ADDSERTYPE-2025-b8a365	\N	Extended Warranty	140.00	12	2023-04-15	Expired	1680.00
\.


--
-- Data for Name: after_analysis_sched; Type: TABLE DATA; Schema: services; Owner: postgres
--

COPY services.after_analysis_sched (analysis_sched_id, analysis_id, service_date, technician_id, description, service_status) FROM stdin;
SERVICES-SCHED-2025-0ae372	\N	2025-04-01	\N	Follow-up inspection scheduled.	Scheduled
SERVICES-SCHED-2025-d9f6e2	\N	2025-04-01	\N	Repair service in progress.	In Progress
SERVICES-SCHED-2025-91731d	\N	2025-04-01	\N	Post-analysis service completed.	Completed
SERVICES-SCHED-2025-f4f279	\N	2025-04-01	\N	Scheduled for additional diagnostics.	Scheduled
SERVICES-SCHED-2025-384bfd	\N	2025-04-01	\N	Customer requested cancellation.	Cancelled
SERVICES-SCHED-2025-ea95f8	\N	2025-04-01	\N	Finalizing service adjustments.	In Progress
SERVICES-SCHED-2025-73f86f	\N	2025-04-01	\N	Routine service check completed.	Completed
SERVICES-SCHED-2025-7f3fa6	\N	2025-04-01	\N	Pending further service scheduling.	Scheduled
SERVICES-SCHED-2025-2a0d53	\N	2025-04-01	\N	On-site technician dispatched.	In Progress
SERVICES-SCHED-2025-8594e2	\N	2025-04-01	\N	Service appointment canceled.	Cancelled
SERVICES-SCHED-2025-9f5052	\N	2025-04-01	\N	Follow-up maintenance required.	Scheduled
SERVICES-SCHED-2025-ef3da4	\N	2025-04-01	\N	Hardware replacement service.	In Progress
SERVICES-SCHED-2025-6e7424	\N	2025-04-01	\N	Service successfully completed.	Completed
SERVICES-SCHED-2025-27667c	\N	2025-04-01	\N	Awaiting customer confirmation.	Scheduled
SERVICES-SCHED-2025-90639f	\N	2025-04-01	\N	Request for emergency service.	In Progress
SERVICES-SCHED-2025-cae9f9	\N	2025-04-01	\N	Completed all necessary tests.	Completed
SERVICES-SCHED-2025-2db104	\N	2025-04-01	\N	Analysis results indicate more work.	Scheduled
SERVICES-SCHED-2025-d284ce	\N	2025-04-01	\N	Customer canceled service request.	Cancelled
SERVICES-SCHED-2025-1b6a1c	\N	2025-04-01	\N	Technician working on final fixes.	In Progress
SERVICES-SCHED-2025-68f938	\N	2025-04-01	\N	All post-analysis services concluded.	Completed
\.


--
-- Data for Name: delivery_order; Type: TABLE DATA; Schema: services; Owner: postgres
--

COPY services.delivery_order (delivery_order_id, service_order_id, customer_id, customer_address, delivery_status, delivery_date) FROM stdin;
SERVICES-DO-2025-ffe414	\N	\N	123 Main St, Manila	Pending	\N
SERVICES-DO-2025-d16f6d	\N	\N	456 Rizal Ave, Quezon City	Shipped	\N
SERVICES-DO-2025-745258	\N	\N	789 Bonifacio St, Cebu	Delivered	2025-04-01
SERVICES-DO-2025-6d153a	\N	\N	101 Davao St, Davao City	Pending	\N
SERVICES-DO-2025-6f4420	\N	\N	202 Bacolod St, Bacolod	Shipped	\N
SERVICES-DO-2025-482780	\N	\N	303 Iloilo St, Iloilo	Delivered	2025-04-01
SERVICES-DO-2025-ed98e3	\N	\N	404 Pampanga St, Pampanga	Pending	\N
SERVICES-DO-2025-4ee092	\N	\N	505 Legazpi St, Albay	Shipped	\N
SERVICES-DO-2025-ad1b35	\N	\N	606 Tacloban St, Leyte	Delivered	2025-04-01
SERVICES-DO-2025-052329	\N	\N	707 Baguio St, Baguio	Pending	\N
SERVICES-DO-2025-8ff115	\N	\N	808 Palawan St, Palawan	Shipped	\N
SERVICES-DO-2025-5e2228	\N	\N	909 Zamboanga St, Zamboanga	Delivered	2025-04-01
SERVICES-DO-2025-a3bd40	\N	\N	111 Cavite St, Cavite	Pending	\N
SERVICES-DO-2025-d4b493	\N	\N	222 Batangas St, Batangas	Shipped	\N
SERVICES-DO-2025-4101cd	\N	\N	333 Tarlac St, Tarlac	Delivered	2025-04-01
SERVICES-DO-2025-00768b	\N	\N	444 Bulacan St, Bulacan	Pending	\N
SERVICES-DO-2025-ef9f5e	\N	\N	555 Laguna St, Laguna	Shipped	\N
SERVICES-DO-2025-2dc508	\N	\N	666 Cagayan St, Cagayan de Oro	Delivered	2025-04-01
SERVICES-DO-2025-fba4a8	\N	\N	777 Ilocos St, Ilocos	Pending	\N
SERVICES-DO-2025-996e2f	\N	\N	888 La Union St, La Union	Shipped	\N
\.


--
-- Data for Name: service_analysis; Type: TABLE DATA; Schema: services; Owner: postgres
--

COPY services.service_analysis (analysis_id, service_request_id, analysis_date, technician_id, customer_id, analysis_status, analysis_description, product_id, contract_id, labor_cost) FROM stdin;
SERVICES-ANALYSIS-2025-6ad67d	\N	2025-04-01	\N	\N	Scheduled	Initial assessment scheduled.	\N	\N	50.00
SERVICES-ANALYSIS-2025-28db63	\N	2025-04-01	\N	\N	Done	Completed hardware inspection.	\N	\N	75.00
SERVICES-ANALYSIS-2025-a9f5fd	\N	2025-04-01	\N	\N	Scheduled	Diagnostic analysis planned.	\N	\N	100.00
SERVICES-ANALYSIS-2025-29def9	\N	2025-04-01	\N	\N	Done	Software issue identified and logged.	\N	\N	120.00
SERVICES-ANALYSIS-2025-e1cc70	\N	2025-04-01	\N	\N	Scheduled	Awaiting technician visit.	\N	\N	90.00
SERVICES-ANALYSIS-2025-c9524b	\N	2025-04-01	\N	\N	Done	System performance analysis completed.	\N	\N	60.00
SERVICES-ANALYSIS-2025-fcb3bf	\N	2025-04-01	\N	\N	Scheduled	Battery test scheduled.	\N	\N	80.00
SERVICES-ANALYSIS-2025-77b11b	\N	2025-04-01	\N	\N	Done	Network connectivity issue resolved.	\N	\N	95.00
SERVICES-ANALYSIS-2025-6cde6c	\N	2025-04-01	\N	\N	Scheduled	Regular maintenance analysis.	\N	\N	110.00
SERVICES-ANALYSIS-2025-42767f	\N	2025-04-01	\N	\N	Done	Completed thermal inspection.	\N	\N	85.00
SERVICES-ANALYSIS-2025-bd91e4	\N	2025-04-01	\N	\N	Scheduled	Service contract evaluation.	\N	\N	55.00
SERVICES-ANALYSIS-2025-5c74fb	\N	2025-04-01	\N	\N	Done	Damage assessment finalized.	\N	\N	130.00
SERVICES-ANALYSIS-2025-54199d	\N	2025-04-01	\N	\N	Scheduled	Component wear-and-tear analysis.	\N	\N	75.00
SERVICES-ANALYSIS-2025-daefb5	\N	2025-04-01	\N	\N	Done	Identified necessary software updates.	\N	\N	70.00
SERVICES-ANALYSIS-2025-fd4b53	\N	2025-04-01	\N	\N	Scheduled	Testing for efficiency improvements.	\N	\N	125.00
SERVICES-ANALYSIS-2025-1268bd	\N	2025-04-01	\N	\N	Done	Repair cost analysis finished.	\N	\N	140.00
SERVICES-ANALYSIS-2025-0e4c67	\N	2025-04-01	\N	\N	Scheduled	Customer-reported issue verification.	\N	\N	90.00
SERVICES-ANALYSIS-2025-0c2f1a	\N	2025-04-01	\N	\N	Done	Confirmed warranty eligibility.	\N	\N	50.00
SERVICES-ANALYSIS-2025-6c4016	\N	2025-04-01	\N	\N	Scheduled	Hardware replacement recommendation.	\N	\N	115.00
SERVICES-ANALYSIS-2025-246b75	\N	2025-04-01	\N	\N	Done	Full service quality assessment completed.	\N	\N	105.00
\.


--
-- Data for Name: service_billing; Type: TABLE DATA; Schema: services; Owner: postgres
--

COPY services.service_billing (service_billing_id, service_order_id, analysis_id, service_request_id, item_name, service_billing_amount, labor_cost, outsource_fee, operational_cost_id, order_item_price, total_payable, billing_status, date_paid) FROM stdin;
SERVICES-BILL-2025-3f8b7a	\N	\N	\N	Screen Replacement	120.00	30.00	10.00	\N	120.00	160.00	Paid	2025-04-01
SERVICES-BILL-2025-9a65ec	\N	\N	\N	Cooling Fan	30.00	20.00	5.00	\N	30.00	55.00	Paid	2025-04-01
SERVICES-BILL-2025-21dc04	\N	\N	\N	Battery Replacement	50.00	25.00	8.00	\N	50.00	83.00	Unpaid	\N
SERVICES-BILL-2025-a0565c	\N	\N	\N	Power Adapter	40.00	15.00	4.00	\N	40.00	59.00	Unpaid	\N
SERVICES-BILL-2025-6f6f9d	\N	\N	\N	USB Hub	15.00	5.00	2.00	\N	15.00	22.00	Paid	2025-04-01
SERVICES-BILL-2025-207a1d	\N	\N	\N	Processor Upgrade	200.00	50.00	12.00	\N	200.00	262.00	Paid	2025-04-01
SERVICES-BILL-2025-2d985d	\N	\N	\N	RAM Module	80.00	20.00	5.00	\N	80.00	105.00	Unpaid	\N
SERVICES-BILL-2025-7e83f2	\N	\N	\N	Solid State Drive	150.00	35.00	10.00	\N	150.00	195.00	Paid	2025-04-01
SERVICES-BILL-2025-1ee27b	\N	\N	\N	Thermal Paste	10.00	3.00	1.00	\N	10.00	14.00	Unpaid	\N
SERVICES-BILL-2025-a29d5c	\N	\N	\N	Cooling Pad	35.00	10.00	3.00	\N	35.00	48.00	Paid	2025-04-01
SERVICES-BILL-2025-d512bc	\N	\N	\N	Printer Cartridge	20.00	5.00	2.00	\N	20.00	27.00	Unpaid	\N
SERVICES-BILL-2025-d93c82	\N	\N	\N	Network Cable	10.00	2.00	1.00	\N	10.00	13.00	Paid	2025-04-01
SERVICES-BILL-2025-19fe5e	\N	\N	\N	Surge Protector	50.00	12.00	4.00	\N	50.00	66.00	Paid	2025-04-01
SERVICES-BILL-2025-506672	\N	\N	\N	Motherboard Repair	180.00	45.00	10.00	\N	180.00	235.00	Unpaid	\N
SERVICES-BILL-2025-1a2f00	\N	\N	\N	Warranty Extension	99.99	0.00	0.00	\N	99.99	99.99	Paid	2025-04-01
SERVICES-BILL-2025-080584	\N	\N	\N	Keyboard Repair	25.00	8.00	3.00	\N	25.00	36.00	Unpaid	\N
SERVICES-BILL-2025-c3c01e	\N	\N	\N	External Hard Drive	100.00	25.00	5.00	\N	100.00	130.00	Paid	2025-04-01
SERVICES-BILL-2025-bfa744	\N	\N	\N	Wireless Mouse	25.00	6.00	2.00	\N	25.00	33.00	Unpaid	\N
SERVICES-BILL-2025-9de519	\N	\N	\N	Software Installation	75.00	20.00	4.00	\N	75.00	99.00	Paid	2025-04-01
SERVICES-BILL-2025-2769eb	\N	\N	\N	Service Fee	50.00	10.00	3.00	\N	50.00	63.00	Unpaid	\N
\.


--
-- Data for Name: service_call; Type: TABLE DATA; Schema: services; Owner: postgres
--

COPY services.service_call (service_call_id, date_created, service_ticket_id, customer_id, call_type, technician_id, call_status, date_closed, contract_id, product_id, end_date, priority_level, resolution) FROM stdin;
SERVICES-CALL-2025-c81926	2025-04-01 20:26:50.269297	\N	\N	Inquiry	\N	Open	\N	\N	\N	\N	Medium	Issue noted.
SERVICES-CALL-2025-4b70c9	2025-04-01 20:26:50.269297	\N	\N	Request	\N	In Progress	\N	\N	\N	\N	High	Technician assigned.
SERVICES-CALL-2025-6e7f74	2025-04-01 20:26:50.269297	\N	\N	Other	\N	Closed	2025-04-01 20:26:50.269297	\N	\N	\N	Low	Resolved with guidance.
SERVICES-CALL-2025-3258b1	2025-04-01 20:26:50.269297	\N	\N	Inquiry	\N	Open	\N	\N	\N	\N	High	Further investigation needed.
SERVICES-CALL-2025-8505f4	2025-04-01 20:26:50.269297	\N	\N	Request	\N	Closed	2025-04-01 20:26:50.269297	\N	\N	\N	Medium	Replacement issued.
SERVICES-CALL-2025-b81f24	2025-04-01 20:26:50.269297	\N	\N	Other	\N	In Progress	\N	\N	\N	\N	Low	Waiting for customer response.
SERVICES-CALL-2025-b29db0	2025-04-01 20:26:50.269297	\N	\N	Inquiry	\N	Open	\N	\N	\N	\N	High	Escalated to support team.
SERVICES-CALL-2025-e23f0d	2025-04-01 20:26:50.269297	\N	\N	Request	\N	Closed	2025-04-01 20:26:50.269297	\N	\N	\N	Medium	Resolved remotely.
SERVICES-CALL-2025-0c9706	2025-04-01 20:26:50.269297	\N	\N	Other	\N	In Progress	\N	\N	\N	\N	Low	Follow-up scheduled.
SERVICES-CALL-2025-acfe9b	2025-04-01 20:26:50.269297	\N	\N	Inquiry	\N	Open	\N	\N	\N	\N	Medium	No issues found.
SERVICES-CALL-2025-4853c0	2025-04-01 20:26:50.269297	\N	\N	Request	\N	Closed	2025-04-01 20:26:50.269297	\N	\N	\N	High	On-site visit completed.
SERVICES-CALL-2025-ff1388	2025-04-01 20:26:50.269297	\N	\N	Other	\N	In Progress	\N	\N	\N	\N	Low	Pending customer feedback.
SERVICES-CALL-2025-89e940	2025-04-01 20:26:50.269297	\N	\N	Inquiry	\N	Open	\N	\N	\N	\N	Medium	Suggested workaround provided.
SERVICES-CALL-2025-abb7d1	2025-04-01 20:26:50.269297	\N	\N	Request	\N	Closed	2025-04-01 20:26:50.269297	\N	\N	\N	High	Issue resolved with software update.
SERVICES-CALL-2025-4f07f2	2025-04-01 20:26:50.269297	\N	\N	Other	\N	In Progress	\N	\N	\N	\N	Low	Logged for future analysis.
SERVICES-CALL-2025-378239	2025-04-01 20:26:50.269297	\N	\N	Inquiry	\N	Open	\N	\N	\N	\N	Medium	Provided knowledge base article.
SERVICES-CALL-2025-9206d6	2025-04-01 20:26:50.269297	\N	\N	Request	\N	Closed	2025-04-01 20:26:50.269297	\N	\N	\N	High	Follow-up confirmed resolution.
SERVICES-CALL-2025-c7dbbf	2025-04-01 20:26:50.269297	\N	\N	Other	\N	In Progress	\N	\N	\N	\N	Low	Transferred to another team.
SERVICES-CALL-2025-07b778	2025-04-01 20:26:50.269297	\N	\N	Inquiry	\N	Open	\N	\N	\N	\N	Medium	Checked logs, no anomalies.
SERVICES-CALL-2025-fb1cf7	2025-04-01 20:26:50.269297	\N	\N	Request	\N	Closed	2025-04-01 20:26:50.269297	\N	\N	\N	High	Final report sent to client.
\.


--
-- Data for Name: service_contract; Type: TABLE DATA; Schema: services; Owner: postgres
--

COPY services.service_contract (contract_id, statement_item_id, customer_id, additional_service_id, contract_description, date_issued, end_date, product_id, contract_status, product_quantity, renewal_id, renewal_date, renewal_end_date) FROM stdin;
SERVICES-SERCON-2025-36a74b	\N	\N	\N	Annual software maintenance agreement	2024-01-10	2025-01-10	\N	Active	1	\N	\N	\N
SERVICES-SERCON-2025-6a7c57	\N	\N	\N	Monthly hardware servicing contract	2023-07-15	2024-07-15	\N	Expired	2	\N	\N	\N
SERVICES-SERCON-2025-77ab3a	\N	\N	\N	Extended warranty for premium users	2022-12-01	2023-12-01	\N	Terminated	1	\N	\N	\N
SERVICES-SERCON-2025-e28967	\N	\N	\N	IT infrastructure support agreement	2024-02-20	2025-02-20	\N	Pending	3	\N	\N	\N
SERVICES-SERCON-2025-316943	\N	\N	\N	Managed services for cloud solutions	2024-03-05	2025-03-05	\N	Active	1	\N	\N	\N
SERVICES-SERCON-2025-cbd2ef	\N	\N	\N	One-time repair and maintenance contract	2023-09-10	2024-09-10	\N	Expired	1	\N	\N	\N
SERVICES-SERCON-2025-683b9c	\N	\N	\N	Annual cybersecurity support	2023-06-01	2024-06-01	\N	Terminated	2	\N	\N	\N
SERVICES-SERCON-2025-e66693	\N	\N	\N	Laptop leasing agreement	2024-04-01	2025-04-01	\N	Pending	5	\N	\N	\N
SERVICES-SERCON-2025-f66fb6	\N	\N	\N	Software-as-a-service subscription	2023-11-20	2024-11-20	\N	Active	1	\N	\N	\N
SERVICES-SERCON-2025-6a23be	\N	\N	\N	Smart home system maintenance	2024-05-01	2025-05-01	\N	Pending	1	\N	\N	\N
SERVICES-SERCON-2025-dcf943	\N	\N	\N	Printer repair service	2023-08-15	2024-08-15	\N	Expired	2	\N	\N	\N
SERVICES-SERCON-2025-696171	\N	\N	\N	Server management agreement	2024-06-10	2025-06-10	\N	Active	3	\N	\N	\N
SERVICES-SERCON-2025-861c7a	\N	\N	\N	Data recovery service package	2023-10-01	2024-10-01	\N	Terminated	1	\N	\N	\N
SERVICES-SERCON-2025-7e8f47	\N	\N	\N	Annual cloud storage contract	2024-01-01	2025-01-01	\N	Active	2	\N	\N	\N
SERVICES-SERCON-2025-f489f3	\N	\N	\N	Enterprise IT support plan	2024-02-10	2025-02-10	\N	Pending	4	\N	\N	\N
SERVICES-SERCON-2025-6d5f50	\N	\N	\N	Networking equipment lease	2023-05-20	2024-05-20	\N	Expired	1	\N	\N	\N
SERVICES-SERCON-2025-d15727	\N	\N	\N	Subscription-based troubleshooting services	2024-03-15	2025-03-15	\N	Active	1	\N	\N	\N
SERVICES-SERCON-2025-6586f4	\N	\N	\N	Enterprise database management	2024-07-01	2025-07-01	\N	Pending	2	\N	\N	\N
SERVICES-SERCON-2025-524cf2	\N	\N	\N	Custom software development contract	2023-09-05	2024-09-05	\N	Terminated	1	\N	\N	\N
SERVICES-SERCON-2025-99df5a	\N	\N	\N	Smart office automation service	2024-04-15	2025-04-15	\N	Active	1	\N	\N	\N
\.


--
-- Data for Name: service_order; Type: TABLE DATA; Schema: services; Owner: postgres
--

COPY services.service_order (service_order_id, analysis_id, customer_id, order_date) FROM stdin;
SERVICES-SO-2025-0a0fce	\N	\N	2025-04-01 20:26:50.269297
SERVICES-SO-2025-732e28	\N	\N	2025-04-01 20:26:50.269297
SERVICES-SO-2025-2bc9d1	\N	\N	2025-04-01 20:26:50.269297
SERVICES-SO-2025-bcf3d0	\N	\N	2025-04-01 20:26:50.269297
SERVICES-SO-2025-3ac190	\N	\N	2025-04-01 20:26:50.269297
SERVICES-SO-2025-e56869	\N	\N	2025-04-01 20:26:50.269297
SERVICES-SO-2025-bbf48d	\N	\N	2025-04-01 20:26:50.269297
SERVICES-SO-2025-9888cb	\N	\N	2025-04-01 20:26:50.269297
SERVICES-SO-2025-99786d	\N	\N	2025-04-01 20:26:50.269297
SERVICES-SO-2025-ea9fd7	\N	\N	2025-04-01 20:26:50.269297
SERVICES-SO-2025-63cdb9	\N	\N	2025-04-01 20:26:50.269297
SERVICES-SO-2025-96eb3d	\N	\N	2025-04-01 20:26:50.269297
SERVICES-SO-2025-68dbff	\N	\N	2025-04-01 20:26:50.269297
SERVICES-SO-2025-38f2a0	\N	\N	2025-04-01 20:26:50.269297
SERVICES-SO-2025-094613	\N	\N	2025-04-01 20:26:50.269297
SERVICES-SO-2025-65f7cb	\N	\N	2025-04-01 20:26:50.269297
SERVICES-SO-2025-76694b	\N	\N	2025-04-01 20:26:50.269297
SERVICES-SO-2025-d17553	\N	\N	2025-04-01 20:26:50.269297
SERVICES-SO-2025-ff0cc5	\N	\N	2025-04-01 20:26:50.269297
SERVICES-SO-2025-fa6015	\N	\N	2025-04-01 20:26:50.269297
\.


--
-- Data for Name: service_order_item; Type: TABLE DATA; Schema: services; Owner: postgres
--

COPY services.service_order_item (service_order_item_id, service_order_id, item_id, principal_item_id, item_name, item_quantity, item_price, total_price) FROM stdin;
SOIT-2025-f5f19b	\N	\N	\N	Replacement Battery	1	50.00	50.00
SOIT-2025-3b792d	\N	\N	\N	Cooling Fan	2	30.00	60.00
SOIT-2025-c2b3fc	\N	\N	\N	Screen Replacement	1	120.00	120.00
SOIT-2025-30e3b4	\N	\N	\N	Power Adapter	1	40.00	40.00
SOIT-2025-dc2036	\N	\N	\N	Keyboard Repair Kit	2	25.00	50.00
SOIT-2025-47e22b	\N	\N	\N	USB Hub	3	15.00	45.00
SOIT-2025-224ab8	\N	\N	\N	Processor Upgrade	1	200.00	200.00
SOIT-2025-716a40	\N	\N	\N	RAM Module	2	80.00	160.00
SOIT-2025-cb7155	\N	\N	\N	Solid State Drive	1	150.00	150.00
SOIT-2025-1a5b2e	\N	\N	\N	Thermal Paste	1	10.00	10.00
SOIT-2025-245d36	\N	\N	\N	Cooling Pad	1	35.00	35.00
SOIT-2025-844a79	\N	\N	\N	Replacement Charger	1	45.00	45.00
SOIT-2025-859a0a	\N	\N	\N	Motherboard Repair	1	180.00	180.00
SOIT-2025-aee44a	\N	\N	\N	Wireless Mouse	1	25.00	25.00
SOIT-2025-2e0581	\N	\N	\N	External Hard Drive	1	100.00	100.00
SOIT-2025-cc4810	\N	\N	\N	Software Installation	1	75.00	75.00
SOIT-2025-d2400f	\N	\N	\N	Printer Cartridge	2	20.00	40.00
SOIT-2025-e0aef4	\N	\N	\N	Network Cable	3	10.00	30.00
SOIT-2025-92ebfe	\N	\N	\N	Surge Protector	1	50.00	50.00
SOIT-2025-1d7f86	\N	\N	\N	Warranty Extension	1	99.99	99.99
\.


--
-- Data for Name: service_report; Type: TABLE DATA; Schema: services; Owner: postgres
--

COPY services.service_report (report_id, service_call_id, service_ticket_id, service_billing_id, renewal_id, technician_id, description, report_status, submission_date) FROM stdin;
SERVICES-REPORT-2025-718ba8	\N	\N	\N	\N	\N	Initial diagnostic report for system error.	Draft	\N
SERVICES-REPORT-2025-0b7fea	\N	\N	\N	\N	\N	Inspection completed, pending customer approval.	Submitted	2025-04-01
SERVICES-REPORT-2025-b2b593	\N	\N	\N	\N	\N	Finalized repair details and cost breakdown.	Reviewed	2025-04-01
SERVICES-REPORT-2025-ddbebb	\N	\N	\N	\N	\N	Replacement of power adapter confirmed.	Draft	\N
SERVICES-REPORT-2025-82a568	\N	\N	\N	\N	\N	Cooling system maintenance completed.	Submitted	2025-04-01
SERVICES-REPORT-2025-8a6d62	\N	\N	\N	\N	\N	Customer requested additional software setup.	Reviewed	2025-04-01
SERVICES-REPORT-2025-1538fa	\N	\N	\N	\N	\N	Screen replacement performed successfully.	Draft	\N
SERVICES-REPORT-2025-e470f7	\N	\N	\N	\N	\N	Network troubleshooting details documented.	Submitted	2025-04-01
SERVICES-REPORT-2025-0e4fd5	\N	\N	\N	\N	\N	Installation of security patches verified.	Reviewed	2025-04-01
SERVICES-REPORT-2025-ac2422	\N	\N	\N	\N	\N	Battery replacement completed, awaiting confirmation.	Draft	\N
SERVICES-REPORT-2025-edee1b	\N	\N	\N	\N	\N	Hardware diagnostics performed, no issues found.	Submitted	2025-04-01
SERVICES-REPORT-2025-319583	\N	\N	\N	\N	\N	Software upgrade successfully implemented.	Reviewed	2025-04-01
SERVICES-REPORT-2025-03473c	\N	\N	\N	\N	\N	Customer reported intermittent connectivity issues.	Draft	\N
SERVICES-REPORT-2025-f84da4	\N	\N	\N	\N	\N	Final assessment of motherboard repair done.	Submitted	2025-04-01
SERVICES-REPORT-2025-01217d	\N	\N	\N	\N	\N	System optimization report reviewed.	Reviewed	2025-04-01
SERVICES-REPORT-2025-411a87	\N	\N	\N	\N	\N	USB hub installation report drafted.	Draft	\N
SERVICES-REPORT-2025-8602b5	\N	\N	\N	\N	\N	Laptop overheating issue resolved.	Submitted	2025-04-01
SERVICES-REPORT-2025-687738	\N	\N	\N	\N	\N	External hard drive failure diagnosed.	Reviewed	2025-04-01
SERVICES-REPORT-2025-c68175	\N	\N	\N	\N	\N	Customer requested additional warranty coverage.	Draft	\N
SERVICES-REPORT-2025-617713	\N	\N	\N	\N	\N	Customer feedback on service collected and reviewed.	Reviewed	2025-04-01
\.


--
-- Data for Name: service_request; Type: TABLE DATA; Schema: services; Owner: postgres
--

COPY services.service_request (service_request_id, service_call_id, request_date, customer_id, technician_id, request_type, request_status, request_description, request_remarks) FROM stdin;
SERVICES-SR-2025-2024c3	\N	2025-04-01	\N	\N	Repair	Pending	Customer reported a malfunction.	Awaiting technician assignment.
SERVICES-SR-2025-fc2f34	\N	2025-04-01	\N	\N	Installation	Approved	New device installation requested.	Scheduled for next week.
SERVICES-SR-2025-df92d6	\N	2025-04-01	\N	\N	Maintenance	Rejected	Routine maintenance request.	Customer did not meet service requirements.
SERVICES-SR-2025-09a6ca	\N	2025-04-01	\N	\N	Renewal	In Progress	Service contract renewal requested.	Reviewing contract details.
SERVICES-SR-2025-c0f607	\N	2025-04-01	\N	\N	Other	Pending	Customer has a special service request.	Escalated to management.
SERVICES-SR-2025-f81ab7	\N	2025-04-01	\N	\N	Repair	Approved	Device experiencing connectivity issues.	Technician dispatched.
SERVICES-SR-2025-4aed4a	\N	2025-04-01	\N	\N	Installation	Pending	New software installation.	Pending compatibility check.
SERVICES-SR-2025-090671	\N	2025-04-01	\N	\N	Maintenance	In Progress	Routine system check-up.	Technician currently on-site.
SERVICES-SR-2025-c516b7	\N	2025-04-01	\N	\N	Renewal	Rejected	Subscription renewal request.	Customer opted for a different plan.
SERVICES-SR-2025-b109b5	\N	2025-04-01	\N	\N	Other	Approved	Request for additional training.	Training scheduled for next week.
SERVICES-SR-2025-883e71	\N	2025-04-01	\N	\N	Repair	Pending	Hardware issue reported.	Under initial assessment.
SERVICES-SR-2025-c8b553	\N	2025-04-01	\N	\N	Installation	Approved	Installation of additional features.	Work order generated.
SERVICES-SR-2025-03ef4c	\N	2025-04-01	\N	\N	Maintenance	Rejected	Request for emergency maintenance.	Not covered under contract.
SERVICES-SR-2025-9f58e8	\N	2025-04-01	\N	\N	Renewal	In Progress	Customer wants an early renewal.	Approval from sales team pending.
SERVICES-SR-2025-10fe8e	\N	2025-04-01	\N	\N	Other	Pending	Customization request for service.	Under feasibility review.
SERVICES-SR-2025-1b5ae6	\N	2025-04-01	\N	\N	Repair	Approved	Device not functioning properly.	Technician assigned for visit.
SERVICES-SR-2025-a7eb92	\N	2025-04-01	\N	\N	Installation	Pending	New hardware installation request.	Waiting for stock confirmation.
SERVICES-SR-2025-09adfb	\N	2025-04-01	\N	\N	Maintenance	In Progress	Scheduled quarterly maintenance.	Service in progress.
SERVICES-SR-2025-2a1a8d	\N	2025-04-01	\N	\N	Renewal	Rejected	Renewal request denied.	Customer not eligible for renewal.
SERVICES-SR-2025-b841a5	\N	2025-04-01	\N	\N	Other	Approved	Request for additional support hours.	Extended support confirmed.
\.


--
-- Data for Name: technician; Type: TABLE DATA; Schema: services; Owner: postgres
--

COPY services.technician (technician_id, employee_id) FROM stdin;
SERVICES-TECH-2025-ede059	\N
SERVICES-TECH-2025-cb152b	\N
SERVICES-TECH-2025-18b771	\N
SERVICES-TECH-2025-03f943	\N
SERVICES-TECH-2025-1e963c	\N
SERVICES-TECH-2025-a6a26d	\N
SERVICES-TECH-2025-61b10a	\N
SERVICES-TECH-2025-dd266c	\N
SERVICES-TECH-2025-ff1d7c	\N
SERVICES-TECH-2025-612623	\N
SERVICES-TECH-2025-98bb54	\N
SERVICES-TECH-2025-e5d55f	\N
SERVICES-TECH-2025-c82461	\N
SERVICES-TECH-2025-50e355	\N
SERVICES-TECH-2025-4630b4	\N
SERVICES-TECH-2025-13a21d	\N
SERVICES-TECH-2025-9c050f	\N
SERVICES-TECH-2025-fb7831	\N
SERVICES-TECH-2025-0713ae	\N
SERVICES-TECH-2025-a92139	\N
\.


--
-- Name: asset_serial_seq; Type: SEQUENCE SET; Schema: operations; Owner: postgres
--

SELECT pg_catalog.setval('operations.asset_serial_seq', 20, true);


--
-- Name: batch_number_seq; Type: SEQUENCE SET; Schema: operations; Owner: postgres
--

SELECT pg_catalog.setval('operations.batch_number_seq', 20, true);


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

SELECT pg_catalog.setval('public.auth_permission_id_seq', 32, true);


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

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 27, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 13, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 18, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: sales; Owner: postgres
--

SELECT pg_catalog.setval('sales.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: sales; Owner: postgres
--

SELECT pg_catalog.setval('sales.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: sales; Owner: postgres
--

SELECT pg_catalog.setval('sales.auth_permission_id_seq', 32, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: sales; Owner: postgres
--

SELECT pg_catalog.setval('sales.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: sales; Owner: postgres
--

SELECT pg_catalog.setval('sales.auth_user_id_seq', 3, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: sales; Owner: postgres
--

SELECT pg_catalog.setval('sales.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: sales; Owner: postgres
--

SELECT pg_catalog.setval('sales.django_admin_log_id_seq', 1, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: sales; Owner: postgres
--

SELECT pg_catalog.setval('sales.django_content_type_id_seq', 10, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: sales; Owner: postgres
--

SELECT pg_catalog.setval('sales.django_migrations_id_seq', 18, true);


--
-- Name: chart_of_accounts chart_of_accounts_pkey; Type: CONSTRAINT; Schema: accounting; Owner: postgres
--

ALTER TABLE ONLY accounting.chart_of_accounts
    ADD CONSTRAINT chart_of_accounts_pkey PRIMARY KEY (account_code);


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
-- Name: official_receipts official_receipts_pkey; Type: CONSTRAINT; Schema: accounting; Owner: postgres
--

ALTER TABLE ONLY accounting.official_receipts
    ADD CONSTRAINT official_receipts_pkey PRIMARY KEY (or_id);


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
-- Name: currency currency_pkey; Type: CONSTRAINT; Schema: admin; Owner: postgres
--

ALTER TABLE ONLY admin.currency
    ADD CONSTRAINT currency_pkey PRIMARY KEY (currency_id);


--
-- Name: item_master_data item_master_data_pkey; Type: CONSTRAINT; Schema: admin; Owner: postgres
--

ALTER TABLE ONLY admin.item_master_data
    ADD CONSTRAINT item_master_data_pkey PRIMARY KEY (item_id);


--
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: admin; Owner: postgres
--

ALTER TABLE ONLY admin.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (notifications_id);


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
-- Name: users unique_employee; Type: CONSTRAINT; Schema: admin; Owner: postgres
--

ALTER TABLE ONLY admin.users
    ADD CONSTRAINT unique_employee UNIQUE (employee_id);


--
-- Name: business_partner_master uq_customer_id; Type: CONSTRAINT; Schema: admin; Owner: postgres
--

ALTER TABLE ONLY admin.business_partner_master
    ADD CONSTRAINT uq_customer_id UNIQUE (customer_id);


--
-- Name: business_partner_master uq_employee_id; Type: CONSTRAINT; Schema: admin; Owner: postgres
--

ALTER TABLE ONLY admin.business_partner_master
    ADD CONSTRAINT uq_employee_id UNIQUE (employee_id);


--
-- Name: business_partner_master uq_vendor_code; Type: CONSTRAINT; Schema: admin; Owner: postgres
--

ALTER TABLE ONLY admin.business_partner_master
    ADD CONSTRAINT uq_vendor_code UNIQUE (vendor_code);


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
    ADD CONSTRAINT delivery_order_pkey PRIMARY KEY (del_order_id);


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
    ADD CONSTRAINT budget_approvals_pkey PRIMARY KEY (budget_approvals_id);


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
-- Name: inventory_item inventory_item_pkey; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

ALTER TABLE ONLY inventory.inventory_item
    ADD CONSTRAINT inventory_item_pkey PRIMARY KEY (inventory_item_id);


--
-- Name: inventory_product_data inventory_product_data_pkey; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

ALTER TABLE ONLY inventory.inventory_product_data
    ADD CONSTRAINT inventory_product_data_pkey PRIMARY KEY (item_md_id);


--
-- Name: warehouse_movement warehouse_movement_pkey; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

ALTER TABLE ONLY inventory.warehouse_movement
    ADD CONSTRAINT warehouse_movement_pkey PRIMARY KEY (movement_id);


--
-- Name: management_approvals management_approvals_pkey; Type: CONSTRAINT; Schema: management; Owner: postgres
--

ALTER TABLE ONLY management.management_approvals
    ADD CONSTRAINT management_approvals_pkey PRIMARY KEY (approval_id);


--
-- Name: bill_of_materials bill_of_materials_pkey; Type: CONSTRAINT; Schema: mrp; Owner: postgres
--

ALTER TABLE ONLY mrp.bill_of_materials
    ADD CONSTRAINT bill_of_materials_pkey PRIMARY KEY (bom_id);


--
-- Name: bill_of_materials bill_of_materials_production_order_detail_id_key; Type: CONSTRAINT; Schema: mrp; Owner: postgres
--

ALTER TABLE ONLY mrp.bill_of_materials
    ADD CONSTRAINT bill_of_materials_production_order_detail_id_key UNIQUE (production_order_detail_id);


--
-- Name: non_project_order_pricing non_project_order_pricing_pkey; Type: CONSTRAINT; Schema: mrp; Owner: postgres
--

ALTER TABLE ONLY mrp.non_project_order_pricing
    ADD CONSTRAINT non_project_order_pricing_pkey PRIMARY KEY (non_project_costing_id);


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
-- Name: document_items document_items_batch_no_key; Type: CONSTRAINT; Schema: operations; Owner: postgres
--

ALTER TABLE ONLY operations.document_items
    ADD CONSTRAINT document_items_batch_no_key UNIQUE (batch_no);


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
-- Name: report_monitoring report_monitoring_pkey; Type: CONSTRAINT; Schema: project_management; Owner: postgres
--

ALTER TABLE ONLY project_management.report_monitoring
    ADD CONSTRAINT report_monitoring_pkey PRIMARY KEY (report_monitoring_id);


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
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


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
-- Name: credit_memo credit_memo_pkey; Type: CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.credit_memo
    ADD CONSTRAINT credit_memo_pkey PRIMARY KEY (credit_memo_id);


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
-- Name: delivery_note delivery_note_pkey; Type: CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.delivery_note
    ADD CONSTRAINT delivery_note_pkey PRIMARY KEY (delivery_note_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


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
-- Name: product_pricing product_pricing_pkey; Type: CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.product_pricing
    ADD CONSTRAINT product_pricing_pkey PRIMARY KEY (product_id);


--
-- Name: quotation quotation_pkey; Type: CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.quotation
    ADD CONSTRAINT quotation_pkey PRIMARY KEY (quotation_id);


--
-- Name: renewal_warranty renewal_warranty_pkey; Type: CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.renewal_warranty
    ADD CONSTRAINT renewal_warranty_pkey PRIMARY KEY (renewal_id);


--
-- Name: return return_pkey; Type: CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.return
    ADD CONSTRAINT return_pkey PRIMARY KEY (return_id);


--
-- Name: sales_invoices sales_invoices_pkey; Type: CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.sales_invoices
    ADD CONSTRAINT sales_invoices_pkey PRIMARY KEY (invoice_id);


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
-- Name: additional_service additional_service_pkey; Type: CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.additional_service
    ADD CONSTRAINT additional_service_pkey PRIMARY KEY (additional_service_id);


--
-- Name: additional_service_type additional_service_type_pkey; Type: CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.additional_service_type
    ADD CONSTRAINT additional_service_type_pkey PRIMARY KEY (additional_service_type_id);


--
-- Name: after_analysis_sched after_analysis_sched_pkey; Type: CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.after_analysis_sched
    ADD CONSTRAINT after_analysis_sched_pkey PRIMARY KEY (analysis_sched_id);


--
-- Name: delivery_order delivery_order_pkey; Type: CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.delivery_order
    ADD CONSTRAINT delivery_order_pkey PRIMARY KEY (delivery_order_id);


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
-- Name: service_order_item service_order_item_pkey; Type: CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.service_order_item
    ADD CONSTRAINT service_order_item_pkey PRIMARY KEY (service_order_item_id);


--
-- Name: service_order service_order_pkey; Type: CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.service_order
    ADD CONSTRAINT service_order_pkey PRIMARY KEY (service_order_id);


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
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: sales; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON sales.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: sales; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON sales.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: sales; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON sales.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: sales; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON sales.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: sales; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON sales.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: sales; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON sales.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: sales; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON sales.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: sales; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON sales.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: sales; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON sales.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: sales; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON sales.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: sales; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON sales.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: sales; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON sales.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: sales; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON sales.django_session USING btree (session_key varchar_pattern_ops);


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
-- Name: official_receipts before_insert_official_receipts; Type: TRIGGER; Schema: accounting; Owner: postgres
--

CREATE TRIGGER before_insert_official_receipts BEFORE INSERT ON accounting.official_receipts FOR EACH ROW EXECUTE FUNCTION accounting.generate_or_id();


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
-- Name: currency before_insert_currency; Type: TRIGGER; Schema: admin; Owner: postgres
--

CREATE TRIGGER before_insert_currency BEFORE INSERT ON admin.currency FOR EACH ROW EXECUTE FUNCTION admin.generate_currency_id();


--
-- Name: item_master_data before_insert_item_master_data; Type: TRIGGER; Schema: admin; Owner: postgres
--

CREATE TRIGGER before_insert_item_master_data BEFORE INSERT ON admin.item_master_data FOR EACH ROW EXECUTE FUNCTION admin.generate_item_id();


--
-- Name: notifications before_insert_notifications_id; Type: TRIGGER; Schema: admin; Owner: postgres
--

CREATE TRIGGER before_insert_notifications_id BEFORE INSERT ON admin.notifications FOR EACH ROW EXECUTE FUNCTION public.generate_notifications_id();


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
-- Name: assets trg_sync_item_master_data_assets; Type: TRIGGER; Schema: admin; Owner: postgres
--

CREATE TRIGGER trg_sync_item_master_data_assets AFTER INSERT ON admin.assets FOR EACH ROW EXECUTE FUNCTION admin.sync_item_master_data();


--
-- Name: products trg_sync_item_master_data_products; Type: TRIGGER; Schema: admin; Owner: postgres
--

CREATE TRIGGER trg_sync_item_master_data_products AFTER INSERT ON admin.products FOR EACH ROW EXECUTE FUNCTION admin.sync_item_master_data();


--
-- Name: raw_materials trg_sync_item_master_data_raw_materials; Type: TRIGGER; Schema: admin; Owner: postgres
--

CREATE TRIGGER trg_sync_item_master_data_raw_materials AFTER INSERT ON admin.raw_materials FOR EACH ROW EXECUTE FUNCTION admin.sync_item_master_data();


--
-- Name: products trigger_create_product_pricing; Type: TRIGGER; Schema: admin; Owner: postgres
--

CREATE TRIGGER trigger_create_product_pricing AFTER INSERT ON admin.products FOR EACH ROW EXECUTE FUNCTION public.create_product_pricing();


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

CREATE TRIGGER before_insert_delivery_order BEFORE INSERT ON distribution.delivery_order FOR EACH ROW EXECUTE FUNCTION distribution.generate_del_order_id();


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

CREATE TRIGGER before_insert_goods_issue BEFORE INSERT ON distribution.goods_issue FOR EACH ROW EXECUTE FUNCTION distribution.generate_goods_issue_id();


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
-- Name: shipment_details before_insert_shipment_details; Type: TRIGGER; Schema: distribution; Owner: postgres
--

CREATE TRIGGER before_insert_shipment_details BEFORE INSERT ON distribution.shipment_details FOR EACH ROW EXECUTE FUNCTION distribution.generate_shipment_details_id();


--
-- Name: shipping_cost before_insert_shipping_cost; Type: TRIGGER; Schema: distribution; Owner: postgres
--

CREATE TRIGGER before_insert_shipping_cost BEFORE INSERT ON distribution.shipping_cost FOR EACH ROW EXECUTE FUNCTION distribution.generate_shipping_cost_id();


--
-- Name: budget_approvals before_insert_budget_approvals; Type: TRIGGER; Schema: finance; Owner: postgres
--

CREATE TRIGGER before_insert_budget_approvals BEFORE INSERT ON finance.budget_approvals FOR EACH ROW EXECUTE FUNCTION finance.generate_budget_approvals_id();


--
-- Name: budget_validations before_insert_budget_validations; Type: TRIGGER; Schema: finance; Owner: postgres
--

CREATE TRIGGER before_insert_budget_validations BEFORE INSERT ON finance.budget_validations FOR EACH ROW EXECUTE FUNCTION finance.generate_validation_id();


--
-- Name: attendance_tracking before_insert_attendance_tracking; Type: TRIGGER; Schema: human_resources; Owner: postgres
--

CREATE TRIGGER before_insert_attendance_tracking BEFORE INSERT ON human_resources.attendance_tracking FOR EACH ROW EXECUTE FUNCTION human_resources.generate_attendance_id();


--
-- Name: candidates before_insert_candidates; Type: TRIGGER; Schema: human_resources; Owner: postgres
--

CREATE TRIGGER before_insert_candidates BEFORE INSERT ON human_resources.candidates FOR EACH ROW EXECUTE FUNCTION human_resources.generate_candidate_id();


--
-- Name: departments before_insert_departments; Type: TRIGGER; Schema: human_resources; Owner: postgres
--

CREATE TRIGGER before_insert_departments BEFORE INSERT ON human_resources.departments FOR EACH ROW EXECUTE FUNCTION human_resources.generate_department_id();


--
-- Name: employee_performance before_insert_employee_performance; Type: TRIGGER; Schema: human_resources; Owner: postgres
--

CREATE TRIGGER before_insert_employee_performance BEFORE INSERT ON human_resources.employee_performance FOR EACH ROW EXECUTE FUNCTION human_resources.generate_performance_id();


--
-- Name: employees before_insert_employees; Type: TRIGGER; Schema: human_resources; Owner: postgres
--

CREATE TRIGGER before_insert_employees BEFORE INSERT ON human_resources.employees FOR EACH ROW EXECUTE FUNCTION human_resources.generate_employee_id();


--
-- Name: interviews before_insert_interviews; Type: TRIGGER; Schema: human_resources; Owner: postgres
--

CREATE TRIGGER before_insert_interviews BEFORE INSERT ON human_resources.interviews FOR EACH ROW EXECUTE FUNCTION human_resources.generate_interview_id();


--
-- Name: job_posting before_insert_job_posting; Type: TRIGGER; Schema: human_resources; Owner: postgres
--

CREATE TRIGGER before_insert_job_posting BEFORE INSERT ON human_resources.job_posting FOR EACH ROW EXECUTE FUNCTION human_resources.generate_job_id();


--
-- Name: leave_requests before_insert_leave_requests; Type: TRIGGER; Schema: human_resources; Owner: postgres
--

CREATE TRIGGER before_insert_leave_requests BEFORE INSERT ON human_resources.leave_requests FOR EACH ROW EXECUTE FUNCTION human_resources.generate_leave_id();


--
-- Name: payroll before_insert_payroll; Type: TRIGGER; Schema: human_resources; Owner: postgres
--

CREATE TRIGGER before_insert_payroll BEFORE INSERT ON human_resources.payroll FOR EACH ROW EXECUTE FUNCTION human_resources.generate_payroll_id();


--
-- Name: employee_salary before_insert_salary; Type: TRIGGER; Schema: human_resources; Owner: postgres
--

CREATE TRIGGER before_insert_salary BEFORE INSERT ON human_resources.employee_salary FOR EACH ROW EXECUTE FUNCTION human_resources.generate_salary_id();


--
-- Name: workforce_allocation before_insert_workforce_allocation; Type: TRIGGER; Schema: human_resources; Owner: postgres
--

CREATE TRIGGER before_insert_workforce_allocation BEFORE INSERT ON human_resources.workforce_allocation FOR EACH ROW EXECUTE FUNCTION human_resources.generate_allocation_id();


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
-- Name: inventory_product_data before_insert_inventory_item_master_data; Type: TRIGGER; Schema: inventory; Owner: postgres
--

CREATE TRIGGER before_insert_inventory_item_master_data BEFORE INSERT ON inventory.inventory_product_data FOR EACH ROW EXECUTE FUNCTION inventory.generate_item_md_id();


--
-- Name: warehouse_movement before_insert_warehouse_movement; Type: TRIGGER; Schema: inventory; Owner: postgres
--

CREATE TRIGGER before_insert_warehouse_movement BEFORE INSERT ON inventory.warehouse_movement FOR EACH ROW EXECUTE FUNCTION inventory.generate_movement_id();


--
-- Name: management_approvals before_insert_management_approvals; Type: TRIGGER; Schema: management; Owner: postgres
--

CREATE TRIGGER before_insert_management_approvals BEFORE INSERT ON management.management_approvals FOR EACH ROW EXECUTE FUNCTION management.generate_approval_id();


--
-- Name: bill_of_materials before_insert_bill_of_materials; Type: TRIGGER; Schema: mrp; Owner: postgres
--

CREATE TRIGGER before_insert_bill_of_materials BEFORE INSERT ON mrp.bill_of_materials FOR EACH ROW EXECUTE FUNCTION mrp.generate_bom_id();


--
-- Name: non_project_order_pricing before_insert_non_project_order_pricing; Type: TRIGGER; Schema: mrp; Owner: postgres
--

CREATE TRIGGER before_insert_non_project_order_pricing BEFORE INSERT ON mrp.non_project_order_pricing FOR EACH ROW EXECUTE FUNCTION mrp.generate_non_project_costing_id();


--
-- Name: principal_items before_insert_principal_items; Type: TRIGGER; Schema: mrp; Owner: postgres
--

CREATE TRIGGER before_insert_principal_items BEFORE INSERT ON mrp.principal_items FOR EACH ROW EXECUTE FUNCTION mrp.generate_principal_item_id();


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
-- Name: serial_tracking trg_generate_asset_serial; Type: TRIGGER; Schema: operations; Owner: postgres
--

CREATE TRIGGER trg_generate_asset_serial BEFORE INSERT ON operations.serial_tracking FOR EACH ROW WHEN ((new.serial_no IS NULL)) EXECUTE FUNCTION operations.generate_asset_serial();


--
-- Name: document_items trg_generate_batch_number; Type: TRIGGER; Schema: operations; Owner: postgres
--

CREATE TRIGGER trg_generate_batch_number BEFORE INSERT ON operations.document_items FOR EACH ROW WHEN ((new.batch_no IS NULL)) EXECUTE FUNCTION operations.generate_batch_number();


--
-- Name: equipment before_insert_equipment; Type: TRIGGER; Schema: production; Owner: postgres
--

CREATE TRIGGER before_insert_equipment BEFORE INSERT ON production.equipment FOR EACH ROW EXECUTE FUNCTION production.generate_equipment_id();


--
-- Name: labor before_insert_labor; Type: TRIGGER; Schema: production; Owner: postgres
--

CREATE TRIGGER before_insert_labor BEFORE INSERT ON production.labor FOR EACH ROW EXECUTE FUNCTION production.generate_labor_id();


--
-- Name: production_orders_details before_insert_production_orders_details; Type: TRIGGER; Schema: production; Owner: postgres
--

CREATE TRIGGER before_insert_production_orders_details BEFORE INSERT ON production.production_orders_details FOR EACH ROW EXECUTE FUNCTION production.generate_production_order_detail_id();


--
-- Name: production_orders_header before_insert_production_orders_header; Type: TRIGGER; Schema: production; Owner: postgres
--

CREATE TRIGGER before_insert_production_orders_header BEFORE INSERT ON production.production_orders_header FOR EACH ROW EXECUTE FUNCTION production.generate_production_order_id();


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
-- Name: report_monitoring before_insert_report_monitoring; Type: TRIGGER; Schema: project_management; Owner: postgres
--

CREATE TRIGGER before_insert_report_monitoring BEFORE INSERT ON project_management.report_monitoring FOR EACH ROW EXECUTE FUNCTION public.generate_report_monitoring_id();


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
-- Name: credit_memo before_insert_credit_memo; Type: TRIGGER; Schema: sales; Owner: postgres
--

CREATE TRIGGER before_insert_credit_memo BEFORE INSERT ON sales.credit_memo FOR EACH ROW EXECUTE FUNCTION sales.generate_credit_memo_id();


--
-- Name: customers before_insert_customer; Type: TRIGGER; Schema: sales; Owner: postgres
--

CREATE TRIGGER before_insert_customer BEFORE INSERT ON sales.customers FOR EACH ROW EXECUTE FUNCTION sales.generate_customer_id();


--
-- Name: sales_invoices before_insert_invoice; Type: TRIGGER; Schema: sales; Owner: postgres
--

CREATE TRIGGER before_insert_invoice BEFORE INSERT ON sales.sales_invoices FOR EACH ROW EXECUTE FUNCTION sales.generate_invoice_id();


--
-- Name: opportunities before_insert_opportunity; Type: TRIGGER; Schema: sales; Owner: postgres
--

CREATE TRIGGER before_insert_opportunity BEFORE INSERT ON sales.opportunities FOR EACH ROW EXECUTE FUNCTION sales.generate_opportunity_id();


--
-- Name: orders before_insert_orders; Type: TRIGGER; Schema: sales; Owner: postgres
--

CREATE TRIGGER before_insert_orders BEFORE INSERT ON sales.orders FOR EACH ROW EXECUTE FUNCTION sales.generate_order_id();


--
-- Name: payments before_insert_payment; Type: TRIGGER; Schema: sales; Owner: postgres
--

CREATE TRIGGER before_insert_payment BEFORE INSERT ON sales.payments FOR EACH ROW EXECUTE FUNCTION sales.generate_payment_id();


--
-- Name: product_pricing before_insert_product_pricing; Type: TRIGGER; Schema: sales; Owner: postgres
--

CREATE TRIGGER before_insert_product_pricing BEFORE INSERT ON sales.product_pricing FOR EACH ROW EXECUTE FUNCTION public.generate_product_pricing_id();


--
-- Name: quotation before_insert_quotation; Type: TRIGGER; Schema: sales; Owner: postgres
--

CREATE TRIGGER before_insert_quotation BEFORE INSERT ON sales.quotation FOR EACH ROW EXECUTE FUNCTION sales.generate_quotation_id();


--
-- Name: renewal_warranty before_insert_renewal_warranty; Type: TRIGGER; Schema: sales; Owner: postgres
--

CREATE TRIGGER before_insert_renewal_warranty BEFORE INSERT ON sales.renewal_warranty FOR EACH ROW EXECUTE FUNCTION sales.generate_renewal_id();


--
-- Name: return before_insert_return; Type: TRIGGER; Schema: sales; Owner: postgres
--

CREATE TRIGGER before_insert_return BEFORE INSERT ON sales.return FOR EACH ROW EXECUTE FUNCTION sales.generate_return_id();


--
-- Name: delivery_note before_insert_shipping; Type: TRIGGER; Schema: sales; Owner: postgres
--

CREATE TRIGGER before_insert_shipping BEFORE INSERT ON sales.delivery_note FOR EACH ROW EXECUTE FUNCTION sales.generate_delivery_note_id();


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
-- Name: product_pricing trg_calculate_product_pricing; Type: TRIGGER; Schema: sales; Owner: postgres
--

CREATE TRIGGER trg_calculate_product_pricing BEFORE INSERT OR UPDATE ON sales.product_pricing FOR EACH ROW EXECUTE FUNCTION public.calculate_product_pricing();


--
-- Name: customers trg_create_business_partner; Type: TRIGGER; Schema: sales; Owner: postgres
--

CREATE TRIGGER trg_create_business_partner AFTER INSERT ON sales.customers FOR EACH ROW EXECUTE FUNCTION sales.create_business_partner();


--
-- Name: customers trg_create_gl_account; Type: TRIGGER; Schema: sales; Owner: postgres
--

CREATE TRIGGER trg_create_gl_account AFTER INSERT ON sales.customers FOR EACH ROW EXECUTE FUNCTION sales.create_gl_account();


--
-- Name: delivery_note trg_generate_sales_invoice; Type: TRIGGER; Schema: sales; Owner: postgres
--

CREATE TRIGGER trg_generate_sales_invoice AFTER INSERT ON sales.delivery_note FOR EACH ROW EXECUTE FUNCTION sales.generate_invoice();


--
-- Name: orders trg_insert_order_based_on_type; Type: TRIGGER; Schema: sales; Owner: postgres
--

CREATE TRIGGER trg_insert_order_based_on_type AFTER INSERT ON sales.orders FOR EACH ROW EXECUTE FUNCTION public.insert_order_based_on_type();


--
-- Name: delivery_note trg_update_order_delivery; Type: TRIGGER; Schema: sales; Owner: postgres
--

CREATE TRIGGER trg_update_order_delivery AFTER UPDATE ON sales.delivery_note FOR EACH ROW EXECUTE FUNCTION sales.update_order_delivery();


--
-- Name: statement_item trigger_update_demand_level; Type: TRIGGER; Schema: sales; Owner: postgres
--

CREATE TRIGGER trigger_update_demand_level AFTER INSERT OR DELETE OR UPDATE ON sales.statement_item FOR EACH ROW EXECUTE FUNCTION public.update_demand_level();


--
-- Name: additional_service before_insert_additional_service; Type: TRIGGER; Schema: services; Owner: postgres
--

CREATE TRIGGER before_insert_additional_service BEFORE INSERT ON services.additional_service FOR EACH ROW EXECUTE FUNCTION services.generate_additional_service_id();


--
-- Name: additional_service_type before_insert_additional_service_type; Type: TRIGGER; Schema: services; Owner: postgres
--

CREATE TRIGGER before_insert_additional_service_type BEFORE INSERT ON services.additional_service_type FOR EACH ROW EXECUTE FUNCTION services.generate_additional_service_type_id();


--
-- Name: after_analysis_sched before_insert_after_analysis_sched; Type: TRIGGER; Schema: services; Owner: postgres
--

CREATE TRIGGER before_insert_after_analysis_sched BEFORE INSERT ON services.after_analysis_sched FOR EACH ROW EXECUTE FUNCTION services.generate_analysis_sched_id();


--
-- Name: delivery_order before_insert_delivery_order; Type: TRIGGER; Schema: services; Owner: postgres
--

CREATE TRIGGER before_insert_delivery_order BEFORE INSERT ON services.delivery_order FOR EACH ROW EXECUTE FUNCTION services.generate_delivery_order_id();


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
-- Name: service_contract before_insert_service_contract; Type: TRIGGER; Schema: services; Owner: postgres
--

CREATE TRIGGER before_insert_service_contract BEFORE INSERT ON services.service_contract FOR EACH ROW EXECUTE FUNCTION services.generate_service_contract_id();


--
-- Name: service_order before_insert_service_order; Type: TRIGGER; Schema: services; Owner: postgres
--

CREATE TRIGGER before_insert_service_order BEFORE INSERT ON services.service_order FOR EACH ROW EXECUTE FUNCTION services.generate_service_order_id();


--
-- Name: service_order_item before_insert_service_order_item; Type: TRIGGER; Schema: services; Owner: postgres
--

CREATE TRIGGER before_insert_service_order_item BEFORE INSERT ON services.service_order_item FOR EACH ROW EXECUTE FUNCTION services.generate_service_order_item_id();


--
-- Name: service_report before_insert_service_report; Type: TRIGGER; Schema: services; Owner: postgres
--

CREATE TRIGGER before_insert_service_report BEFORE INSERT ON services.service_report FOR EACH ROW EXECUTE FUNCTION services.generate_report_id();


--
-- Name: service_request before_insert_service_request; Type: TRIGGER; Schema: services; Owner: postgres
--

CREATE TRIGGER before_insert_service_request BEFORE INSERT ON services.service_request FOR EACH ROW EXECUTE FUNCTION services.generate_service_request_id();


--
-- Name: technician before_insert_technician; Type: TRIGGER; Schema: services; Owner: postgres
--

CREATE TRIGGER before_insert_technician BEFORE INSERT ON services.technician FOR EACH ROW EXECUTE FUNCTION services.generate_technician_id();


--
-- Name: general_ledger_accounts fk_general_ledger_accounts_chart_of_accounts; Type: FK CONSTRAINT; Schema: accounting; Owner: postgres
--

ALTER TABLE ONLY accounting.general_ledger_accounts
    ADD CONSTRAINT fk_general_ledger_accounts_chart_of_accounts FOREIGN KEY (account_code) REFERENCES accounting.chart_of_accounts(account_code);


--
-- Name: journal_entries fk_journal_entries_currency; Type: FK CONSTRAINT; Schema: accounting; Owner: postgres
--

ALTER TABLE ONLY accounting.journal_entries
    ADD CONSTRAINT fk_journal_entries_currency FOREIGN KEY (currency_id) REFERENCES admin.currency(currency_id);


--
-- Name: journal_entry_lines fk_journal_entry_lines_gl_account; Type: FK CONSTRAINT; Schema: accounting; Owner: postgres
--

ALTER TABLE ONLY accounting.journal_entry_lines
    ADD CONSTRAINT fk_journal_entry_lines_gl_account FOREIGN KEY (gl_account_id) REFERENCES accounting.general_ledger_accounts(gl_account_id);


--
-- Name: journal_entry_lines fk_journal_entry_lines_journal; Type: FK CONSTRAINT; Schema: accounting; Owner: postgres
--

ALTER TABLE ONLY accounting.journal_entry_lines
    ADD CONSTRAINT fk_journal_entry_lines_journal FOREIGN KEY (journal_id) REFERENCES accounting.journal_entries(journal_id);


--
-- Name: official_receipts fk_official_receipts_invoice; Type: FK CONSTRAINT; Schema: accounting; Owner: postgres
--

ALTER TABLE ONLY accounting.official_receipts
    ADD CONSTRAINT fk_official_receipts_invoice FOREIGN KEY (invoice_id) REFERENCES sales.sales_invoices(invoice_id);


--
-- Name: item_master_data fk_assets_item; Type: FK CONSTRAINT; Schema: admin; Owner: postgres
--

ALTER TABLE ONLY admin.item_master_data
    ADD CONSTRAINT fk_assets_item FOREIGN KEY (asset_id) REFERENCES admin.assets(asset_id) ON DELETE CASCADE;


--
-- Name: audit_log fk_audit_log_user; Type: FK CONSTRAINT; Schema: admin; Owner: postgres
--

ALTER TABLE ONLY admin.audit_log
    ADD CONSTRAINT fk_audit_log_user FOREIGN KEY (user_id) REFERENCES admin.users(user_id) ON DELETE CASCADE;


--
-- Name: business_partner_master fk_business_partner_customer; Type: FK CONSTRAINT; Schema: admin; Owner: postgres
--

ALTER TABLE ONLY admin.business_partner_master
    ADD CONSTRAINT fk_business_partner_customer FOREIGN KEY (customer_id) REFERENCES sales.customers(customer_id) ON DELETE CASCADE;


--
-- Name: business_partner_master fk_business_partner_employee; Type: FK CONSTRAINT; Schema: admin; Owner: postgres
--

ALTER TABLE ONLY admin.business_partner_master
    ADD CONSTRAINT fk_business_partner_employee FOREIGN KEY (employee_id) REFERENCES human_resources.employees(employee_id) ON DELETE CASCADE;


--
-- Name: business_partner_master fk_business_partner_vendor; Type: FK CONSTRAINT; Schema: admin; Owner: postgres
--

ALTER TABLE ONLY admin.business_partner_master
    ADD CONSTRAINT fk_business_partner_vendor FOREIGN KEY (vendor_code) REFERENCES admin.vendor(vendor_code) ON DELETE CASCADE;


--
-- Name: assets fk_document_assets; Type: FK CONSTRAINT; Schema: admin; Owner: postgres
--

ALTER TABLE ONLY admin.assets
    ADD CONSTRAINT fk_document_assets FOREIGN KEY (content_id) REFERENCES operations.document_items(content_id) ON DELETE CASCADE;


--
-- Name: products fk_document_products; Type: FK CONSTRAINT; Schema: admin; Owner: postgres
--

ALTER TABLE ONLY admin.products
    ADD CONSTRAINT fk_document_products FOREIGN KEY (content_id) REFERENCES operations.document_items(content_id) ON DELETE CASCADE;


--
-- Name: raw_materials fk_material_vendor; Type: FK CONSTRAINT; Schema: admin; Owner: postgres
--

ALTER TABLE ONLY admin.raw_materials
    ADD CONSTRAINT fk_material_vendor FOREIGN KEY (vendor_code) REFERENCES admin.vendor(vendor_code);


--
-- Name: notifications fk_notifications_to_user; Type: FK CONSTRAINT; Schema: admin; Owner: postgres
--

ALTER TABLE ONLY admin.notifications
    ADD CONSTRAINT fk_notifications_to_user FOREIGN KEY (to_user_id) REFERENCES admin.users(user_id) ON DELETE CASCADE;


--
-- Name: item_master_data fk_products_item; Type: FK CONSTRAINT; Schema: admin; Owner: postgres
--

ALTER TABLE ONLY admin.item_master_data
    ADD CONSTRAINT fk_products_item FOREIGN KEY (product_id) REFERENCES admin.products(product_id) ON DELETE CASCADE;


--
-- Name: products fk_products_policy; Type: FK CONSTRAINT; Schema: admin; Owner: postgres
--

ALTER TABLE ONLY admin.products
    ADD CONSTRAINT fk_products_policy FOREIGN KEY (policy_id) REFERENCES admin.policies(policy_id) ON DELETE CASCADE;


--
-- Name: item_master_data fk_raw_materials_item; Type: FK CONSTRAINT; Schema: admin; Owner: postgres
--

ALTER TABLE ONLY admin.item_master_data
    ADD CONSTRAINT fk_raw_materials_item FOREIGN KEY (material_id) REFERENCES admin.raw_materials(material_id) ON DELETE CASCADE;


--
-- Name: users fk_users_employee; Type: FK CONSTRAINT; Schema: admin; Owner: postgres
--

ALTER TABLE ONLY admin.users
    ADD CONSTRAINT fk_users_employee FOREIGN KEY (employee_id) REFERENCES human_resources.employees(employee_id) ON DELETE CASCADE;


--
-- Name: users fk_users_role; Type: FK CONSTRAINT; Schema: admin; Owner: postgres
--

ALTER TABLE ONLY admin.users
    ADD CONSTRAINT fk_users_role FOREIGN KEY (role_id) REFERENCES admin.roles_permission(role_id) ON DELETE CASCADE;


--
-- Name: vendor fk_vendor_application; Type: FK CONSTRAINT; Schema: admin; Owner: postgres
--

ALTER TABLE ONLY admin.vendor
    ADD CONSTRAINT fk_vendor_application FOREIGN KEY (application_reference) REFERENCES purchasing.vendor_application(application_reference) ON DELETE CASCADE;


--
-- Name: billing_receipt fk_billing_receipt_delivery_receipt; Type: FK CONSTRAINT; Schema: distribution; Owner: postgres
--

ALTER TABLE ONLY distribution.billing_receipt
    ADD CONSTRAINT fk_billing_receipt_delivery_receipt FOREIGN KEY (delivery_receipt_id) REFERENCES distribution.delivery_receipt(delivery_receipt_id);


--
-- Name: billing_receipt fk_billing_receipt_sales_invoice; Type: FK CONSTRAINT; Schema: distribution; Owner: postgres
--

ALTER TABLE ONLY distribution.billing_receipt
    ADD CONSTRAINT fk_billing_receipt_sales_invoice FOREIGN KEY (sales_invoice_id) REFERENCES sales.sales_invoices(invoice_id);


--
-- Name: billing_receipt fk_billing_receipt_service_billing; Type: FK CONSTRAINT; Schema: distribution; Owner: postgres
--

ALTER TABLE ONLY distribution.billing_receipt
    ADD CONSTRAINT fk_billing_receipt_service_billing FOREIGN KEY (service_billing_id) REFERENCES services.service_billing(service_billing_id);


--
-- Name: carrier fk_carrier_carrier_name; Type: FK CONSTRAINT; Schema: distribution; Owner: postgres
--

ALTER TABLE ONLY distribution.carrier
    ADD CONSTRAINT fk_carrier_carrier_name FOREIGN KEY (carrier_name) REFERENCES human_resources.employees(employee_id);


--
-- Name: delivery_order fk_delivery_order_approval_request; Type: FK CONSTRAINT; Schema: distribution; Owner: postgres
--

ALTER TABLE ONLY distribution.delivery_order
    ADD CONSTRAINT fk_delivery_order_approval_request FOREIGN KEY (approval_request_id) REFERENCES distribution.logistics_approval_request(approval_request_id);


--
-- Name: delivery_order fk_delivery_order_content; Type: FK CONSTRAINT; Schema: distribution; Owner: postgres
--

ALTER TABLE ONLY distribution.delivery_order
    ADD CONSTRAINT fk_delivery_order_content FOREIGN KEY (content_id) REFERENCES operations.document_items(content_id);


--
-- Name: delivery_order fk_delivery_order_delivery_order; Type: FK CONSTRAINT; Schema: distribution; Owner: postgres
--

ALTER TABLE ONLY distribution.delivery_order
    ADD CONSTRAINT fk_delivery_order_delivery_order FOREIGN KEY (service_order_id) REFERENCES services.delivery_order(delivery_order_id);


--
-- Name: delivery_order fk_delivery_order_sales_order; Type: FK CONSTRAINT; Schema: distribution; Owner: postgres
--

ALTER TABLE ONLY distribution.delivery_order
    ADD CONSTRAINT fk_delivery_order_sales_order FOREIGN KEY (sales_order_id) REFERENCES sales.orders(order_id);


--
-- Name: delivery_order fk_delivery_order_stock_transfer; Type: FK CONSTRAINT; Schema: distribution; Owner: postgres
--

ALTER TABLE ONLY distribution.delivery_order
    ADD CONSTRAINT fk_delivery_order_stock_transfer FOREIGN KEY (stock_transfer_id) REFERENCES inventory.warehouse_movement(movement_id);


--
-- Name: delivery_receipt fk_delivery_receipt_customer; Type: FK CONSTRAINT; Schema: distribution; Owner: postgres
--

ALTER TABLE ONLY distribution.delivery_receipt
    ADD CONSTRAINT fk_delivery_receipt_customer FOREIGN KEY (received_by) REFERENCES sales.customers(customer_id);


--
-- Name: delivery_receipt fk_delivery_receipt_shipment; Type: FK CONSTRAINT; Schema: distribution; Owner: postgres
--

ALTER TABLE ONLY distribution.delivery_receipt
    ADD CONSTRAINT fk_delivery_receipt_shipment FOREIGN KEY (shipment_id) REFERENCES distribution.shipment_details(shipment_id);


--
-- Name: failed_shipment fk_failed_shipment_shipment; Type: FK CONSTRAINT; Schema: distribution; Owner: postgres
--

ALTER TABLE ONLY distribution.failed_shipment
    ADD CONSTRAINT fk_failed_shipment_shipment FOREIGN KEY (shipment_id) REFERENCES distribution.shipment_details(shipment_id);


--
-- Name: goods_issue fk_goods_issue_billing_receipt; Type: FK CONSTRAINT; Schema: distribution; Owner: postgres
--

ALTER TABLE ONLY distribution.goods_issue
    ADD CONSTRAINT fk_goods_issue_billing_receipt FOREIGN KEY (billing_receipt_id) REFERENCES distribution.billing_receipt(billing_receipt_id);


--
-- Name: goods_issue fk_goods_issue_employee; Type: FK CONSTRAINT; Schema: distribution; Owner: postgres
--

ALTER TABLE ONLY distribution.goods_issue
    ADD CONSTRAINT fk_goods_issue_employee FOREIGN KEY (issued_by) REFERENCES human_resources.employees(employee_id);


--
-- Name: logistics_approval_request fk_logistics_approval_request_delivery_order; Type: FK CONSTRAINT; Schema: distribution; Owner: postgres
--

ALTER TABLE ONLY distribution.logistics_approval_request
    ADD CONSTRAINT fk_logistics_approval_request_delivery_order FOREIGN KEY (del_order_id) REFERENCES distribution.delivery_order(del_order_id);


--
-- Name: logistics_approval_request fk_logistics_approval_request_employee; Type: FK CONSTRAINT; Schema: distribution; Owner: postgres
--

ALTER TABLE ONLY distribution.logistics_approval_request
    ADD CONSTRAINT fk_logistics_approval_request_employee FOREIGN KEY (approved_by) REFERENCES human_resources.employees(employee_id);


--
-- Name: operational_cost fk_operational_cost_packing_cost; Type: FK CONSTRAINT; Schema: distribution; Owner: postgres
--

ALTER TABLE ONLY distribution.operational_cost
    ADD CONSTRAINT fk_operational_cost_packing_cost FOREIGN KEY (packing_cost_id) REFERENCES distribution.packing_cost(packing_cost_id);


--
-- Name: operational_cost fk_operational_cost_shipping_cost; Type: FK CONSTRAINT; Schema: distribution; Owner: postgres
--

ALTER TABLE ONLY distribution.operational_cost
    ADD CONSTRAINT fk_operational_cost_shipping_cost FOREIGN KEY (shipping_cost_id) REFERENCES distribution.shipping_cost(shipping_cost_id);


--
-- Name: packing_list fk_packing_list_employee; Type: FK CONSTRAINT; Schema: distribution; Owner: postgres
--

ALTER TABLE ONLY distribution.packing_list
    ADD CONSTRAINT fk_packing_list_employee FOREIGN KEY (packed_by) REFERENCES human_resources.employees(employee_id);


--
-- Name: packing_list fk_packing_list_packing_cost; Type: FK CONSTRAINT; Schema: distribution; Owner: postgres
--

ALTER TABLE ONLY distribution.packing_list
    ADD CONSTRAINT fk_packing_list_packing_cost FOREIGN KEY (packing_cost_id) REFERENCES distribution.packing_cost(packing_cost_id);


--
-- Name: packing_list fk_packing_list_picking_list; Type: FK CONSTRAINT; Schema: distribution; Owner: postgres
--

ALTER TABLE ONLY distribution.packing_list
    ADD CONSTRAINT fk_packing_list_picking_list FOREIGN KEY (picking_list_id) REFERENCES distribution.picking_list(picking_list_id);


--
-- Name: picking_list fk_picking_list_approval_request; Type: FK CONSTRAINT; Schema: distribution; Owner: postgres
--

ALTER TABLE ONLY distribution.picking_list
    ADD CONSTRAINT fk_picking_list_approval_request FOREIGN KEY (approval_request_id) REFERENCES distribution.logistics_approval_request(approval_request_id);


--
-- Name: picking_list fk_picking_list_employee; Type: FK CONSTRAINT; Schema: distribution; Owner: postgres
--

ALTER TABLE ONLY distribution.picking_list
    ADD CONSTRAINT fk_picking_list_employee FOREIGN KEY (picked_by) REFERENCES human_resources.employees(employee_id);


--
-- Name: picking_list fk_picking_list_warehouse; Type: FK CONSTRAINT; Schema: distribution; Owner: postgres
--

ALTER TABLE ONLY distribution.picking_list
    ADD CONSTRAINT fk_picking_list_warehouse FOREIGN KEY (warehouse_id) REFERENCES admin.warehouse(warehouse_id);


--
-- Name: rejection fk_rejection_delivery_receipt; Type: FK CONSTRAINT; Schema: distribution; Owner: postgres
--

ALTER TABLE ONLY distribution.rejection
    ADD CONSTRAINT fk_rejection_delivery_receipt FOREIGN KEY (delivery_receipt_id) REFERENCES distribution.delivery_receipt(delivery_receipt_id);


--
-- Name: rework_order fk_rework_order_employee; Type: FK CONSTRAINT; Schema: distribution; Owner: postgres
--

ALTER TABLE ONLY distribution.rework_order
    ADD CONSTRAINT fk_rework_order_employee FOREIGN KEY (assigned_to) REFERENCES human_resources.employees(employee_id);


--
-- Name: rework_order fk_rework_order_failed_shipment; Type: FK CONSTRAINT; Schema: distribution; Owner: postgres
--

ALTER TABLE ONLY distribution.rework_order
    ADD CONSTRAINT fk_rework_order_failed_shipment FOREIGN KEY (failed_shipment_id) REFERENCES distribution.failed_shipment(failed_shipment_id);


--
-- Name: rework_order fk_rework_order_rejection; Type: FK CONSTRAINT; Schema: distribution; Owner: postgres
--

ALTER TABLE ONLY distribution.rework_order
    ADD CONSTRAINT fk_rework_order_rejection FOREIGN KEY (rejection_id) REFERENCES distribution.rejection(rejection_id);


--
-- Name: shipment_details fk_shipment_details_carrier; Type: FK CONSTRAINT; Schema: distribution; Owner: postgres
--

ALTER TABLE ONLY distribution.shipment_details
    ADD CONSTRAINT fk_shipment_details_carrier FOREIGN KEY (carrier_id) REFERENCES distribution.carrier(carrier_id);


--
-- Name: shipment_details fk_shipment_details_packing_list; Type: FK CONSTRAINT; Schema: distribution; Owner: postgres
--

ALTER TABLE ONLY distribution.shipment_details
    ADD CONSTRAINT fk_shipment_details_packing_list FOREIGN KEY (packing_list_id) REFERENCES distribution.packing_list(packing_list_id);


--
-- Name: shipment_details fk_shipment_details_shipping_cost; Type: FK CONSTRAINT; Schema: distribution; Owner: postgres
--

ALTER TABLE ONLY distribution.shipment_details
    ADD CONSTRAINT fk_shipment_details_shipping_cost FOREIGN KEY (shipping_cost_id) REFERENCES distribution.shipping_cost(shipping_cost_id);


--
-- Name: shipping_cost fk_shipping_cost_packing_list; Type: FK CONSTRAINT; Schema: distribution; Owner: postgres
--

ALTER TABLE ONLY distribution.shipping_cost
    ADD CONSTRAINT fk_shipping_cost_packing_list FOREIGN KEY (packing_list_id) REFERENCES distribution.packing_list(packing_list_id);


--
-- Name: budget_approvals fk_budget_approvals_validations; Type: FK CONSTRAINT; Schema: finance; Owner: postgres
--

ALTER TABLE ONLY finance.budget_approvals
    ADD CONSTRAINT fk_budget_approvals_validations FOREIGN KEY (validation_id) REFERENCES finance.budget_validations(validation_id);


--
-- Name: budget_validations fk_budget_validations_department; Type: FK CONSTRAINT; Schema: finance; Owner: postgres
--

ALTER TABLE ONLY finance.budget_validations
    ADD CONSTRAINT fk_budget_validations_department FOREIGN KEY (dept_id) REFERENCES human_resources.departments(dept_id);


--
-- Name: attendance_tracking fk_attendance_tracking_employee; Type: FK CONSTRAINT; Schema: human_resources; Owner: postgres
--

ALTER TABLE ONLY human_resources.attendance_tracking
    ADD CONSTRAINT fk_attendance_tracking_employee FOREIGN KEY (employee_id) REFERENCES human_resources.employees(employee_id) ON DELETE CASCADE;


--
-- Name: candidates fk_candidates_job; Type: FK CONSTRAINT; Schema: human_resources; Owner: postgres
--

ALTER TABLE ONLY human_resources.candidates
    ADD CONSTRAINT fk_candidates_job FOREIGN KEY (job_id) REFERENCES human_resources.job_posting(job_id) ON DELETE CASCADE;


--
-- Name: employee_performance fk_employee_performance_employee; Type: FK CONSTRAINT; Schema: human_resources; Owner: postgres
--

ALTER TABLE ONLY human_resources.employee_performance
    ADD CONSTRAINT fk_employee_performance_employee FOREIGN KEY (employee_id) REFERENCES human_resources.employees(employee_id);


--
-- Name: employee_performance fk_employee_performance_superior; Type: FK CONSTRAINT; Schema: human_resources; Owner: postgres
--

ALTER TABLE ONLY human_resources.employee_performance
    ADD CONSTRAINT fk_employee_performance_superior FOREIGN KEY (immediate_superior_id) REFERENCES human_resources.employees(employee_id);


--
-- Name: employee_salary fk_employee_salary_employee; Type: FK CONSTRAINT; Schema: human_resources; Owner: postgres
--

ALTER TABLE ONLY human_resources.employee_salary
    ADD CONSTRAINT fk_employee_salary_employee FOREIGN KEY (employee_id) REFERENCES human_resources.employees(employee_id);


--
-- Name: employees fk_employees_department; Type: FK CONSTRAINT; Schema: human_resources; Owner: postgres
--

ALTER TABLE ONLY human_resources.employees
    ADD CONSTRAINT fk_employees_department FOREIGN KEY (dept_id) REFERENCES human_resources.departments(dept_id) ON DELETE CASCADE;


--
-- Name: interviews fk_interviews_candidate; Type: FK CONSTRAINT; Schema: human_resources; Owner: postgres
--

ALTER TABLE ONLY human_resources.interviews
    ADD CONSTRAINT fk_interviews_candidate FOREIGN KEY (candidate_id) REFERENCES human_resources.candidates(candidate_id) ON DELETE CASCADE;


--
-- Name: interviews fk_interviews_interviewer; Type: FK CONSTRAINT; Schema: human_resources; Owner: postgres
--

ALTER TABLE ONLY human_resources.interviews
    ADD CONSTRAINT fk_interviews_interviewer FOREIGN KEY (interviewer_id) REFERENCES human_resources.employees(employee_id);


--
-- Name: job_posting fk_job_posting_dept; Type: FK CONSTRAINT; Schema: human_resources; Owner: postgres
--

ALTER TABLE ONLY human_resources.job_posting
    ADD CONSTRAINT fk_job_posting_dept FOREIGN KEY (dept_id) REFERENCES human_resources.departments(dept_id) ON DELETE CASCADE;


--
-- Name: job_posting fk_job_posting_request; Type: FK CONSTRAINT; Schema: human_resources; Owner: postgres
--

ALTER TABLE ONLY human_resources.job_posting
    ADD CONSTRAINT fk_job_posting_request FOREIGN KEY (request_id) REFERENCES project_management.contractual_worker_request(request_id) ON DELETE SET NULL;


--
-- Name: leave_requests fk_leave_requests_department; Type: FK CONSTRAINT; Schema: human_resources; Owner: postgres
--

ALTER TABLE ONLY human_resources.leave_requests
    ADD CONSTRAINT fk_leave_requests_department FOREIGN KEY (dept_id) REFERENCES human_resources.departments(dept_id) ON DELETE CASCADE;


--
-- Name: leave_requests fk_leave_requests_employee; Type: FK CONSTRAINT; Schema: human_resources; Owner: postgres
--

ALTER TABLE ONLY human_resources.leave_requests
    ADD CONSTRAINT fk_leave_requests_employee FOREIGN KEY (employee_id) REFERENCES human_resources.employees(employee_id) ON DELETE CASCADE;


--
-- Name: leave_requests fk_leave_requests_management_approval; Type: FK CONSTRAINT; Schema: human_resources; Owner: postgres
--

ALTER TABLE ONLY human_resources.leave_requests
    ADD CONSTRAINT fk_leave_requests_management_approval FOREIGN KEY (management_approval_id) REFERENCES management.management_approvals(approval_id) ON DELETE CASCADE;


--
-- Name: leave_requests fk_leave_requests_superior; Type: FK CONSTRAINT; Schema: human_resources; Owner: postgres
--

ALTER TABLE ONLY human_resources.leave_requests
    ADD CONSTRAINT fk_leave_requests_superior FOREIGN KEY (immediate_superior_id) REFERENCES human_resources.employees(employee_id) ON DELETE SET NULL;


--
-- Name: payroll fk_payroll_employee; Type: FK CONSTRAINT; Schema: human_resources; Owner: postgres
--

ALTER TABLE ONLY human_resources.payroll
    ADD CONSTRAINT fk_payroll_employee FOREIGN KEY (employee_id) REFERENCES human_resources.employees(employee_id);


--
-- Name: workforce_allocation fk_workforce_allocation_current_dept; Type: FK CONSTRAINT; Schema: human_resources; Owner: postgres
--

ALTER TABLE ONLY human_resources.workforce_allocation
    ADD CONSTRAINT fk_workforce_allocation_current_dept FOREIGN KEY (current_dept_id) REFERENCES human_resources.departments(dept_id) ON DELETE CASCADE;


--
-- Name: workforce_allocation fk_workforce_allocation_employee; Type: FK CONSTRAINT; Schema: human_resources; Owner: postgres
--

ALTER TABLE ONLY human_resources.workforce_allocation
    ADD CONSTRAINT fk_workforce_allocation_employee FOREIGN KEY (employee_id) REFERENCES human_resources.employees(employee_id) ON DELETE CASCADE;


--
-- Name: workforce_allocation fk_workforce_allocation_requesting_dept; Type: FK CONSTRAINT; Schema: human_resources; Owner: postgres
--

ALTER TABLE ONLY human_resources.workforce_allocation
    ADD CONSTRAINT fk_workforce_allocation_requesting_dept FOREIGN KEY (requesting_dept_id) REFERENCES human_resources.departments(dept_id) ON DELETE CASCADE;


--
-- Name: deprecation_report fk_content_id; Type: FK CONSTRAINT; Schema: inventory; Owner: postgres
--

ALTER TABLE ONLY inventory.deprecation_report
    ADD CONSTRAINT fk_content_id FOREIGN KEY (content_id) REFERENCES operations.document_items(content_id) ON DELETE CASCADE;


--
-- Name: warehouse_movement fk_destination; Type: FK CONSTRAINT; Schema: inventory; Owner: postgres
--

ALTER TABLE ONLY inventory.warehouse_movement
    ADD CONSTRAINT fk_destination FOREIGN KEY (destination) REFERENCES admin.warehouse(warehouse_id) ON DELETE CASCADE;


--
-- Name: inventory_cyclic_counts fk_employee_id; Type: FK CONSTRAINT; Schema: inventory; Owner: postgres
--

ALTER TABLE ONLY inventory.inventory_cyclic_counts
    ADD CONSTRAINT fk_employee_id FOREIGN KEY (employee_id) REFERENCES human_resources.employees(employee_id) ON DELETE CASCADE;


--
-- Name: inventory_adjustments fk_employee_id; Type: FK CONSTRAINT; Schema: inventory; Owner: postgres
--

ALTER TABLE ONLY inventory.inventory_adjustments
    ADD CONSTRAINT fk_employee_id FOREIGN KEY (employee_id) REFERENCES human_resources.employees(employee_id) ON DELETE CASCADE;


--
-- Name: deprecation_report fk_employee_id; Type: FK CONSTRAINT; Schema: inventory; Owner: postgres
--

ALTER TABLE ONLY inventory.deprecation_report
    ADD CONSTRAINT fk_employee_id FOREIGN KEY (employee_id) REFERENCES human_resources.employees(employee_id) ON DELETE CASCADE;


--
-- Name: inventory_product_data fk_inventory_item_id; Type: FK CONSTRAINT; Schema: inventory; Owner: postgres
--

ALTER TABLE ONLY inventory.inventory_product_data
    ADD CONSTRAINT fk_inventory_item_id FOREIGN KEY (inventory_item_id) REFERENCES inventory.inventory_item(inventory_item_id) ON DELETE CASCADE;


--
-- Name: inventory_item fk_item_id; Type: FK CONSTRAINT; Schema: inventory; Owner: postgres
--

ALTER TABLE ONLY inventory.inventory_item
    ADD CONSTRAINT fk_item_id FOREIGN KEY (item_id) REFERENCES admin.item_master_data(item_id) ON DELETE CASCADE;


--
-- Name: inventory_adjustments fk_item_id; Type: FK CONSTRAINT; Schema: inventory; Owner: postgres
--

ALTER TABLE ONLY inventory.inventory_adjustments
    ADD CONSTRAINT fk_item_id FOREIGN KEY (item_id) REFERENCES admin.item_master_data(item_id) ON DELETE CASCADE;


--
-- Name: warehouse_movement fk_item_id; Type: FK CONSTRAINT; Schema: inventory; Owner: postgres
--

ALTER TABLE ONLY inventory.warehouse_movement
    ADD CONSTRAINT fk_item_id FOREIGN KEY (item_id) REFERENCES admin.item_master_data(item_id) ON DELETE CASCADE;


--
-- Name: warehouse_movement fk_reference_id_order; Type: FK CONSTRAINT; Schema: inventory; Owner: postgres
--

ALTER TABLE ONLY inventory.warehouse_movement
    ADD CONSTRAINT fk_reference_id_order FOREIGN KEY (reference_id_order) REFERENCES sales.orders(order_id) ON DELETE CASCADE;


--
-- Name: warehouse_movement fk_reference_id_purchase_order; Type: FK CONSTRAINT; Schema: inventory; Owner: postgres
--

ALTER TABLE ONLY inventory.warehouse_movement
    ADD CONSTRAINT fk_reference_id_purchase_order FOREIGN KEY (reference_id_purchase_order) REFERENCES purchasing.purchase_order(purchase_id) ON DELETE CASCADE;


--
-- Name: warehouse_movement fk_source; Type: FK CONSTRAINT; Schema: inventory; Owner: postgres
--

ALTER TABLE ONLY inventory.warehouse_movement
    ADD CONSTRAINT fk_source FOREIGN KEY (source) REFERENCES admin.warehouse(warehouse_id) ON DELETE CASCADE;


--
-- Name: management_approvals fk_external_id; Type: FK CONSTRAINT; Schema: management; Owner: postgres
--

ALTER TABLE ONLY management.management_approvals
    ADD CONSTRAINT fk_external_id FOREIGN KEY (external_id) REFERENCES operations.external_module(external_id) ON DELETE SET NULL;


--
-- Name: management_approvals fk_request_id; Type: FK CONSTRAINT; Schema: management; Owner: postgres
--

ALTER TABLE ONLY management.management_approvals
    ADD CONSTRAINT fk_request_id FOREIGN KEY (request_id) REFERENCES services.service_request(service_request_id) ON DELETE SET NULL;


--
-- Name: management_approvals fk_user_id; Type: FK CONSTRAINT; Schema: management; Owner: postgres
--

ALTER TABLE ONLY management.management_approvals
    ADD CONSTRAINT fk_user_id FOREIGN KEY (checked_by) REFERENCES admin.users(user_id);


--
-- Name: bill_of_materials fk_bill_of_materials_material_id; Type: FK CONSTRAINT; Schema: mrp; Owner: postgres
--

ALTER TABLE ONLY mrp.bill_of_materials
    ADD CONSTRAINT fk_bill_of_materials_material_id FOREIGN KEY (material_id) REFERENCES admin.raw_materials(material_id);


--
-- Name: bill_of_materials fk_bill_of_materials_product_id; Type: FK CONSTRAINT; Schema: mrp; Owner: postgres
--

ALTER TABLE ONLY mrp.bill_of_materials
    ADD CONSTRAINT fk_bill_of_materials_product_id FOREIGN KEY (product_id) REFERENCES admin.products(product_id);


--
-- Name: bill_of_materials fk_bill_of_materials_production_order_id; Type: FK CONSTRAINT; Schema: mrp; Owner: postgres
--

ALTER TABLE ONLY mrp.bill_of_materials
    ADD CONSTRAINT fk_bill_of_materials_production_order_id FOREIGN KEY (production_order_detail_id) REFERENCES production.production_orders_details(production_order_detail_id);


--
-- Name: non_project_order_pricing fk_non_project_order_pricing_order_id; Type: FK CONSTRAINT; Schema: mrp; Owner: postgres
--

ALTER TABLE ONLY mrp.non_project_order_pricing
    ADD CONSTRAINT fk_non_project_order_pricing_order_id FOREIGN KEY (order_id) REFERENCES sales.orders(order_id);


--
-- Name: non_project_order_pricing fk_non_project_order_pricing_product_id; Type: FK CONSTRAINT; Schema: mrp; Owner: postgres
--

ALTER TABLE ONLY mrp.non_project_order_pricing
    ADD CONSTRAINT fk_non_project_order_pricing_product_id FOREIGN KEY (product_id) REFERENCES admin.products(product_id);


--
-- Name: principal_items fk_principal_items_service_item_id; Type: FK CONSTRAINT; Schema: mrp; Owner: postgres
--

ALTER TABLE ONLY mrp.principal_items
    ADD CONSTRAINT fk_principal_items_service_item_id FOREIGN KEY (item_id) REFERENCES admin.item_master_data(item_id);


--
-- Name: principal_items fk_principal_items_service_order; Type: FK CONSTRAINT; Schema: mrp; Owner: postgres
--

ALTER TABLE ONLY mrp.principal_items
    ADD CONSTRAINT fk_principal_items_service_order FOREIGN KEY (service_order_id) REFERENCES services.service_order(service_order_id);


--
-- Name: principal_items fk_principal_items_service_request; Type: FK CONSTRAINT; Schema: mrp; Owner: postgres
--

ALTER TABLE ONLY mrp.principal_items
    ADD CONSTRAINT fk_principal_items_service_request FOREIGN KEY (service_request_id) REFERENCES services.service_request(service_request_id);


--
-- Name: document_header fk_document_header_content; Type: FK CONSTRAINT; Schema: operations; Owner: postgres
--

ALTER TABLE ONLY operations.document_header
    ADD CONSTRAINT fk_document_header_content FOREIGN KEY (content_id) REFERENCES operations.document_items(content_id) ON DELETE SET NULL;


--
-- Name: document_header fk_document_header_owner; Type: FK CONSTRAINT; Schema: operations; Owner: postgres
--

ALTER TABLE ONLY operations.document_header
    ADD CONSTRAINT fk_document_header_owner FOREIGN KEY (employee_id) REFERENCES human_resources.employees(employee_id) ON DELETE SET NULL;


--
-- Name: document_header fk_document_header_vendor; Type: FK CONSTRAINT; Schema: operations; Owner: postgres
--

ALTER TABLE ONLY operations.document_header
    ADD CONSTRAINT fk_document_header_vendor FOREIGN KEY (vendor_code) REFERENCES admin.vendor(vendor_code) ON DELETE SET NULL;


--
-- Name: document_items fk_document_items_document; Type: FK CONSTRAINT; Schema: operations; Owner: postgres
--

ALTER TABLE ONLY operations.document_items
    ADD CONSTRAINT fk_document_items_document FOREIGN KEY (document_id) REFERENCES operations.document_header(document_id) ON DELETE SET NULL;


--
-- Name: document_items fk_document_items_external; Type: FK CONSTRAINT; Schema: operations; Owner: postgres
--

ALTER TABLE ONLY operations.document_items
    ADD CONSTRAINT fk_document_items_external FOREIGN KEY (external_id) REFERENCES operations.external_module(external_id) ON DELETE SET NULL;


--
-- Name: document_items fk_document_items_item; Type: FK CONSTRAINT; Schema: operations; Owner: postgres
--

ALTER TABLE ONLY operations.document_items
    ADD CONSTRAINT fk_document_items_item FOREIGN KEY (item_id) REFERENCES admin.item_master_data(item_id) ON DELETE SET NULL;


--
-- Name: document_items fk_document_items_material; Type: FK CONSTRAINT; Schema: operations; Owner: postgres
--

ALTER TABLE ONLY operations.document_items
    ADD CONSTRAINT fk_document_items_material FOREIGN KEY (material_id) REFERENCES admin.raw_materials(material_id) ON DELETE SET NULL;


--
-- Name: document_items fk_document_items_product_document; Type: FK CONSTRAINT; Schema: operations; Owner: postgres
--

ALTER TABLE ONLY operations.document_items
    ADD CONSTRAINT fk_document_items_product_document FOREIGN KEY (productdocu_id) REFERENCES operations.product_document_items(productdocu_id) ON DELETE SET NULL;


--
-- Name: document_items fk_document_items_serial; Type: FK CONSTRAINT; Schema: operations; Owner: postgres
--

ALTER TABLE ONLY operations.document_items
    ADD CONSTRAINT fk_document_items_serial FOREIGN KEY (serial_id) REFERENCES operations.serial_tracking(serial_id) ON DELETE SET NULL;


--
-- Name: document_items fk_document_items_warehouse; Type: FK CONSTRAINT; Schema: operations; Owner: postgres
--

ALTER TABLE ONLY operations.document_items
    ADD CONSTRAINT fk_document_items_warehouse FOREIGN KEY (warehouse_id) REFERENCES admin.warehouse(warehouse_id) ON DELETE SET NULL;


--
-- Name: external_module fk_external_module_approval; Type: FK CONSTRAINT; Schema: operations; Owner: postgres
--

ALTER TABLE ONLY operations.external_module
    ADD CONSTRAINT fk_external_module_approval FOREIGN KEY (approval_id) REFERENCES management.management_approvals(approval_id) ON DELETE SET NULL;


--
-- Name: external_module fk_external_module_approval_request; Type: FK CONSTRAINT; Schema: operations; Owner: postgres
--

ALTER TABLE ONLY operations.external_module
    ADD CONSTRAINT fk_external_module_approval_request FOREIGN KEY (approval_request_id) REFERENCES distribution.logistics_approval_request(approval_request_id) ON DELETE SET NULL;


--
-- Name: external_module fk_external_module_billing_receipt; Type: FK CONSTRAINT; Schema: operations; Owner: postgres
--

ALTER TABLE ONLY operations.external_module
    ADD CONSTRAINT fk_external_module_billing_receipt FOREIGN KEY (billing_receipt_id) REFERENCES distribution.billing_receipt(billing_receipt_id) ON DELETE SET NULL;


--
-- Name: external_module fk_external_module_content; Type: FK CONSTRAINT; Schema: operations; Owner: postgres
--

ALTER TABLE ONLY operations.external_module
    ADD CONSTRAINT fk_external_module_content FOREIGN KEY (content_id) REFERENCES operations.document_items(content_id) ON DELETE SET NULL;


--
-- Name: external_module fk_external_module_delivery_receipt; Type: FK CONSTRAINT; Schema: operations; Owner: postgres
--

ALTER TABLE ONLY operations.external_module
    ADD CONSTRAINT fk_external_module_delivery_receipt FOREIGN KEY (delivery_receipt_id) REFERENCES distribution.delivery_receipt(delivery_receipt_id) ON DELETE SET NULL;


--
-- Name: external_module fk_external_module_deprecation_report; Type: FK CONSTRAINT; Schema: operations; Owner: postgres
--

ALTER TABLE ONLY operations.external_module
    ADD CONSTRAINT fk_external_module_deprecation_report FOREIGN KEY (deprecation_report_id) REFERENCES inventory.deprecation_report(deprecation_report_id) ON DELETE SET NULL;


--
-- Name: external_module fk_external_module_goods_issue; Type: FK CONSTRAINT; Schema: operations; Owner: postgres
--

ALTER TABLE ONLY operations.external_module
    ADD CONSTRAINT fk_external_module_goods_issue FOREIGN KEY (goods_issue_id) REFERENCES distribution.goods_issue(goods_issue_id) ON DELETE SET NULL;


--
-- Name: external_module fk_external_module_production_order_detail; Type: FK CONSTRAINT; Schema: operations; Owner: postgres
--

ALTER TABLE ONLY operations.external_module
    ADD CONSTRAINT fk_external_module_production_order_detail FOREIGN KEY (production_order_detail_id) REFERENCES production.production_orders_details(production_order_detail_id) ON DELETE SET NULL;


--
-- Name: external_module fk_external_module_project_request; Type: FK CONSTRAINT; Schema: operations; Owner: postgres
--

ALTER TABLE ONLY operations.external_module
    ADD CONSTRAINT fk_external_module_project_request FOREIGN KEY (project_request_id) REFERENCES project_management.internal_project_request(project_request_id) ON DELETE SET NULL;


--
-- Name: external_module fk_external_module_project_resources; Type: FK CONSTRAINT; Schema: operations; Owner: postgres
--

ALTER TABLE ONLY operations.external_module
    ADD CONSTRAINT fk_external_module_project_resources FOREIGN KEY (project_resources_id) REFERENCES project_management.external_project_cost_management(project_resources_id) ON DELETE SET NULL;


--
-- Name: external_module fk_external_module_project_tracking; Type: FK CONSTRAINT; Schema: operations; Owner: postgres
--

ALTER TABLE ONLY operations.external_module
    ADD CONSTRAINT fk_external_module_project_tracking FOREIGN KEY (project_tracking_id) REFERENCES project_management.external_project_tracking(project_tracking_id) ON DELETE SET NULL;


--
-- Name: external_module fk_external_module_purchase; Type: FK CONSTRAINT; Schema: operations; Owner: postgres
--

ALTER TABLE ONLY operations.external_module
    ADD CONSTRAINT fk_external_module_purchase FOREIGN KEY (purchase_id) REFERENCES purchasing.purchase_order(purchase_id) ON DELETE SET NULL;


--
-- Name: external_module fk_external_module_purchase_request; Type: FK CONSTRAINT; Schema: operations; Owner: postgres
--

ALTER TABLE ONLY operations.external_module
    ADD CONSTRAINT fk_external_module_purchase_request FOREIGN KEY (request_id) REFERENCES purchasing.purchase_requests(request_id) ON DELETE SET NULL;


--
-- Name: external_module fk_external_module_rework; Type: FK CONSTRAINT; Schema: operations; Owner: postgres
--

ALTER TABLE ONLY operations.external_module
    ADD CONSTRAINT fk_external_module_rework FOREIGN KEY (rework_id) REFERENCES distribution.rework_order(rework_id) ON DELETE SET NULL;


--
-- Name: product_document_items fk_product_document_items_content; Type: FK CONSTRAINT; Schema: operations; Owner: postgres
--

ALTER TABLE ONLY operations.product_document_items
    ADD CONSTRAINT fk_product_document_items_content FOREIGN KEY (content_id) REFERENCES operations.document_items(content_id) ON DELETE SET NULL;


--
-- Name: product_document_items fk_product_document_items_product; Type: FK CONSTRAINT; Schema: operations; Owner: postgres
--

ALTER TABLE ONLY operations.product_document_items
    ADD CONSTRAINT fk_product_document_items_product FOREIGN KEY (product_id) REFERENCES admin.products(product_id) ON DELETE SET NULL;


--
-- Name: serial_tracking fk_serial_tracking_document; Type: FK CONSTRAINT; Schema: operations; Owner: postgres
--

ALTER TABLE ONLY operations.serial_tracking
    ADD CONSTRAINT fk_serial_tracking_document FOREIGN KEY (document_id) REFERENCES operations.document_header(document_id) ON DELETE SET NULL;


--
-- Name: labor fk_labor_employee; Type: FK CONSTRAINT; Schema: production; Owner: postgres
--

ALTER TABLE ONLY production.labor
    ADD CONSTRAINT fk_labor_employee FOREIGN KEY (employee_id) REFERENCES human_resources.employees(employee_id);


--
-- Name: labor fk_labor_production_order; Type: FK CONSTRAINT; Schema: production; Owner: postgres
--

ALTER TABLE ONLY production.labor
    ADD CONSTRAINT fk_labor_production_order FOREIGN KEY (production_order_id) REFERENCES production.production_orders_header(production_order_id);


--
-- Name: production_orders_header fk_production_orders_bom; Type: FK CONSTRAINT; Schema: production; Owner: postgres
--

ALTER TABLE ONLY production.production_orders_header
    ADD CONSTRAINT fk_production_orders_bom FOREIGN KEY (bom_id) REFERENCES mrp.bill_of_materials(bom_id);


--
-- Name: production_orders_details fk_production_orders_details_equipment; Type: FK CONSTRAINT; Schema: production; Owner: postgres
--

ALTER TABLE ONLY production.production_orders_details
    ADD CONSTRAINT fk_production_orders_details_equipment FOREIGN KEY (equipment_id) REFERENCES production.equipment(equipment_id);


--
-- Name: production_orders_details fk_production_orders_details_productdocu; Type: FK CONSTRAINT; Schema: production; Owner: postgres
--

ALTER TABLE ONLY production.production_orders_details
    ADD CONSTRAINT fk_production_orders_details_productdocu FOREIGN KEY (productdocu_id) REFERENCES operations.product_document_items(productdocu_id);


--
-- Name: production_orders_details fk_production_orders_details_production_order; Type: FK CONSTRAINT; Schema: production; Owner: postgres
--

ALTER TABLE ONLY production.production_orders_details
    ADD CONSTRAINT fk_production_orders_details_production_order FOREIGN KEY (production_order_id) REFERENCES production.production_orders_header(production_order_id);


--
-- Name: production_orders_header fk_production_orders_project; Type: FK CONSTRAINT; Schema: production; Owner: postgres
--

ALTER TABLE ONLY production.production_orders_header
    ADD CONSTRAINT fk_production_orders_project FOREIGN KEY (task_id) REFERENCES project_management.external_project_task_list(task_id);


--
-- Name: contractual_worker_request fk_contractual_worker_request_dept; Type: FK CONSTRAINT; Schema: project_management; Owner: postgres
--

ALTER TABLE ONLY project_management.contractual_worker_request
    ADD CONSTRAINT fk_contractual_worker_request_dept FOREIGN KEY (dept_id) REFERENCES human_resources.departments(dept_id) ON DELETE CASCADE;


--
-- Name: contractual_worker_request fk_contractual_worker_request_project; Type: FK CONSTRAINT; Schema: project_management; Owner: postgres
--

ALTER TABLE ONLY project_management.contractual_worker_request
    ADD CONSTRAINT fk_contractual_worker_request_project FOREIGN KEY (intrnl_project_id) REFERENCES project_management.internal_project_details(intrnl_project_id) ON DELETE CASCADE;


--
-- Name: external_project_request fk_external_project_approval; Type: FK CONSTRAINT; Schema: project_management; Owner: postgres
--

ALTER TABLE ONLY project_management.external_project_request
    ADD CONSTRAINT fk_external_project_approval FOREIGN KEY (approval_id) REFERENCES management.management_approvals(approval_id) ON DELETE CASCADE;


--
-- Name: external_project_cost_management fk_external_project_bom_id; Type: FK CONSTRAINT; Schema: project_management; Owner: postgres
--

ALTER TABLE ONLY project_management.external_project_cost_management
    ADD CONSTRAINT fk_external_project_bom_id FOREIGN KEY (bom_id) REFERENCES mrp.bill_of_materials(bom_id) ON DELETE CASCADE;


--
-- Name: external_project_cost_management fk_external_project_cost_project; Type: FK CONSTRAINT; Schema: project_management; Owner: postgres
--

ALTER TABLE ONLY project_management.external_project_cost_management
    ADD CONSTRAINT fk_external_project_cost_project FOREIGN KEY (project_id) REFERENCES project_management.external_project_details(project_id) ON DELETE CASCADE;


--
-- Name: external_project_details fk_external_project_details_request; Type: FK CONSTRAINT; Schema: project_management; Owner: postgres
--

ALTER TABLE ONLY project_management.external_project_details
    ADD CONSTRAINT fk_external_project_details_request FOREIGN KEY (ext_project_request_id) REFERENCES project_management.external_project_request(ext_project_request_id) ON DELETE CASCADE;


--
-- Name: external_project_labor fk_external_project_labor_employee; Type: FK CONSTRAINT; Schema: project_management; Owner: postgres
--

ALTER TABLE ONLY project_management.external_project_labor
    ADD CONSTRAINT fk_external_project_labor_employee FOREIGN KEY (employee_id) REFERENCES human_resources.employees(employee_id) ON DELETE CASCADE;


--
-- Name: external_project_labor fk_external_project_labor_project; Type: FK CONSTRAINT; Schema: project_management; Owner: postgres
--

ALTER TABLE ONLY project_management.external_project_labor
    ADD CONSTRAINT fk_external_project_labor_project FOREIGN KEY (project_id) REFERENCES project_management.external_project_details(project_id) ON DELETE CASCADE;


--
-- Name: external_project_request fk_external_project_request_item; Type: FK CONSTRAINT; Schema: project_management; Owner: postgres
--

ALTER TABLE ONLY project_management.external_project_request
    ADD CONSTRAINT fk_external_project_request_item FOREIGN KEY (item_id) REFERENCES sales.orders(order_id) ON DELETE CASCADE;


--
-- Name: external_project_task_list fk_external_project_task_labor; Type: FK CONSTRAINT; Schema: project_management; Owner: postgres
--

ALTER TABLE ONLY project_management.external_project_task_list
    ADD CONSTRAINT fk_external_project_task_labor FOREIGN KEY (project_labor_id) REFERENCES project_management.external_project_labor(project_labor_id) ON DELETE CASCADE;


--
-- Name: external_project_task_list fk_external_project_task_project; Type: FK CONSTRAINT; Schema: project_management; Owner: postgres
--

ALTER TABLE ONLY project_management.external_project_task_list
    ADD CONSTRAINT fk_external_project_task_project FOREIGN KEY (project_id) REFERENCES project_management.external_project_details(project_id) ON DELETE CASCADE;


--
-- Name: external_project_tracking fk_external_project_tracking_project; Type: FK CONSTRAINT; Schema: project_management; Owner: postgres
--

ALTER TABLE ONLY project_management.external_project_tracking
    ADD CONSTRAINT fk_external_project_tracking_project FOREIGN KEY (project_id) REFERENCES project_management.external_project_details(project_id) ON DELETE CASCADE;


--
-- Name: external_project_tracking fk_external_project_tracking_warranty; Type: FK CONSTRAINT; Schema: project_management; Owner: postgres
--

ALTER TABLE ONLY project_management.external_project_tracking
    ADD CONSTRAINT fk_external_project_tracking_warranty FOREIGN KEY (project_warranty_id) REFERENCES project_management.external_project_warranty(project_warranty_id) ON DELETE CASCADE;


--
-- Name: external_project_warranty fk_external_project_warranty_project; Type: FK CONSTRAINT; Schema: project_management; Owner: postgres
--

ALTER TABLE ONLY project_management.external_project_warranty
    ADD CONSTRAINT fk_external_project_warranty_project FOREIGN KEY (project_id) REFERENCES project_management.external_project_details(project_id) ON DELETE CASCADE;


--
-- Name: internal_project_details fk_internal_project_details_request; Type: FK CONSTRAINT; Schema: project_management; Owner: postgres
--

ALTER TABLE ONLY project_management.internal_project_details
    ADD CONSTRAINT fk_internal_project_details_request FOREIGN KEY (project_request_id) REFERENCES project_management.internal_project_request(project_request_id) ON DELETE CASCADE;


--
-- Name: internal_project_labor fk_internal_project_labor_employee; Type: FK CONSTRAINT; Schema: project_management; Owner: postgres
--

ALTER TABLE ONLY project_management.internal_project_labor
    ADD CONSTRAINT fk_internal_project_labor_employee FOREIGN KEY (employee_id) REFERENCES human_resources.employees(employee_id) ON DELETE CASCADE;


--
-- Name: internal_project_labor fk_internal_project_labor_project; Type: FK CONSTRAINT; Schema: project_management; Owner: postgres
--

ALTER TABLE ONLY project_management.internal_project_labor
    ADD CONSTRAINT fk_internal_project_labor_project FOREIGN KEY (intrnl_project_id) REFERENCES project_management.internal_project_details(intrnl_project_id) ON DELETE CASCADE;


--
-- Name: internal_project_request fk_internal_project_request_approval; Type: FK CONSTRAINT; Schema: project_management; Owner: postgres
--

ALTER TABLE ONLY project_management.internal_project_request
    ADD CONSTRAINT fk_internal_project_request_approval FOREIGN KEY (approval_id) REFERENCES management.management_approvals(approval_id) ON DELETE CASCADE;


--
-- Name: internal_project_request fk_internal_project_request_dept; Type: FK CONSTRAINT; Schema: project_management; Owner: postgres
--

ALTER TABLE ONLY project_management.internal_project_request
    ADD CONSTRAINT fk_internal_project_request_dept FOREIGN KEY (dept_id) REFERENCES human_resources.departments(dept_id) ON DELETE CASCADE;


--
-- Name: internal_project_request fk_internal_project_request_employee; Type: FK CONSTRAINT; Schema: project_management; Owner: postgres
--

ALTER TABLE ONLY project_management.internal_project_request
    ADD CONSTRAINT fk_internal_project_request_employee FOREIGN KEY (employee_id) REFERENCES human_resources.employees(employee_id) ON DELETE CASCADE;


--
-- Name: internal_project_task_list fk_internal_project_task_list_labor; Type: FK CONSTRAINT; Schema: project_management; Owner: postgres
--

ALTER TABLE ONLY project_management.internal_project_task_list
    ADD CONSTRAINT fk_internal_project_task_list_labor FOREIGN KEY (intrnl_project_labor_id) REFERENCES project_management.internal_project_labor(intrnl_project_labor_id) ON DELETE CASCADE;


--
-- Name: internal_project_task_list fk_internal_project_task_list_project; Type: FK CONSTRAINT; Schema: project_management; Owner: postgres
--

ALTER TABLE ONLY project_management.internal_project_task_list
    ADD CONSTRAINT fk_internal_project_task_list_project FOREIGN KEY (intrnl_project_id) REFERENCES project_management.internal_project_details(intrnl_project_id) ON DELETE CASCADE;


--
-- Name: internal_project_tracking fk_internal_project_tracking_project; Type: FK CONSTRAINT; Schema: project_management; Owner: postgres
--

ALTER TABLE ONLY project_management.internal_project_tracking
    ADD CONSTRAINT fk_internal_project_tracking_project FOREIGN KEY (intrnl_project_id) REFERENCES project_management.internal_project_details(intrnl_project_id) ON DELETE CASCADE;


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
-- Name: purchase_requests fk_approval; Type: FK CONSTRAINT; Schema: purchasing; Owner: postgres
--

ALTER TABLE ONLY purchasing.purchase_requests
    ADD CONSTRAINT fk_approval FOREIGN KEY (approval_id) REFERENCES management.management_approvals(approval_id) ON DELETE CASCADE;


--
-- Name: purchase_requests fk_asset; Type: FK CONSTRAINT; Schema: purchasing; Owner: postgres
--

ALTER TABLE ONLY purchasing.purchase_requests
    ADD CONSTRAINT fk_asset FOREIGN KEY (asset_id) REFERENCES admin.assets(asset_id) ON DELETE CASCADE;


--
-- Name: purchase_requests fk_employee; Type: FK CONSTRAINT; Schema: purchasing; Owner: postgres
--

ALTER TABLE ONLY purchasing.purchase_requests
    ADD CONSTRAINT fk_employee FOREIGN KEY (employee_id) REFERENCES human_resources.employees(employee_id) ON DELETE CASCADE;


--
-- Name: batch_inspection fk_employee; Type: FK CONSTRAINT; Schema: purchasing; Owner: postgres
--

ALTER TABLE ONLY purchasing.batch_inspection
    ADD CONSTRAINT fk_employee FOREIGN KEY (employee_id) REFERENCES human_resources.employees(employee_id) ON DELETE CASCADE;


--
-- Name: credit_memo fk_inspection; Type: FK CONSTRAINT; Schema: purchasing; Owner: postgres
--

ALTER TABLE ONLY purchasing.credit_memo
    ADD CONSTRAINT fk_inspection FOREIGN KEY (inspection_id) REFERENCES purchasing.batch_inspection(inspection_id) ON DELETE CASCADE;


--
-- Name: purchase_requests fk_material; Type: FK CONSTRAINT; Schema: purchasing; Owner: postgres
--

ALTER TABLE ONLY purchasing.purchase_requests
    ADD CONSTRAINT fk_material FOREIGN KEY (material_id) REFERENCES admin.raw_materials(material_id) ON DELETE CASCADE;


--
-- Name: purchase_invoice fk_purchase; Type: FK CONSTRAINT; Schema: purchasing; Owner: postgres
--

ALTER TABLE ONLY purchasing.purchase_invoice
    ADD CONSTRAINT fk_purchase FOREIGN KEY (purchase_id) REFERENCES purchasing.purchase_order(purchase_id) ON DELETE CASCADE;


--
-- Name: received_shipments fk_purchase; Type: FK CONSTRAINT; Schema: purchasing; Owner: postgres
--

ALTER TABLE ONLY purchasing.received_shipments
    ADD CONSTRAINT fk_purchase FOREIGN KEY (purchase_id) REFERENCES purchasing.purchase_order(purchase_id) ON DELETE CASCADE;


--
-- Name: purchase_order fk_quotation; Type: FK CONSTRAINT; Schema: purchasing; Owner: postgres
--

ALTER TABLE ONLY purchasing.purchase_order
    ADD CONSTRAINT fk_quotation FOREIGN KEY (quotation_id) REFERENCES purchasing.purchase_quotation(quotation_id) ON DELETE CASCADE;


--
-- Name: purchase_quotation fk_quotation_content; Type: FK CONSTRAINT; Schema: purchasing; Owner: postgres
--

ALTER TABLE ONLY purchasing.purchase_quotation
    ADD CONSTRAINT fk_quotation_content FOREIGN KEY (quotation_content_id) REFERENCES purchasing.quotation_contents(quotation_content_id) ON DELETE CASCADE;


--
-- Name: quotation_contents fk_request; Type: FK CONSTRAINT; Schema: purchasing; Owner: postgres
--

ALTER TABLE ONLY purchasing.quotation_contents
    ADD CONSTRAINT fk_request FOREIGN KEY (request_id) REFERENCES purchasing.purchase_requests(request_id) ON DELETE CASCADE;


--
-- Name: batch_inspection fk_shipment; Type: FK CONSTRAINT; Schema: purchasing; Owner: postgres
--

ALTER TABLE ONLY purchasing.batch_inspection
    ADD CONSTRAINT fk_shipment FOREIGN KEY (shipment_id) REFERENCES purchasing.received_shipments(shipment_id) ON DELETE CASCADE;


--
-- Name: purchase_quotation fk_vendor; Type: FK CONSTRAINT; Schema: purchasing; Owner: postgres
--

ALTER TABLE ONLY purchasing.purchase_quotation
    ADD CONSTRAINT fk_vendor FOREIGN KEY (vendor_code) REFERENCES admin.vendor(vendor_code) ON DELETE CASCADE;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES sales.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES sales.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES sales.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES sales.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES sales.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES sales.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES sales.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES sales.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES sales.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: statement_item fk_additional_service_id; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.statement_item
    ADD CONSTRAINT fk_additional_service_id FOREIGN KEY (additional_service_id) REFERENCES services.additional_service(additional_service_id) ON DELETE SET NULL;


--
-- Name: blanket_agreement fk_agreement_statement; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.blanket_agreement
    ADD CONSTRAINT fk_agreement_statement FOREIGN KEY (statement_id) REFERENCES sales.statement(statement_id) ON DELETE CASCADE;


--
-- Name: campaign_contacts fk_campaign_contact_campaign; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.campaign_contacts
    ADD CONSTRAINT fk_campaign_contact_campaign FOREIGN KEY (campaign_id) REFERENCES sales.campaigns(campaign_id) ON DELETE CASCADE;


--
-- Name: campaign_contacts fk_cc_customer_id; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.campaign_contacts
    ADD CONSTRAINT fk_cc_customer_id FOREIGN KEY (customer_id) REFERENCES sales.customers(customer_id) ON DELETE CASCADE;


--
-- Name: customers fk_customer_gl_account; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.customers
    ADD CONSTRAINT fk_customer_gl_account FOREIGN KEY (gl_account_id) REFERENCES accounting.general_ledger_accounts(gl_account_id) ON DELETE CASCADE;


--
-- Name: customers fk_customer_partner; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.customers
    ADD CONSTRAINT fk_customer_partner FOREIGN KEY (partner_id) REFERENCES admin.business_partner_master(partner_id) ON DELETE CASCADE;


--
-- Name: delivery_note fk_delivery_note_goods_issue; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.delivery_note
    ADD CONSTRAINT fk_delivery_note_goods_issue FOREIGN KEY (goods_issue_id) REFERENCES distribution.goods_issue(goods_issue_id) ON DELETE SET NULL;


--
-- Name: delivery_note fk_delivery_note_order; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.delivery_note
    ADD CONSTRAINT fk_delivery_note_order FOREIGN KEY (order_id) REFERENCES sales.orders(order_id) ON DELETE CASCADE;


--
-- Name: delivery_note fk_delivery_note_rework_order; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.delivery_note
    ADD CONSTRAINT fk_delivery_note_rework_order FOREIGN KEY (rework_id) REFERENCES distribution.rework_order(rework_id) ON DELETE SET NULL;


--
-- Name: delivery_note fk_delivery_note_shipment; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.delivery_note
    ADD CONSTRAINT fk_delivery_note_shipment FOREIGN KEY (shipment_id) REFERENCES distribution.shipment_details(shipment_id) ON DELETE CASCADE;


--
-- Name: delivery_note fk_delivery_note_statement_id; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.delivery_note
    ADD CONSTRAINT fk_delivery_note_statement_id FOREIGN KEY (statement_id) REFERENCES sales.statement(statement_id) ON DELETE CASCADE;


--
-- Name: opportunities fk_opportunities_customer; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.opportunities
    ADD CONSTRAINT fk_opportunities_customer FOREIGN KEY (customer_id) REFERENCES sales.customers(customer_id) ON DELETE CASCADE;


--
-- Name: opportunities fk_opportunities_partner; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.opportunities
    ADD CONSTRAINT fk_opportunities_partner FOREIGN KEY (partner_id) REFERENCES admin.business_partner_master(partner_id) ON DELETE CASCADE;


--
-- Name: opportunities fk_opportunities_salesrep; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.opportunities
    ADD CONSTRAINT fk_opportunities_salesrep FOREIGN KEY (salesrep_id) REFERENCES human_resources.employees(employee_id) ON DELETE CASCADE;


--
-- Name: orders fk_orders_ext_project_request; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.orders
    ADD CONSTRAINT fk_orders_ext_project_request FOREIGN KEY (ext_project_request_id) REFERENCES project_management.external_project_request(ext_project_request_id) ON DELETE SET NULL;


--
-- Name: orders fk_orders_quotation; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.orders
    ADD CONSTRAINT fk_orders_quotation FOREIGN KEY (quotation_id) REFERENCES sales.quotation(quotation_id) ON DELETE SET NULL;


--
-- Name: orders fk_orders_statement; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.orders
    ADD CONSTRAINT fk_orders_statement FOREIGN KEY (statement_id) REFERENCES sales.statement(statement_id) ON DELETE CASCADE;


--
-- Name: payments fk_payments_order; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.payments
    ADD CONSTRAINT fk_payments_order FOREIGN KEY (order_id) REFERENCES sales.orders(order_id) ON DELETE CASCADE;


--
-- Name: quotation fk_quotation_agreement; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.quotation
    ADD CONSTRAINT fk_quotation_agreement FOREIGN KEY (agreement_id) REFERENCES sales.blanket_agreement(agreement_id) ON DELETE SET NULL;


--
-- Name: quotation fk_quotation_statement; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.quotation
    ADD CONSTRAINT fk_quotation_statement FOREIGN KEY (statement_id) REFERENCES sales.statement(statement_id) ON DELETE CASCADE;


--
-- Name: renewal_warranty fk_renewal_customer; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.renewal_warranty
    ADD CONSTRAINT fk_renewal_customer FOREIGN KEY (customer_id) REFERENCES sales.customers(customer_id) ON DELETE CASCADE;


--
-- Name: statement_item fk_renewal_id; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.statement_item
    ADD CONSTRAINT fk_renewal_id FOREIGN KEY (renewal_id) REFERENCES sales.renewal_warranty(renewal_id) ON DELETE SET NULL;


--
-- Name: renewal_warranty fk_renewal_order; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.renewal_warranty
    ADD CONSTRAINT fk_renewal_order FOREIGN KEY (order_id) REFERENCES sales.orders(order_id) ON DELETE CASCADE;


--
-- Name: renewal_warranty fk_renewal_payment; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.renewal_warranty
    ADD CONSTRAINT fk_renewal_payment FOREIGN KEY (payments_id) REFERENCES sales.payments(payment_id) ON DELETE CASCADE;


--
-- Name: renewal_warranty fk_renewal_product; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.renewal_warranty
    ADD CONSTRAINT fk_renewal_product FOREIGN KEY (product_id) REFERENCES admin.products(product_id) ON DELETE CASCADE;


--
-- Name: renewal_warranty fk_renewal_service_request; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.renewal_warranty
    ADD CONSTRAINT fk_renewal_service_request FOREIGN KEY (service_request_id) REFERENCES services.service_request(service_request_id) ON DELETE CASCADE;


--
-- Name: return fk_return_delivery_note_id; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.return
    ADD CONSTRAINT fk_return_delivery_note_id FOREIGN KEY (delivery_note_id) REFERENCES sales.delivery_note(delivery_note_id) ON DELETE CASCADE;


--
-- Name: return fk_return_statement_id; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.return
    ADD CONSTRAINT fk_return_statement_id FOREIGN KEY (statement_id) REFERENCES sales.statement(statement_id) ON DELETE CASCADE;


--
-- Name: sales_invoices fk_sales_invoices_order; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.sales_invoices
    ADD CONSTRAINT fk_sales_invoices_order FOREIGN KEY (delivery_note_id) REFERENCES sales.delivery_note(delivery_note_id) ON DELETE CASCADE;


--
-- Name: product_pricing fk_sales_pp_admin_product_id; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.product_pricing
    ADD CONSTRAINT fk_sales_pp_admin_product_id FOREIGN KEY (admin_product_id) REFERENCES admin.products(product_id) ON DELETE CASCADE;


--
-- Name: statement_item fk_sitem_product; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.statement_item
    ADD CONSTRAINT fk_sitem_product FOREIGN KEY (product_id) REFERENCES admin.products(product_id) ON DELETE SET NULL;


--
-- Name: statement_item fk_sitem_statement; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.statement_item
    ADD CONSTRAINT fk_sitem_statement FOREIGN KEY (statement_id) REFERENCES sales.statement(statement_id) ON DELETE CASCADE;


--
-- Name: statement fk_statement_customer; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.statement
    ADD CONSTRAINT fk_statement_customer FOREIGN KEY (customer_id) REFERENCES sales.customers(customer_id) ON DELETE CASCADE;


--
-- Name: statement fk_statement_salesrep; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.statement
    ADD CONSTRAINT fk_statement_salesrep FOREIGN KEY (salesrep_id) REFERENCES human_resources.employees(employee_id) ON DELETE CASCADE;


--
-- Name: ticket_convo fk_ticket_convo_ticket; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.ticket_convo
    ADD CONSTRAINT fk_ticket_convo_ticket FOREIGN KEY (ticket_id) REFERENCES sales.ticket(ticket_id) ON DELETE CASCADE;


--
-- Name: ticket fk_tickets_customer; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.ticket
    ADD CONSTRAINT fk_tickets_customer FOREIGN KEY (customer_id) REFERENCES sales.customers(customer_id) ON DELETE CASCADE;


--
-- Name: ticket fk_tickets_salesrep; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.ticket
    ADD CONSTRAINT fk_tickets_salesrep FOREIGN KEY (salesrep_id) REFERENCES human_resources.employees(employee_id) ON DELETE CASCADE;


--
-- Name: after_analysis_sched after_analysis_sched_analysis_fk; Type: FK CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.after_analysis_sched
    ADD CONSTRAINT after_analysis_sched_analysis_fk FOREIGN KEY (analysis_id) REFERENCES services.service_analysis(analysis_id);


--
-- Name: after_analysis_sched after_analysis_sched_technician_fk; Type: FK CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.after_analysis_sched
    ADD CONSTRAINT after_analysis_sched_technician_fk FOREIGN KEY (technician_id) REFERENCES services.technician(technician_id);


--
-- Name: delivery_order delivery_order_customer_fk; Type: FK CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.delivery_order
    ADD CONSTRAINT delivery_order_customer_fk FOREIGN KEY (customer_id) REFERENCES sales.customers(customer_id);


--
-- Name: delivery_order delivery_order_service_order_fk; Type: FK CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.delivery_order
    ADD CONSTRAINT delivery_order_service_order_fk FOREIGN KEY (service_order_id) REFERENCES services.service_order(service_order_id);


--
-- Name: additional_service_type fk_additional_service_type; Type: FK CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.additional_service_type
    ADD CONSTRAINT fk_additional_service_type FOREIGN KEY (additional_service_id) REFERENCES services.additional_service(additional_service_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: service_analysis fk_service_analysis_contract; Type: FK CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.service_analysis
    ADD CONSTRAINT fk_service_analysis_contract FOREIGN KEY (contract_id) REFERENCES services.service_contract(contract_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: service_billing fk_service_billing; Type: FK CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.service_billing
    ADD CONSTRAINT fk_service_billing FOREIGN KEY (analysis_id) REFERENCES services.service_analysis(analysis_id);


--
-- Name: service_billing fk_service_billing_ops; Type: FK CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.service_billing
    ADD CONSTRAINT fk_service_billing_ops FOREIGN KEY (operational_cost_id) REFERENCES distribution.operational_cost(operational_cost_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: service_call fk_service_call_contract; Type: FK CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.service_call
    ADD CONSTRAINT fk_service_call_contract FOREIGN KEY (contract_id) REFERENCES services.service_contract(contract_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: service_call fk_service_call_product; Type: FK CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.service_call
    ADD CONSTRAINT fk_service_call_product FOREIGN KEY (product_id) REFERENCES admin.products(product_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: service_contract fk_service_contract_additional_service; Type: FK CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.service_contract
    ADD CONSTRAINT fk_service_contract_additional_service FOREIGN KEY (additional_service_id) REFERENCES services.additional_service(additional_service_id) ON DELETE SET NULL;


--
-- Name: service_contract fk_service_contract_order; Type: FK CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.service_contract
    ADD CONSTRAINT fk_service_contract_order FOREIGN KEY (statement_item_id) REFERENCES sales.statement_item(statement_item_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: service_contract fk_service_contract_renewal; Type: FK CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.service_contract
    ADD CONSTRAINT fk_service_contract_renewal FOREIGN KEY (renewal_id) REFERENCES sales.renewal_warranty(renewal_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: service_order_item fk_service_order_item; Type: FK CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.service_order_item
    ADD CONSTRAINT fk_service_order_item FOREIGN KEY (item_id) REFERENCES inventory.inventory_product_data(item_md_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: service_report fk_service_report_renewal; Type: FK CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.service_report
    ADD CONSTRAINT fk_service_report_renewal FOREIGN KEY (renewal_id) REFERENCES sales.renewal_warranty(renewal_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: service_analysis service_analysis_customer_fk; Type: FK CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.service_analysis
    ADD CONSTRAINT service_analysis_customer_fk FOREIGN KEY (customer_id) REFERENCES sales.customers(customer_id);


--
-- Name: service_analysis service_analysis_product_fk; Type: FK CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.service_analysis
    ADD CONSTRAINT service_analysis_product_fk FOREIGN KEY (product_id) REFERENCES admin.products(product_id);


--
-- Name: service_analysis service_analysis_service_request_fk; Type: FK CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.service_analysis
    ADD CONSTRAINT service_analysis_service_request_fk FOREIGN KEY (service_request_id) REFERENCES services.service_request(service_request_id);


--
-- Name: service_analysis service_analysis_technician_fk; Type: FK CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.service_analysis
    ADD CONSTRAINT service_analysis_technician_fk FOREIGN KEY (technician_id) REFERENCES services.technician(technician_id);


--
-- Name: service_billing service_billing_service_order_fk; Type: FK CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.service_billing
    ADD CONSTRAINT service_billing_service_order_fk FOREIGN KEY (service_order_id) REFERENCES services.service_order(service_order_id);


--
-- Name: service_billing service_billing_service_request_fk; Type: FK CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.service_billing
    ADD CONSTRAINT service_billing_service_request_fk FOREIGN KEY (service_request_id) REFERENCES services.service_request(service_request_id);


--
-- Name: service_call service_call_customer_fk; Type: FK CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.service_call
    ADD CONSTRAINT service_call_customer_fk FOREIGN KEY (customer_id) REFERENCES sales.customers(customer_id);


--
-- Name: service_call service_call_technician_fk; Type: FK CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.service_call
    ADD CONSTRAINT service_call_technician_fk FOREIGN KEY (technician_id) REFERENCES services.technician(technician_id);


--
-- Name: service_contract service_contract_customer_fk; Type: FK CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.service_contract
    ADD CONSTRAINT service_contract_customer_fk FOREIGN KEY (customer_id) REFERENCES sales.customers(customer_id);


--
-- Name: service_contract service_contract_product_fk; Type: FK CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.service_contract
    ADD CONSTRAINT service_contract_product_fk FOREIGN KEY (product_id) REFERENCES admin.products(product_id);


--
-- Name: service_order service_order_analysis_fk; Type: FK CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.service_order
    ADD CONSTRAINT service_order_analysis_fk FOREIGN KEY (analysis_id) REFERENCES services.service_analysis(analysis_id);


--
-- Name: service_order service_order_customer_fk; Type: FK CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.service_order
    ADD CONSTRAINT service_order_customer_fk FOREIGN KEY (customer_id) REFERENCES sales.customers(customer_id);


--
-- Name: service_order_item service_order_item_order_fk; Type: FK CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.service_order_item
    ADD CONSTRAINT service_order_item_order_fk FOREIGN KEY (service_order_id) REFERENCES services.service_order(service_order_id) ON DELETE CASCADE;


--
-- Name: service_order_item service_order_item_principal_fk; Type: FK CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.service_order_item
    ADD CONSTRAINT service_order_item_principal_fk FOREIGN KEY (principal_item_id) REFERENCES mrp.principal_items(principal_item_id);


--
-- Name: service_report service_report_service_billing_fk; Type: FK CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.service_report
    ADD CONSTRAINT service_report_service_billing_fk FOREIGN KEY (service_billing_id) REFERENCES services.service_billing(service_billing_id);


--
-- Name: service_report service_report_service_call_fk; Type: FK CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.service_report
    ADD CONSTRAINT service_report_service_call_fk FOREIGN KEY (service_call_id) REFERENCES services.service_call(service_call_id);


--
-- Name: service_report service_report_service_ticket_fk; Type: FK CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.service_report
    ADD CONSTRAINT service_report_service_ticket_fk FOREIGN KEY (service_ticket_id) REFERENCES sales.ticket(ticket_id);


--
-- Name: service_report service_report_technician_fk; Type: FK CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.service_report
    ADD CONSTRAINT service_report_technician_fk FOREIGN KEY (technician_id) REFERENCES services.technician(technician_id);


--
-- Name: service_request service_request_customer_fk; Type: FK CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.service_request
    ADD CONSTRAINT service_request_customer_fk FOREIGN KEY (customer_id) REFERENCES sales.customers(customer_id);


--
-- Name: service_request service_request_service_call_fk; Type: FK CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.service_request
    ADD CONSTRAINT service_request_service_call_fk FOREIGN KEY (service_call_id) REFERENCES services.service_call(service_call_id);


--
-- Name: service_request service_request_technician_fk; Type: FK CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.service_request
    ADD CONSTRAINT service_request_technician_fk FOREIGN KEY (technician_id) REFERENCES services.technician(technician_id);


--
-- Name: service_call service_ticket_fk; Type: FK CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.service_call
    ADD CONSTRAINT service_ticket_fk FOREIGN KEY (service_ticket_id) REFERENCES sales.ticket(ticket_id);


--
-- Name: technician technician_fk; Type: FK CONSTRAINT; Schema: services; Owner: postgres
--

ALTER TABLE ONLY services.technician
    ADD CONSTRAINT technician_fk FOREIGN KEY (employee_id) REFERENCES human_resources.employees(employee_id);


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
-- Name: TABLE official_receipts; Type: ACL; Schema: accounting; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE accounting.official_receipts TO erp_user;


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
-- Name: TABLE currency; Type: ACL; Schema: admin; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE admin.currency TO erp_user;


--
-- Name: TABLE item_master_data; Type: ACL; Schema: admin; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE admin.item_master_data TO erp_user;


--
-- Name: TABLE notifications; Type: ACL; Schema: admin; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE admin.notifications TO erp_user;


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
-- Name: TABLE view_customer_users; Type: ACL; Schema: admin; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE admin.view_customer_users TO erp_user;


--
-- Name: TABLE view_employee_users; Type: ACL; Schema: admin; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE admin.view_employee_users TO erp_user;


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
-- Name: TABLE inventory_product_data; Type: ACL; Schema: inventory; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE inventory.inventory_product_data TO erp_user;


--
-- Name: TABLE warehouse_movement; Type: ACL; Schema: inventory; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE inventory.warehouse_movement TO erp_user;


--
-- Name: TABLE management_approvals; Type: ACL; Schema: management; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE management.management_approvals TO erp_user;


--
-- Name: TABLE bill_of_materials; Type: ACL; Schema: mrp; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE mrp.bill_of_materials TO erp_user;


--
-- Name: TABLE non_project_order_pricing; Type: ACL; Schema: mrp; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE mrp.non_project_order_pricing TO erp_user;


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
-- Name: TABLE report_monitoring; Type: ACL; Schema: project_management; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE project_management.report_monitoring TO erp_user;


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
-- Name: TABLE auth_group; Type: ACL; Schema: sales; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE sales.auth_group TO erp_user;


--
-- Name: TABLE auth_group_permissions; Type: ACL; Schema: sales; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE sales.auth_group_permissions TO erp_user;


--
-- Name: TABLE auth_permission; Type: ACL; Schema: sales; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE sales.auth_permission TO erp_user;


--
-- Name: TABLE auth_user; Type: ACL; Schema: sales; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE sales.auth_user TO erp_user;


--
-- Name: TABLE auth_user_groups; Type: ACL; Schema: sales; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE sales.auth_user_groups TO erp_user;


--
-- Name: TABLE auth_user_user_permissions; Type: ACL; Schema: sales; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE sales.auth_user_user_permissions TO erp_user;


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
-- Name: TABLE campaign_status_view; Type: ACL; Schema: sales; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE sales.campaign_status_view TO erp_user;


--
-- Name: TABLE credit_memo; Type: ACL; Schema: sales; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE sales.credit_memo TO erp_user;


--
-- Name: TABLE customers; Type: ACL; Schema: sales; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE sales.customers TO erp_user;


--
-- Name: TABLE delivery_note; Type: ACL; Schema: sales; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE sales.delivery_note TO erp_user;


--
-- Name: TABLE django_admin_log; Type: ACL; Schema: sales; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE sales.django_admin_log TO erp_user;


--
-- Name: TABLE django_content_type; Type: ACL; Schema: sales; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE sales.django_content_type TO erp_user;


--
-- Name: TABLE django_migrations; Type: ACL; Schema: sales; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE sales.django_migrations TO erp_user;


--
-- Name: TABLE django_session; Type: ACL; Schema: sales; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE sales.django_session TO erp_user;


--
-- Name: TABLE opportunities; Type: ACL; Schema: sales; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE sales.opportunities TO erp_user;


--
-- Name: TABLE orders; Type: ACL; Schema: sales; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE sales.orders TO erp_user;


--
-- Name: TABLE statement_item; Type: ACL; Schema: sales; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE sales.statement_item TO erp_user;


--
-- Name: TABLE order_view; Type: ACL; Schema: sales; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE sales.order_view TO erp_user;


--
-- Name: TABLE payments; Type: ACL; Schema: sales; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE sales.payments TO erp_user;


--
-- Name: TABLE product_pricing; Type: ACL; Schema: sales; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE sales.product_pricing TO erp_user;


--
-- Name: TABLE quotation; Type: ACL; Schema: sales; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE sales.quotation TO erp_user;


--
-- Name: TABLE quotation_view; Type: ACL; Schema: sales; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE sales.quotation_view TO erp_user;


--
-- Name: TABLE renewal_warranty; Type: ACL; Schema: sales; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE sales.renewal_warranty TO erp_user;


--
-- Name: TABLE return; Type: ACL; Schema: sales; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE sales.return TO erp_user;


--
-- Name: TABLE sales_invoices; Type: ACL; Schema: sales; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE sales.sales_invoices TO erp_user;


--
-- Name: TABLE sales_invoices_view; Type: ACL; Schema: sales; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE sales.sales_invoices_view TO erp_user;


--
-- Name: TABLE statement; Type: ACL; Schema: sales; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE sales.statement TO erp_user;


--
-- Name: TABLE ticket; Type: ACL; Schema: sales; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE sales.ticket TO erp_user;


--
-- Name: TABLE ticket_convo; Type: ACL; Schema: sales; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE sales.ticket_convo TO erp_user;


--
-- Name: TABLE additional_service; Type: ACL; Schema: services; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE services.additional_service TO erp_user;


--
-- Name: TABLE additional_service_type; Type: ACL; Schema: services; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE services.additional_service_type TO erp_user;


--
-- Name: TABLE after_analysis_sched; Type: ACL; Schema: services; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE services.after_analysis_sched TO erp_user;


--
-- Name: TABLE delivery_order; Type: ACL; Schema: services; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE services.delivery_order TO erp_user;


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
-- Name: TABLE service_contract; Type: ACL; Schema: services; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE services.service_contract TO erp_user;


--
-- Name: TABLE service_order; Type: ACL; Schema: services; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE services.service_order TO erp_user;


--
-- Name: TABLE service_order_item; Type: ACL; Schema: services; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE services.service_order_item TO erp_user;


--
-- Name: TABLE service_report; Type: ACL; Schema: services; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE services.service_report TO erp_user;


--
-- Name: TABLE service_request; Type: ACL; Schema: services; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE services.service_request TO erp_user;


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


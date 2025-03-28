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
-- Name: management_approval_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.management_approval_status AS ENUM (
    'approved',
    'pending',
    'rejected'
);


ALTER TYPE public.management_approval_status OWNER TO postgres;

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
    module_prefix TEXT := 'BR'; 
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
	WHEN NEW.demand_level = 'Very High' THEN 100.00
	WHEN NEW.demand_level = 'High' THEN 80.00
	WHEN NEW.demand_level = 'Medium' THEN 60.00
	WHEN NEW.demand_level = 'Low' THEN 20.00
	ELSE 20.00
	END;
    END IF;
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.calculate_product_pricing() OWNER TO postgres;

--
-- Name: calculate_statement_item_total_price(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.calculate_statement_item_total_price() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    markup_percentage DECIMAL(5,2);
BEGIN
    -- Determine markup percentage based on demand level
    CASE NEW.demand_level
        WHEN 'Low' THEN
            markup_percentage := 20.00;
        WHEN 'Medium' THEN
            markup_percentage := 40.00;
        WHEN 'High' THEN
            markup_percentage := 60.00;
        WHEN 'Very High' THEN
            markup_percentage := 80.00;
        WHEN 'Seasonal' THEN
            markup_percentage := 90.00;
        ELSE
            markup_percentage := 0.00;
    END CASE;
    
    -- Calculate total price
    NEW.total_price := (NEW.unit_price + (NEW.unit_price * markup_percentage / 100)) * NEW.quantity;
    
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.calculate_statement_item_total_price() OWNER TO postgres;

--
-- Name: create_business_partner(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.create_business_partner() RETURNS trigger
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


ALTER FUNCTION public.create_business_partner() OWNER TO postgres;

--
-- Name: create_gl_account(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.create_gl_account() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    new_gl_account_id VARCHAR (255);
BEGIN
    INSERT INTO accounting.general_ledger_accounts (account_id, account_name, account_code, status)
    VALUES (NEW.customer_id, NEW.name, NEW.customer_id,'Active')
    RETURNING gl_account_id INTO new_gl_account_id;
    UPDATE sales.customers SET gl_account_id = new_gl_account_id WHERE customer_id = NEW.customer_id;
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.create_gl_account() OWNER TO postgres;

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
-- Name: generate_sales_invoice(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.generate_sales_invoice() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF NEW.payment_status = 'Completed' THEN
	UPDATE sales.orders
	SET order_status ='Processed'
	WHERE order_id = NEW.order_id;

        INSERT INTO sales.sales_invoices (invoice_id, order_id, invoice_date, total_amount, invoice_status, payment_status, due_date)
        VALUES (NEW.payment_id, NEW.order_id, NOW(), 
                (SELECT order_total_amount FROM sales.orders WHERE order_id = NEW.order_id), 
                'Paid', 'Completed', NOW());
    END IF;
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.generate_sales_invoice() OWNER TO postgres;

--
-- Name: insert_order_based_on_type(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.insert_order_based_on_type() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    order_type quotation_type_enum; 
BEGIN
    -- Retrieve the quotation type directly
    SELECT s.type INTO order_type
    FROM sales.statement s
    JOIN sales.orders o ON s.statement_id = o.statement_id
    WHERE o.order_id = NEW.order_id;

    -- Insert into the correct table based on quotation type
    IF order_type = 'Non-Project-Based' THEN
        INSERT INTO mrp.non_project_order_pricing (non_project_costing_id, order_id, product_id, quantity, mrp_base_price, final_price)
        VALUES (NEW.order_id, NEW.order_id, NULL, 0, 0.00, 0.00);
    
    ELSIF order_type = 'Project-Based' THEN
        INSERT INTO project_management.external_project_request (ext_project_request_id, ext_project_name, ext_project_description, approval_id, item_id)
        VALUES (NEW.order_id, 'Project for Order ' || NEW.order_id, 'Automatically generated project request', NULL, NEW.order_id);
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
        WHERE sale_date >= NOW() - INTERVAL '60 days'
        GROUP BY product_id
    ),
    total_sales AS (
        SELECT product_id, SUM(quantity) AS total_quantity
        FROM sales.statement_item
        GROUP BY product_id
    )
    UPDATE sales.product_pricing pp
    SET demand_level = CASE
        WHEN dr.demand_rank <= 1 THEN 'Very High'
        WHEN dr.demand_rank <= 3 THEN 'High'
        WHEN dr.demand_rank BETWEEN 4 AND 7 THEN 'Medium'
        WHEN dr.demand_rank BETWEEN 8 AND 10 THEN 'Low'
        WHEN rs.recent_quantity >= 0.9 * ts.total_quantity THEN 'Seasonal'
        ELSE 'Unknown'
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
-- Name: update_order_delivery_status(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.update_order_delivery_status() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	IF NEW.goods_issue_id IS NOT NULL AND OLD.order_status <> 'Delivered' AND OLD.goods_issue_id IS NULL THEN
		UPDATE sales.orders SET order_status = 'Delivered' WHERE order_id = NEW.order_id;
		IF EXISTS (SELECT 1 FROM sales.shipping_details WHERE order_id = NEW.order_id) THEN
			UPDATE sales.shipping_details SET delivery_status = 'Delivered' 
			WHERE order_id = NEW.order_id;
		END IF;
	END IF;
	IF NEW.rework_id IS NOT NULL AND OLD.rework_id IS NOT NULL THEN
		UPDATE sales.orders SET order_status = 'Cancelled' WHERE order_id = NEW.order_id;
		IF EXISTS (SELECT 1 FROM sales.shipping_details WHERE order_id = NEW.order_id) THEN
			UPDATE sales.shipping_details SET delivery_status = 'Returned' 
			WHERE order_id = NEW.order_id;
		END IF;
	END IF;
	RETURN NEW;
END;
$$;


ALTER FUNCTION public.update_order_delivery_status() OWNER TO postgres;

--
-- Name: update_order_invoice_status(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.update_order_invoice_status() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE sales.orders SET order_status = 'Delivered'
    WHERE order_id = NEW.order_id AND EXISTS (
        SELECT 1 FROM sales.shipping_details WHERE order_id = NEW.order_id AND delivery_status = 'Delivered'
    );
    
    UPDATE sales.sales_invoices SET invoice_status = 'Paid'
    WHERE order_id = NEW.order_id AND EXISTS (
        SELECT 1 FROM sales.payments WHERE order_id = NEW.order_id AND payment_status = 'Completed'
    );
    
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.update_order_invoice_status() OWNER TO postgres;

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
-- Name: generate_service_ticket_id(); Type: FUNCTION; Schema: services; Owner: postgres
--

CREATE FUNCTION services.generate_service_ticket_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    unique_code TEXT;
    module_prefix TEXT := 'TICKET';
    module_name TEXT := 'SERVICES';          
BEGIN
    unique_code := substr(md5(random()::text), 1, 6);
    NEW.service_ticket_id := module_name || '-' || module_prefix || '-' || to_char(CURRENT_DATE, 'YYYY') || '-' || unique_code;
    RETURN NEW;
END;
$$;


ALTER FUNCTION services.generate_service_ticket_id() OWNER TO postgres;

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
    account_code character varying(255) NOT NULL,
    account_id character varying(255),
    status public.status_enum,
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
    invoice_id character varying(255) DEFAULT NULL::character varying,
    customer_id character varying(255) DEFAULT NULL::character varying,
    or_date date NOT NULL,
    settled_amount numeric(15,2) NOT NULL,
    remaining_amount numeric(15,2) NOT NULL,
    payment_method character varying(50) NOT NULL,
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
    vendor_code character varying(255),
    customer_id character varying(255),
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
    item_type public.item_type DEFAULT 'Product'::public.item_type,
    asset_id character varying(255),
    product_id character varying(255),
    material_id character varying(255)
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
    application_reference character varying(255),
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
    carrier_name character varying(255) NOT NULL,
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
    delivery_receipt_id character varying(255) NOT NULL,
    delivery_date date,
    received_by character varying(255),
    signature text NOT NULL,
    receipt_status public.receipt_status_type,
    shipment_id character varying(255)
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
    request_date date,
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
    total_packing_cost numeric(10,2) NOT NULL
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
    failed_shipment_id character varying(255)
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
    failed_shipment_id character varying(255),
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
    downpayments numeric(12,2),
    approval_status character varying(10) NOT NULL,
    CONSTRAINT budget_approvals_approval_status_check CHECK (((approval_status)::text = ANY (ARRAY[('Approved'::character varying)::text, ('Pending'::character varying)::text])))
);


ALTER TABLE finance.budget_approvals OWNER TO postgres;

--
-- Name: budget_validations; Type: TABLE; Schema: finance; Owner: postgres
--

CREATE TABLE finance.budget_validations (
    validation_id character varying(255) NOT NULL,
    dept_id character varying(255),
    validation_date date NOT NULL,
    validated_by character varying(255),
    validation_status character varying(10) NOT NULL,
    remarks character varying(20) NOT NULL,
    amount_requested numeric(12,2) NOT NULL,
    final_approved_amount numeric(12,2),
    CONSTRAINT budget_validations_remarks_check CHECK (((remarks)::text = ANY (ARRAY[('Approved'::character varying)::text, ('Awaiting Validation'::character varying)::text]))),
    CONSTRAINT budget_validations_validation_status_check CHECK (((validation_status)::text = ANY (ARRAY[('Approved'::character varying)::text, ('Pending'::character varying)::text])))
);


ALTER TABLE finance.budget_validations OWNER TO postgres;

--
-- Name: attendance_tracking; Type: TABLE; Schema: human_resources; Owner: postgres
--

CREATE TABLE human_resources.attendance_tracking (
    attendance_id character varying(255) NOT NULL,
    employee_id character varying(255),
    time_in timestamp without time zone NOT NULL,
    time_out timestamp without time zone NOT NULL,
    work_hours numeric(5,2) GENERATED ALWAYS AS ((EXTRACT(epoch FROM (time_out - time_in)) / (3600)::numeric)) STORED,
    status character varying(20) DEFAULT 'Present'::character varying NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT attendance_tracking_status_check CHECK (((status)::text = ANY (ARRAY[('Present'::character varying)::text, ('Late'::character varying)::text, ('Absent'::character varying)::text, ('Half-Day'::character varying)::text, ('On Leave'::character varying)::text])))
);


ALTER TABLE human_resources.attendance_tracking OWNER TO postgres;

--
-- Name: candidates; Type: TABLE; Schema: human_resources; Owner: postgres
--

CREATE TABLE human_resources.candidates (
    candidate_id character varying(255) NOT NULL,
    job_id character varying(255),
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    phone character varying(20),
    resume text,
    employment_type character varying(20) NOT NULL,
    contract_duration smallint,
    status character varying(20) DEFAULT 'Applied'::character varying,
    date_applied timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT candidates_employment_type_check CHECK (((employment_type)::text = ANY (ARRAY[('Permanent'::character varying)::text, ('Contractual'::character varying)::text]))),
    CONSTRAINT candidates_status_check CHECK (((status)::text = ANY (ARRAY[('Applied'::character varying)::text, ('Interview Scheduled'::character varying)::text, ('Hired'::character varying)::text, ('Rejected'::character varying)::text])))
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
    rating integer NOT NULL,
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
    CONSTRAINT employee_salary_contract_pay_type_check CHECK (((contract_pay_type)::text = ANY (ARRAY[('Hourly'::character varying)::text, ('Daily'::character varying)::text])))
);


ALTER TABLE human_resources.employee_salary OWNER TO postgres;

--
-- Name: employees; Type: TABLE; Schema: human_resources; Owner: postgres
--

CREATE TABLE human_resources.employees (
    employee_id character varying(255) NOT NULL,
    dept_id character varying(255),
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    phone character varying(20),
    job_title character varying(100),
    employment_type character varying(20) NOT NULL,
    status character varying(20) DEFAULT 'Active'::character varying NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT employees_employment_type_check CHECK (((employment_type)::text = ANY (ARRAY[('Permanent'::character varying)::text, ('Contractual'::character varying)::text]))),
    CONSTRAINT employees_status_check CHECK (((status)::text = ANY (ARRAY[('Active'::character varying)::text, ('Inactive'::character varying)::text, ('Terminated'::character varying)::text])))
);


ALTER TABLE human_resources.employees OWNER TO postgres;

--
-- Name: interviews; Type: TABLE; Schema: human_resources; Owner: postgres
--

CREATE TABLE human_resources.interviews (
    interview_id character varying(255) NOT NULL,
    candidate_id character varying(255),
    interviewer_id character varying(255),
    interview_date timestamp without time zone NOT NULL,
    status character varying(20) DEFAULT 'Scheduled'::character varying,
    feedback text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT interviews_status_check CHECK (((status)::text = ANY (ARRAY[('Scheduled'::character varying)::text, ('Completed'::character varying)::text, ('Canceled'::character varying)::text])))
);


ALTER TABLE human_resources.interviews OWNER TO postgres;

--
-- Name: job_posting; Type: TABLE; Schema: human_resources; Owner: postgres
--

CREATE TABLE human_resources.job_posting (
    job_id character varying(255) NOT NULL,
    request_id character varying(255),
    dept_id character varying(255),
    "position" character varying(100) NOT NULL,
    description text NOT NULL,
    requirements text NOT NULL,
    employment_type character varying(20) NOT NULL,
    contract_duration smallint,
    contract_rate numeric(10,2),
    contract_pay_type character varying(20),
    status character varying(20) DEFAULT 'Open'::character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT job_posting_contract_duration_check CHECK ((contract_duration >= 1)),
    CONSTRAINT job_posting_contract_pay_type_check CHECK (((contract_pay_type)::text = ANY (ARRAY[('Hourly'::character varying)::text, ('Daily'::character varying)::text, ('Fixed'::character varying)::text]))),
    CONSTRAINT job_posting_employment_type_check CHECK (((employment_type)::text = ANY (ARRAY[('Permanent'::character varying)::text, ('Contractual'::character varying)::text]))),
    CONSTRAINT job_posting_status_check CHECK (((status)::text = ANY (ARRAY[('Open'::character varying)::text, ('Closed'::character varying)::text])))
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
    start_date date NOT NULL,
    end_date date NOT NULL,
    total_days integer GENERATED ALWAYS AS (((end_date - start_date) + 1)) STORED,
    is_paid boolean DEFAULT true,
    status character varying(50) DEFAULT 'Pending'::character varying,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT leave_requests_leave_type_check CHECK (((leave_type)::text = ANY (ARRAY[('Sick'::character varying)::text, ('Vacation'::character varying)::text, ('Personal'::character varying)::text, ('Maternity'::character varying)::text, ('Paternity'::character varying)::text, ('Unpaid'::character varying)::text]))),
    CONSTRAINT leave_requests_status_check CHECK (((status)::text = ANY (ARRAY[('Pending'::character varying)::text, ('Approved by Superior'::character varying)::text, ('Rejected by Superior'::character varying)::text, ('Approved by Management'::character varying)::text, ('Rejected by Management'::character varying)::text, ('Recorded in HRIS'::character varying)::text])))
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
    CONSTRAINT payroll_contract_pay_type_check CHECK (((contract_pay_type)::text = ANY (ARRAY[('Hourly'::character varying)::text, ('Daily'::character varying)::text, ('Fixed'::character varying)::text]))),
    CONSTRAINT payroll_employment_type_check CHECK (((employment_type)::text = ANY (ARRAY[('Permanent'::character varying)::text, ('Contractual'::character varying)::text]))),
    CONSTRAINT payroll_payment_status_check CHECK (((payment_status)::text = ANY (ARRAY[('Pending'::character varying)::text, ('Processed'::character varying)::text, ('Paid'::character varying)::text])))
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
    reason text NOT NULL,
    approval_status character varying(20) DEFAULT 'Pending'::character varying,
    status character varying(20) DEFAULT 'Active'::character varying,
    start_date date NOT NULL,
    end_date date,
    approval_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT workforce_allocation_approval_status_check CHECK (((approval_status)::text = ANY (ARRAY[('Pending'::character varying)::text, ('Approved'::character varying)::text, ('Rejected'::character varying)::text]))),
    CONSTRAINT workforce_allocation_status_check CHECK (((status)::text = ANY (ARRAY[('Active'::character varying)::text, ('Completed'::character varying)::text, ('Canceled'::character varying)::text])))
);


ALTER TABLE human_resources.workforce_allocation OWNER TO postgres;

--
-- Name: deprecation_report; Type: TABLE; Schema: inventory; Owner: postgres
--

CREATE TABLE inventory.deprecation_report (
    deprecation_report_id character varying(255) NOT NULL,
    item_id character varying(255),
    content_id character varying(255),
    quantity integer NOT NULL,
    reported_date timestamp without time zone NOT NULL,
    status public.inventory_status_enum NOT NULL,
    warehouse_id character varying(255),
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
    item_md_id character varying(255),
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
    content_id character varying(255),
    expiry_date date NOT NULL,
    unit_cost numeric(10,3) NOT NULL,
    unit_of_measure character varying(25) NOT NULL,
    item_status public.item_status_enum NOT NULL,
    warehouse_id character varying(255)
);


ALTER TABLE inventory.inventory_item OWNER TO postgres;

--
-- Name: inventory_item_master_data; Type: TABLE; Schema: inventory; Owner: postgres
--

CREATE TABLE inventory.inventory_item_master_data (
    item_md_id character varying(255) NOT NULL,
    item_id character varying(255),
    content_id character varying(255),
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
    checked_id character varying(255),
    decision_date date NOT NULL,
    issue_date date NOT NULL,
    checked_by character varying(255),
    checked_date date NOT NULL,
    status public.management_approval_status NOT NULL,
    due_date date NOT NULL,
    remarks text
);


ALTER TABLE management.management_approvals OWNER TO postgres;

--
-- Name: bill_of_materials; Type: TABLE; Schema: mrp; Owner: postgres
--

CREATE TABLE mrp.bill_of_materials (
    bom_id character varying(255) NOT NULL,
    product_id character varying(255),
    material_id character varying(255),
    product_description text NOT NULL,
    unit_of_measure character varying(255) NOT NULL,
    specific_notes text,
    quantity_of_unit integer NOT NULL,
    cost_per_raw_material numeric(10,2) NOT NULL,
    total_cost_of_raw_materials numeric(10,2) NOT NULL
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
    mrp_base_price numeric(10,2) NOT NULL,
    final_price numeric(10,2) NOT NULL
);


ALTER TABLE mrp.non_project_order_pricing OWNER TO postgres;

--
-- Name: overall_production; Type: TABLE; Schema: mrp; Owner: postgres
--

CREATE TABLE mrp.overall_production (
    cost_id character varying(255) NOT NULL,
    production_order_detail_id character varying(255),
    product_id character varying(255),
    bom_id character varying(255),
    cost_of_raw_materials numeric(10,2) NOT NULL,
    labor_cost numeric(10,2) NOT NULL,
    total_mrp_cost numeric(10,2) NOT NULL
);


ALTER TABLE mrp.overall_production OWNER TO postgres;

--
-- Name: principal_items; Type: TABLE; Schema: mrp; Owner: postgres
--

CREATE TABLE mrp.principal_items (
    principal_item_id character varying(255) NOT NULL,
    service_request_id character varying(255),
    service_order_id character varying(255),
    quantity integer NOT NULL,
    item_id character varying(255),
    unit_price numeric(10,2) NOT NULL,
    markup_price numeric(10,2) NOT NULL,
    pricing_date date NOT NULL
);


ALTER TABLE mrp.principal_items OWNER TO postgres;

--
-- Name: document_header; Type: TABLE; Schema: operations; Owner: postgres
--

CREATE TABLE operations.document_header (
    document_id character varying(255) NOT NULL,
    document_type public.document_type_enum NOT NULL,
    vendor_code character varying(255),
    document_no integer NOT NULL,
    transaction_id character varying(255) NOT NULL,
    status public.operations_status_enum NOT NULL,
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
    asset_id character varying(255),
    document_id character varying(255),
    material_id character varying(255),
    serial_id character varying(255),
    productdocu_id character varying(255),
    external_id character varying(255),
    quantity integer DEFAULT 0 NOT NULL,
    total numeric(18,2) NOT NULL,
    batch_no character varying(100) NOT NULL,
    warehouse_loc character varying(255) NOT NULL,
    delivery_request_id character varying(255),
    request_date date,
    delivery_type public.request_type,
    receiving_module public.receiving_module_enum,
    cost numeric(18,2),
    status public.approval_status_type DEFAULT 'Pending'::public.approval_status_type
);


ALTER TABLE operations.document_items OWNER TO postgres;

--
-- Name: external_module; Type: TABLE; Schema: operations; Owner: postgres
--

CREATE TABLE operations.external_module (
    external_id character varying(255) NOT NULL,
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
    uom public.unit_of_measure,
    serial_id character varying(255)
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
    content_id character varying(255)
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
    cost_id character varying(255),
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
    ext_project_name character varying(50) NOT NULL,
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
    name character varying(255),
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
    contact_person character varying(255),
    CONSTRAINT customers_debt_check CHECK ((debt >= (0)::numeric))
);


ALTER TABLE sales.customers OWNER TO postgres;

--
-- Name: leads; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.leads (
    lead_id character varying(255) NOT NULL,
    salesrep_id character varying(255),
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
    customer_id character varying(255),
    partner_id character varying(255),
    salesrep_id character varying(255),
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
    statement_id character varying(255),
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
    order_id character varying(255),
    payment_method public.payment_method_enum,
    payment_status public.payment_status_enum DEFAULT 'Pending'::public.payment_status_enum,
    payment_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE sales.payments OWNER TO postgres;

--
-- Name: product_pricing; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.product_pricing (
    product_id character varying(255),
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
    date_issued timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    status public.quotation_status_enum
);


ALTER TABLE sales.quotation OWNER TO postgres;

--
-- Name: receipt; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.receipt (
    receipt_id character varying(255) NOT NULL,
    shipping_id character varying(255),
    customer_id character varying(255),
    payments_id character varying(255),
    policy_id character varying(255),
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
    shipping_id character varying(255),
    return_date timestamp without time zone,
    status public.return_status,
    remarks text
);


ALTER TABLE sales.return OWNER TO postgres;

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
    order_id character varying(255),
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
    order_id character varying(255),
    operational_cost_id character varying(255),
    shipment_id character varying(255),
    shipping_method public.shipping_method_enum,
    tracking_num character varying(50),
    shipping_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    estimated_delivery timestamp without time zone,
    delivery_status public.delivery_status_enum,
    statement_id character varying(255),
    delivery_date timestamp without time zone
);


ALTER TABLE sales.shipping_details OWNER TO postgres;

--
-- Name: statement; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.statement (
    statement_id character varying(255) NOT NULL,
    customer_id character varying(255),
    salesrep_id character varying(255),
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
    statement_id character varying(255),
    sales_costing_id character varying(255),
    product_id character varying(255),
    item_md_id character varying(255),
    quantity integer,
    unit_price numeric(10,2),
    total_price numeric(10,2),
    discount numeric(10,2),
    tax_amount integer DEFAULT 0,
    return_reason text,
    return_action public.return_action,
    CONSTRAINT statement_item_discount_check CHECK ((discount >= (0)::numeric))
);


ALTER TABLE sales.statement_item OWNER TO postgres;

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
    service_order_item_id character varying(255),
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
    service_order_item_id character varying(255),
    analysis_id character varying(255),
    service_request_id character varying(255),
    charge_type text NOT NULL,
    item_name character varying(255),
    service_billing_amount numeric(10,2),
    outsource_fee numeric(10,2) DEFAULT 0.00,
    order_item_price numeric(10,2) DEFAULT 0.00,
    total_payable numeric(10,2) DEFAULT 0.00,
    date_paid date,
    CONSTRAINT service_billing_charge_type_check CHECK ((charge_type = ANY (ARRAY['Labor'::text, 'Parts'::text, 'Other'::text]))),
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
    contract_no character varying(255),
    end_date date,
    priority_level text NOT NULL,
    resolution text,
    CONSTRAINT service_call_call_status_check CHECK ((call_status = ANY (ARRAY['Open'::text, 'Closed'::text, 'In Progress'::text]))),
    CONSTRAINT service_call_call_type_check CHECK ((call_type = ANY (ARRAY['Inquiry'::text, 'Request'::text, 'Other'::text]))),
    CONSTRAINT service_call_priority_level_check CHECK ((priority_level = ANY (ARRAY['Low'::text, 'Medium'::text, 'High'::text])))
);


ALTER TABLE services.service_call OWNER TO postgres;

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
    principal_item_id character varying(255),
    item_name character varying(255),
    item_quantity integer DEFAULT 1,
    item_price numeric(10,2),
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
    CONSTRAINT service_request_request_type_check CHECK ((request_type = ANY (ARRAY['Repair'::text, 'Installation'::text, 'Maintenance'::text, 'Other'::text])))
);


ALTER TABLE services.service_request OWNER TO postgres;

--
-- Name: service_ticket; Type: TABLE; Schema: services; Owner: postgres
--

CREATE TABLE services.service_ticket (
    service_ticket_id character varying(255) NOT NULL,
    ticket_id character varying(255)
);


ALTER TABLE services.service_ticket OWNER TO postgres;

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
-- Data for Name: currency; Type: TABLE DATA; Schema: accounting; Owner: postgres
--

COPY accounting.currency (currency_id, currency_name, exchange_rate, is_active) FROM stdin;
ACC-CUR-2025-X1Y2Z3	Philippine Peso	1.000000	t
ACC-CUR-2025-A4B5C6	US Dollar	0.017500	t
ACC-CUR-2025-D7E8F9	Euro	0.016260	t
ACC-CUR-2025-G1H2I3	British Pound	0.013930	t
ACC-CUR-2025-J4K5L6	Japanese Yen	0.002650	t
ACC-CUR-2025-M7N8O9	Canadian Dollar	0.023940	t
ACC-CUR-2025-P1Q2R3	Australian Dollar	0.026380	t
ACC-CUR-2025-S4T5U6	Swiss Franc	0.015570	t
ACC-CUR-2025-V7W8X9	Chinese Yuan	0.127400	t
ACC-CUR-2025-Y1Z2A3	Hong Kong Dollar	0.128500	t
ACC-CUR-2025-B4C5D6	Singapore Dollar	0.023740	t
ACC-CUR-2025-E7F8G9	South Korean Won	0.000750	t
ACC-CUR-2025-H1I2J3	United Arab Emirates Dirham	0.004760	t
ACC-CUR-2025-K4L5M6	Saudi Riyal	0.004690	t
ACC-CUR-2025-N7O8P9	Thai Baht	0.027820	t
ACC-CUR-2025-Q1R2S3	Vietnamese Dong	0.000044	t
ACC-CUR-2025-T4U5V6	Indonesian Rupiah	0.000064	t
ACC-CUR-2025-W7X8Y9	Indian Rupee	0.013500	t
ACC-CUR-2025-Z1A2B3	Malaysian Ringgit	0.023400	t
ACC-CUR-2025-C4D5E6	New Zealand Dollar	0.028800	t
\.


--
-- Data for Name: general_ledger_accounts; Type: TABLE DATA; Schema: accounting; Owner: postgres
--

COPY accounting.general_ledger_accounts (gl_account_id, account_name, account_code, account_id, status, created_at) FROM stdin;
ACC-GLA-2025-6324cd	Cash	ACC-COA-2025-CA1010	\N	Active	2025-03-08 02:00:00
ACC-GLA-2025-294712	Bank - 1122	ACC-COA-2025-CA1020	\N	Active	2025-03-08 02:00:00
ACC-GLA-2025-4b6394	Inventory	ACC-COA-2025-CA1070	\N	Active	2025-03-08 02:00:00
ACC-GLA-2025-ebf985	Mr. Zubair & Co.	ACC-COA-2025-CL2010	\N	Active	2025-03-08 02:00:00
ACC-GLA-2025-7493b2	Kazim Ahmed	ACC-COA-2025-CL2050	\N	Active	2025-03-08 02:00:00
ACC-GLA-2025-4b8d17	Kineteq	ACC-COA-2025-EE3010	\N	Active	2025-03-08 02:00:00
ACC-GLA-2025-7759cc	Salary Expense	ACC-COA-2025-AE6010	\N	Active	2025-03-08 02:00:00
ACC-GLA-2025-dcb63c	Sales Revenue	ACC-COA-2025-RR4010	\N	Active	2025-03-08 02:00:00
ACC-GLA-2025-aeddee	Cost of Goods Sold	ACC-COA-2025-CG5050	\N	Active	2025-03-08 02:00:00
ACC-GLA-2025-9e0fad	Electricity Expense	ACC-COA-2025-AE6030	\N	Active	2025-03-08 02:00:00
ACC-GLA-2025-8292ce	Government Taxes Payable	ACC-COA-2025-CL2030	\N	Active	2025-03-08 02:00:00
ACC-GLA-2025-80aaed	Raw Materials Used	ACC-COA-2025-CG5010	\N	Active	2025-03-18 08:15:14
ACC-GLA-2025-6372e6	BANK - BDO	ACC-COA-2025-CL2010	\N	Active	2025-03-08 02:00:00
ACC-GLA-2025-8b8a26	Shipping Cost	ACC-COA-2025-SD6120	\N	Active	2025-03-18 21:06:48
ACC-GLA-2025-100ac0	Customer - botik	ACC-COA-2025-NA1130	\N	Active	2025-03-18 21:23:27
ACC-GLA-2025-ba3070	Vendor- BioFlex Composites	ACC-COA-2025-CL2010	\N	Active	2025-03-08 02:00:00
ACC-GLA-2025-f1c20e	Vendor- BioGrade Metals	ACC-COA-2025-CL2010	\N	Active	2025-03-08 02:00:00
ACC-GLA-2025-a9ee96	Vendor- CryoBond Precision	ACC-COA-2025-CL2010	\N	Active	2025-03-08 02:00:00
ACC-GLA-2025-7674d7	Cash	ACC-COA-2025-CA1010	\N	Active	2025-03-08 02:00:00
ACC-GLA-2025-b37e18	Bank - 1122	ACC-COA-2025-CA1020	\N	Active	2025-03-08 02:00:00
ACC-GLA-2025-525599	Inventory	ACC-COA-2025-CA1070	\N	Active	2025-03-08 02:00:00
ACC-GLA-2025-cbf943	Mr. Zubair & Co.	ACC-COA-2025-CL2010	\N	Active	2025-03-08 02:00:00
ACC-GLA-2025-31d273	Kazim Ahmed	ACC-COA-2025-CL2050	\N	Active	2025-03-08 02:00:00
ACC-GLA-2025-7678e8	Kineteq	ACC-COA-2025-EE3010	\N	Active	2025-03-08 02:00:00
ACC-GLA-2025-7d5e17	Salary Expense	ACC-COA-2025-AE6010	\N	Active	2025-03-08 02:00:00
ACC-GLA-2025-a1539b	Sales Revenue	ACC-COA-2025-RR4010	\N	Active	2025-03-08 02:00:00
ACC-GLA-2025-b7579a	Cost of Goods Sold	ACC-COA-2025-CG5050	\N	Active	2025-03-08 02:00:00
ACC-GLA-2025-e1ff82	Electricity Expense	ACC-COA-2025-AE6030	\N	Active	2025-03-08 02:00:00
ACC-GLA-2025-13c3bf	Government Taxes Payable	ACC-COA-2025-CL2030	\N	Active	2025-03-08 02:00:00
ACC-GLA-2025-f9b973	Raw Materials Used	ACC-COA-2025-CG5010	\N	Active	2025-03-18 08:15:14
ACC-GLA-2025-d7af6a	BANK - BDO	ACC-COA-2025-CL2010	\N	Active	2025-03-08 02:00:00
ACC-GLA-2025-885a20	Shipping Cost	ACC-COA-2025-SD6120	\N	Active	2025-03-18 21:06:48
ACC-GLA-2025-d82c55	Customer - botik	ACC-COA-2025-NA1130	\N	Active	2025-03-18 21:23:27
ACC-GLA-2025-eb908f	Vendor- BioFlex Composites	ACC-COA-2025-CL2010	\N	Active	2025-03-08 02:00:00
ACC-GLA-2025-6375e2	Vendor- BioGrade Metals	ACC-COA-2025-CL2010	\N	Active	2025-03-08 02:00:00
ACC-GLA-2025-5b4184	Vendor- CryoBond Precision	ACC-COA-2025-CL2010	\N	Active	2025-03-08 02:00:00
ACC-GLA-2025-382491	asdf	SALES-CUST-2025-2ef739	SALES-CUST-2025-2ef739	Active	2025-03-27 13:38:29.805076
ACC-GLA-2025-cee598	asdf	SALES-CUST-2025-a24733	SALES-CUST-2025-a24733	Active	2025-03-27 13:44:00.43948
ACC-GLA-2025-edba20	asdf	SALES-CUST-2025-daccd5	SALES-CUST-2025-daccd5	Active	2025-03-27 13:49:16.193707
ACC-GLA-2025-d08e7d	asdf	SALES-CUST-2025-8d1c2b	SALES-CUST-2025-8d1c2b	Active	2025-03-27 13:56:13.315607
ACC-GLA-2025-bb19f5	asd	SALES-CUST-2025-0d5a51	SALES-CUST-2025-0d5a51	Active	2025-03-27 13:56:49.78112
ACC-GLA-2025-ab0a61	asdf	SALES-CUST-2025-11c743	SALES-CUST-2025-11c743	Active	2025-03-27 14:00:54.94692
ACC-GLA-2025-4d9883	asf	SALES-CUST-2025-924d40	SALES-CUST-2025-924d40	Active	2025-03-27 14:01:33.634803
ACC-GLA-2025-53ab9c	asdf	SALES-CUST-2025-c2a631	SALES-CUST-2025-c2a631	Active	2025-03-27 14:02:03.269042
ACC-GLA-2025-2f99ba	asdf	SALES-CUST-2025-946136	SALES-CUST-2025-946136	Active	2025-03-27 14:05:45.09741
ACC-GLA-2025-339823	asdfasdf	SALES-CUST-2025-bbed7f	SALES-CUST-2025-bbed7f	Active	2025-03-27 14:06:19.790605
\.


--
-- Data for Name: journal_entries; Type: TABLE DATA; Schema: accounting; Owner: postgres
--

COPY accounting.journal_entries (journal_id, journal_date, description, total_debit, total_credit, invoice_id, currency_id) FROM stdin;
ACC-JOE-2025-7be38c	2022-01-05	Sales Order	77984.53	77984.53	\N	ACC-CUR-2025-X1Y2Z3
ACC-JOE-2025-bfcbbf	2022-01-05	Sales Order	3544677.76	3544677.76	\N	ACC-CUR-2025-X1Y2Z3
ACC-JOE-2025-2063e2	2022-01-05	Sales Order	437073.00	437073.00	\N	ACC-CUR-2025-X1Y2Z3
ACC-JOE-2025-446fab	2022-01-06	Production Document Transaction	150.00	150.00	\N	ACC-CUR-2025-X1Y2Z3
ACC-JOE-2025-605a28	2022-01-06	Production Document Transaction	175.00	175.00	\N	ACC-CUR-2025-X1Y2Z3
ACC-JOE-2025-4a719a	2022-01-07	MRP Overall Production Cost	2000.00	2000.00	\N	ACC-CUR-2025-X1Y2Z3
ACC-JOE-2025-f576fb	2022-01-07	MRP Overall Production Cost	1830.00	1830.00	\N	ACC-CUR-2025-X1Y2Z3
ACC-JOE-2025-5b9a00	2022-01-07	MRP Overall Production Cost	2600.00	2600.00	\N	ACC-CUR-2025-X1Y2Z3
ACC-JOE-2025-e1c4ad	2022-01-08	Payroll Expense	5854.55	5854.55	\N	ACC-CUR-2025-X1Y2Z3
ACC-JOE-2025-41ad36	2022-01-08	Payroll Expense	1850.00	1850.00	\N	ACC-CUR-2025-X1Y2Z3
ACC-JOE-2025-b1dd9f	2022-01-09	Production Order Cost	1500.00	1500.00	\N	ACC-CUR-2025-X1Y2Z3
ACC-JOE-2025-128915	2022-01-09	Production Order Cost	800.00	800.00	\N	ACC-CUR-2025-X1Y2Z3
ACC-JOE-2025-14f322	2022-01-05	Sales Order	77984.53	77984.53	\N	ACC-CUR-2025-X1Y2Z3
ACC-JOE-2025-ecd4d1	2022-01-05	Sales Order	3544677.76	3544677.76	\N	ACC-CUR-2025-X1Y2Z3
ACC-JOE-2025-69c088	2022-01-05	Sales Order	437073.00	437073.00	\N	ACC-CUR-2025-X1Y2Z3
ACC-JOE-2025-14189e	2022-01-06	Production Document Transaction	150.00	150.00	\N	ACC-CUR-2025-X1Y2Z3
ACC-JOE-2025-016c14	2022-01-06	Production Document Transaction	175.00	175.00	\N	ACC-CUR-2025-X1Y2Z3
ACC-JOE-2025-d61d56	2022-01-07	MRP Overall Production Cost	2000.00	2000.00	\N	ACC-CUR-2025-X1Y2Z3
ACC-JOE-2025-b00ead	2022-01-07	MRP Overall Production Cost	1830.00	1830.00	\N	ACC-CUR-2025-X1Y2Z3
ACC-JOE-2025-670171	2022-01-07	MRP Overall Production Cost	2600.00	2600.00	\N	ACC-CUR-2025-X1Y2Z3
ACC-JOE-2025-22c66d	2022-01-08	Payroll Expense	5854.55	5854.55	\N	ACC-CUR-2025-X1Y2Z3
ACC-JOE-2025-096cbf	2022-01-08	Payroll Expense	1850.00	1850.00	\N	ACC-CUR-2025-X1Y2Z3
ACC-JOE-2025-ae25a8	2022-01-09	Production Order Cost	1500.00	1500.00	\N	ACC-CUR-2025-X1Y2Z3
ACC-JOE-2025-17d621	2022-01-09	Production Order Cost	800.00	800.00	\N	ACC-CUR-2025-X1Y2Z3
\.


--
-- Data for Name: journal_entry_lines; Type: TABLE DATA; Schema: accounting; Owner: postgres
--

COPY accounting.journal_entry_lines (entry_line_id, gl_account_id, journal_id, debit_amount, credit_amount, description) FROM stdin;
ACC-JEL-2025-4f2787	\N	\N	77984.53	0.00	Accounts Receivable - Sales Order
ACC-JEL-2025-a26681	\N	\N	0.00	77984.53	Sales Revenue
ACC-JEL-2025-628656	\N	\N	3544677.76	0.00	Accounts Receivable - Sales Order
ACC-JEL-2025-0c570f	\N	\N	0.00	3544677.76	Sales Revenue
ACC-JEL-2025-46f6d6	\N	\N	437073.00	0.00	Accounts Receivable - Sales Order
ACC-JEL-2025-e18769	\N	\N	0.00	437073.00	Sales Revenue
ACC-JEL-2025-dbe0c6	\N	\N	150.00	0.00	Work-in-Process Inventory
ACC-JEL-2025-0f1a96	\N	\N	0.00	150.00	Raw Materials Used for Production
ACC-JEL-2025-f98d63	\N	\N	175.00	0.00	Work-in-Process Inventory
ACC-JEL-2025-a67799	\N	\N	0.00	175.00	Raw Materials Used for Production
ACC-JEL-2025-6ea64c	\N	\N	2000.00	0.00	Cost of Finished Goods Sold
ACC-JEL-2025-3ded26	\N	\N	0.00	2000.00	Sales Revenue
ACC-JEL-2025-5c2e8c	\N	\N	1830.00	0.00	Cost of Finished Goods Sold
ACC-JEL-2025-645531	\N	\N	0.00	1830.00	Sales Revenue
ACC-JEL-2025-eb25f9	\N	\N	2600.00	0.00	Cost of Finished Goods Sold
ACC-JEL-2025-be0a10	\N	\N	0.00	2600.00	Sales Revenue
ACC-JEL-2025-f5f606	\N	\N	5854.55	0.00	Payroll Expense
ACC-JEL-2025-be0c5b	\N	\N	0.00	5854.55	Payroll Payment
ACC-JEL-2025-2a1b8c	\N	\N	1850.00	0.00	Payroll Expense
ACC-JEL-2025-3a020b	\N	\N	0.00	1850.00	Payroll Payment
ACC-JEL-2025-cc50b7	\N	\N	1500.00	0.00	Work-in-Process Inventory Increase
ACC-JEL-2025-86f95f	\N	\N	0.00	1500.00	Raw Materials Used
ACC-JEL-2025-54db62	\N	\N	800.00	0.00	Work-in-Process Inventory Increase
ACC-JEL-2025-dba8da	\N	\N	0.00	800.00	Raw Materials Used
ACC-JEL-2025-45cdb4	\N	\N	77984.53	0.00	Accounts Receivable - Sales Order
ACC-JEL-2025-e1a4db	\N	\N	0.00	77984.53	Sales Revenue
ACC-JEL-2025-df6f6f	\N	\N	3544677.76	0.00	Accounts Receivable - Sales Order
ACC-JEL-2025-7a5877	\N	\N	0.00	3544677.76	Sales Revenue
ACC-JEL-2025-9e12aa	\N	\N	437073.00	0.00	Accounts Receivable - Sales Order
ACC-JEL-2025-344a72	\N	\N	0.00	437073.00	Sales Revenue
ACC-JEL-2025-620562	\N	\N	150.00	0.00	Work-in-Process Inventory
ACC-JEL-2025-2a4af2	\N	\N	0.00	150.00	Raw Materials Used for Production
ACC-JEL-2025-8d9cfe	\N	\N	175.00	0.00	Work-in-Process Inventory
ACC-JEL-2025-d1a3dd	\N	\N	0.00	175.00	Raw Materials Used for Production
ACC-JEL-2025-8d6e48	\N	\N	2000.00	0.00	Cost of Finished Goods Sold
ACC-JEL-2025-315c3e	\N	\N	0.00	2000.00	Sales Revenue
ACC-JEL-2025-af0a65	\N	\N	1830.00	0.00	Cost of Finished Goods Sold
ACC-JEL-2025-a653c0	\N	\N	0.00	1830.00	Sales Revenue
ACC-JEL-2025-abd2f3	\N	\N	2600.00	0.00	Cost of Finished Goods Sold
ACC-JEL-2025-43f472	\N	\N	0.00	2600.00	Sales Revenue
ACC-JEL-2025-e6eb6b	\N	\N	5854.55	0.00	Payroll Expense
ACC-JEL-2025-d95d9d	\N	\N	0.00	5854.55	Payroll Payment
ACC-JEL-2025-bff919	\N	\N	1850.00	0.00	Payroll Expense
ACC-JEL-2025-33ced7	\N	\N	0.00	1850.00	Payroll Payment
ACC-JEL-2025-43ec88	\N	\N	1500.00	0.00	Work-in-Process Inventory Increase
ACC-JEL-2025-9bb9b8	\N	\N	0.00	1500.00	Raw Materials Used
ACC-JEL-2025-019cb0	\N	\N	800.00	0.00	Work-in-Process Inventory Increase
ACC-JEL-2025-84eaf8	\N	\N	0.00	800.00	Raw Materials Used
\.


--
-- Data for Name: official_receipts; Type: TABLE DATA; Schema: accounting; Owner: postgres
--

COPY accounting.official_receipts (or_id, invoice_id, customer_id, or_date, settled_amount, remaining_amount, payment_method, reference_number, created_by) FROM stdin;
ACC-OFR-2025-002b4e	\N	\N	2025-04-02	250.00	250.00	Credit Card	REF-1001	Admin
ACC-OFR-2025-6116cb	\N	\N	2025-03-20	1200.00	0.00	Bank Transfer	REF-1002	Admin
ACC-OFR-2025-515582	\N	\N	2025-03-12	1000.00	1500.00	Cash	REF-1003	Admin
ACC-OFR-2025-a7cedc	\N	\N	2025-03-25	1800.00	0.00	Credit Card	REF-1004	Admin
ACC-OFR-2025-c9e51c	\N	\N	2025-04-06	400.00	350.00	Bank Transfer	REF-1005	Admin
ACC-OFR-2025-4162fe	\N	\N	2025-03-17	1500.00	1500.00	Cash	REF-1006	Admin
ACC-OFR-2025-1f35e4	\N	\N	2025-03-22	950.00	0.00	Credit Card	REF-1007	Admin
ACC-OFR-2025-18ae81	\N	\N	2025-04-11	2000.00	2000.00	Bank Transfer	REF-1008	Admin
ACC-OFR-2025-bfd6b4	\N	\N	2025-03-14	750.00	2000.00	Cash	REF-1009	Admin
ACC-OFR-2025-9c2b7e	\N	\N	2025-03-18	600.00	0.00	Credit Card	REF-1010	Admin
ACC-OFR-2025-37557d	\N	\N	2025-04-02	250.00	250.00	Credit Card	REF-1001	Admin
ACC-OFR-2025-ac4285	\N	\N	2025-03-20	1200.00	0.00	Bank Transfer	REF-1002	Admin
ACC-OFR-2025-363434	\N	\N	2025-03-12	1000.00	1500.00	Cash	REF-1003	Admin
ACC-OFR-2025-573a5f	\N	\N	2025-03-25	1800.00	0.00	Credit Card	REF-1004	Admin
ACC-OFR-2025-f941ed	\N	\N	2025-04-06	400.00	350.00	Bank Transfer	REF-1005	Admin
ACC-OFR-2025-cff4dd	\N	\N	2025-03-17	1500.00	1500.00	Cash	REF-1006	Admin
ACC-OFR-2025-f09f61	\N	\N	2025-03-22	950.00	0.00	Credit Card	REF-1007	Admin
ACC-OFR-2025-3f97fc	\N	\N	2025-04-11	2000.00	2000.00	Bank Transfer	REF-1008	Admin
ACC-OFR-2025-ebc5e4	\N	\N	2025-03-14	750.00	2000.00	Cash	REF-1009	Admin
ACC-OFR-2025-540ceb	\N	\N	2025-03-18	600.00	0.00	Credit Card	REF-1010	Admin
\.


--
-- Data for Name: assets; Type: TABLE DATA; Schema: admin; Owner: postgres
--

COPY admin.assets (asset_id, asset_name, purchase_date, serial_no) FROM stdin;
ADMIN-ASSET-2025-3c5751	Laptop - Dell XPS 15	2024-01-10	SN0001
ADMIN-ASSET-2025-a68f53	Office Chair - Ergonomic	2023-12-15	SN0002
ADMIN-ASSET-2025-0b26d3	Printer - HP LaserJet Pro	2024-02-05	SN0003
ADMIN-ASSET-2025-4627b0	Projector - Epson X500	2023-11-20	SN0004
ADMIN-ASSET-2025-54d5d5	Desk - Wooden Executive	2024-03-01	SN0005
ADMIN-ASSET-2025-9a81c7	Monitor - LG UltraWide	2024-02-10	SN0006
ADMIN-ASSET-2025-7626e1	Keyboard - Mechanical RGB	2023-12-25	SN0007
ADMIN-ASSET-2025-c25c1b	Mouse - Logitech MX Master 3	2024-01-15	SN0008
ADMIN-ASSET-2025-96fb32	External Hard Drive - 2TB	2024-02-28	SN0009
ADMIN-ASSET-2025-f7d5b7	Conference Speaker - Jabra Speak 750	2023-11-30	SN0010
ADMIN-ASSET-2025-6d5b67	Tablet - iPad Pro	2024-03-05	SN0011
ADMIN-ASSET-2025-757508	Smartphone - Samsung Galaxy S24	2024-02-18	SN0012
ADMIN-ASSET-2025-f4055a	Scanner - Canon imageFORMULA	2024-01-22	SN0013
ADMIN-ASSET-2025-a773ba	Router - Cisco RV340	2024-03-02	SN0014
ADMIN-ASSET-2025-8c13cf	Filing Cabinet - Steel 4-Drawer	2024-02-14	SN0015
ADMIN-ASSET-2025-2c85db	Webcam - Logitech Brio	2024-03-09	SN0016
ADMIN-ASSET-2025-21c14f	Whiteboard - Magnetic	2024-01-29	SN0017
ADMIN-ASSET-2025-209f29	Speaker System - Bose Companion	2024-02-08	SN0018
ADMIN-ASSET-2025-50e9b8	UPS - APC Smart-UPS	2024-03-04	SN0019
ADMIN-ASSET-2025-3f4710	Air Purifier - Dyson Pure Cool	2024-02-27	SN0020
ADMIN-ASSET-2025-2c4aa5	Laptop - Dell XPS 15	2024-01-10	SN0001
ADMIN-ASSET-2025-2573f1	Office Chair - Ergonomic	2023-12-15	SN0002
ADMIN-ASSET-2025-368da3	Printer - HP LaserJet Pro	2024-02-05	SN0003
ADMIN-ASSET-2025-fe70e2	Projector - Epson X500	2023-11-20	SN0004
ADMIN-ASSET-2025-8bd54c	Desk - Wooden Executive	2024-03-01	SN0005
ADMIN-ASSET-2025-865869	Monitor - LG UltraWide	2024-02-10	SN0006
ADMIN-ASSET-2025-147853	Keyboard - Mechanical RGB	2023-12-25	SN0007
ADMIN-ASSET-2025-742109	Mouse - Logitech MX Master 3	2024-01-15	SN0008
ADMIN-ASSET-2025-ec4113	External Hard Drive - 2TB	2024-02-28	SN0009
ADMIN-ASSET-2025-317a30	Conference Speaker - Jabra Speak 750	2023-11-30	SN0010
ADMIN-ASSET-2025-144e5a	Tablet - iPad Pro	2024-03-05	SN0011
ADMIN-ASSET-2025-24205d	Smartphone - Samsung Galaxy S24	2024-02-18	SN0012
ADMIN-ASSET-2025-6abeea	Scanner - Canon imageFORMULA	2024-01-22	SN0013
ADMIN-ASSET-2025-86cbb2	Router - Cisco RV340	2024-03-02	SN0014
ADMIN-ASSET-2025-7b8649	Filing Cabinet - Steel 4-Drawer	2024-02-14	SN0015
ADMIN-ASSET-2025-e549a6	Webcam - Logitech Brio	2024-03-09	SN0016
ADMIN-ASSET-2025-554e6a	Whiteboard - Magnetic	2024-01-29	SN0017
ADMIN-ASSET-2025-cff311	Speaker System - Bose Companion	2024-02-08	SN0018
ADMIN-ASSET-2025-00e28c	UPS - APC Smart-UPS	2024-03-04	SN0019
ADMIN-ASSET-2025-6fefe2	Air Purifier - Dyson Pure Cool	2024-02-27	SN0020
\.


--
-- Data for Name: audit_log; Type: TABLE DATA; Schema: admin; Owner: postgres
--

COPY admin.audit_log (log_id, user_id, action, "timestamp", ip_address, suspicious_activity, security_measures) FROM stdin;
ADMIN-LOG-2025-ea688e	\N	User login	2025-03-01 08:00:00	192.168.1.1	f	None
ADMIN-LOG-2025-247377	\N	Password change	2025-03-02 09:15:00	192.168.1.2	f	Password complexity enforced
ADMIN-LOG-2025-5cbfdb	\N	Failed login attempt	2025-03-03 10:20:00	192.168.1.3	t	Account temporarily locked
ADMIN-LOG-2025-4b824b	\N	Updated profile	2025-03-04 11:30:00	192.168.1.4	f	None
ADMIN-LOG-2025-e7fefc	\N	Deleted user record	2025-03-05 12:40:00	192.168.1.5	t	Deletion logged and reviewed
ADMIN-LOG-2025-591c80	\N	Accessed sensitive data	2025-03-06 13:50:00	192.168.1.6	t	Admin notified
ADMIN-LOG-2025-f190d9	\N	User logout	2025-03-07 14:00:00	192.168.1.7	f	None
ADMIN-LOG-2025-fc4e7f	\N	Permission change	2025-03-08 15:10:00	192.168.1.8	t	Security log updated
ADMIN-LOG-2025-eda644	\N	Password reset	2025-03-09 16:20:00	192.168.1.9	f	Two-factor authentication enabled
ADMIN-LOG-2025-7566bb	\N	Exported report	2025-03-10 17:30:00	192.168.1.10	f	None
ADMIN-LOG-2025-367034	\N	Added new vendor	2025-03-11 18:40:00	192.168.1.11	f	Change tracked in system
ADMIN-LOG-2025-a98e26	\N	Failed login attempt	2025-03-12 19:50:00	192.168.1.12	t	Account locked for review
ADMIN-LOG-2025-e3a699	\N	Edited invoice data	2025-03-13 20:00:00	192.168.1.13	t	Audit log updated
ADMIN-LOG-2025-237821	\N	Updated security settings	2025-03-14 21:10:00	192.168.1.14	t	Audit triggered
ADMIN-LOG-2025-6a015a	\N	Added new user	2025-03-15 22:20:00	192.168.1.15	f	Change logged
ADMIN-LOG-2025-883a4a	\N	Uploaded sensitive document	2025-03-16 23:30:00	192.168.1.16	t	Encryption applied
ADMIN-LOG-2025-4a031c	\N	Deleted inventory record	2025-03-17 08:40:00	192.168.1.17	t	Deletion flagged for audit
ADMIN-LOG-2025-9f8e23	\N	Updated purchase order	2025-03-18 09:50:00	192.168.1.18	f	PO audit log updated
ADMIN-LOG-2025-877d30	\N	Failed login attempt	2025-03-19 10:00:00	192.168.1.19	t	IP blacklisted temporarily
ADMIN-LOG-2025-27dd29	\N	Exported financial data	2025-03-20 11:15:00	192.168.1.20	t	Audit log flagged
ADMIN-LOG-2025-1d0c24	\N	User login	2025-03-01 08:00:00	192.168.1.1	f	None
ADMIN-LOG-2025-12b82c	\N	Password change	2025-03-02 09:15:00	192.168.1.2	f	Password complexity enforced
ADMIN-LOG-2025-bcb4e1	\N	Failed login attempt	2025-03-03 10:20:00	192.168.1.3	t	Account temporarily locked
ADMIN-LOG-2025-de3aae	\N	Updated profile	2025-03-04 11:30:00	192.168.1.4	f	None
ADMIN-LOG-2025-60057b	\N	Deleted user record	2025-03-05 12:40:00	192.168.1.5	t	Deletion logged and reviewed
ADMIN-LOG-2025-922935	\N	Accessed sensitive data	2025-03-06 13:50:00	192.168.1.6	t	Admin notified
ADMIN-LOG-2025-92cb8a	\N	User logout	2025-03-07 14:00:00	192.168.1.7	f	None
ADMIN-LOG-2025-eaa82b	\N	Permission change	2025-03-08 15:10:00	192.168.1.8	t	Security log updated
ADMIN-LOG-2025-4f23ce	\N	Password reset	2025-03-09 16:20:00	192.168.1.9	f	Two-factor authentication enabled
ADMIN-LOG-2025-86bb30	\N	Exported report	2025-03-10 17:30:00	192.168.1.10	f	None
ADMIN-LOG-2025-1c5c64	\N	Added new vendor	2025-03-11 18:40:00	192.168.1.11	f	Change tracked in system
ADMIN-LOG-2025-ddab72	\N	Failed login attempt	2025-03-12 19:50:00	192.168.1.12	t	Account locked for review
ADMIN-LOG-2025-9fec31	\N	Edited invoice data	2025-03-13 20:00:00	192.168.1.13	t	Audit log updated
ADMIN-LOG-2025-e58525	\N	Updated security settings	2025-03-14 21:10:00	192.168.1.14	t	Audit triggered
ADMIN-LOG-2025-d67149	\N	Added new user	2025-03-15 22:20:00	192.168.1.15	f	Change logged
ADMIN-LOG-2025-3805bd	\N	Uploaded sensitive document	2025-03-16 23:30:00	192.168.1.16	t	Encryption applied
ADMIN-LOG-2025-e3f463	\N	Deleted inventory record	2025-03-17 08:40:00	192.168.1.17	t	Deletion flagged for audit
ADMIN-LOG-2025-267b3d	\N	Updated purchase order	2025-03-18 09:50:00	192.168.1.18	f	PO audit log updated
ADMIN-LOG-2025-7752f4	\N	Failed login attempt	2025-03-19 10:00:00	192.168.1.19	t	IP blacklisted temporarily
ADMIN-LOG-2025-d593d9	\N	Exported financial data	2025-03-20 11:15:00	192.168.1.20	t	Audit log flagged
\.


--
-- Data for Name: business_partner_master; Type: TABLE DATA; Schema: admin; Owner: postgres
--

COPY admin.business_partner_master (partner_id, employee_id, vendor_code, customer_id, partner_name, category, contact_info) FROM stdin;
ADMIN-PARTNER-2025-1c49e2	\N	\N	\N	Kate Tan	Employee	09165824756
ADMIN-PARTNER-2025-fb5757	\N	\N	\N	James Marticio	Employee	09123456789
ADMIN-PARTNER-2025-6180de	\N	\N	\N	Robert Santiago	Employee	09187654321
ADMIN-PARTNER-2025-63fd8e	\N	\N	\N	Maria Lopez	Employee	09154321876
ADMIN-PARTNER-2025-bc6ec3	\N	\N	\N	David Cruz	Employee	09192837465
ADMIN-PARTNER-2025-7105fc	\N	\N	\N	BioFlex Composites	Vendor	(312) 867-5309
ADMIN-PARTNER-2025-3fed97	\N	\N	\N	BioGrade Metals	Vendor	(415) 293-8274
ADMIN-PARTNER-2025-93d94d	\N	\N	\N	CryoBond Precision	Vendor	(646) 918-3742
ADMIN-PARTNER-2025-a665c4	\N	\N	\N	DuraWell Pro Ltd.	Vendor	(702) 555-8291
ADMIN-PARTNER-2025-a7e20d	\N	\N	\N	MedicalTradingCorps	Vendor	(818) 320-4657
ADMIN-PARTNER-2025-73d402	\N	\N	\N	MediCore Materials Inc.	Vendor	(213) 555-0184
ADMIN-PARTNER-2025-20fcd8	\N	\N	\N	NeoCarewell Industries Ltd.	Vendor	(415) 678-9012
ADMIN-PARTNER-2025-03bc88	\N	\N	\N	PharmaTools Ltd.	Vendor	(646) 555-4321
ADMIN-PARTNER-2025-257ac1	\N	\N	\N	PureForm Medical	Vendor	(702) 123-4567
ADMIN-PARTNER-2025-29b3ed	\N	\N	\N	Sterilite Components	Vendor	(818) 876-5432
ADMIN-PARTNER-2025-87201f	\N	\N	\N	MediTech Solutions Inc.	Customer	contact@meditechph.com
ADMIN-PARTNER-2025-4602bc	\N	\N	\N	PhilCare Medical Supplies	Customer	info@philcaremed.com
ADMIN-PARTNER-2025-ccfa60	\N	\N	\N	LifeLine Diagnostics	Customer	support@lifelinediag.com
ADMIN-PARTNER-2025-6fc170	\N	\N	\N	BioPharm Innovations	Customer	sales@biopharmph.com
ADMIN-PARTNER-2025-8340c5	\N	\N	\N	Wellness Pharma Corp.	Customer	contact@wellnesspharma.com
ADMIN-PARTNER-2025-abe6db	\N	\N	\N	Kate Tan	Employee	09165824756
ADMIN-PARTNER-2025-5b8853	\N	\N	\N	James Marticio	Employee	09123456789
ADMIN-PARTNER-2025-7f1d41	\N	\N	\N	Robert Santiago	Employee	09187654321
ADMIN-PARTNER-2025-e2c44f	\N	\N	\N	Maria Lopez	Employee	09154321876
ADMIN-PARTNER-2025-f8f073	\N	\N	\N	David Cruz	Employee	09192837465
ADMIN-PARTNER-2025-c320e5	\N	\N	\N	BioFlex Composites	Vendor	(312) 867-5309
ADMIN-PARTNER-2025-043168	\N	\N	\N	BioGrade Metals	Vendor	(415) 293-8274
ADMIN-PARTNER-2025-b1ad50	\N	\N	\N	CryoBond Precision	Vendor	(646) 918-3742
ADMIN-PARTNER-2025-3d3280	\N	\N	\N	DuraWell Pro Ltd.	Vendor	(702) 555-8291
ADMIN-PARTNER-2025-bbc35b	\N	\N	\N	MedicalTradingCorps	Vendor	(818) 320-4657
ADMIN-PARTNER-2025-c54200	\N	\N	\N	MediCore Materials Inc.	Vendor	(213) 555-0184
ADMIN-PARTNER-2025-a507a7	\N	\N	\N	NeoCarewell Industries Ltd.	Vendor	(415) 678-9012
ADMIN-PARTNER-2025-c9c540	\N	\N	\N	PharmaTools Ltd.	Vendor	(646) 555-4321
ADMIN-PARTNER-2025-ebb7ad	\N	\N	\N	PureForm Medical	Vendor	(702) 123-4567
ADMIN-PARTNER-2025-8a2456	\N	\N	\N	Sterilite Components	Vendor	(818) 876-5432
ADMIN-PARTNER-2025-293eea	\N	\N	\N	MediTech Solutions Inc.	Customer	contact@meditechph.com
ADMIN-PARTNER-2025-ad4569	\N	\N	\N	PhilCare Medical Supplies	Customer	info@philcaremed.com
ADMIN-PARTNER-2025-c12ad8	\N	\N	\N	LifeLine Diagnostics	Customer	support@lifelinediag.com
ADMIN-PARTNER-2025-108fc7	\N	\N	\N	BioPharm Innovations	Customer	sales@biopharmph.com
ADMIN-PARTNER-2025-e2cfbc	\N	\N	\N	Wellness Pharma Corp.	Customer	contact@wellnesspharma.com
ADMIN-PARTNER-2025-dc8015	\N	\N	\N	Medical Center Inc.	Customer	09123456789
ADMIN-PARTNER-2025-76666b	\N	\N	\N	Medical Center Inc.	Customer	09123456789
ADMIN-PARTNER-2025-57103a	\N	\N	\N	The Very Best Medical	Customer	09123456789
ADMIN-PARTNER-2025-cc0ffb	\N	\N	\N	The Very Best Medical	Customer	09123456789
ADMIN-PARTNER-2025-f74e96	\N	\N	\N	Miramax Medical	Customer	09123456789
ADMIN-PARTNER-2025-4f46f8	\N	\N	SALES-CUST-2025-502442	asd	Customer	09123456789
ADMIN-PARTNER-2025-0fe584	\N	\N	SALES-CUST-2025-cca636	asdf	Customer	09123456789
ADMIN-PARTNER-2025-dad54c	\N	\N	SALES-CUST-2025-fe939e	asdf	Customer	09123456789
ADMIN-PARTNER-2025-9f9fa0	\N	\N	SALES-CUST-2025-975270	asfd	Customer	09123456789
ADMIN-PARTNER-2025-308730	\N	\N	SALES-CUST-2025-4b238f	asdf	Customer	09123456789
ADMIN-PARTNER-2025-99ef98	\N	\N	SALES-CUST-2025-28c4e5	asfd	Customer	09123456789
ADMIN-PARTNER-2025-247a9d	\N	\N	SALES-CUST-2025-2ef739	asdf	Customer	09123456789
ADMIN-PARTNER-2025-333d7f	\N	\N	SALES-CUST-2025-a24733	asdf	Customer	09123456789
ADMIN-PARTNER-2025-60e36e	\N	\N	SALES-CUST-2025-daccd5	asdf	Customer	09123456789
ADMIN-PARTNER-2025-bfe5bd	\N	\N	SALES-CUST-2025-8d1c2b	asdf	Customer	09123456789
ADMIN-PARTNER-2025-cb29c5	\N	\N	SALES-CUST-2025-0d5a51	asd	Customer	09123456789
ADMIN-PARTNER-2025-248472	\N	\N	SALES-CUST-2025-11c743	asdf	Customer	09123456789
ADMIN-PARTNER-2025-246d1d	\N	\N	SALES-CUST-2025-924d40	asf	Customer	09123456789
ADMIN-PARTNER-2025-9daa2e	\N	\N	SALES-CUST-2025-c2a631	asdf	Customer	09123456789
ADMIN-PARTNER-2025-b8f8f5	\N	\N	SALES-CUST-2025-946136	asdf	Customer	09123456789
ADMIN-PARTNER-2025-8bb554	\N	\N	SALES-CUST-2025-bbed7f	asdfasdf	Customer	09123457895
\.


--
-- Data for Name: item_master_data; Type: TABLE DATA; Schema: admin; Owner: postgres
--

COPY admin.item_master_data (item_id, item_type, asset_id, product_id, material_id) FROM stdin;
ADMIN-ITEM-2025-f72fa4	Product	\N	\N	\N
ADMIN-ITEM-2025-cd860d	Product	\N	\N	\N
ADMIN-ITEM-2025-8cff12	Product	\N	\N	\N
ADMIN-ITEM-2025-486aa8	Product	\N	\N	\N
ADMIN-ITEM-2025-f242f2	Product	\N	\N	\N
ADMIN-ITEM-2025-6eebdf	Product	\N	\N	\N
ADMIN-ITEM-2025-312171	Product	\N	\N	\N
ADMIN-ITEM-2025-758722	Product	\N	\N	\N
ADMIN-ITEM-2025-3d52a6	Product	\N	\N	\N
ADMIN-ITEM-2025-6c6906	Product	\N	\N	\N
ADMIN-ITEM-2025-09c590	Product	\N	\N	\N
ADMIN-ITEM-2025-973288	Product	\N	\N	\N
ADMIN-ITEM-2025-d40904	Product	\N	\N	\N
ADMIN-ITEM-2025-b093f8	Product	\N	\N	\N
ADMIN-ITEM-2025-4787de	Product	\N	\N	\N
ADMIN-ITEM-2025-8b228e	Product	\N	\N	\N
ADMIN-ITEM-2025-ef8ead	Product	\N	\N	\N
ADMIN-ITEM-2025-c1163f	Product	\N	\N	\N
ADMIN-ITEM-2025-066502	Product	\N	\N	\N
ADMIN-ITEM-2025-217092	Product	\N	\N	\N
ADMIN-ITEM-2025-c4bcd1	Product	\N	\N	\N
ADMIN-ITEM-2025-6feb03	Product	\N	\N	\N
ADMIN-ITEM-2025-134ddb	Product	\N	\N	\N
ADMIN-ITEM-2025-865b1c	Product	\N	\N	\N
ADMIN-ITEM-2025-12e389	Product	\N	\N	\N
ADMIN-ITEM-2025-bd5985	Product	\N	\N	\N
ADMIN-ITEM-2025-a165b7	Product	\N	\N	\N
ADMIN-ITEM-2025-d8555f	Product	\N	\N	\N
ADMIN-ITEM-2025-adfb62	Product	\N	\N	\N
ADMIN-ITEM-2025-88c6a2	Product	\N	\N	\N
ADMIN-ITEM-2025-8b20d7	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-73ccc1	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-8b5365	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-90413e	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-2da90b	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-ea1ffc	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-8fe6d2	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-734622	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-2f1409	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-bc59ea	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-1b5e60	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-e92f36	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-06eff9	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-2849c1	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-c21aa1	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-04470e	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-fde8f1	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-48ef80	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-471ed2	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-a5f197	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-3985e3	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-814c77	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-992682	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-3fb338	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-57e00e	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-af6d80	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-4a3a6a	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-b91e11	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-39ee3c	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-046722	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-05106e	Asset	\N	\N	\N
ADMIN-ITEM-2025-b4b0a8	Asset	\N	\N	\N
ADMIN-ITEM-2025-9f85d0	Asset	\N	\N	\N
ADMIN-ITEM-2025-a7b3d9	Asset	\N	\N	\N
ADMIN-ITEM-2025-c1bac5	Asset	\N	\N	\N
ADMIN-ITEM-2025-f31f42	Asset	\N	\N	\N
ADMIN-ITEM-2025-eebbd1	Asset	\N	\N	\N
ADMIN-ITEM-2025-b6ebe7	Asset	\N	\N	\N
ADMIN-ITEM-2025-895a69	Asset	\N	\N	\N
ADMIN-ITEM-2025-2aaee5	Asset	\N	\N	\N
ADMIN-ITEM-2025-ba90ac	Asset	\N	\N	\N
ADMIN-ITEM-2025-cbfbdc	Asset	\N	\N	\N
ADMIN-ITEM-2025-180ee1	Asset	\N	\N	\N
ADMIN-ITEM-2025-e32e9d	Asset	\N	\N	\N
ADMIN-ITEM-2025-aa97b4	Asset	\N	\N	\N
ADMIN-ITEM-2025-9d322b	Asset	\N	\N	\N
ADMIN-ITEM-2025-20e0c1	Asset	\N	\N	\N
ADMIN-ITEM-2025-193f57	Asset	\N	\N	\N
ADMIN-ITEM-2025-b3093b	Asset	\N	\N	\N
ADMIN-ITEM-2025-5b1c6b	Asset	\N	\N	\N
ADMIN-ITEM-2025-174d75	Product	\N	\N	\N
ADMIN-ITEM-2025-6a60b7	Product	\N	\N	\N
ADMIN-ITEM-2025-eae1b9	Product	\N	\N	\N
ADMIN-ITEM-2025-06a675	Product	\N	\N	\N
ADMIN-ITEM-2025-fe77cd	Product	\N	\N	\N
ADMIN-ITEM-2025-199261	Product	\N	\N	\N
ADMIN-ITEM-2025-91af33	Product	\N	\N	\N
ADMIN-ITEM-2025-2df93b	Product	\N	\N	\N
ADMIN-ITEM-2025-544545	Product	\N	\N	\N
ADMIN-ITEM-2025-1db8fc	Product	\N	\N	\N
ADMIN-ITEM-2025-6bcf45	Product	\N	\N	\N
ADMIN-ITEM-2025-b62ca1	Product	\N	\N	\N
ADMIN-ITEM-2025-a7a363	Product	\N	\N	\N
ADMIN-ITEM-2025-bf5dd7	Product	\N	\N	\N
ADMIN-ITEM-2025-6dce54	Product	\N	\N	\N
ADMIN-ITEM-2025-88a6cc	Product	\N	\N	\N
ADMIN-ITEM-2025-b8a3c2	Product	\N	\N	\N
ADMIN-ITEM-2025-edc5c1	Product	\N	\N	\N
ADMIN-ITEM-2025-a91041	Product	\N	\N	\N
ADMIN-ITEM-2025-734d8b	Product	\N	\N	\N
ADMIN-ITEM-2025-ec52b7	Product	\N	\N	\N
ADMIN-ITEM-2025-710e90	Product	\N	\N	\N
ADMIN-ITEM-2025-421b14	Product	\N	\N	\N
ADMIN-ITEM-2025-a33037	Product	\N	\N	\N
ADMIN-ITEM-2025-d652d6	Product	\N	\N	\N
ADMIN-ITEM-2025-2dff44	Product	\N	\N	\N
ADMIN-ITEM-2025-e69a1f	Product	\N	\N	\N
ADMIN-ITEM-2025-73163e	Product	\N	\N	\N
ADMIN-ITEM-2025-44b680	Product	\N	\N	\N
ADMIN-ITEM-2025-7d5b52	Product	\N	\N	\N
ADMIN-ITEM-2025-be448b	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-be14c9	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-7ecfe6	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-c97198	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-85068b	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-7ad244	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-94b5bf	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-70445f	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-cee63e	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-b307f9	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-8dacce	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-1cee4e	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-1ce6f5	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-b7ffae	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-5b3a74	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-6e9c89	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-c0d5d6	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-899dca	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-d8fce4	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-c22cc8	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-906730	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-9c6dad	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-e0cc1a	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-9183b6	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-3278de	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-89371b	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-d73417	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-3feead	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-bd90d5	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-179f62	Raw Material	\N	\N	\N
ADMIN-ITEM-2025-a16101	Asset	\N	\N	\N
ADMIN-ITEM-2025-70ae78	Asset	\N	\N	\N
ADMIN-ITEM-2025-23fc23	Asset	\N	\N	\N
ADMIN-ITEM-2025-6ccf86	Asset	\N	\N	\N
ADMIN-ITEM-2025-87b06a	Asset	\N	\N	\N
ADMIN-ITEM-2025-d2ba5e	Asset	\N	\N	\N
ADMIN-ITEM-2025-95af8e	Asset	\N	\N	\N
ADMIN-ITEM-2025-107477	Asset	\N	\N	\N
ADMIN-ITEM-2025-8fb724	Asset	\N	\N	\N
ADMIN-ITEM-2025-6a6a41	Asset	\N	\N	\N
ADMIN-ITEM-2025-a9cca1	Asset	\N	\N	\N
ADMIN-ITEM-2025-af5d7d	Asset	\N	\N	\N
ADMIN-ITEM-2025-46645b	Asset	\N	\N	\N
ADMIN-ITEM-2025-537e9e	Asset	\N	\N	\N
ADMIN-ITEM-2025-1e2712	Asset	\N	\N	\N
ADMIN-ITEM-2025-902463	Asset	\N	\N	\N
ADMIN-ITEM-2025-b7a1f7	Asset	\N	\N	\N
ADMIN-ITEM-2025-f6d72c	Asset	\N	\N	\N
ADMIN-ITEM-2025-edc1a9	Asset	\N	\N	\N
ADMIN-ITEM-2025-45f6e2	Asset	\N	\N	\N
\.


--
-- Data for Name: policies; Type: TABLE DATA; Schema: admin; Owner: postgres
--

COPY admin.policies (policy_id, policy_name, description, effective_date, status) FROM stdin;
ADMIN-POLICY-2025-812436	Equal Employment Opportunity	Ensures fair treatment and prohibits discrimination in the workplace.	2025-03-23	Active
ADMIN-POLICY-2025-2d9675	Policy Against Workplace Harassment	Prohibits harassment and provides reporting and resolution procedures.	2025-03-23	Active
ADMIN-POLICY-2025-b10c59	Hiring and Onboarding Procedures	Details the recruitment, hiring, and onboarding process.	2025-03-23	Active
ADMIN-POLICY-2025-aa3566	Hours of Work, Attendance, and Punctuality	Establishes work schedules and attendance requirements.	2025-03-23	Active
ADMIN-POLICY-2025-88c862	Overtime Policy	Outlines overtime compensation for eligible employees.	2025-03-23	Active
ADMIN-POLICY-2025-31bb9f	Position Description and Salary Administration	Defines job descriptions, salary ranges, and pay schedules.	2025-03-23	Active
ADMIN-POLICY-2025-fb71e6	Health/Life Insurance Policy	Provides individual health and dental insurance for eligible employees.	2025-03-23	Active
ADMIN-POLICY-2025-2513f0	Retirement and Tax Deferred Annuity Plan	Outlines employee retirement benefits and annuity options.	2025-03-23	Active
ADMIN-POLICY-2025-eec552	Leave Benefits Policy	Details vacation, sick leave, personal, bereavement, and extended leave benefits.	2025-03-23	Active
ADMIN-POLICY-2025-fcf1c1	Maternity and Paternity Leave Policy	Provides guidelines for maternity, paternity, and parental leave.	2025-03-23	Active
ADMIN-POLICY-2025-20e4da	Separation Policy	Outlines the process for resignation, termination, and layoffs.	2025-03-23	Active
ADMIN-POLICY-2025-716785	Return of Property Policy	Requires employees to return company property upon separation.	2025-03-23	Active
ADMIN-POLICY-2025-12e689	Personnel Records Policy	Governs the maintenance and confidentiality of personnel records.	2025-03-23	Active
ADMIN-POLICY-2025-cf6624	Non-Disclosure of Confidential Information	Protects confidential company and customer information.	2025-03-23	Active
ADMIN-POLICY-2025-0dd8a7	Computer and Information Security	Defines IT security protocols for system and data protection.	2025-03-23	Active
ADMIN-POLICY-2025-2b80f2	Internet Acceptable Use Policy	Regulates internet use to ensure compliance and professionalism.	2025-03-23	Active
ADMIN-POLICY-2025-2a82cb	Accounting Standards Policy	Adheres to GAAP or IFRS for financial reporting.	2025-03-23	Active
ADMIN-POLICY-2025-1f1154	Detailed Accounting Procedures	Outlines financial controls including petty cash and fund disbursements.	2025-03-23	Active
ADMIN-POLICY-2025-af840b	Corporate Credit Card Policy	Regulates use of corporate credit cards for business expenses.	2025-03-23	Active
ADMIN-POLICY-2025-419469	Travel and Reimbursement Policy	Defines rules for employee travel and expense reimbursement.	2025-03-23	Active
ADMIN-POLICY-2025-180b37	Equal Employment Opportunity	Ensures fair treatment and prohibits discrimination in the workplace.	2025-03-23	Active
ADMIN-POLICY-2025-0c6da2	Policy Against Workplace Harassment	Prohibits harassment and provides reporting and resolution procedures.	2025-03-23	Active
ADMIN-POLICY-2025-49058f	Hiring and Onboarding Procedures	Details the recruitment, hiring, and onboarding process.	2025-03-23	Active
ADMIN-POLICY-2025-7673b1	Hours of Work, Attendance, and Punctuality	Establishes work schedules and attendance requirements.	2025-03-23	Active
ADMIN-POLICY-2025-4a0947	Overtime Policy	Outlines overtime compensation for eligible employees.	2025-03-23	Active
ADMIN-POLICY-2025-076ec8	Position Description and Salary Administration	Defines job descriptions, salary ranges, and pay schedules.	2025-03-23	Active
ADMIN-POLICY-2025-b1ce47	Health/Life Insurance Policy	Provides individual health and dental insurance for eligible employees.	2025-03-23	Active
ADMIN-POLICY-2025-7326f0	Retirement and Tax Deferred Annuity Plan	Outlines employee retirement benefits and annuity options.	2025-03-23	Active
ADMIN-POLICY-2025-75c018	Leave Benefits Policy	Details vacation, sick leave, personal, bereavement, and extended leave benefits.	2025-03-23	Active
ADMIN-POLICY-2025-3b0a7d	Maternity and Paternity Leave Policy	Provides guidelines for maternity, paternity, and parental leave.	2025-03-23	Active
ADMIN-POLICY-2025-a537c1	Separation Policy	Outlines the process for resignation, termination, and layoffs.	2025-03-23	Active
ADMIN-POLICY-2025-96a4e4	Return of Property Policy	Requires employees to return company property upon separation.	2025-03-23	Active
ADMIN-POLICY-2025-cfc744	Personnel Records Policy	Governs the maintenance and confidentiality of personnel records.	2025-03-23	Active
ADMIN-POLICY-2025-7f6cb2	Non-Disclosure of Confidential Information	Protects confidential company and customer information.	2025-03-23	Active
ADMIN-POLICY-2025-764727	Computer and Information Security	Defines IT security protocols for system and data protection.	2025-03-23	Active
ADMIN-POLICY-2025-a25823	Internet Acceptable Use Policy	Regulates internet use to ensure compliance and professionalism.	2025-03-23	Active
ADMIN-POLICY-2025-a944d8	Accounting Standards Policy	Adheres to GAAP or IFRS for financial reporting.	2025-03-23	Active
ADMIN-POLICY-2025-e3705c	Detailed Accounting Procedures	Outlines financial controls including petty cash and fund disbursements.	2025-03-23	Active
ADMIN-POLICY-2025-a1263a	Corporate Credit Card Policy	Regulates use of corporate credit cards for business expenses.	2025-03-23	Active
ADMIN-POLICY-2025-5b686e	Travel and Reimbursement Policy	Defines rules for employee travel and expense reimbursement.	2025-03-23	Active
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: admin; Owner: postgres
--

COPY admin.products (product_id, product_name, description, selling_price, stock_level, warranty_period, policy_id) FROM stdin;
ADMIN-PROD-2025-2e0ab6	A9	Used for critical patient or longer surgery, close-loop anesthesia.	47726.64	631	12	\N
ADMIN-PROD-2025-5598cf	AirStart10	CPAP therapy device for sleep apnea treatment.	10951.20	443	12	\N
ADMIN-PROD-2025-8698b7	B2 Infant Incubator	Controlled environment for newborn care for optimal temperature and humidity.	1114666.00	540	12	\N
ADMIN-PROD-2025-941c5b	B3 Neonatal Incubator	Advanced life support system for premature infants, regulating vital parameters.	218400.00	599	12	\N
ADMIN-PROD-2025-a17047	B8/B6 Neonatal Incubator	Intensive care unit for critically ill newborns, providing advanced monitoring and treatment capabilities.	249756.00	693	12	\N
ADMIN-PROD-2025-c5c83a	BeneFusion 5 Series	Infusion pumps for precise medication and fluid delivery.	135266.04	496	12	\N
ADMIN-PROD-2025-115147	BeneFusion e Series	Advanced infusion systems with smart features for enhanced safety.	128700.00	331	12	\N
ADMIN-PROD-2025-83adb5	BeneFusion n Series	Portable infusion pumps for ambulatory patient care.	128700.00	554	12	\N
ADMIN-PROD-2025-a68481	BeneHeart AED C2 and D1 PRO	Automated external defibrillators for emergency cardiac resuscitation.	259543.44	407	12	\N
ADMIN-PROD-2025-b022f3	BeneHeart D3	Professional defibrillator monitor for cardiac resuscitation and patient monitoring.	218673.00	585	12	\N
ADMIN-PROD-2025-6db12d	BeneHeart D6	Portable defibrillator monitor with advanced monitoring capabilities.	3954.60	400	12	\N
ADMIN-PROD-2025-5833b2	BeneHeart R12	Electrocardiograph (ECG) device for cardiac diagnostic testing.	3954.60	636	12	\N
ADMIN-PROD-2025-0e6337	BeneHeart R3	Compact electrocardiograph for routine ECG measurements.	3954.60	366	12	\N
ADMIN-PROD-2025-158fce	BeneVision CMS	Central monitoring system for patient data management.	3954.60	492	12	\N
ADMIN-PROD-2025-88a5b3	BeneVision N Series	Patient monitors providing comprehensive physiological measurements.	3954.60	421	12	\N
ADMIN-PROD-2025-9e365c	BeneVision N1	Portable patient monitor for continuous vital signs monitoring.	3954.60	613	12	\N
ADMIN-PROD-2025-290b77	BL70 Infant Phototherapy Equipment	Light therapy device for treating neonatal jaundice.	6076.20	557	12	\N
ADMIN-PROD-2025-467bbd	BQ80 Infant Radiant Warmer	Radiant heat source for maintaining newborn body temperature.	10756.20	508	12	\N
ADMIN-PROD-2025-561cd9	EMMA Capnograph	Device for measuring carbon dioxide levels in exhaled breath.	3900.00	511	12	\N
ADMIN-PROD-2025-93544e	ePM Series	Patient monitors for vital signs measurement and display.	2457.00	597	12	\N
ADMIN-PROD-2025-f2a2ec	HyBase 3000	Operating table for surgical procedures.	32104.80	372	12	\N
ADMIN-PROD-2025-d25da2	HyBase 6100/6100 PLUS	Advanced operating tables with specialized features.	33290.40	424	12	\N
ADMIN-PROD-2025-086546	HyBase V8/V8 Classic	Versatile operating tables for various surgical specialties.	33290.40	642	12	\N
ADMIN-PROD-2025-d973c5	HyBase V9	High-end operating table with advanced positioning capabilities.	33290.40	439	12	\N
ADMIN-PROD-2025-d1edf6	HyLED 200 M	Surgical light for operating room illumination.	834.60	380	12	\N
ADMIN-PROD-2025-66eb2d	HyLED 600	High-performance surgical light with adjustable settings.	834.60	606	12	\N
ADMIN-PROD-2025-91b19e	HyLED 600M	Mobile surgical light for flexible use.	780.00	619	12	\N
ADMIN-PROD-2025-f3d852	HyLED 7 Series	Advanced surgical lights with optimal illumination and control.	1872.00	453	12	\N
ADMIN-PROD-2025-64c17b	HyLED 760	High-quality surgical light with excellent light output.	1872.00	580	12	\N
ADMIN-PROD-2025-b39c24	HyLED 760M	Mobile version of HyLED 760 surgical light.	5616.00	384	12	\N
ADMIN-PROD-2025-4c8e03	A9	Used for critical patient or longer surgery, close-loop anesthesia.	47726.64	631	12	\N
ADMIN-PROD-2025-c54996	AirStart10	CPAP therapy device for sleep apnea treatment.	10951.20	443	12	\N
ADMIN-PROD-2025-cb9367	B3 Neonatal Incubator	Advanced life support system for premature infants, regulating vital parameters.	218400.00	599	12	\N
ADMIN-PROD-2025-546582	B8/B6 Neonatal Incubator	Intensive care unit for critically ill newborns, providing advanced monitoring and treatment capabilities.	249756.00	693	12	\N
ADMIN-PROD-2025-c44825	BeneFusion 5 Series	Infusion pumps for precise medication and fluid delivery.	135266.04	496	12	\N
ADMIN-PROD-2025-6d2f1c	BeneHeart AED C2 and D1 PRO	Automated external defibrillators for emergency cardiac resuscitation.	259543.44	407	12	\N
ADMIN-PROD-2025-744457	BeneHeart D3	Professional defibrillator monitor for cardiac resuscitation and patient monitoring.	218673.00	585	12	\N
ADMIN-PROD-2025-ef5c11	BeneHeart D6	Portable defibrillator monitor with advanced monitoring capabilities.	3954.60	400	12	\N
ADMIN-PROD-2025-65010f	BeneHeart R12	Electrocardiograph (ECG) device for cardiac diagnostic testing.	3954.60	636	12	\N
ADMIN-PROD-2025-f4dfb1	BeneHeart R3	Compact electrocardiograph for routine ECG measurements.	3954.60	366	12	\N
ADMIN-PROD-2025-99a57e	BeneVision CMS	Central monitoring system for patient data management.	3954.60	492	12	\N
ADMIN-PROD-2025-4d4b5e	BeneVision N Series	Patient monitors providing comprehensive physiological measurements.	3954.60	421	12	\N
ADMIN-PROD-2025-1c041d	BeneVision N1	Portable patient monitor for continuous vital signs monitoring.	3954.60	613	12	\N
ADMIN-PROD-2025-2db293	BL70 Infant Phototherapy Equipment	Light therapy device for treating neonatal jaundice.	6076.20	557	12	\N
ADMIN-PROD-2025-e52b86	BQ80 Infant Radiant Warmer	Radiant heat source for maintaining newborn body temperature.	10756.20	508	12	\N
ADMIN-PROD-2025-51838d	EMMA Capnograph	Device for measuring carbon dioxide levels in exhaled breath.	3900.00	511	12	\N
ADMIN-PROD-2025-f25387	ePM Series	Patient monitors for vital signs measurement and display.	2457.00	597	12	\N
ADMIN-PROD-2025-c7328b	HyBase 3000	Operating table for surgical procedures.	32104.80	372	12	\N
ADMIN-PROD-2025-f71dbd	HyBase 6100/6100 PLUS	Advanced operating tables with specialized features.	33290.40	424	12	\N
ADMIN-PROD-2025-7c7fca	HyBase V8/V8 Classic	Versatile operating tables for various surgical specialties.	33290.40	642	12	\N
ADMIN-PROD-2025-895493	HyBase V9	High-end operating table with advanced positioning capabilities.	33290.40	439	12	\N
ADMIN-PROD-2025-aa61c5	HyLED 200 M	Surgical light for operating room illumination.	834.60	380	12	\N
ADMIN-PROD-2025-2a83ff	HyLED 600	High-performance surgical light with adjustable settings.	834.60	606	12	\N
ADMIN-PROD-2025-736c7e	HyLED 600M	Mobile surgical light for flexible use.	780.00	619	12	\N
ADMIN-PROD-2025-3b3229	HyLED 7 Series	Advanced surgical lights with optimal illumination and control.	1872.00	453	12	\N
ADMIN-PROD-2025-c3b87b	HyLED 760	High-quality surgical light with excellent light output.	1872.00	580	12	\N
ADMIN-PROD-2025-09e33a	HyLED 760M	Mobile version of HyLED 760 surgical light.	5616.00	384	12	\N
\.


--
-- Data for Name: raw_materials; Type: TABLE DATA; Schema: admin; Owner: postgres
--

COPY admin.raw_materials (material_id, material_name, description, unit_of_measure, cost_per_unit) FROM stdin;
ADMIN-MATERIAL-2025-42d3ce	AI Driven Electronics Component	A durable, shatter-resistant plastic for medical enclosures.	set	3600.00
ADMIN-MATERIAL-2025-4ec17c	Casing	Outer shell, made of plastic or metal.	pcs	1900.00
ADMIN-MATERIAL-2025-3fbf2d	Chambers	A scintillation material used in X-ray detectors for imaging.	unit	5198.00
ADMIN-MATERIAL-2025-9ea588	Clamps	Enclosed spaces within medical devices that regulate gas or fluid flow.	pcs	70.00
ADMIN-MATERIAL-2025-caf305	Coatings	Fasteners that secure tubing, wires, or components in place.	pcs	1055.00
ADMIN-MATERIAL-2025-c65277	Heating and Drying System	A highly conductive metal used in electronic circuits and medical sensors.	unit	8500.00
ADMIN-MATERIAL-2025-749a41	Polycarbonate	Durable plastic used in eyewear and medical devices.	kg	549.00
ADMIN-MATERIAL-2025-79fccc	Polyethylene	A flexible plastic used in medical tubing and packaging.	kg	55.00
ADMIN-MATERIAL-2025-140cdf	Power System	Components for generating, storing, and distributing electrical power.	unit	1480.00
ADMIN-MATERIAL-2025-aaf0b2	Pump	A device that moves fluids or gases in medical applications.	pcs	16600.00
ADMIN-MATERIAL-2025-003207	Purification Media	Materials that filter and remove impurities in medical applications.	kg	140.00
ADMIN-MATERIAL-2025-3e97e0	Sensors	Detect physical properties and convert them into signals.	pcs	4500.00
ADMIN-MATERIAL-2025-d061f5	Structural Frame & Casing	The main framework and enclosure of medical equipment.	set	2500.00
ADMIN-MATERIAL-2025-fe445e	Suction	A process that removes fluids or gases using negative pressure.	pcs	399.00
ADMIN-MATERIAL-2025-241836	Ultrasound Transducer	A sensor that converts electricity into ultrasound for diagnostics.	unit	27800.00
ADMIN-MATERIAL-2025-92651e	Acrylic	A clear, durable plastic used in optics, and displays.	kg	200.00
ADMIN-MATERIAL-2025-64c0a2	Acrylonitrile Butadiene Styrene (ABS)	Tough plastic used in consumer products, electronics, and medical devices.	pcs	90.00
ADMIN-MATERIAL-2025-d4d9a2	Airflow Components	Measure air movement, used in HVAC and respiratory devices.	set	1250.00
ADMIN-MATERIAL-2025-52689f	Aluminum	A metal used in frames and casings.	kg	250.00
ADMIN-MATERIAL-2025-d34817	Aluminum Alloys	Aluminum mixed with other metals for improved strength and resistance.	set	2500.00
ADMIN-MATERIAL-2025-419b12	Anesthetic Delivery System	System for safely delivering anesthetics to patients.	set	450000.00
ADMIN-MATERIAL-2025-2d68fa	Bacterial Filters	Traps and removes bacteria from air.	pcs	500.00
ADMIN-MATERIAL-2025-f620eb	Battery	Power source that stores and releases electrical energy.	pcs	18900.00
ADMIN-MATERIAL-2025-93783b	Borosilicate Glass	A power source of medical device, rechargeable or disposable.	kg	60.00
ADMIN-MATERIAL-2025-6db3c2	Buffering Agent	Substance that stabilizes pH, used in biological and chemical applications.	kg	1000.00
ADMIN-MATERIAL-2025-66cde5	Buttons	Switches that initiate controls in devices.	pcs	400.00
ADMIN-MATERIAL-2025-af9d5b	Cables	Transmit electrical signals or power between components.	mm	1000.00
ADMIN-MATERIAL-2025-7cb3ba	Canister Body	Electrical wiring used to connect and transmit signals between components.	pcs	703.00
ADMIN-MATERIAL-2025-e7923d	Capacitors	Store and release electrical energy to filter signals.	pcs	95.00
ADMIN-MATERIAL-2025-b31b9d	Capnography Sensor	A sensor used to monitor CO₂ levels in respiratory systems.	kg	100.00
ADMIN-MATERIAL-2025-995792	AI Driven Electronics Component	A durable, shatter-resistant plastic for medical enclosures.	set	3600.00
ADMIN-MATERIAL-2025-b8df48	Casing	Outer shell, made of plastic or metal.	pcs	1900.00
ADMIN-MATERIAL-2025-9ece0e	Chambers	A scintillation material used in X-ray detectors for imaging.	unit	5198.00
ADMIN-MATERIAL-2025-be1425	Clamps	Enclosed spaces within medical devices that regulate gas or fluid flow.	pcs	70.00
ADMIN-MATERIAL-2025-ea8630	Coatings	Fasteners that secure tubing, wires, or components in place.	pcs	1055.00
ADMIN-MATERIAL-2025-d010a2	Heating and Drying System	A highly conductive metal used in electronic circuits and medical sensors.	unit	8500.00
ADMIN-MATERIAL-2025-b0ace2	Polycarbonate	Durable plastic used in eyewear and medical devices.	kg	549.00
ADMIN-MATERIAL-2025-e44116	Polyethylene	A flexible plastic used in medical tubing and packaging.	kg	55.00
ADMIN-MATERIAL-2025-17ea49	Power System	Components for generating, storing, and distributing electrical power.	unit	1480.00
ADMIN-MATERIAL-2025-912b18	Pump	A device that moves fluids or gases in medical applications.	pcs	16600.00
ADMIN-MATERIAL-2025-cd44b9	Purification Media	Materials that filter and remove impurities in medical applications.	kg	140.00
ADMIN-MATERIAL-2025-17328b	Sensors	Detect physical properties and convert them into signals.	pcs	4500.00
ADMIN-MATERIAL-2025-e1f592	Structural Frame & Casing	The main framework and enclosure of medical equipment.	set	2500.00
ADMIN-MATERIAL-2025-3a5e08	Suction	A process that removes fluids or gases using negative pressure.	pcs	399.00
ADMIN-MATERIAL-2025-82ad34	Ultrasound Transducer	A sensor that converts electricity into ultrasound for diagnostics.	unit	27800.00
ADMIN-MATERIAL-2025-ab23df	Acrylic	A clear, durable plastic used in optics, and displays.	kg	200.00
ADMIN-MATERIAL-2025-f2b2ee	Acrylonitrile Butadiene Styrene (ABS)	Tough plastic used in consumer products, electronics, and medical devices.	pcs	90.00
ADMIN-MATERIAL-2025-06c22b	Airflow Components	Measure air movement, used in HVAC and respiratory devices.	set	1250.00
ADMIN-MATERIAL-2025-7935b9	Aluminum	A metal used in frames and casings.	kg	250.00
ADMIN-MATERIAL-2025-d8f145	Aluminum Alloys	Aluminum mixed with other metals for improved strength and resistance.	set	2500.00
ADMIN-MATERIAL-2025-c148a1	Anesthetic Delivery System	System for safely delivering anesthetics to patients.	set	450000.00
ADMIN-MATERIAL-2025-755305	Bacterial Filters	Traps and removes bacteria from air.	pcs	500.00
ADMIN-MATERIAL-2025-955f9d	Battery	Power source that stores and releases electrical energy.	pcs	18900.00
ADMIN-MATERIAL-2025-bcfc25	Borosilicate Glass	A power source of medical device, rechargeable or disposable.	kg	60.00
ADMIN-MATERIAL-2025-9efcf0	Buffering Agent	Substance that stabilizes pH, used in biological and chemical applications.	kg	1000.00
ADMIN-MATERIAL-2025-88775a	Buttons	Switches that initiate controls in devices.	pcs	400.00
ADMIN-MATERIAL-2025-db168d	Cables	Transmit electrical signals or power between components.	mm	1000.00
ADMIN-MATERIAL-2025-0f9ed7	Canister Body	Electrical wiring used to connect and transmit signals between components.	pcs	703.00
ADMIN-MATERIAL-2025-290c96	Capacitors	Store and release electrical energy to filter signals.	pcs	95.00
ADMIN-MATERIAL-2025-b53060	Capnography Sensor	A sensor used to monitor CO₂ levels in respiratory systems.	kg	100.00
\.


--
-- Data for Name: roles_permission; Type: TABLE DATA; Schema: admin; Owner: postgres
--

COPY admin.roles_permission (role_id, role_name, description, permissions, access_level) FROM stdin;
ADMIN-ROLE-2025-7edf46	Chief Accountant	Oversees financial reporting and tax compliance.	Accounting, Finance	Full Access
ADMIN-ROLE-2025-1cb430	Accounting Supervisor	Manages accounting staff and ensures accurate bookkeeping.	Accounting, Finance	Full Access
ADMIN-ROLE-2025-d7e78a	Accounts Payable Specialist	Handles invoice payments and vendor reconciliations.	Accounting	Read-Only
ADMIN-ROLE-2025-4e6538	Accounts Receivable Specialist	Manages customer invoicing and collections.	Accounting	Read-Only
ADMIN-ROLE-2025-e10cb1	Payroll Officer	Prepares and processes payroll.	Payroll, Accounting	Full Access
ADMIN-ROLE-2025-610e04	Bookkeeper	Maintains financial records and transactions.	Accounting	Read-Only
ADMIN-ROLE-2025-9eaaf5	Financial Analyst	Conducts financial analysis and forecasting.	Finance, Accounting	Full Access
ADMIN-ROLE-2025-249ec2	Audit Officer	Performs internal audits and ensures regulatory compliance.	Audit, Finance	Full Access
ADMIN-ROLE-2025-95553a	Administrative Manager	Oversees office operations and support staff.	Administration	Full Access
ADMIN-ROLE-2025-212996	Office Administrator	Provides clerical and administrative support.	Administration	Read-Only
ADMIN-ROLE-2025-9593bb	Data Entry Specialist	Inputs and maintains data records.	Administration	Read-Only
ADMIN-ROLE-2025-955a02	Receptionist	Manages front desk and visitor coordination.	Administration	Read-Only
ADMIN-ROLE-2025-79a2e0	Executive Assistant	Provides high-level administrative support to executives.	Administration, Management	Full Access
ADMIN-ROLE-2025-be6555	Distribution Manager	Oversees distribution and logistics operations.	Distribution, Logistics	Full Access
ADMIN-ROLE-2025-264536	Logistics Coordinator	Coordinates transportation and warehouse operations.	Logistics	Full Access
ADMIN-ROLE-2025-df5074	Warehouse Supervisor	Supervises warehouse staff and inventory control.	Warehouse, Inventory	Full Access
ADMIN-ROLE-2025-1d1602	Inventory Clerk	Maintains inventory records and stock levels.	Inventory	Read-Only
ADMIN-ROLE-2025-3bcb50	Chief Financial Officer (CFO)	Leads financial planning and reporting.	Finance, Management	Full Access
ADMIN-ROLE-2025-f6312c	HR Director	Oversees HR policies and employee relations.	Human Resources	Full Access
ADMIN-ROLE-2025-ca70e3	Recruitment Officer	Manages recruitment and hiring processes.	Human Resources	Full Access
ADMIN-ROLE-2025-15663e	Chief Accountant	Oversees financial reporting and tax compliance.	Accounting, Finance	Full Access
ADMIN-ROLE-2025-22e6a8	Accounting Supervisor	Manages accounting staff and ensures accurate bookkeeping.	Accounting, Finance	Full Access
ADMIN-ROLE-2025-aae826	Accounts Payable Specialist	Handles invoice payments and vendor reconciliations.	Accounting	Read-Only
ADMIN-ROLE-2025-8e56bb	Accounts Receivable Specialist	Manages customer invoicing and collections.	Accounting	Read-Only
ADMIN-ROLE-2025-c5f37a	Payroll Officer	Prepares and processes payroll.	Payroll, Accounting	Full Access
ADMIN-ROLE-2025-861230	Bookkeeper	Maintains financial records and transactions.	Accounting	Read-Only
ADMIN-ROLE-2025-4bc263	Financial Analyst	Conducts financial analysis and forecasting.	Finance, Accounting	Full Access
ADMIN-ROLE-2025-b29ed6	Audit Officer	Performs internal audits and ensures regulatory compliance.	Audit, Finance	Full Access
ADMIN-ROLE-2025-1c29e5	Administrative Manager	Oversees office operations and support staff.	Administration	Full Access
ADMIN-ROLE-2025-639f86	Office Administrator	Provides clerical and administrative support.	Administration	Read-Only
ADMIN-ROLE-2025-4984ab	Data Entry Specialist	Inputs and maintains data records.	Administration	Read-Only
ADMIN-ROLE-2025-edb5aa	Receptionist	Manages front desk and visitor coordination.	Administration	Read-Only
ADMIN-ROLE-2025-85aba0	Executive Assistant	Provides high-level administrative support to executives.	Administration, Management	Full Access
ADMIN-ROLE-2025-5b6bfa	Distribution Manager	Oversees distribution and logistics operations.	Distribution, Logistics	Full Access
ADMIN-ROLE-2025-fa9fa5	Logistics Coordinator	Coordinates transportation and warehouse operations.	Logistics	Full Access
ADMIN-ROLE-2025-afd4d8	Warehouse Supervisor	Supervises warehouse staff and inventory control.	Warehouse, Inventory	Full Access
ADMIN-ROLE-2025-91ee03	Inventory Clerk	Maintains inventory records and stock levels.	Inventory	Read-Only
ADMIN-ROLE-2025-509ed8	Chief Financial Officer (CFO)	Leads financial planning and reporting.	Finance, Management	Full Access
ADMIN-ROLE-2025-b56fc6	HR Director	Oversees HR policies and employee relations.	Human Resources	Full Access
ADMIN-ROLE-2025-c1a9ef	Recruitment Officer	Manages recruitment and hiring processes.	Human Resources	Full Access
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: admin; Owner: postgres
--

COPY admin.users (user_id, employee_id, first_name, last_name, email, password, role_id, status, type, created_at, updated_at) FROM stdin;
ADMIN-USER-2025-c08860	\N	Kate	Tan	katetan@kinetic.ph	Pass12345	\N	Active	Employee	2025-02-01 08:30:15	2025-02-10 12:45:30
ADMIN-USER-2025-e66519	\N	James	Marticio	jamesmarticio@kinetic.ph	Secure9876	\N	Active	Employee	2025-02-05 10:15:45	2025-02-15 14:20:10
ADMIN-USER-2025-d9d1cf	\N	Robert	Santiago	robertsantiago@kinetic.ph	Unique54321	\N	Active	Employee	2025-02-07 11:05:50	2025-02-18 16:30:20
ADMIN-USER-2025-5b3b00	\N	Maria	Lopez	marialopez@kinetic.ph	SafeKey678	\N	Active	Employee	2025-02-09 13:25:40	2025-02-20 17:15:05
ADMIN-USER-2025-107d34	\N	David	Cruz	davidcruz@kinetic.ph	RandomKey456	\N	Active	Employee	2025-02-12 09:50:30	2025-02-22 18:10:45
ADMIN-USER-2025-c3535f	\N	Carla	Ramirez	carlaramirez@kinetic.ph	StrongPass789	\N	Active	Employee	2025-02-14 14:10:25	2025-02-25 19:20:30
ADMIN-USER-2025-df861b	\N	Miguel	Narabal	miguelnarabal@kinetic.ph	AccessCode321	\N	Active	Employee	2025-02-17 08:40:20	2025-02-27 20:05:50
ADMIN-USER-2025-a06ab3	\N	Angela	Tores	angelatores@kinetic.ph	Protect654	\N	Active	Employee	2025-02-19 15:55:10	2025-02-28 21:10:15
ADMIN-USER-2025-e404eb	\N	Henry	Vallespin	henryvallespin@kinetic.ph	Defend890	\N	Active	Employee	2025-02-21 10:30:35	2025-03-01 08:15:25
ADMIN-USER-2025-a1417a	\N	Karen	Mendoza	karenmendoza@kinetic.ph	UltraSafe012	\N	Active	Employee	2025-02-23 12:05:55	2025-03-02 09:50:40
ADMIN-USER-2025-9b110c	\N	Daniel	Bautista	danielbautista@kinetic.ph	Daniel1234	\N	Active	Employee	2025-02-24 09:30:00	2025-03-03 11:00:00
ADMIN-USER-2025-bb549f	\N	Sofia	Reyes	sofiareyes@kinetic.ph	Sofia5678	\N	Active	Employee	2025-02-25 10:15:00	2025-03-04 10:45:00
ADMIN-USER-2025-15404c	\N	John	Dela Cruz	johndelacruz@kinetic.ph	John9012	\N	Active	Employee	2025-02-26 08:40:00	2025-03-05 09:50:00
ADMIN-USER-2025-70b52c	\N	Michelle	Ken	michelleken@kinetic.ph	Michelle3456	\N	Active	Employee	2025-02-27 11:20:00	2025-03-06 12:30:00
ADMIN-USER-2025-3427a0	\N	Paul	Hernandez	paulhernandez@kinetic.ph	Paul7890	\N	Active	Employee	2025-02-28 14:10:00	2025-03-07 13:15:00
ADMIN-USER-2025-d693f1	\N	Emily	Gonzales	emilygonzales@kinetic.ph	Emily4321	\N	Active	Employee	2025-03-01 08:00:00	2025-03-08 09:05:00
ADMIN-USER-2025-4eb1f2	\N	Kevin	Ramirez	kevinramirez@kinetic.ph	Kevin6543	\N	Active	Employee	2025-03-02 09:45:00	2025-03-09 10:30:00
ADMIN-USER-2025-6bcc28	\N	Patricia	Morales	patriciamorales@kinetic.ph	Patricia8765	\N	Active	Employee	2025-03-03 10:30:00	2025-03-10 11:50:00
ADMIN-USER-2025-c0f7bd	\N	Juan	Dela Cruz	juan.delacruz@kinetiq.ph	Juan1122	\N	Active	Employee	2025-03-04 11:15:00	2025-03-11 12:00:00
ADMIN-USER-2025-459df1	\N	Maria	Santos	maria.santos@kinetiq.ph	Maria3344	\N	Active	Employee	2025-03-05 12:00:00	2025-03-12 13:00:00
ADMIN-USER-2025-874596	\N	Jose	Ramirez	jose.ramirez@kinetiq.ph	Jose5566	\N	Active	Employee	2025-03-06 09:20:00	2025-03-13 11:30:00
ADMIN-USER-2025-9215dd	\N	Ana	Mendoza	ana.mendoza@kinetiq.ph	Ana7788	\N	Active	Employee	2025-03-07 10:10:00	2025-03-14 12:15:00
ADMIN-USER-2025-ec551e	\N	Mark	Villanueva	mark.villanueva@kinetiq.ph	Mark1122	\N	Active	Employee	2025-03-08 08:55:00	2025-03-15 10:50:00
ADMIN-USER-2025-e508fc	\N	Miguel	Fernandez	miguel.fernandez@kinetiq.ph	Miguel3344	\N	Active	Employee	2025-03-09 11:45:00	2025-03-16 12:25:00
ADMIN-USER-2025-8daaef	\N	Daniel	Gonzales	daniel.gonzales@kinetiq.ph	Daniel5566	\N	Active	Employee	2025-03-10 09:35:00	2025-03-17 11:15:00
ADMIN-USER-2025-cba3a7	\N	Carlo	Reyes	carlo.reyes@kinetiq.ph	Carlo7788	\N	Active	Employee	2025-03-11 10:25:00	2025-03-18 12:45:00
ADMIN-USER-2025-504dd3	\N	Sofia	Cruz	sofia.cruz@kinetiq.ph	Sofia9900	\N	Active	Employee	2025-03-12 08:15:00	2025-03-19 10:05:00
ADMIN-USER-2025-a51dac	\N	Katrina	Lopez	katrina.lopez@kinetiq.ph	Katrina1122	\N	Active	Employee	2025-03-13 09:05:00	2025-03-20 11:55:00
ADMIN-USER-2025-2e90ec	\N	Patrick	Fernandez	patrick.fernande@kinetiq.ph	Patrick3344	\N	Active	Employee	2025-03-14 10:50:00	2025-03-21 12:35:00
ADMIN-USER-2025-aaabd8	\N	Andrea	Bautista	andrea.bautista@kinetiq.ph	Andrea5566	\N	Active	Employee	2025-03-15 08:25:00	2025-03-22 10:45:00
\.


--
-- Data for Name: vendor; Type: TABLE DATA; Schema: admin; Owner: postgres
--

COPY admin.vendor (vendor_code, application_reference, vendor_name, contact_person, status) FROM stdin;
ADMIN-VENDOR-2025-ba5633	\N	BioFlex Composites	Francisco Lopez	Active
ADMIN-VENDOR-2025-232b4b	\N	BioGrade Metals	Benjamin Ramos	Active
ADMIN-VENDOR-2025-4272f3	\N	CryoBond Precision	Kyla Villamor	Active
ADMIN-VENDOR-2025-0b3b9d	\N	DuraWell Pro Ltd.	Mariel De Guzman	Active
ADMIN-VENDOR-2025-1fee8d	\N	MedicalTradingCorps	Juan Carlos Perez	Active
ADMIN-VENDOR-2025-18443d	\N	MediCore Materials Inc.	Xzanelle Garcia	Active
ADMIN-VENDOR-2025-4f50e9	\N	NeoCarewell Industries Ltd.	Shaira Fernandez	Active
ADMIN-VENDOR-2025-e406cb	\N	PharmaTools Ltd.	Andrew Enriquez	Active
ADMIN-VENDOR-2025-9080ff	\N	PureForm Medical	Jefferson Callanta	Active
ADMIN-VENDOR-2025-6dd734	\N	Sterilite Components	Luis Santos	Active
ADMIN-VENDOR-2025-dfddef	\N	SupplyLife Pty Ltd	Clyden Reyes	Active
ADMIN-VENDOR-2025-9c4aef	\N	TheraMat Solutions	Michael Ocampo	Active
ADMIN-VENDOR-2025-1ef745	\N	UltraMed Alloys	Clemente Yambao	Active
ADMIN-VENDOR-2025-7a2a46	\N	VitalCore Tech	Ivan Hernandez	Active
ADMIN-VENDOR-2025-004d37	\N	Zenith BioCeramics	Carlito Macabe	Active
ADMIN-VENDOR-2025-ddcdf3	\N	ZenPlast Innovations	Wilson Guevarra	Active
ADMIN-VENDOR-2025-c76cb9	\N	BioFlex Composites	Francisco Lopez	Active
ADMIN-VENDOR-2025-968721	\N	BioGrade Metals	Benjamin Ramos	Active
ADMIN-VENDOR-2025-5ead77	\N	CryoBond Precision	Kyla Villamor	Active
ADMIN-VENDOR-2025-a42b9a	\N	DuraWell Pro Ltd.	Mariel De Guzman	Active
ADMIN-VENDOR-2025-eb26a2	\N	MedicalTradingCorps	Juan Carlos Perez	Active
ADMIN-VENDOR-2025-83494d	\N	MediCore Materials Inc.	Xzanelle Garcia	Active
ADMIN-VENDOR-2025-ddba81	\N	NeoCarewell Industries Ltd.	Shaira Fernandez	Active
ADMIN-VENDOR-2025-67a175	\N	PharmaTools Ltd.	Andrew Enriquez	Active
ADMIN-VENDOR-2025-6d428d	\N	PureForm Medical	Jefferson Callanta	Active
ADMIN-VENDOR-2025-d6c2b0	\N	Sterilite Components	Luis Santos	Active
ADMIN-VENDOR-2025-9947a7	\N	SupplyLife Pty Ltd	Clyden Reyes	Active
ADMIN-VENDOR-2025-97fc4c	\N	TheraMat Solutions	Michael Ocampo	Active
ADMIN-VENDOR-2025-618ac3	\N	UltraMed Alloys	Clemente Yambao	Active
ADMIN-VENDOR-2025-2c160d	\N	VitalCore Tech	Ivan Hernandez	Active
ADMIN-VENDOR-2025-df3fe3	\N	Zenith BioCeramics	Carlito Macabe	Active
ADMIN-VENDOR-2025-4fbde8	\N	ZenPlast Innovations	Wilson Guevarra	Active
\.


--
-- Data for Name: warehouse; Type: TABLE DATA; Schema: admin; Owner: postgres
--

COPY admin.warehouse (warehouse_id, warehouse_location, stored_materials) FROM stdin;
ADMIN-WARE-2025-83dc04	Manila	AI-Driven Electronic Components, Casing, Chambers
ADMIN-WARE-2025-afc53f	Cebu	Clamps, Coatings, Heating & Drying System
ADMIN-WARE-2025-4c1ae7	Davao	Polycarbonate, Polyethylene, Power system
ADMIN-WARE-2025-c2ab9d	Quezon City	Pump, Purification Media, Sensors
ADMIN-WARE-2025-3b645d	Pasig	Structural Frame & Casing, Suction, Ultrasound Transducer
ADMIN-WARE-2025-d81c05	Makati	Acrylic, Acrylonitrile Butadiene Styrene (ABS), Airflow Components
ADMIN-WARE-2025-f9ef3a	Taguig	Aluminum, Aluminum Alloys, Anesthetic Delivery System
ADMIN-WARE-2025-07eb93	Bacolod	Bacterial filters, Battery, Borosilicate Glass
ADMIN-WARE-2025-2845a7	Iloilo	Buffering Agent, Buttons, Cables
ADMIN-WARE-2025-ffbad0	Cagayan de Oro	Canister Body, Capacitors, Capnography Sensor
ADMIN-WARE-2025-9c5ee4	General Santos	AI-Driven Electronic Components, Polycarbonate, Sensors
ADMIN-WARE-2025-964d83	Baguio	Casing, Battery, Borosilicate Glass
ADMIN-WARE-2025-5e2601	Zamboanga	Power System, Suction, Clamps
ADMIN-WARE-2025-1892ce	Batangas	Pump, Heating and Drying System, Airflow Components
ADMIN-WARE-2025-742c9d	Cavite	Aluminum, Purification Media, Coatings
ADMIN-WARE-2025-39fa26	Laguna	Polyethylene, Capacitors, Buttons
ADMIN-WARE-2025-d9d007	Pampanga	Acrylic, Structural Frame & Casing, Buffering Agent
ADMIN-WARE-2025-5d7c26	Tarlac	Chambers, Anesthetic Delivery System, Capnography Sensor
ADMIN-WARE-2025-9cf798	Naga	Filing Cabinet - Steel, Monitor - LG UltraWide, Whiteboard - Magnetic
ADMIN-WARE-2025-775760	Dumaguete	UPS - APC Smart-UPS, Router - Cisco RV340, Logitech Brio Webcam
ADMIN-WARE-2025-2ace44	Manila	AI-Driven Electronic Components, Casing, Chambers
ADMIN-WARE-2025-e0c274	Cebu	Clamps, Coatings, Heating & Drying System
ADMIN-WARE-2025-eeef7f	Davao	Polycarbonate, Polyethylene, Power system
ADMIN-WARE-2025-32c695	Quezon City	Pump, Purification Media, Sensors
ADMIN-WARE-2025-daabd7	Pasig	Structural Frame & Casing, Suction, Ultrasound Transducer
ADMIN-WARE-2025-7612eb	Makati	Acrylic, Acrylonitrile Butadiene Styrene (ABS), Airflow Components
ADMIN-WARE-2025-b59ff1	Taguig	Aluminum, Aluminum Alloys, Anesthetic Delivery System
ADMIN-WARE-2025-648087	Bacolod	Bacterial filters, Battery, Borosilicate Glass
ADMIN-WARE-2025-0e2f6f	Iloilo	Buffering Agent, Buttons, Cables
ADMIN-WARE-2025-2e5a9d	Cagayan de Oro	Canister Body, Capacitors, Capnography Sensor
ADMIN-WARE-2025-e198f5	General Santos	AI-Driven Electronic Components, Polycarbonate, Sensors
ADMIN-WARE-2025-01b9de	Baguio	Casing, Battery, Borosilicate Glass
ADMIN-WARE-2025-753bf5	Zamboanga	Power System, Suction, Clamps
ADMIN-WARE-2025-92dd46	Batangas	Pump, Heating and Drying System, Airflow Components
ADMIN-WARE-2025-3ede2e	Cavite	Aluminum, Purification Media, Coatings
ADMIN-WARE-2025-6e951e	Laguna	Polyethylene, Capacitors, Buttons
ADMIN-WARE-2025-30f29c	Pampanga	Acrylic, Structural Frame & Casing, Buffering Agent
ADMIN-WARE-2025-8d66af	Tarlac	Chambers, Anesthetic Delivery System, Capnography Sensor
ADMIN-WARE-2025-0334d7	Naga	Filing Cabinet - Steel, Monitor - LG UltraWide, Whiteboard - Magnetic
ADMIN-WARE-2025-7866a0	Dumaguete	UPS - APC Smart-UPS, Router - Cisco RV340, Logitech Brio Webcam
\.


--
-- Data for Name: billing_receipt; Type: TABLE DATA; Schema: distribution; Owner: postgres
--

COPY distribution.billing_receipt (billing_receipt_id, delivery_receipt_id, sales_invoice_id, service_billing_id) FROM stdin;
DIS-BR-2025-cd6ac9	\N	\N	\N
DIS-BR-2025-871adf	\N	\N	\N
DIS-BR-2025-9320fe	\N	\N	\N
DIS-BR-2025-b6f12f	\N	\N	\N
DIS-BR-2025-502547	\N	\N	\N
DIS-BR-2025-8e5831	\N	\N	\N
DIS-BR-2025-5887b3	\N	\N	\N
DIS-BR-2025-807262	\N	\N	\N
DIS-BR-2025-4cb835	\N	\N	\N
DIS-BR-2025-14d20e	\N	\N	\N
DIS-BR-2025-e67036	\N	\N	\N
DIS-BR-2025-8bd7bb	\N	\N	\N
DIS-BR-2025-b43134	\N	\N	\N
DIS-BR-2025-a06a39	\N	\N	\N
DIS-BR-2025-1476c5	\N	\N	\N
DIS-BR-2025-993a00	\N	\N	\N
DIS-BR-2025-68943f	\N	\N	\N
DIS-BR-2025-311625	\N	\N	\N
DIS-BR-2025-f4862c	\N	\N	\N
DIS-BR-2025-0a9920	\N	\N	\N
\.


--
-- Data for Name: carrier; Type: TABLE DATA; Schema: distribution; Owner: postgres
--

COPY distribution.carrier (carrier_id, carrier_name, service_type, carrier_count) FROM stdin;
DIS-CAR-2025-3e118a	John Carter	Express	15
DIS-CAR-2025-5914c3	Emily Watson	Standard	25
DIS-CAR-2025-dd7a2b	Michael Turner	Same-day	10
DIS-CAR-2025-7d5c4c	Sarah Mitchell	Express	18
DIS-CAR-2025-b80874	David Richardson	Standard	20
DIS-CAR-2025-887027	Jessica Brooks	Same-day	12
DIS-CAR-2025-c7251a	Daniel Foster	Express	22
DIS-CAR-2025-2dacd9	Olivia Hayes	Standard	17
DIS-CAR-2025-5e065b	Matthew Collins	Same-day	1
DIS-CAR-2025-514a0f	Sophia Bennett	Express	30
DIS-CAR-2025-3241be	John Carter	Express	15
DIS-CAR-2025-27f697	Emily Watson	Standard	25
DIS-CAR-2025-edea9e	Michael Turner	Same-day	10
DIS-CAR-2025-461a43	Sarah Mitchell	Express	18
DIS-CAR-2025-98bca9	David Richardson	Standard	20
DIS-CAR-2025-d469ce	Jessica Brooks	Same-day	12
DIS-CAR-2025-adbdcb	Daniel Foster	Express	22
DIS-CAR-2025-716bd5	Olivia Hayes	Standard	17
DIS-CAR-2025-4709cd	Matthew Collins	Same-day	1
DIS-CAR-2025-3252ad	Sophia Bennett	Express	30
\.


--
-- Data for Name: delivery_order; Type: TABLE DATA; Schema: distribution; Owner: postgres
--

COPY distribution.delivery_order (del_order_id, order_status, content_id, is_project_based, is_partial_delivery, service_order_id, production_request_id, stock_transfer_id, sales_order_id, approval_request_id) FROM stdin;
DIS-DO-2025-49d1ee	Approved	\N	Non-Project Based	No	\N	\N	\N	\N	\N
DIS-DO-2025-3a8209	Approved	\N	Project Based	No	\N	\N	\N	\N	\N
DIS-DO-2025-d5119e	Approved	\N	Non-Project Based	Yes	\N	\N	\N	\N	\N
DIS-DO-2025-86c311	Approved	\N	Project Based	No	\N	\N	\N	\N	\N
DIS-DO-2025-de3cac	Created	\N	Non-Project Based	No	\N	\N	\N	\N	\N
DIS-DO-2025-cb15f0	Approved	\N	Project Based	Yes	\N	\N	\N	\N	\N
DIS-DO-2025-081824	Rejected	\N	Non-Project Based	No	\N	\N	\N	\N	\N
DIS-DO-2025-de5826	Approved	\N	Project Based	Yes	\N	\N	\N	\N	\N
DIS-DO-2025-9bb7c0	Created	\N	Non-Project Based	No	\N	\N	\N	\N	\N
DIS-DO-2025-4351b4	Approved	\N	Project Based	No	\N	\N	\N	\N	\N
DIS-DO-2025-ed7db7	Approved	\N	Non-Project Based	No	\N	\N	\N	\N	\N
DIS-DO-2025-36d99a	Approved	\N	Project Based	No	\N	\N	\N	\N	\N
DIS-DO-2025-a14159	Approved	\N	Non-Project Based	Yes	\N	\N	\N	\N	\N
DIS-DO-2025-f7df8f	Approved	\N	Project Based	No	\N	\N	\N	\N	\N
DIS-DO-2025-0de616	Created	\N	Non-Project Based	No	\N	\N	\N	\N	\N
DIS-DO-2025-abc180	Approved	\N	Project Based	Yes	\N	\N	\N	\N	\N
DIS-DO-2025-248dbd	Rejected	\N	Non-Project Based	No	\N	\N	\N	\N	\N
DIS-DO-2025-5580ea	Approved	\N	Project Based	Yes	\N	\N	\N	\N	\N
DIS-DO-2025-7e619f	Created	\N	Non-Project Based	No	\N	\N	\N	\N	\N
DIS-DO-2025-c4d008	Approved	\N	Project Based	No	\N	\N	\N	\N	\N
\.


--
-- Data for Name: delivery_receipt; Type: TABLE DATA; Schema: distribution; Owner: postgres
--

COPY distribution.delivery_receipt (delivery_receipt_id, delivery_date, received_by, signature, receipt_status, shipment_id) FROM stdin;
DIS-DR-2025-8645ce	2023-01-19	\N	J. Williams	Received	\N
DIS-DR-2025-75c081	2023-01-27	\N	T. Rogers	Received	\N
DIS-DR-2025-3bd9b1	2023-02-10	\N	L. Martinez	Received	\N
DIS-DR-2025-2f01fc	\N	\N	aaa7	Pending	\N
DIS-DR-2025-c0e180	\N	\N	aaa6	Pending	\N
DIS-DR-2025-c3a44c	2023-03-16	\N	M. Johnson	Received	\N
DIS-DR-2025-1bc25d	2023-03-25	\N	S. Brown	Received	\N
DIS-DR-2025-54b2f0	\N	\N	aaa3	Rejected	\N
DIS-DR-2025-51c648	\N	\N	aaa2	Pending	\N
DIS-DR-2025-10284a	\N	\N	aaa1	Rejected	\N
DIS-DR-2025-ffd8ec	2023-01-19	\N	J. Williams	Received	\N
DIS-DR-2025-f2836d	2023-01-27	\N	T. Rogers	Received	\N
DIS-DR-2025-8ebf69	2023-02-10	\N	L. Martinez	Received	\N
DIS-DR-2025-7de667	\N	\N	aaa7	Pending	\N
DIS-DR-2025-0f3e50	\N	\N	aaa6	Pending	\N
DIS-DR-2025-8bd5bc	2023-03-16	\N	M. Johnson	Received	\N
DIS-DR-2025-fee2ab	2023-03-25	\N	S. Brown	Received	\N
DIS-DR-2025-500adf	\N	\N	aaa3	Rejected	\N
DIS-DR-2025-627c7b	\N	\N	aaa2	Pending	\N
DIS-DR-2025-7b20b2	\N	\N	aaa1	Rejected	\N
\.


--
-- Data for Name: failed_shipment; Type: TABLE DATA; Schema: distribution; Owner: postgres
--

COPY distribution.failed_shipment (failed_shipment_id, failure_date, failure_reason, resolution_status, shipment_id) FROM stdin;
DIS-FS-2025-52d8b8	\N	asqw	\N	\N
DIS-FS-2025-9f1e5c	\N	asqw8	\N	\N
DIS-FS-2025-7577b6	\N	asqw7	\N	\N
DIS-FS-2025-ae6734	\N	asqw6	\N	\N
DIS-FS-2025-56bf3f	\N	asqw5	\N	\N
DIS-FS-2025-2d4034	\N	asqw4	\N	\N
DIS-FS-2025-8ee141	\N	asqw3	\N	\N
DIS-FS-2025-efa10c	2023-04-06	Missing documentation	Pending	\N
DIS-FS-2025-b0036f	\N	asqw1	\N	\N
DIS-FS-2025-2e457a	\N	asqw2	\N	\N
DIS-FS-2025-0b2be1	\N	asqw	\N	\N
DIS-FS-2025-a311b5	\N	asqw8	\N	\N
DIS-FS-2025-d2b746	\N	asqw7	\N	\N
DIS-FS-2025-b7af62	\N	asqw6	\N	\N
DIS-FS-2025-0458f4	\N	asqw5	\N	\N
DIS-FS-2025-a34821	\N	asqw4	\N	\N
DIS-FS-2025-4eed83	\N	asqw3	\N	\N
DIS-FS-2025-2ad23e	2023-04-06	Missing documentation	Pending	\N
DIS-FS-2025-b90c4c	\N	asqw1	\N	\N
DIS-FS-2025-47982c	\N	asqw2	\N	\N
\.


--
-- Data for Name: goods_issue; Type: TABLE DATA; Schema: distribution; Owner: postgres
--

COPY distribution.goods_issue (goods_issue_id, issue_date, issued_by, billing_receipt_id) FROM stdin;
DIS-GI-2025-92c5e3	2023-01-19	\N	\N
DIS-GI-2025-aa0882	2023-01-27	\N	\N
DIS-GI-2025-398462	2023-02-10	\N	\N
DIS-GI-2025-e521b4	\N	\N	\N
DIS-GI-2025-69ade9	\N	\N	\N
DIS-GI-2025-6a7497	2023-03-16	\N	\N
DIS-GI-2025-3dfe84	2023-03-25	\N	\N
DIS-GI-2025-99fe95	\N	\N	\N
DIS-GI-2025-84d218	\N	\N	\N
DIS-GI-2025-3336f2	\N	\N	\N
DIS-GI-2025-d67900	2023-01-19	\N	\N
DIS-GI-2025-8400c0	2023-01-27	\N	\N
DIS-GI-2025-34757d	2023-02-10	\N	\N
DIS-GI-2025-9bbecc	\N	\N	\N
DIS-GI-2025-e44675	\N	\N	\N
DIS-GI-2025-e9292d	2023-03-16	\N	\N
DIS-GI-2025-90559d	2023-03-25	\N	\N
DIS-GI-2025-99c2b4	\N	\N	\N
DIS-GI-2025-e5c15b	\N	\N	\N
DIS-GI-2025-c90778	\N	\N	\N
\.


--
-- Data for Name: logistics_approval_request; Type: TABLE DATA; Schema: distribution; Owner: postgres
--

COPY distribution.logistics_approval_request (approval_request_id, request_date, approval_status, approval_date, approved_by, del_order_id) FROM stdin;
DIS-LOR-2025-1e6ccf	2023-01-13	Approved	2023-01-14	\N	\N
DIS-LOR-2025-7cc6bb	2023-01-21	Approved	2023-01-22	\N	\N
DIS-LOR-2025-960254	2023-02-06	Approved	2023-02-07	\N	\N
DIS-LOR-2025-cb32ee	2023-02-19	Approved	2023-02-20	\N	\N
DIS-LOR-2025-90e469	2023-03-04	Pending	\N	\N	\N
DIS-LOR-2025-135533	2023-03-12	Approved	2023-03-13	\N	\N
DIS-LOR-2025-17f324	2023-03-20	Rejected	2023-03-21	\N	\N
DIS-LOR-2025-cb1095	2023-04-03	Approved	2023-04-04	\N	\N
DIS-LOR-2025-bded88	2023-04-17	Pending	\N	\N	\N
DIS-LOR-2025-94c186	2023-04-25	Approved	2023-04-26	\N	\N
DIS-LOR-2025-48291f	2023-01-13	Approved	2023-01-14	\N	\N
DIS-LOR-2025-406fa9	2023-01-21	Approved	2023-01-22	\N	\N
DIS-LOR-2025-ec9f00	2023-02-06	Approved	2023-02-07	\N	\N
DIS-LOR-2025-adf28e	2023-02-19	Approved	2023-02-20	\N	\N
DIS-LOR-2025-a79322	2023-03-04	Pending	\N	\N	\N
DIS-LOR-2025-3c7616	2023-03-12	Approved	2023-03-13	\N	\N
DIS-LOR-2025-45f5e5	2023-03-20	Rejected	2023-03-21	\N	\N
DIS-LOR-2025-97998c	2023-04-03	Approved	2023-04-04	\N	\N
DIS-LOR-2025-33dc55	2023-04-17	Pending	\N	\N	\N
DIS-LOR-2025-b4ec03	2023-04-25	Approved	2023-04-26	\N	\N
\.


--
-- Data for Name: operational_cost; Type: TABLE DATA; Schema: distribution; Owner: postgres
--

COPY distribution.operational_cost (operational_cost_id, additional_cost, total_operational_cost, shipping_cost_id, packing_cost_id) FROM stdin;
DIS-OS-2025-b9e770	50.00	350.00	\N	\N
DIS-OS-2025-ad056e	75.00	650.00	\N	\N
DIS-OS-2025-bc9bc8	60.00	400.00	\N	\N
DIS-OS-2025-e62f32	100.00	417.50	\N	\N
DIS-OS-2025-73833a	\N	\N	\N	\N
DIS-OS-2025-fe1959	65.00	427.50	\N	\N
DIS-OS-2025-8abb21	\N	\N	\N	\N
DIS-OS-2025-d59e65	45.00	367.50	\N	\N
DIS-OS-2025-1e9e0e	\N	\N	\N	\N
DIS-OS-2025-da533d	\N	\N	\N	\N
DIS-OS-2025-272d7a	50.00	350.00	\N	\N
DIS-OS-2025-6435d2	75.00	650.00	\N	\N
DIS-OS-2025-e96127	60.00	400.00	\N	\N
DIS-OS-2025-f4fc1c	100.00	417.50	\N	\N
DIS-OS-2025-d038b6	\N	\N	\N	\N
DIS-OS-2025-e71a42	65.00	427.50	\N	\N
DIS-OS-2025-8d691b	\N	\N	\N	\N
DIS-OS-2025-adb677	45.00	367.50	\N	\N
DIS-OS-2025-6e665f	\N	\N	\N	\N
DIS-OS-2025-3f58a5	\N	\N	\N	\N
\.


--
-- Data for Name: packing_cost; Type: TABLE DATA; Schema: distribution; Owner: postgres
--

COPY distribution.packing_cost (packing_cost_id, material_cost, labor_cost, total_packing_cost) FROM stdin;
DIS-PC-2025-a3a12d	50.00	75.00	125.00
DIS-PC-2025-16d7f3	75.00	100.00	175.00
DIS-PC-2025-1b4f9a	60.00	90.00	150.00
DIS-PC-2025-d3b78b	100.00	120.00	220.00
DIS-PC-2025-a9e322	80.00	95.00	175.00
DIS-PC-2025-a03e7b	55.00	85.00	140.00
DIS-PC-2025-23e958	70.00	110.00	180.00
DIS-PC-2025-9dd8e3	90.00	100.00	190.00
DIS-PC-2025-7b869b	65.00	75.00	140.00
DIS-PC-2025-a1d0c9	85.00	125.00	210.00
DIS-PC-2025-b37b89	50.00	75.00	125.00
DIS-PC-2025-d8c97d	75.00	100.00	175.00
DIS-PC-2025-546a15	60.00	90.00	150.00
DIS-PC-2025-9a226c	100.00	120.00	220.00
DIS-PC-2025-c3618c	80.00	95.00	175.00
DIS-PC-2025-78bf2d	55.00	85.00	140.00
DIS-PC-2025-fef29c	70.00	110.00	180.00
DIS-PC-2025-acfa3d	90.00	100.00	190.00
DIS-PC-2025-d1db05	65.00	75.00	140.00
DIS-PC-2025-5dca61	85.00	125.00	210.00
\.


--
-- Data for Name: packing_list; Type: TABLE DATA; Schema: distribution; Owner: postgres
--

COPY distribution.packing_list (packing_list_id, packed_by, packing_status, packing_type, total_items_packed, packing_cost_id, picking_list_id) FROM stdin;
DIS-PC-2025-a46fdf	\N	Shipped	Box	15	\N	\N
DIS-PC-2025-f2873a	\N	Shipped	Crate	10	\N	\N
DIS-PC-2025-132971	\N	Shipped	Box	8	\N	\N
DIS-PC-2025-0c6d09	\N	Packed	Bubble Wrap	20	\N	\N
DIS-PC-2025-b19d1d	\N	\N	\N	\N	\N	\N
DIS-PC-2025-20c4ba	\N	Shipped	Box	12	\N	\N
DIS-PC-2025-60b226	\N	\N	\N	\N	\N	\N
DIS-PC-2025-0cae28	\N	Shipped	Box	5	\N	\N
DIS-PC-2025-014bb6	\N	\N	\N	\N	\N	\N
DIS-PC-2025-d7ec28	\N	Pending	\N	\N	\N	\N
DIS-PC-2025-c49e99	\N	Shipped	Box	15	\N	\N
DIS-PC-2025-42bd39	\N	Shipped	Crate	10	\N	\N
DIS-PC-2025-0d677a	\N	Shipped	Box	8	\N	\N
DIS-PC-2025-91c3d9	\N	Packed	Bubble Wrap	20	\N	\N
DIS-PC-2025-189f3c	\N	\N	\N	\N	\N	\N
DIS-PC-2025-50ae9c	\N	Shipped	Box	12	\N	\N
DIS-PC-2025-fceb8d	\N	\N	\N	\N	\N	\N
DIS-PC-2025-0ff20a	\N	Shipped	Box	5	\N	\N
DIS-PC-2025-cbada2	\N	\N	\N	\N	\N	\N
DIS-PC-2025-694f39	\N	Pending	\N	\N	\N	\N
\.


--
-- Data for Name: picking_list; Type: TABLE DATA; Schema: distribution; Owner: postgres
--

COPY distribution.picking_list (picking_list_id, warehouse_id, picked_by, picked_status, picked_date, approval_request_id) FROM stdin;
DIS-PIL-2025-aff190	\N	\N	Completed	2023-01-15	\N
DIS-PIL-2025-dc790c	\N	\N	Completed	2023-01-23	\N
DIS-PIL-2025-a3dcb7	\N	\N	Completed	2023-02-08	\N
DIS-PIL-2025-e8a61e	\N	\N	In Progress	2023-02-21	\N
DIS-PIL-2025-dd14f3	\N	\N	\N	\N	\N
DIS-PIL-2025-956b8c	\N	\N	Completed	2023-03-14	\N
DIS-PIL-2025-f39874	\N	\N	\N	\N	\N
DIS-PIL-2025-ecb376	\N	\N	Completed	2023-04-05	\N
DIS-PIL-2025-1463a1	\N	\N	\N	\N	\N
DIS-PIL-2025-c4ce51	\N	\N	Not Started	\N	\N
DIS-PIL-2025-069e0d	\N	\N	Completed	2023-01-15	\N
DIS-PIL-2025-a2779d	\N	\N	Completed	2023-01-23	\N
DIS-PIL-2025-9d9a12	\N	\N	Completed	2023-02-08	\N
DIS-PIL-2025-1ef715	\N	\N	In Progress	2023-02-21	\N
DIS-PIL-2025-62dd06	\N	\N	\N	\N	\N
DIS-PIL-2025-3587b4	\N	\N	Completed	2023-03-14	\N
DIS-PIL-2025-2d7c6a	\N	\N	\N	\N	\N
DIS-PIL-2025-a98fcd	\N	\N	Completed	2023-04-05	\N
DIS-PIL-2025-0abf9f	\N	\N	\N	\N	\N
DIS-PIL-2025-a25d20	\N	\N	Not Started	\N	\N
\.


--
-- Data for Name: rejection; Type: TABLE DATA; Schema: distribution; Owner: postgres
--

COPY distribution.rejection (rejection_id, rejection_status, rejection_reason, rejection_date, delivery_receipt_id) FROM stdin;
DIS-REJ-2025-79e6fe	Resolved	Damaged packaging	2023-01-19	\N
DIS-REJ-2025-23acbd	Confirmed	Wrong items delivered	2023-01-27	\N
DIS-REJ-2025-50a0ba	Pending	Late delivery	2023-02-10	\N
DIS-REJ-2025-f66be8	\N	aaac	\N	\N
DIS-REJ-2025-d4b83f	\N	aaav	\N	\N
DIS-REJ-2025-f8c788	Resolved	Incomplete delivery	2023-03-16	\N
DIS-REJ-2025-1af719	Confirmed	Product quality issues	2023-03-25	\N
DIS-REJ-2025-d33d6e	Confirmed	Documentation errors	2023-04-06	\N
DIS-REJ-2025-63f900	\N	aaaa	\N	\N
DIS-REJ-2025-9cc9ae	Confirmed	Damaged goods	2023-04-27	\N
DIS-REJ-2025-130e48	Resolved	Damaged packaging	2023-01-19	\N
DIS-REJ-2025-519f70	Confirmed	Wrong items delivered	2023-01-27	\N
DIS-REJ-2025-a34c78	Pending	Late delivery	2023-02-10	\N
DIS-REJ-2025-a8c195	\N	aaac	\N	\N
DIS-REJ-2025-a9b212	\N	aaav	\N	\N
DIS-REJ-2025-57cd5a	Resolved	Incomplete delivery	2023-03-16	\N
DIS-REJ-2025-311597	Confirmed	Product quality issues	2023-03-25	\N
DIS-REJ-2025-3579c4	Confirmed	Documentation errors	2023-04-06	\N
DIS-REJ-2025-c5a253	\N	aaaa	\N	\N
DIS-REJ-2025-d68fb1	Confirmed	Damaged goods	2023-04-27	\N
\.


--
-- Data for Name: rework_order; Type: TABLE DATA; Schema: distribution; Owner: postgres
--

COPY distribution.rework_order (rework_id, assigned_to, rework_status, rework_date, expected_completion, rejection_id, failed_shipment_id) FROM stdin;
DIS-RO-2025-15dd44	\N	Completed	2023-01-20	2023-01-21 17:00:00	\N	\N
DIS-RO-2025-cb0074	\N	In Progress	2023-01-28	2023-01-30 17:00:00	\N	\N
DIS-RO-2025-f7649f	\N	Pending	2023-02-11	2023-02-12 17:00:00	\N	\N
DIS-RO-2025-cbe451	\N	\N	\N	\N	\N	\N
DIS-RO-2025-17a398	\N	\N	\N	\N	\N	\N
DIS-RO-2025-89175b	\N	Completed	2023-03-17	2023-03-18 16:00:00	\N	\N
DIS-RO-2025-1ba8ec	\N	\N	\N	\N	\N	\N
DIS-RO-2025-bdb15b	\N	Pending	2023-04-07	2023-04-09 12:00:00	\N	\N
DIS-RO-2025-7fd548	\N	\N	\N	\N	\N	\N
DIS-RO-2025-bdf07c	\N	\N	\N	\N	\N	\N
DIS-RO-2025-85be41	\N	Completed	2023-01-20	2023-01-21 17:00:00	\N	\N
DIS-RO-2025-6cfc6f	\N	In Progress	2023-01-28	2023-01-30 17:00:00	\N	\N
DIS-RO-2025-96c82a	\N	Pending	2023-02-11	2023-02-12 17:00:00	\N	\N
DIS-RO-2025-cfad59	\N	\N	\N	\N	\N	\N
DIS-RO-2025-6aae49	\N	\N	\N	\N	\N	\N
DIS-RO-2025-7b13ff	\N	Completed	2023-03-17	2023-03-18 16:00:00	\N	\N
DIS-RO-2025-e2f559	\N	\N	\N	\N	\N	\N
DIS-RO-2025-b96f28	\N	Pending	2023-04-07	2023-04-09 12:00:00	\N	\N
DIS-RO-2025-8b612f	\N	\N	\N	\N	\N	\N
DIS-RO-2025-0ad7f0	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: shipment_details; Type: TABLE DATA; Schema: distribution; Owner: postgres
--

COPY distribution.shipment_details (shipment_id, carrier_id, shipment_date, shipment_status, tracking_number, estimated_arrival_date, actual_arrival_date, failed_shipment_id, packing_list_id, shipping_cost_id) FROM stdin;
DIS-BR-2025-d58aef	\N	2023-01-16	Delivered	asd1	2023-01-18 14:00:00	2023-01-19 11:30:00	\N	\N	\N
DIS-BR-2025-5f961a	\N	2023-01-24	Delivered	asd2	2023-01-27 16:00:00	2023-01-27 15:45:00	\N	\N	\N
DIS-BR-2025-76a49e	\N	2023-02-09	Delivered	asd3	2023-02-09 18:00:00	2023-02-10 09:15:00	\N	\N	\N
DIS-BR-2025-e763b9	\N	2023-02-22	Shipped	asd4	2023-02-24 12:00:00	\N	\N	\N	\N
DIS-BR-2025-1f8c0a	\N	\N	Pending	asd5	\N	\N	\N	\N	\N
DIS-BR-2025-ec42c0	\N	2023-03-15	Delivered	asd6	2023-03-16 10:00:00	2023-03-16 16:20:00	\N	\N	\N
DIS-BR-2025-dc8444	\N	\N	Delivered	asd7	2023-03-25 13:00:00	2023-03-25 14:05:00	\N	\N	\N
DIS-BR-2025-319a84	\N	2023-04-06	Failed	asd8	2023-04-08 11:00:00	\N	\N	\N	\N
DIS-BR-2025-bde3e2	\N	\N	Pending	asd9	2023-04-21 15:00:00	\N	\N	\N	\N
DIS-BR-2025-e779ad	\N	\N	Pending	asd10	2023-04-29 12:00:00	\N	\N	\N	\N
DIS-BR-2025-5690cb	\N	2023-01-16	Delivered	asd1	2023-01-18 14:00:00	2023-01-19 11:30:00	\N	\N	\N
DIS-BR-2025-0c7498	\N	2023-01-24	Delivered	asd2	2023-01-27 16:00:00	2023-01-27 15:45:00	\N	\N	\N
DIS-BR-2025-1d317b	\N	2023-02-09	Delivered	asd3	2023-02-09 18:00:00	2023-02-10 09:15:00	\N	\N	\N
DIS-BR-2025-54f43c	\N	2023-02-22	Shipped	asd4	2023-02-24 12:00:00	\N	\N	\N	\N
DIS-BR-2025-da8b9d	\N	\N	Pending	asd5	\N	\N	\N	\N	\N
DIS-BR-2025-03edb0	\N	2023-03-15	Delivered	asd6	2023-03-16 10:00:00	2023-03-16 16:20:00	\N	\N	\N
DIS-BR-2025-2cf4cc	\N	\N	Delivered	asd7	2023-03-25 13:00:00	2023-03-25 14:05:00	\N	\N	\N
DIS-BR-2025-2039d0	\N	2023-04-06	Failed	asd8	2023-04-08 11:00:00	\N	\N	\N	\N
DIS-BR-2025-7846b2	\N	\N	Pending	asd9	2023-04-21 15:00:00	\N	\N	\N	\N
DIS-BR-2025-d9f1ce	\N	\N	Pending	asd10	2023-04-29 12:00:00	\N	\N	\N	\N
\.


--
-- Data for Name: shipping_cost; Type: TABLE DATA; Schema: distribution; Owner: postgres
--

COPY distribution.shipping_cost (shipping_cost_id, packing_list_id, cost_per_kg, cost_per_km, weight_kg, distance_km, total_shipping_cost) FROM stdin;
DIS-SC-2025-a04d89	\N	2.50	0.75	25.00	150.00	175.00
DIS-SC-2025-c5448c	\N	2.50	0.75	100.00	200.00	400.00
DIS-SC-2025-91b047	\N	2.50	0.75	40.00	120.00	190.00
DIS-SC-2025-1eaa4f	\N	2.50	0.75	15.00	80.00	97.50
DIS-SC-2025-243ea6	\N	\N	\N	\N	\N	\N
DIS-SC-2025-6cd642	\N	2.75	0.80	30.00	175.00	222.50
DIS-SC-2025-b7e197	\N	\N	\N	\N	\N	\N
DIS-SC-2025-45a37a	\N	2.75	0.80	22.00	90.00	132.50
DIS-SC-2025-23dca6	\N	\N	\N	\N	\N	\N
DIS-SC-2025-5a36f0	\N	\N	\N	\N	\N	\N
DIS-SC-2025-f7098e	\N	2.50	0.75	25.00	150.00	175.00
DIS-SC-2025-d52d32	\N	2.50	0.75	100.00	200.00	400.00
DIS-SC-2025-be7d50	\N	2.50	0.75	40.00	120.00	190.00
DIS-SC-2025-939c68	\N	2.50	0.75	15.00	80.00	97.50
DIS-SC-2025-de9aa9	\N	\N	\N	\N	\N	\N
DIS-SC-2025-511b93	\N	2.75	0.80	30.00	175.00	222.50
DIS-SC-2025-bd0951	\N	\N	\N	\N	\N	\N
DIS-SC-2025-c0121b	\N	2.75	0.80	22.00	90.00	132.50
DIS-SC-2025-3afa27	\N	\N	\N	\N	\N	\N
DIS-SC-2025-be47e9	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: budget_approvals; Type: TABLE DATA; Schema: finance; Owner: postgres
--

COPY finance.budget_approvals (budget_approvals_id, validation_id, downpayments, approval_status) FROM stdin;
FNC-BUA-2025-50902d	\N	0.00	Approved
FNC-BUA-2025-5d17c1	\N	0.00	Approved
FNC-BUA-2025-6f261b	\N	0.00	Approved
FNC-BUA-2025-4c86f1	\N	14000.00	Approved
FNC-BUA-2025-44acbd	\N	10000.00	Approved
FNC-BUA-2025-5a4110	\N	20000.00	Approved
FNC-BUA-2025-7cde70	\N	100000.00	Approved
FNC-BUA-2025-b2bfa4	\N	0.00	Approved
FNC-BUA-2025-244744	\N	10000.00	Approved
FNC-BUA-2025-e316a8	\N	50000.00	Approved
FNC-BUA-2025-9e84c7	\N	100000.00	Approved
FNC-BUA-2025-784488	\N	0.00	Approved
FNC-BUA-2025-3e99d7	\N	9.00	Approved
FNC-BUA-2025-d001f1	\N	30000.00	Approved
FNC-BUA-2025-fa8143	\N	40000.00	Approved
FNC-BUA-2025-1a3fa0	\N	0.00	Approved
FNC-BUA-2025-91b009	\N	40000.00	Approved
FNC-BUA-2025-aa0087	\N	10000.00	Approved
FNC-BUA-2025-a6e137	\N	34000.00	Approved
FNC-BUA-2025-b18f4b	\N	0.00	Approved
FNC-BUA-2025-219583	\N	0.00	Approved
FNC-BUA-2025-1d44b3	\N	0.00	Approved
FNC-BUA-2025-543709	\N	14000.00	Approved
FNC-BUA-2025-0ce3ac	\N	10000.00	Approved
FNC-BUA-2025-404898	\N	20000.00	Approved
FNC-BUA-2025-552e15	\N	100000.00	Approved
FNC-BUA-2025-4fdf27	\N	0.00	Approved
FNC-BUA-2025-b6279a	\N	10000.00	Approved
FNC-BUA-2025-20a6b4	\N	50000.00	Approved
FNC-BUA-2025-26c7ed	\N	100000.00	Approved
FNC-BUA-2025-074899	\N	0.00	Approved
FNC-BUA-2025-ab6441	\N	9.00	Approved
FNC-BUA-2025-51ca95	\N	30000.00	Approved
FNC-BUA-2025-cc5588	\N	40000.00	Approved
FNC-BUA-2025-0a77e6	\N	0.00	Approved
FNC-BUA-2025-893ad4	\N	40000.00	Approved
FNC-BUA-2025-392996	\N	10000.00	Approved
FNC-BUA-2025-a0464d	\N	34000.00	Approved
\.


--
-- Data for Name: budget_validations; Type: TABLE DATA; Schema: finance; Owner: postgres
--

COPY finance.budget_validations (validation_id, dept_id, validation_date, validated_by, validation_status, remarks, amount_requested, final_approved_amount) FROM stdin;
FNC-BVA-2025-b91c63	\N	2024-10-26	Jenny Jimenez	Approved	Approved	2400.00	2400.00
FNC-BVA-2025-5271e4	\N	2024-10-26	Yori Perdigon	Pending	Awaiting Validation	100000.00	\N
FNC-BVA-2025-5124fc	\N	2024-10-27	Jenny Jimenez	Pending	Awaiting Validation	50000.00	\N
FNC-BVA-2025-7a5911	\N	2024-10-27	Jenny Jimenez	Approved	Approved	2400.00	2000.00
FNC-BVA-2025-365e97	\N	2024-10-28	Julianne Rico	Pending	Awaiting Validation	2000.00	\N
FNC-BVA-2025-df6f52	\N	2024-10-28	Janna Sudla	Approved	Approved	100000.00	100000.00
FNC-BVA-2025-94829d	\N	2024-10-29	Julianne Rico	Approved	Approved	70000.00	70000.00
FNC-BVA-2025-435a66	\N	2024-10-29	Edelyn Bercasio	Approved	Approved	70000.00	50000.00
FNC-BVA-2025-b96ec6	\N	2024-10-30	Yori Perdigon	Pending	Awaiting Validation	250000.00	\N
FNC-BVA-2025-77937f	\N	2024-10-30	Julianne Rico	Approved	Approved	100000.00	100000.00
FNC-BVA-2025-8f4fce	\N	2024-11-28	Janna Sudla	Approved	Approved	1000000.00	1000000.00
FNC-BVA-2025-873b6b	\N	2024-11-29	Julianne Rico	Approved	Approved	700000.00	700000.00
FNC-BVA-2025-087f04	\N	2024-11-29	Edelyn Bercasio	Approved	Approved	700000.00	700000.00
FNC-BVA-2025-cfb68a	\N	2024-11-30	Yori Perdigon	Pending	Awaiting Validation	250000.00	\N
FNC-BVA-2025-ba6a1a	\N	2024-11-30	Julianne Rico	Approved	Approved	100000.00	100000.00
FNC-BVA-2025-1970e5	\N	2024-11-28	Janna Sudla	Approved	Approved	100000.00	100000.00
FNC-BVA-2025-122d19	\N	2024-11-29	Julianne Rico	Approved	Approved	70000.00	70000.00
FNC-BVA-2025-f77767	\N	2024-11-29	Edelyn Bercasio	Approved	Approved	70000.00	50000.00
FNC-BVA-2025-1b0436	\N	2024-11-30	Yori Perdigon	Pending	Awaiting Validation	250000.00	\N
FNC-BVA-2025-d7bd60	\N	2024-11-30	Julianne Rico	Approved	Approved	100000.00	100000.00
FNC-BVA-2025-cbd05c	\N	2024-10-26	Jenny Jimenez	Approved	Approved	2400.00	2400.00
FNC-BVA-2025-6bebad	\N	2024-10-26	Yori Perdigon	Pending	Awaiting Validation	100000.00	\N
FNC-BVA-2025-dfa2bc	\N	2024-10-27	Jenny Jimenez	Pending	Awaiting Validation	50000.00	\N
FNC-BVA-2025-b1734c	\N	2024-10-27	Jenny Jimenez	Approved	Approved	2400.00	2000.00
FNC-BVA-2025-fb6be4	\N	2024-10-28	Julianne Rico	Pending	Awaiting Validation	2000.00	\N
FNC-BVA-2025-09fccb	\N	2024-10-28	Janna Sudla	Approved	Approved	100000.00	100000.00
FNC-BVA-2025-792123	\N	2024-10-29	Julianne Rico	Approved	Approved	70000.00	70000.00
FNC-BVA-2025-42f643	\N	2024-10-29	Edelyn Bercasio	Approved	Approved	70000.00	50000.00
FNC-BVA-2025-cc0714	\N	2024-10-30	Yori Perdigon	Pending	Awaiting Validation	250000.00	\N
FNC-BVA-2025-ad68d5	\N	2024-10-30	Julianne Rico	Approved	Approved	100000.00	100000.00
FNC-BVA-2025-0b8159	\N	2024-11-28	Janna Sudla	Approved	Approved	1000000.00	1000000.00
FNC-BVA-2025-0dad52	\N	2024-11-29	Julianne Rico	Approved	Approved	700000.00	700000.00
FNC-BVA-2025-bdeeaa	\N	2024-11-29	Edelyn Bercasio	Approved	Approved	700000.00	700000.00
FNC-BVA-2025-b8b137	\N	2024-11-30	Yori Perdigon	Pending	Awaiting Validation	250000.00	\N
FNC-BVA-2025-4511cc	\N	2024-11-30	Julianne Rico	Approved	Approved	100000.00	100000.00
FNC-BVA-2025-1d48c9	\N	2024-11-28	Janna Sudla	Approved	Approved	100000.00	100000.00
FNC-BVA-2025-7a72d0	\N	2024-11-29	Julianne Rico	Approved	Approved	70000.00	70000.00
FNC-BVA-2025-2b6db7	\N	2024-11-29	Edelyn Bercasio	Approved	Approved	70000.00	50000.00
FNC-BVA-2025-e21a1f	\N	2024-11-30	Yori Perdigon	Pending	Awaiting Validation	250000.00	\N
FNC-BVA-2025-ce0780	\N	2024-11-30	Julianne Rico	Approved	Approved	100000.00	100000.00
\.


--
-- Data for Name: attendance_tracking; Type: TABLE DATA; Schema: human_resources; Owner: postgres
--

COPY human_resources.attendance_tracking (attendance_id, employee_id, time_in, time_out, status, updated_at) FROM stdin;
HR-ATT-2025-c7a5fd	\N	2025-03-08 08:05:00	2025-03-08 17:00:00	Present	2025-03-23 10:19:43.961188
HR-ATT-2025-ae1912	\N	2025-03-08 08:30:00	2025-03-08 17:00:00	Late	2025-03-23 10:19:43.961188
HR-ATT-2025-268ef9	\N	2025-03-08 08:00:00	2025-03-08 12:00:00	Half-Day	2025-03-23 10:19:43.961188
HR-ATT-2025-b8af39	\N	2025-03-08 00:00:00	2025-03-08 00:00:00	On Leave	2025-03-23 10:19:43.961188
HR-ATT-2025-f6f91d	\N	2025-03-08 08:15:00	2025-03-08 17:00:00	Late	2025-03-23 10:19:43.961188
HR-ATT-2025-57b80c	\N	2025-03-08 08:00:00	2025-03-08 17:00:00	Present	2025-03-23 10:19:43.961188
HR-ATT-2025-d38d72	\N	2025-03-08 08:45:00	2025-03-08 17:00:00	Late	2025-03-23 10:19:43.961188
HR-ATT-2025-c9403e	\N	2025-03-08 08:00:00	2025-03-08 17:30:00	Present	2025-03-23 10:19:43.961188
HR-ATT-2025-1533e4	\N	2025-03-08 08:00:00	2025-03-08 16:00:00	Present	2025-03-23 10:19:43.961188
HR-ATT-2025-008ede	\N	2025-03-08 00:00:00	2025-03-08 00:00:00	Absent	2025-03-23 10:19:43.961188
HR-ATT-2025-633f9a	\N	2025-03-08 08:05:00	2025-03-08 17:00:00	Present	2025-03-23 10:19:44.096402
HR-ATT-2025-539a80	\N	2025-03-08 08:30:00	2025-03-08 17:00:00	Late	2025-03-23 10:19:44.096402
HR-ATT-2025-4799c5	\N	2025-03-08 08:00:00	2025-03-08 12:00:00	Half-Day	2025-03-23 10:19:44.096402
HR-ATT-2025-7a8ec8	\N	2025-03-08 00:00:00	2025-03-08 00:00:00	On Leave	2025-03-23 10:19:44.096402
HR-ATT-2025-d0321e	\N	2025-03-08 08:15:00	2025-03-08 17:00:00	Late	2025-03-23 10:19:44.096402
HR-ATT-2025-5501cc	\N	2025-03-08 08:00:00	2025-03-08 17:00:00	Present	2025-03-23 10:19:44.096402
HR-ATT-2025-1eb3fd	\N	2025-03-08 08:45:00	2025-03-08 17:00:00	Late	2025-03-23 10:19:44.096402
HR-ATT-2025-165655	\N	2025-03-08 08:00:00	2025-03-08 17:30:00	Present	2025-03-23 10:19:44.096402
HR-ATT-2025-93dde9	\N	2025-03-08 08:00:00	2025-03-08 16:00:00	Present	2025-03-23 10:19:44.096402
HR-ATT-2025-b5e2f1	\N	2025-03-08 00:00:00	2025-03-08 00:00:00	Absent	2025-03-23 10:19:44.096402
\.


--
-- Data for Name: candidates; Type: TABLE DATA; Schema: human_resources; Owner: postgres
--

COPY human_resources.candidates (candidate_id, job_id, first_name, last_name, email, phone, resume, employment_type, contract_duration, status, date_applied) FROM stdin;
HR-CAND-2025-b31ece	\N	John	Dela Cruz	johndelacruz@email.com	09171234567	Experienced accountant with CPA certification.	Permanent	\N	Applied	2025-03-23 10:19:43.966003
HR-CAND-2025-f0b27b	\N	Anna	Reyes	annareyes@email.com	09175678901	Skilled administrative assistant with 3 years of experience.	Contractual	6	Interview Scheduled	2025-03-23 10:19:43.966003
HR-CAND-2025-03e483	\N	Michael	Santos	michaelsantos@email.com	09179876543	Logistics professional with expertise in supply chain management.	Permanent	\N	Applied	2025-03-23 10:19:43.966003
HR-CAND-2025-d5f707	\N	Rachel	Gomez	rachelgomez@email.com	09172345678	Finance analyst with a background in risk assessment and investment.	Permanent	\N	Hired	2025-03-23 10:19:43.966003
HR-CAND-2025-3b8064	\N	David	Tan	davidtan@email.com	09176543219	HR specialist with 5+ years of experience in talent acquisition.	Contractual	12	Interview Scheduled	2025-03-23 10:19:43.966003
HR-CAND-2025-ed1f71	\N	Sophia	Lim	sophialim@email.com	09173456789	Inventory management professional with ERP system experience.	Permanent	\N	Applied	2025-03-23 10:19:43.966003
HR-CAND-2025-a059a5	\N	Carlos	Fernandez	carlosfernandez@email.com	09179998877	Business strategist with strong analytical and leadership skills.	Contractual	24	Applied	2025-03-23 10:19:43.966003
HR-CAND-2025-e7a2e0	\N	Emily	Chan	emilychan@email.com	09171239876	Materials planning officer with supply chain experience.	Permanent	\N	Interview Scheduled	2025-03-23 10:19:43.966003
HR-CAND-2025-8be46d	\N	James	Villanueva	jamesvillanueva@email.com	09176667777	Operations supervisor with experience in large-scale logistics.	Permanent	\N	Rejected	2025-03-23 10:19:43.966003
HR-CAND-2025-d9da6f	\N	Ben	Cruz	bencruz@email.com	09172348999	Manufacturing worker with hands-on assembly line experience.	Contractual	3	Hired	2025-03-23 10:19:43.966003
\.


--
-- Data for Name: departments; Type: TABLE DATA; Schema: human_resources; Owner: postgres
--

COPY human_resources.departments (dept_id, dept_name) FROM stdin;
HR-DEPT-2025-2c0793	Accounting
HR-DEPT-2025-dadd5f	Administration
HR-DEPT-2025-d1a944	Distribution
HR-DEPT-2025-7cf06b	Finance
HR-DEPT-2025-d4e4e8	Human Resource
HR-DEPT-2025-1e6daa	Inventory
HR-DEPT-2025-655709	Management
HR-DEPT-2025-ef8993	Material Resource Planning
HR-DEPT-2025-f4bdb9	Operations
HR-DEPT-2025-8cdfe7	Production
HR-DEPT-2025-36ef37	Project Management
HR-DEPT-2025-c41258	Purchasing
HR-DEPT-2025-e34825	Sales
HR-DEPT-2025-6c93a2	Services
\.


--
-- Data for Name: employee_performance; Type: TABLE DATA; Schema: human_resources; Owner: postgres
--

COPY human_resources.employee_performance (performance_id, employee_id, immediate_superior_id, rating, bonus_percentage, review_date, comments) FROM stdin;
HR-PERF-2025-2ec59f	\N	\N	5	\N	2025-03-01	Kate consistently delivers accurate financial reports and demonstrates exceptional leadership.
HR-PERF-2025-ef1a77	\N	\N	4	\N	2025-03-02	James has excellent accounting knowledge and manages the team effectively.
HR-PERF-2025-e6b25d	\N	\N	3	\N	2025-03-03	Robert maintains good accuracy in payables processing but needs to improve speed.
HR-PERF-2025-936e4a	\N	\N	5	\N	2025-03-04	Maria is proactive and ensures receivables are up-to-date without delays.
HR-PERF-2025-231ace	\N	\N	4	\N	2025-03-05	David is meticulous in payroll processing and always meets deadlines.
HR-PERF-2025-634b0f	\N	\N	3	\N	2025-03-06	Carla is reliable in bookkeeping but should work on handling pressure better.
HR-PERF-2025-d3a619	\N	\N	2	\N	2025-03-07	Miguel shows potential but has been inconsistent in performance this quarter.
HR-PERF-2025-91e4ca	\N	\N	5	\N	2025-03-08	Angela provides deep financial insights that significantly help decision-making.
HR-PERF-2025-deb492	\N	\N	4	\N	2025-03-09	Henry conducts thorough audits and follows compliance effectively.
HR-PERF-2025-cc4b65	\N	\N	3	\N	2025-03-10	Miguel is detail-oriented but needs to enhance efficiency in daily tasks.
HR-PERF-2025-5a56df	\N	\N	5	\N	2025-03-01	Kate consistently delivers accurate financial reports and demonstrates exceptional leadership.
HR-PERF-2025-347e4d	\N	\N	4	\N	2025-03-02	James has excellent accounting knowledge and manages the team effectively.
HR-PERF-2025-b65304	\N	\N	3	\N	2025-03-03	Robert maintains good accuracy in payables processing but needs to improve speed.
HR-PERF-2025-30c390	\N	\N	5	\N	2025-03-04	Maria is proactive and ensures receivables are up-to-date without delays.
HR-PERF-2025-a9490e	\N	\N	4	\N	2025-03-05	David is meticulous in payroll processing and always meets deadlines.
HR-PERF-2025-a61976	\N	\N	3	\N	2025-03-06	Carla is reliable in bookkeeping but should work on handling pressure better.
HR-PERF-2025-8ae8b1	\N	\N	2	\N	2025-03-07	Miguel shows potential but has been inconsistent in performance this quarter.
HR-PERF-2025-85df2b	\N	\N	5	\N	2025-03-08	Angela provides deep financial insights that significantly help decision-making.
HR-PERF-2025-193359	\N	\N	4	\N	2025-03-09	Henry conducts thorough audits and follows compliance effectively.
HR-PERF-2025-c86276	\N	\N	3	\N	2025-03-10	Miguel is detail-oriented but needs to enhance efficiency in daily tasks.
\.


--
-- Data for Name: employee_salary; Type: TABLE DATA; Schema: human_resources; Owner: postgres
--

COPY human_resources.employee_salary (salary_id, employee_id, base_salary, contract_pay_type, contract_pay_rate, total_hours_worked, total_contract_pay, effective_date) FROM stdin;
HR-SAL-2025-398926	\N	65000.00	\N	\N	\N	\N	2025-03-01
HR-SAL-2025-f3f2af	\N	37000.00	\N	\N	\N	\N	2025-03-01
HR-SAL-2025-906d67	\N	32000.00	\N	\N	\N	\N	2025-03-01
HR-SAL-2025-72fc5a	\N	31000.00	\N	\N	\N	\N	2025-03-01
HR-SAL-2025-592fbf	\N	30000.00	\N	\N	\N	\N	2025-03-01
HR-SAL-2025-9d9c6d	\N	27500.00	\N	\N	\N	\N	2025-03-01
HR-SAL-2025-92e89d	\N	43000.00	\N	\N	\N	\N	2025-03-01
HR-SAL-2025-2006e2	\N	29000.00	\N	\N	\N	\N	2025-03-01
HR-SAL-2025-4fac5c	\N	45000.00	\N	\N	\N	\N	2025-03-01
HR-SAL-2025-b803ea	\N	\N	Hourly	180.00	160.00	28800.00	2025-03-01
HR-SAL-2025-819aa7	\N	\N	Daily	1200.00	20.00	24000.00	2025-03-01
HR-SAL-2025-0514c9	\N	65000.00	\N	\N	\N	\N	2025-03-01
HR-SAL-2025-b849da	\N	37000.00	\N	\N	\N	\N	2025-03-01
HR-SAL-2025-966f3d	\N	32000.00	\N	\N	\N	\N	2025-03-01
HR-SAL-2025-08f96b	\N	31000.00	\N	\N	\N	\N	2025-03-01
HR-SAL-2025-f3d59e	\N	30000.00	\N	\N	\N	\N	2025-03-01
HR-SAL-2025-715639	\N	27500.00	\N	\N	\N	\N	2025-03-01
HR-SAL-2025-05f26f	\N	43000.00	\N	\N	\N	\N	2025-03-01
HR-SAL-2025-cd5084	\N	29000.00	\N	\N	\N	\N	2025-03-01
HR-SAL-2025-6d3a58	\N	45000.00	\N	\N	\N	\N	2025-03-01
HR-SAL-2025-d423d5	\N	\N	Hourly	180.00	160.00	28800.00	2025-03-01
HR-SAL-2025-d8173e	\N	\N	Daily	1200.00	20.00	24000.00	2025-03-01
\.


--
-- Data for Name: employees; Type: TABLE DATA; Schema: human_resources; Owner: postgres
--

COPY human_resources.employees (employee_id, dept_id, first_name, last_name, email, phone, job_title, employment_type, status, updated_at) FROM stdin;
HR-EMP-2025-d0f07f	\N	Kate	Tan	katetan@kinetic.ph	09165824756	Chief Accountant	Permanent	Active	2025-03-23 10:19:43.959748
HR-EMP-2025-f8e7db	\N	James	Marticio	jamesmarticio@kinetic.ph	09123456789	Accounting Supervisor	Permanent	Active	2025-03-23 10:19:43.959748
HR-EMP-2025-cb0e4c	\N	Robert	Santiago	robertsantiago@kinetic.ph	09187654321	Accounts Payable Specialist	Permanent	Active	2025-03-23 10:19:43.959748
HR-EMP-2025-fa5c60	\N	Maria	Lopez	marialopez@kinetic.ph	09154321876	Accounts Receivable Specialist	Permanent	Active	2025-03-23 10:19:43.959748
HR-EMP-2025-3fea02	\N	David	Cruz	davidcruz@kinetic.ph	09192837465	Payroll Officer	Permanent	Active	2025-03-23 10:19:43.959748
HR-EMP-2025-017a92	\N	Carla	Ramirez	carlaramirez@kinetic.ph	09175648392	Bookkeeper	Permanent	Active	2025-03-23 10:19:43.959748
HR-EMP-2025-075b42	\N	Miguel	Narabal	miguelnarabal@kinetic.ph	09164738291	Bookkeeper	Contractual	Active	2025-03-23 10:19:43.959748
HR-EMP-2025-7e52c0	\N	Angela	Tores	angelatores@kinetic.ph	09183948572	Financial Analyst	Permanent	Active	2025-03-23 10:19:43.959748
HR-EMP-2025-c1e1e3	\N	Henry	Vallespin	henryvallespin@kinetic.ph	09195847263	Audit Officer	Permanent	Active	2025-03-23 10:19:43.959748
HR-EMP-2025-2f4115	\N	Liza	Domingo	lizadomingo@kinetic.ph	09172345678	Tax Consultant	Contractual	Active	2025-03-23 10:19:43.959748
HR-EMP-2025-40af3a	\N	Karen	Mendoza	karenmendoza@kinetic.ph	09139485762	Administrative Manager	Permanent	Active	2025-03-23 10:19:43.959748
HR-EMP-2025-f0cffe	HR-DEPT-2025-e34825	Arthur	Morgan	arthurmorgan@kinetiq.ph	\N	Sales Representative	Permanent	Active	2025-03-23 02:22:10
HR-EMP-2025-b15e2f	HR-DEPT-2025-e34825	John	Marston	johnmarston@kinetiq.ph	\N	Sales Representative	Permanent	Active	2025-03-23 02:22:34
HR-EMP-2025-9e7313	HR-DEPT-2025-e34825	Jordan	Belfort	jordanbelfort@kinetiq.ph	\N	Sales Representative	Permanent	Active	2025-03-23 02:22:57
\.


--
-- Data for Name: interviews; Type: TABLE DATA; Schema: human_resources; Owner: postgres
--

COPY human_resources.interviews (interview_id, candidate_id, interviewer_id, interview_date, status, feedback, created_at) FROM stdin;
HR-INT-2025-b19358	\N	\N	2025-03-15 10:00:00	Scheduled	\N	2025-03-23 10:19:43.96737
HR-INT-2025-e279b3	\N	\N	2025-03-15 13:00:00	Scheduled	\N	2025-03-23 10:19:43.96737
HR-INT-2025-e799dc	\N	\N	2025-03-16 09:30:00	Scheduled	\N	2025-03-23 10:19:43.96737
HR-INT-2025-a952e8	\N	\N	2025-03-16 14:00:00	Scheduled	\N	2025-03-23 10:19:43.96737
HR-INT-2025-84499f	\N	\N	2025-03-17 11:00:00	Scheduled	\N	2025-03-23 10:19:43.96737
HR-INT-2025-a801a0	\N	\N	2025-03-15 10:00:00	Scheduled	\N	2025-03-23 10:19:44.101717
HR-INT-2025-a278d5	\N	\N	2025-03-15 13:00:00	Scheduled	\N	2025-03-23 10:19:44.101717
HR-INT-2025-a96d8e	\N	\N	2025-03-16 09:30:00	Scheduled	\N	2025-03-23 10:19:44.101717
HR-INT-2025-274632	\N	\N	2025-03-16 14:00:00	Scheduled	\N	2025-03-23 10:19:44.101717
HR-INT-2025-4ba62f	\N	\N	2025-03-17 11:00:00	Scheduled	\N	2025-03-23 10:19:44.101717
\.


--
-- Data for Name: job_posting; Type: TABLE DATA; Schema: human_resources; Owner: postgres
--

COPY human_resources.job_posting (job_id, request_id, dept_id, "position", description, requirements, employment_type, contract_duration, contract_rate, contract_pay_type, status, created_at) FROM stdin;
HR-JOB-2025-6f36b9	\N	\N	Junior Accountant	Assist in financial record-keeping and report preparation.	Bachelor’s degree in Accounting, 1+ years experience, CPA preferred.	Permanent	\N	\N	\N	Open	2025-03-23 10:19:43.964674
HR-JOB-2025-1b4014	\N	\N	Administrative Assistant	Support office operations, manage schedules, and handle correspondence.	High school diploma or equivalent, proficient in MS Office, strong communication skills.	Contractual	6	18000.00	Fixed	Open	2025-03-23 10:19:43.964674
HR-JOB-2025-655c52	\N	\N	Logistics Coordinator	Oversee transportation and delivery of goods.	Experience in distribution/logistics, knowledge of inventory software.	Permanent	\N	\N	\N	Open	2025-03-23 10:19:43.964674
HR-JOB-2025-19e9af	\N	\N	Finance Analyst	Analyze financial data and assist in decision-making.	Degree in Finance or Accounting, 2+ years experience, strong analytical skills.	Permanent	\N	\N	\N	Open	2025-03-23 10:19:43.964674
HR-JOB-2025-f8b9bf	\N	\N	Recruitment Specialist	Handle end-to-end recruitment process.	Degree in HR or Psychology, experience in talent acquisition.	Contractual	12	25000.00	Fixed	Open	2025-03-23 10:19:43.964674
HR-JOB-2025-1bd2d7	\N	\N	Inventory Supervisor	Manage stock levels and ensure inventory accuracy.	Experience in inventory control, knowledge of ERP systems.	Permanent	\N	\N	\N	Open	2025-03-23 10:19:43.964674
HR-JOB-2025-0ffb68	\N	\N	Business Strategy Consultant	Develop and optimize business strategies.	MBA preferred, 5+ years experience in corporate strategy.	Contractual	24	120000.00	Fixed	Open	2025-03-23 10:19:43.964674
HR-JOB-2025-3c3d77	\N	\N	Material Planning Officer	Ensure timely procurement and availability of materials.	Degree in Supply Chain or related field, experience in planning.	Permanent	\N	\N	\N	Open	2025-03-23 10:19:43.964674
HR-JOB-2025-b35e7c	\N	\N	Operations Supervisor	Oversee daily operations and manage staff.	Experience in operations management, leadership skills.	Permanent	\N	\N	\N	Open	2025-03-23 10:19:43.964674
HR-JOB-2025-bb78d1	\N	\N	Production Line Worker	Work on the manufacturing assembly line.	No experience required, physically fit, willing to work shifts.	Contractual	3	500.00	Daily	Open	2025-03-23 10:19:43.964674
HR-JOB-2025-b902c2	\N	\N	Junior Accountant	Assist in financial record-keeping and report preparation.	Bachelor’s degree in Accounting, 1+ years experience, CPA preferred.	Permanent	\N	\N	\N	Open	2025-03-23 10:19:44.098512
HR-JOB-2025-355994	\N	\N	Administrative Assistant	Support office operations, manage schedules, and handle correspondence.	High school diploma or equivalent, proficient in MS Office, strong communication skills.	Contractual	6	18000.00	Fixed	Open	2025-03-23 10:19:44.098512
HR-JOB-2025-71ad2d	\N	\N	Logistics Coordinator	Oversee transportation and delivery of goods.	Experience in distribution/logistics, knowledge of inventory software.	Permanent	\N	\N	\N	Open	2025-03-23 10:19:44.098512
HR-JOB-2025-75f413	\N	\N	Finance Analyst	Analyze financial data and assist in decision-making.	Degree in Finance or Accounting, 2+ years experience, strong analytical skills.	Permanent	\N	\N	\N	Open	2025-03-23 10:19:44.098512
HR-JOB-2025-6e8958	\N	\N	Recruitment Specialist	Handle end-to-end recruitment process.	Degree in HR or Psychology, experience in talent acquisition.	Contractual	12	25000.00	Fixed	Open	2025-03-23 10:19:44.098512
HR-JOB-2025-d87278	\N	\N	Inventory Supervisor	Manage stock levels and ensure inventory accuracy.	Experience in inventory control, knowledge of ERP systems.	Permanent	\N	\N	\N	Open	2025-03-23 10:19:44.098512
HR-JOB-2025-3cded6	\N	\N	Business Strategy Consultant	Develop and optimize business strategies.	MBA preferred, 5+ years experience in corporate strategy.	Contractual	24	120000.00	Fixed	Open	2025-03-23 10:19:44.098512
HR-JOB-2025-c62d48	\N	\N	Material Planning Officer	Ensure timely procurement and availability of materials.	Degree in Supply Chain or related field, experience in planning.	Permanent	\N	\N	\N	Open	2025-03-23 10:19:44.098512
HR-JOB-2025-7dbee6	\N	\N	Operations Supervisor	Oversee daily operations and manage staff.	Experience in operations management, leadership skills.	Permanent	\N	\N	\N	Open	2025-03-23 10:19:44.098512
HR-JOB-2025-ae21ba	\N	\N	Production Line Worker	Work on the manufacturing assembly line.	No experience required, physically fit, willing to work shifts.	Contractual	3	500.00	Daily	Open	2025-03-23 10:19:44.098512
\.


--
-- Data for Name: leave_requests; Type: TABLE DATA; Schema: human_resources; Owner: postgres
--

COPY human_resources.leave_requests (leave_id, employee_id, dept_id, immediate_superior_id, management_approval_id, leave_type, start_date, end_date, is_paid, status, updated_at) FROM stdin;
HR-LV-2025-5b0283	\N	\N	\N	\N	Sick	2025-03-01	2025-03-03	t	Approved by Superior	2025-03-23 10:19:43.962312
HR-LV-2025-23bd62	\N	\N	\N	\N	Vacation	2025-04-10	2025-04-14	t	Approved by Superior	2025-03-23 10:19:43.962312
HR-LV-2025-78f89e	\N	\N	\N	\N	Personal	2025-05-02	2025-05-02	t	Rejected by Superior	2025-03-23 10:19:43.962312
HR-LV-2025-b90df4	\N	\N	\N	\N	Maternity	2025-06-01	2025-08-01	t	Approved by Management	2025-03-23 10:19:43.962312
HR-LV-2025-0baf55	\N	\N	\N	\N	Paternity	2025-07-15	2025-07-20	t	Approved by Management	2025-03-23 10:19:43.962312
HR-LV-2025-a76bd3	\N	\N	\N	\N	Sick	2025-03-05	2025-03-07	t	Recorded in HRIS	2025-03-23 10:19:43.962312
HR-LV-2025-e0b72a	\N	\N	\N	\N	Unpaid	2025-03-18	2025-03-19	f	Approved by Superior	2025-03-23 10:19:43.962312
HR-LV-2025-af1a56	\N	\N	\N	\N	Personal	2025-04-01	2025-04-02	t	Pending	2025-03-23 10:19:43.962312
HR-LV-2025-0f98b5	\N	\N	\N	\N	Vacation	2025-05-15	2025-05-22	t	Pending	2025-03-23 10:19:43.962312
HR-LV-2025-f7b001	\N	\N	\N	\N	Unpaid	2025-06-10	2025-06-12	f	Rejected by Management	2025-03-23 10:19:43.962312
HR-LV-2025-d74237	\N	\N	\N	\N	Sick	2025-03-01	2025-03-03	t	Approved by Superior	2025-03-23 10:19:44.097101
HR-LV-2025-41578a	\N	\N	\N	\N	Vacation	2025-04-10	2025-04-14	t	Approved by Superior	2025-03-23 10:19:44.097101
HR-LV-2025-4d1960	\N	\N	\N	\N	Personal	2025-05-02	2025-05-02	t	Rejected by Superior	2025-03-23 10:19:44.097101
HR-LV-2025-11da21	\N	\N	\N	\N	Maternity	2025-06-01	2025-08-01	t	Approved by Management	2025-03-23 10:19:44.097101
HR-LV-2025-8f1831	\N	\N	\N	\N	Paternity	2025-07-15	2025-07-20	t	Approved by Management	2025-03-23 10:19:44.097101
HR-LV-2025-894a78	\N	\N	\N	\N	Sick	2025-03-05	2025-03-07	t	Recorded in HRIS	2025-03-23 10:19:44.097101
HR-LV-2025-cd3b9e	\N	\N	\N	\N	Unpaid	2025-03-18	2025-03-19	f	Approved by Superior	2025-03-23 10:19:44.097101
HR-LV-2025-7282a9	\N	\N	\N	\N	Personal	2025-04-01	2025-04-02	t	Pending	2025-03-23 10:19:44.097101
HR-LV-2025-59a7a7	\N	\N	\N	\N	Vacation	2025-05-15	2025-05-22	t	Pending	2025-03-23 10:19:44.097101
HR-LV-2025-6686d1	\N	\N	\N	\N	Unpaid	2025-06-10	2025-06-12	f	Rejected by Management	2025-03-23 10:19:44.097101
\.


--
-- Data for Name: payroll; Type: TABLE DATA; Schema: human_resources; Owner: postgres
--

COPY human_resources.payroll (payroll_id, employee_id, employment_type, base_salary, work_days, contract_pay_type, contract_pay_rate, total_hours_worked, total_contract_pay, overtime_hours, overtime_pay, undertime_hours, undertime_deductions, unpaid_leave_days, leave_deductions, taxable_income, tax, sss_deduction, philhealth_deduction, pagibig_deduction, thirteenth_month_pay, performance_bonus, net_salary, payment_date, payment_status) FROM stdin;
HR-PAY-2025-3f3191	\N	Permanent	65000.00	22	\N	\N	\N	\N	5.00	2500.00	2.00	1000.00	1	2954.55	58545.45	5854.55	3250.00	3250.00	1300.00	5416.67	7800.00	53557.57	2025-03-01	Processed
HR-PAY-2025-97a9af	\N	Permanent	37000.00	22	\N	\N	\N	\N	3.00	1350.00	1.00	500.00	0	0.00	35150.00	3515.00	1850.00	1850.00	740.00	3083.33	2775.00	31478.33	2025-03-01	Processed
HR-PAY-2025-4d8ab9	\N	Permanent	32000.00	22	\N	\N	\N	\N	2.00	800.00	0.00	0.00	0	0.00	32000.00	3200.00	1600.00	1600.00	640.00	2666.67	1600.00	27026.67	2025-03-01	Processed
HR-PAY-2025-c2cee5	\N	Permanent	31000.00	22	\N	\N	\N	\N	4.00	1600.00	1.00	500.00	0	0.00	29900.00	2990.00	1550.00	1550.00	620.00	2583.33	1550.00	26423.33	2025-03-01	Processed
HR-PAY-2025-e81d4c	\N	Permanent	30000.00	22	\N	\N	\N	\N	3.00	1200.00	0.00	0.00	2	2727.27	26072.73	2607.27	1500.00	1500.00	600.00	2500.00	1500.00	23065.46	2025-03-01	Processed
HR-PAY-2025-be9b9f	\N	Permanent	27500.00	22	\N	\N	\N	\N	1.00	400.00	0.00	0.00	0	0.00	27500.00	2750.00	1375.00	1375.00	550.00	2291.67	1375.00	22646.67	2025-03-01	Processed
HR-PAY-2025-5ee505	\N	Permanent	43000.00	22	\N	\N	\N	\N	5.00	2000.00	2.00	1000.00	0	0.00	42000.00	4200.00	2150.00	2150.00	860.00	3583.33	3225.00	34958.33	2025-03-01	Processed
HR-PAY-2025-0474d6	\N	Permanent	29000.00	22	\N	\N	\N	\N	2.00	800.00	0.00	0.00	0	0.00	29000.00	2900.00	1450.00	1450.00	580.00	2416.67	1450.00	24386.67	2025-03-01	Processed
HR-PAY-2025-404f65	\N	Contractual	\N	\N	Hourly	180.00	160.00	28800.00	5.00	900.00	1.00	180.00	0	0.00	29620.00	2962.00	1440.00	1440.00	576.00	0.00	0.00	23202.00	2025-03-01	Processed
HR-PAY-2025-8ed2bf	\N	Contractual	\N	\N	Daily	1200.00	20.00	24000.00	3.00	3600.00	0.00	0.00	0	0.00	27600.00	2760.00	1200.00	1200.00	480.00	0.00	0.00	21560.00	2025-03-01	Processed
HR-PAY-2025-c3139a	\N	Permanent	65000.00	22	\N	\N	\N	\N	5.00	2500.00	2.00	1000.00	1	2954.55	58545.45	5854.55	3250.00	3250.00	1300.00	5416.67	7800.00	53557.57	2025-03-01	Processed
HR-PAY-2025-393a08	\N	Permanent	37000.00	22	\N	\N	\N	\N	3.00	1350.00	1.00	500.00	0	0.00	35150.00	3515.00	1850.00	1850.00	740.00	3083.33	2775.00	31478.33	2025-03-01	Processed
HR-PAY-2025-d38689	\N	Permanent	32000.00	22	\N	\N	\N	\N	2.00	800.00	0.00	0.00	0	0.00	32000.00	3200.00	1600.00	1600.00	640.00	2666.67	1600.00	27026.67	2025-03-01	Processed
HR-PAY-2025-feadc4	\N	Permanent	31000.00	22	\N	\N	\N	\N	4.00	1600.00	1.00	500.00	0	0.00	29900.00	2990.00	1550.00	1550.00	620.00	2583.33	1550.00	26423.33	2025-03-01	Processed
HR-PAY-2025-9ab7b7	\N	Permanent	30000.00	22	\N	\N	\N	\N	3.00	1200.00	0.00	0.00	2	2727.27	26072.73	2607.27	1500.00	1500.00	600.00	2500.00	1500.00	23065.46	2025-03-01	Processed
HR-PAY-2025-837b33	\N	Permanent	27500.00	22	\N	\N	\N	\N	1.00	400.00	0.00	0.00	0	0.00	27500.00	2750.00	1375.00	1375.00	550.00	2291.67	1375.00	22646.67	2025-03-01	Processed
HR-PAY-2025-9f7565	\N	Permanent	43000.00	22	\N	\N	\N	\N	5.00	2000.00	2.00	1000.00	0	0.00	42000.00	4200.00	2150.00	2150.00	860.00	3583.33	3225.00	34958.33	2025-03-01	Processed
HR-PAY-2025-315f5d	\N	Permanent	29000.00	22	\N	\N	\N	\N	2.00	800.00	0.00	0.00	0	0.00	29000.00	2900.00	1450.00	1450.00	580.00	2416.67	1450.00	24386.67	2025-03-01	Processed
HR-PAY-2025-065cd4	\N	Contractual	\N	\N	Hourly	180.00	160.00	28800.00	5.00	900.00	1.00	180.00	0	0.00	29620.00	2962.00	1440.00	1440.00	576.00	0.00	0.00	23202.00	2025-03-01	Processed
HR-PAY-2025-ab79a7	\N	Contractual	\N	\N	Daily	1200.00	20.00	24000.00	3.00	3600.00	0.00	0.00	0	0.00	27600.00	2760.00	1200.00	1200.00	480.00	0.00	0.00	21560.00	2025-03-01	Processed
\.


--
-- Data for Name: workforce_allocation; Type: TABLE DATA; Schema: human_resources; Owner: postgres
--

COPY human_resources.workforce_allocation (allocation_id, requesting_dept_id, employee_id, current_dept_id, reason, approval_status, status, start_date, end_date, approval_date) FROM stdin;
HR-ALLOC-2025-5065d3	\N	\N	\N	Temporary assignment to assist with financial reconciliation for a major project.	Approved	Completed	2025-02-01	2025-02-28	2025-03-23 10:19:43.96349
HR-ALLOC-2025-722dff	\N	\N	\N	Payroll Officer assigned to help with operational budgeting.	Approved	Completed	2025-01-15	2025-01-31	2025-03-23 10:19:43.96349
HR-ALLOC-2025-ed74e3	\N	\N	\N	Supervisory expertise needed for budget restructuring.	Pending	Active	2025-03-10	\N	2025-03-23 10:19:43.96349
HR-ALLOC-2025-191cb7	\N	\N	\N	Bookkeeper assisting with purchasing audit.	Approved	Active	2025-03-05	2025-03-15	2025-03-23 10:19:43.96349
HR-ALLOC-2025-f70e33	\N	\N	\N	Financial Analyst required for material resource planning.	Rejected	Canceled	2025-02-20	2025-03-05	2025-03-23 10:19:43.96349
HR-ALLOC-2025-67d4e0	\N	\N	\N	Bookkeeper support for production cost analysis.	Approved	Active	2025-03-01	2025-03-20	2025-03-23 10:19:43.96349
HR-ALLOC-2025-7a8927	\N	\N	\N	Accounts Receivable Specialist temporarily assigned for inventory reconciliation.	Pending	Active	2025-03-08	\N	2025-03-23 10:19:43.96349
HR-ALLOC-2025-7ad358	\N	\N	\N	Audit Officer assisting distribution finance team.	Approved	Completed	2025-01-05	2025-01-25	2025-03-23 10:19:43.96349
HR-ALLOC-2025-dbd5fc	\N	\N	\N	Tax Consultant supporting sales tax review.	Approved	Completed	2025-02-10	2025-02-28	2025-03-23 10:19:43.96349
HR-ALLOC-2025-c7f422	\N	\N	\N	Chief Accountant assigned to oversee HR payroll compliance.	Rejected	Canceled	2025-02-15	2025-03-10	2025-03-23 10:19:43.96349
HR-ALLOC-2025-8d9f22	\N	\N	\N	Temporary assignment to assist with financial reconciliation for a major project.	Approved	Completed	2025-02-01	2025-02-28	2025-03-23 10:19:44.09779
HR-ALLOC-2025-0ede28	\N	\N	\N	Payroll Officer assigned to help with operational budgeting.	Approved	Completed	2025-01-15	2025-01-31	2025-03-23 10:19:44.09779
HR-ALLOC-2025-dbdda9	\N	\N	\N	Supervisory expertise needed for budget restructuring.	Pending	Active	2025-03-10	\N	2025-03-23 10:19:44.09779
HR-ALLOC-2025-b674d7	\N	\N	\N	Bookkeeper assisting with purchasing audit.	Approved	Active	2025-03-05	2025-03-15	2025-03-23 10:19:44.09779
HR-ALLOC-2025-4decc2	\N	\N	\N	Financial Analyst required for material resource planning.	Rejected	Canceled	2025-02-20	2025-03-05	2025-03-23 10:19:44.09779
HR-ALLOC-2025-941b53	\N	\N	\N	Bookkeeper support for production cost analysis.	Approved	Active	2025-03-01	2025-03-20	2025-03-23 10:19:44.09779
HR-ALLOC-2025-28a506	\N	\N	\N	Accounts Receivable Specialist temporarily assigned for inventory reconciliation.	Pending	Active	2025-03-08	\N	2025-03-23 10:19:44.09779
HR-ALLOC-2025-1d7c6e	\N	\N	\N	Audit Officer assisting distribution finance team.	Approved	Completed	2025-01-05	2025-01-25	2025-03-23 10:19:44.09779
HR-ALLOC-2025-847e12	\N	\N	\N	Tax Consultant supporting sales tax review.	Approved	Completed	2025-02-10	2025-02-28	2025-03-23 10:19:44.09779
HR-ALLOC-2025-3a66c5	\N	\N	\N	Chief Accountant assigned to oversee HR payroll compliance.	Rejected	Canceled	2025-02-15	2025-03-10	2025-03-23 10:19:44.09779
\.


--
-- Data for Name: deprecation_report; Type: TABLE DATA; Schema: inventory; Owner: postgres
--

COPY inventory.deprecation_report (deprecation_report_id, item_id, content_id, quantity, reported_date, status, warehouse_id, employee_id) FROM stdin;
INV-DR-2025-4c82a8	\N	\N	5	2023-10-09 18:00:00	Pending	\N	\N
INV-DR-2025-8004d8	\N	\N	10	2023-10-10 19:00:00	Approved	\N	\N
INV-DR-2025-566eed	\N	\N	2	2023-10-11 20:00:00	Pending	\N	\N
INV-DR-2025-e85b24	\N	\N	1	2023-10-12 21:00:00	Approved	\N	\N
INV-DR-2025-519997	\N	\N	5	2023-10-09 18:00:00	Pending	\N	\N
INV-DR-2025-7a89bd	\N	\N	10	2023-10-10 19:00:00	Approved	\N	\N
INV-DR-2025-19b71b	\N	\N	2	2023-10-11 20:00:00	Pending	\N	\N
INV-DR-2025-a30a4e	\N	\N	1	2023-10-12 21:00:00	Approved	\N	\N
\.


--
-- Data for Name: inventory_adjustments; Type: TABLE DATA; Schema: inventory; Owner: postgres
--

COPY inventory.inventory_adjustments (adjustment_id, item_id, adjustment_type, quantity, adjustment_date, employee_id) FROM stdin;
INV-IA-2025-a3f544	\N	Inbound	20	2023-10-05 14:00:00	\N
INV-IA-2025-928bc2	\N	Outbound-Distribution	10	2023-10-06 15:00:00	\N
INV-IA-2025-bd386b	\N	Outbound-Production	5	2023-10-07 16:00:00	\N
INV-IA-2025-52fa1f	\N	Outbound-Deprecated	3	2023-10-08 17:00:00	\N
INV-IA-2025-96e1f4	\N	Inbound	20	2023-10-05 14:00:00	\N
INV-IA-2025-902894	\N	Outbound-Distribution	10	2023-10-06 15:00:00	\N
INV-IA-2025-64b3e8	\N	Outbound-Production	5	2023-10-07 16:00:00	\N
INV-IA-2025-2bd050	\N	Outbound-Deprecated	3	2023-10-08 17:00:00	\N
\.


--
-- Data for Name: inventory_cyclic_counts; Type: TABLE DATA; Schema: inventory; Owner: postgres
--

COPY inventory.inventory_cyclic_counts (inventory_count_id, item_md_id, item_onhand, item_actually_counted, difference_in_qty, employee_id, status, remarks, time_period) FROM stdin;
INV-ICC-2025-9ca8ed	1	50	48	-2	\N	Completed	Routine check	monthly
INV-ICC-2025-36dbd1	2	30	30	0	\N	Open	Initial count	weekly
INV-ICC-2025-1e7360	3	70	68	-2	\N	In Progress	Mid-year audit	quarterly
INV-ICC-2025-2cd9dc	4	100	95	-5	\N	Closed	End of year review	yearly
INV-ICC-2025-75a978	1	50	48	-2	\N	Completed	Routine check	monthly
INV-ICC-2025-8c1abf	2	30	30	0	\N	Open	Initial count	weekly
INV-ICC-2025-e2f4c3	3	70	68	-2	\N	In Progress	Mid-year audit	quarterly
INV-ICC-2025-418087	4	100	95	-5	\N	Closed	End of year review	yearly
\.


--
-- Data for Name: inventory_item; Type: TABLE DATA; Schema: inventory; Owner: postgres
--

COPY inventory.inventory_item (inventory_item_id, item_id, content_id, expiry_date, unit_cost, unit_of_measure, item_status, warehouse_id) FROM stdin;
INV-II-2025-6f41fc	\N	\N	2025-12-31	10.500	bottle	Available	\N
INV-II-2025-7f9f3e	\N	\N	2024-06-30	15.750	box	On Order	\N
INV-II-2025-19c0eb	\N	\N	2023-11-15	8.250	packet	Committed	\N
INV-II-2025-59b2d6	\N	\N	2026-01-01	20.000	carton	Available	\N
INV-II-2025-863044	\N	\N	2025-12-31	10.500	bottle	Available	\N
INV-II-2025-bbd929	\N	\N	2024-06-30	15.750	box	On Order	\N
INV-II-2025-a3375e	\N	\N	2023-11-15	8.250	packet	Committed	\N
INV-II-2025-0d0842	\N	\N	2026-01-01	20.000	carton	Available	\N
\.


--
-- Data for Name: inventory_item_master_data; Type: TABLE DATA; Schema: inventory; Owner: postgres
--

COPY inventory.inventory_item_master_data (item_md_id, item_id, content_id, minimum_threshold, maximum_threshold, total_stock, stock_on_order, stock_committed, available_stock, last_update) FROM stdin;
INV-IIMD-2025-342b4b	\N	CONT001	10	100	50	20	5	25	2023-10-01 10:00:00
INV-IIMD-2025-6b72c2	\N	CONT002	5	50	30	10	2	18	2023-10-02 11:00:00
INV-IIMD-2025-a34826	\N	CONT003	15	150	70	25	10	35	2023-10-03 12:00:00
INV-IIMD-2025-7866f7	\N	CONT004	20	200	100	30	15	55	2023-10-04 13:00:00
INV-IIMD-2025-2096fd	\N	CONT001	10	100	50	20	5	25	2023-10-01 10:00:00
INV-IIMD-2025-5a29ec	\N	CONT002	5	50	30	10	2	18	2023-10-02 11:00:00
INV-IIMD-2025-00f11c	\N	CONT003	15	150	70	25	10	35	2023-10-03 12:00:00
INV-IIMD-2025-85c827	\N	CONT004	20	200	100	30	15	55	2023-10-04 13:00:00
\.


--
-- Data for Name: warehouse_movement; Type: TABLE DATA; Schema: inventory; Owner: postgres
--

COPY inventory.warehouse_movement (movement_id, item_id, movement_type, quantity, movement_date, destination, source, reference_id_purchase_order, reference_id_order) FROM stdin;
INV-WM-2025-f9e23a	\N	Inbound	50	2023-10-13 22:00:00	\N	\N	\N	\N
INV-WM-2025-d6055a	\N	Outbound	30	2023-10-14 23:00:00	\N	\N	\N	\N
INV-WM-2025-23096f	\N	Transfer	20	2023-10-15 08:00:00	\N	\N	\N	\N
INV-WM-2025-1856c5	\N	Adjustment	10	2023-10-16 09:00:00	\N	\N	\N	\N
INV-WM-2025-dce67a	\N	Inbound	50	2023-10-13 22:00:00	\N	\N	\N	\N
INV-WM-2025-8620ae	\N	Outbound	30	2023-10-14 23:00:00	\N	\N	\N	\N
INV-WM-2025-385f2d	\N	Transfer	20	2023-10-15 08:00:00	\N	\N	\N	\N
INV-WM-2025-dc4241	\N	Adjustment	10	2023-10-16 09:00:00	\N	\N	\N	\N
\.


--
-- Data for Name: management_approvals; Type: TABLE DATA; Schema: management; Owner: postgres
--

COPY management.management_approvals (approval_id, request_id, checked_id, decision_date, issue_date, checked_by, checked_date, status, due_date, remarks) FROM stdin;
MNG-APP-2025-8206fc	REQ-2025-123456	CHK-2025-111111	2025-03-15	2025-03-10	Juan Dela Cruz	2025-03-12	approved	2025-03-20	Approved after review.
MNG-APP-2025-170da1	REQ-2025-223456	CHK-2025-222222	2025-03-16	2025-03-11	Maria Santos	2025-03-13	pending	2025-03-25	Pending further verification.
MNG-APP-2025-0053ab	REQ-2025-323456	CHK-2025-333333	2025-03-17	2025-03-12	John Stephen	2025-03-14	rejected	2025-03-18	Rejected due to incomplete documents.
MNG-APP-2025-e55747	REQ-2025-423456	CHK-2025-444444	2025-03-18	2025-03-14	Jolina Estiamba	2025-03-15	approved	2025-03-22	Approved after additional checks.
MNG-APP-2025-19edca	REQ-2025-523456	CHK-2025-555555	2025-03-19	2025-03-15	Athena Moises	2025-03-16	approved	2025-03-21	Approved without issues.
MNG-APP-2025-6fddbf	REQ-2025-623456	CHK-2025-666666	2025-03-20	2025-03-16	Gabriela Silang	2025-03-17	pending	2025-03-23	Pending further information.
MNG-APP-2025-5edfb4	REQ-2025-723456	CHK-2025-777777	2025-03-21	2025-03-17	Diego Silang	2025-03-18	rejected	2025-03-24	Rejected due to non-compliance.
MNG-APP-2025-460054	REQ-2025-823456	CHK-2025-888888	2025-03-22	2025-03-18	Jeffrey Bugarin	2025-03-19	approved	2025-03-26	Approved after successful review.
MNG-APP-2025-d42cfe	REQ-2025-923456	CHK-2025-999999	2025-03-23	2025-03-19	Shawn Moises	2025-03-20	pending	2025-03-27	Pending confirmation from department.
MNG-APP-2025-16cabb	REQ-2025-023456	CHK-2025-000000	2025-03-24	2025-03-20	Omega Bugarin	2025-03-21	approved	2025-03-28	Approved after final inspection.
MNG-APP-2025-0488d9	REQ-2025-123456	CHK-2025-111111	2025-03-15	2025-03-10	Juan Dela Cruz	2025-03-12	approved	2025-03-20	Approved after review.
MNG-APP-2025-0cf996	REQ-2025-223456	CHK-2025-222222	2025-03-16	2025-03-11	Maria Santos	2025-03-13	pending	2025-03-25	Pending further verification.
MNG-APP-2025-3316c9	REQ-2025-323456	CHK-2025-333333	2025-03-17	2025-03-12	John Stephen	2025-03-14	rejected	2025-03-18	Rejected due to incomplete documents.
MNG-APP-2025-f67dcc	REQ-2025-423456	CHK-2025-444444	2025-03-18	2025-03-14	Jolina Estiamba	2025-03-15	approved	2025-03-22	Approved after additional checks.
MNG-APP-2025-fa2f24	REQ-2025-523456	CHK-2025-555555	2025-03-19	2025-03-15	Athena Moises	2025-03-16	approved	2025-03-21	Approved without issues.
MNG-APP-2025-28abb7	REQ-2025-623456	CHK-2025-666666	2025-03-20	2025-03-16	Gabriela Silang	2025-03-17	pending	2025-03-23	Pending further information.
MNG-APP-2025-ab430e	REQ-2025-723456	CHK-2025-777777	2025-03-21	2025-03-17	Diego Silang	2025-03-18	rejected	2025-03-24	Rejected due to non-compliance.
MNG-APP-2025-e99886	REQ-2025-823456	CHK-2025-888888	2025-03-22	2025-03-18	Jeffrey Bugarin	2025-03-19	approved	2025-03-26	Approved after successful review.
MNG-APP-2025-c80cc8	REQ-2025-923456	CHK-2025-999999	2025-03-23	2025-03-19	Shawn Moises	2025-03-20	pending	2025-03-27	Pending confirmation from department.
MNG-APP-2025-bf6da0	REQ-2025-023456	CHK-2025-000000	2025-03-24	2025-03-20	Omega Bugarin	2025-03-21	approved	2025-03-28	Approved after final inspection.
\.


--
-- Data for Name: bill_of_materials; Type: TABLE DATA; Schema: mrp; Owner: postgres
--

COPY mrp.bill_of_materials (bom_id, product_id, material_id, product_description, unit_of_measure, specific_notes, quantity_of_unit, cost_per_raw_material, total_cost_of_raw_materials) FROM stdin;
MRP-BOM-2025-995ec6	\N	\N	steel frame	kg	high strength	10	50.00	500.00
MRP-BOM-2025-9ed27e	\N	\N	plastic cover	kg	lightweight	5	90.00	450.00
MRP-BOM-2025-d7842b	\N	\N	aluminum rod	kg	corrosion resistant	8	87.50	700.00
MRP-BOM-2025-b64b19	\N	\N	copper wire	m	high conductivity	12	30.00	360.00
MRP-BOM-2025-0e9514	\N	\N	rubber gasket	unit	durable	20	5.00	100.00
MRP-BOM-2025-27120b	\N	\N	glass panel	sqm	tempered	3	200.00	600.00
MRP-BOM-2025-9251dd	\N	\N	wooden plank	m	hardwood	15	40.00	600.00
MRP-BOM-2025-79784e	\N	\N	ceramic tile	sqm	glazed	10	25.00	250.00
MRP-BOM-2025-f8cc59	\N	\N	pvc pipe	m	flexible	30	10.00	300.00
MRP-BOM-2025-66231b	\N	\N	carbon fiber sheet	sqm	lightweight	2	500.00	1000.00
MRP-BOM-2025-65697d	\N	\N	steel bolts	kg	stainless steel	15	35.00	525.00
MRP-BOM-2025-55db9a	\N	\N	plastic resin	kg	high quality	25	45.00	1125.00
MRP-BOM-2025-f046ef	\N	\N	copper tubing	m	heat resistant	18	70.00	1260.00
MRP-BOM-2025-7fc4db	\N	\N	carbon rods	m	durable	22	60.00	1320.00
MRP-BOM-2025-1078d3	\N	\N	glass fiber	sqm	lightweight	4	400.00	1600.00
MRP-BOM-2025-d08790	\N	\N	wood laminate	sqm	polished	6	150.00	900.00
MRP-BOM-2025-a07eb1	\N	\N	brass fittings	unit	precision made	50	10.00	500.00
MRP-BOM-2025-51a6f8	\N	\N	foam insulation	kg	fire retardant	12	75.00	900.00
MRP-BOM-2025-278038	\N	\N	aluminum sheet	sqm	corrosion proof	5	300.00	1500.00
MRP-BOM-2025-d94c7c	\N	\N	synthetic leather	m	durable	10	25.00	250.00
MRP-BOM-2025-df26aa	\N	\N	adhesive glue	liters	waterproof	5	80.00	400.00
MRP-BOM-2025-2e5ed8	\N	\N	epoxy resin	kg	fast curing	8	120.00	960.00
MRP-BOM-2025-82e841	\N	\N	copper coil	m	high conductivity	20	55.00	1100.00
MRP-BOM-2025-1fd40a	\N	\N	rubber sheet	sqm	high density	7	60.00	420.00
MRP-BOM-2025-1defa9	\N	\N	carbon fiber rods	m	lightweight	3	700.00	2100.00
MRP-BOM-2025-59393f	\N	\N	steel frame	kg	high strength	10	50.00	500.00
MRP-BOM-2025-0ad2f3	\N	\N	plastic cover	kg	lightweight	5	90.00	450.00
MRP-BOM-2025-401e4d	\N	\N	aluminum rod	kg	corrosion resistant	8	87.50	700.00
MRP-BOM-2025-50dbda	\N	\N	copper wire	m	high conductivity	12	30.00	360.00
MRP-BOM-2025-eab8b2	\N	\N	rubber gasket	unit	durable	20	5.00	100.00
MRP-BOM-2025-0d20eb	\N	\N	glass panel	sqm	tempered	3	200.00	600.00
MRP-BOM-2025-d978cb	\N	\N	wooden plank	m	hardwood	15	40.00	600.00
MRP-BOM-2025-a5bddd	\N	\N	ceramic tile	sqm	glazed	10	25.00	250.00
MRP-BOM-2025-672aad	\N	\N	pvc pipe	m	flexible	30	10.00	300.00
MRP-BOM-2025-0e23e7	\N	\N	carbon fiber sheet	sqm	lightweight	2	500.00	1000.00
MRP-BOM-2025-130ea3	\N	\N	steel bolts	kg	stainless steel	15	35.00	525.00
MRP-BOM-2025-5e8baa	\N	\N	plastic resin	kg	high quality	25	45.00	1125.00
MRP-BOM-2025-9403ae	\N	\N	copper tubing	m	heat resistant	18	70.00	1260.00
MRP-BOM-2025-6d90aa	\N	\N	carbon rods	m	durable	22	60.00	1320.00
MRP-BOM-2025-fa1cce	\N	\N	glass fiber	sqm	lightweight	4	400.00	1600.00
MRP-BOM-2025-813d2f	\N	\N	wood laminate	sqm	polished	6	150.00	900.00
MRP-BOM-2025-b18a19	\N	\N	brass fittings	unit	precision made	50	10.00	500.00
MRP-BOM-2025-aa69df	\N	\N	foam insulation	kg	fire retardant	12	75.00	900.00
MRP-BOM-2025-90e7c7	\N	\N	aluminum sheet	sqm	corrosion proof	5	300.00	1500.00
MRP-BOM-2025-edb068	\N	\N	synthetic leather	m	durable	10	25.00	250.00
MRP-BOM-2025-0ef296	\N	\N	adhesive glue	liters	waterproof	5	80.00	400.00
MRP-BOM-2025-7b0c81	\N	\N	epoxy resin	kg	fast curing	8	120.00	960.00
MRP-BOM-2025-e96736	\N	\N	copper coil	m	high conductivity	20	55.00	1100.00
MRP-BOM-2025-cff1fa	\N	\N	rubber sheet	sqm	high density	7	60.00	420.00
MRP-BOM-2025-43a641	\N	\N	carbon fiber rods	m	lightweight	3	700.00	2100.00
\.


--
-- Data for Name: non_project_order_pricing; Type: TABLE DATA; Schema: mrp; Owner: postgres
--

COPY mrp.non_project_order_pricing (non_project_costing_id, order_id, product_id, quantity, mrp_base_price, final_price) FROM stdin;
MRP-NPC-2025-a07f3d	\N	\N	5	1200.00	6000.00
MRP-NPC-2025-bc562a	\N	\N	3	1100.00	3300.00
MRP-NPC-2025-f940ae	\N	\N	7	1500.00	10500.00
MRP-NPC-2025-762fe0	\N	\N	10	800.00	8000.00
MRP-NPC-2025-e54e02	\N	\N	15	500.00	7500.00
MRP-NPC-2025-7c27ef	\N	\N	2	2500.00	5000.00
MRP-NPC-2025-7e462a	\N	\N	8	900.00	7200.00
MRP-NPC-2025-04d85a	\N	\N	12	300.00	3600.00
MRP-NPC-2025-4ab77d	\N	\N	20	200.00	4000.00
MRP-NPC-2025-9a52be	\N	\N	1	10000.00	10000.00
MRP-NPC-2025-c44e61	\N	\N	6	1300.00	7800.00
MRP-NPC-2025-287a0b	\N	\N	9	1400.00	12600.00
MRP-NPC-2025-080112	\N	\N	3	1600.00	4800.00
MRP-NPC-2025-2035c2	\N	\N	4	1700.00	6800.00
MRP-NPC-2025-896379	\N	\N	12	1800.00	21600.00
MRP-NPC-2025-b69e27	\N	\N	10	1900.00	19000.00
MRP-NPC-2025-c7c1cf	\N	\N	7	2000.00	14000.00
MRP-NPC-2025-428313	\N	\N	11	1500.00	16500.00
MRP-NPC-2025-88c06d	\N	\N	14	2200.00	30800.00
MRP-NPC-2025-e00285	\N	\N	8	2500.00	20000.00
MRP-NPC-2025-ed5e73	\N	\N	5	2100.00	10500.00
MRP-NPC-2025-026da9	\N	\N	13	2300.00	29900.00
MRP-NPC-2025-5b6bc3	\N	\N	2	2400.00	4800.00
MRP-NPC-2025-c4a42b	\N	\N	6	2600.00	15600.00
MRP-NPC-2025-b46ad4	\N	\N	9	2700.00	24300.00
MRP-NPC-2025-7c415a	\N	\N	5	1200.00	6000.00
MRP-NPC-2025-2835df	\N	\N	3	1100.00	3300.00
MRP-NPC-2025-ff3c70	\N	\N	7	1500.00	10500.00
MRP-NPC-2025-cb98a9	\N	\N	10	800.00	8000.00
MRP-NPC-2025-c8817b	\N	\N	15	500.00	7500.00
MRP-NPC-2025-6e411b	\N	\N	2	2500.00	5000.00
MRP-NPC-2025-342dbb	\N	\N	8	900.00	7200.00
MRP-NPC-2025-ee4e2e	\N	\N	12	300.00	3600.00
MRP-NPC-2025-a15daf	\N	\N	20	200.00	4000.00
MRP-NPC-2025-e712b3	\N	\N	1	10000.00	10000.00
MRP-NPC-2025-8e351c	\N	\N	6	1300.00	7800.00
MRP-NPC-2025-28a825	\N	\N	9	1400.00	12600.00
MRP-NPC-2025-b27d90	\N	\N	3	1600.00	4800.00
MRP-NPC-2025-65f935	\N	\N	4	1700.00	6800.00
MRP-NPC-2025-eb1d8b	\N	\N	12	1800.00	21600.00
MRP-NPC-2025-457dff	\N	\N	10	1900.00	19000.00
MRP-NPC-2025-7a2bbd	\N	\N	7	2000.00	14000.00
MRP-NPC-2025-072537	\N	\N	11	1500.00	16500.00
MRP-NPC-2025-cd519e	\N	\N	14	2200.00	30800.00
MRP-NPC-2025-97f5a7	\N	\N	8	2500.00	20000.00
MRP-NPC-2025-57aa34	\N	\N	5	2100.00	10500.00
MRP-NPC-2025-3fdd10	\N	\N	13	2300.00	29900.00
MRP-NPC-2025-f9105f	\N	\N	2	2400.00	4800.00
MRP-NPC-2025-05a4f5	\N	\N	6	2600.00	15600.00
MRP-NPC-2025-af6370	\N	\N	9	2700.00	24300.00
MRP-NPC-2025-6b1c52	SALES-ORD-2025-6a18e4	\N	0	0.00	0.00
\.


--
-- Data for Name: overall_production; Type: TABLE DATA; Schema: mrp; Owner: postgres
--

COPY mrp.overall_production (cost_id, production_order_detail_id, product_id, bom_id, cost_of_raw_materials, labor_cost, total_mrp_cost) FROM stdin;
MRP-CST-2025-a50f80	\N	\N	\N	500.00	300.00	2000.00
MRP-CST-2025-afa584	\N	\N	\N	450.00	280.00	1830.00
MRP-CST-2025-bc4527	\N	\N	\N	700.00	400.00	2600.00
MRP-CST-2025-0b118f	\N	\N	\N	360.00	200.00	1360.00
MRP-CST-2025-069041	\N	\N	\N	100.00	150.00	750.00
MRP-CST-2025-0cd004	\N	\N	\N	600.00	500.00	3600.00
MRP-CST-2025-c99618	\N	\N	\N	600.00	250.00	1750.00
MRP-CST-2025-1fa09b	\N	\N	\N	250.00	100.00	650.00
MRP-CST-2025-9e4291	\N	\N	\N	300.00	50.00	550.00
MRP-CST-2025-4000e1	\N	\N	\N	1000.00	2000.00	13000.00
MRP-CST-2025-dd11ad	\N	\N	\N	525.00	300.00	2125.00
MRP-CST-2025-4b4cb1	\N	\N	\N	1125.00	350.00	2875.00
MRP-CST-2025-f999a5	\N	\N	\N	1260.00	400.00	3260.00
MRP-CST-2025-841404	\N	\N	\N	1320.00	420.00	3440.00
MRP-CST-2025-412a12	\N	\N	\N	1600.00	450.00	3850.00
MRP-CST-2025-8b3625	\N	\N	\N	900.00	380.00	3180.00
MRP-CST-2025-130a30	\N	\N	\N	500.00	500.00	3000.00
MRP-CST-2025-81e2b9	\N	\N	\N	900.00	350.00	2750.00
MRP-CST-2025-8b671a	\N	\N	\N	1500.00	600.00	4300.00
MRP-CST-2025-62458f	\N	\N	\N	250.00	700.00	3450.00
MRP-CST-2025-95b6b1	\N	\N	\N	400.00	300.00	2800.00
MRP-CST-2025-ace72f	\N	\N	\N	960.00	380.00	3640.00
MRP-CST-2025-25b79c	\N	\N	\N	1100.00	400.00	3900.00
MRP-CST-2025-5dae10	\N	\N	\N	420.00	500.00	3520.00
MRP-CST-2025-17ad98	\N	\N	\N	2100.00	600.00	5400.00
MRP-CST-2025-9af296	\N	\N	\N	500.00	300.00	2000.00
MRP-CST-2025-cd0a16	\N	\N	\N	450.00	280.00	1830.00
MRP-CST-2025-a4cb3a	\N	\N	\N	700.00	400.00	2600.00
MRP-CST-2025-e77413	\N	\N	\N	360.00	200.00	1360.00
MRP-CST-2025-8dbd39	\N	\N	\N	100.00	150.00	750.00
MRP-CST-2025-7dba05	\N	\N	\N	600.00	500.00	3600.00
MRP-CST-2025-fc76f1	\N	\N	\N	600.00	250.00	1750.00
MRP-CST-2025-2531e2	\N	\N	\N	250.00	100.00	650.00
MRP-CST-2025-2f4546	\N	\N	\N	300.00	50.00	550.00
MRP-CST-2025-cad8ef	\N	\N	\N	1000.00	2000.00	13000.00
MRP-CST-2025-c2354c	\N	\N	\N	525.00	300.00	2125.00
MRP-CST-2025-3aded3	\N	\N	\N	1125.00	350.00	2875.00
MRP-CST-2025-d98924	\N	\N	\N	1260.00	400.00	3260.00
MRP-CST-2025-d560e8	\N	\N	\N	1320.00	420.00	3440.00
MRP-CST-2025-d10a3e	\N	\N	\N	1600.00	450.00	3850.00
MRP-CST-2025-2809f5	\N	\N	\N	900.00	380.00	3180.00
MRP-CST-2025-9cbed2	\N	\N	\N	500.00	500.00	3000.00
MRP-CST-2025-535c19	\N	\N	\N	900.00	350.00	2750.00
MRP-CST-2025-9e8f71	\N	\N	\N	1500.00	600.00	4300.00
MRP-CST-2025-2aac92	\N	\N	\N	250.00	700.00	3450.00
MRP-CST-2025-414533	\N	\N	\N	400.00	300.00	2800.00
MRP-CST-2025-44b277	\N	\N	\N	960.00	380.00	3640.00
MRP-CST-2025-f086b1	\N	\N	\N	1100.00	400.00	3900.00
MRP-CST-2025-d95bb8	\N	\N	\N	420.00	500.00	3520.00
MRP-CST-2025-b19218	\N	\N	\N	2100.00	600.00	5400.00
\.


--
-- Data for Name: principal_items; Type: TABLE DATA; Schema: mrp; Owner: postgres
--

COPY mrp.principal_items (principal_item_id, service_request_id, service_order_id, quantity, item_id, unit_price, markup_price, pricing_date) FROM stdin;
MRP-PI-2025-f6a03c	\N	\N	10	\N	100.00	20.00	2024-03-09
MRP-PI-2025-d99c28	\N	\N	8	\N	120.00	25.00	2024-03-09
MRP-PI-2025-b880e1	\N	\N	15	\N	90.00	18.00	2024-03-09
MRP-PI-2025-bb990f	\N	\N	12	\N	80.00	15.00	2024-03-10
MRP-PI-2025-aae45c	\N	\N	20	\N	70.00	10.00	2024-03-10
MRP-PI-2025-5505d5	\N	\N	5	\N	150.00	30.00	2024-03-11
MRP-PI-2025-e378d1	\N	\N	18	\N	60.00	12.00	2024-03-11
MRP-PI-2025-cd5fad	\N	\N	25	\N	40.00	8.00	2024-03-12
MRP-PI-2025-204eb8	\N	\N	30	\N	50.00	10.00	2024-03-12
MRP-PI-2025-cc8908	\N	\N	2	\N	200.00	40.00	2024-03-13
MRP-PI-2025-b8da5a	\N	\N	7	\N	80.00	12.00	2024-03-14
MRP-PI-2025-242956	\N	\N	5	\N	100.00	20.00	2024-03-14
MRP-PI-2025-3fb970	\N	\N	3	\N	120.00	25.00	2024-03-15
MRP-PI-2025-7f592c	\N	\N	4	\N	90.00	15.00	2024-03-15
MRP-PI-2025-2b854e	\N	\N	8	\N	85.00	17.00	2024-03-16
MRP-PI-2025-6e3534	\N	\N	6	\N	95.00	19.00	2024-03-16
MRP-PI-2025-b522c8	\N	\N	10	\N	110.00	22.00	2024-03-17
MRP-PI-2025-5fd1f6	\N	\N	12	\N	105.00	21.00	2024-03-17
MRP-PI-2025-eec5de	\N	\N	15	\N	60.00	12.00	2024-03-18
MRP-PI-2025-d7b85a	\N	\N	20	\N	70.00	14.00	2024-03-18
MRP-PI-2025-77c162	\N	\N	9	\N	75.00	15.00	2024-03-19
MRP-PI-2025-b64f40	\N	\N	11	\N	115.00	23.00	2024-03-19
MRP-PI-2025-6bd65c	\N	\N	13	\N	125.00	25.00	2024-03-20
MRP-PI-2025-d01c99	\N	\N	14	\N	130.00	26.00	2024-03-20
MRP-PI-2025-a870dd	\N	\N	16	\N	140.00	28.00	2024-03-21
MRP-PI-2025-93e02c	\N	\N	10	\N	100.00	20.00	2024-03-09
MRP-PI-2025-a6b0e4	\N	\N	8	\N	120.00	25.00	2024-03-09
MRP-PI-2025-ed7cfe	\N	\N	15	\N	90.00	18.00	2024-03-09
MRP-PI-2025-1805a3	\N	\N	12	\N	80.00	15.00	2024-03-10
MRP-PI-2025-20d07c	\N	\N	20	\N	70.00	10.00	2024-03-10
MRP-PI-2025-a560d0	\N	\N	5	\N	150.00	30.00	2024-03-11
MRP-PI-2025-bdbe7e	\N	\N	18	\N	60.00	12.00	2024-03-11
MRP-PI-2025-64d69c	\N	\N	25	\N	40.00	8.00	2024-03-12
MRP-PI-2025-44c6bd	\N	\N	30	\N	50.00	10.00	2024-03-12
MRP-PI-2025-4c3e2b	\N	\N	2	\N	200.00	40.00	2024-03-13
MRP-PI-2025-a69dca	\N	\N	7	\N	80.00	12.00	2024-03-14
MRP-PI-2025-dcdebb	\N	\N	5	\N	100.00	20.00	2024-03-14
MRP-PI-2025-d806f7	\N	\N	3	\N	120.00	25.00	2024-03-15
MRP-PI-2025-6da31e	\N	\N	4	\N	90.00	15.00	2024-03-15
MRP-PI-2025-a97785	\N	\N	8	\N	85.00	17.00	2024-03-16
MRP-PI-2025-db87f5	\N	\N	6	\N	95.00	19.00	2024-03-16
MRP-PI-2025-6fea28	\N	\N	10	\N	110.00	22.00	2024-03-17
MRP-PI-2025-679ca9	\N	\N	12	\N	105.00	21.00	2024-03-17
MRP-PI-2025-9e77e9	\N	\N	15	\N	60.00	12.00	2024-03-18
MRP-PI-2025-06ef3a	\N	\N	20	\N	70.00	14.00	2024-03-18
MRP-PI-2025-32ee0d	\N	\N	9	\N	75.00	15.00	2024-03-19
MRP-PI-2025-89b536	\N	\N	11	\N	115.00	23.00	2024-03-19
MRP-PI-2025-1bb315	\N	\N	13	\N	125.00	25.00	2024-03-20
MRP-PI-2025-f172e5	\N	\N	14	\N	130.00	26.00	2024-03-20
MRP-PI-2025-cc9f55	\N	\N	16	\N	140.00	28.00	2024-03-21
\.


--
-- Data for Name: document_header; Type: TABLE DATA; Schema: operations; Owner: postgres
--

COPY operations.document_header (document_id, document_type, vendor_code, document_no, transaction_id, status, posting_date, delivery_date, document_date, buyer, owner, initial_amount, discount_rate, discount_amount, freight, tax_rate, tax_amount, transaction_cost) FROM stdin;
OPS-DOH-2025-cc2d00	GRPO	\N	1001	2001	Open	2025-01-01	2025-01-05	2025-01-01	Alice Johnson	Bob Smith	5000.00	5.00	250.00	100.00	10.00	500.00	150.00
OPS-DOH-2025-16b2fb	Removal_Request	\N	1002	2002	Closed	2025-01-02	2025-01-06	2025-01-02	Charlie Davis	Diana Ross	7000.00	7.00	490.00	120.00	12.00	840.00	175.00
OPS-DOH-2025-9cc4e0	Goods_Issue	\N	1003	2003	Cancelled	2025-01-03	2025-01-07	2025-01-03	Ethan Wright	Fiona Green	3000.00	4.50	135.00	90.00	8.50	255.00	100.00
OPS-DOH-2025-3e20a3	Rework_Order	\N	1004	2004	Draft	2025-01-04	2025-01-08	2025-01-04	George Hill	Hannah Lee	4500.00	6.00	270.00	110.00	9.00	405.00	130.00
OPS-DOH-2025-5cc55a	Goods_Receipt	\N	1005	2005	Open	2025-01-05	2025-01-09	2025-01-05	Isaac Clark	Jessica Adams	6000.00	5.50	330.00	105.00	11.00	660.00	160.00
OPS-DOH-2025-dc270a	GRPO	\N	1006	2006	Closed	2025-01-06	2025-01-10	2025-01-06	Kevin Brown	Lily Evans	8000.00	6.50	520.00	130.00	12.50	1000.00	190.00
OPS-DOH-2025-26fa04	Removal_Request	\N	1007	2007	Cancelled	2025-01-07	2025-01-11	2025-01-07	Mason Walker	Nora White	2500.00	4.00	100.00	85.00	8.00	200.00	90.00
OPS-DOH-2025-cded9e	Goods_Issue	\N	1008	2008	Draft	2025-01-08	2025-01-12	2025-01-08	Oliver Scott	Penelope Turner	5500.00	5.25	288.75	95.00	9.75	536.25	145.00
OPS-DOH-2025-73c399	Rework_Order	\N	1009	2009	Open	2025-01-09	2025-01-13	2025-01-09	Quincy Harris	Rachel Green	3500.00	4.75	166.25	98.00	8.75	306.25	120.00
OPS-DOH-2025-e6411c	Goods_Receipt	\N	1010	2010	Closed	2025-01-10	2025-01-14	2025-01-10	Samuel Carter	Tina Brooks	7200.00	6.25	450.00	125.00	10.50	756.00	170.00
OPS-DOH-2025-bb6dce	GRPO	\N	1011	2011	Open	2025-01-11	2025-01-15	2025-01-11	Ursula Lane	Victor Cruz	6300.00	5.75	362.25	110.00	10.25	645.75	165.00
OPS-DOH-2025-e0171c	Goods_Issue	\N	1012	2012	Closed	2025-01-12	2025-01-16	2025-01-12	Walter Perry	Xena Blake	4800.00	5.00	240.00	108.00	9.50	456.00	140.00
OPS-DOH-2025-21759f	Rework_Order	\N	1013	2013	Open	2025-01-13	2025-01-17	2025-01-13	Yara Bell	Zachary Owens	3900.00	4.25	165.75	92.00	8.25	321.75	115.00
OPS-DOH-2025-052dd6	Goods_Receipt	\N	1014	2014	Draft	2025-01-14	2025-01-18	2025-01-14	Adam Reed	Beatrice Moore	5700.00	5.00	285.00	103.00	9.75	555.75	155.00
OPS-DOH-2025-998e53	Removal_Request	\N	1015	2015	Cancelled	2025-01-15	2025-01-19	2025-01-15	Chris Young	Dana Fox	2600.00	3.75	97.50	78.00	7.50	195.00	85.00
OPS-DOH-2025-c9dc20	GRPO	\N	1016	2016	Open	2025-01-16	2025-01-20	2025-01-16	Ella Grant	Felix Harper	6900.00	6.00	414.00	120.00	11.00	759.00	180.00
OPS-DOH-2025-4a9e70	Goods_Issue	\N	1017	2017	Open	2025-01-17	2025-01-21	2025-01-17	Grace Hunter	Henry Scott	5100.00	5.50	280.50	107.00	9.50	484.50	145.00
OPS-DOH-2025-ef0906	Rework_Order	\N	1018	2018	Closed	2025-01-18	2025-01-22	2025-01-18	Ivy Coleman	Jack Daniels	4200.00	4.50	189.00	99.00	8.75	367.50	125.00
OPS-DOH-2025-58415f	Goods_Receipt	\N	1019	2019	Draft	2025-01-19	2025-01-23	2025-01-19	Karen Patel	Leo Richardson	6100.00	5.75	350.75	115.00	10.50	640.50	165.00
OPS-DOH-2025-aa0f27	Removal_Request	\N	1020	2020	Open	2025-01-20	2025-01-24	2025-01-20	Megan Ford	Nathan Brown	2800.00	4.00	112.00	80.00	8.25	231.00	95.00
OPS-DOH-2025-000602	GRPO	\N	1001	2001	Open	2025-01-01	2025-01-05	2025-01-01	Alice Johnson	Bob Smith	5000.00	5.00	250.00	100.00	10.00	500.00	150.00
OPS-DOH-2025-fa8b5c	Removal_Request	\N	1002	2002	Closed	2025-01-02	2025-01-06	2025-01-02	Charlie Davis	Diana Ross	7000.00	7.00	490.00	120.00	12.00	840.00	175.00
OPS-DOH-2025-0cb234	Goods_Issue	\N	1003	2003	Cancelled	2025-01-03	2025-01-07	2025-01-03	Ethan Wright	Fiona Green	3000.00	4.50	135.00	90.00	8.50	255.00	100.00
OPS-DOH-2025-557118	Rework_Order	\N	1004	2004	Draft	2025-01-04	2025-01-08	2025-01-04	George Hill	Hannah Lee	4500.00	6.00	270.00	110.00	9.00	405.00	130.00
OPS-DOH-2025-f9ce77	Goods_Receipt	\N	1005	2005	Open	2025-01-05	2025-01-09	2025-01-05	Isaac Clark	Jessica Adams	6000.00	5.50	330.00	105.00	11.00	660.00	160.00
OPS-DOH-2025-2cdf7c	GRPO	\N	1006	2006	Closed	2025-01-06	2025-01-10	2025-01-06	Kevin Brown	Lily Evans	8000.00	6.50	520.00	130.00	12.50	1000.00	190.00
OPS-DOH-2025-8a5439	Removal_Request	\N	1007	2007	Cancelled	2025-01-07	2025-01-11	2025-01-07	Mason Walker	Nora White	2500.00	4.00	100.00	85.00	8.00	200.00	90.00
OPS-DOH-2025-734cac	Goods_Issue	\N	1008	2008	Draft	2025-01-08	2025-01-12	2025-01-08	Oliver Scott	Penelope Turner	5500.00	5.25	288.75	95.00	9.75	536.25	145.00
OPS-DOH-2025-0b8f56	Rework_Order	\N	1009	2009	Open	2025-01-09	2025-01-13	2025-01-09	Quincy Harris	Rachel Green	3500.00	4.75	166.25	98.00	8.75	306.25	120.00
OPS-DOH-2025-36323c	Goods_Receipt	\N	1010	2010	Closed	2025-01-10	2025-01-14	2025-01-10	Samuel Carter	Tina Brooks	7200.00	6.25	450.00	125.00	10.50	756.00	170.00
OPS-DOH-2025-d73532	GRPO	\N	1011	2011	Open	2025-01-11	2025-01-15	2025-01-11	Ursula Lane	Victor Cruz	6300.00	5.75	362.25	110.00	10.25	645.75	165.00
OPS-DOH-2025-7960b9	Goods_Issue	\N	1012	2012	Closed	2025-01-12	2025-01-16	2025-01-12	Walter Perry	Xena Blake	4800.00	5.00	240.00	108.00	9.50	456.00	140.00
OPS-DOH-2025-d405ae	Rework_Order	\N	1013	2013	Open	2025-01-13	2025-01-17	2025-01-13	Yara Bell	Zachary Owens	3900.00	4.25	165.75	92.00	8.25	321.75	115.00
OPS-DOH-2025-596c57	Goods_Receipt	\N	1014	2014	Draft	2025-01-14	2025-01-18	2025-01-14	Adam Reed	Beatrice Moore	5700.00	5.00	285.00	103.00	9.75	555.75	155.00
OPS-DOH-2025-f4cb42	Removal_Request	\N	1015	2015	Cancelled	2025-01-15	2025-01-19	2025-01-15	Chris Young	Dana Fox	2600.00	3.75	97.50	78.00	7.50	195.00	85.00
OPS-DOH-2025-5d93f2	GRPO	\N	1016	2016	Open	2025-01-16	2025-01-20	2025-01-16	Ella Grant	Felix Harper	6900.00	6.00	414.00	120.00	11.00	759.00	180.00
OPS-DOH-2025-a23e35	Goods_Issue	\N	1017	2017	Open	2025-01-17	2025-01-21	2025-01-17	Grace Hunter	Henry Scott	5100.00	5.50	280.50	107.00	9.50	484.50	145.00
OPS-DOH-2025-30dd8c	Rework_Order	\N	1018	2018	Closed	2025-01-18	2025-01-22	2025-01-18	Ivy Coleman	Jack Daniels	4200.00	4.50	189.00	99.00	8.75	367.50	125.00
OPS-DOH-2025-105fd7	Goods_Receipt	\N	1019	2019	Draft	2025-01-19	2025-01-23	2025-01-19	Karen Patel	Leo Richardson	6100.00	5.75	350.75	115.00	10.50	640.50	165.00
OPS-DOH-2025-755efd	Removal_Request	\N	1020	2020	Open	2025-01-20	2025-01-24	2025-01-20	Megan Ford	Nathan Brown	2800.00	4.00	112.00	80.00	8.25	231.00	95.00
\.


--
-- Data for Name: document_items; Type: TABLE DATA; Schema: operations; Owner: postgres
--

COPY operations.document_items (content_id, asset_id, document_id, material_id, serial_id, productdocu_id, external_id, quantity, total, batch_no, warehouse_loc, delivery_request_id, request_date, delivery_type, receiving_module, cost, status) FROM stdin;
OPS-DOI-2025-580793	\N	OPS-DOH-2025-3e20a3	\N	OPS-SET-2025-929fe3	OPS-PDI-2025-02a050	\N	25	5000.00	BATCH004	Warehouse D	\N	\N	\N	\N	\N	Pending
OPS-DOI-2025-868602	\N	OPS-DOH-2025-26fa04	\N	OPS-SET-2025-def470	OPS-PDI-2025-0b44fa	\N	22	3300.00	BATCH007	Warehouse G	\N	\N	\N	\N	\N	Pending
OPS-DOI-2025-2475bf	\N	OPS-DOH-2025-e6411c	\N	OPS-SET-2025-512cbc	OPS-PDI-2025-1a7ae1	\N	26	6500.00	BATCH010	Warehouse J	\N	\N	\N	\N	\N	Pending
OPS-DOI-2025-15cf5e	\N	OPS-DOH-2025-4a9e70	\N	OPS-SET-2025-488355	OPS-PDI-2025-23c341	\N	29	7650.00	BATCH017	Warehouse Q	\N	\N	\N	\N	\N	Pending
OPS-DOI-2025-ce3634	\N	OPS-DOH-2025-c9dc20	\N	OPS-SET-2025-1b38bb	OPS-PDI-2025-32508b	\N	17	2550.00	BATCH016	Warehouse P	\N	\N	\N	\N	\N	Pending
OPS-DOI-2025-9aa1de	\N	OPS-DOH-2025-9cc4e0	\N	OPS-SET-2025-8b71a4	OPS-PDI-2025-4cff0d	\N	15	1500.00	BATCH003	Warehouse C	\N	\N	\N	\N	\N	Pending
OPS-DOI-2025-d9da34	\N	OPS-DOH-2025-ef0906	\N	OPS-SET-2025-cac80f	OPS-PDI-2025-4dc01b	\N	23	4600.00	BATCH018	Warehouse R	\N	\N	\N	\N	\N	Pending
OPS-DOI-2025-92f5ec	\N	OPS-DOH-2025-bb6dce	\N	OPS-SET-2025-c8bf3f	OPS-PDI-2025-62a347	\N	16	4200.00	BATCH011	Warehouse K	\N	\N	\N	\N	\N	Pending
OPS-DOI-2025-4ce035	\N	OPS-DOH-2025-cded9e	\N	OPS-SET-2025-e5ff40	OPS-PDI-2025-7116bb	\N	30	5250.00	BATCH008	Warehouse H	\N	\N	\N	\N	\N	Pending
OPS-DOI-2025-aeb836	\N	OPS-DOH-2025-58415f	\N	OPS-SET-2025-d68cb7	OPS-PDI-2025-800b9e	\N	31	8000.00	BATCH019	Warehouse S	\N	\N	\N	\N	\N	Pending
OPS-DOI-2025-31cedc	\N	OPS-DOH-2025-998e53	\N	OPS-SET-2025-f4b5d8	OPS-PDI-2025-80cb83	\N	21	3150.00	BATCH015	Warehouse O	\N	\N	\N	\N	\N	Pending
OPS-DOI-2025-cbfa3f	\N	OPS-DOH-2025-16b2fb	\N	OPS-SET-2025-69b218	OPS-PDI-2025-962f27	\N	20	1500.00	BATCH002	Warehouse B	\N	\N	\N	\N	\N	Pending
OPS-DOI-2025-9a1d86	\N	OPS-DOH-2025-aa0f27	\N	OPS-SET-2025-b1107d	OPS-PDI-2025-9d2954	\N	27	6750.00	BATCH020	Warehouse T	\N	\N	\N	\N	\N	Pending
OPS-DOI-2025-8b5191	\N	OPS-DOH-2025-cc2d00	\N	OPS-SET-2025-098aaa	OPS-PDI-2025-a0c364	\N	10	500.00	BATCH001	Warehouse A	\N	\N	\N	\N	\N	Pending
OPS-DOI-2025-98a745	\N	OPS-DOH-2025-e0171c	\N	OPS-SET-2025-8e7d04	OPS-PDI-2025-b26fa0	\N	28	7000.00	BATCH012	Warehouse L	\N	\N	\N	\N	\N	Pending
OPS-DOI-2025-657b69	\N	OPS-DOH-2025-73c399	\N	OPS-SET-2025-8fbdf2	OPS-PDI-2025-ce96fe	\N	14	3150.00	BATCH009	Warehouse I	\N	\N	\N	\N	\N	Pending
OPS-DOI-2025-551c7a	\N	OPS-DOH-2025-21759f	\N	OPS-SET-2025-5ec748	OPS-PDI-2025-d46864	\N	19	2850.00	BATCH013	Warehouse M	\N	\N	\N	\N	\N	Pending
OPS-DOI-2025-0e2bf7	\N	OPS-DOH-2025-052dd6	\N	OPS-SET-2025-bd00d1	OPS-PDI-2025-ed7f28	\N	24	4800.00	BATCH014	Warehouse N	\N	\N	\N	\N	\N	Pending
OPS-DOI-2025-44db25	\N	OPS-DOH-2025-dc270a	\N	OPS-SET-2025-9fe62d	OPS-PDI-2025-fc4ab2	\N	18	2250.00	BATCH006	Warehouse F	\N	\N	\N	\N	\N	Pending
OPS-DOI-2025-f7e4e8	\N	OPS-DOH-2025-5cc55a	\N	OPS-SET-2025-040233	OPS-PDI-2025-fd2671	\N	12	3600.00	BATCH005	Warehouse E	\N	\N	\N	\N	\N	Pending
OPS-DOI-2025-21b8ff	\N	OPS-DOH-2025-3e20a3	\N	OPS-SET-2025-929fe3	OPS-PDI-2025-02a050	\N	25	5000.00	BATCH004	Warehouse D	\N	\N	\N	\N	\N	Pending
OPS-DOI-2025-36ea6f	\N	OPS-DOH-2025-26fa04	\N	OPS-SET-2025-def470	OPS-PDI-2025-0b44fa	\N	22	3300.00	BATCH007	Warehouse G	\N	\N	\N	\N	\N	Pending
OPS-DOI-2025-bbbe22	\N	OPS-DOH-2025-e6411c	\N	OPS-SET-2025-512cbc	OPS-PDI-2025-1a7ae1	\N	26	6500.00	BATCH010	Warehouse J	\N	\N	\N	\N	\N	Pending
OPS-DOI-2025-b84bf0	\N	OPS-DOH-2025-4a9e70	\N	OPS-SET-2025-488355	OPS-PDI-2025-23c341	\N	29	7650.00	BATCH017	Warehouse Q	\N	\N	\N	\N	\N	Pending
OPS-DOI-2025-3451d7	\N	OPS-DOH-2025-c9dc20	\N	OPS-SET-2025-1b38bb	OPS-PDI-2025-32508b	\N	17	2550.00	BATCH016	Warehouse P	\N	\N	\N	\N	\N	Pending
OPS-DOI-2025-ca2702	\N	OPS-DOH-2025-9cc4e0	\N	OPS-SET-2025-8b71a4	OPS-PDI-2025-4cff0d	\N	15	1500.00	BATCH003	Warehouse C	\N	\N	\N	\N	\N	Pending
OPS-DOI-2025-e53325	\N	OPS-DOH-2025-ef0906	\N	OPS-SET-2025-cac80f	OPS-PDI-2025-4dc01b	\N	23	4600.00	BATCH018	Warehouse R	\N	\N	\N	\N	\N	Pending
OPS-DOI-2025-b21833	\N	OPS-DOH-2025-bb6dce	\N	OPS-SET-2025-c8bf3f	OPS-PDI-2025-62a347	\N	16	4200.00	BATCH011	Warehouse K	\N	\N	\N	\N	\N	Pending
OPS-DOI-2025-23b14a	\N	OPS-DOH-2025-cded9e	\N	OPS-SET-2025-e5ff40	OPS-PDI-2025-7116bb	\N	30	5250.00	BATCH008	Warehouse H	\N	\N	\N	\N	\N	Pending
OPS-DOI-2025-4441c3	\N	OPS-DOH-2025-58415f	\N	OPS-SET-2025-d68cb7	OPS-PDI-2025-800b9e	\N	31	8000.00	BATCH019	Warehouse S	\N	\N	\N	\N	\N	Pending
OPS-DOI-2025-c5879c	\N	OPS-DOH-2025-998e53	\N	OPS-SET-2025-f4b5d8	OPS-PDI-2025-80cb83	\N	21	3150.00	BATCH015	Warehouse O	\N	\N	\N	\N	\N	Pending
OPS-DOI-2025-b781e4	\N	OPS-DOH-2025-16b2fb	\N	OPS-SET-2025-69b218	OPS-PDI-2025-962f27	\N	20	1500.00	BATCH002	Warehouse B	\N	\N	\N	\N	\N	Pending
OPS-DOI-2025-223657	\N	OPS-DOH-2025-aa0f27	\N	OPS-SET-2025-b1107d	OPS-PDI-2025-9d2954	\N	27	6750.00	BATCH020	Warehouse T	\N	\N	\N	\N	\N	Pending
OPS-DOI-2025-4170d0	\N	OPS-DOH-2025-cc2d00	\N	OPS-SET-2025-098aaa	OPS-PDI-2025-a0c364	\N	10	500.00	BATCH001	Warehouse A	\N	\N	\N	\N	\N	Pending
OPS-DOI-2025-3fe2d6	\N	OPS-DOH-2025-e0171c	\N	OPS-SET-2025-8e7d04	OPS-PDI-2025-b26fa0	\N	28	7000.00	BATCH012	Warehouse L	\N	\N	\N	\N	\N	Pending
OPS-DOI-2025-210428	\N	OPS-DOH-2025-73c399	\N	OPS-SET-2025-8fbdf2	OPS-PDI-2025-ce96fe	\N	14	3150.00	BATCH009	Warehouse I	\N	\N	\N	\N	\N	Pending
OPS-DOI-2025-f88f11	\N	OPS-DOH-2025-21759f	\N	OPS-SET-2025-5ec748	OPS-PDI-2025-d46864	\N	19	2850.00	BATCH013	Warehouse M	\N	\N	\N	\N	\N	Pending
OPS-DOI-2025-9dccb4	\N	OPS-DOH-2025-052dd6	\N	OPS-SET-2025-bd00d1	OPS-PDI-2025-ed7f28	\N	24	4800.00	BATCH014	Warehouse N	\N	\N	\N	\N	\N	Pending
OPS-DOI-2025-6563b1	\N	OPS-DOH-2025-dc270a	\N	OPS-SET-2025-9fe62d	OPS-PDI-2025-fc4ab2	\N	18	2250.00	BATCH006	Warehouse F	\N	\N	\N	\N	\N	Pending
OPS-DOI-2025-a639db	\N	OPS-DOH-2025-5cc55a	\N	OPS-SET-2025-040233	OPS-PDI-2025-fd2671	\N	12	3600.00	BATCH005	Warehouse E	\N	\N	\N	\N	\N	Pending
\.


--
-- Data for Name: external_module; Type: TABLE DATA; Schema: operations; Owner: postgres
--

COPY operations.external_module (external_id, purchase_id, request_id, approval_id, goods_issue_id, approval_request_id, billing_receipt_id, delivery_receipt_id, project_resources_id, project_tracking_id, project_request_id, production_order_detail_id, rework_id, deprecation_report_id) FROM stdin;
\.


--
-- Data for Name: product_document_items; Type: TABLE DATA; Schema: operations; Owner: postgres
--

COPY operations.product_document_items (productdocu_id, product_id, quantity_rejected, defect_type, manuf_date, expiry_date, uom, serial_id) FROM stdin;
OPS-PDI-2025-a0c364	\N	2	Performance Defect	2024-01-01	2026-01-01	\N	\N
OPS-PDI-2025-962f27	\N	1	Safety Defect	2024-02-01	2026-02-01	\N	\N
OPS-PDI-2025-4cff0d	\N	3	Functional Defect	2024-03-01	2026-03-01	\N	\N
OPS-PDI-2025-02a050	\N	0	Performance Defect	2024-04-01	2026-04-01	\N	\N
OPS-PDI-2025-fd2671	\N	5	Safety Defect	2024-05-01	2026-05-01	\N	\N
OPS-PDI-2025-fc4ab2	\N	2	Functional Defect	2024-06-01	2026-06-01	\N	\N
OPS-PDI-2025-0b44fa	\N	1	Performance Defect	2024-07-01	2026-07-01	\N	\N
OPS-PDI-2025-7116bb	\N	3	Safety Defect	2024-08-01	2026-08-01	\N	\N
OPS-PDI-2025-ce96fe	\N	0	Functional Defect	2024-09-01	2026-09-01	\N	\N
OPS-PDI-2025-1a7ae1	\N	5	Performance Defect	2024-10-01	2026-10-01	\N	\N
OPS-PDI-2025-62a347	\N	4	Material Defect	2024-11-01	2026-11-01	\N	\N
OPS-PDI-2025-b26fa0	\N	2	Durability Defect	2024-12-01	2026-12-01	\N	\N
OPS-PDI-2025-d46864	\N	3	Performance Defect	2025-01-01	2027-01-01	\N	\N
OPS-PDI-2025-ed7f28	\N	0	Safety Defect	2025-02-01	2027-02-01	\N	\N
OPS-PDI-2025-80cb83	\N	1	Functional Defect	2025-03-01	2027-03-01	\N	\N
OPS-PDI-2025-32508b	\N	5	Durability Defect	2025-04-01	2027-04-01	\N	\N
OPS-PDI-2025-23c341	\N	2	Material Defect	2025-05-01	2027-05-01	\N	\N
OPS-PDI-2025-4dc01b	\N	3	Performance Defect	2025-06-01	2027-06-01	\N	\N
OPS-PDI-2025-800b9e	\N	0	Functional Defect	2025-07-01	2027-07-01	\N	\N
OPS-PDI-2025-9d2954	\N	4	Safety Defect	2025-08-01	2027-08-01	\N	\N
OPS-PDI-2025-13feb3	\N	2	Performance Defect	2024-01-01	2026-01-01	\N	\N
OPS-PDI-2025-b684dc	\N	1	Safety Defect	2024-02-01	2026-02-01	\N	\N
OPS-PDI-2025-ec912e	\N	3	Functional Defect	2024-03-01	2026-03-01	\N	\N
OPS-PDI-2025-4aab56	\N	0	Performance Defect	2024-04-01	2026-04-01	\N	\N
OPS-PDI-2025-02603b	\N	5	Safety Defect	2024-05-01	2026-05-01	\N	\N
OPS-PDI-2025-fafea8	\N	2	Functional Defect	2024-06-01	2026-06-01	\N	\N
OPS-PDI-2025-de9089	\N	1	Performance Defect	2024-07-01	2026-07-01	\N	\N
OPS-PDI-2025-b73db0	\N	3	Safety Defect	2024-08-01	2026-08-01	\N	\N
OPS-PDI-2025-478ea2	\N	0	Functional Defect	2024-09-01	2026-09-01	\N	\N
OPS-PDI-2025-fb5227	\N	5	Performance Defect	2024-10-01	2026-10-01	\N	\N
OPS-PDI-2025-31969b	\N	4	Material Defect	2024-11-01	2026-11-01	\N	\N
OPS-PDI-2025-9f74e1	\N	2	Durability Defect	2024-12-01	2026-12-01	\N	\N
OPS-PDI-2025-13f94f	\N	3	Performance Defect	2025-01-01	2027-01-01	\N	\N
OPS-PDI-2025-2141ac	\N	0	Safety Defect	2025-02-01	2027-02-01	\N	\N
OPS-PDI-2025-692c64	\N	1	Functional Defect	2025-03-01	2027-03-01	\N	\N
OPS-PDI-2025-689287	\N	5	Durability Defect	2025-04-01	2027-04-01	\N	\N
OPS-PDI-2025-14db8d	\N	2	Material Defect	2025-05-01	2027-05-01	\N	\N
OPS-PDI-2025-2c7846	\N	3	Performance Defect	2025-06-01	2027-06-01	\N	\N
OPS-PDI-2025-d5e216	\N	0	Functional Defect	2025-07-01	2027-07-01	\N	\N
OPS-PDI-2025-17cdc9	\N	4	Safety Defect	2025-08-01	2027-08-01	\N	\N
\.


--
-- Data for Name: serial_tracking; Type: TABLE DATA; Schema: operations; Owner: postgres
--

COPY operations.serial_tracking (serial_id, document_id, serial_no) FROM stdin;
OPS-SET-2025-098aaa	OPS-DOH-2025-cc2d00	SN001
OPS-SET-2025-69b218	OPS-DOH-2025-16b2fb	SN002
OPS-SET-2025-8b71a4	OPS-DOH-2025-9cc4e0	SN003
OPS-SET-2025-929fe3	OPS-DOH-2025-3e20a3	SN004
OPS-SET-2025-040233	OPS-DOH-2025-5cc55a	SN005
OPS-SET-2025-9fe62d	OPS-DOH-2025-dc270a	SN006
OPS-SET-2025-def470	OPS-DOH-2025-26fa04	SN007
OPS-SET-2025-e5ff40	OPS-DOH-2025-cded9e	SN008
OPS-SET-2025-8fbdf2	OPS-DOH-2025-73c399	SN009
OPS-SET-2025-512cbc	OPS-DOH-2025-e6411c	SN010
OPS-SET-2025-c8bf3f	OPS-DOH-2025-bb6dce	SN011
OPS-SET-2025-8e7d04	OPS-DOH-2025-e0171c	SN012
OPS-SET-2025-5ec748	OPS-DOH-2025-21759f	SN013
OPS-SET-2025-bd00d1	OPS-DOH-2025-052dd6	SN014
OPS-SET-2025-f4b5d8	OPS-DOH-2025-998e53	SN015
OPS-SET-2025-1b38bb	OPS-DOH-2025-c9dc20	SN016
OPS-SET-2025-488355	OPS-DOH-2025-4a9e70	SN017
OPS-SET-2025-cac80f	OPS-DOH-2025-ef0906	SN018
OPS-SET-2025-d68cb7	OPS-DOH-2025-58415f	SN019
OPS-SET-2025-b1107d	OPS-DOH-2025-aa0f27	SN020
\.


--
-- Data for Name: equipment; Type: TABLE DATA; Schema: production; Owner: postgres
--

COPY production.equipment (equipment_id, equipment_name, description, availability_status, last_maintenance_date) FROM stdin;
PROD-EQP-2025-c6aeaa	CNC Milling Machine (5-axis)	High-precision 5 axis CNC milling machine for complex metal parts with intricate geometries	Available	2025-03-23
PROD-EQP-2025-19b866	Laser Cutting & Engraving Machine	CO2 laser cutter and engraver for precise cutting and marking of various materials, including metals, plastics, and wood	Under Maintenance	2025-03-23
PROD-EQP-2025-1131b1	Industrial 3D Printer (SLA)	Stereolithography (SLA) 3D printer for high-resolution prototypes and custom parts with fine details and smooth surfaces	Available	2025-03-23
PROD-EQP-2025-9b6dcb	Welding Station	Multi-process welding station with MIG, TIG, and stick welding capabilities	Available	2025-03-23
PROD-EQP-2025-60339b	Paint Booth	Enclosed paint booth with ventilation system for applying custom finishes	Available	2025-03-23
PROD-EQP-2025-8e9e71	Industrial Sewing Machine	Heavy-duty sewing machine for various fabrics and materials	Available	2025-03-23
PROD-EQP-2025-d01889	Pick and Place Machine	Automated pick and place machine for precise placement of electronic components on printed circuit boards (PCBs)	Available	2025-03-23
PROD-EQP-2025-eacd35	Reflow Oven	Reflow oven for soldering electronic components to PCBs	Available	2024-03-05
PROD-EQP-2025-92c613	Optical Inspection (AOI) Machine	AOI machine for visual inspection of PCBs for defects and quality control	Available	2025-03-23
PROD-EQP-2025-707c45	Wave Soldering Machine	Wave soldering machine for soldering through-hole components to PCBs	Out of Order	2025-03-23
PROD-EQP-2025-66c9b8	Molding Machine	A machine for molding plastic components for medical devices	Available	2025-03-23
PROD-EQP-2025-eae719	Precision Grinding Machine	Grinding machine for shaping metal parts to precise dimensions	Available	2025-03-23
PROD-EQP-2025-22f08e	Robotic Assembly Arm	Robotic arm for precise and repetitive assembly of medical device components	Available	2025-03-23
PROD-EQP-2025-652950	Cleanroom Injection Molder	Injection molding machine designed for cleanroom environments	Under Maintenance	2025-03-23
PROD-EQP-2025-34def6	Dispensing System	System for precise dispensing of adhesives and other fluids in medical device manufacturing	Available	2025-03-23
PROD-EQP-2025-80bd5f	Wire EDM Machine	Electrical discharge machine for cutting intricate shapes in conductive materials	Available	2025-03-23
PROD-EQP-2025-5b08ab	Precision Stamping Press	Stamping press for forming sheet metal components with high accuracy	Available	2025-03-23
PROD-EQP-2025-ec2c63	Automated Labeling Machine	Machine for automated labeling of medical devices and components	Available	2025-03-23
PROD-EQP-2025-987ea3	Ultrasonic Cleaner	Industrial ultrasonic cleaner for cleaning medical device components	Available	2025-03-23
PROD-EQP-2025-d529cb	Automated Cutting Machine	Automated machine for cutting materials like tubing and fabrics to precise lengths	Available	2025-03-23
PROD-EQP-2025-854961	CNC Milling Machine (5-axis)	High-precision 5 axis CNC milling machine for complex metal parts with intricate geometries	Available	2025-03-23
PROD-EQP-2025-235d6a	Laser Cutting & Engraving Machine	CO2 laser cutter and engraver for precise cutting and marking of various materials, including metals, plastics, and wood	Under Maintenance	2025-03-23
PROD-EQP-2025-470b47	Industrial 3D Printer (SLA)	Stereolithography (SLA) 3D printer for high-resolution prototypes and custom parts with fine details and smooth surfaces	Available	2025-03-23
PROD-EQP-2025-ac9d90	Welding Station	Multi-process welding station with MIG, TIG, and stick welding capabilities	Available	2025-03-23
PROD-EQP-2025-b88b15	Paint Booth	Enclosed paint booth with ventilation system for applying custom finishes	Available	2025-03-23
PROD-EQP-2025-8e8bf8	Industrial Sewing Machine	Heavy-duty sewing machine for various fabrics and materials	Available	2025-03-23
PROD-EQP-2025-484d01	Pick and Place Machine	Automated pick and place machine for precise placement of electronic components on printed circuit boards (PCBs)	Available	2025-03-23
PROD-EQP-2025-150f34	Reflow Oven	Reflow oven for soldering electronic components to PCBs	Available	2024-03-05
PROD-EQP-2025-56762b	Optical Inspection (AOI) Machine	AOI machine for visual inspection of PCBs for defects and quality control	Available	2025-03-23
PROD-EQP-2025-d4dd00	Wave Soldering Machine	Wave soldering machine for soldering through-hole components to PCBs	Out of Order	2025-03-23
PROD-EQP-2025-74a017	Molding Machine	A machine for molding plastic components for medical devices	Available	2025-03-23
PROD-EQP-2025-248637	Precision Grinding Machine	Grinding machine for shaping metal parts to precise dimensions	Available	2025-03-23
PROD-EQP-2025-bf3c37	Robotic Assembly Arm	Robotic arm for precise and repetitive assembly of medical device components	Available	2025-03-23
PROD-EQP-2025-cb1332	Cleanroom Injection Molder	Injection molding machine designed for cleanroom environments	Under Maintenance	2025-03-23
PROD-EQP-2025-e60ea2	Dispensing System	System for precise dispensing of adhesives and other fluids in medical device manufacturing	Available	2025-03-23
PROD-EQP-2025-f0aecb	Wire EDM Machine	Electrical discharge machine for cutting intricate shapes in conductive materials	Available	2025-03-23
PROD-EQP-2025-2ab79d	Precision Stamping Press	Stamping press for forming sheet metal components with high accuracy	Available	2025-03-23
PROD-EQP-2025-554a3e	Automated Labeling Machine	Machine for automated labeling of medical devices and components	Available	2025-03-23
PROD-EQP-2025-130f53	Ultrasonic Cleaner	Industrial ultrasonic cleaner for cleaning medical device components	Available	2025-03-23
PROD-EQP-2025-5dbf97	Automated Cutting Machine	Automated machine for cutting materials like tubing and fabrics to precise lengths	Available	2025-03-23
\.


--
-- Data for Name: labor; Type: TABLE DATA; Schema: production; Owner: postgres
--

COPY production.labor (labor_id, production_order_id, employee_id, date_worked, hours_worked) FROM stdin;
PROD-LAB-2025-8c25e6	\N	\N	2024-03-05 13:00:00	8
PROD-LAB-2025-5c24cd	\N	\N	2024-03-06 12:00:00	7
PROD-LAB-2025-7a986a	\N	\N	2024-03-10 12:30:00	6
PROD-LAB-2025-74cbf7	\N	\N	2024-03-11 13:00:00	5
PROD-LAB-2025-d401f1	\N	\N	2024-03-15 11:00:00	8
PROD-LAB-2025-3cbb41	\N	\N	2024-04-01 11:00:00	7
PROD-LAB-2025-60834a	\N	\N	2024-04-05 10:30:00	6
PROD-LAB-2025-e2d96a	\N	\N	2024-04-10 10:00:00	5
PROD-LAB-2025-272dbd	\N	\N	2024-04-15 11:00:00	8
PROD-LAB-2025-bead24	\N	\N	2024-04-20 11:00:00	7
PROD-LAB-2025-c00964	\N	\N	2024-04-25 09:00:00	6
PROD-LAB-2025-b6e9ed	\N	\N	2024-04-30 14:00:00	8
PROD-LAB-2025-be2aab	\N	\N	2024-05-05 10:00:00	7
PROD-LAB-2025-cd1d3d	\N	\N	2024-05-10 13:30:00	5
PROD-LAB-2025-cd9e29	\N	\N	2024-05-15 08:00:00	9
PROD-LAB-2025-56a288	\N	\N	2024-05-20 15:00:00	7
PROD-LAB-2025-7e217b	\N	\N	2024-05-25 11:00:00	6
PROD-LAB-2025-ce2efe	\N	\N	2024-05-30 09:00:00	8
PROD-LAB-2025-aed2ab	\N	\N	2024-06-05 14:00:00	7
PROD-LAB-2025-700133	\N	\N	2024-06-10 12:00:00	6
PROD-LAB-2025-650e1b	\N	\N	2024-03-05 13:00:00	8
PROD-LAB-2025-e5b0c7	\N	\N	2024-03-06 12:00:00	7
PROD-LAB-2025-b76ae8	\N	\N	2024-03-10 12:30:00	6
PROD-LAB-2025-db4ed9	\N	\N	2024-03-11 13:00:00	5
PROD-LAB-2025-9e12c1	\N	\N	2024-03-15 11:00:00	8
PROD-LAB-2025-244074	\N	\N	2024-04-01 11:00:00	7
PROD-LAB-2025-ef02a2	\N	\N	2024-04-05 10:30:00	6
PROD-LAB-2025-c9cdcd	\N	\N	2024-04-10 10:00:00	5
PROD-LAB-2025-e713b0	\N	\N	2024-04-15 11:00:00	8
PROD-LAB-2025-48bd38	\N	\N	2024-04-20 11:00:00	7
PROD-LAB-2025-1cc4c3	\N	\N	2024-04-25 09:00:00	6
PROD-LAB-2025-40dc16	\N	\N	2024-04-30 14:00:00	8
PROD-LAB-2025-a969b0	\N	\N	2024-05-05 10:00:00	7
PROD-LAB-2025-172a6e	\N	\N	2024-05-10 13:30:00	5
PROD-LAB-2025-3f6bfe	\N	\N	2024-05-15 08:00:00	9
PROD-LAB-2025-a1c724	\N	\N	2024-05-20 15:00:00	7
PROD-LAB-2025-d707b9	\N	\N	2024-05-25 11:00:00	6
PROD-LAB-2025-8396f5	\N	\N	2024-05-30 09:00:00	8
PROD-LAB-2025-542fa8	\N	\N	2024-06-05 14:00:00	7
PROD-LAB-2025-e99a6b	\N	\N	2024-06-10 12:00:00	6
\.


--
-- Data for Name: production_orders_details; Type: TABLE DATA; Schema: production; Owner: postgres
--

COPY production.production_orders_details (production_order_detail_id, production_order_id, actual_quantity, cost_of_production, miscellaneous_costs, equipment_id, rework_required, rework_notes, content_id) FROM stdin;
PROD-POD-2025-c015f2	\N	10	1500.00	50.00	\N	f	\N	\N
PROD-POD-2025-01f7d7	\N	5	800.00	20.00	\N	t	Minor adjustments needed due to tube leaks	\N
PROD-POD-2025-3b6595	\N	20	800.00	60.00	\N	f	\N	\N
PROD-POD-2025-bbacf5	\N	8	1200.00	30.00	\N	f	\N	\N
PROD-POD-2025-645397	\N	16	1800.00	100.00	\N	f	\N	\N
PROD-POD-2025-cdcd89	\N	12	900.00	40.00	\N	f	\N	\N
PROD-POD-2025-e25f9d	\N	25	1100.00	70.00	\N	t	Recalibration needed for 3D printer	\N
PROD-POD-2025-2794b3	\N	15	1600.00	80.00	\N	f	\N	\N
PROD-POD-2025-e1b1e6	\N	30	2000.00	120.00	\N	f	\N	\N
PROD-POD-2025-f124a5	\N	20	1300.00	90.00	\N	f	\N	\N
PROD-POD-2025-6f5811	\N	18	2500.00	150.00	\N	f	\N	\N
PROD-POD-2025-0c63f1	\N	10	1200.00	80.00	\N	t	Calibration needed for accuracy	\N
PROD-POD-2025-95b3d9	\N	22	1800.00	110.00	\N	f	\N	\N
PROD-POD-2025-5ef341	\N	12	1000.00	60.00	\N	f	\N	\N
PROD-POD-2025-ae48f0	\N	20	2200.00	140.00	\N	f	\N	\N
PROD-POD-2025-b96274	\N	15	1400.00	90.00	\N	t	Re-assembly required for one unit	\N
PROD-POD-2025-076be0	\N	28	3000.00	180.00	\N	f	\N	\N
PROD-POD-2025-567fee	\N	18	2000.00	130.00	\N	f	\N	\N
PROD-POD-2025-2c8ccf	\N	35	2800.00	170.00	\N	f	\N	\N
PROD-POD-2025-6ad37d	\N	25	1700.00	100.00	\N	t	Final adjustments needed	\N
PROD-POD-2025-e3d78e	\N	10	1500.00	50.00	\N	f	\N	\N
PROD-POD-2025-9d58b7	\N	5	800.00	20.00	\N	t	Minor adjustments needed due to tube leaks	\N
PROD-POD-2025-6a0dae	\N	20	800.00	60.00	\N	f	\N	\N
PROD-POD-2025-e57723	\N	8	1200.00	30.00	\N	f	\N	\N
PROD-POD-2025-c974af	\N	16	1800.00	100.00	\N	f	\N	\N
PROD-POD-2025-5c01c2	\N	12	900.00	40.00	\N	f	\N	\N
PROD-POD-2025-61c06c	\N	25	1100.00	70.00	\N	t	Recalibration needed for 3D printer	\N
PROD-POD-2025-b1c659	\N	15	1600.00	80.00	\N	f	\N	\N
PROD-POD-2025-5d7fee	\N	30	2000.00	120.00	\N	f	\N	\N
PROD-POD-2025-24432c	\N	20	1300.00	90.00	\N	f	\N	\N
PROD-POD-2025-d03ce2	\N	18	2500.00	150.00	\N	f	\N	\N
PROD-POD-2025-01e27b	\N	10	1200.00	80.00	\N	t	Calibration needed for accuracy	\N
PROD-POD-2025-76f00a	\N	22	1800.00	110.00	\N	f	\N	\N
PROD-POD-2025-51dc0d	\N	12	1000.00	60.00	\N	f	\N	\N
PROD-POD-2025-81b6db	\N	20	2200.00	140.00	\N	f	\N	\N
PROD-POD-2025-7f680a	\N	15	1400.00	90.00	\N	t	Re-assembly required for one unit	\N
PROD-POD-2025-e101f3	\N	28	3000.00	180.00	\N	f	\N	\N
PROD-POD-2025-ac36fe	\N	18	2000.00	130.00	\N	f	\N	\N
PROD-POD-2025-410fe2	\N	35	2800.00	170.00	\N	f	\N	\N
PROD-POD-2025-8b955a	\N	25	1700.00	100.00	\N	t	Final adjustments needed	\N
\.


--
-- Data for Name: production_orders_header; Type: TABLE DATA; Schema: production; Owner: postgres
--

COPY production.production_orders_header (production_order_id, task_id, bom_id, start_date, end_date, status, target_quantity, notes) FROM stdin;
PROD-PO-2025-17d230	\N	\N	2024-03-05 09:00:00	2024-03-15 17:00:00	Completed	10	Custom metal bed
PROD-PO-2025-dc89b1	\N	\N	2024-03-10 10:00:00	2024-03-22 16:00:00	In Progress	5	Plastic tubes components
PROD-PO-2025-dae692	\N	\N	2024-03-15 11:00:00	2024-04-05 15:00:00	Pending	20	Laser-cut panels for Project Gamma
PROD-PO-2025-fa1cfa	\N	\N	2024-03-20 13:00:00	2024-03-28 17:00:00	Completed	8	Custom welded frame for Project Delta
PROD-PO-2025-a784e5	\N	\N	2024-03-25 08:00:00	2024-04-10 16:00:00	In Progress	16	Custom painted casings for Project Epsilon
PROD-PO-2025-17f231	\N	\N	2024-04-01 14:00:00	2024-04-12 10:00:00	Pending	12	Wooden display stands
PROD-PO-2025-955928	\N	\N	2024-04-05 09:00:00	2024-04-18 17:00:00	Completed	25	3D printed components for drone
PROD-PO-2025-fa2da0	\N	\N	2024-04-10 10:00:00	2024-04-25 16:00:00	In Progress	15	Custom copper wiring for electronics
PROD-PO-2025-bcedfe	\N	\N	2024-04-15 11:00:00	2024-05-02 15:00:00	Pending	30	Painted metal casings for machinery
PROD-PO-2025-27754c	\N	\N	2024-04-20 13:00:00	2024-04-30 17:00:00	Completed	20	Assembled electronic kits
PROD-PO-2025-1fc2fc	\N	\N	2024-04-25 08:00:00	2024-05-05 17:00:00	Pending	18	Assembly of surgical tool
PROD-PO-2025-084b98	\N	\N	2024-04-30 10:00:00	2024-05-12 16:00:00	In Progress	10	Production of diagnostic device
PROD-PO-2025-9ad4d7	\N	\N	2024-05-05 11:00:00	2024-05-20 15:00:00	Pending	22	Manufacturing of patient monitor
PROD-PO-2025-4f14d3	\N	\N	2024-05-10 13:00:00	2024-05-25 17:00:00	Completed	12	Fabrication of medical cart
PROD-PO-2025-a14953	\N	\N	2024-05-15 08:00:00	2024-06-01 16:00:00	In Progress	20	Production of infusion pump
PROD-PO-2025-0dbbdd	\N	\N	2024-05-20 14:00:00	2024-06-05 10:00:00	Pending	15	Assembly of patient handling equipment
PROD-PO-2025-10227b	\N	\N	2024-05-25 09:00:00	2024-06-10 17:00:00	Completed	28	Manufacturing of surgical robot arm
PROD-PO-2025-2f5eea	\N	\N	2024-05-30 10:00:00	2024-06-15 16:00:00	In Progress	18	Production of medical imaging system
PROD-PO-2025-c632ed	\N	\N	2024-06-05 11:00:00	2024-06-22 15:00:00	Pending	35	Fabrication of hospital bed frames
PROD-PO-2025-eebcf7	\N	\N	2024-06-10 13:00:00	2024-06-30 17:00:00	Completed	25	Assembly of surgical equipment
PROD-PO-2025-d2aeb6	\N	\N	2024-03-05 09:00:00	2024-03-15 17:00:00	Completed	10	Custom metal bed
PROD-PO-2025-bdcf40	\N	\N	2024-03-10 10:00:00	2024-03-22 16:00:00	In Progress	5	Plastic tubes components
PROD-PO-2025-6ebf66	\N	\N	2024-03-15 11:00:00	2024-04-05 15:00:00	Pending	20	Laser-cut panels for Project Gamma
PROD-PO-2025-f9e0a4	\N	\N	2024-03-20 13:00:00	2024-03-28 17:00:00	Completed	8	Custom welded frame for Project Delta
PROD-PO-2025-7e5661	\N	\N	2024-03-25 08:00:00	2024-04-10 16:00:00	In Progress	16	Custom painted casings for Project Epsilon
PROD-PO-2025-4a740c	\N	\N	2024-04-01 14:00:00	2024-04-12 10:00:00	Pending	12	Wooden display stands
PROD-PO-2025-6049c8	\N	\N	2024-04-05 09:00:00	2024-04-18 17:00:00	Completed	25	3D printed components for drone
PROD-PO-2025-e5fe34	\N	\N	2024-04-10 10:00:00	2024-04-25 16:00:00	In Progress	15	Custom copper wiring for electronics
PROD-PO-2025-433639	\N	\N	2024-04-15 11:00:00	2024-05-02 15:00:00	Pending	30	Painted metal casings for machinery
PROD-PO-2025-2f1f58	\N	\N	2024-04-20 13:00:00	2024-04-30 17:00:00	Completed	20	Assembled electronic kits
PROD-PO-2025-af945e	\N	\N	2024-04-25 08:00:00	2024-05-05 17:00:00	Pending	18	Assembly of surgical tool
PROD-PO-2025-10114e	\N	\N	2024-04-30 10:00:00	2024-05-12 16:00:00	In Progress	10	Production of diagnostic device
PROD-PO-2025-dcd848	\N	\N	2024-05-05 11:00:00	2024-05-20 15:00:00	Pending	22	Manufacturing of patient monitor
PROD-PO-2025-1985b7	\N	\N	2024-05-10 13:00:00	2024-05-25 17:00:00	Completed	12	Fabrication of medical cart
PROD-PO-2025-880b7c	\N	\N	2024-05-15 08:00:00	2024-06-01 16:00:00	In Progress	20	Production of infusion pump
PROD-PO-2025-59b6e4	\N	\N	2024-05-20 14:00:00	2024-06-05 10:00:00	Pending	15	Assembly of patient handling equipment
PROD-PO-2025-305c71	\N	\N	2024-05-25 09:00:00	2024-06-10 17:00:00	Completed	28	Manufacturing of surgical robot arm
PROD-PO-2025-81c350	\N	\N	2024-05-30 10:00:00	2024-06-15 16:00:00	In Progress	18	Production of medical imaging system
PROD-PO-2025-087b15	\N	\N	2024-06-05 11:00:00	2024-06-22 15:00:00	Pending	35	Fabrication of hospital bed frames
PROD-PO-2025-d3fb4a	\N	\N	2024-06-10 13:00:00	2024-06-30 17:00:00	Completed	25	Assembly of surgical equipment
\.


--
-- Data for Name: contractual_worker_request; Type: TABLE DATA; Schema: project_management; Owner: postgres
--

COPY project_management.contractual_worker_request (request_id, intrnl_project_id, job_title, job_description, required_position, employment_type, dept_id) FROM stdin;
PROJ-CWR-2025-0de939	\N	ERP Security Analyst	Ensure security compliance and system upgrades.	Cybersecurity Specialist	fixed-term	\N
PROJ-CWR-2025-ec0fbb	\N	Training Coordinator	Organize and conduct employee training sessions.	Training Specialist	temporary employment	\N
PROJ-CWR-2025-a3ffbd	\N	Business Process Consultant	Analyze and optimize department workflows.	Process Analyst	freelance	\N
PROJ-CWR-2025-c85bf4	\N	Network Engineer	Enhance ERP cybersecurity and firewall setup.	Network Security Engineer	fixed-term	\N
PROJ-CWR-2025-48804a	\N	Compliance Officer	Develop compliance training modules.	Regulatory Specialist	temporary employment	\N
PROJ-CWR-2025-cba6bb	\N	Inventory System Analyst	Revamp and optimize inventory tracking.	Supply Chain Analyst	freelance	\N
PROJ-CWR-2025-cd2461	\N	Software Integration Developer	Implement third-party software integrations.	Software Developer	fixed-term	\N
PROJ-CWR-2025-89e446	\N	Leadership Coach	Conduct leadership development workshops.	Executive Trainer	freelance	\N
PROJ-CWR-2025-a8d8d5	\N	HR Policy Analyst	Review and update HR policies.	HR Consultant	temporary employment	\N
PROJ-CWR-2025-4f21ee	\N	IT Infrastructure Technician	Assist in upgrading IT infrastructure.	Infrastructure Specialist	internships	\N
PROJ-CWR-2025-cf153e	\N	Software Developer	Develop and maintain ERP modules.	Backend Developer	fixed-term	\N
PROJ-CWR-2025-621655	\N	Data Analyst	Analyze project performance data.	Business Intelligence Analyst	freelance	\N
PROJ-CWR-2025-1b3c1c	\N	Cybersecurity Specialist	Enhance security measures for ERP.	Security Engineer	temporary employment	\N
PROJ-CWR-2025-2c6562	\N	Training Coordinator	Organize internal training sessions.	Training Manager	internships	\N
PROJ-CWR-2025-f2786d	\N	Project Manager	Oversee internal project execution.	Senior Project Manager	fixed-term	\N
PROJ-CWR-2025-c52090	\N	Quality Assurance Tester	Test new system functionalities.	QA Engineer	freelance	\N
PROJ-CWR-2025-19d3a5	\N	Network Administrator	Manage internal network infrastructure.	Network Engineer	temporary employment	\N
PROJ-CWR-2025-6aa199	\N	UX/UI Designer	Redesign ERP user interface.	Senior Designer	fixed-term	\N
PROJ-CWR-2025-6ac1bd	\N	HR Consultant	Improve employee onboarding strategies.	HR Specialist	freelance	\N
PROJ-CWR-2025-098b84	\N	Database Administrator	Optimize internal database performance.	DBA	temporary employment	\N
PROJ-CWR-2025-776c7e	\N	ERP Security Analyst	Ensure security compliance and system upgrades.	Cybersecurity Specialist	fixed-term	\N
PROJ-CWR-2025-cbaea1	\N	Training Coordinator	Organize and conduct employee training sessions.	Training Specialist	temporary employment	\N
PROJ-CWR-2025-105660	\N	Business Process Consultant	Analyze and optimize department workflows.	Process Analyst	freelance	\N
PROJ-CWR-2025-b0f7df	\N	Network Engineer	Enhance ERP cybersecurity and firewall setup.	Network Security Engineer	fixed-term	\N
PROJ-CWR-2025-e79897	\N	Compliance Officer	Develop compliance training modules.	Regulatory Specialist	temporary employment	\N
PROJ-CWR-2025-67e759	\N	Inventory System Analyst	Revamp and optimize inventory tracking.	Supply Chain Analyst	freelance	\N
PROJ-CWR-2025-1a8339	\N	Software Integration Developer	Implement third-party software integrations.	Software Developer	fixed-term	\N
PROJ-CWR-2025-3beeba	\N	Leadership Coach	Conduct leadership development workshops.	Executive Trainer	freelance	\N
PROJ-CWR-2025-a158ae	\N	HR Policy Analyst	Review and update HR policies.	HR Consultant	temporary employment	\N
PROJ-CWR-2025-f74388	\N	IT Infrastructure Technician	Assist in upgrading IT infrastructure.	Infrastructure Specialist	internships	\N
PROJ-CWR-2025-93366d	\N	Software Developer	Develop and maintain ERP modules.	Backend Developer	fixed-term	\N
PROJ-CWR-2025-578eb5	\N	Data Analyst	Analyze project performance data.	Business Intelligence Analyst	freelance	\N
PROJ-CWR-2025-952f25	\N	Cybersecurity Specialist	Enhance security measures for ERP.	Security Engineer	temporary employment	\N
PROJ-CWR-2025-83f2ea	\N	Training Coordinator	Organize internal training sessions.	Training Manager	internships	\N
PROJ-CWR-2025-295c62	\N	Project Manager	Oversee internal project execution.	Senior Project Manager	fixed-term	\N
PROJ-CWR-2025-88e35f	\N	Quality Assurance Tester	Test new system functionalities.	QA Engineer	freelance	\N
PROJ-CWR-2025-e74c71	\N	Network Administrator	Manage internal network infrastructure.	Network Engineer	temporary employment	\N
PROJ-CWR-2025-5c0b1c	\N	UX/UI Designer	Redesign ERP user interface.	Senior Designer	fixed-term	\N
PROJ-CWR-2025-b794a2	\N	HR Consultant	Improve employee onboarding strategies.	HR Specialist	freelance	\N
PROJ-CWR-2025-339c15	\N	Database Administrator	Optimize internal database performance.	DBA	temporary employment	\N
\.


--
-- Data for Name: external_project_cost_management; Type: TABLE DATA; Schema: project_management; Owner: postgres
--

COPY project_management.external_project_cost_management (project_resources_id, project_id, cost_id, project_budget_approval) FROM stdin;
PROJ-EPRM-2025-6f5357	\N	\N	approved
PROJ-EPRM-2025-4488af	\N	\N	approved
PROJ-EPRM-2025-818ab6	\N	\N	denied
PROJ-EPRM-2025-775851	\N	\N	approved
PROJ-EPRM-2025-8e57e3	\N	\N	approved
PROJ-EPRM-2025-0f77bc	\N	\N	denied
PROJ-EPRM-2025-c3912c	\N	\N	approved
PROJ-EPRM-2025-15cb40	\N	\N	approved
PROJ-EPRM-2025-ccd2c7	\N	\N	denied
PROJ-EPRM-2025-b65c3d	\N	\N	approved
PROJ-EPRM-2025-ec26c1	\N	\N	approved
PROJ-EPRM-2025-c7c501	\N	\N	approved
PROJ-EPRM-2025-d8041f	\N	\N	denied
PROJ-EPRM-2025-c53df8	\N	\N	approved
PROJ-EPRM-2025-579331	\N	\N	approved
PROJ-EPRM-2025-c1ea74	\N	\N	denied
PROJ-EPRM-2025-65d0c5	\N	\N	approved
PROJ-EPRM-2025-d79860	\N	\N	approved
PROJ-EPRM-2025-53e78f	\N	\N	denied
PROJ-EPRM-2025-4c045f	\N	\N	approved
PROJ-EPRM-2025-5cd6fe	\N	\N	approved
PROJ-EPRM-2025-d74003	\N	\N	approved
PROJ-EPRM-2025-dd858f	\N	\N	denied
PROJ-EPRM-2025-11237b	\N	\N	approved
PROJ-EPRM-2025-adb1fe	\N	\N	approved
PROJ-EPRM-2025-a9d4e9	\N	\N	denied
PROJ-EPRM-2025-585288	\N	\N	approved
PROJ-EPRM-2025-200abf	\N	\N	approved
PROJ-EPRM-2025-6d6f44	\N	\N	denied
PROJ-EPRM-2025-688e5d	\N	\N	approved
PROJ-EPRM-2025-4bad3d	\N	\N	approved
PROJ-EPRM-2025-4df330	\N	\N	approved
PROJ-EPRM-2025-7c5eb8	\N	\N	denied
PROJ-EPRM-2025-849462	\N	\N	approved
PROJ-EPRM-2025-fc0438	\N	\N	approved
PROJ-EPRM-2025-33627c	\N	\N	denied
PROJ-EPRM-2025-5fef9e	\N	\N	approved
PROJ-EPRM-2025-01692c	\N	\N	approved
PROJ-EPRM-2025-8876cd	\N	\N	denied
PROJ-EPRM-2025-be1ba4	\N	\N	approved
\.


--
-- Data for Name: external_project_details; Type: TABLE DATA; Schema: project_management; Owner: postgres
--

COPY project_management.external_project_details (project_id, ext_project_request_id, project_status) FROM stdin;
PROJ-EPD-2025-dc9511	\N	not started
PROJ-EPD-2025-5e62be	\N	in progress
PROJ-EPD-2025-3c5d9e	\N	completed
PROJ-EPD-2025-968452	\N	in progress
PROJ-EPD-2025-2d1bca	\N	not started
PROJ-EPD-2025-f2634d	\N	completed
PROJ-EPD-2025-eb7c50	\N	in progress
PROJ-EPD-2025-f40d51	\N	not started
PROJ-EPD-2025-2baf4d	\N	completed
PROJ-EPD-2025-a678b3	\N	in progress
PROJ-EPD-2025-9a2056	\N	not started
PROJ-EPD-2025-90722a	\N	in progress
PROJ-EPD-2025-2e39f4	\N	completed
PROJ-EPD-2025-1ecd23	\N	in progress
PROJ-EPD-2025-4e8703	\N	not started
PROJ-EPD-2025-b773eb	\N	completed
PROJ-EPD-2025-6ee60f	\N	in progress
PROJ-EPD-2025-5f190e	\N	not started
PROJ-EPD-2025-aab24a	\N	completed
PROJ-EPD-2025-a2f4e3	\N	in progress
PROJ-EPD-2025-72bed2	\N	not started
PROJ-EPD-2025-58fb3d	\N	in progress
PROJ-EPD-2025-98336b	\N	completed
PROJ-EPD-2025-37c7e5	\N	in progress
PROJ-EPD-2025-169d1c	\N	not started
PROJ-EPD-2025-84145c	\N	completed
PROJ-EPD-2025-7a694d	\N	in progress
PROJ-EPD-2025-94c960	\N	not started
PROJ-EPD-2025-fbe18e	\N	completed
PROJ-EPD-2025-5c9c8b	\N	in progress
PROJ-EPD-2025-8ff2ad	\N	not started
PROJ-EPD-2025-981b13	\N	in progress
PROJ-EPD-2025-986551	\N	completed
PROJ-EPD-2025-d08b7b	\N	in progress
PROJ-EPD-2025-fddefa	\N	not started
PROJ-EPD-2025-d510fc	\N	completed
PROJ-EPD-2025-273042	\N	in progress
PROJ-EPD-2025-77b32b	\N	not started
PROJ-EPD-2025-7d9131	\N	completed
PROJ-EPD-2025-e5349b	\N	in progress
\.


--
-- Data for Name: external_project_labor; Type: TABLE DATA; Schema: project_management; Owner: postgres
--

COPY project_management.external_project_labor (project_labor_id, project_id, employee_id) FROM stdin;
PROJ-EPL-2025-c894fc	\N	\N
PROJ-EPL-2025-e4ffd4	\N	\N
PROJ-EPL-2025-ad3f8a	\N	\N
PROJ-EPL-2025-97d2ff	\N	\N
PROJ-EPL-2025-649124	\N	\N
PROJ-EPL-2025-58c9b3	\N	\N
PROJ-EPL-2025-64ec27	\N	\N
PROJ-EPL-2025-8392ce	\N	\N
PROJ-EPL-2025-03f798	\N	\N
PROJ-EPL-2025-116f44	\N	\N
PROJ-EPL-2025-e9cd01	\N	\N
PROJ-EPL-2025-f04c8b	\N	\N
PROJ-EPL-2025-da3788	\N	\N
PROJ-EPL-2025-98f92c	\N	\N
PROJ-EPL-2025-ad7925	\N	\N
PROJ-EPL-2025-02ec1a	\N	\N
PROJ-EPL-2025-1aaad8	\N	\N
PROJ-EPL-2025-1cacff	\N	\N
PROJ-EPL-2025-e11846	\N	\N
PROJ-EPL-2025-fa9159	\N	\N
PROJ-EPL-2025-168c77	\N	\N
PROJ-EPL-2025-cc9ed3	\N	\N
PROJ-EPL-2025-314b88	\N	\N
PROJ-EPL-2025-f2df98	\N	\N
PROJ-EPL-2025-f95329	\N	\N
PROJ-EPL-2025-73f3ae	\N	\N
PROJ-EPL-2025-f4ed45	\N	\N
PROJ-EPL-2025-3a28f4	\N	\N
PROJ-EPL-2025-8ad22a	\N	\N
PROJ-EPL-2025-5fe57f	\N	\N
PROJ-EPL-2025-4d272b	\N	\N
PROJ-EPL-2025-506979	\N	\N
PROJ-EPL-2025-5135c2	\N	\N
PROJ-EPL-2025-f69753	\N	\N
PROJ-EPL-2025-10daa9	\N	\N
PROJ-EPL-2025-c1c84b	\N	\N
PROJ-EPL-2025-d41b6b	\N	\N
PROJ-EPL-2025-5ad4be	\N	\N
PROJ-EPL-2025-fd8b5a	\N	\N
PROJ-EPL-2025-2a119f	\N	\N
\.


--
-- Data for Name: external_project_request; Type: TABLE DATA; Schema: project_management; Owner: postgres
--

COPY project_management.external_project_request (ext_project_request_id, ext_project_name, ext_project_description, approval_id, item_id) FROM stdin;
PROJ-EPR-2025-1282fd	OEC Elite x10	Manufacturing 10 units of OEC Elite C-arm X-ray machines for the client.	\N	\N
PROJ-EPR-2025-74c12d	Aquadis 56 x5	Producing 5 units of Aquadis 56 medical washer-disinfectors.	\N	\N
PROJ-EPR-2025-f78e86	UA-66 x20	Client placed an order for 20 UA-66 ultrasound machines.	\N	\N
PROJ-EPR-2025-1b1cb5	BeneVision N22/N19 x15	Hospital requires 15 BeneVision N22/N19 patient monitors.	\N	\N
PROJ-EPR-2025-db503f	Senographe Pristina x8	Manufacturing 8 units of Senographe Pristina mammography systems.	\N	\N
PROJ-EPR-2025-0aad0c	uMEC Series x12	Client ordered 12 uMEC Series patient monitors.	\N	\N
PROJ-EPR-2025-b7c830	TNI HighFlow x25	Producing 25 TNI HighFlow respiratory therapy units.	\N	\N
PROJ-EPR-2025-81a787	uMed 20 x30	Manufacturing 30 units of uMed 20 portable patient monitors.	\N	\N
PROJ-EPR-2025-9bceda	Wato EX-20 x7	Client requested 7 Wato EX-20 anesthesia machines.	\N	\N
PROJ-EPR-2025-6a2642	Rad-97 Pulse CO-Oximeter x18	Producing 18 Rad-97 Pulse CO-Oximeters for the hospital.	\N	\N
PROJ-EPR-2025-93126d	OEC Elite x12	Manufacturing 12 units of OEC Elite C-arm X-ray machines for the client.	\N	\N
PROJ-EPR-2025-aa9d25	Aquadis 56 x8	Producing 8 units of Aquadis 56 medical washer-disinfectors.	\N	\N
PROJ-EPR-2025-23b807	UA-66 x15	Client placed an order for 15 UA-66 ultrasound machines.	\N	\N
PROJ-EPR-2025-9fc670	BeneVision N22/N19 x20	Hospital requires 20 BeneVision N22/N19 patient monitors.	\N	\N
PROJ-EPR-2025-6ae4ad	Senographe Pristina x10	Manufacturing 10 units of Senographe Pristina mammography systems.	\N	\N
PROJ-EPR-2025-4f1115	uMEC Series x18	Client ordered 18 uMEC Series patient monitors.	\N	\N
PROJ-EPR-2025-ae339c	TNI HighFlow x30	Producing 30 TNI HighFlow respiratory therapy units.	\N	\N
PROJ-EPR-2025-943eb8	uMed 20 x35	Manufacturing 35 units of uMed 20 portable patient monitors.	\N	\N
PROJ-EPR-2025-e18c2a	Wato EX-20 x9	Client requested 9 Wato EX-20 anesthesia machines.	\N	\N
PROJ-EPR-2025-d44e8a	Rad-97 Pulse CO-Oximeter x22	Producing 22 Rad-97 Pulse CO-Oximeters for the hospital.	\N	\N
PROJ-EPR-2025-d64ba1	OEC Elite x10	Manufacturing 10 units of OEC Elite C-arm X-ray machines for the client.	\N	\N
PROJ-EPR-2025-374a73	Aquadis 56 x5	Producing 5 units of Aquadis 56 medical washer-disinfectors.	\N	\N
PROJ-EPR-2025-1c9bef	UA-66 x20	Client placed an order for 20 UA-66 ultrasound machines.	\N	\N
PROJ-EPR-2025-e62c43	BeneVision N22/N19 x15	Hospital requires 15 BeneVision N22/N19 patient monitors.	\N	\N
PROJ-EPR-2025-79939a	Senographe Pristina x8	Manufacturing 8 units of Senographe Pristina mammography systems.	\N	\N
PROJ-EPR-2025-5cbdbe	uMEC Series x12	Client ordered 12 uMEC Series patient monitors.	\N	\N
PROJ-EPR-2025-ff671f	TNI HighFlow x25	Producing 25 TNI HighFlow respiratory therapy units.	\N	\N
PROJ-EPR-2025-4035eb	uMed 20 x30	Manufacturing 30 units of uMed 20 portable patient monitors.	\N	\N
PROJ-EPR-2025-1403fe	Wato EX-20 x7	Client requested 7 Wato EX-20 anesthesia machines.	\N	\N
PROJ-EPR-2025-9f6f3e	Rad-97 Pulse CO-Oximeter x18	Producing 18 Rad-97 Pulse CO-Oximeters for the hospital.	\N	\N
PROJ-EPR-2025-336db5	OEC Elite x12	Manufacturing 12 units of OEC Elite C-arm X-ray machines for the client.	\N	\N
PROJ-EPR-2025-4173b5	Aquadis 56 x8	Producing 8 units of Aquadis 56 medical washer-disinfectors.	\N	\N
PROJ-EPR-2025-ed6131	UA-66 x15	Client placed an order for 15 UA-66 ultrasound machines.	\N	\N
PROJ-EPR-2025-584a5a	BeneVision N22/N19 x20	Hospital requires 20 BeneVision N22/N19 patient monitors.	\N	\N
PROJ-EPR-2025-e0b77d	Senographe Pristina x10	Manufacturing 10 units of Senographe Pristina mammography systems.	\N	\N
PROJ-EPR-2025-ef8bb9	uMEC Series x18	Client ordered 18 uMEC Series patient monitors.	\N	\N
PROJ-EPR-2025-04a82d	TNI HighFlow x30	Producing 30 TNI HighFlow respiratory therapy units.	\N	\N
PROJ-EPR-2025-d3c20b	uMed 20 x35	Manufacturing 35 units of uMed 20 portable patient monitors.	\N	\N
PROJ-EPR-2025-8416cd	Wato EX-20 x9	Client requested 9 Wato EX-20 anesthesia machines.	\N	\N
PROJ-EPR-2025-14a373	Rad-97 Pulse CO-Oximeter x22	Producing 22 Rad-97 Pulse CO-Oximeters for the hospital.	\N	\N
PROJ-EPR-2025-8ee690	Project for Order SALES-ORD-2025-8fef5b	Automatically generated project request	\N	SALES-ORD-2025-8fef5b
\.


--
-- Data for Name: external_project_task_list; Type: TABLE DATA; Schema: project_management; Owner: postgres
--

COPY project_management.external_project_task_list (task_id, project_id, task_description, task_status, task_deadline, project_labor_id) FROM stdin;
PROJ-EPT-2025-64732d	\N	Assemble OEC Elite frame	in_progress	2025-03-20	\N
PROJ-EPT-2025-038c03	\N	Install imaging software	pending	2025-03-25	\N
PROJ-EPT-2025-b391c1	\N	Quality check for Aquadis 56	completed	2025-03-10	\N
PROJ-EPT-2025-4fbabc	\N	Calibrate UA-66 ultrasound sensors	in_progress	2025-03-18	\N
PROJ-EPT-2025-293c1f	\N	Integrate BeneVision N22/N19 with hospital systems	pending	2025-03-30	\N
PROJ-EPT-2025-c6dea0	\N	Final assembly of Senographe Pristina	completed	2025-03-12	\N
PROJ-EPT-2025-2cb963	\N	Software update for uMEC Series monitors	in_progress	2025-03-22	\N
PROJ-EPT-2025-e73476	\N	Test airflow mechanism in TNI HighFlow devices	pending	2025-03-28	\N
PROJ-EPT-2025-d5af8e	\N	Assemble battery unit for uMed 20	completed	2025-03-15	\N
PROJ-EPT-2025-fcf42a	\N	Verify gas flow calibration for Wato EX-20	in_progress	2025-03-24	\N
PROJ-EPT-2025-eb507a	\N	Connect Rad-97 Pulse CO-Oximeter to wireless system	canceled	2025-03-26	\N
PROJ-EPT-2025-0d2b80	\N	Assemble components for OEC Elite units	in_progress	2025-04-15	\N
PROJ-EPT-2025-daaa0b	\N	Test quality control for Aquadis 56 units	pending	2025-04-20	\N
PROJ-EPT-2025-81c94d	\N	Conduct performance calibration for UA-66	completed	2025-03-30	\N
PROJ-EPT-2025-50192b	\N	Prepare software installation for BeneVision N22/N19	in_progress	2025-04-10	\N
PROJ-EPT-2025-a6b942	\N	Finalize packaging for Senographe Pristina units	pending	2025-04-25	\N
PROJ-EPT-2025-bf612f	\N	Perform electrical safety tests on uMEC Series	completed	2025-03-28	\N
PROJ-EPT-2025-771bb8	\N	Ensure airflow accuracy for TNI HighFlow devices	in_progress	2025-05-01	\N
PROJ-EPT-2025-e91adb	\N	Update firmware on uMed 20 units	pending	2025-05-05	\N
PROJ-EPT-2025-ad97f2	\N	Verify gas flow on Wato EX-20 anesthesia machines	in_progress	2025-04-12	\N
PROJ-EPT-2025-7f6e8c	\N	Check SpO2 sensor calibration on Rad-97 Pulse CO-Oximeter	completed	2025-06-01	\N
PROJ-EPT-2025-0d5d06	\N	Assemble OEC Elite frame	in_progress	2025-03-20	\N
PROJ-EPT-2025-11423a	\N	Install imaging software	pending	2025-03-25	\N
PROJ-EPT-2025-880d16	\N	Quality check for Aquadis 56	completed	2025-03-10	\N
PROJ-EPT-2025-0ba134	\N	Calibrate UA-66 ultrasound sensors	in_progress	2025-03-18	\N
PROJ-EPT-2025-3ad9c2	\N	Integrate BeneVision N22/N19 with hospital systems	pending	2025-03-30	\N
PROJ-EPT-2025-0587dd	\N	Final assembly of Senographe Pristina	completed	2025-03-12	\N
PROJ-EPT-2025-cba7c1	\N	Software update for uMEC Series monitors	in_progress	2025-03-22	\N
PROJ-EPT-2025-a87be3	\N	Test airflow mechanism in TNI HighFlow devices	pending	2025-03-28	\N
PROJ-EPT-2025-16fc19	\N	Assemble battery unit for uMed 20	completed	2025-03-15	\N
PROJ-EPT-2025-9c9e1b	\N	Verify gas flow calibration for Wato EX-20	in_progress	2025-03-24	\N
PROJ-EPT-2025-9d3862	\N	Connect Rad-97 Pulse CO-Oximeter to wireless system	canceled	2025-03-26	\N
PROJ-EPT-2025-a1a381	\N	Assemble components for OEC Elite units	in_progress	2025-04-15	\N
PROJ-EPT-2025-531b66	\N	Test quality control for Aquadis 56 units	pending	2025-04-20	\N
PROJ-EPT-2025-41ca8e	\N	Conduct performance calibration for UA-66	completed	2025-03-30	\N
PROJ-EPT-2025-21bb69	\N	Prepare software installation for BeneVision N22/N19	in_progress	2025-04-10	\N
PROJ-EPT-2025-5a335a	\N	Finalize packaging for Senographe Pristina units	pending	2025-04-25	\N
PROJ-EPT-2025-80a004	\N	Perform electrical safety tests on uMEC Series	completed	2025-03-28	\N
PROJ-EPT-2025-725fe2	\N	Ensure airflow accuracy for TNI HighFlow devices	in_progress	2025-05-01	\N
PROJ-EPT-2025-f25e26	\N	Update firmware on uMed 20 units	pending	2025-05-05	\N
PROJ-EPT-2025-75264e	\N	Verify gas flow on Wato EX-20 anesthesia machines	in_progress	2025-04-12	\N
PROJ-EPT-2025-ec3471	\N	Check SpO2 sensor calibration on Rad-97 Pulse CO-Oximeter	completed	2025-06-01	\N
\.


--
-- Data for Name: external_project_tracking; Type: TABLE DATA; Schema: project_management; Owner: postgres
--

COPY project_management.external_project_tracking (project_tracking_id, project_id, project_milestone, start_date, estimated_end_date, project_warranty_id, project_issue) FROM stdin;
PROJ-EPTK-2025-3f7f46	\N	planning	2025-03-01	2025-03-10	\N	\N
PROJ-EPTK-2025-9eaa73	\N	awaiting_approval	2025-03-05	2025-03-15	\N	Pending final client confirmation
PROJ-EPTK-2025-3e3af7	\N	manufacturing	2025-03-10	2025-04-01	\N	\N
PROJ-EPTK-2025-b7f288	\N	deployment	2025-03-12	2025-04-05	\N	Logistics delay in shipment
PROJ-EPTK-2025-287e31	\N	installation	2025-03-15	2025-04-10	\N	\N
PROJ-EPTK-2025-51d229	\N	completed	2025-02-20	2025-03-01	\N	\N
PROJ-EPTK-2025-f7369a	\N	manufacturing	2025-03-18	2025-04-12	\N	Supplier delay in component delivery
PROJ-EPTK-2025-c13a0d	\N	awaiting_approval	2025-03-22	2025-03-30	\N	\N
PROJ-EPTK-2025-5d2edc	\N	deployment	2025-03-25	2025-04-15	\N	Client requested last-minute customization
PROJ-EPTK-2025-dffc3c	\N	completed	2025-02-28	2025-03-08	\N	\N
PROJ-EPTK-2025-c48f9d	\N	planning	2025-03-01	2025-04-15	\N	\N
PROJ-EPTK-2025-cafe4a	\N	awaiting_approval	2025-03-05	2025-04-20	\N	Pending client feedback
PROJ-EPTK-2025-7656aa	\N	manufacturing	2025-03-10	2025-05-01	\N	\N
PROJ-EPTK-2025-01f02f	\N	deployment	2025-03-15	2025-05-10	\N	Supply chain delays
PROJ-EPTK-2025-29979b	\N	installation	2025-03-20	2025-05-20	\N	\N
PROJ-EPTK-2025-987832	\N	completed	2025-03-25	2025-04-30	\N	\N
PROJ-EPTK-2025-5cb8cf	\N	planning	2025-04-01	2025-05-15	\N	Design revisions required
PROJ-EPTK-2025-f71852	\N	awaiting_approval	2025-04-05	2025-05-20	\N	\N
PROJ-EPTK-2025-3a08ec	\N	manufacturing	2025-04-10	2025-06-01	\N	Material shortage
PROJ-EPTK-2025-ff7c6c	\N	deployment	2025-04-15	2025-06-10	\N	\N
PROJ-EPTK-2025-13fa30	\N	planning	2025-03-01	2025-03-10	\N	\N
PROJ-EPTK-2025-843606	\N	awaiting_approval	2025-03-05	2025-03-15	\N	Pending final client confirmation
PROJ-EPTK-2025-b1db7b	\N	manufacturing	2025-03-10	2025-04-01	\N	\N
PROJ-EPTK-2025-be53de	\N	deployment	2025-03-12	2025-04-05	\N	Logistics delay in shipment
PROJ-EPTK-2025-a6d583	\N	installation	2025-03-15	2025-04-10	\N	\N
PROJ-EPTK-2025-47740f	\N	completed	2025-02-20	2025-03-01	\N	\N
PROJ-EPTK-2025-087649	\N	manufacturing	2025-03-18	2025-04-12	\N	Supplier delay in component delivery
PROJ-EPTK-2025-1858c3	\N	awaiting_approval	2025-03-22	2025-03-30	\N	\N
PROJ-EPTK-2025-d0c156	\N	deployment	2025-03-25	2025-04-15	\N	Client requested last-minute customization
PROJ-EPTK-2025-560d65	\N	completed	2025-02-28	2025-03-08	\N	\N
PROJ-EPTK-2025-82bf0c	\N	planning	2025-03-01	2025-04-15	\N	\N
PROJ-EPTK-2025-fbe236	\N	awaiting_approval	2025-03-05	2025-04-20	\N	Pending client feedback
PROJ-EPTK-2025-ea2276	\N	manufacturing	2025-03-10	2025-05-01	\N	\N
PROJ-EPTK-2025-0865de	\N	deployment	2025-03-15	2025-05-10	\N	Supply chain delays
PROJ-EPTK-2025-ec9b19	\N	installation	2025-03-20	2025-05-20	\N	\N
PROJ-EPTK-2025-924c92	\N	completed	2025-03-25	2025-04-30	\N	\N
PROJ-EPTK-2025-cae550	\N	planning	2025-04-01	2025-05-15	\N	Design revisions required
PROJ-EPTK-2025-0baa11	\N	awaiting_approval	2025-04-05	2025-05-20	\N	\N
PROJ-EPTK-2025-1003af	\N	manufacturing	2025-04-10	2025-06-01	\N	Material shortage
PROJ-EPTK-2025-ed8d12	\N	deployment	2025-04-15	2025-06-10	\N	\N
\.


--
-- Data for Name: external_project_warranty; Type: TABLE DATA; Schema: project_management; Owner: postgres
--

COPY project_management.external_project_warranty (project_warranty_id, project_id, warranty_coverage_yr, warranty_start_date, warranty_end_date) FROM stdin;
PROJ-EPW-2025-12af09	\N	3	2025-04-01	2028-04-01
PROJ-EPW-2025-b42e3c	\N	2	2025-05-15	2027-05-15
PROJ-EPW-2025-f9f9e2	\N	5	2025-06-10	2030-06-10
PROJ-EPW-2025-168141	\N	3	2025-07-20	2028-07-20
PROJ-EPW-2025-8f5c70	\N	4	2025-08-05	2029-08-05
PROJ-EPW-2025-40e39a	\N	2	2025-09-12	2027-09-12
PROJ-EPW-2025-a0b513	\N	3	2025-10-18	2028-10-18
PROJ-EPW-2025-0d4154	\N	1	2025-11-22	2026-11-22
PROJ-EPW-2025-f7f61a	\N	5	2025-12-30	2030-12-30
PROJ-EPW-2025-c0f0fe	\N	4	2026-01-15	2030-01-15
PROJ-EPW-2025-d41f85	\N	2	2025-04-01	2027-04-01
PROJ-EPW-2025-2aea97	\N	3	2025-05-15	2028-05-15
PROJ-EPW-2025-00a9b4	\N	1	2025-06-10	2026-06-10
PROJ-EPW-2025-adb6c7	\N	5	2025-07-20	2030-07-20
PROJ-EPW-2025-4b25e7	\N	2	2025-08-05	2027-08-05
PROJ-EPW-2025-29fa9c	\N	4	2025-09-12	2029-09-12
PROJ-EPW-2025-78a82a	\N	3	2025-10-18	2028-10-18
PROJ-EPW-2025-464541	\N	2	2025-11-25	2027-11-25
PROJ-EPW-2025-cae5dc	\N	1	2025-12-30	2026-12-30
PROJ-EPW-2025-d76503	\N	5	2026-01-15	2031-01-15
PROJ-EPW-2025-d3555d	\N	3	2025-04-01	2028-04-01
PROJ-EPW-2025-86f933	\N	2	2025-05-15	2027-05-15
PROJ-EPW-2025-43db10	\N	5	2025-06-10	2030-06-10
PROJ-EPW-2025-1c5656	\N	3	2025-07-20	2028-07-20
PROJ-EPW-2025-e17882	\N	4	2025-08-05	2029-08-05
PROJ-EPW-2025-7cfbe3	\N	2	2025-09-12	2027-09-12
PROJ-EPW-2025-09c83c	\N	3	2025-10-18	2028-10-18
PROJ-EPW-2025-0c4573	\N	1	2025-11-22	2026-11-22
PROJ-EPW-2025-273bd0	\N	5	2025-12-30	2030-12-30
PROJ-EPW-2025-ff3488	\N	4	2026-01-15	2030-01-15
PROJ-EPW-2025-a58d61	\N	2	2025-04-01	2027-04-01
PROJ-EPW-2025-cc7be5	\N	3	2025-05-15	2028-05-15
PROJ-EPW-2025-92cd81	\N	1	2025-06-10	2026-06-10
PROJ-EPW-2025-2eb94f	\N	5	2025-07-20	2030-07-20
PROJ-EPW-2025-2891ca	\N	2	2025-08-05	2027-08-05
PROJ-EPW-2025-f481db	\N	4	2025-09-12	2029-09-12
PROJ-EPW-2025-06d4c9	\N	3	2025-10-18	2028-10-18
PROJ-EPW-2025-4cca5f	\N	2	2025-11-25	2027-11-25
PROJ-EPW-2025-f43dee	\N	1	2025-12-30	2026-12-30
PROJ-EPW-2025-94e9ab	\N	5	2026-01-15	2031-01-15
\.


--
-- Data for Name: internal_project_details; Type: TABLE DATA; Schema: project_management; Owner: postgres
--

COPY project_management.internal_project_details (intrnl_project_id, project_request_id, intrnl_project_status) FROM stdin;
PROJ-IPD-2025-0aef07	\N	not started
PROJ-IPD-2025-591af6	\N	in progress
PROJ-IPD-2025-5a61ac	\N	completed
PROJ-IPD-2025-fe500e	\N	in progress
PROJ-IPD-2025-5b562b	\N	not started
PROJ-IPD-2025-87cc21	\N	completed
PROJ-IPD-2025-0a52ed	\N	in progress
PROJ-IPD-2025-fffdc9	\N	not started
PROJ-IPD-2025-e9a578	\N	completed
PROJ-IPD-2025-8bceec	\N	in progress
PROJ-IPD-2025-6893da	\N	not started
PROJ-IPD-2025-a3f9b1	\N	in progress
PROJ-IPD-2025-cda6d8	\N	completed
PROJ-IPD-2025-9c301c	\N	in progress
PROJ-IPD-2025-55ae6e	\N	not started
PROJ-IPD-2025-e5a8a2	\N	completed
PROJ-IPD-2025-24b78a	\N	in progress
PROJ-IPD-2025-d6e9da	\N	not started
PROJ-IPD-2025-f93d44	\N	completed
PROJ-IPD-2025-7ae63d	\N	in progress
PROJ-IPD-2025-227d2c	\N	not started
PROJ-IPD-2025-c97ea5	\N	in progress
PROJ-IPD-2025-525765	\N	completed
PROJ-IPD-2025-9f2544	\N	in progress
PROJ-IPD-2025-dec5fa	\N	not started
PROJ-IPD-2025-bd8320	\N	completed
PROJ-IPD-2025-d4cb3f	\N	in progress
PROJ-IPD-2025-dbb47c	\N	not started
PROJ-IPD-2025-3c0587	\N	completed
PROJ-IPD-2025-4a7703	\N	in progress
PROJ-IPD-2025-2295c8	\N	not started
PROJ-IPD-2025-982540	\N	in progress
PROJ-IPD-2025-7813e5	\N	completed
PROJ-IPD-2025-e22609	\N	in progress
PROJ-IPD-2025-1e96b8	\N	not started
PROJ-IPD-2025-98d10d	\N	completed
PROJ-IPD-2025-df74b3	\N	in progress
PROJ-IPD-2025-ce60e3	\N	not started
PROJ-IPD-2025-b1bb23	\N	completed
PROJ-IPD-2025-0990cb	\N	in progress
\.


--
-- Data for Name: internal_project_labor; Type: TABLE DATA; Schema: project_management; Owner: postgres
--

COPY project_management.internal_project_labor (intrnl_project_labor_id, intrnl_project_id, employee_id) FROM stdin;
PROJ-IPL-2025-3a150c	\N	\N
PROJ-IPL-2025-c0bd29	\N	\N
PROJ-IPL-2025-ac70d1	\N	\N
PROJ-IPL-2025-46ee22	\N	\N
PROJ-IPL-2025-b25d8e	\N	\N
PROJ-IPL-2025-9e997c	\N	\N
PROJ-IPL-2025-692b67	\N	\N
PROJ-IPL-2025-b4bca9	\N	\N
PROJ-IPL-2025-917450	\N	\N
PROJ-IPL-2025-326e9f	\N	\N
PROJ-IPL-2025-b4eabb	\N	\N
PROJ-IPL-2025-c8df2f	\N	\N
PROJ-IPL-2025-63451e	\N	\N
PROJ-IPL-2025-89eecb	\N	\N
PROJ-IPL-2025-97a6cd	\N	\N
PROJ-IPL-2025-b37bd6	\N	\N
PROJ-IPL-2025-f27e56	\N	\N
PROJ-IPL-2025-c758d0	\N	\N
PROJ-IPL-2025-a2eecd	\N	\N
PROJ-IPL-2025-d798c4	\N	\N
PROJ-IPL-2025-728c5b	\N	\N
PROJ-IPL-2025-c353f2	\N	\N
PROJ-IPL-2025-364646	\N	\N
PROJ-IPL-2025-97afe1	\N	\N
PROJ-IPL-2025-233fc9	\N	\N
PROJ-IPL-2025-16bf3f	\N	\N
PROJ-IPL-2025-2bb223	\N	\N
PROJ-IPL-2025-789080	\N	\N
PROJ-IPL-2025-974e81	\N	\N
PROJ-IPL-2025-7c65e6	\N	\N
PROJ-IPL-2025-f1390d	\N	\N
PROJ-IPL-2025-0f5586	\N	\N
PROJ-IPL-2025-e6fa42	\N	\N
PROJ-IPL-2025-d8c6ae	\N	\N
PROJ-IPL-2025-b2796c	\N	\N
PROJ-IPL-2025-1bcdda	\N	\N
PROJ-IPL-2025-bdd553	\N	\N
PROJ-IPL-2025-28cf65	\N	\N
PROJ-IPL-2025-bc794c	\N	\N
PROJ-IPL-2025-3a76d3	\N	\N
PROJ-IPL-2025-803abf	\N	\N
PROJ-IPL-2025-6dd6a3	\N	\N
PROJ-IPL-2025-44c78f	\N	\N
PROJ-IPL-2025-a9b091	\N	\N
PROJ-IPL-2025-724c08	\N	\N
PROJ-IPL-2025-ae9fcb	\N	\N
PROJ-IPL-2025-1dbc7e	\N	\N
PROJ-IPL-2025-ba3714	\N	\N
PROJ-IPL-2025-75fec3	\N	\N
PROJ-IPL-2025-5b38cd	\N	\N
PROJ-IPL-2025-d15714	\N	\N
PROJ-IPL-2025-e38227	\N	\N
PROJ-IPL-2025-4abd5e	\N	\N
PROJ-IPL-2025-69b0c1	\N	\N
PROJ-IPL-2025-ce59f6	\N	\N
PROJ-IPL-2025-5dac94	\N	\N
\.


--
-- Data for Name: internal_project_request; Type: TABLE DATA; Schema: project_management; Owner: postgres
--

COPY project_management.internal_project_request (project_request_id, project_name, project_description, request_date, request_valid_date, request_starting_date, approval_id, employee_id, dept_id, project_type) FROM stdin;
PROJ-IPR-2025-722507	ERP System Upgrade	Upgrade the ERP system with new security patches and features.	2025-03-01	2025-03-10	2025-03-15	\N	\N	\N	changes
PROJ-IPR-2025-defacd	Employee Training Program	Conduct training sessions for new ERP functionalities.	2025-03-05	2025-03-12	2025-03-20	\N	\N	\N	trainings
PROJ-IPR-2025-2cd880	Department Workflow Optimization	Revise department workflow for efficiency improvements.	2025-03-07	2025-03-14	2025-03-22	\N	\N	\N	plans
PROJ-IPR-2025-36adc5	Cybersecurity Enhancement	Implement new security measures in the ERP system.	2025-03-10	2025-03-18	2025-03-25	\N	\N	\N	changes
PROJ-IPR-2025-4688f3	Compliance Training	Train employees on new regulatory compliance policies.	2025-03-12	2025-03-20	2025-03-28	\N	\N	\N	trainings
PROJ-IPR-2025-a15a32	Inventory Management Optimization	Redesign the inventory tracking system for better performance.	2025-03-15	2025-03-25	2025-04-01	\N	\N	\N	plans
PROJ-IPR-2025-6c25e9	Software Integration Plan	Integrate third-party applications with the ERP system.	2025-03-18	2025-03-27	2025-04-05	\N	\N	\N	changes
PROJ-IPR-2025-64fc1c	Leadership Training	Conduct leadership workshops for department managers.	2025-03-20	2025-03-30	2025-04-10	\N	\N	\N	trainings
PROJ-IPR-2025-1d3e57	HR Policy Review	Analyze and update HR policies in accordance with new labor laws.	2025-03-22	2025-04-01	2025-04-08	\N	\N	\N	plans
PROJ-IPR-2025-917f98	IT Infrastructure Upgrade	Upgrade servers and network infrastructure for better performance.	2025-03-25	2025-04-05	2025-04-12	\N	\N	\N	changes
PROJ-IPR-2025-c7ca14	ERP System Upgrade	Upgrade the ERP system to improve performance and security.	2025-03-01	2025-03-10	2025-03-15	\N	\N	\N	plans
PROJ-IPR-2025-0da378	New Compliance Training	Conduct training sessions for new regulatory compliance.	2025-03-05	2025-03-15	2025-03-20	\N	\N	\N	trainings
PROJ-IPR-2025-255666	Inventory Management Overhaul	Redesign inventory tracking processes.	2025-03-10	2025-03-20	2025-03-25	\N	\N	\N	changes
PROJ-IPR-2025-dc5c83	Cybersecurity Enhancement	Implement additional security protocols.	2025-03-12	2025-03-22	2025-03-30	\N	\N	\N	plans
PROJ-IPR-2025-79a692	Employee Onboarding Program	Develop a structured onboarding process.	2025-03-15	2025-03-25	2025-04-01	\N	\N	\N	trainings
PROJ-IPR-2025-50ef44	New Module Development	Add a new project tracking module.	2025-03-18	2025-03-28	2025-04-05	\N	\N	\N	changes
PROJ-IPR-2025-705ff4	Medical Equipment Maintenance Plan	Create a preventive maintenance schedule.	2025-03-20	2025-03-30	2025-04-10	\N	\N	\N	plans
PROJ-IPR-2025-d40d5c	Customer Support Training	Enhance training for customer support staff.	2025-03-22	2025-04-01	2025-04-12	\N	\N	\N	trainings
PROJ-IPR-2025-2025ce	Data Migration Strategy	Plan for migrating legacy data to the new system.	2025-03-25	2025-04-05	2025-04-15	\N	\N	\N	plans
PROJ-IPR-2025-c4d0da	Compliance Audit Preparation	Prepare for an external compliance audit.	2025-03-28	2025-04-08	2025-04-20	\N	\N	\N	changes
PROJ-IPR-2025-e03a73	ERP System Upgrade	Upgrade the ERP system with new security patches and features.	2025-03-01	2025-03-10	2025-03-15	\N	\N	\N	changes
PROJ-IPR-2025-5fbd37	Employee Training Program	Conduct training sessions for new ERP functionalities.	2025-03-05	2025-03-12	2025-03-20	\N	\N	\N	trainings
PROJ-IPR-2025-2ace82	Department Workflow Optimization	Revise department workflow for efficiency improvements.	2025-03-07	2025-03-14	2025-03-22	\N	\N	\N	plans
PROJ-IPR-2025-7d5787	Cybersecurity Enhancement	Implement new security measures in the ERP system.	2025-03-10	2025-03-18	2025-03-25	\N	\N	\N	changes
PROJ-IPR-2025-198941	Compliance Training	Train employees on new regulatory compliance policies.	2025-03-12	2025-03-20	2025-03-28	\N	\N	\N	trainings
PROJ-IPR-2025-10aa1d	Inventory Management Optimization	Redesign the inventory tracking system for better performance.	2025-03-15	2025-03-25	2025-04-01	\N	\N	\N	plans
PROJ-IPR-2025-220cf9	Software Integration Plan	Integrate third-party applications with the ERP system.	2025-03-18	2025-03-27	2025-04-05	\N	\N	\N	changes
PROJ-IPR-2025-212b19	Leadership Training	Conduct leadership workshops for department managers.	2025-03-20	2025-03-30	2025-04-10	\N	\N	\N	trainings
PROJ-IPR-2025-49b674	HR Policy Review	Analyze and update HR policies in accordance with new labor laws.	2025-03-22	2025-04-01	2025-04-08	\N	\N	\N	plans
PROJ-IPR-2025-3dfdde	IT Infrastructure Upgrade	Upgrade servers and network infrastructure for better performance.	2025-03-25	2025-04-05	2025-04-12	\N	\N	\N	changes
PROJ-IPR-2025-47376a	ERP System Upgrade	Upgrade the ERP system to improve performance and security.	2025-03-01	2025-03-10	2025-03-15	\N	\N	\N	plans
PROJ-IPR-2025-92fc2c	New Compliance Training	Conduct training sessions for new regulatory compliance.	2025-03-05	2025-03-15	2025-03-20	\N	\N	\N	trainings
PROJ-IPR-2025-b20207	Inventory Management Overhaul	Redesign inventory tracking processes.	2025-03-10	2025-03-20	2025-03-25	\N	\N	\N	changes
PROJ-IPR-2025-228e1b	Cybersecurity Enhancement	Implement additional security protocols.	2025-03-12	2025-03-22	2025-03-30	\N	\N	\N	plans
PROJ-IPR-2025-0fb7ad	Employee Onboarding Program	Develop a structured onboarding process.	2025-03-15	2025-03-25	2025-04-01	\N	\N	\N	trainings
PROJ-IPR-2025-eb1f21	New Module Development	Add a new project tracking module.	2025-03-18	2025-03-28	2025-04-05	\N	\N	\N	changes
PROJ-IPR-2025-d796cb	Medical Equipment Maintenance Plan	Create a preventive maintenance schedule.	2025-03-20	2025-03-30	2025-04-10	\N	\N	\N	plans
PROJ-IPR-2025-09c538	Customer Support Training	Enhance training for customer support staff.	2025-03-22	2025-04-01	2025-04-12	\N	\N	\N	trainings
PROJ-IPR-2025-e8d751	Data Migration Strategy	Plan for migrating legacy data to the new system.	2025-03-25	2025-04-05	2025-04-15	\N	\N	\N	plans
PROJ-IPR-2025-2c76d6	Compliance Audit Preparation	Prepare for an external compliance audit.	2025-03-28	2025-04-08	2025-04-20	\N	\N	\N	changes
\.


--
-- Data for Name: internal_project_task_list; Type: TABLE DATA; Schema: project_management; Owner: postgres
--

COPY project_management.internal_project_task_list (intrnl_task_id, intrnl_project_id, intrnl_task_description, intrnl_task_status, intrnl_task_deadline, intrnl_project_labor_id) FROM stdin;
PROJ-IPT-2025-04c6c1	\N	Gather requirements for ERP upgrade	in_progress	2025-04-15	\N
PROJ-IPT-2025-a9dcc8	\N	Review security patches	pending	2025-04-20	\N
PROJ-IPT-2025-eb2110	\N	Schedule training sessions	in_progress	2025-04-10	\N
PROJ-IPT-2025-025a92	\N	Prepare training materials	completed	2025-03-30	\N
PROJ-IPT-2025-581d51	\N	Analyze current workflow	completed	2025-03-15	\N
PROJ-IPT-2025-d0b00c	\N	Develop cybersecurity guidelines	in_progress	2025-04-25	\N
PROJ-IPT-2025-29607f	\N	Implement firewall upgrades	pending	2025-05-10	\N
PROJ-IPT-2025-dc7d97	\N	Prepare compliance training module	completed	2025-03-28	\N
PROJ-IPT-2025-a32d0e	\N	Revise inventory tracking system	pending	2025-05-01	\N
PROJ-IPT-2025-954f51	\N	Evaluate third-party integrations	in_progress	2025-05-05	\N
PROJ-IPT-2025-7e8b8d	\N	Organize leadership workshops	completed	2025-04-08	\N
PROJ-IPT-2025-beb857	\N	Update HR policies	pending	2025-04-12	\N
PROJ-IPT-2025-7afcb8	\N	Upgrade IT infrastructure	in_progress	2025-06-01	\N
PROJ-IPT-2025-33e3a0	\N	Gather requirements from department heads.	pending	2025-04-10	\N
PROJ-IPT-2025-8f747d	\N	Develop training materials for new ERP users.	in_progress	2025-04-15	\N
PROJ-IPT-2025-b82ffb	\N	Conduct initial cybersecurity risk assessment.	pending	2025-04-20	\N
PROJ-IPT-2025-48a057	\N	Review current inventory tracking methods.	in_progress	2025-04-25	\N
PROJ-IPT-2025-a5db63	\N	Perform software testing on the upgraded module.	pending	2025-05-01	\N
PROJ-IPT-2025-7bbb1e	\N	Create compliance checklist for upcoming audit.	completed	2025-05-05	\N
PROJ-IPT-2025-0ef08f	\N	Schedule system migration meeting with IT team.	canceled	2025-05-10	\N
PROJ-IPT-2025-4b755e	\N	Finalize new employee onboarding process.	in_progress	2025-05-15	\N
PROJ-IPT-2025-0300fd	\N	Develop data backup strategy before migration.	pending	2025-05-20	\N
PROJ-IPT-2025-53eb50	\N	Implement new customer support workflow.	completed	2025-05-25	\N
PROJ-IPT-2025-491435	\N	Gather requirements for ERP upgrade	in_progress	2025-04-15	\N
PROJ-IPT-2025-ff20e8	\N	Review security patches	pending	2025-04-20	\N
PROJ-IPT-2025-dd4110	\N	Schedule training sessions	in_progress	2025-04-10	\N
PROJ-IPT-2025-9b4b13	\N	Prepare training materials	completed	2025-03-30	\N
PROJ-IPT-2025-a8c56e	\N	Analyze current workflow	completed	2025-03-15	\N
PROJ-IPT-2025-d96bcf	\N	Develop cybersecurity guidelines	in_progress	2025-04-25	\N
PROJ-IPT-2025-d9175a	\N	Implement firewall upgrades	pending	2025-05-10	\N
PROJ-IPT-2025-6f09a9	\N	Prepare compliance training module	completed	2025-03-28	\N
PROJ-IPT-2025-e60b6b	\N	Revise inventory tracking system	pending	2025-05-01	\N
PROJ-IPT-2025-da6d56	\N	Evaluate third-party integrations	in_progress	2025-05-05	\N
PROJ-IPT-2025-8c6e24	\N	Organize leadership workshops	completed	2025-04-08	\N
PROJ-IPT-2025-44658d	\N	Update HR policies	pending	2025-04-12	\N
PROJ-IPT-2025-b21d69	\N	Upgrade IT infrastructure	in_progress	2025-06-01	\N
PROJ-IPT-2025-2049ca	\N	Gather requirements from department heads.	pending	2025-04-10	\N
PROJ-IPT-2025-673346	\N	Develop training materials for new ERP users.	in_progress	2025-04-15	\N
PROJ-IPT-2025-ac42de	\N	Conduct initial cybersecurity risk assessment.	pending	2025-04-20	\N
PROJ-IPT-2025-f6995b	\N	Review current inventory tracking methods.	in_progress	2025-04-25	\N
PROJ-IPT-2025-38b6e6	\N	Perform software testing on the upgraded module.	pending	2025-05-01	\N
PROJ-IPT-2025-9050ef	\N	Create compliance checklist for upcoming audit.	completed	2025-05-05	\N
PROJ-IPT-2025-2c6e18	\N	Schedule system migration meeting with IT team.	canceled	2025-05-10	\N
PROJ-IPT-2025-fb3141	\N	Finalize new employee onboarding process.	in_progress	2025-05-15	\N
PROJ-IPT-2025-0a91b1	\N	Develop data backup strategy before migration.	pending	2025-05-20	\N
PROJ-IPT-2025-1ae492	\N	Implement new customer support workflow.	completed	2025-05-25	\N
\.


--
-- Data for Name: internal_project_tracking; Type: TABLE DATA; Schema: project_management; Owner: postgres
--

COPY project_management.internal_project_tracking (intrnl_project_tracking_id, intrnl_project_id, intrnl_start_date, intrnl_estimated_end_date, intrnl_project_issue) FROM stdin;
PROJ-IPT-2025-41d75c	\N	2025-04-01	2025-06-01	\N
PROJ-IPT-2025-e0f474	\N	2025-03-15	2025-05-20	Delayed due to scheduling conflicts
PROJ-IPT-2025-e1d649	\N	2025-02-10	2025-03-30	\N
PROJ-IPT-2025-70b6f7	\N	2025-03-20	2025-06-15	Technical issue with implementation
PROJ-IPT-2025-29c4e4	\N	2025-04-05	2025-06-10	\N
PROJ-IPT-2025-e3ad7e	\N	2025-01-25	2025-03-01	\N
PROJ-IPT-2025-9462ed	\N	2025-03-18	2025-05-12	Resource allocation issue
PROJ-IPT-2025-665b56	\N	2025-04-10	2025-07-01	\N
PROJ-IPT-2025-c930c0	\N	2025-02-28	2025-04-15	Revisions needed in project scope
PROJ-IPT-2025-0b82b2	\N	2025-03-25	2025-06-05	\N
PROJ-IPT-2025-f46e51	\N	2025-04-01	2025-05-15	\N
PROJ-IPT-2025-a0c290	\N	2025-04-05	2025-06-01	Resource allocation conflict
PROJ-IPT-2025-3005da	\N	2025-04-10	2025-05-25	\N
PROJ-IPT-2025-ec7c6a	\N	2025-04-15	2025-06-10	Delay in software implementation
PROJ-IPT-2025-54a73f	\N	2025-04-20	2025-06-15	\N
PROJ-IPT-2025-b04a7f	\N	2025-04-25	2025-06-20	Pending final approval
PROJ-IPT-2025-9371ab	\N	2025-05-01	2025-06-30	\N
PROJ-IPT-2025-27d796	\N	2025-05-05	2025-07-10	System testing required additional time
PROJ-IPT-2025-6d2c41	\N	2025-05-10	2025-07-15	\N
PROJ-IPT-2025-a4df5a	\N	2025-05-15	2025-07-20	Unexpected technical challenges
PROJ-IPT-2025-b67fab	\N	2025-04-01	2025-06-01	\N
PROJ-IPT-2025-48eefe	\N	2025-03-15	2025-05-20	Delayed due to scheduling conflicts
PROJ-IPT-2025-569026	\N	2025-02-10	2025-03-30	\N
PROJ-IPT-2025-9a5bb7	\N	2025-03-20	2025-06-15	Technical issue with implementation
PROJ-IPT-2025-583902	\N	2025-04-05	2025-06-10	\N
PROJ-IPT-2025-9fa084	\N	2025-01-25	2025-03-01	\N
PROJ-IPT-2025-7556a1	\N	2025-03-18	2025-05-12	Resource allocation issue
PROJ-IPT-2025-8d35db	\N	2025-04-10	2025-07-01	\N
PROJ-IPT-2025-e1f440	\N	2025-02-28	2025-04-15	Revisions needed in project scope
PROJ-IPT-2025-d2cb71	\N	2025-03-25	2025-06-05	\N
PROJ-IPT-2025-a5b7d7	\N	2025-04-01	2025-05-15	\N
PROJ-IPT-2025-7e395e	\N	2025-04-05	2025-06-01	Resource allocation conflict
PROJ-IPT-2025-7d454d	\N	2025-04-10	2025-05-25	\N
PROJ-IPT-2025-6799fb	\N	2025-04-15	2025-06-10	Delay in software implementation
PROJ-IPT-2025-98aa5a	\N	2025-04-20	2025-06-15	\N
PROJ-IPT-2025-395105	\N	2025-04-25	2025-06-20	Pending final approval
PROJ-IPT-2025-a04e97	\N	2025-05-01	2025-06-30	\N
PROJ-IPT-2025-c2c3e0	\N	2025-05-05	2025-07-10	System testing required additional time
PROJ-IPT-2025-2201bf	\N	2025-05-10	2025-07-15	\N
PROJ-IPT-2025-2287d9	\N	2025-05-15	2025-07-20	Unexpected technical challenges
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
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$870000$BVWDrj0ben2jpSa5hGO3le$AilXZyh322cdBNiubvkxSKcIe5Uya/t+Cyauq7ORl+c=	2025-03-23 10:21:05.745121+08	t	admin				t	t	2025-03-23 10:20:22.003192+08
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
1	2025-03-23 10:22:11.721088+08	a	Employees object (a)	1	[{"added": {}}]	8	1
2	2025-03-23 10:22:36.341817+08	a	Employees object (a)	1	[{"added": {}}]	8	1
3	2025-03-23 10:22:59.595285+08	a	Employees object (a)	1	[{"added": {}}]	8	1
4	2025-03-23 10:23:29.895653+08	SALES-STM-2025-600a2f	Statement object (SALES-STM-2025-600a2f)	2	[{"changed": {"fields": ["Customer", "Salesrep"]}}]	7	1
5	2025-03-23 10:25:22.330213+08	SALES-STM-2025-0b7990	Statement object (SALES-STM-2025-0b7990)	3		7	1
6	2025-03-23 10:25:48.401881+08	SALES-STM-2025-f6b7d0	Statement object (SALES-STM-2025-f6b7d0)	2	[{"changed": {"fields": ["Customer", "Salesrep"]}}]	7	1
7	2025-03-23 10:26:10.57867+08	SALES-STM-2025-f4b14f	Statement object (SALES-STM-2025-f4b14f)	2	[{"changed": {"fields": ["Customer", "Salesrep"]}}]	7	1
8	2025-03-23 10:26:15.89947+08	SALES-STM-2025-c86ce6	Statement object (SALES-STM-2025-c86ce6)	2	[{"changed": {"fields": ["Customer", "Salesrep"]}}]	7	1
9	2025-03-23 10:26:23.832793+08	SALES-STM-2025-b90b4b	Statement object (SALES-STM-2025-b90b4b)	2	[{"changed": {"fields": ["Customer", "Salesrep"]}}]	7	1
10	2025-03-23 10:26:42.508144+08	SALES-STM-2025-948f52	Statement object (SALES-STM-2025-948f52)	2	[{"changed": {"fields": ["Customer", "Salesrep"]}}]	7	1
11	2025-03-23 10:26:53.039773+08	SALES-STM-2025-91058d	Statement object (SALES-STM-2025-91058d)	2	[{"changed": {"fields": ["Customer", "Salesrep"]}}]	7	1
12	2025-03-23 10:27:03.834388+08	SALES-STM-2025-755417	Statement object (SALES-STM-2025-755417)	2	[{"changed": {"fields": ["Customer", "Salesrep"]}}]	7	1
13	2025-03-23 10:27:13.380064+08	SALES-STM-2025-6b1653	Statement object (SALES-STM-2025-6b1653)	2	[{"changed": {"fields": ["Customer", "Salesrep"]}}]	7	1
14	2025-03-23 10:27:23.078719+08	SALES-STM-2025-656095	Statement object (SALES-STM-2025-656095)	2	[{"changed": {"fields": ["Customer", "Salesrep"]}}]	7	1
15	2025-03-23 10:27:37.296938+08	SALES-STM-2025-5e569c	Statement object (SALES-STM-2025-5e569c)	2	[{"changed": {"fields": ["Customer", "Salesrep"]}}]	7	1
16	2025-03-23 10:28:00.993354+08	SALES-STM-2025-3acfef	Statement object (SALES-STM-2025-3acfef)	2	[{"changed": {"fields": ["Customer", "Salesrep"]}}]	7	1
17	2025-03-23 10:28:07.78895+08	SALES-STM-2025-f6b7d0	Statement object (SALES-STM-2025-f6b7d0)	2	[]	7	1
18	2025-03-23 10:28:20.015375+08	SALES-STM-2025-35c700	Statement object (SALES-STM-2025-35c700)	2	[{"changed": {"fields": ["Customer", "Salesrep"]}}]	7	1
19	2025-03-23 10:28:28.991818+08	SALES-STM-2025-29deb9	Statement object (SALES-STM-2025-29deb9)	2	[{"changed": {"fields": ["Customer", "Salesrep"]}}]	7	1
20	2025-03-23 10:28:37.354117+08	SALES-STM-2025-16fb8a	Statement object (SALES-STM-2025-16fb8a)	2	[{"changed": {"fields": ["Customer", "Salesrep"]}}]	7	1
21	2025-03-23 10:28:44.734828+08	SALES-STM-2025-2cc7f2	Statement object (SALES-STM-2025-2cc7f2)	2	[{"changed": {"fields": ["Customer", "Salesrep"]}}]	7	1
22	2025-03-23 10:28:54.228684+08	SALES-STM-2025-21f5af	Statement object (SALES-STM-2025-21f5af)	2	[{"changed": {"fields": ["Customer", "Salesrep"]}}]	7	1
23	2025-03-23 10:28:59.520125+08	SALES-STM-2025-2879fa	Statement object (SALES-STM-2025-2879fa)	2	[{"changed": {"fields": ["Customer", "Salesrep"]}}]	7	1
24	2025-03-23 10:29:16.097332+08	SALES-STM-2025-2f3fae	Statement object (SALES-STM-2025-2f3fae)	2	[{"changed": {"fields": ["Customer", "Salesrep"]}}]	7	1
25	2025-03-23 10:31:45.520582+08	SALES-STM-2025-251924	Statement object (SALES-STM-2025-251924)	2	[{"changed": {"fields": ["Customer", "Salesrep"]}}]	7	1
26	2025-03-23 10:34:52.063218+08	SALES-STI-2025-fc3bec	StatementItem object (SALES-STI-2025-fc3bec)	2	[{"changed": {"fields": ["Statement", "Product", "Unit price", "Total price", "Tax amount"]}}]	10	1
27	2025-03-23 10:38:23.372563+08	SALES-STM-2025-600a2f	Statement object (SALES-STM-2025-600a2f)	2	[{"changed": {"fields": ["Total amount", "Total tax"]}}]	7	1
28	2025-03-23 10:38:59.295724+08	SALES-STI-2025-fbdf4d	StatementItem object (SALES-STI-2025-fbdf4d)	2	[{"changed": {"fields": ["Statement", "Product", "Unit price", "Total price", "Tax amount"]}}]	10	1
29	2025-03-23 10:40:17.5999+08	SALES-STM-2025-c86ce6	Statement object (SALES-STM-2025-c86ce6)	2	[{"changed": {"fields": ["Total amount", "Total tax"]}}]	7	1
30	2025-03-23 10:40:19.076254+08	SALES-STI-2025-f090bb	StatementItem object (SALES-STI-2025-f090bb)	2	[{"changed": {"fields": ["Statement", "Product", "Unit price", "Total price", "Tax amount"]}}]	10	1
31	2025-03-23 10:42:27.654465+08	SALES-QT-2025-e3b105	Quotation object (SALES-QT-2025-e3b105)	2	[{"changed": {"fields": ["Statement"]}}]	12	1
32	2025-03-23 10:42:34.679951+08	SALES-QT-2025-e28d7b	Quotation object (SALES-QT-2025-e28d7b)	2	[{"changed": {"fields": ["Statement"]}}]	12	1
33	2025-03-23 10:42:38.555004+08	SALES-QT-2025-e10427	Quotation object (SALES-QT-2025-e10427)	2	[{"changed": {"fields": ["Statement"]}}]	12	1
34	2025-03-23 10:42:42.35509+08	SALES-QT-2025-ce21a5	Quotation object (SALES-QT-2025-ce21a5)	2	[{"changed": {"fields": ["Statement"]}}]	12	1
35	2025-03-23 10:42:47.437324+08	SALES-QT-2025-cb1443	Quotation object (SALES-QT-2025-cb1443)	2	[{"changed": {"fields": ["Statement"]}}]	12	1
36	2025-03-23 10:42:53.56785+08	SALES-QT-2025-c17685	Quotation object (SALES-QT-2025-c17685)	2	[{"changed": {"fields": ["Statement"]}}]	12	1
37	2025-03-23 10:43:02.956558+08	SALES-QT-2025-bdf73c	Quotation object (SALES-QT-2025-bdf73c)	2	[{"changed": {"fields": ["Statement"]}}]	12	1
38	2025-03-23 10:43:12.037761+08	SALES-QT-2025-95ce9c	Quotation object (SALES-QT-2025-95ce9c)	2	[{"changed": {"fields": ["Statement"]}}]	12	1
39	2025-03-23 10:43:22.494012+08	SALES-QT-2025-81ca39	Quotation object (SALES-QT-2025-81ca39)	2	[{"changed": {"fields": ["Statement"]}}]	12	1
40	2025-03-23 10:43:34.846425+08	SALES-QT-2025-6e0ca3	Quotation object (SALES-QT-2025-6e0ca3)	2	[{"changed": {"fields": ["Statement"]}}]	12	1
41	2025-03-23 10:43:46.370595+08	SALES-QT-2025-67ceb9	Quotation object (SALES-QT-2025-67ceb9)	2	[{"changed": {"fields": ["Statement"]}}]	12	1
42	2025-03-23 10:43:54.681623+08	SALES-QT-2025-63b7fd	Quotation object (SALES-QT-2025-63b7fd)	2	[{"changed": {"fields": ["Statement"]}}]	12	1
43	2025-03-23 10:44:00.303913+08	SALES-QT-2025-47f791	Quotation object (SALES-QT-2025-47f791)	2	[{"changed": {"fields": ["Statement"]}}]	12	1
44	2025-03-23 10:44:09.513706+08	SALES-QT-2025-454ae0	Quotation object (SALES-QT-2025-454ae0)	2	[{"changed": {"fields": ["Statement"]}}]	12	1
45	2025-03-23 10:44:18.906489+08	SALES-QT-2025-439eea	Quotation object (SALES-QT-2025-439eea)	2	[{"changed": {"fields": ["Statement"]}}]	12	1
46	2025-03-23 10:44:28.941388+08	SALES-QT-2025-374ab7	Quotation object (SALES-QT-2025-374ab7)	2	[{"changed": {"fields": ["Statement"]}}]	12	1
47	2025-03-23 10:44:33.328713+08	SALES-QT-2025-319285	Quotation object (SALES-QT-2025-319285)	2	[{"changed": {"fields": ["Statement"]}}]	12	1
48	2025-03-23 10:44:39.622388+08	SALES-QT-2025-2735c1	Quotation object (SALES-QT-2025-2735c1)	2	[{"changed": {"fields": ["Statement"]}}]	12	1
49	2025-03-23 10:44:44.139106+08	SALES-QT-2025-12b112	Quotation object (SALES-QT-2025-12b112)	2	[{"changed": {"fields": ["Statement"]}}]	12	1
50	2025-03-23 10:44:48.043558+08	SALES-QT-2025-0815c0	Quotation object (SALES-QT-2025-0815c0)	2	[{"changed": {"fields": ["Statement"]}}]	12	1
51	2025-03-23 10:45:31.44856+08	SALES-STI-2025-ca65f6	StatementItem object (SALES-STI-2025-ca65f6)	2	[{"changed": {"fields": ["Statement", "Product"]}}]	10	1
52	2025-03-23 10:46:36.269049+08	SALES-STI-2025-c956cf	StatementItem object (SALES-STI-2025-c956cf)	2	[{"changed": {"fields": ["Statement", "Product"]}}]	10	1
53	2025-03-23 10:47:15.768646+08	SALES-STI-2025-b58f6a	StatementItem object (SALES-STI-2025-b58f6a)	2	[{"changed": {"fields": ["Statement", "Product"]}}]	10	1
54	2025-03-23 10:49:05.087067+08	SALES-STI-2025-b0fa0b	StatementItem object (SALES-STI-2025-b0fa0b)	2	[{"changed": {"fields": ["Statement", "Product"]}}]	10	1
55	2025-03-23 10:49:39.841041+08	SALES-STI-2025-a09a62	StatementItem object (SALES-STI-2025-a09a62)	2	[{"changed": {"fields": ["Statement", "Product"]}}]	10	1
56	2025-03-23 10:49:55.570106+08	SALES-STI-2025-900021	StatementItem object (SALES-STI-2025-900021)	2	[{"changed": {"fields": ["Statement", "Product"]}}]	10	1
57	2025-03-23 10:50:01.660603+08	SALES-STI-2025-87ad28	StatementItem object (SALES-STI-2025-87ad28)	2	[{"changed": {"fields": ["Statement", "Product"]}}]	10	1
58	2025-03-23 10:50:14.851981+08	SALES-STI-2025-6e1e9d	StatementItem object (SALES-STI-2025-6e1e9d)	2	[{"changed": {"fields": ["Statement", "Product"]}}]	10	1
59	2025-03-23 10:50:28.654138+08	SALES-STI-2025-525ef8	StatementItem object (SALES-STI-2025-525ef8)	2	[{"changed": {"fields": ["Statement", "Product"]}}]	10	1
60	2025-03-23 10:50:39.419083+08	SALES-STI-2025-391666	StatementItem object (SALES-STI-2025-391666)	2	[{"changed": {"fields": ["Statement", "Product"]}}]	10	1
61	2025-03-23 10:51:02.201617+08	SALES-STI-2025-2d5b9f	StatementItem object (SALES-STI-2025-2d5b9f)	2	[{"changed": {"fields": ["Statement", "Product"]}}]	10	1
62	2025-03-23 10:51:12.911939+08	SALES-STI-2025-284852	StatementItem object (SALES-STI-2025-284852)	2	[{"changed": {"fields": ["Statement", "Product"]}}]	10	1
63	2025-03-23 10:51:29.330463+08	SALES-STI-2025-262ddf	StatementItem object (SALES-STI-2025-262ddf)	2	[{"changed": {"fields": ["Statement", "Product"]}}]	10	1
64	2025-03-23 10:51:44.360271+08	SALES-STI-2025-22397f	StatementItem object (SALES-STI-2025-22397f)	2	[{"changed": {"fields": ["Statement", "Product"]}}]	10	1
65	2025-03-23 10:51:52.172439+08	SALES-STI-2025-151818	StatementItem object (SALES-STI-2025-151818)	2	[{"changed": {"fields": ["Statement", "Product"]}}]	10	1
66	2025-03-23 10:52:00.193902+08	SALES-STI-2025-0501db	StatementItem object (SALES-STI-2025-0501db)	2	[{"changed": {"fields": ["Statement", "Product"]}}]	10	1
67	2025-03-23 10:52:08.972891+08	SALES-STI-2025-0361bc	StatementItem object (SALES-STI-2025-0361bc)	2	[{"changed": {"fields": ["Statement", "Product"]}}]	10	1
68	2025-03-23 10:53:26.476335+08	SALES-STI-2025-a09a62	StatementItem object (SALES-STI-2025-a09a62)	2	[{"changed": {"fields": ["Statement"]}}]	10	1
69	2025-03-23 10:53:57.01336+08	SALES-STI-2025-900021	StatementItem object (SALES-STI-2025-900021)	2	[{"changed": {"fields": ["Statement"]}}]	10	1
70	2025-03-23 10:54:53.161586+08	SALES-STI-2025-87ad28	StatementItem object (SALES-STI-2025-87ad28)	2	[{"changed": {"fields": ["Statement"]}}]	10	1
71	2025-03-23 10:55:43.786496+08	SALES-STI-2025-284852	StatementItem object (SALES-STI-2025-284852)	2	[{"changed": {"fields": ["Statement"]}}]	10	1
72	2025-03-23 10:56:04.531124+08	SALES-STI-2025-22397f	StatementItem object (SALES-STI-2025-22397f)	2	[{"changed": {"fields": ["Statement"]}}]	10	1
73	2025-03-23 10:56:24.05938+08	SALES-STI-2025-151818	StatementItem object (SALES-STI-2025-151818)	2	[{"changed": {"fields": ["Statement"]}}]	10	1
74	2025-03-23 10:56:50.747615+08	SALES-STI-2025-0501db	StatementItem object (SALES-STI-2025-0501db)	2	[{"changed": {"fields": ["Statement"]}}]	10	1
75	2025-03-23 10:58:25.415812+08	SALES-ORD-2025-e16c9e	Order object (SALES-ORD-2025-e16c9e)	2	[{"changed": {"fields": ["Quotation", "Statement"]}}]	13	1
76	2025-03-23 10:58:33.683575+08	SALES-ORD-2025-db9aae	Order object (SALES-ORD-2025-db9aae)	2	[{"changed": {"fields": ["Quotation", "Statement"]}}]	13	1
77	2025-03-23 10:58:40.004732+08	SALES-ORD-2025-d91eeb	Order object (SALES-ORD-2025-d91eeb)	2	[{"changed": {"fields": ["Quotation", "Statement"]}}]	13	1
78	2025-03-23 10:58:49.581937+08	SALES-ORD-2025-be90ee	Order object (SALES-ORD-2025-be90ee)	2	[{"changed": {"fields": ["Quotation", "Statement"]}}]	13	1
79	2025-03-23 10:58:56.914546+08	SALES-ORD-2025-b59c3e	Order object (SALES-ORD-2025-b59c3e)	2	[{"changed": {"fields": ["Quotation", "Statement"]}}]	13	1
80	2025-03-23 10:59:06.2243+08	SALES-ORD-2025-b4a34b	Order object (SALES-ORD-2025-b4a34b)	2	[{"changed": {"fields": ["Quotation", "Statement"]}}]	13	1
81	2025-03-23 10:59:52.31336+08	SALES-ORD-2025-b1447a	Order object (SALES-ORD-2025-b1447a)	2	[{"changed": {"fields": ["Quotation", "Statement"]}}]	13	1
82	2025-03-23 11:00:12.679004+08	SALES-ORD-2025-a4ac3c	Order object (SALES-ORD-2025-a4ac3c)	2	[{"changed": {"fields": ["Quotation", "Statement"]}}]	13	1
83	2025-03-23 11:00:21.899368+08	SALES-ORD-2025-a4359c	Order object (SALES-ORD-2025-a4359c)	2	[{"changed": {"fields": ["Quotation", "Statement"]}}]	13	1
84	2025-03-23 11:00:30.570836+08	SALES-ORD-2025-9b8c27	Order object (SALES-ORD-2025-9b8c27)	2	[{"changed": {"fields": ["Quotation", "Statement"]}}]	13	1
85	2025-03-23 11:00:36.068191+08	SALES-ORD-2025-9b8c27	Order object (SALES-ORD-2025-9b8c27)	2	[]	13	1
86	2025-03-23 11:00:44.844978+08	SALES-ORD-2025-52e0c9	Order object (SALES-ORD-2025-52e0c9)	2	[{"changed": {"fields": ["Quotation", "Statement"]}}]	13	1
87	2025-03-23 11:00:53.054558+08	SALES-ORD-2025-4118c6	Order object (SALES-ORD-2025-4118c6)	2	[{"changed": {"fields": ["Quotation", "Statement"]}}]	13	1
88	2025-03-23 11:01:03.707079+08	SALES-ORD-2025-4109ce	Order object (SALES-ORD-2025-4109ce)	2	[{"changed": {"fields": ["Quotation", "Statement"]}}]	13	1
89	2025-03-23 11:01:13.937395+08	SALES-ORD-2025-2bacb2	Order object (SALES-ORD-2025-2bacb2)	2	[{"changed": {"fields": ["Quotation", "Statement"]}}]	13	1
90	2025-03-23 11:01:33.061534+08	SALES-ORD-2025-1fe99b	Order object (SALES-ORD-2025-1fe99b)	2	[{"changed": {"fields": ["Quotation", "Statement"]}}]	13	1
91	2025-03-23 11:02:25.609526+08	SALES-ORD-2025-104654	Order object (SALES-ORD-2025-104654)	2	[{"changed": {"fields": ["Quotation", "Statement"]}}]	13	1
92	2025-03-23 11:02:36.999076+08	SALES-ORD-2025-096d13	Order object (SALES-ORD-2025-096d13)	2	[{"changed": {"fields": ["Quotation", "Statement"]}}]	13	1
93	2025-03-23 11:02:48.249297+08	SALES-ORD-2025-062e11	Order object (SALES-ORD-2025-062e11)	2	[{"changed": {"fields": ["Quotation", "Statement"]}}]	13	1
94	2025-03-23 11:02:58.86841+08	SALES-ORD-2025-0479e3	Order object (SALES-ORD-2025-0479e3)	2	[{"changed": {"fields": ["Quotation", "Statement"]}}]	13	1
95	2025-03-23 11:18:15.674313+08	SALES-STM-2025-16fb8a	Statement object (SALES-STM-2025-16fb8a)	2	[]	7	1
96	2025-03-23 11:47:27.773857+08	SALES-AGRMNT-2025-f91ef4	BlanketAgreement object (SALES-AGRMNT-2025-f91ef4)	2	[{"changed": {"fields": ["Statement"]}}]	14	1
97	2025-03-23 11:47:33.244723+08	SALES-AGRMNT-2025-f81d25	BlanketAgreement object (SALES-AGRMNT-2025-f81d25)	2	[{"changed": {"fields": ["Statement"]}}]	14	1
98	2025-03-23 11:47:37.310803+08	SALES-AGRMNT-2025-f49f2f	BlanketAgreement object (SALES-AGRMNT-2025-f49f2f)	2	[{"changed": {"fields": ["Statement"]}}]	14	1
99	2025-03-23 11:47:42.324289+08	SALES-AGRMNT-2025-f1b357	BlanketAgreement object (SALES-AGRMNT-2025-f1b357)	2	[{"changed": {"fields": ["Statement"]}}]	14	1
100	2025-03-23 11:47:48.669081+08	SALES-AGRMNT-2025-f1b357	BlanketAgreement object (SALES-AGRMNT-2025-f1b357)	2	[]	14	1
101	2025-03-23 11:47:53.367404+08	SALES-AGRMNT-2025-8efc83	BlanketAgreement object (SALES-AGRMNT-2025-8efc83)	2	[{"changed": {"fields": ["Statement"]}}]	14	1
102	2025-03-23 11:48:00.302785+08	SALES-AGRMNT-2025-8abd25	BlanketAgreement object (SALES-AGRMNT-2025-8abd25)	2	[{"changed": {"fields": ["Statement"]}}]	14	1
103	2025-03-23 11:48:08.394089+08	SALES-AGRMNT-2025-7efbf7	BlanketAgreement object (SALES-AGRMNT-2025-7efbf7)	2	[{"changed": {"fields": ["Statement"]}}]	14	1
104	2025-03-23 11:48:14.751705+08	SALES-AGRMNT-2025-7368b1	BlanketAgreement object (SALES-AGRMNT-2025-7368b1)	2	[{"changed": {"fields": ["Statement"]}}]	14	1
105	2025-03-23 11:48:19.683726+08	SALES-AGRMNT-2025-71cc89	BlanketAgreement object (SALES-AGRMNT-2025-71cc89)	2	[{"changed": {"fields": ["Statement"]}}]	14	1
106	2025-03-23 11:48:26.569143+08	SALES-AGRMNT-2025-6c299a	BlanketAgreement object (SALES-AGRMNT-2025-6c299a)	2	[{"changed": {"fields": ["Statement"]}}]	14	1
107	2025-03-23 11:48:32.930945+08	SALES-AGRMNT-2025-4212de	BlanketAgreement object (SALES-AGRMNT-2025-4212de)	2	[{"changed": {"fields": ["Statement"]}}]	14	1
108	2025-03-23 11:48:37.941103+08	SALES-AGRMNT-2025-3b909d	BlanketAgreement object (SALES-AGRMNT-2025-3b909d)	2	[{"changed": {"fields": ["Statement"]}}]	14	1
109	2025-03-23 11:48:43.1974+08	SALES-AGRMNT-2025-3aa3bf	BlanketAgreement object (SALES-AGRMNT-2025-3aa3bf)	2	[{"changed": {"fields": ["Statement"]}}]	14	1
110	2025-03-23 11:48:49.402147+08	SALES-AGRMNT-2025-21bea4	BlanketAgreement object (SALES-AGRMNT-2025-21bea4)	2	[{"changed": {"fields": ["Statement"]}}]	14	1
111	2025-03-23 11:48:58.295855+08	SALES-AGRMNT-2025-216957	BlanketAgreement object (SALES-AGRMNT-2025-216957)	2	[{"changed": {"fields": ["Statement"]}}]	14	1
112	2025-03-23 11:49:05.384083+08	SALES-AGRMNT-2025-1a2def	BlanketAgreement object (SALES-AGRMNT-2025-1a2def)	2	[{"changed": {"fields": ["Statement"]}}]	14	1
113	2025-03-23 11:49:14.68016+08	SALES-AGRMNT-2025-0f4ab6	BlanketAgreement object (SALES-AGRMNT-2025-0f4ab6)	2	[{"changed": {"fields": ["Statement"]}}]	14	1
114	2025-03-23 11:49:24.628253+08	SALES-AGRMNT-2025-0ed260	BlanketAgreement object (SALES-AGRMNT-2025-0ed260)	2	[{"changed": {"fields": ["Statement"]}}]	14	1
115	2025-03-23 11:49:32.112155+08	SALES-AGRMNT-2025-0cd5ff	BlanketAgreement object (SALES-AGRMNT-2025-0cd5ff)	2	[{"changed": {"fields": ["Statement"]}}]	14	1
116	2025-03-23 11:49:36.560038+08	SALES-AGRMNT-2025-028745	BlanketAgreement object (SALES-AGRMNT-2025-028745)	2	[{"changed": {"fields": ["Statement"]}}]	14	1
117	2025-03-23 12:08:15.774888+08	SALES-ORD-2025-9137d5	Order object (SALES-ORD-2025-9137d5)	2	[{"changed": {"fields": ["Statement"]}}]	13	1
118	2025-03-23 12:13:30.873845+08	SALES-INV-2025-f79370	SalesInvoices object (SALES-INV-2025-f79370)	2	[{"changed": {"fields": ["Order"]}}]	15	1
119	2025-03-23 12:13:34.288722+08	SALES-INV-2025-f2bf0c	SalesInvoices object (SALES-INV-2025-f2bf0c)	2	[{"changed": {"fields": ["Order"]}}]	15	1
120	2025-03-23 12:13:39.067702+08	SALES-INV-2025-f2116f	SalesInvoices object (SALES-INV-2025-f2116f)	2	[{"changed": {"fields": ["Order"]}}]	15	1
121	2025-03-23 12:13:42.947343+08	SALES-INV-2025-e8b3f2	SalesInvoices object (SALES-INV-2025-e8b3f2)	2	[{"changed": {"fields": ["Order"]}}]	15	1
122	2025-03-23 12:13:48.812216+08	SALES-INV-2025-e37fbb	SalesInvoices object (SALES-INV-2025-e37fbb)	2	[{"changed": {"fields": ["Order"]}}]	15	1
123	2025-03-23 12:13:53.7136+08	SALES-INV-2025-e10c51	SalesInvoices object (SALES-INV-2025-e10c51)	2	[{"changed": {"fields": ["Order"]}}]	15	1
124	2025-03-23 12:13:58.810269+08	SALES-INV-2025-bba042	SalesInvoices object (SALES-INV-2025-bba042)	2	[{"changed": {"fields": ["Order"]}}]	15	1
125	2025-03-23 12:14:05.351853+08	SALES-INV-2025-b2442e	SalesInvoices object (SALES-INV-2025-b2442e)	2	[{"changed": {"fields": ["Order"]}}]	15	1
126	2025-03-23 12:14:11.620565+08	SALES-INV-2025-a444d2	SalesInvoices object (SALES-INV-2025-a444d2)	2	[{"changed": {"fields": ["Order"]}}]	15	1
127	2025-03-23 12:14:29.947059+08	SALES-INV-2025-93089c	SalesInvoices object (SALES-INV-2025-93089c)	2	[{"changed": {"fields": ["Order"]}}]	15	1
128	2025-03-23 12:14:40.192689+08	SALES-INV-2025-89a7db	SalesInvoices object (SALES-INV-2025-89a7db)	2	[{"changed": {"fields": ["Order"]}}]	15	1
129	2025-03-23 12:14:45.962635+08	SALES-INV-2025-6dafee	SalesInvoices object (SALES-INV-2025-6dafee)	2	[{"changed": {"fields": ["Order"]}}]	15	1
130	2025-03-23 12:14:51.696303+08	SALES-INV-2025-50b82f	SalesInvoices object (SALES-INV-2025-50b82f)	2	[{"changed": {"fields": ["Order"]}}]	15	1
131	2025-03-23 12:14:55.783658+08	SALES-INV-2025-4d9b44	SalesInvoices object (SALES-INV-2025-4d9b44)	2	[{"changed": {"fields": ["Order"]}}]	15	1
132	2025-03-23 12:15:00.827926+08	SALES-INV-2025-332d0b	SalesInvoices object (SALES-INV-2025-332d0b)	2	[{"changed": {"fields": ["Order"]}}]	15	1
133	2025-03-23 12:15:06.566609+08	SALES-INV-2025-2e3617	SalesInvoices object (SALES-INV-2025-2e3617)	2	[{"changed": {"fields": ["Order"]}}]	15	1
134	2025-03-23 12:15:12.663094+08	SALES-INV-2025-17475a	SalesInvoices object (SALES-INV-2025-17475a)	2	[{"changed": {"fields": ["Order"]}}]	15	1
135	2025-03-23 12:15:18.172016+08	SALES-INV-2025-1377a6	SalesInvoices object (SALES-INV-2025-1377a6)	2	[{"changed": {"fields": ["Order"]}}]	15	1
136	2025-03-23 12:15:29.215766+08	SALES-INV-2025-13772d	SalesInvoices object (SALES-INV-2025-13772d)	2	[{"changed": {"fields": ["Order"]}}]	15	1
137	2025-03-23 12:15:37.195347+08	SALES-INV-2025-00a822	SalesInvoices object (SALES-INV-2025-00a822)	2	[{"changed": {"fields": ["Order"]}}]	15	1
138	2025-03-23 16:22:47.975697+08	SALES-CUST-2025-69118b	Customer object (SALES-CUST-2025-69118b)	3		16	1
139	2025-03-25 13:04:24.612343+08	SALES-STM-2025-251924	Statement object (SALES-STM-2025-251924)	2	[{"changed": {"fields": ["Total amount", "Discount", "Total tax"]}}]	7	1
140	2025-03-25 13:06:36.382268+08	SALES-STM-2025-b90b4b	Statement object (SALES-STM-2025-b90b4b)	2	[{"changed": {"fields": ["Total amount", "Discount", "Total tax"]}}]	7	1
141	2025-03-25 13:07:20.812445+08	SALES-STM-2025-6b1653	Statement object (SALES-STM-2025-6b1653)	2	[{"changed": {"fields": ["Total amount", "Discount", "Total tax"]}}]	7	1
142	2025-03-25 13:08:01.962139+08	SALES-STM-2025-3acfef	Statement object (SALES-STM-2025-3acfef)	2	[{"changed": {"fields": ["Total amount", "Total tax"]}}]	7	1
143	2025-03-25 13:08:54.032787+08	SALES-STM-2025-91058d	Statement object (SALES-STM-2025-91058d)	2	[{"changed": {"fields": ["Total amount", "Total tax"]}}]	7	1
144	2025-03-25 13:09:34.683849+08	SALES-STM-2025-755417	Statement object (SALES-STM-2025-755417)	2	[{"changed": {"fields": ["Total amount", "Total tax"]}}]	7	1
145	2025-03-25 13:10:52.352353+08	SALES-STM-2025-251924	Statement object (SALES-STM-2025-251924)	2	[{"changed": {"fields": ["Discount"]}}]	7	1
146	2025-03-25 13:12:51.847513+08	SALES-STM-2025-21f5af	Statement object (SALES-STM-2025-21f5af)	2	[{"changed": {"fields": ["Total amount", "Total tax"]}}]	7	1
147	2025-03-25 13:13:48.188472+08	SALES-STM-2025-f6b7d0	Statement object (SALES-STM-2025-f6b7d0)	2	[{"changed": {"fields": ["Total amount", "Discount", "Total tax"]}}]	7	1
148	2025-03-25 13:15:04.17491+08	SALES-STM-2025-16fb8a	Statement object (SALES-STM-2025-16fb8a)	2	[{"changed": {"fields": ["Total amount", "Discount", "Total tax"]}}]	7	1
149	2025-03-25 13:15:46.014606+08	SALES-STM-2025-2cc7f2	Statement object (SALES-STM-2025-2cc7f2)	2	[{"changed": {"fields": ["Total amount", "Total tax"]}}]	7	1
150	2025-03-25 13:16:27.7334+08	SALES-STM-2025-f4b14f	Statement object (SALES-STM-2025-f4b14f)	2	[{"changed": {"fields": ["Total amount", "Total tax"]}}]	7	1
151	2025-03-25 13:17:16.352266+08	SALES-STM-2025-600a2f	Statement object (SALES-STM-2025-600a2f)	2	[{"changed": {"fields": ["Total amount", "Total tax"]}}]	7	1
152	2025-03-25 13:18:17.536949+08	SALES-STM-2025-5e569c	Statement object (SALES-STM-2025-5e569c)	2	[{"changed": {"fields": ["Total amount", "Discount", "Total tax"]}}]	7	1
153	2025-03-25 13:18:59.192273+08	SALES-STM-2025-35c700	Statement object (SALES-STM-2025-35c700)	2	[{"changed": {"fields": ["Total amount", "Total tax"]}}]	7	1
154	2025-03-25 13:19:41.820286+08	SALES-STM-2025-2879fa	Statement object (SALES-STM-2025-2879fa)	2	[{"changed": {"fields": ["Total amount", "Total tax"]}}]	7	1
155	2025-03-25 13:20:29.452316+08	SALES-STM-2025-c86ce6	Statement object (SALES-STM-2025-c86ce6)	2	[{"changed": {"fields": ["Total amount", "Total tax"]}}]	7	1
156	2025-03-25 13:21:10.522042+08	SALES-STM-2025-2f3fae	Statement object (SALES-STM-2025-2f3fae)	2	[{"changed": {"fields": ["Total amount", "Discount", "Total tax"]}}]	7	1
157	2025-03-25 13:21:53.884544+08	SALES-STM-2025-948f52	Statement object (SALES-STM-2025-948f52)	2	[{"changed": {"fields": ["Total amount", "Discount", "Total tax"]}}]	7	1
158	2025-03-25 13:22:35.196871+08	SALES-STM-2025-29deb9	Statement object (SALES-STM-2025-29deb9)	2	[{"changed": {"fields": ["Total amount", "Total tax"]}}]	7	1
159	2025-03-25 13:23:32.651975+08	SALES-STM-2025-656095	Statement object (SALES-STM-2025-656095)	2	[{"changed": {"fields": ["Total amount", "Total tax"]}}]	7	1
160	2025-03-25 13:24:06.087129+08	SALES-STM-2025-3656cd	Statement object (SALES-STM-2025-3656cd)	2	[{"changed": {"fields": ["Total tax"]}}]	7	1
161	2025-03-25 19:31:25.861729+08	SALES-SHIP-2025-e41c25	ShippingDetails object (SALES-SHIP-2025-e41c25)	2	[{"changed": {"fields": ["Order", "Operational cost", "Shipment"]}}]	18	1
162	2025-03-25 19:31:33.405325+08	SALES-SHIP-2025-db3852	ShippingDetails object (SALES-SHIP-2025-db3852)	2	[{"changed": {"fields": ["Order", "Operational cost", "Shipment"]}}]	18	1
163	2025-03-25 19:31:40.257763+08	SALES-SHIP-2025-d22837	ShippingDetails object (SALES-SHIP-2025-d22837)	2	[{"changed": {"fields": ["Order", "Operational cost", "Shipment"]}}]	18	1
164	2025-03-25 19:31:47.183487+08	SALES-SHIP-2025-c7d03b	ShippingDetails object (SALES-SHIP-2025-c7d03b)	2	[{"changed": {"fields": ["Order", "Operational cost", "Shipment"]}}]	18	1
165	2025-03-25 19:31:56.7893+08	SALES-SHIP-2025-9f6c43	ShippingDetails object (SALES-SHIP-2025-9f6c43)	2	[{"changed": {"fields": ["Order", "Operational cost", "Shipment"]}}]	18	1
166	2025-03-25 19:32:26.318317+08	SALES-SHIP-2025-9be599	ShippingDetails object (SALES-SHIP-2025-9be599)	2	[{"changed": {"fields": ["Order", "Operational cost", "Shipment"]}}]	18	1
167	2025-03-25 19:32:36.624176+08	SALES-SHIP-2025-8e202c	ShippingDetails object (SALES-SHIP-2025-8e202c)	2	[{"changed": {"fields": ["Order", "Operational cost", "Shipment"]}}]	18	1
168	2025-03-25 19:33:20.380292+08	SALES-SHIP-2025-8d6b73	ShippingDetails object (SALES-SHIP-2025-8d6b73)	2	[{"changed": {"fields": ["Order", "Operational cost", "Shipment"]}}]	18	1
169	2025-03-25 19:33:28.903811+08	SALES-SHIP-2025-861e56	ShippingDetails object (SALES-SHIP-2025-861e56)	2	[{"changed": {"fields": ["Order", "Operational cost", "Shipment"]}}]	18	1
170	2025-03-25 19:33:38.383408+08	SALES-SHIP-2025-857565	ShippingDetails object (SALES-SHIP-2025-857565)	2	[{"changed": {"fields": ["Order", "Operational cost", "Shipment"]}}]	18	1
171	2025-03-25 19:33:46.324763+08	SALES-SHIP-2025-7e8842	ShippingDetails object (SALES-SHIP-2025-7e8842)	2	[{"changed": {"fields": ["Order", "Operational cost", "Shipment"]}}]	18	1
172	2025-03-25 19:34:25.471654+08	SALES-SHIP-2025-76d661	ShippingDetails object (SALES-SHIP-2025-76d661)	2	[{"changed": {"fields": ["Order", "Operational cost", "Shipment"]}}]	18	1
173	2025-03-25 19:34:42.419975+08	SALES-SHIP-2025-55e8ed	ShippingDetails object (SALES-SHIP-2025-55e8ed)	2	[{"changed": {"fields": ["Order", "Operational cost", "Shipment"]}}]	18	1
174	2025-03-25 19:34:56.350978+08	SALES-SHIP-2025-4ce37b	ShippingDetails object (SALES-SHIP-2025-4ce37b)	2	[{"changed": {"fields": ["Order", "Operational cost", "Shipment"]}}]	18	1
175	2025-03-25 19:35:05.122496+08	SALES-SHIP-2025-47b86b	ShippingDetails object (SALES-SHIP-2025-47b86b)	2	[{"changed": {"fields": ["Order", "Operational cost", "Shipment"]}}]	18	1
176	2025-03-25 19:35:16.132446+08	SALES-SHIP-2025-3ccc7b	ShippingDetails object (SALES-SHIP-2025-3ccc7b)	2	[{"changed": {"fields": ["Order", "Operational cost", "Shipment"]}}]	18	1
177	2025-03-25 19:35:24.054402+08	SALES-SHIP-2025-354b3d	ShippingDetails object (SALES-SHIP-2025-354b3d)	2	[{"changed": {"fields": ["Order", "Operational cost", "Shipment"]}}]	18	1
178	2025-03-25 19:35:32.755704+08	SALES-SHIP-2025-2df594	ShippingDetails object (SALES-SHIP-2025-2df594)	2	[{"changed": {"fields": ["Order", "Operational cost", "Shipment"]}}]	18	1
179	2025-03-25 19:35:41.493723+08	SALES-SHIP-2025-29899d	ShippingDetails object (SALES-SHIP-2025-29899d)	2	[{"changed": {"fields": ["Order", "Operational cost", "Shipment"]}}]	18	1
180	2025-03-25 19:35:49.241117+08	SALES-SHIP-2025-14a85b	ShippingDetails object (SALES-SHIP-2025-14a85b)	2	[{"changed": {"fields": ["Order", "Operational cost", "Shipment"]}}]	18	1
181	2025-03-25 21:17:05.631582+08	SALES-CONTACT-2025-fbd269	CampaignContacts object (SALES-CONTACT-2025-fbd269)	2	[{"changed": {"fields": ["Lead", "Campaign"]}}]	19	1
182	2025-03-25 21:17:10.369578+08	SALES-CONTACT-2025-e98193	CampaignContacts object (SALES-CONTACT-2025-e98193)	2	[{"changed": {"fields": ["Lead", "Campaign"]}}]	19	1
183	2025-03-25 21:17:24.775329+08	SALES-CONTACT-2025-e98193	CampaignContacts object (SALES-CONTACT-2025-e98193)	2	[{"changed": {"fields": ["Campaign"]}}]	19	1
184	2025-03-25 21:17:33.762431+08	SALES-CONTACT-2025-e0f42e	CampaignContacts object (SALES-CONTACT-2025-e0f42e)	2	[{"changed": {"fields": ["Lead", "Campaign"]}}]	19	1
185	2025-03-25 21:17:41.205506+08	SALES-CONTACT-2025-dfc91d	CampaignContacts object (SALES-CONTACT-2025-dfc91d)	2	[{"changed": {"fields": ["Lead", "Campaign"]}}]	19	1
186	2025-03-25 21:17:49.736808+08	SALES-CONTACT-2025-d920b5	CampaignContacts object (SALES-CONTACT-2025-d920b5)	2	[{"changed": {"fields": ["Lead", "Campaign"]}}]	19	1
187	2025-03-25 21:18:09.002124+08	SALES-CONTACT-2025-ca59cc	CampaignContacts object (SALES-CONTACT-2025-ca59cc)	2	[{"changed": {"fields": ["Lead", "Campaign"]}}]	19	1
188	2025-03-25 21:18:25.085023+08	SALES-CONTACT-2025-c8f8f4	CampaignContacts object (SALES-CONTACT-2025-c8f8f4)	2	[{"changed": {"fields": ["Lead", "Campaign"]}}]	19	1
189	2025-03-25 21:18:34.430048+08	SALES-CONTACT-2025-9f36ed	CampaignContacts object (SALES-CONTACT-2025-9f36ed)	2	[{"changed": {"fields": ["Lead", "Campaign"]}}]	19	1
190	2025-03-25 21:19:02.18272+08	SALES-CONTACT-2025-97d86c	CampaignContacts object (SALES-CONTACT-2025-97d86c)	2	[{"changed": {"fields": ["Lead", "Campaign"]}}]	19	1
191	2025-03-25 21:19:16.337858+08	SALES-CONTACT-2025-8f11c8	CampaignContacts object (SALES-CONTACT-2025-8f11c8)	2	[{"changed": {"fields": ["Lead", "Campaign"]}}]	19	1
192	2025-03-25 21:19:45.874102+08	SALES-CONTACT-2025-7b555f	CampaignContacts object (SALES-CONTACT-2025-7b555f)	2	[{"changed": {"fields": ["Lead", "Campaign"]}}]	19	1
193	2025-03-25 21:20:04.132778+08	SALES-CONTACT-2025-721ecf	CampaignContacts object (SALES-CONTACT-2025-721ecf)	2	[{"changed": {"fields": ["Lead", "Campaign"]}}]	19	1
194	2025-03-25 21:20:31.84457+08	SALES-CONTACT-2025-717495	CampaignContacts object (SALES-CONTACT-2025-717495)	2	[{"changed": {"fields": ["Lead", "Campaign"]}}]	19	1
195	2025-03-25 21:21:00.572434+08	SALES-CONTACT-2025-50ec63	CampaignContacts object (SALES-CONTACT-2025-50ec63)	2	[{"changed": {"fields": ["Lead", "Campaign"]}}]	19	1
196	2025-03-25 21:21:12.252386+08	SALES-CONTACT-2025-45c7a5	CampaignContacts object (SALES-CONTACT-2025-45c7a5)	2	[{"changed": {"fields": ["Lead", "Campaign"]}}]	19	1
197	2025-03-25 21:21:26.577788+08	SALES-CONTACT-2025-3a9c27	CampaignContacts object (SALES-CONTACT-2025-3a9c27)	2	[{"changed": {"fields": ["Lead", "Campaign"]}}]	19	1
198	2025-03-25 21:21:40.149704+08	SALES-CONTACT-2025-363ac0	CampaignContacts object (SALES-CONTACT-2025-363ac0)	2	[{"changed": {"fields": ["Lead", "Campaign"]}}]	19	1
199	2025-03-25 21:21:54.241213+08	SALES-CONTACT-2025-357341	CampaignContacts object (SALES-CONTACT-2025-357341)	2	[{"changed": {"fields": ["Lead", "Campaign"]}}]	19	1
200	2025-03-25 21:22:04.111338+08	SALES-CONTACT-2025-064025	CampaignContacts object (SALES-CONTACT-2025-064025)	2	[{"changed": {"fields": ["Lead", "Campaign"]}}]	19	1
201	2025-03-25 21:22:11.31184+08	SALES-CONTACT-2025-017e9e	CampaignContacts object (SALES-CONTACT-2025-017e9e)	2	[{"changed": {"fields": ["Lead", "Campaign"]}}]	19	1
202	2025-03-25 21:58:14.006885+08	ADMIN-PARTNER-2025-fc7fd6	BusinessPartnerMaster object (ADMIN-PARTNER-2025-fc7fd6)	3		21	1
203	2025-03-27 10:37:53.668724+08	SALES-OPP-2025-e9b6c4	Opportunities object (SALES-OPP-2025-e9b6c4)	2	[{"changed": {"fields": ["Customer", "Partner", "Salesrep"]}}]	20	1
204	2025-03-27 10:38:01.566555+08	SALES-OPP-2025-e1589d	Opportunities object (SALES-OPP-2025-e1589d)	2	[{"changed": {"fields": ["Customer", "Partner", "Salesrep"]}}]	20	1
205	2025-03-27 10:38:15.683146+08	SALES-OPP-2025-cf73e9	Opportunities object (SALES-OPP-2025-cf73e9)	2	[{"changed": {"fields": ["Customer", "Partner", "Salesrep"]}}]	20	1
206	2025-03-27 10:38:25.495506+08	SALES-OPP-2025-bcf781	Opportunities object (SALES-OPP-2025-bcf781)	2	[{"changed": {"fields": ["Customer", "Partner", "Salesrep"]}}]	20	1
207	2025-03-27 10:38:37.596076+08	SALES-OPP-2025-b98cab	Opportunities object (SALES-OPP-2025-b98cab)	2	[{"changed": {"fields": ["Customer", "Partner", "Salesrep"]}}]	20	1
208	2025-03-27 10:38:56.938336+08	SALES-OPP-2025-b26644	Opportunities object (SALES-OPP-2025-b26644)	2	[{"changed": {"fields": ["Customer", "Partner", "Salesrep"]}}]	20	1
209	2025-03-27 10:39:04.131352+08	SALES-OPP-2025-a0bef8	Opportunities object (SALES-OPP-2025-a0bef8)	2	[{"changed": {"fields": ["Customer", "Partner", "Salesrep"]}}]	20	1
210	2025-03-27 10:39:28.743738+08	SALES-OPP-2025-8570cd	Opportunities object (SALES-OPP-2025-8570cd)	2	[{"changed": {"fields": ["Customer", "Partner", "Salesrep"]}}]	20	1
211	2025-03-27 10:39:38.932676+08	SALES-OPP-2025-84846c	Opportunities object (SALES-OPP-2025-84846c)	2	[{"changed": {"fields": ["Customer", "Partner", "Salesrep"]}}]	20	1
212	2025-03-27 10:39:47.218062+08	SALES-OPP-2025-6ea508	Opportunities object (SALES-OPP-2025-6ea508)	2	[{"changed": {"fields": ["Customer", "Partner", "Salesrep"]}}]	20	1
213	2025-03-27 10:40:14.671554+08	SALES-OPP-2025-6e9fef	Opportunities object (SALES-OPP-2025-6e9fef)	2	[{"changed": {"fields": ["Customer", "Partner", "Salesrep"]}}]	20	1
214	2025-03-27 10:40:31.829838+08	SALES-OPP-2025-6e4bbf	Opportunities object (SALES-OPP-2025-6e4bbf)	2	[{"changed": {"fields": ["Customer", "Partner", "Salesrep"]}}]	20	1
215	2025-03-27 10:40:58.157164+08	SALES-OPP-2025-544114	Opportunities object (SALES-OPP-2025-544114)	2	[{"changed": {"fields": ["Customer", "Partner", "Salesrep"]}}]	20	1
216	2025-03-27 10:41:08.312153+08	SALES-OPP-2025-524755	Opportunities object (SALES-OPP-2025-524755)	2	[{"changed": {"fields": ["Customer", "Partner", "Salesrep"]}}]	20	1
217	2025-03-27 10:41:25.286127+08	SALES-OPP-2025-2f8710	Opportunities object (SALES-OPP-2025-2f8710)	2	[{"changed": {"fields": ["Customer", "Partner", "Salesrep"]}}]	20	1
218	2025-03-27 10:41:37.443738+08	SALES-OPP-2025-1f3caf	Opportunities object (SALES-OPP-2025-1f3caf)	2	[{"changed": {"fields": ["Customer", "Partner", "Salesrep"]}}]	20	1
219	2025-03-27 10:41:50.523179+08	SALES-OPP-2025-1c1b9d	Opportunities object (SALES-OPP-2025-1c1b9d)	2	[{"changed": {"fields": ["Customer", "Partner", "Salesrep"]}}]	20	1
220	2025-03-27 10:42:05.733229+08	SALES-OPP-2025-168ce4	Opportunities object (SALES-OPP-2025-168ce4)	2	[{"changed": {"fields": ["Customer", "Partner", "Salesrep"]}}]	20	1
221	2025-03-27 10:42:25.263364+08	SALES-OPP-2025-0456fe	Opportunities object (SALES-OPP-2025-0456fe)	2	[{"changed": {"fields": ["Customer", "Partner", "Salesrep"]}}]	20	1
222	2025-03-27 10:42:37.084144+08	SALES-OPP-2025-041b10	Opportunities object (SALES-OPP-2025-041b10)	2	[{"changed": {"fields": ["Customer", "Partner", "Salesrep"]}}]	20	1
226	2025-03-27 21:03:15.406065+08	dasf	Customer object (dasf)	1	[{"added": {}}]	16	1
227	2025-03-27 21:04:50.810439+08	ADMIN-PARTNER-2025-3470f5	BusinessPartnerMaster object (ADMIN-PARTNER-2025-3470f5)	3		21	1
228	2025-03-27 21:04:54.231954+08	SALES-CUST-2025-61bac0	Customer object (SALES-CUST-2025-61bac0)	3		16	1
229	2025-03-27 21:05:09.219413+08	asdf	Customer object (asdf)	1	[{"added": {}}]	16	1
230	2025-03-27 21:06:01.697531+08	ADMIN-PARTNER-2025-cdac26	BusinessPartnerMaster object (ADMIN-PARTNER-2025-cdac26)	3		21	1
231	2025-03-27 21:06:20.700895+08	ACC-GLA-2025-54e4a2	GeneralLedgerAccounts object (ACC-GLA-2025-54e4a2)	3		22	1
232	2025-03-27 21:06:24.531766+08	SALES-CUST-2025-7f2bc9	Customer object (SALES-CUST-2025-7f2bc9)	3		16	1
233	2025-03-27 21:07:27.397731+08	SALES-PAY-2025-e66e21	Payments object (SALES-PAY-2025-e66e21)	2	[{"changed": {"fields": ["Order"]}}]	23	1
234	2025-03-27 21:10:57.480887+08	SALES-PAY-2025-28dfd5	Payments object (SALES-PAY-2025-28dfd5)	2	[{"changed": {"fields": ["Order", "Payment status"]}}]	23	1
235	2025-03-27 21:24:14.356883+08	SALES-ORD-2025-9137d5	Order object (SALES-ORD-2025-9137d5)	2	[{"changed": {"fields": ["Goods issue"]}}]	13	1
236	2025-03-27 21:26:07.190639+08	SALES-ORD-2025-0479e3	Order object (SALES-ORD-2025-0479e3)	2	[{"changed": {"fields": ["Goods issue"]}}]	13	1
237	2025-03-27 22:39:02.726288+08	asdf	Order object (asdf)	1	[{"added": {}}]	13	1
238	2025-03-27 22:45:19.776973+08	a	Order object (a)	1	[{"added": {}}]	13	1
239	2025-03-28 10:06:23.675315+08	SALES-CUST-2025-fbdaf0	Customer object (SALES-CUST-2025-fbdaf0)	2	[{"changed": {"fields": ["Contact person"]}}]	16	1
240	2025-03-28 10:06:30.64573+08	SALES-CUST-2025-f7aa99	Customer object (SALES-CUST-2025-f7aa99)	2	[{"changed": {"fields": ["Contact person"]}}]	16	1
241	2025-03-28 10:06:59.689093+08	SALES-CUST-2025-eac405	Customer object (SALES-CUST-2025-eac405)	2	[{"changed": {"fields": ["Contact person"]}}]	16	1
242	2025-03-28 10:07:06.553461+08	SALES-CUST-2025-df9ce6	Customer object (SALES-CUST-2025-df9ce6)	2	[{"changed": {"fields": ["Contact person"]}}]	16	1
243	2025-03-28 10:07:18.984042+08	SALES-CUST-2025-dbfe2c	Customer object (SALES-CUST-2025-dbfe2c)	2	[{"changed": {"fields": ["Contact person"]}}]	16	1
244	2025-03-28 10:07:37.135181+08	SALES-CUST-2025-d105ee	Customer object (SALES-CUST-2025-d105ee)	2	[{"changed": {"fields": ["Contact person"]}}]	16	1
245	2025-03-28 10:08:04.273187+08	SALES-CUST-2025-cd1d37	Customer object (SALES-CUST-2025-cd1d37)	2	[{"changed": {"fields": ["Contact person"]}}]	16	1
246	2025-03-28 10:08:59.283543+08	SALES-CUST-2025-cbf858	Customer object (SALES-CUST-2025-cbf858)	2	[{"changed": {"fields": ["Contact person"]}}]	16	1
247	2025-03-28 10:09:20.489061+08	SALES-CUST-2025-b1576f	Customer object (SALES-CUST-2025-b1576f)	2	[{"changed": {"fields": ["Contact person"]}}]	16	1
248	2025-03-28 10:09:31.373949+08	SALES-CUST-2025-a6775c	Customer object (SALES-CUST-2025-a6775c)	2	[{"changed": {"fields": ["Contact person"]}}]	16	1
249	2025-03-28 10:09:46.875119+08	SALES-CUST-2025-a42491	Customer object (SALES-CUST-2025-a42491)	2	[{"changed": {"fields": ["Contact person"]}}]	16	1
250	2025-03-28 10:09:57.233823+08	SALES-CUST-2025-941d72	Customer object (SALES-CUST-2025-941d72)	2	[{"changed": {"fields": ["Contact person"]}}]	16	1
251	2025-03-28 10:10:04.976498+08	SALES-CUST-2025-8cdccd	Customer object (SALES-CUST-2025-8cdccd)	2	[{"changed": {"fields": ["Contact person"]}}]	16	1
252	2025-03-28 10:10:12.361214+08	SALES-CUST-2025-6a3167	Customer object (SALES-CUST-2025-6a3167)	2	[{"changed": {"fields": ["Contact person"]}}]	16	1
253	2025-03-28 10:10:27.629705+08	SALES-CUST-2025-665436	Customer object (SALES-CUST-2025-665436)	2	[{"changed": {"fields": ["Contact person"]}}]	16	1
254	2025-03-28 10:10:38.177831+08	SALES-CUST-2025-641c4a	Customer object (SALES-CUST-2025-641c4a)	2	[{"changed": {"fields": ["Contact person"]}}]	16	1
255	2025-03-28 10:10:46.911826+08	SALES-CUST-2025-59eb62	Customer object (SALES-CUST-2025-59eb62)	2	[{"changed": {"fields": ["Contact person"]}}]	16	1
256	2025-03-28 10:10:59.965857+08	SALES-CUST-2025-3f84fe	Customer object (SALES-CUST-2025-3f84fe)	2	[{"changed": {"fields": ["Contact person"]}}]	16	1
257	2025-03-28 10:11:13.231452+08	SALES-CUST-2025-3197ba	Customer object (SALES-CUST-2025-3197ba)	2	[{"changed": {"fields": ["Contact person"]}}]	16	1
258	2025-03-28 10:11:27.730968+08	SALES-CUST-2025-2ba07b	Customer object (SALES-CUST-2025-2ba07b)	2	[{"changed": {"fields": ["Contact person"]}}]	16	1
259	2025-03-28 10:11:47.279687+08	SALES-CUST-2025-2597c0	Customer object (SALES-CUST-2025-2597c0)	2	[{"changed": {"fields": ["Contact person"]}}]	16	1
260	2025-03-28 10:11:56.409606+08	SALES-CUST-2025-0294dc	Customer object (SALES-CUST-2025-0294dc)	2	[{"changed": {"fields": ["Contact person"]}}]	16	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	statement	statement
8	misc	employees
9	misc	departments
10	statement	statementitem
11	misc	products
12	quotation	quotation
13	order	order
14	agreement	blanketagreement
15	invoice	salesinvoices
16	customer	customer
17	misc	principalitems
18	delivery	shippingdetails
19	CRM	campaigncontacts
20	CRM	opportunities
21	misc	businesspartnermaster
22	misc	generalledgeraccounts
23	invoice	payments
24	misc	nonprojectorderpricing
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2025-03-23 10:20:07.366013+08
2	auth	0001_initial	2025-03-23 10:20:07.406173+08
3	admin	0001_initial	2025-03-23 10:20:07.410239+08
4	admin	0002_logentry_remove_auto_add	2025-03-23 10:20:07.421818+08
5	admin	0003_logentry_add_action_flag_choices	2025-03-23 10:20:07.427995+08
6	contenttypes	0002_remove_content_type_name	2025-03-23 10:20:10.131894+08
7	auth	0002_alter_permission_name_max_length	2025-03-23 10:20:10.151149+08
8	auth	0003_alter_user_email_max_length	2025-03-23 10:20:10.15863+08
9	auth	0004_alter_user_username_opts	2025-03-23 10:20:10.165449+08
10	auth	0005_alter_user_last_login_null	2025-03-23 10:20:10.17289+08
11	auth	0006_require_contenttypes_0002	2025-03-23 10:20:10.17289+08
12	auth	0007_alter_validators_add_error_messages	2025-03-23 10:20:10.181401+08
13	auth	0008_alter_user_username_max_length	2025-03-23 10:20:10.193499+08
14	auth	0009_alter_user_last_name_max_length	2025-03-23 10:20:10.202672+08
15	auth	0010_alter_group_name_max_length	2025-03-23 10:20:10.214738+08
16	auth	0011_update_proxy_permissions	2025-03-23 10:20:10.220524+08
17	auth	0012_alter_user_first_name_max_length	2025-03-23 10:20:10.224539+08
18	sessions	0001_initial	2025-03-23 10:20:13.870314+08
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
z37coi2n5ce9ovgonyqla4fqs59aa2vl	.eJxVjMsOwiAQRf-FtSEFHKAu3fcbyDAzSNXQpI-V8d-1SRe6veec-1IJt7WmbZE5jawuyqjT75aRHtJ2wHdst0nT1NZ5zHpX9EEXPUwsz-vh_h1UXOq37n0XhXNwkX0hJJBylt4JGgyWGaij3AGEIBGCddkwR1eoAFgqAl69PwfNONM:1twAwv:wXwJyAFyKAZgPwc4YwMN5LPUrIdWqD_UY9NlW8dLveA	2025-04-06 10:20:29.68385+08
4xr7sxuso2ngyf2kfztp2m471hdb3y6x	.eJxVjMsOwiAQRf-FtSEFHKAu3fcbyDAzSNXQpI-V8d-1SRe6veec-1IJt7WmbZE5jawuyqjT75aRHtJ2wHdst0nT1NZ5zHpX9EEXPUwsz-vh_h1UXOq37n0XhXNwkX0hJJBylt4JGgyWGaij3AGEIBGCddkwR1eoAFgqAl69PwfNONM:1twAxV:Q3O8rG21n8UFGNtTeGOxcUqgWeaqpT418l76mWny0ss	2025-04-06 10:21:05.755136+08
\.


--
-- Data for Name: batch_inspection; Type: TABLE DATA; Schema: purchasing; Owner: postgres
--

COPY purchasing.batch_inspection (inspection_id, shipment_id, inspection_date, employee_id, inspection_result, remarks) FROM stdin;
PURCHASING-BAI-2025-457fa2	\N	2025-03-15	\N	Pass	All items in good condition
PURCHASING-BAI-2025-30bd57	\N	2025-03-16	\N	Pass	Minor cosmetic issues but acceptable
PURCHASING-BAI-2025-df6aae	\N	2025-03-17	\N	Fail	One laptop has screen damage
PURCHASING-BAI-2025-62cc4e	\N	2025-03-18	\N	Pass	All printers functioning properly
PURCHASING-BAI-2025-a0a338	\N	2025-03-19	\N	Pass	Server rack assembled correctly
PURCHASING-BAI-2025-63d942	\N	2025-03-20	\N	Fail	Two switches not functioning
PURCHASING-BAI-2025-767080	\N	2025-03-21	\N	Pass	UPS batteries checked and working
PURCHASING-BAI-2025-9daf76	\N	2025-03-22	\N	Pass	Conference table in perfect condition
PURCHASING-BAI-2025-06892a	\N	2025-03-23	\N	Fail	One projector has color issues
PURCHASING-BAI-2025-b93aaa	\N	2025-03-24	\N	Pass	All filing cabinets properly assembled
PURCHASING-BAI-2025-e40872	\N	2025-03-15	\N	Pass	All items in good condition
PURCHASING-BAI-2025-11ccfc	\N	2025-03-16	\N	Pass	Minor cosmetic issues but acceptable
PURCHASING-BAI-2025-0a6b3e	\N	2025-03-17	\N	Fail	One laptop has screen damage
PURCHASING-BAI-2025-bbc723	\N	2025-03-18	\N	Pass	All printers functioning properly
PURCHASING-BAI-2025-6e8cce	\N	2025-03-19	\N	Pass	Server rack assembled correctly
PURCHASING-BAI-2025-86ead0	\N	2025-03-20	\N	Fail	Two switches not functioning
PURCHASING-BAI-2025-ff53a6	\N	2025-03-21	\N	Pass	UPS batteries checked and working
PURCHASING-BAI-2025-13e0ed	\N	2025-03-22	\N	Pass	Conference table in perfect condition
PURCHASING-BAI-2025-c94044	\N	2025-03-23	\N	Fail	One projector has color issues
PURCHASING-BAI-2025-cc04b9	\N	2025-03-24	\N	Pass	All filing cabinets properly assembled
\.


--
-- Data for Name: credit_memo; Type: TABLE DATA; Schema: purchasing; Owner: postgres
--

COPY purchasing.credit_memo (credit_memo_id, inspection_id, status, document_no, document_date, delivery_date, due_date, total_credit, credit_balance, dpm_rate, dpm_amount, applied_amount, balance_due) FROM stdin;
PURCHASING-CRM-2025-4c5bd2	\N	Approved	30001	2025-03-16	2025-03-15	2025-04-15	0.00	0.00	0.00	0.00	0.00	0.00
PURCHASING-CRM-2025-f024a4	\N	Approved	30002	2025-03-17	2025-03-16	2025-04-16	50.00	50.00	0.00	0.00	0.00	0.00
PURCHASING-CRM-2025-e16292	\N	Pending	30003	2025-03-18	2025-03-17	2025-04-17	1299.99	1299.99	0.00	0.00	0.00	0.00
PURCHASING-CRM-2025-d431b6	\N	Approved	30004	2025-03-19	2025-03-18	2025-04-18	0.00	0.00	0.00	0.00	0.00	0.00
PURCHASING-CRM-2025-e28a40	\N	Approved	30005	2025-03-20	2025-03-19	2025-04-19	0.00	0.00	0.00	0.00	0.00	0.00
PURCHASING-CRM-2025-303997	\N	Pending	30006	2025-03-21	2025-03-20	2025-04-20	299.98	299.98	0.00	0.00	0.00	0.00
PURCHASING-CRM-2025-9c7ed8	\N	Approved	30007	2025-03-22	2025-03-21	2025-04-21	0.00	0.00	0.00	0.00	0.00	0.00
PURCHASING-CRM-2025-bf1bfa	\N	Approved	30008	2025-03-23	2025-03-22	2025-04-22	0.00	0.00	0.00	0.00	0.00	0.00
PURCHASING-CRM-2025-12a120	\N	Pending	30009	2025-03-24	2025-03-23	2025-04-23	699.99	699.99	0.00	0.00	0.00	0.00
PURCHASING-CRM-2025-6ec3cb	\N	Approved	30010	2025-03-25	2025-03-24	2025-04-24	0.00	0.00	0.00	0.00	0.00	0.00
PURCHASING-CRM-2025-d4ec6a	\N	Approved	30001	2025-03-16	2025-03-15	2025-04-15	0.00	0.00	0.00	0.00	0.00	0.00
PURCHASING-CRM-2025-fa69dc	\N	Approved	30002	2025-03-17	2025-03-16	2025-04-16	50.00	50.00	0.00	0.00	0.00	0.00
PURCHASING-CRM-2025-296dbc	\N	Pending	30003	2025-03-18	2025-03-17	2025-04-17	1299.99	1299.99	0.00	0.00	0.00	0.00
PURCHASING-CRM-2025-82a356	\N	Approved	30004	2025-03-19	2025-03-18	2025-04-18	0.00	0.00	0.00	0.00	0.00	0.00
PURCHASING-CRM-2025-c25526	\N	Approved	30005	2025-03-20	2025-03-19	2025-04-19	0.00	0.00	0.00	0.00	0.00	0.00
PURCHASING-CRM-2025-5f68e8	\N	Pending	30006	2025-03-21	2025-03-20	2025-04-20	299.98	299.98	0.00	0.00	0.00	0.00
PURCHASING-CRM-2025-2ef3c9	\N	Approved	30007	2025-03-22	2025-03-21	2025-04-21	0.00	0.00	0.00	0.00	0.00	0.00
PURCHASING-CRM-2025-e7c0a4	\N	Approved	30008	2025-03-23	2025-03-22	2025-04-22	0.00	0.00	0.00	0.00	0.00	0.00
PURCHASING-CRM-2025-cce4ab	\N	Pending	30009	2025-03-24	2025-03-23	2025-04-23	699.99	699.99	0.00	0.00	0.00	0.00
PURCHASING-CRM-2025-bcbfac	\N	Approved	30010	2025-03-25	2025-03-24	2025-04-24	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- Data for Name: purchase_invoice; Type: TABLE DATA; Schema: purchasing; Owner: postgres
--

COPY purchasing.purchase_invoice (invoice_id, purchase_id, status, document_no, document_date, due_date, total_credit, credit_balance, dpm_rate, dpm_amount, applied_amount, balance_due) FROM stdin;
PURCHASING-PUI-2025-c4bb98	\N	Completed	20001	2025-03-16	2025-04-15	0.00	0.00	0.00	0.00	1269.95	0.00
PURCHASING-PUI-2025-a0da14	\N	Pending	20002	2025-03-17	2025-04-16	0.00	0.00	0.00	0.00	0.00	1924.90
PURCHASING-PUI-2025-ffbefa	\N	Approved	20003	2025-03-18	2025-04-17	0.00	0.00	0.00	0.00	1000.00	2899.97
PURCHASING-PUI-2025-1cee49	\N	Rejected	20004	2025-03-19	2025-04-18	0.00	0.00	0.00	0.00	0.00	900.48
PURCHASING-PUI-2025-41a5c1	\N	Completed	20005	2025-03-20	2025-04-19	0.00	0.00	0.00	0.00	1199.99	0.00
PURCHASING-PUI-2025-4c9576	\N	Pending	20006	2025-03-21	2025-04-20	0.00	0.00	0.00	0.00	0.00	416.72
PURCHASING-PUI-2025-91587c	\N	Approved	20007	2025-03-22	2025-04-21	0.00	0.00	0.00	0.00	350.00	349.97
PURCHASING-PUI-2025-691cfa	\N	Rejected	20008	2025-03-23	2025-04-22	0.00	0.00	0.00	0.00	0.00	779.99
PURCHASING-PUI-2025-1ecbd6	\N	Completed	20009	2025-03-24	2025-04-23	0.00	0.00	0.00	0.00	1404.98	0.00
PURCHASING-PUI-2025-5ca8da	\N	Pending	20010	2025-03-25	2025-04-24	0.00	0.00	0.00	0.00	0.00	518.96
PURCHASING-PUI-2025-ad302d	\N	Completed	20001	2025-03-16	2025-04-15	0.00	0.00	0.00	0.00	1269.95	0.00
PURCHASING-PUI-2025-f73a95	\N	Pending	20002	2025-03-17	2025-04-16	0.00	0.00	0.00	0.00	0.00	1924.90
PURCHASING-PUI-2025-a572b5	\N	Approved	20003	2025-03-18	2025-04-17	0.00	0.00	0.00	0.00	1000.00	2899.97
PURCHASING-PUI-2025-0502b8	\N	Rejected	20004	2025-03-19	2025-04-18	0.00	0.00	0.00	0.00	0.00	900.48
PURCHASING-PUI-2025-b544ab	\N	Completed	20005	2025-03-20	2025-04-19	0.00	0.00	0.00	0.00	1199.99	0.00
PURCHASING-PUI-2025-a75b37	\N	Pending	20006	2025-03-21	2025-04-20	0.00	0.00	0.00	0.00	0.00	416.72
PURCHASING-PUI-2025-3b82ad	\N	Approved	20007	2025-03-22	2025-04-21	0.00	0.00	0.00	0.00	350.00	349.97
PURCHASING-PUI-2025-fa6491	\N	Rejected	20008	2025-03-23	2025-04-22	0.00	0.00	0.00	0.00	0.00	779.99
PURCHASING-PUI-2025-bec758	\N	Completed	20009	2025-03-24	2025-04-23	0.00	0.00	0.00	0.00	1404.98	0.00
PURCHASING-PUI-2025-a85d32	\N	Pending	20010	2025-03-25	2025-04-24	0.00	0.00	0.00	0.00	0.00	518.96
\.


--
-- Data for Name: purchase_order; Type: TABLE DATA; Schema: purchasing; Owner: postgres
--

COPY purchasing.purchase_order (purchase_id, quotation_id, order_date, delivery_date, document_date, status) FROM stdin;
PURCHASING-PUO-2025-abb37b	\N	2025-03-05	2025-03-15	2025-03-05	Completed
PURCHASING-PUO-2025-cee314	\N	2025-03-06	2025-03-16	2025-03-06	Pending
PURCHASING-PUO-2025-a3061e	\N	2025-03-07	2025-03-17	2025-03-07	Approved
PURCHASING-PUO-2025-099f11	\N	2025-03-08	2025-03-18	2025-03-08	Rejected
PURCHASING-PUO-2025-62b0da	\N	2025-03-09	2025-03-19	2025-03-09	Completed
PURCHASING-PUO-2025-8cdb07	\N	2025-03-10	2025-03-20	2025-03-10	Pending
PURCHASING-PUO-2025-b7d54c	\N	2025-03-11	2025-03-21	2025-03-11	Approved
PURCHASING-PUO-2025-aa4577	\N	2025-03-12	2025-03-22	2025-03-12	Rejected
PURCHASING-PUO-2025-69e0bd	\N	2025-03-13	2025-03-23	2025-03-13	Completed
PURCHASING-PUO-2025-cfc4e1	\N	2025-03-14	2025-03-24	2025-03-14	Pending
PURCHASING-PUO-2025-2489e6	\N	2025-03-05	2025-03-15	2025-03-05	Completed
PURCHASING-PUO-2025-ee9d68	\N	2025-03-06	2025-03-16	2025-03-06	Pending
PURCHASING-PUO-2025-216324	\N	2025-03-07	2025-03-17	2025-03-07	Approved
PURCHASING-PUO-2025-c4768e	\N	2025-03-08	2025-03-18	2025-03-08	Rejected
PURCHASING-PUO-2025-64fa3b	\N	2025-03-09	2025-03-19	2025-03-09	Completed
PURCHASING-PUO-2025-b3c549	\N	2025-03-10	2025-03-20	2025-03-10	Pending
PURCHASING-PUO-2025-f02c48	\N	2025-03-11	2025-03-21	2025-03-11	Approved
PURCHASING-PUO-2025-a89254	\N	2025-03-12	2025-03-22	2025-03-12	Rejected
PURCHASING-PUO-2025-ef5cc9	\N	2025-03-13	2025-03-23	2025-03-13	Completed
PURCHASING-PUO-2025-6c0a98	\N	2025-03-14	2025-03-24	2025-03-14	Pending
\.


--
-- Data for Name: purchase_quotation; Type: TABLE DATA; Schema: purchasing; Owner: postgres
--

COPY purchasing.purchase_quotation (quotation_id, vendor_code, quotation_content_id, status, document_no, valid_date, document_date, required_date, total_before_discount, discount_percent, freight, tax, total_payment) FROM stdin;
PURCHASING-PUQ-2025-6bd319	\N	\N	Approved	10001	2025-04-01	2025-03-01	2025-03-15	1249.95	10.00	50.00	93.75	1269.95
PURCHASING-PUQ-2025-aa5ce2	\N	\N	Pending	10002	2025-04-02	2025-03-02	2025-03-16	1899.90	5.00	75.00	142.49	1924.90
PURCHASING-PUQ-2025-91fe84	\N	\N	Approved	10003	2025-04-03	2025-03-03	2025-03-17	3899.97	10.00	0.00	389.99	3899.97
PURCHASING-PUQ-2025-9c71e0	\N	\N	Rejected	10004	2025-04-04	2025-03-04	2025-03-18	899.98	5.00	45.00	67.50	900.48
PURCHASING-PUQ-2025-5d4133	\N	\N	Approved	10005	2025-04-05	2025-03-05	2025-03-19	999.99	0.00	100.00	100.00	1199.99
PURCHASING-PUQ-2025-2b2196	\N	\N	Pending	10006	2025-04-06	2025-03-06	2025-03-20	449.97	15.00	30.00	33.75	416.72
PURCHASING-PUQ-2025-911185	\N	\N	Approved	10007	2025-04-07	2025-03-07	2025-03-21	599.98	0.00	40.00	59.99	699.97
PURCHASING-PUQ-2025-03ec5c	\N	\N	Rejected	10008	2025-04-08	2025-03-08	2025-03-22	799.99	10.00	60.00	72.00	779.99
PURCHASING-PUQ-2025-673219	\N	\N	Approved	10009	2025-04-09	2025-03-09	2025-03-23	1399.98	5.00	70.00	105.00	1404.98
PURCHASING-PUQ-2025-f1e646	\N	\N	Pending	10010	2025-04-10	2025-03-10	2025-03-24	519.96	5.00	35.00	39.00	518.96
PURCHASING-PUQ-2025-bcdca4	\N	\N	Approved	10001	2025-04-01	2025-03-01	2025-03-15	1249.95	10.00	50.00	93.75	1269.95
PURCHASING-PUQ-2025-aabc65	\N	\N	Pending	10002	2025-04-02	2025-03-02	2025-03-16	1899.90	5.00	75.00	142.49	1924.90
PURCHASING-PUQ-2025-a52683	\N	\N	Approved	10003	2025-04-03	2025-03-03	2025-03-17	3899.97	10.00	0.00	389.99	3899.97
PURCHASING-PUQ-2025-9b9f2c	\N	\N	Rejected	10004	2025-04-04	2025-03-04	2025-03-18	899.98	5.00	45.00	67.50	900.48
PURCHASING-PUQ-2025-63f03c	\N	\N	Approved	10005	2025-04-05	2025-03-05	2025-03-19	999.99	0.00	100.00	100.00	1199.99
PURCHASING-PUQ-2025-739c1a	\N	\N	Pending	10006	2025-04-06	2025-03-06	2025-03-20	449.97	15.00	30.00	33.75	416.72
PURCHASING-PUQ-2025-4d5db5	\N	\N	Approved	10007	2025-04-07	2025-03-07	2025-03-21	599.98	0.00	40.00	59.99	699.97
PURCHASING-PUQ-2025-1bdb5f	\N	\N	Rejected	10008	2025-04-08	2025-03-08	2025-03-22	799.99	10.00	60.00	72.00	779.99
PURCHASING-PUQ-2025-7535f1	\N	\N	Approved	10009	2025-04-09	2025-03-09	2025-03-23	1399.98	5.00	70.00	105.00	1404.98
PURCHASING-PUQ-2025-d15c71	\N	\N	Pending	10010	2025-04-10	2025-03-10	2025-03-24	519.96	5.00	35.00	39.00	518.96
\.


--
-- Data for Name: purchase_requests; Type: TABLE DATA; Schema: purchasing; Owner: postgres
--

COPY purchasing.purchase_requests (request_id, employee_id, approval_id, material_id, purchase_item, purchase_description, purchase_quantity, valid_date, document_date, required_date) FROM stdin;
PURCHASING-PUR-2025-be70ff	\N	\N	\N	Office Desk	Standard office desk 150x70cm	5	2025-04-01	2025-03-01	2025-03-15
PURCHASING-PUR-2025-0f1670	\N	\N	\N	Office Chair	Ergonomic office chair with adjustable armrests	10	2025-04-02	2025-03-02	2025-03-16
PURCHASING-PUR-2025-def48a	\N	\N	\N	Laptop Computer	Business laptop with i7 processor and 16GB RAM	3	2025-04-03	2025-03-03	2025-03-17
PURCHASING-PUR-2025-7296c5	\N	\N	\N	Printer	Color laser printer with scanner	2	2025-04-04	2025-03-04	2025-03-18
PURCHASING-PUR-2025-fa0064	\N	\N	\N	Server Rack	Server rack 42U	1	2025-04-05	2025-03-05	2025-03-19
PURCHASING-PUR-2025-5305d7	\N	\N	\N	Network Switch	24-port gigabit network switch	3	2025-04-06	2025-03-06	2025-03-20
PURCHASING-PUR-2025-211fcf	\N	\N	\N	UPS Battery	Uninterruptible power supply 1500VA	2	2025-04-07	2025-03-07	2025-03-21
PURCHASING-PUR-2025-f18c7d	\N	\N	\N	Conference Table	Large conference table for 12 people	1	2025-04-08	2025-03-08	2025-03-22
PURCHASING-PUR-2025-79b0a1	\N	\N	\N	Projector	4K business projector	2	2025-04-09	2025-03-09	2025-03-23
PURCHASING-PUR-2025-c14ffc	\N	\N	\N	Filing Cabinet	Metal filing cabinet with 4 drawers	4	2025-04-10	2025-03-10	2025-03-24
PURCHASING-PUR-2025-e32e2a	\N	\N	\N	Office Desk	Standard office desk 150x70cm	5	2025-04-01	2025-03-01	2025-03-15
PURCHASING-PUR-2025-2cc596	\N	\N	\N	Office Chair	Ergonomic office chair with adjustable armrests	10	2025-04-02	2025-03-02	2025-03-16
PURCHASING-PUR-2025-c267b0	\N	\N	\N	Laptop Computer	Business laptop with i7 processor and 16GB RAM	3	2025-04-03	2025-03-03	2025-03-17
PURCHASING-PUR-2025-f2c8dc	\N	\N	\N	Printer	Color laser printer with scanner	2	2025-04-04	2025-03-04	2025-03-18
PURCHASING-PUR-2025-5ff2ed	\N	\N	\N	Server Rack	Server rack 42U	1	2025-04-05	2025-03-05	2025-03-19
PURCHASING-PUR-2025-76234a	\N	\N	\N	Network Switch	24-port gigabit network switch	3	2025-04-06	2025-03-06	2025-03-20
PURCHASING-PUR-2025-c6ed5b	\N	\N	\N	UPS Battery	Uninterruptible power supply 1500VA	2	2025-04-07	2025-03-07	2025-03-21
PURCHASING-PUR-2025-340aa4	\N	\N	\N	Conference Table	Large conference table for 12 people	1	2025-04-08	2025-03-08	2025-03-22
PURCHASING-PUR-2025-42af61	\N	\N	\N	Projector	4K business projector	2	2025-04-09	2025-03-09	2025-03-23
PURCHASING-PUR-2025-c90bdf	\N	\N	\N	Filing Cabinet	Metal filing cabinet with 4 drawers	4	2025-04-10	2025-03-10	2025-03-24
\.


--
-- Data for Name: quotation_contents; Type: TABLE DATA; Schema: purchasing; Owner: postgres
--

COPY purchasing.quotation_contents (quotation_content_id, request_id, unit_price, discount, tax_code, total) FROM stdin;
PURCHASING-QUC-2025-8495c1	\N	249.99	10.00	TAX-001	1124.96
PURCHASING-QUC-2025-23aa91	\N	189.99	5.00	TAX-002	1804.91
PURCHASING-QUC-2025-877697	\N	1299.99	100.00	TAX-003	3599.97
PURCHASING-QUC-2025-634644	\N	449.99	20.00	TAX-004	859.98
PURCHASING-QUC-2025-d17fc4	\N	999.99	0.00	TAX-005	999.99
PURCHASING-QUC-2025-0031e1	\N	149.99	15.00	TAX-006	382.47
PURCHASING-QUC-2025-f00716	\N	299.99	0.00	TAX-007	599.98
PURCHASING-QUC-2025-60da98	\N	799.99	50.00	TAX-008	749.99
PURCHASING-QUC-2025-239234	\N	699.99	30.00	TAX-009	1369.98
PURCHASING-QUC-2025-5a23f2	\N	129.99	5.00	TAX-010	494.96
PURCHASING-QUC-2025-816cf2	\N	249.99	10.00	TAX-001	1124.96
PURCHASING-QUC-2025-5fc36f	\N	189.99	5.00	TAX-002	1804.91
PURCHASING-QUC-2025-461362	\N	1299.99	100.00	TAX-003	3599.97
PURCHASING-QUC-2025-80b485	\N	449.99	20.00	TAX-004	859.98
PURCHASING-QUC-2025-4d4cab	\N	999.99	0.00	TAX-005	999.99
PURCHASING-QUC-2025-1652d7	\N	149.99	15.00	TAX-006	382.47
PURCHASING-QUC-2025-94b122	\N	299.99	0.00	TAX-007	599.98
PURCHASING-QUC-2025-c641d8	\N	799.99	50.00	TAX-008	749.99
PURCHASING-QUC-2025-225934	\N	699.99	30.00	TAX-009	1369.98
PURCHASING-QUC-2025-5ec069	\N	129.99	5.00	TAX-010	494.96
\.


--
-- Data for Name: received_shipments; Type: TABLE DATA; Schema: purchasing; Owner: postgres
--

COPY purchasing.received_shipments (shipment_id, purchase_id, delivery_date) FROM stdin;
PURCHASING-RES-2025-3403fd	\N	2025-03-15
PURCHASING-RES-2025-494bc9	\N	2025-03-16
PURCHASING-RES-2025-7a4737	\N	2025-03-17
PURCHASING-RES-2025-1cd88f	\N	2025-03-18
PURCHASING-RES-2025-4f2fbb	\N	2025-03-19
PURCHASING-RES-2025-0f4724	\N	2025-03-20
PURCHASING-RES-2025-7cf95f	\N	2025-03-21
PURCHASING-RES-2025-8d3f73	\N	2025-03-22
PURCHASING-RES-2025-d9fd04	\N	2025-03-23
PURCHASING-RES-2025-b4473c	\N	2025-03-24
PURCHASING-RES-2025-cdef9c	\N	2025-03-15
PURCHASING-RES-2025-477a3b	\N	2025-03-16
PURCHASING-RES-2025-6d8442	\N	2025-03-17
PURCHASING-RES-2025-3ef3a3	\N	2025-03-18
PURCHASING-RES-2025-3926e4	\N	2025-03-19
PURCHASING-RES-2025-dfc92e	\N	2025-03-20
PURCHASING-RES-2025-4ae06c	\N	2025-03-21
PURCHASING-RES-2025-f94b42	\N	2025-03-22
PURCHASING-RES-2025-86f3e5	\N	2025-03-23
PURCHASING-RES-2025-069d39	\N	2025-03-24
\.


--
-- Data for Name: vendor_application; Type: TABLE DATA; Schema: purchasing; Owner: postgres
--

COPY purchasing.vendor_application (application_reference, status, company_name, tax_number, contact_person, title, vendor_address, phone, fax, vendor_email, tax_exempt, vendor_website, organization_type, separate_checks, purchasing_card, account_no, routing_no, requestor, date_requested) FROM stdin;
PURCHASING-VEP-2025-d81f79	Pending	Tech Solutions Inc	123456789	John Smith	CEO	123 Tech St, San Francisco, CA	5551234567	5551234568	contact@techsolutions.com	t	www.techsolutions.com	Corporation	f	t	987654321	123456	Mary Johnson	2025-01-15
PURCHASING-VEP-2025-51bf05	Approved	Office Supplies Co	234567890	Jane Doe	Sales Manager	456 Supply Ave, Chicago, IL	5552345678	5552345679	sales@officesupplies.com	f	www.officesupplies.com	LLC	t	t	876543210	234567	Bob Williams	2025-01-16
PURCHASING-VEP-2025-36a9a1	Rejected	Industrial Parts Ltd	345678901	Mike Brown	Director	789 Industry Blvd, Detroit, MI	5553456789	5553456780	info@industrialparts.com	f	www.industrialparts.com	Corporation	f	f	765432109	345678	Sarah Davis	2025-01-17
PURCHASING-VEP-2025-6e015f	Pending	Global Traders	456789012	Lisa Chen	Procurement Officer	101 Trade Center, New York, NY	5554567890	5554567891	info@globaltraders.com	t	www.globaltraders.com	Partnership	t	f	654321098	456789	Tom Wilson	2025-01-18
PURCHASING-VEP-2025-4d0128	Approved	Green Energy Solutions	567890123	David Green	Founder	202 Solar Way, Phoenix, AZ	5555678901	5555678902	contact@greenenergy.com	t	www.greenenergy.com	Nonprofit	f	t	543210987	567890	Emma Brown	2025-01-19
PURCHASING-VEP-2025-8a5c05	Pending	Quality Manufacturing	678901234	Robert Taylor	Operations Manager	303 Quality Dr, Seattle, WA	5556789012	5556789013	operations@qualitymfg.com	f	www.qualitymfg.com	LLC	f	f	432109876	678901	Alex Johnson	2025-01-20
PURCHASING-VEP-2025-d564d5	Approved	Food Distributors Inc	789012345	Maria Rodriguez	Supply Chain Manager	404 Food Way, Miami, FL	5557890123	5557890124	supply@fooddist.com	f	www.fooddist.com	Corporation	t	t	321098765	789012	Chris Lee	2025-01-21
PURCHASING-VEP-2025-e9707e	Rejected	Construction Materials Co	890123456	James Wilson	President	505 Builder Ave, Denver, CO	5558901234	5558901235	info@constructionmat.com	f	www.constructionmat.com	Corporation	f	t	210987654	890123	Jennifer Adams	2025-01-22
PURCHASING-VEP-2025-dfa806	Pending	Medical Supplies Ltd	901234567	Susan White	CEO	606 Health St, Boston, MA	5559012345	5559012346	contact@medicalsupplies.com	t	www.medicalsupplies.com	LLC	t	f	109876543	901234	Kevin Park	2025-01-23
PURCHASING-VEP-2025-3ba1ae	Approved	Tech Innovations	123789456	Andrew Miller	Director	707 Innovation Way, Austin, TX	5551237894	5551237895	info@techinnovations.com	t	www.techinnovations.com	Sole Proprietorship	f	t	987123456	123789	Michelle Garcia	2025-01-24
PURCHASING-VEP-2025-078fa8	Pending	Tech Solutions Inc	123456789	John Smith	CEO	123 Tech St, San Francisco, CA	5551234567	5551234568	contact@techsolutions.com	t	www.techsolutions.com	Corporation	f	t	987654321	123456	Mary Johnson	2025-01-15
PURCHASING-VEP-2025-7b8b91	Approved	Office Supplies Co	234567890	Jane Doe	Sales Manager	456 Supply Ave, Chicago, IL	5552345678	5552345679	sales@officesupplies.com	f	www.officesupplies.com	LLC	t	t	876543210	234567	Bob Williams	2025-01-16
PURCHASING-VEP-2025-a8f3bd	Rejected	Industrial Parts Ltd	345678901	Mike Brown	Director	789 Industry Blvd, Detroit, MI	5553456789	5553456780	info@industrialparts.com	f	www.industrialparts.com	Corporation	f	f	765432109	345678	Sarah Davis	2025-01-17
PURCHASING-VEP-2025-8cfd01	Pending	Global Traders	456789012	Lisa Chen	Procurement Officer	101 Trade Center, New York, NY	5554567890	5554567891	info@globaltraders.com	t	www.globaltraders.com	Partnership	t	f	654321098	456789	Tom Wilson	2025-01-18
PURCHASING-VEP-2025-0a5d51	Approved	Green Energy Solutions	567890123	David Green	Founder	202 Solar Way, Phoenix, AZ	5555678901	5555678902	contact@greenenergy.com	t	www.greenenergy.com	Nonprofit	f	t	543210987	567890	Emma Brown	2025-01-19
PURCHASING-VEP-2025-96b335	Pending	Quality Manufacturing	678901234	Robert Taylor	Operations Manager	303 Quality Dr, Seattle, WA	5556789012	5556789013	operations@qualitymfg.com	f	www.qualitymfg.com	LLC	f	f	432109876	678901	Alex Johnson	2025-01-20
PURCHASING-VEP-2025-ee62e7	Approved	Food Distributors Inc	789012345	Maria Rodriguez	Supply Chain Manager	404 Food Way, Miami, FL	5557890123	5557890124	supply@fooddist.com	f	www.fooddist.com	Corporation	t	t	321098765	789012	Chris Lee	2025-01-21
PURCHASING-VEP-2025-dd6e1f	Rejected	Construction Materials Co	890123456	James Wilson	President	505 Builder Ave, Denver, CO	5558901234	5558901235	info@constructionmat.com	f	www.constructionmat.com	Corporation	f	t	210987654	890123	Jennifer Adams	2025-01-22
PURCHASING-VEP-2025-086085	Pending	Medical Supplies Ltd	901234567	Susan White	CEO	606 Health St, Boston, MA	5559012345	5559012346	contact@medicalsupplies.com	t	www.medicalsupplies.com	LLC	t	f	109876543	901234	Kevin Park	2025-01-23
PURCHASING-VEP-2025-d5be50	Approved	Tech Innovations	123789456	Andrew Miller	Director	707 Innovation Way, Austin, TX	5551237894	5551237895	info@techinnovations.com	t	www.techinnovations.com	Sole Proprietorship	f	t	987123456	123789	Michelle Garcia	2025-01-24
\.


--
-- Data for Name: blanket_agreement; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.blanket_agreement (agreement_id, statement_id, start_date, end_date, status, description, signed_date, agreement_method) FROM stdin;
SALES-AGRMNT-2025-f91ef4	SALES-STM-2025-f4b14f	2026-05-01 00:00:00	2027-05-01 00:00:00	Active	Hospital IT Infrastructure	2026-05-02 00:00:00	Electronic
SALES-AGRMNT-2025-f81d25	SALES-STM-2025-b90b4b	2025-07-01 00:00:00	2026-07-01 00:00:00	Active	Hospital Beds & Furniture	2025-07-02 00:00:00	Electronic
SALES-AGRMNT-2025-f49f2f	SALES-STM-2025-948f52	2026-02-01 00:00:00	2027-02-01 00:00:00	Active	Orthopedic Implants Agreement	2026-02-02 00:00:00	Written
SALES-AGRMNT-2025-f1b357	SALES-STM-2025-91058d	2025-12-01 00:00:00	2026-12-01 00:00:00	Expired	Dental Supplies Contract	2025-12-02 00:00:00	Electronic
SALES-AGRMNT-2025-8efc83	SALES-STM-2025-755417	2025-06-01 00:00:00	2026-06-01 00:00:00	Active	Lab Equipment Agreement	2025-06-02 00:00:00	Written
SALES-AGRMNT-2025-8abd25	SALES-STM-2025-6b1653	2025-01-01 00:00:00	2026-01-01 00:00:00	Active	Hospital Equipment Supply	2025-01-02 00:00:00	Written
SALES-AGRMNT-2025-7efbf7	SALES-STM-2025-656095	2026-04-01 00:00:00	2027-04-01 00:00:00	Active	Medical Imaging Supplies	2026-04-02 00:00:00	Written
SALES-AGRMNT-2025-7368b1	SALES-STM-2025-5e569c	2025-04-01 00:00:00	2026-04-01 00:00:00	Active	Pharmaceutical Supplies Contract	2025-04-02 00:00:00	Written
SALES-AGRMNT-2025-71cc89	SALES-STM-2025-3acfef	2025-02-01 00:00:00	2026-02-01 00:00:00	Expired	Medical Device Agreement	2025-02-02 00:00:00	Electronic
SALES-AGRMNT-2025-6c299a	SALES-STM-2025-f6b7d0	2026-03-01 00:00:00	2027-03-01 00:00:00	Cancelled	Anesthesia Equipment Supply	2026-03-02 00:00:00	Electronic
SALES-AGRMNT-2025-4212de	SALES-STM-2025-35c700	2025-11-01 00:00:00	2026-11-01 00:00:00	Active	Radiology Equipment Supply	2025-11-02 00:00:00	Written
SALES-AGRMNT-2025-3b909d	SALES-STM-2025-29deb9	2026-06-01 00:00:00	2027-06-01 00:00:00	Active	Pharmacy Automation Systems	2026-06-02 00:00:00	Oral
SALES-AGRMNT-2025-3aa3bf	SALES-STM-2025-2cc7f2	2025-03-01 00:00:00	2026-03-01 00:00:00	Active	Diagnostic Equipment Supply	2025-03-02 00:00:00	Oral
SALES-AGRMNT-2025-21bea4	SALES-STM-2025-21f5af	2025-09-01 00:00:00	2026-09-01 00:00:00	Expired	Surgical Equipment Agreement	2025-09-02 00:00:00	Written
SALES-AGRMNT-2025-216957	SALES-STM-2025-2879fa	2025-10-01 00:00:00	2026-10-01 00:00:00	Active	Pediatric Medical Supplies	2025-10-02 00:00:00	Electronic
SALES-AGRMNT-2025-1a2def	SALES-STM-2025-2f3fae	2026-01-01 00:00:00	2027-01-01 00:00:00	Active	Emergency Medical Kits	2026-01-02 00:00:00	Oral
SALES-AGRMNT-2025-0f4ab6	SALES-STM-2025-251924	2026-07-01 00:00:00	2027-07-01 00:00:00	Expired	Rehabilitation Equipment	2026-07-02 00:00:00	Written
SALES-AGRMNT-2025-0ed260	SALES-STM-2025-600a2f	2025-08-01 00:00:00	2026-08-01 00:00:00	Active	Pharmaceutical Distribution	2025-08-02 00:00:00	Oral
SALES-AGRMNT-2025-0cd5ff	SALES-STM-2025-c86ce6	2026-08-01 00:00:00	2027-08-01 00:00:00	Active	Veterinary Medical Supplies	2026-08-02 00:00:00	Electronic
SALES-AGRMNT-2025-028745	SALES-STM-2025-16fb8a	2025-05-01 00:00:00	2026-05-01 00:00:00	Cancelled	Medical Accessories Supply	2025-05-02 00:00:00	Electronic
\.


--
-- Data for Name: campaign_contacts; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.campaign_contacts (contact_id, lead_id, campaign_id, response_status) FROM stdin;
SALES-CONTACT-2025-fbd269	SALES-LEAD-2025-303904	SALES-CMPGN-2025-59cd34	Not Interested
SALES-CONTACT-2025-e98193	SALES-LEAD-2025-a83d44	SALES-CMPGN-2025-59cd34	Not Interested
SALES-CONTACT-2025-e0f42e	SALES-LEAD-2025-449b6d	SALES-CMPGN-2025-59cd34	Pending
SALES-CONTACT-2025-dfc91d	SALES-LEAD-2025-e74eb4	SALES-CMPGN-2025-bb9272	Not Interested
SALES-CONTACT-2025-d920b5	SALES-LEAD-2025-42c53e	SALES-CMPGN-2025-bb9272	Interested
SALES-CONTACT-2025-ca59cc	SALES-LEAD-2025-259440	SALES-CMPGN-2025-a2fba8	Pending
SALES-CONTACT-2025-c8f8f4	SALES-LEAD-2025-30b5e4	SALES-CMPGN-2025-846658	Pending
SALES-CONTACT-2025-9f36ed	SALES-LEAD-2025-3864ce	SALES-CMPGN-2025-85634d	Interested
SALES-CONTACT-2025-97d86c	SALES-LEAD-2025-84165e	SALES-CMPGN-2025-ff71e8	Not Interested
SALES-CONTACT-2025-8f11c8	SALES-LEAD-2025-38100d	SALES-CMPGN-2025-e4d734	Interested
SALES-CONTACT-2025-7b555f	SALES-LEAD-2025-84165e	SALES-CMPGN-2025-3538c1	Not Interested
SALES-CONTACT-2025-721ecf	SALES-LEAD-2025-38100d	SALES-CMPGN-2025-871a35	Interested
SALES-CONTACT-2025-717495	SALES-LEAD-2025-84165e	SALES-CMPGN-2025-76996e	Interested
SALES-CONTACT-2025-50ec63	SALES-LEAD-2025-38100d	SALES-CMPGN-2025-78ce57	Pending
SALES-CONTACT-2025-45c7a5	SALES-LEAD-2025-38100d	SALES-CMPGN-2025-78ce57	Interested
SALES-CONTACT-2025-3a9c27	SALES-LEAD-2025-5324b7	SALES-CMPGN-2025-19cdfa	Pending
SALES-CONTACT-2025-363ac0	SALES-LEAD-2025-54e824	SALES-CMPGN-2025-c3bcdb	Pending
SALES-CONTACT-2025-357341	SALES-LEAD-2025-54e824	SALES-CMPGN-2025-cc3288	Interested
SALES-CONTACT-2025-064025	SALES-LEAD-2025-54e824	SALES-CMPGN-2025-f796df	Not Interested
SALES-CONTACT-2025-017e9e	SALES-LEAD-2025-a8ee0a	SALES-CMPGN-2025-056a95	Interested
\.


--
-- Data for Name: campaigns; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.campaigns (campaign_id, campaign_name, type, start_date, end_date, status) FROM stdin;
SALES-CMPGN-2025-59cd34	New Medical Equipment Launch	Email	2025-04-01 08:00:00	2025-04-15 23:59:59	Planned
SALES-CMPGN-2025-bb9272	Exclusive Discount for Clinics	Email	2025-03-20 08:00:00	2025-04-05 23:59:59	Active
SALES-CMPGN-2025-a2fba8	Hospital Procurement Webinar	Email	2025-03-10 08:00:00	2025-03-15 23:59:59	Completed
SALES-CMPGN-2025-846658	Free Sample: Surgical Masks	Email	2025-04-10 08:00:00	2025-04-20 23:59:59	Planned
SALES-CMPGN-2025-85634d	Loyalty Rewards for Pharmacies	Email	2025-03-01 08:00:00	2025-03-31 23:59:59	Active
SALES-CMPGN-2025-ff71e8	Medical Device Compliance Update	Email	2025-02-20 08:00:00	2025-03-05 23:59:59	Completed
SALES-CMPGN-2025-e4d734	Healthcare Expo Invitation	Email	2025-04-05 08:00:00	2025-04-25 23:59:59	Planned
SALES-CMPGN-2025-3538c1	Exclusive Bulk Order Offer	Email	2025-03-15 08:00:00	2025-03-30 23:59:59	Active
SALES-CMPGN-2025-871a35	New FDA-Approved Products	Email	2025-02-10 08:00:00	2025-02-28 23:59:59	Completed
SALES-CMPGN-2025-76996e	Emergency Medical Supplies Sale	Email	2025-04-12 08:00:00	2025-04-22 23:59:59	Planned
SALES-CMPGN-2025-78ce57	Medical Equipment Expo 2025	Email	2025-05-01 08:00:00	2025-05-15 23:59:59	Planned
SALES-CMPGN-2025-19cdfa	Pharmacy Discount Campaign	Email	2025-04-10 08:00:00	2025-04-25 23:59:59	Active
SALES-CMPGN-2025-c3bcdb	Healthcare Innovation Webinar	Email	2025-03-25 08:00:00	2025-04-05 23:59:59	Completed
SALES-CMPGN-2025-cc3288	Free Sample: Diagnostic Kits	Email	2025-05-05 08:00:00	2025-05-20 23:59:59	Planned
SALES-CMPGN-2025-f796df	Loyalty Program for Hospitals	Email	2025-04-01 08:00:00	2025-04-30 23:59:59	Active
SALES-CMPGN-2025-056a95	Medical Compliance Training	Email	2025-03-15 08:00:00	2025-03-25 23:59:59	Completed
SALES-CMPGN-2025-a2fed5	Healthcare Summit Invitation	Email	2025-05-10 08:00:00	2025-05-30 23:59:59	Planned
SALES-CMPGN-2025-59967a	Exclusive Offer: Lab Equipment	Email	2025-04-15 08:00:00	2025-04-30 23:59:59	Active
SALES-CMPGN-2025-f3640c	New Product Launch: Ventilators	Email	2025-03-20 08:00:00	2025-04-10 23:59:59	Completed
SALES-CMPGN-2025-30dc07	Emergency Supplies Discount	Email	2025-05-12 08:00:00	2025-05-25 23:59:59	Planned
\.


--
-- Data for Name: customers; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.customers (customer_id, gl_account_id, partner_id, name, email_address, phone_number, address_line1, address_line2, city, postal_code, country, customer_type, status, debt, contact_person) FROM stdin;
SALES-CUST-2025-614801	\N	\N	Cebu Doctors University Hospital	contact@cebudoctors.com.ph	+63-32-255-5555	Osmeña Boulevard	Capitol Site	Cebu City	6000	Philippines	Client	Active	0.00	\N
SALES-CUST-2025-df9ce6	\N	\N	Quirino Memorial Medical Center	support@quirinomemorial.com.ph	+63-2-8913-7890	Katipunan Avenue	Project 4	Quezon City	1109	Philippines	Client	Active	700.00	Wesley So
SALES-CUST-2025-dbfe2c	\N	\N	World Citi Medical Center	billing@worldciti.com.ph	+63-2-8913-8380	960 Aurora Blvd	Cubao	Quezon City	1109	Philippines	Prospect	Active	500.00	Arjun Erigaisi
SALES-CUST-2025-d105ee	\N	\N	Capitol Medical Center	support@capitolmedical.com.ph	+63-2-8372-3825	Quezon Avenue	Diliman	Quezon City	1101	Philippines	Client	Active	1800.00	Nodirbek Abdusattorov
SALES-CUST-2025-cd1d37	\N	\N	Ospital ng Makati	info@ospitalngmakati.com.ph	+63-2-8828-8443	J.P. Rizal Avenue	Poblacion	Makati	1210	Philippines	Prospect	Active	600.00	Ding Liren
SALES-CUST-2025-cbf858	\N	\N	Asian Hospital and Medical Center	sales@asianhospital.com.ph	+63-2-8771-9000	2205 Civic Drive	Filinvest City	Muntinlupa	1781	Philippines	Prospect	Active	500.00	Fabiano Caruana
SALES-CUST-2025-b1576f	\N	\N	Metro Manila Medical Center	info@metromanilamed.com.ph	+63-2-8711-4141	1357 G. Masangkay Street	Binondo	Manila	1006	Philippines	Client	Active	1250.00	Alireza Firouzja
SALES-CUST-2025-a6775c	\N	\N	St. Luke’s Medical Center	contact@stlukes.com.ph	+63-2-8723-0101	279 E. Rodriguez Sr. Avenue	Quezon City	Quezon City	1112	Philippines	Client	Active	1500.00	Levon Aronian
SALES-CUST-2025-a42491	\N	\N	Davao Doctors Hospital	orders@davaodoctors.com.ph	+63-82-222-8000	118 E. Quirino Avenue	Poblacion	Davao City	8000	Philippines	Client	Active	650.00	Anish Giri
SALES-CUST-2025-941d72	\N	\N	Philippine General Hospital	contact@pgh.gov.ph	+63-2-8554-8400	Taft Avenue	Ermita	Manila	1000	Philippines	Client	Active	2000.00	Luka Doncic
SALES-CUST-2025-fbdaf0	\N	\N	East Avenue Medical Center	contact@eastave.com.ph	+63-2-8928-0611	East Avenue	Diliman	Quezon City	1101	Philippines	Client	Active	950.00	Magnus Carlsen
SALES-CUST-2025-f7aa99	\N	\N	Makati Medical Center	info@makatimed.com.ph	+63-2-8888-9999	2 Amorsolo Street	Legaspi Village	Makati	1229	Philippines	Client	Active	2500.00	Hikaru Nakamura
SALES-CUST-2025-eac405	\N	\N	Perpetual Help Medical Center	contact@perpetualhelp.com.ph	+63-2-8871-0639	Alabang-Zapote Road	Pamplona	Las Piñas	1740	Philippines	Client	Active	1250.00	Ian Nepomniachtchi
SALES-CUST-2025-8cdccd	\N	\N	Cardinal Santos Medical Center	info@cardinalsantos.com.ph	+63-2-8727-0001	10 Wilson Street	Greenhills	San Juan	1502	Philippines	Client	Active	750.00	Austin Reaves
SALES-CUST-2025-6a3167	\N	\N	The Medical City	support@medicalcity.com.ph	+63-2-8639-2000	Ortigas Avenue	Pasig City	Pasig	1605	Philippines	Client	Active	0.00	LeBron James
SALES-CUST-2025-665436	\N	ADMIN-PARTNER-2025-76666b	Medical Center Inc.	sales@medicalcenter.com	09123456789	120 Washington Avenue	26 Carmine St	New York	07007	United States	Client	Active	0.00	Nikola Jokic
SALES-CUST-2025-641c4a	\N	ADMIN-PARTNER-2025-cc0ffb	The Very Best Medical	mail@tvbm.com	09123456789	3525 Sunrise Hwy	134 Division St	New York	07008	United States	Client	Active	0.00	Anthony Davis
SALES-CUST-2025-59eb62	\N	\N	Lung Center of the Philippines	contact@lungcenter.com.ph	+63-2-8924-6101	Quezon Avenue	Diliman	Quezon City	1101	Philippines	Client	Active	0.00	Stephen Curry
SALES-CUST-2025-3f84fe	\N	ADMIN-PARTNER-2025-f74e96	Miramax Medical	business@miramax.com	09123456789	1897 Uday Chand Marg	3 Bhagwan Bhavan	Delhi	400053	India	Client	Active	0.00	Dirk Nowitzki
SALES-CUST-2025-3197ba	\N	\N	Manila Doctors Hospital	support@maniladoctors.com.ph	+63-2-8558-0888	667 United Nations Avenue	Ermita	Manila	1000	Philippines	Client	Active	300.00	Anthony Edwards
SALES-CUST-2025-2ba07b	\N	\N	Jose R. Reyes Memorial Medical Center	info@jrrmmc.gov.ph	+63-2-8731-3229	Rizal Avenue	Sta. Cruz	Manila	1003	Philippines	Prospect	Active	400.00	Michael Jordan
SALES-CUST-2025-2597c0	\N	\N	Rizal Medical Center	info@rizalmed.com.ph	+63-2-8941-2911	Pasig Boulevard	Maybunga	Pasig	1607	Philippines	Client	Active	3000.00	Shaquille O'Neal
SALES-CUST-2025-0294dc	\N	\N	National Kidney and Transplant Institute	support@nkti.gov.ph	+63-2-8981-0300	East Avenue	Diliman	Quezon City	1100	Philippines	Client	Active	2300.00	Tim Duncan
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.leads (lead_id, salesrep_id, lead_name, lead_email, lead_phonenum, source, status) FROM stdin;
SALES-LEAD-2025-303904	\N	Dr. Jose Martinez	jose.martinez@healthclinic.com	+63-917-555-1001	Referral	Contacted
SALES-LEAD-2025-a83d44	\N	Maria Santos	maria.santos@meditechph.com	+63-917-555-1002	Website	Qualified
SALES-LEAD-2025-449b6d	\N	Carlos Dela Cruz	carlos.dc@lifelinediag.com	+63-917-555-1003	Cold Call	New
SALES-LEAD-2025-e74eb4	\N	Anna Reyes	anna.reyes@biopharmph.com	+63-917-555-1004	Email	Converted
SALES-LEAD-2025-42c53e	\N	Rafael Gonzales	rafael.gonzales@pharmasolutions.com	+63-917-555-1005	Referral	Lost
SALES-LEAD-2025-259440	\N	Isabel Flores	isabel.flores@mediserveph.com	+63-917-555-1006	Website	Qualified
SALES-LEAD-2025-30b5e4	\N	Michael Torres	michael.torres@healthplus.com.ph	+63-917-555-1007	Cold Call	Contacted
SALES-LEAD-2025-3864ce	\N	Elena Cruz	elena.cruz@philmedpharma.com	+63-917-555-1008	Email	Converted
SALES-LEAD-2025-84165e	\N	Luis Navarro	luis.navarro@vitalcareph.com	+63-917-555-1009	Referral	Qualified
SALES-LEAD-2025-38100d	\N	Patricia Mendoza	patricia.mendoza@pediacareph.com	+63-917-555-1010	Website	New
SALES-LEAD-2025-5324b7	\N	Dr. Sofia Rivera	sofia.rivera@medicorp.com	+63-917-555-1011	Referral	Contacted
SALES-LEAD-2025-54e824	\N	Juan Dela Rosa	juan.delarosa@healthtech.com	+63-917-555-1012	Website	Qualified
SALES-LEAD-2025-a8ee0a	\N	Carmen Lopez	carmen.lopez@diagnostics.com	+63-917-555-1013	Cold Call	New
SALES-LEAD-2025-7ccb64	\N	Ricardo Santos	ricardo.santos@pharmatech.com	+63-917-555-1014	Email	Converted
SALES-LEAD-2025-b053ef	\N	Andrea Gomez	andrea.gomez@medisupply.com	+63-917-555-1015	Referral	Lost
SALES-LEAD-2025-d1cb25	\N	Miguel Torres	miguel.torres@healthcare.com	+63-917-555-1016	Website	Qualified
SALES-LEAD-2025-271501	\N	Elena Ramirez	elena.ramirez@medisolutions.com	+63-917-555-1017	Cold Call	Contacted
SALES-LEAD-2025-540ae9	\N	Fernando Cruz	fernando.cruz@pharmalife.com	+63-917-555-1018	Email	Converted
SALES-LEAD-2025-ef1257	\N	Lucia Fernandez	lucia.fernandez@vitalmed.com	+63-917-555-1019	Referral	Qualified
SALES-LEAD-2025-4a4dab	\N	Roberto Alvarez	roberto.alvarez@medicore.com	+63-917-555-1020	Website	New
\.


--
-- Data for Name: opportunities; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.opportunities (opportunity_id, customer_id, partner_id, salesrep_id, estimated_value, expected_closed_date, stage, status, description, reason_lost) FROM stdin;
SALES-OPP-2025-e9b6c4	SALES-CUST-2025-a6775c	ADMIN-PARTNER-2025-1c49e2	HR-EMP-2025-f0cffe	200000.00	2025-07-30	Closed	Won	Bulk order for surgical gloves and hospital beds.	
SALES-OPP-2025-e1589d	SALES-CUST-2025-f7aa99	ADMIN-PARTNER-2025-fb5757	HR-EMP-2025-f0cffe	12000.00	2025-06-10	Negotiation	Open	Service maintenance contract for medical equipment.	
SALES-OPP-2025-cf73e9	SALES-CUST-2025-6a3167	ADMIN-PARTNER-2025-6180de	HR-EMP-2025-b15e2f	150000.00	2025-04-20	Negotiation	Open	Negotiating pricing for ventilators.	
SALES-OPP-2025-bcf781	SALES-CUST-2025-cbf858	ADMIN-PARTNER-2025-63fd8e	HR-EMP-2025-b15e2f	20000.00	2025-05-10	Closed	Won	Sold 200 syringes and 50 BP monitors.	
SALES-OPP-2025-b98cab	SALES-CUST-2025-941d72	ADMIN-PARTNER-2025-bc6ec3	HR-EMP-2025-9e7313	600000.00	2025-08-01	Negotiation	Lost	Large order for ventilators.	Customer chose competitor.
SALES-OPP-2025-b26644	SALES-CUST-2025-3197ba	ADMIN-PARTNER-2025-7105fc	HR-EMP-2025-b15e2f	10000.00	2025-05-25	Closed	Lost	Small clinic interested in X-ray machine.	Budget constraints.
SALES-OPP-2025-a0bef8	SALES-CUST-2025-8cdccd	ADMIN-PARTNER-2025-3fed97	HR-EMP-2025-f0cffe	95000.00	2025-05-20	Prospecting	Open	Potential deal for 3 new dialysis machines.	
SALES-OPP-2025-8570cd	SALES-CUST-2025-dbfe2c	ADMIN-PARTNER-2025-93d94d	HR-EMP-2025-b15e2f	180000.00	2025-06-30	Closed	Won	Bulk order for surgical gloves and hospital furniture.	
SALES-OPP-2025-84846c	SALES-CUST-2025-a42491	ADMIN-PARTNER-2025-93d94d	HR-EMP-2025-9e7313	8000.00	2025-04-25	Closed	Lost	Small clinic interested in ECG machine.	Budget constraints.
SALES-OPP-2025-6ea508	SALES-CUST-2025-614801	ADMIN-PARTNER-2025-a665c4	HR-EMP-2025-9e7313	90000.00	2025-07-01	Prospecting	Open	New client interested in MRI machines.	
SALES-OPP-2025-6e9fef	SALES-CUST-2025-b1576f	ADMIN-PARTNER-2025-a7e20d	HR-EMP-2025-b15e2f	250000.00	2025-05-15	Prospecting	Open	Potential MRI scanner bulk order for hospital.	
SALES-OPP-2025-6e4bbf	SALES-CUST-2025-fbdaf0	ADMIN-PARTNER-2025-73d402	HR-EMP-2025-f0cffe	18000.00	2025-07-10	Negotiation	Open	Service maintenance contract for lab equipment.	
SALES-OPP-2025-544114	SALES-CUST-2025-d105ee	ADMIN-PARTNER-2025-20fcd8	HR-EMP-2025-9e7313	110000.00	2025-06-20	Prospecting	Open	Potential deal for 5 new dialysis machines.	
SALES-OPP-2025-524755	SALES-CUST-2025-cd1d37	ADMIN-PARTNER-2025-03bc88	HR-EMP-2025-f0cffe	25000.00	2025-06-10	Closed	Won	Sold 300 syringes and 100 BP monitors.	
SALES-OPP-2025-2f8710	SALES-CUST-2025-59eb62	ADMIN-PARTNER-2025-257ac1	HR-EMP-2025-b15e2f	500000.00	2025-07-01	Negotiation	Lost	Large order for hospital beds.	Customer chose competitor.
SALES-OPP-2025-1f3caf	SALES-CUST-2025-0294dc	ADMIN-PARTNER-2025-29b3ed	HR-EMP-2025-b15e2f	15000.00	2025-04-30	Closed	Won	Sold 1000 surgical masks.	
SALES-OPP-2025-1c1b9d	SALES-CUST-2025-2597c0	ADMIN-PARTNER-2025-87201f	HR-EMP-2025-b15e2f	10000.00	2025-03-30	Closed	Won	Sold 500 surgical gloves.	
SALES-OPP-2025-168ce4	SALES-CUST-2025-2597c0	ADMIN-PARTNER-2025-4602bc	HR-EMP-2025-9e7313	300000.00	2025-06-15	Prospecting	Open	Potential deal for CT scanners.	
SALES-OPP-2025-0456fe	SALES-CUST-2025-df9ce6	ADMIN-PARTNER-2025-ccfa60	HR-EMP-2025-f0cffe	120000.00	2025-05-20	Negotiation	Open	Negotiating pricing for ultrasound machines.	
SALES-OPP-2025-041b10	SALES-CUST-2025-2ba07b	ADMIN-PARTNER-2025-6fc170	HR-EMP-2025-9e7313	75000.00	2025-06-01	Prospecting	Open	New client interested in defibrillators.	
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.orders (order_id, statement_id, quotation_id, rework_id, goods_issue_id, order_date, order_status, order_total_amount, order_type) FROM stdin;
SALES-ORD-2025-e16c9e	SALES-STM-2025-f4b14f	SALES-QT-2025-e3b105	\N	\N	2025-03-21 20:04:05.814368	Pending	135266.04	Direct
SALES-ORD-2025-db9aae	SALES-STM-2025-b90b4b	SALES-QT-2025-e28d7b	\N	\N	2025-03-22 11:15:21.987654	Pending	89934.00	Direct
SALES-ORD-2025-d91eeb	SALES-STM-2025-948f52	SALES-QT-2025-e10427	\N	\N	2025-03-22 11:10:56.345678	Processed	598234.55	Direct
SALES-ORD-2025-be90ee	SALES-STM-2025-948f52	SALES-QT-2025-ce21a5	\N	\N	2025-03-22 11:20:44.234567	Pending	475822.67	Scheduled
SALES-ORD-2025-b59c3e	SALES-STM-2025-91058d	SALES-QT-2025-cb1443	\N	\N	2025-03-21 20:03:08.777183	Pending	3544677.76	Direct
SALES-ORD-2025-b4a34b	SALES-STM-2025-755417	SALES-QT-2025-c17685	\N	\N	2025-03-22 11:45:55.678901	Processed	157893.45	Direct
SALES-ORD-2025-b1447a	SALES-STM-2025-6b1653	SALES-QT-2025-bdf73c	\N	\N	2025-03-22 11:35:47.654321	Pending	324567.88	Direct
SALES-ORD-2025-a4ac3c	SALES-STM-2025-656095	SALES-QT-2025-bdf73c	\N	\N	2025-03-22 11:25:59.876543	Pending	308764.00	Direct
SALES-ORD-2025-a4359c	SALES-STM-2025-5e569c	SALES-QT-2025-95ce9c	\N	\N	2025-03-21 20:05:45.01596	Pending	244608.00	Direct
SALES-ORD-2025-9b8c27	SALES-STM-2025-3acfef	SALES-QT-2025-81ca39	\N	\N	2025-03-21 20:05:16.729245	Pending	333180.56	Scheduled
SALES-ORD-2025-52e0c9	SALES-STM-2025-f6b7d0	SALES-QT-2025-6e0ca3	\N	\N	2025-03-22 11:05:34.789012	Pending	267890.00	Scheduled
SALES-ORD-2025-4118c6	SALES-STM-2025-35c700	SALES-QT-2025-67ceb9	\N	\N	2025-03-22 11:00:12.123456	Pending	150000.00	Direct
SALES-ORD-2025-4109ce	SALES-STM-2025-29deb9	SALES-QT-2025-63b7fd	\N	\N	2025-03-22 11:30:33.123456	Processed	215432.99	Scheduled
SALES-ORD-2025-2bacb2	SALES-STM-2025-29deb9	SALES-QT-2025-47f791	\N	\N	2025-03-22 11:40:11.56789	Pending	875690.40	Scheduled
SALES-ORD-2025-1fe99b	SALES-STM-2025-29deb9	SALES-QT-2025-454ae0	\N	\N	2025-03-21 20:07:26.988051	Processed	404832.65	Direct
SALES-ORD-2025-104654	SALES-STM-2025-16fb8a	SALES-QT-2025-439eea	\N	\N	2025-03-21 20:04:45.987747	Pending	290688.65	Direct
SALES-ORD-2025-096d13	SALES-STM-2025-16fb8a	SALES-QT-2025-374ab7	\N	\N	2025-03-21 20:02:12.32394	Pending	77984.53	Direct
SALES-ORD-2025-062e11	SALES-STM-2025-600a2f	SALES-QT-2025-12b112	\N	\N	2025-03-21 20:06:56.285375	Pending	234913.76	Direct
SALES-ORD-2025-524028	SALES-STM-2025-6b3b58	SALES-QT-2025-5e2bf2	\N	\N	2025-03-24 04:50:36.216	Pending	23309.69	Direct
SALES-ORD-2025-9137d5	SALES-STM-2025-29deb9	\N	\N	DIS-GI-2025-e521b4	2025-03-21 20:03:37.472554	Delivered	437073.00	Scheduled
SALES-ORD-2025-0479e3	SALES-STM-2025-c86ce6	SALES-QT-2025-0815c0	\N	DIS-GI-2025-3336f2	2025-03-21 20:06:19.062515	Delivered	12265.34	Direct
SALES-ORD-2025-6a18e4	SALES-STM-2025-600a2f	\N	\N	\N	2025-03-27 14:39:02.717057	Pending	1234.00	Direct
SALES-ORD-2025-8fef5b	SALES-STM-2025-656095	\N	\N	\N	2025-03-27 14:45:19.76953	Pending	1234.00	Direct
\.


--
-- Data for Name: payments; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.payments (payment_id, order_id, payment_method, payment_status, payment_date) FROM stdin;
SALES-PAY-2025-96bfdd	\N	Credit Card	Completed	2025-03-23 10:19:43.981764
SALES-PAY-2025-602824	\N	Bank Transfer	Pending	2025-03-23 10:19:43.981764
SALES-PAY-2025-7797f2	\N	Cash	Completed	2025-03-23 10:19:43.981764
SALES-PAY-2025-bd2afd	\N	Credit Card	Failed	2025-03-23 10:19:43.981764
SALES-PAY-2025-4e0f99	\N	Bank Transfer	Completed	2025-03-23 10:19:43.981764
SALES-PAY-2025-611d1a	\N	Credit Card	Completed	2025-03-23 10:19:43.981764
SALES-PAY-2025-48202e	\N	Bank Transfer	Failed	2025-03-23 10:19:43.981764
SALES-PAY-2025-9c2acc	\N	Cash	Completed	2025-03-23 10:19:43.981764
SALES-PAY-2025-7f5a87	\N	Credit Card	Pending	2025-03-23 10:19:43.981764
SALES-PAY-2025-b2772d	\N	Credit Card	Completed	2025-03-23 10:19:43.981764
SALES-PAY-2025-87d7f9	\N	Bank Transfer	Pending	2025-03-23 10:19:43.981764
SALES-PAY-2025-4a4d97	\N	Cash	Completed	2025-03-23 10:19:43.981764
SALES-PAY-2025-87a09b	\N	Credit Card	Failed	2025-03-23 10:19:43.981764
SALES-PAY-2025-30f806	\N	Bank Transfer	Completed	2025-03-23 10:19:43.981764
SALES-PAY-2025-c84436	\N	Cash	Pending	2025-03-23 10:19:43.981764
SALES-PAY-2025-c69308	\N	Credit Card	Completed	2025-03-23 10:19:43.981764
SALES-PAY-2025-0c1315	\N	Bank Transfer	Failed	2025-03-23 10:19:43.981764
SALES-PAY-2025-48646d	\N	Credit Card	Pending	2025-03-23 10:19:43.981764
SALES-PAY-2025-e66e21	SALES-ORD-2025-524028	Cash	Completed	2025-03-23 10:19:43
SALES-PAY-2025-28dfd5	SALES-ORD-2025-9137d5	Cash	Completed	2025-03-23 10:19:43
\.


--
-- Data for Name: product_pricing; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.product_pricing (product_id, admin_product_id, markup_percentage, selling_price, demand_level) FROM stdin;
SALE-PRDP-2025-bfb5fa	ADMIN-PROD-2025-2e0ab6	20.00	57271.97	Low
SALE-PRDP-2025-45c02a	ADMIN-PROD-2025-5598cf	20.00	13141.44	Low
SALE-PRDP-2025-7a327f	ADMIN-PROD-2025-8698b7	20.00	1337599.20	Low
SALE-PRDP-2025-2a82d7	ADMIN-PROD-2025-941c5b	20.00	262080.00	Low
SALE-PRDP-2025-1ec726	ADMIN-PROD-2025-a17047	20.00	299707.20	Low
SALE-PRDP-2025-89ec27	ADMIN-PROD-2025-c5c83a	20.00	162319.25	Low
SALE-PRDP-2025-6fe5f0	ADMIN-PROD-2025-115147	20.00	154440.00	Low
SALE-PRDP-2025-0f1402	ADMIN-PROD-2025-83adb5	20.00	154440.00	Low
SALE-PRDP-2025-1a422a	ADMIN-PROD-2025-a68481	20.00	311452.13	Low
SALE-PRDP-2025-8e1b37	ADMIN-PROD-2025-b022f3	20.00	262407.60	Low
SALE-PRDP-2025-db9e92	ADMIN-PROD-2025-6db12d	20.00	4745.52	Low
SALE-PRDP-2025-46417c	ADMIN-PROD-2025-5833b2	20.00	4745.52	Low
SALE-PRDP-2025-819caf	ADMIN-PROD-2025-0e6337	20.00	4745.52	Low
SALE-PRDP-2025-59b95d	ADMIN-PROD-2025-158fce	20.00	4745.52	Low
SALE-PRDP-2025-aec8fa	ADMIN-PROD-2025-88a5b3	20.00	4745.52	Low
SALE-PRDP-2025-26befc	ADMIN-PROD-2025-9e365c	20.00	4745.52	Low
SALE-PRDP-2025-7c17f9	ADMIN-PROD-2025-290b77	20.00	7291.44	Low
SALE-PRDP-2025-d76b82	ADMIN-PROD-2025-467bbd	20.00	12907.44	Low
SALE-PRDP-2025-bf5b61	ADMIN-PROD-2025-561cd9	20.00	4680.00	Low
SALE-PRDP-2025-f3fa93	ADMIN-PROD-2025-93544e	20.00	2948.40	Low
SALE-PRDP-2025-c20d8e	ADMIN-PROD-2025-f2a2ec	20.00	38525.76	Low
SALE-PRDP-2025-13eab3	ADMIN-PROD-2025-d25da2	20.00	39948.48	Low
SALE-PRDP-2025-ccafb1	ADMIN-PROD-2025-086546	20.00	39948.48	Low
SALE-PRDP-2025-127cfd	ADMIN-PROD-2025-d973c5	20.00	39948.48	Low
SALE-PRDP-2025-8b545a	ADMIN-PROD-2025-d1edf6	20.00	1001.52	Low
SALE-PRDP-2025-d7eab9	ADMIN-PROD-2025-66eb2d	20.00	1001.52	Low
SALE-PRDP-2025-8ddd8d	ADMIN-PROD-2025-91b19e	20.00	936.00	Low
SALE-PRDP-2025-b9761b	ADMIN-PROD-2025-f3d852	20.00	2246.40	Low
SALE-PRDP-2025-65e2ff	ADMIN-PROD-2025-64c17b	20.00	2246.40	Low
SALE-PRDP-2025-406a76	ADMIN-PROD-2025-b39c24	20.00	6739.20	Low
SALE-PRDP-2025-baeb03	ADMIN-PROD-2025-4c8e03	20.00	57271.97	Low
SALE-PRDP-2025-63355c	ADMIN-PROD-2025-c54996	20.00	13141.44	Low
SALE-PRDP-2025-0ab154	ADMIN-PROD-2025-cb9367	20.00	262080.00	Low
SALE-PRDP-2025-89f790	ADMIN-PROD-2025-546582	20.00	299707.20	Low
SALE-PRDP-2025-37e809	ADMIN-PROD-2025-c44825	20.00	162319.25	Low
SALE-PRDP-2025-149c04	ADMIN-PROD-2025-6d2f1c	20.00	311452.13	Low
SALE-PRDP-2025-36585d	ADMIN-PROD-2025-744457	20.00	262407.60	Low
SALE-PRDP-2025-78b55a	ADMIN-PROD-2025-ef5c11	20.00	4745.52	Low
SALE-PRDP-2025-611967	ADMIN-PROD-2025-65010f	20.00	4745.52	Low
SALE-PRDP-2025-bb55f0	ADMIN-PROD-2025-f4dfb1	20.00	4745.52	Low
SALE-PRDP-2025-ec0a59	ADMIN-PROD-2025-99a57e	20.00	4745.52	Low
SALE-PRDP-2025-b486a0	ADMIN-PROD-2025-4d4b5e	20.00	4745.52	Low
SALE-PRDP-2025-ed3f48	ADMIN-PROD-2025-1c041d	20.00	4745.52	Low
SALE-PRDP-2025-ae0514	ADMIN-PROD-2025-2db293	20.00	7291.44	Low
SALE-PRDP-2025-76dfd3	ADMIN-PROD-2025-e52b86	20.00	12907.44	Low
SALE-PRDP-2025-236775	ADMIN-PROD-2025-51838d	20.00	4680.00	Low
SALE-PRDP-2025-14754a	ADMIN-PROD-2025-f25387	20.00	2948.40	Low
SALE-PRDP-2025-3fcd51	ADMIN-PROD-2025-c7328b	20.00	38525.76	Low
SALE-PRDP-2025-e4faa0	ADMIN-PROD-2025-f71dbd	20.00	39948.48	Low
SALE-PRDP-2025-894764	ADMIN-PROD-2025-7c7fca	20.00	39948.48	Low
SALE-PRDP-2025-4f3ac7	ADMIN-PROD-2025-895493	20.00	39948.48	Low
SALE-PRDP-2025-867f82	ADMIN-PROD-2025-aa61c5	20.00	1001.52	Low
SALE-PRDP-2025-d1c392	ADMIN-PROD-2025-2a83ff	20.00	1001.52	Low
SALE-PRDP-2025-35dc0a	ADMIN-PROD-2025-736c7e	20.00	936.00	Low
SALE-PRDP-2025-608f93	ADMIN-PROD-2025-3b3229	20.00	2246.40	Low
SALE-PRDP-2025-0edc6e	ADMIN-PROD-2025-c3b87b	20.00	2246.40	Low
SALE-PRDP-2025-deb4b7	ADMIN-PROD-2025-09e33a	20.00	6739.20	Low
\.


--
-- Data for Name: quotation; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.quotation (quotation_id, statement_id, agreement_id, date_issued, status) FROM stdin;
SALES-QT-2025-e3b105	SALES-STM-2025-f4b14f	\N	2025-03-22 10:00:12.123456	Pending
SALES-QT-2025-e28d7b	SALES-STM-2025-b90b4b	\N	2025-03-21 19:54:59.786193	Pending
SALES-QT-2025-e10427	SALES-STM-2025-948f52	\N	2025-03-22 10:35:47.654321	Pending
SALES-QT-2025-ce21a5	SALES-STM-2025-91058d	\N	2025-03-21 19:55:22.12001	Pending
SALES-QT-2025-cb1443	SALES-STM-2025-755417	\N	2025-03-21 19:55:29.491708	Pending
SALES-QT-2025-c17685	SALES-STM-2025-6b1653	\N	2025-03-21 19:55:06.977934	Pending
SALES-QT-2025-bdf73c	SALES-STM-2025-656095	\N	2025-03-22 10:45:55.678901	Pending
SALES-QT-2025-95ce9c	SALES-STM-2025-5e569c	\N	2025-03-22 10:10:56.345678	Pending
SALES-QT-2025-81ca39	SALES-STM-2025-3acfef	\N	2025-03-21 19:55:14.223794	Pending
SALES-QT-2025-6e0ca3	SALES-STM-2025-f6b7d0	\N	2025-03-21 19:55:48.106718	Pending
SALES-QT-2025-67ceb9	SALES-STM-2025-35c700	\N	2025-03-22 10:15:21.987654	Pending
SALES-QT-2025-63b7fd	SALES-STM-2025-29deb9	\N	2025-03-22 10:40:11.56789	Pending
SALES-QT-2025-47f791	SALES-STM-2025-16fb8a	\N	2025-03-21 19:55:55.959812	Pending
SALES-QT-2025-454ae0	SALES-STM-2025-2cc7f2	\N	2025-03-21 19:56:02.079125	Pending
SALES-QT-2025-439eea	SALES-STM-2025-21f5af	\N	2025-03-21 19:55:41.775823	Pending
SALES-QT-2025-374ab7	SALES-STM-2025-2879fa	\N	2025-03-22 10:20:44.234567	Pending
SALES-QT-2025-319285	SALES-STM-2025-2f3fae	\N	2025-03-22 10:30:33.123456	Pending
SALES-QT-2025-2735c1	SALES-STM-2025-251924	\N	2025-03-21 19:54:49.552681	Pending
SALES-QT-2025-12b112	SALES-STM-2025-600a2f	\N	2025-03-22 10:05:34.789012	Pending
SALES-QT-2025-0815c0	SALES-STM-2025-c86ce6	\N	2025-03-22 10:25:59.876543	Pending
SALES-QT-2025-93d3b0	SALES-STM-2025-a29318	\N	2025-03-23 11:18:29.014773	Pending
SALES-QT-2025-7a4c6a	SALES-STM-2025-d8e83d	\N	2025-03-23 13:06:02.340593	Pending
SALES-QT-2025-302ad2	SALES-STM-2025-bad08f	\N	2025-03-23 13:06:55.214745	Pending
SALES-QT-2025-61de7b	SALES-STM-2025-aab12b	\N	2025-03-23 13:08:50.684133	Pending
SALES-QT-2025-a7ef01	SALES-STM-2025-3656cd	\N	2025-03-23 07:01:39.878	Pending
SALES-QT-2025-10bea2	SALES-STM-2025-2d9ae3	\N	2025-03-23 07:15:36.507	Pending
SALES-QT-2025-97809e	SALES-STM-2025-ce174e	\N	2025-03-23 08:56:32.075	Pending
SALES-QT-2025-4c0c34	SALES-STM-2025-a862da	\N	2025-03-23 12:04:43.504	Pending
SALES-QT-2025-5e2bf2	SALES-STM-2025-45b669	\N	2025-03-23 13:10:28.804	Pending
SALES-QT-2025-9cba29	SALES-STM-2025-6b3ff1	\N	2025-03-24 06:58:41.324	Pending
SALES-QT-2025-56dfc5	SALES-STM-2025-d2fe42	\N	2025-03-24 07:00:10.377	Pending
SALES-QT-2025-19918e	SALES-STM-2025-0a7cb9	\N	2025-03-24 07:04:02.402	Pending
SALES-QT-2025-829c6d	SALES-STM-2025-2079b3	\N	2025-03-28 01:35:19.077	Pending
\.


--
-- Data for Name: receipt; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.receipt (receipt_id, shipping_id, customer_id, payments_id, policy_id, date_signed, signed_docu, created_at) FROM stdin;
SALES-REC-2025-a90ea4	\N	\N	\N	\N	2025-03-18	receipt_1.pdf	2025-03-23 10:19:43.982827
SALES-REC-2025-e61102	\N	\N	\N	\N	2025-03-19	receipt_2.pdf	2025-03-23 10:19:43.982827
SALES-REC-2025-18eb55	\N	\N	\N	\N	2025-03-20	receipt_3.pdf	2025-03-23 10:19:43.982827
SALES-REC-2025-452592	\N	\N	\N	\N	2025-03-21	receipt_4.pdf	2025-03-23 10:19:43.982827
SALES-REC-2025-995ef8	\N	\N	\N	\N	2025-03-22	receipt_5.pdf	2025-03-23 10:19:43.982827
SALES-REC-2025-ea85d8	\N	\N	\N	\N	2025-03-23	receipt_6.pdf	2025-03-23 10:19:43.982827
SALES-REC-2025-de5cf7	\N	\N	\N	\N	2025-03-24	receipt_7.pdf	2025-03-23 10:19:43.982827
SALES-REC-2025-9bcbca	\N	\N	\N	\N	2025-03-25	receipt_8.pdf	2025-03-23 10:19:43.982827
SALES-REC-2025-e44a58	\N	\N	\N	\N	2025-03-26	receipt_9.pdf	2025-03-23 10:19:43.982827
SALES-REC-2025-e4eeba	\N	\N	\N	\N	2025-03-27	receipt_10.pdf	2025-03-23 10:19:43.982827
SALES-REC-2025-7e75c0	\N	\N	\N	\N	2025-03-28	receipt_11.pdf	2025-03-23 10:19:43.982827
SALES-REC-2025-b43694	\N	\N	\N	\N	2025-03-29	receipt_12.pdf	2025-03-23 10:19:43.982827
SALES-REC-2025-e99a38	\N	\N	\N	\N	2025-03-30	receipt_13.pdf	2025-03-23 10:19:43.982827
SALES-REC-2025-82c750	\N	\N	\N	\N	2025-03-31	receipt_14.pdf	2025-03-23 10:19:43.982827
SALES-REC-2025-016e19	\N	\N	\N	\N	2025-04-01	receipt_15.pdf	2025-03-23 10:19:43.982827
SALES-REC-2025-6e18c9	\N	\N	\N	\N	2025-04-02	receipt_16.pdf	2025-03-23 10:19:43.982827
SALES-REC-2025-1a5517	\N	\N	\N	\N	2025-04-03	receipt_17.pdf	2025-03-23 10:19:43.982827
SALES-REC-2025-b779b6	\N	\N	\N	\N	2025-04-04	receipt_18.pdf	2025-03-23 10:19:43.982827
SALES-REC-2025-4f5b6d	\N	\N	\N	\N	2025-04-05	receipt_19.pdf	2025-03-23 10:19:43.982827
SALES-REC-2025-ce40e6	\N	\N	\N	\N	2025-04-06	receipt_20.pdf	2025-03-23 10:19:43.982827
\.


--
-- Data for Name: renewal_warranty; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.renewal_warranty (renewal_id, order_id, customer_id, product_id, payments_id, service_request_id, original_warranty_start, original_warranty_end, renewal_warranty_start, renewal_warranty_end, renewal_status, created_at, updated_at, renewal_fee) FROM stdin;
SALES-RENEW-2025-c9e48c	\N	\N	\N	\N	\N	2023-04-01	2024-04-01	2024-04-02	2025-04-01	Approved	2025-03-23 10:19:43.9945	2025-03-23 10:19:43.9945	5000.00
SALES-RENEW-2025-ba4c35	\N	\N	\N	\N	\N	2023-06-01	2024-06-01	2024-06-02	2025-06-01	Pending	2025-03-23 10:19:43.9945	2025-03-23 10:19:43.9945	3000.00
SALES-RENEW-2025-2fc9a8	\N	\N	\N	\N	\N	2023-07-15	2024-07-15	2024-07-16	2025-07-15	Rejected	2025-03-23 10:19:43.9945	2025-03-23 10:19:43.9945	2000.00
SALES-RENEW-2025-df1fc1	\N	\N	\N	\N	\N	2022-08-01	2023-08-01	2023-08-02	2024-08-01	Approved	2025-03-23 10:19:43.9945	2025-03-23 10:19:43.9945	7000.00
SALES-RENEW-2025-ca493a	\N	\N	\N	\N	\N	2023-05-01	2024-05-01	2024-05-02	2025-05-01	Pending	2025-03-23 10:19:43.9945	2025-03-23 10:19:43.9945	4000.00
SALES-RENEW-2025-330c29	\N	\N	\N	\N	\N	2023-09-10	2024-09-10	2024-09-11	2025-09-10	Approved	2025-03-23 10:19:43.9945	2025-03-23 10:19:43.9945	1500.00
SALES-RENEW-2025-84c872	\N	\N	\N	\N	\N	2023-10-20	2024-10-20	2024-10-21	2025-10-20	Rejected	2025-03-23 10:19:43.9945	2025-03-23 10:19:43.9945	2500.00
SALES-RENEW-2025-3265e5	\N	\N	\N	\N	\N	2023-11-05	2024-11-05	2024-11-06	2025-11-05	Approved	2025-03-23 10:19:43.9945	2025-03-23 10:19:43.9945	6000.00
SALES-RENEW-2025-f8cc21	\N	\N	\N	\N	\N	2023-12-01	2024-12-01	2024-12-02	2025-12-01	Pending	2025-03-23 10:19:43.9945	2025-03-23 10:19:43.9945	5000.00
SALES-RENEW-2025-eacfd5	\N	\N	\N	\N	\N	2023-03-15	2024-03-15	2024-03-16	2025-03-15	Approved	2025-03-23 10:19:43.9945	2025-03-23 10:19:43.9945	3500.00
SALES-RENEW-2025-b48144	\N	\N	\N	\N	\N	2023-05-01	2024-05-01	2024-05-02	2025-05-01	Approved	2025-03-23 10:19:43.9945	2025-03-23 10:19:43.9945	5500.00
SALES-RENEW-2025-5d2b1f	\N	\N	\N	\N	\N	2023-07-01	2024-07-01	2024-07-02	2025-07-01	Pending	2025-03-23 10:19:43.9945	2025-03-23 10:19:43.9945	3200.00
SALES-RENEW-2025-d992a4	\N	\N	\N	\N	\N	2023-08-15	2024-08-15	2024-08-16	2025-08-15	Rejected	2025-03-23 10:19:43.9945	2025-03-23 10:19:43.9945	2200.00
SALES-RENEW-2025-bca972	\N	\N	\N	\N	\N	2022-09-01	2023-09-01	2023-09-02	2024-09-01	Approved	2025-03-23 10:19:43.9945	2025-03-23 10:19:43.9945	7500.00
SALES-RENEW-2025-428c15	\N	\N	\N	\N	\N	2023-06-01	2024-06-01	2024-06-02	2025-06-01	Pending	2025-03-23 10:19:43.9945	2025-03-23 10:19:43.9945	4200.00
SALES-RENEW-2025-fe7a01	\N	\N	\N	\N	\N	2023-10-10	2024-10-10	2024-10-11	2025-10-10	Approved	2025-03-23 10:19:43.9945	2025-03-23 10:19:43.9945	1600.00
SALES-RENEW-2025-5e5625	\N	\N	\N	\N	\N	2023-11-20	2024-11-20	2024-11-21	2025-11-20	Rejected	2025-03-23 10:19:43.9945	2025-03-23 10:19:43.9945	2600.00
SALES-RENEW-2025-b76217	\N	\N	\N	\N	\N	2023-12-05	2024-12-05	2024-12-06	2025-12-05	Approved	2025-03-23 10:19:43.9945	2025-03-23 10:19:43.9945	6200.00
SALES-RENEW-2025-1796b1	\N	\N	\N	\N	\N	2024-01-01	2025-01-01	2025-01-02	2026-01-01	Pending	2025-03-23 10:19:43.9945	2025-03-23 10:19:43.9945	5100.00
SALES-RENEW-2025-13bd03	\N	\N	\N	\N	\N	2023-04-15	2024-04-15	2024-04-16	2025-04-15	Approved	2025-03-23 10:19:43.9945	2025-03-23 10:19:43.9945	3600.00
\.


--
-- Data for Name: return; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.return (return_id, statement_id, shipping_id, return_date, status, remarks) FROM stdin;
\.


--
-- Data for Name: sales_costing; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.sales_costing (sales_costing_id, non_project_costing_id, project_resources_id, created_at, updated_at) FROM stdin;
SALES-SC-2025-879eae	\N	\N	2025-03-23 10:19:43.974208	2025-03-23 10:19:43.974208
SALES-SC-2025-b950f5	\N	\N	2025-03-23 10:19:43.974208	2025-03-23 10:19:43.974208
SALES-SC-2025-16ef3f	\N	\N	2025-03-23 10:19:43.974208	2025-03-23 10:19:43.974208
SALES-SC-2025-884d41	\N	\N	2025-03-23 10:19:43.974208	2025-03-23 10:19:43.974208
SALES-SC-2025-ef8bfa	\N	\N	2025-03-23 10:19:43.974208	2025-03-23 10:19:43.974208
SALES-SC-2025-d080af	\N	\N	2025-03-23 10:19:43.974208	2025-03-23 10:19:43.974208
SALES-SC-2025-6d9e11	\N	\N	2025-03-23 10:19:43.974208	2025-03-23 10:19:43.974208
SALES-SC-2025-1f8718	\N	\N	2025-03-23 10:19:43.974208	2025-03-23 10:19:43.974208
SALES-SC-2025-ba258b	\N	\N	2025-03-23 10:19:43.974208	2025-03-23 10:19:43.974208
SALES-SC-2025-b5f937	\N	\N	2025-03-23 10:19:43.974208	2025-03-23 10:19:43.974208
SALES-SC-2025-30765d	\N	\N	2025-03-23 10:19:43.974208	2025-03-23 10:19:43.974208
SALES-SC-2025-c6826a	\N	\N	2025-03-23 10:19:43.974208	2025-03-23 10:19:43.974208
SALES-SC-2025-bff9d4	\N	\N	2025-03-23 10:19:43.974208	2025-03-23 10:19:43.974208
SALES-SC-2025-d2f25d	\N	\N	2025-03-23 10:19:43.974208	2025-03-23 10:19:43.974208
SALES-SC-2025-bb0b9c	\N	\N	2025-03-23 10:19:43.974208	2025-03-23 10:19:43.974208
SALES-SC-2025-0d2ce0	\N	\N	2025-03-23 10:19:43.974208	2025-03-23 10:19:43.974208
SALES-SC-2025-40f406	\N	\N	2025-03-23 10:19:43.974208	2025-03-23 10:19:43.974208
SALES-SC-2025-e9bdaf	\N	\N	2025-03-23 10:19:43.974208	2025-03-23 10:19:43.974208
SALES-SC-2025-9380b4	\N	\N	2025-03-23 10:19:43.974208	2025-03-23 10:19:43.974208
SALES-SC-2025-fa67ca	\N	\N	2025-03-23 10:19:43.974208	2025-03-23 10:19:43.974208
\.


--
-- Data for Name: sales_invoices; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.sales_invoices (invoice_id, order_id, invoice_date, total_amount, invoice_status, payment_status, due_date) FROM stdin;
SALES-INV-2025-f79370	SALES-ORD-2025-e16c9e	2025-03-23 10:19:43	750.00	Pending	Pending	2025-04-05
SALES-INV-2025-f2bf0c	SALES-ORD-2025-db9aae	2025-03-23 10:19:43	2750.00	Overdue	Failed	2025-03-12
SALES-INV-2025-f2116f	SALES-ORD-2025-d91eeb	2025-03-23 10:19:43	1200.00	Paid	Completed	2025-03-18
SALES-INV-2025-e8b3f2	SALES-ORD-2025-be90ee	2025-03-23 10:19:43	2500.00	Overdue	Pending	2025-03-10
SALES-INV-2025-e37fbb	SALES-ORD-2025-b59c3e	2025-03-23 10:19:43	3000.00	Overdue	Pending	2025-03-15
SALES-INV-2025-e10c51	SALES-ORD-2025-b4a34b	2025-03-23 10:19:43	500.00	Pending	Pending	2025-04-01
SALES-INV-2025-bba042	SALES-ORD-2025-b1447a	2025-03-23 10:19:43	3200.00	Paid	Completed	2025-03-25
SALES-INV-2025-b2442e	SALES-ORD-2025-a4ac3c	2025-03-23 10:19:43	8000.00	Overdue	Pending	2025-03-15
SALES-INV-2025-a444d2	SALES-ORD-2025-a4359c	2025-03-23 10:19:43	9000.00	Pending	Pending	2025-04-10
SALES-INV-2025-93089c	SALES-ORD-2025-a4359c	2025-03-23 10:19:43	5000.00	Paid	Completed	2025-03-20
SALES-INV-2025-89a7db	SALES-ORD-2025-9b8c27	2025-03-23 10:19:43	4000.00	Pending	Pending	2025-04-10
SALES-INV-2025-6dafee	SALES-ORD-2025-52e0c9	2025-03-23 10:19:43	3200.00	Paid	Completed	2025-03-22
SALES-INV-2025-50b82f	SALES-ORD-2025-4118c6	2025-03-23 10:19:43	600.00	Paid	Completed	2025-03-18
SALES-INV-2025-4d9b44	SALES-ORD-2025-4109ce	2025-03-23 10:19:43	1800.00	Paid	Completed	2025-03-25
SALES-INV-2025-332d0b	SALES-ORD-2025-2bacb2	2025-03-23 10:19:43	1200.00	Paid	Completed	2025-03-20
SALES-INV-2025-2e3617	SALES-ORD-2025-1fe99b	2025-03-23 10:19:43	7000.00	Overdue	Failed	2025-03-10
SALES-INV-2025-17475a	SALES-ORD-2025-104654	2025-03-23 10:19:43	4500.00	Overdue	Pending	2025-03-12
SALES-INV-2025-1377a6	SALES-ORD-2025-096d13	2025-03-23 10:19:43	950.00	Paid	Completed	2025-03-22
SALES-INV-2025-13772d	SALES-ORD-2025-062e11	2025-03-23 10:19:43	1500.00	Pending	Pending	2025-04-05
SALES-INV-2025-00a822	SALES-ORD-2025-0479e3	2025-03-23 10:19:43	2000.00	Pending	Pending	2025-04-01
SALES-INV-2025-13e7ae	SALES-ORD-2025-524028	2025-03-27 13:07:27.387288	23309.69	Paid	Completed	2025-03-27
SALES-INV-2025-f00bac	SALES-ORD-2025-9137d5	2025-03-27 13:10:57.48331	437073.00	Paid	Completed	2025-03-27
\.


--
-- Data for Name: shipping_details; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.shipping_details (shipping_id, order_id, operational_cost_id, shipment_id, shipping_method, tracking_num, shipping_date, estimated_delivery, delivery_status, statement_id, delivery_date) FROM stdin;
SALES-SHIP-2025-e41c25	SALES-ORD-2025-e16c9e	DIS-OS-2025-b9e770	DIS-BR-2025-d58aef	Express	TRK1002	2025-03-23 10:19:43	2025-03-22 15:00:00	Shipped	\N	\N
SALES-SHIP-2025-db3852	SALES-ORD-2025-db9aae	DIS-OS-2025-ad056e	DIS-BR-2025-5f961a	Same-Day	TRK1014	2025-03-23 10:19:43	2025-04-10 12:00:00	Delivered	\N	\N
SALES-SHIP-2025-d22837	SALES-ORD-2025-d91eeb	DIS-OS-2025-bc9bc8	DIS-BR-2025-76a49e	Standard	TRK1007	2025-03-23 10:19:43	2025-04-02 11:00:00	Pending	\N	\N
SALES-SHIP-2025-c7d03b	SALES-ORD-2025-be90ee	DIS-OS-2025-e62f32	DIS-BR-2025-e763b9	Same-Day	TRK1010	2025-03-23 10:19:43	2025-03-24 13:00:00	Shipped	\N	\N
SALES-SHIP-2025-9f6c43	SALES-ORD-2025-b59c3e	DIS-OS-2025-73833a	DIS-BR-2025-1f8c0a	Same-Day	TRK1020	2025-03-23 10:19:43	2025-04-16 13:00:00	Shipped	\N	\N
SALES-SHIP-2025-9be599	SALES-ORD-2025-b4a34b	DIS-OS-2025-fe1959	DIS-BR-2025-ec42c0	Standard	TRK1017	2025-03-23 10:19:43	2025-04-13 11:00:00	Pending	\N	\N
SALES-SHIP-2025-8e202c	SALES-ORD-2025-b1447a	DIS-OS-2025-b9e770	DIS-BR-2025-5f961a	Local	TRK1006	2025-03-23 10:19:43	2025-03-25 14:00:00	Shipped	\N	\N
SALES-SHIP-2025-8d6b73	SALES-ORD-2025-a4ac3c	DIS-OS-2025-b9e770	DIS-BR-2025-d58aef	Overnight	TRK1013	2025-03-23 10:19:43	2025-04-09 08:00:00	Delivered	\N	\N
SALES-SHIP-2025-861e56	SALES-ORD-2025-a4359c	DIS-OS-2025-ad056e	DIS-BR-2025-1f8c0a	Overnight	TRK1019	2025-03-23 10:19:43	2025-04-15 09:00:00	Pending	\N	\N
SALES-SHIP-2025-857565	SALES-ORD-2025-9b8c27	DIS-OS-2025-8abb21	DIS-BR-2025-5f961a	International	TRK1015	2025-03-23 10:19:43	2025-04-11 18:00:00	Pending	\N	\N
SALES-SHIP-2025-7e8842	SALES-ORD-2025-52e0c9	DIS-OS-2025-ad056e	DIS-BR-2025-e763b9	Same-Day	TRK1004	2025-03-23 10:19:43	2025-03-19 12:00:00	Delivered	\N	\N
SALES-SHIP-2025-76d661	SALES-ORD-2025-4118c6	DIS-OS-2025-adb677	DIS-BR-2025-54f43c	Overnight	TRK1009	2025-03-23 10:19:43	2025-03-23 09:00:00	Pending	\N	\N
SALES-SHIP-2025-55e8ed	SALES-ORD-2025-4109ce	DIS-OS-2025-da533d	DIS-BR-2025-ec42c0	Express	TRK1008	2025-03-23 10:19:43	2025-03-21 17:00:00	Delivered	\N	\N
SALES-SHIP-2025-4ce37b	SALES-ORD-2025-2bacb2	DIS-OS-2025-73833a	DIS-BR-2025-e779ad	International	TRK1005	2025-03-23 10:19:43	2025-04-10 18:00:00	Pending	\N	\N
SALES-SHIP-2025-47b86b	SALES-ORD-2025-1fe99b	DIS-OS-2025-8abb21	DIS-BR-2025-1f8c0a	Express	TRK1012	2025-03-23 10:19:43	2025-04-08 15:00:00	Shipped	\N	\N
SALES-SHIP-2025-3ccc7b	SALES-ORD-2025-104654	DIS-OS-2025-e62f32	DIS-BR-2025-ec42c0	Express	TRK1018	2025-03-23 10:19:43	2025-04-14 17:00:00	Delivered	\N	\N
SALES-SHIP-2025-354b3d	SALES-ORD-2025-096d13	DIS-OS-2025-bc9bc8	DIS-BR-2025-1f8c0a	Overnight	TRK1003	2025-03-23 10:19:43	2025-03-20 08:00:00	Delivered	\N	\N
SALES-SHIP-2025-2df594	SALES-ORD-2025-096d13	DIS-OS-2025-73833a	DIS-BR-2025-1f8c0a	Standard	TRK1011	2025-03-23 10:19:43	2025-04-07 10:00:00	Pending	\N	\N
SALES-SHIP-2025-29899d	SALES-ORD-2025-062e11	DIS-OS-2025-e62f32	DIS-BR-2025-76a49e	Local	TRK1016	2025-03-23 10:19:43	2025-04-12 14:00:00	Shipped	\N	\N
SALES-SHIP-2025-14a85b	SALES-ORD-2025-0479e3	DIS-OS-2025-bc9bc8	DIS-BR-2025-1f8c0a	Standard	TRK1001	2025-03-23 10:19:43	2025-04-01 10:00:00	Delivered	\N	\N
\.


--
-- Data for Name: statement; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.statement (statement_id, customer_id, salesrep_id, total_amount, discount, type, total_tax) FROM stdin;
SALES-STM-2025-5e569c	SALES-CUST-2025-614801	HR-EMP-2025-f0cffe	565603.66	15000.00	Non-Project-Based	57099
SALES-STM-2025-35c700	SALES-CUST-2025-2597c0	HR-EMP-2025-9e7313	13460.46	0.00	Non-Project-Based	1314
SALES-STM-2025-2879fa	SALES-CUST-2025-b1576f	HR-EMP-2025-f0cffe	256548.00	10000.00	Non-Project-Based	26208
SALES-STM-2025-c86ce6	SALES-CUST-2025-6a3167	HR-EMP-2025-cb0e4c	383743.60	0.00	Non-Project-Based	37726
SALES-STM-2025-2f3fae	SALES-CUST-2025-a42491	HR-EMP-2025-f0cffe	109819.48	0.00	Non-Project-Based	10792
SALES-STM-2025-948f52	SALES-CUST-2025-941d72	HR-EMP-2025-b15e2f	26820.93	0.00	Non-Project-Based	2628
SALES-STM-2025-29deb9	SALES-CUST-2025-2ba07b	HR-EMP-2025-9e7313	0.00	0.00	Non-Project-Based	0
SALES-STM-2025-656095	SALES-CUST-2025-a42491	HR-EMP-2025-9e7313	165124.56	5000.00	Project-Based	16232
SALES-STM-2025-3656cd	SALES-CUST-2025-641c4a	HR-EMP-2025-b15e2f	124063.19	0.00	Non-Project-Based	12173
SALES-STM-2025-a29318	SALES-CUST-2025-6a3167	HR-EMP-2025-9e7313	9782.61	0.00	Non-Project-Based	943
SALES-STM-2025-d8e83d	SALES-CUST-2025-f7aa99	HR-EMP-2025-f0cffe	192419.90	5298.00	Non-Project-Based	19428
SALES-STM-2025-bad08f	SALES-CUST-2025-614801	HR-EMP-2025-f0cffe	192419.90	5298.00	Non-Project-Based	19428
SALES-STM-2025-aab12b	SALES-CUST-2025-cd1d37	HR-EMP-2025-f0cffe	273499.52	0.00	Non-Project-Based	26882
SALES-STM-2025-2d9ae3	SALES-CUST-2025-641c4a	HR-EMP-2025-9e7313	1051.60	0.00	Non-Project-Based	94
SALES-STM-2025-ce174e	SALES-CUST-2025-d105ee	HR-EMP-2025-f0cffe	1431779.48	0.00	Non-Project-Based	140801
SALES-STM-2025-a862da	SALES-CUST-2025-a6775c	HR-EMP-2025-f0cffe	379994.11	0.00	Non-Project-Based	37347
SALES-STM-2025-45b669	SALES-CUST-2025-3f84fe	HR-EMP-2025-b15e2f	23309.69	0.00	Non-Project-Based	2263
SALES-STM-2025-6b3b58	SALES-CUST-2025-3f84fe	HR-EMP-2025-b15e2f	23309.69	0.00	Non-Project-Based	2263
SALES-STM-2025-6b3ff1	SALES-CUST-2025-3197ba	HR-EMP-2025-9e7313	2398661.30	19999.00	Non-Project-Based	237842
SALES-STM-2025-d2fe42	SALES-CUST-2025-f7aa99	HR-EMP-2025-f0cffe	1359992.52	0.00	Non-Project-Based	133760
SALES-STM-2025-0a7cb9	SALES-CUST-2025-cbf858	HR-EMP-2025-b15e2f	25898.04	0.00	Non-Project-Based	2518
SALES-STM-2025-b90b4b	SALES-CUST-2025-cbf858	HR-EMP-2025-f0cffe	58326.50	0.00	Project-Based	5727
SALES-STM-2025-6b1653	SALES-CUST-2025-dbfe2c	HR-EMP-2025-b15e2f	157114.00	0.00	Non-Project-Based	15444
SALES-STM-2025-3acfef	SALES-CUST-2025-d105ee	HR-EMP-2025-b15e2f	316742.99	0.00	Non-Project-Based	31145
SALES-STM-2025-91058d	SALES-CUST-2025-3197ba	HR-EMP-2025-9e7313	266548.00	0.00	Non-Project-Based	26208
SALES-STM-2025-755417	SALES-CUST-2025-8cdccd	HR-EMP-2025-f0cffe	4384579.88	0.00	Non-Project-Based	431250
SALES-STM-2025-251924	SALES-CUST-2025-a6775c	HR-EMP-2025-f0cffe	164779.50	0.00	Non-Project-Based	17182
SALES-STM-2025-21f5af	SALES-CUST-2025-fbdaf0	HR-EMP-2025-b15e2f	316742.99	15000.00	Project-Based	31145
SALES-STM-2025-f6b7d0	SALES-CUST-2025-a6775c	HR-EMP-2025-f0cffe	704946.16	25000.00	Non-Project-Based	71788
SALES-STM-2025-16fb8a	SALES-CUST-2025-59eb62	HR-EMP-2025-b15e2f	0.00	0.00	Project-Based	0
SALES-STM-2025-2cc7f2	SALES-CUST-2025-fbdaf0	HR-EMP-2025-f0cffe	58326.50	0.00	Project-Based	5727
SALES-STM-2025-f4b14f	SALES-CUST-2025-a6775c	HR-EMP-2025-b15e2f	117100.00	5000.00	Project-Based	12000
SALES-STM-2025-600a2f	SALES-CUST-2025-a6775c	HR-EMP-2025-f0cffe	26820.93	0.00	Non-Project-Based	2628
SALES-STM-2025-2079b3	SALES-CUST-2025-f7aa99	HR-EMP-2025-cb0e4c	157114.00	0.00	Non-Project-Based	15444
\.


--
-- Data for Name: statement_item; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.statement_item (statement_item_id, statement_id, sales_costing_id, product_id, item_md_id, quantity, unit_price, total_price, discount, tax_amount, return_reason, return_action) FROM stdin;
SALES-STI-2025-fc3bec	SALES-STM-2025-251924	\N	ADMIN-PROD-2025-2e0ab6	\N	3	47726.64	150361.51	10000.00	17182	\N	\N
SALES-STI-2025-fbdf4d	SALES-STM-2025-600a2f	\N	ADMIN-PROD-2025-5598cf	\N	2	10951.20	24530.69	0.00	2628	\N	\N
SALES-STI-2025-f090bb	SALES-STM-2025-c86ce6	\N	ADMIN-PROD-2025-09e33a	\N	1	5616.00	6289.92	0.00	674	\N	\N
SALES-STI-2025-ca65f6	SALES-STM-2025-91058d	\N	ADMIN-PROD-2025-941c5b	\N	1	218400.00	218400.00	0.00	26208	\N	\N
SALES-STI-2025-c956cf	SALES-STM-2025-755417	\N	ADMIN-PROD-2025-a17047	\N	1	249756.00	249756.00	0.00	29971	\N	\N
SALES-STI-2025-b58f6a	SALES-STM-2025-755417	\N	ADMIN-PROD-2025-941c5b	\N	3	1114666.00	3343998.00	0.00	401280	\N	\N
SALES-STI-2025-b0fa0b	SALES-STM-2025-6b1653	\N	ADMIN-PROD-2025-115147	\N	1	128700.00	128700.00	0.00	15444	\N	\N
SALES-STI-2025-6d5466	SALES-STM-2025-2d9ae3	\N	ADMIN-PROD-2025-91b19e	\N	1	780.00	780.00	0.00	0	\N	\N
SALES-STI-2025-b05e8b	SALES-STM-2025-ce174e	\N	ADMIN-PROD-2025-8698b7	\N	1	1114666.00	1114666.00	0.00	133760	\N	\N
SALES-STI-2025-b3d4b5	SALES-STM-2025-ce174e	\N	ADMIN-PROD-2025-5598cf	\N	1	10951.20	10951.20	0.00	1314	\N	\N
SALES-STI-2025-6e1e9d	SALES-STM-2025-656095	\N	ADMIN-PROD-2025-2e0ab6	\N	1	135266.04	135266.04	0.00	16232	\N	\N
SALES-STI-2025-525ef8	SALES-STM-2025-f6b7d0	\N	ADMIN-PROD-2025-a68481	\N	1	598234.55	598234.55	25000.00	71788	\N	\N
SALES-STI-2025-391666	SALES-STM-2025-35c700	\N	ADMIN-PROD-2025-83adb5	\N	1	10951.20	10951.20	0.00	1314	\N	\N
SALES-STI-2025-2d5b9f	SALES-STM-2025-2cc7f2	\N	ADMIN-PROD-2025-a68481	\N	1	47726.64	47726.64	0.00	5727	\N	\N
SALES-STI-2025-2c497f	SALES-STM-2025-ce174e	\N	ADMIN-PROD-2025-2e0ab6	\N	1	47726.64	47726.64	0.00	5727	\N	\N
SALES-STI-2025-262ddf	SALES-STM-2025-2f3fae	\N	ADMIN-PROD-2025-0e6337	\N	2	44967.00	89934.00	0.00	10792	\N	\N
SALES-STI-2025-8e7958	SALES-STM-2025-a862da	\N	ADMIN-PROD-2025-9e365c	\N	1	3954.60	3954.60	0.00	0	\N	\N
SALES-STI-2025-8b38ca	SALES-STM-2025-a862da	\N	ADMIN-PROD-2025-2e0ab6	\N	1	47726.64	47726.64	0.00	0	\N	\N
SALES-STI-2025-c0aea0	SALES-STM-2025-a862da	\N	ADMIN-PROD-2025-a68481	\N	1	259543.44	259543.44	0.00	0	\N	\N
SALES-STI-2025-0361bc	SALES-STM-2025-c86ce6	\N	ADMIN-PROD-2025-8698b7	\N	2	154382.00	308764.00	0.00	37052	\N	\N
SALES-STI-2025-a09a62	SALES-STM-2025-f4b14f	\N	ADMIN-PROD-2025-83adb5	\N	2	50000.00	100000.00	5000.00	12000	\N	\N
SALES-STI-2025-900021	SALES-STM-2025-b90b4b	\N	ADMIN-PROD-2025-b022f3	\N	1	47726.64	47726.64	0.00	5727	\N	\N
SALES-STI-2025-87ad28	SALES-STM-2025-948f52	\N	ADMIN-PROD-2025-115147	\N	2	10951.20	21902.40	0.00	2628	\N	\N
SALES-STI-2025-284852	SALES-STM-2025-5e569c	\N	ADMIN-PROD-2025-2e0ab6	\N	1	475822.67	475822.67	15000.00	57099	\N	\N
SALES-STI-2025-22397f	SALES-STM-2025-3acfef	\N	ADMIN-PROD-2025-115147	\N	1	259543.44	259543.44	0.00	31145	\N	\N
SALES-STI-2025-151818	SALES-STM-2025-21f5af	\N	ADMIN-PROD-2025-a68481	\N	1	259543.44	259543.44	0.00	31145	\N	\N
SALES-STI-2025-0501db	SALES-STM-2025-2879fa	\N	ADMIN-PROD-2025-c5c83a	\N	1	218400.00	218400.00	10000.00	26208	\N	\N
SALES-STI-2025-2e17d5	SALES-STM-2025-a29318	\N	ADMIN-PROD-2025-51838d	\N	1	3900.00	3900.00	0.00	0	\N	\N
SALES-STI-2025-0ad966	SALES-STM-2025-a29318	\N	ADMIN-PROD-2025-6db12d	\N	1	3954.60	3954.60	0.00	0	\N	\N
SALES-STI-2025-7607cb	SALES-STM-2025-d8e83d	\N	ADMIN-PROD-2025-2e0ab6	\N	3	47726.64	143179.92	4999.00	17182	\N	\N
SALES-STI-2025-bf3642	SALES-STM-2025-d8e83d	\N	ADMIN-PROD-2025-64c17b	\N	10	1872.00	18720.00	299.00	2246	\N	\N
SALES-STI-2025-64166b	SALES-STM-2025-bad08f	\N	ADMIN-PROD-2025-2e0ab6	\N	3	47726.64	143179.92	4999.00	17182	\N	\N
SALES-STI-2025-e38383	SALES-STM-2025-bad08f	\N	ADMIN-PROD-2025-64c17b	\N	10	1872.00	18720.00	299.00	2246	\N	\N
SALES-STI-2025-6e081d	SALES-STM-2025-aab12b	\N	ADMIN-PROD-2025-b39c24	\N	1	5616.00	5616.00	0.00	0	\N	\N
SALES-STI-2025-87f0c8	SALES-STM-2025-aab12b	\N	ADMIN-PROD-2025-941c5b	\N	1	218400.00	218400.00	0.00	0	\N	\N
SALES-STI-2025-3927cc	SALES-STM-2025-3656cd	\N	ADMIN-PROD-2025-66eb2d	\N	25	834.60	20865.00	0.00	2504	\N	\N
SALES-STI-2025-17e55f	SALES-STM-2025-3656cd	\N	ADMIN-PROD-2025-5598cf	\N	3	10951.20	32853.60	0.00	3942	\N	\N
SALES-STI-2025-dec340	SALES-STM-2025-3656cd	\N	ADMIN-PROD-2025-2e0ab6	\N	1	47726.64	47726.64	0.00	5727	\N	\N
SALES-STI-2025-0264ae	SALES-STM-2025-45b669	\N	ADMIN-PROD-2025-5598cf	\N	1	10951.20	10951.20	0.00	0	\N	\N
SALES-STI-2025-af888a	SALES-STM-2025-45b669	\N	ADMIN-PROD-2025-5833b2	\N	1	3954.60	3954.60	0.00	0	\N	\N
SALES-STI-2025-f0e0d5	SALES-STM-2025-45b669	\N	ADMIN-PROD-2025-6db12d	\N	1	3954.60	3954.60	0.00	0	\N	\N
SALES-STI-2025-c71430	SALES-STM-2025-6b3b58	\N	ADMIN-PROD-2025-5598cf	\N	1	10951.20	10951.20	0.00	0	\N	\N
SALES-STI-2025-07846b	SALES-STM-2025-6b3b58	\N	ADMIN-PROD-2025-5833b2	\N	1	3954.60	3954.60	0.00	0	\N	\N
SALES-STI-2025-f89340	SALES-STM-2025-6b3b58	\N	ADMIN-PROD-2025-6db12d	\N	1	3954.60	3954.60	0.00	0	\N	\N
SALES-STI-2025-f4d6fb	SALES-STM-2025-6b3ff1	\N	ADMIN-PROD-2025-8698b7	\N	1	1114666.00	1114666.00	19999.00	133760	\N	\N
SALES-STI-2025-fd4752	SALES-STM-2025-6b3ff1	\N	ADMIN-PROD-2025-a17047	\N	1	249756.00	249756.00	0.00	29971	\N	\N
SALES-STI-2025-a9fd57	SALES-STM-2025-6b3ff1	\N	ADMIN-PROD-2025-941c5b	\N	1	218400.00	218400.00	0.00	26208	\N	\N
SALES-STI-2025-cfc87c	SALES-STM-2025-6b3ff1	\N	ADMIN-PROD-2025-5598cf	\N	1	10951.20	10951.20	0.00	1314	\N	\N
SALES-STI-2025-8cd924	SALES-STM-2025-6b3ff1	\N	ADMIN-PROD-2025-83adb5	\N	1	128700.00	128700.00	0.00	0	\N	\N
SALES-STI-2025-0a29b6	SALES-STM-2025-6b3ff1	\N	ADMIN-PROD-2025-a68481	\N	1	259543.44	259543.44	0.00	0	\N	\N
SALES-STI-2025-40bb55	SALES-STM-2025-d2fe42	\N	ADMIN-PROD-2025-8698b7	\N	1	1114666.00	1114666.00	0.00	0	\N	\N
SALES-STI-2025-853877	SALES-STM-2025-0a7cb9	\N	ADMIN-PROD-2025-5598cf	\N	1	10951.20	10951.20	0.00	0	\N	\N
SALES-STI-2025-566a1d	SALES-STM-2025-0a7cb9	\N	ADMIN-PROD-2025-6db12d	\N	1	3954.60	3954.60	0.00	0	\N	\N
SALES-STI-2025-052cf9	SALES-STM-2025-0a7cb9	\N	ADMIN-PROD-2025-290b77	\N	1	6076.20	6076.20	0.00	0	\N	\N
SALES-STI-2025-7d4788	SALES-STM-2025-2079b3	\N	ADMIN-PROD-2025-115147	\N	1	128700.00	154440.00	0.00	0	\N	\N
\.


--
-- Data for Name: ticket; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.ticket (ticket_id, customer_id, salesrep_id, subject, description, status, priority, created_at) FROM stdin;
SALES-TICKET-2025-b3f9aa	\N	\N	MRI Machine Maintenance	Scheduled preventive maintenance for MRI scanner.	Open	High	2025-03-23 10:19:43.986949
SALES-TICKET-2025-5e4d37	\N	\N	X-ray Calibration	X-ray machines require recalibration due to accuracy issues.	In Progress	Urgent	2025-03-23 10:19:43.986949
SALES-TICKET-2025-ff7bff	\N	\N	Training Request - ECG Machine	Hospital staff need hands-on training for ECG machines.	Open	Medium	2025-03-23 10:19:43.986949
SALES-TICKET-2025-83ddd0	\N	\N	Software Update - Ventilators	Need to update ventilator software for new compliance regulations.	Closed	Low	2025-03-23 10:19:43.986949
SALES-TICKET-2025-5ac348	\N	\N	Warranty Repair - Defibrillator	Defibrillator malfunction under warranty claim.	Open	High	2025-03-23 10:19:43.986949
SALES-TICKET-2025-be11e9	\N	\N	Technical Support - Ultrasound	Ultrasound machine displaying error code during operation.	In Progress	Medium	2025-03-23 10:19:43.986949
SALES-TICKET-2025-1341f1	\N	\N	Equipment Relocation Assistance	Need assistance in relocating an MRI scanner to another facility.	Closed	Low	2025-03-23 10:19:43.986949
SALES-TICKET-2025-d09df6	\N	\N	Hospital Bed Malfunction	Motorized hospital beds not adjusting properly.	Open	Urgent	2025-03-23 10:19:43.986949
SALES-TICKET-2025-2660cd	\N	\N	Battery Replacement - Portable Monitors	Request to replace batteries for 20 portable patient monitors.	In Progress	High	2025-03-23 10:19:43.986949
SALES-TICKET-2025-71c901	\N	\N	On-Site Inspection - Operating Room Equipment	Request for technician visit to inspect all OR equipment.	Open	Medium	2025-03-23 10:19:43.986949
SALES-TICKET-2025-e15712	\N	\N	CT Scanner Calibration	CT scanner requires recalibration for accurate imaging.	Open	High	2025-03-23 10:19:43.986949
SALES-TICKET-2025-8800ea	\N	\N	Training Request - Ultrasound	Staff training needed for new ultrasound machines.	In Progress	Medium	2025-03-23 10:19:43.986949
SALES-TICKET-2025-50b93a	\N	\N	Warranty Repair - X-ray Machine	X-ray machine malfunction under warranty.	Open	Urgent	2025-03-23 10:19:43.986949
SALES-TICKET-2025-7cda14	\N	\N	Software Update - MRI Scanner	MRI software update required for compliance.	Closed	Low	2025-03-23 10:19:43.986949
SALES-TICKET-2025-6858fe	\N	\N	Equipment Relocation - Ventilators	Assistance needed to relocate ventilators.	Open	Medium	2025-03-23 10:19:43.986949
SALES-TICKET-2025-2dd80e	\N	\N	Technical Support - Defibrillator	Defibrillator displaying error codes.	In Progress	High	2025-03-23 10:19:43.986949
SALES-TICKET-2025-2ac11f	\N	\N	Hospital Bed Repair	Motorized hospital beds not functioning.	Closed	Low	2025-03-23 10:19:43.986949
SALES-TICKET-2025-409109	\N	\N	Battery Replacement - Monitors	Request to replace batteries for patient monitors.	Open	Medium	2025-03-23 10:19:43.986949
SALES-TICKET-2025-ab24c9	\N	\N	On-Site Inspection - Lab Equipment	Inspection needed for lab equipment.	In Progress	High	2025-03-23 10:19:43.986949
SALES-TICKET-2025-29180a	\N	\N	Training Request - Surgical Tools	Training required for new surgical tools.	Open	Medium	2025-03-23 10:19:43.986949
\.


--
-- Data for Name: ticket_convo; Type: TABLE DATA; Schema: sales; Owner: postgres
--

COPY sales.ticket_convo (convo_id, ticket_id, content, created_at) FROM stdin;
SALES-CONVO-2025-3068cd	\N	Technician scheduled for MRI maintenance on April 5.	2025-03-23 10:19:43.988251
SALES-CONVO-2025-e847a8	\N	Calibration tools dispatched, technician visit confirmed.	2025-03-23 10:19:43.988251
SALES-CONVO-2025-973459	\N	ECG training session scheduled for March 15.	2025-03-23 10:19:43.988251
SALES-CONVO-2025-6af977	\N	Software update package sent, remote installation guide provided.	2025-03-23 10:19:43.988251
SALES-CONVO-2025-de6616	\N	Warranty repair approved, dispatching service team.	2025-03-23 10:19:43.988251
SALES-CONVO-2025-b5952d	\N	Ultrasound troubleshooting guide sent, remote support scheduled.	2025-03-23 10:19:43.988251
SALES-CONVO-2025-8e2e60	\N	MRI relocation assistance team confirmed for March 20.	2025-03-23 10:19:43.988251
SALES-CONVO-2025-8fbe5d	\N	Investigating motorized hospital bed issues, awaiting technician report.	2025-03-23 10:19:43.988251
SALES-CONVO-2025-487475	\N	Battery order placed, estimated arrival March 10.	2025-03-23 10:19:43.988251
SALES-CONVO-2025-f18241	\N	On-site inspection scheduled for April 1, report to follow.	2025-03-23 10:19:43.988251
SALES-CONVO-2025-602a0c	\N	CT scanner calibration scheduled for April 10.	2025-03-23 10:19:43.988251
SALES-CONVO-2025-dddecd	\N	Ultrasound training session confirmed for March 25.	2025-03-23 10:19:43.988251
SALES-CONVO-2025-876889	\N	Warranty repair approved, technician dispatched.	2025-03-23 10:19:43.988251
SALES-CONVO-2025-78a581	\N	MRI software update completed remotely.	2025-03-23 10:19:43.988251
SALES-CONVO-2025-4a6bf5	\N	Ventilator relocation team confirmed for April 5.	2025-03-23 10:19:43.988251
SALES-CONVO-2025-eb2279	\N	Defibrillator troubleshooting guide sent.	2025-03-23 10:19:43.988251
SALES-CONVO-2025-241b90	\N	Hospital bed repair completed successfully.	2025-03-23 10:19:43.988251
SALES-CONVO-2025-2cdc6b	\N	Battery replacement order placed, ETA March 15.	2025-03-23 10:19:43.988251
SALES-CONVO-2025-390197	\N	Lab equipment inspection scheduled for April 8.	2025-03-23 10:19:43.988251
SALES-CONVO-2025-f62a12	\N	Surgical tools training session confirmed for March 30.	2025-03-23 10:19:43.988251
\.


--
-- Data for Name: after_analysis_sched; Type: TABLE DATA; Schema: services; Owner: postgres
--

COPY services.after_analysis_sched (analysis_sched_id, analysis_id, service_date, technician_id, description, service_status) FROM stdin;
SERVICES-SCHED-2025-705bef	\N	2025-08-01	\N	Scheduled follow-up for system inspection.	Scheduled
SERVICES-SCHED-2025-3d5374	\N	2025-08-02	\N	Finalizing security setup analysis.	Completed
SERVICES-SCHED-2025-ded454	\N	2025-08-03	\N	Customer requested additional assessment.	Cancelled
SERVICES-SCHED-2025-169ff8	\N	2025-08-04	\N	Re-checking heating unit.	In Progress
SERVICES-SCHED-2025-1986c6	\N	2025-08-05	\N	Scheduled analysis for network issues.	Scheduled
SERVICES-SCHED-2025-966c98	\N	2025-08-06	\N	Assessment for smart home devices.	Completed
SERVICES-SCHED-2025-50dd06	\N	2025-08-07	\N	Checking air conditioning efficiency.	Cancelled
SERVICES-SCHED-2025-7c2d03	\N	2025-08-08	\N	Verifying repair status.	In Progress
SERVICES-SCHED-2025-5c1536	\N	2025-08-09	\N	System performance test.	Scheduled
SERVICES-SCHED-2025-04ccfb	\N	2025-08-10	\N	Final service check.	Completed
SERVICES-SCHED-2025-f4b49b	\N	2025-08-11	\N	Evaluating wiring safety.	Cancelled
SERVICES-SCHED-2025-1bbda2	\N	2025-08-12	\N	Assessing HVAC maintenance.	In Progress
SERVICES-SCHED-2025-469e16	\N	2025-08-13	\N	Reviewing previous service order.	Scheduled
SERVICES-SCHED-2025-ba7b08	\N	2025-08-14	\N	Analyzing cooling system performance.	Completed
SERVICES-SCHED-2025-0935ff	\N	2025-08-15	\N	Inspection for updated configurations.	Cancelled
SERVICES-SCHED-2025-319cee	\N	2025-08-16	\N	Scheduled quality check.	In Progress
SERVICES-SCHED-2025-bf0988	\N	2025-08-17	\N	Follow-up on system upgrade.	Scheduled
SERVICES-SCHED-2025-303a25	\N	2025-08-18	\N	Security lock system evaluation.	Completed
SERVICES-SCHED-2025-a79b3f	\N	2025-08-19	\N	Customer requested additional service.	Cancelled
SERVICES-SCHED-2025-9fbed9	\N	2025-08-20	\N	Finalizing post-repair service.	In Progress
SERVICES-SCHED-2025-cea183	\N	2025-08-01	\N	Scheduled follow-up for system inspection.	Scheduled
SERVICES-SCHED-2025-86a2c4	\N	2025-08-02	\N	Finalizing security setup analysis.	Completed
SERVICES-SCHED-2025-371f9e	\N	2025-08-03	\N	Customer requested additional assessment.	Cancelled
SERVICES-SCHED-2025-d76dcc	\N	2025-08-04	\N	Re-checking heating unit.	In Progress
SERVICES-SCHED-2025-d6814f	\N	2025-08-05	\N	Scheduled analysis for network issues.	Scheduled
SERVICES-SCHED-2025-8fa29b	\N	2025-08-06	\N	Assessment for smart home devices.	Completed
SERVICES-SCHED-2025-ce1753	\N	2025-08-07	\N	Checking air conditioning efficiency.	Cancelled
SERVICES-SCHED-2025-455f7a	\N	2025-08-08	\N	Verifying repair status.	In Progress
SERVICES-SCHED-2025-eaa02f	\N	2025-08-09	\N	System performance test.	Scheduled
SERVICES-SCHED-2025-c3787e	\N	2025-08-10	\N	Final service check.	Completed
SERVICES-SCHED-2025-3b37a4	\N	2025-08-11	\N	Evaluating wiring safety.	Cancelled
SERVICES-SCHED-2025-fb108c	\N	2025-08-12	\N	Assessing HVAC maintenance.	In Progress
SERVICES-SCHED-2025-8dc197	\N	2025-08-13	\N	Reviewing previous service order.	Scheduled
SERVICES-SCHED-2025-46920a	\N	2025-08-14	\N	Analyzing cooling system performance.	Completed
SERVICES-SCHED-2025-ecdc05	\N	2025-08-15	\N	Inspection for updated configurations.	Cancelled
SERVICES-SCHED-2025-e53cf7	\N	2025-08-16	\N	Scheduled quality check.	In Progress
SERVICES-SCHED-2025-d3424d	\N	2025-08-17	\N	Follow-up on system upgrade.	Scheduled
SERVICES-SCHED-2025-ed734f	\N	2025-08-18	\N	Security lock system evaluation.	Completed
SERVICES-SCHED-2025-efe40c	\N	2025-08-19	\N	Customer requested additional service.	Cancelled
SERVICES-SCHED-2025-c3f159	\N	2025-08-20	\N	Finalizing post-repair service.	In Progress
\.


--
-- Data for Name: delivery_order; Type: TABLE DATA; Schema: services; Owner: postgres
--

COPY services.delivery_order (delivery_order_id, service_order_item_id, customer_id, customer_address, delivery_status, delivery_date) FROM stdin;
SERVICES-DO-2025-604d83	\N	\N	123 Elm Street, NY	Pending	2025-09-01
SERVICES-DO-2025-23cea3	\N	\N	456 Oak Avenue, CA	Shipped	2025-09-02
SERVICES-DO-2025-cf1386	\N	\N	789 Pine Road, TX	Delivered	2025-09-03
SERVICES-DO-2025-9c7b91	\N	\N	321 Maple Drive, FL	Pending	2025-09-04
SERVICES-DO-2025-9f098a	\N	\N	654 Cedar Lane, WA	Shipped	2025-09-05
SERVICES-DO-2025-78a27c	\N	\N	987 Birch Boulevard, IL	Delivered	2025-09-06
SERVICES-DO-2025-92956f	\N	\N	159 Walnut Street, GA	Pending	2025-09-07
SERVICES-DO-2025-3a785d	\N	\N	753 Chestnut Road, CO	Shipped	2025-09-08
SERVICES-DO-2025-48f4e2	\N	\N	852 Redwood Ave, OR	Delivered	2025-09-09
SERVICES-DO-2025-ed3f63	\N	\N	951 Spruce Circle, NV	Pending	2025-09-10
SERVICES-DO-2025-9cff2b	\N	\N	753 Cypress Street, AZ	Shipped	2025-09-11
SERVICES-DO-2025-e9d255	\N	\N	357 Palm Lane, NJ	Delivered	2025-09-12
SERVICES-DO-2025-3d38e0	\N	\N	258 Juniper Road, MI	Pending	2025-09-13
SERVICES-DO-2025-c0f86a	\N	\N	369 Aspen Drive, MO	Shipped	2025-09-14
SERVICES-DO-2025-97c78a	\N	\N	741 Magnolia Blvd, TN	Delivered	2025-09-15
SERVICES-DO-2025-7b4696	\N	\N	147 Hickory Street, OH	Pending	2025-09-16
SERVICES-DO-2025-ee7b3c	\N	\N	369 Willow Avenue, VA	Shipped	2025-09-17
SERVICES-DO-2025-5d94a1	\N	\N	258 Dogwood Road, KY	Delivered	2025-09-18
SERVICES-DO-2025-447cb8	\N	\N	357 Fir Lane, MA	Pending	2025-09-19
SERVICES-DO-2025-ce7b1a	\N	\N	753 Poplar Blvd, MN	Shipped	2025-09-20
SERVICES-DO-2025-f9ec53	\N	\N	123 Elm Street, NY	Pending	2025-09-01
SERVICES-DO-2025-7a0507	\N	\N	456 Oak Avenue, CA	Shipped	2025-09-02
SERVICES-DO-2025-35dfe5	\N	\N	789 Pine Road, TX	Delivered	2025-09-03
SERVICES-DO-2025-d3c3e6	\N	\N	321 Maple Drive, FL	Pending	2025-09-04
SERVICES-DO-2025-0fd201	\N	\N	654 Cedar Lane, WA	Shipped	2025-09-05
SERVICES-DO-2025-42d740	\N	\N	987 Birch Boulevard, IL	Delivered	2025-09-06
SERVICES-DO-2025-414e3a	\N	\N	159 Walnut Street, GA	Pending	2025-09-07
SERVICES-DO-2025-ffc706	\N	\N	753 Chestnut Road, CO	Shipped	2025-09-08
SERVICES-DO-2025-d7376d	\N	\N	852 Redwood Ave, OR	Delivered	2025-09-09
SERVICES-DO-2025-ca652c	\N	\N	951 Spruce Circle, NV	Pending	2025-09-10
SERVICES-DO-2025-f98e16	\N	\N	753 Cypress Street, AZ	Shipped	2025-09-11
SERVICES-DO-2025-8dce5c	\N	\N	357 Palm Lane, NJ	Delivered	2025-09-12
SERVICES-DO-2025-f5f1b0	\N	\N	258 Juniper Road, MI	Pending	2025-09-13
SERVICES-DO-2025-6bfabc	\N	\N	369 Aspen Drive, MO	Shipped	2025-09-14
SERVICES-DO-2025-185e7c	\N	\N	741 Magnolia Blvd, TN	Delivered	2025-09-15
SERVICES-DO-2025-242eff	\N	\N	147 Hickory Street, OH	Pending	2025-09-16
SERVICES-DO-2025-e77e7a	\N	\N	369 Willow Avenue, VA	Shipped	2025-09-17
SERVICES-DO-2025-3c1269	\N	\N	258 Dogwood Road, KY	Delivered	2025-09-18
SERVICES-DO-2025-b59678	\N	\N	357 Fir Lane, MA	Pending	2025-09-19
SERVICES-DO-2025-bc0d61	\N	\N	753 Poplar Blvd, MN	Shipped	2025-09-20
\.


--
-- Data for Name: service_analysis; Type: TABLE DATA; Schema: services; Owner: postgres
--

COPY services.service_analysis (analysis_id, service_request_id, analysis_date, technician_id, customer_id, analysis_status, analysis_description, product_id, contract_id, labor_cost) FROM stdin;
SERVICES-ANALYSIS-2025-cd3b50	\N	2025-07-01	\N	\N	Scheduled	Initial diagnosis scheduled.	\N	\N	50.00
SERVICES-ANALYSIS-2025-e0de6f	\N	2025-07-02	\N	\N	Done	Repair assessment completed.	\N	\N	75.00
SERVICES-ANALYSIS-2025-1b4456	\N	2025-07-03	\N	\N	Scheduled	Pending analysis for heating system.	\N	\N	60.00
SERVICES-ANALYSIS-2025-80094c	\N	2025-07-04	\N	\N	Done	Inspection completed for smart home setup.	\N	\N	85.00
SERVICES-ANALYSIS-2025-7ab076	\N	2025-07-05	\N	\N	Scheduled	Customer reported strange noises.	\N	\N	45.00
SERVICES-ANALYSIS-2025-f890bc	\N	2025-07-06	\N	\N	Done	Analysis completed for security system.	\N	\N	100.00
SERVICES-ANALYSIS-2025-e73106	\N	2025-07-07	\N	\N	Scheduled	Diagnosing air conditioning malfunction.	\N	\N	55.00
SERVICES-ANALYSIS-2025-812545	\N	2025-07-08	\N	\N	Done	Troubleshooting completed.	\N	\N	90.00
SERVICES-ANALYSIS-2025-428ed4	\N	2025-07-09	\N	\N	Scheduled	System update analysis.	\N	\N	65.00
SERVICES-ANALYSIS-2025-43a6c0	\N	2025-07-10	\N	\N	Done	Inspection for hardware damage.	\N	\N	110.00
SERVICES-ANALYSIS-2025-d6e150	\N	2025-07-11	\N	\N	Scheduled	Checking electrical components.	\N	\N	70.00
SERVICES-ANALYSIS-2025-fd630a	\N	2025-07-12	\N	\N	Done	Repair feasibility analysis done.	\N	\N	95.00
SERVICES-ANALYSIS-2025-885959	\N	2025-07-13	\N	\N	Scheduled	Reviewing software issues.	\N	\N	80.00
SERVICES-ANALYSIS-2025-2edc42	\N	2025-07-14	\N	\N	Done	Completed analysis for smart door lock.	\N	\N	120.00
SERVICES-ANALYSIS-2025-a969ed	\N	2025-07-15	\N	\N	Scheduled	Analyzing cooling system efficiency.	\N	\N	75.00
SERVICES-ANALYSIS-2025-d8e0f2	\N	2025-07-16	\N	\N	Done	Inspection for wiring issues.	\N	\N	85.00
SERVICES-ANALYSIS-2025-ba325f	\N	2025-07-17	\N	\N	Scheduled	Assessing panel installation.	\N	\N	95.00
SERVICES-ANALYSIS-2025-034458	\N	2025-07-18	\N	\N	Done	Analysis of network connectivity issues.	\N	\N	130.00
SERVICES-ANALYSIS-2025-90c15c	\N	2025-07-19	\N	\N	Scheduled	Checking operational safety.	\N	\N	100.00
SERVICES-ANALYSIS-2025-57369f	\N	2025-07-20	\N	\N	Done	Final analysis for machine performance.	\N	\N	140.00
SERVICES-ANALYSIS-2025-1d764a	\N	2025-07-01	\N	\N	Scheduled	Initial diagnosis scheduled.	\N	\N	50.00
SERVICES-ANALYSIS-2025-f983aa	\N	2025-07-02	\N	\N	Done	Repair assessment completed.	\N	\N	75.00
SERVICES-ANALYSIS-2025-070a8d	\N	2025-07-03	\N	\N	Scheduled	Pending analysis for heating system.	\N	\N	60.00
SERVICES-ANALYSIS-2025-c59144	\N	2025-07-04	\N	\N	Done	Inspection completed for smart home setup.	\N	\N	85.00
SERVICES-ANALYSIS-2025-a00973	\N	2025-07-05	\N	\N	Scheduled	Customer reported strange noises.	\N	\N	45.00
SERVICES-ANALYSIS-2025-6b23cb	\N	2025-07-06	\N	\N	Done	Analysis completed for security system.	\N	\N	100.00
SERVICES-ANALYSIS-2025-08d326	\N	2025-07-07	\N	\N	Scheduled	Diagnosing air conditioning malfunction.	\N	\N	55.00
SERVICES-ANALYSIS-2025-5b9f77	\N	2025-07-08	\N	\N	Done	Troubleshooting completed.	\N	\N	90.00
SERVICES-ANALYSIS-2025-a5a9fb	\N	2025-07-09	\N	\N	Scheduled	System update analysis.	\N	\N	65.00
SERVICES-ANALYSIS-2025-331842	\N	2025-07-10	\N	\N	Done	Inspection for hardware damage.	\N	\N	110.00
SERVICES-ANALYSIS-2025-b91bb0	\N	2025-07-11	\N	\N	Scheduled	Checking electrical components.	\N	\N	70.00
SERVICES-ANALYSIS-2025-3de05b	\N	2025-07-12	\N	\N	Done	Repair feasibility analysis done.	\N	\N	95.00
SERVICES-ANALYSIS-2025-cba254	\N	2025-07-13	\N	\N	Scheduled	Reviewing software issues.	\N	\N	80.00
SERVICES-ANALYSIS-2025-63c013	\N	2025-07-14	\N	\N	Done	Completed analysis for smart door lock.	\N	\N	120.00
SERVICES-ANALYSIS-2025-5a0a54	\N	2025-07-15	\N	\N	Scheduled	Analyzing cooling system efficiency.	\N	\N	75.00
SERVICES-ANALYSIS-2025-c114c1	\N	2025-07-16	\N	\N	Done	Inspection for wiring issues.	\N	\N	85.00
SERVICES-ANALYSIS-2025-bf427e	\N	2025-07-17	\N	\N	Scheduled	Assessing panel installation.	\N	\N	95.00
SERVICES-ANALYSIS-2025-200ce2	\N	2025-07-18	\N	\N	Done	Analysis of network connectivity issues.	\N	\N	130.00
SERVICES-ANALYSIS-2025-e4d575	\N	2025-07-19	\N	\N	Scheduled	Checking operational safety.	\N	\N	100.00
SERVICES-ANALYSIS-2025-644df4	\N	2025-07-20	\N	\N	Done	Final analysis for machine performance.	\N	\N	140.00
\.


--
-- Data for Name: service_billing; Type: TABLE DATA; Schema: services; Owner: postgres
--

COPY services.service_billing (service_billing_id, service_order_item_id, analysis_id, service_request_id, charge_type, item_name, service_billing_amount, outsource_fee, order_item_price, total_payable, date_paid) FROM stdin;
SERVICES-BILL-2025-976118	\N	\N	\N	Labor	Installation Service	150.00	10.00	0.00	160.00	2025-09-01
SERVICES-BILL-2025-1dfe78	\N	\N	\N	Parts	Replacement Fan	50.00	5.00	0.00	55.00	2025-09-02
SERVICES-BILL-2025-4b4d0e	\N	\N	\N	Other	On-Site Inspection	75.00	0.00	0.00	75.00	\N
SERVICES-BILL-2025-023c44	\N	\N	\N	Labor	Repair Service	200.00	15.00	0.00	215.00	2025-09-04
SERVICES-BILL-2025-7375e4	\N	\N	\N	Parts	New Motherboard	250.00	10.00	0.00	260.00	\N
SERVICES-BILL-2025-e3094e	\N	\N	\N	Labor	Software Installation	100.00	0.00	0.00	100.00	2025-09-06
SERVICES-BILL-2025-f80e89	\N	\N	\N	Other	Diagnostic Service	50.00	5.00	0.00	55.00	\N
SERVICES-BILL-2025-a23163	\N	\N	\N	Parts	Graphics Card Replacement	400.00	20.00	0.00	420.00	2025-09-08
SERVICES-BILL-2025-a3dd13	\N	\N	\N	Labor	General Maintenance	120.00	5.00	0.00	125.00	\N
SERVICES-BILL-2025-9f0516	\N	\N	\N	Parts	Power Supply Unit	90.00	0.00	0.00	90.00	2025-09-10
SERVICES-BILL-2025-5d35c6	\N	\N	\N	Labor	Printer Repair	180.00	0.00	0.00	180.00	2025-09-11
SERVICES-BILL-2025-fb6d49	\N	\N	\N	Parts	Laptop Battery Replacement	85.00	5.00	0.00	90.00	\N
SERVICES-BILL-2025-49ce64	\N	\N	\N	Other	Remote IT Support	60.00	0.00	0.00	60.00	2025-09-13
SERVICES-BILL-2025-a14bc4	\N	\N	\N	Labor	Security System Setup	250.00	10.00	0.00	260.00	\N
SERVICES-BILL-2025-b479b6	\N	\N	\N	Parts	SSD Upgrade	150.00	5.00	0.00	155.00	2025-09-15
SERVICES-BILL-2025-c8bc7a	\N	\N	\N	Labor	Network Configuration	175.00	0.00	0.00	175.00	\N
SERVICES-BILL-2025-114344	\N	\N	\N	Parts	External Hard Drive	130.00	5.00	0.00	135.00	2025-09-17
SERVICES-BILL-2025-8c4c32	\N	\N	\N	Other	System Optimization	70.00	0.00	0.00	70.00	\N
SERVICES-BILL-2025-8eec34	\N	\N	\N	Labor	Backup & Recovery Service	90.00	0.00	0.00	90.00	2025-09-19
SERVICES-BILL-2025-20e584	\N	\N	\N	Parts	Wireless Adapter	45.00	0.00	0.00	45.00	\N
SERVICES-BILL-2025-d342ae	\N	\N	\N	Labor	Installation Service	150.00	10.00	0.00	160.00	2025-09-01
SERVICES-BILL-2025-635511	\N	\N	\N	Parts	Replacement Fan	50.00	5.00	0.00	55.00	2025-09-02
SERVICES-BILL-2025-85770c	\N	\N	\N	Other	On-Site Inspection	75.00	0.00	0.00	75.00	\N
SERVICES-BILL-2025-f39267	\N	\N	\N	Labor	Repair Service	200.00	15.00	0.00	215.00	2025-09-04
SERVICES-BILL-2025-c9bd9c	\N	\N	\N	Parts	New Motherboard	250.00	10.00	0.00	260.00	\N
SERVICES-BILL-2025-3d2738	\N	\N	\N	Labor	Software Installation	100.00	0.00	0.00	100.00	2025-09-06
SERVICES-BILL-2025-76adbd	\N	\N	\N	Other	Diagnostic Service	50.00	5.00	0.00	55.00	\N
SERVICES-BILL-2025-37d20d	\N	\N	\N	Parts	Graphics Card Replacement	400.00	20.00	0.00	420.00	2025-09-08
SERVICES-BILL-2025-671d61	\N	\N	\N	Labor	General Maintenance	120.00	5.00	0.00	125.00	\N
SERVICES-BILL-2025-8e6114	\N	\N	\N	Parts	Power Supply Unit	90.00	0.00	0.00	90.00	2025-09-10
SERVICES-BILL-2025-577bcd	\N	\N	\N	Labor	Printer Repair	180.00	0.00	0.00	180.00	2025-09-11
SERVICES-BILL-2025-529137	\N	\N	\N	Parts	Laptop Battery Replacement	85.00	5.00	0.00	90.00	\N
SERVICES-BILL-2025-be7bf9	\N	\N	\N	Other	Remote IT Support	60.00	0.00	0.00	60.00	2025-09-13
SERVICES-BILL-2025-775eea	\N	\N	\N	Labor	Security System Setup	250.00	10.00	0.00	260.00	\N
SERVICES-BILL-2025-cc3175	\N	\N	\N	Parts	SSD Upgrade	150.00	5.00	0.00	155.00	2025-09-15
SERVICES-BILL-2025-d359e3	\N	\N	\N	Labor	Network Configuration	175.00	0.00	0.00	175.00	\N
SERVICES-BILL-2025-f68cd3	\N	\N	\N	Parts	External Hard Drive	130.00	5.00	0.00	135.00	2025-09-17
SERVICES-BILL-2025-de33f6	\N	\N	\N	Other	System Optimization	70.00	0.00	0.00	70.00	\N
SERVICES-BILL-2025-72ec13	\N	\N	\N	Labor	Backup & Recovery Service	90.00	0.00	0.00	90.00	2025-09-19
SERVICES-BILL-2025-eff7c0	\N	\N	\N	Parts	Wireless Adapter	45.00	0.00	0.00	45.00	\N
\.


--
-- Data for Name: service_call; Type: TABLE DATA; Schema: services; Owner: postgres
--

COPY services.service_call (service_call_id, date_created, service_ticket_id, customer_id, call_type, technician_id, call_status, date_closed, contract_no, end_date, priority_level, resolution) FROM stdin;
SERVICES-CALL-2025-135d52	2025-03-23 10:19:43.998024	\N	\N	Inquiry	\N	Open	\N	\N	2025-12-31	Low	Pending investigation
SERVICES-CALL-2025-63411a	2025-03-23 10:19:43.998024	\N	\N	Request	\N	In Progress	\N	\N	2026-06-30	High	Assigned technician
SERVICES-CALL-2025-6ea1fc	2025-03-23 10:19:43.998024	\N	\N	Other	\N	Closed	2025-03-23 10:19:43.998024	\N	2025-09-30	Medium	Resolved
SERVICES-CALL-2025-f683bb	2025-03-23 10:19:43.998024	\N	\N	Request	\N	Open	\N	\N	2026-01-15	High	Pending approval
SERVICES-CALL-2025-946733	2025-03-23 10:19:43.998024	\N	\N	Inquiry	\N	Open	\N	\N	2025-11-20	Low	Customer follow-up needed
SERVICES-CALL-2025-708049	2025-03-23 10:19:43.998024	\N	\N	Request	\N	Closed	2025-03-23 10:19:43.998024	\N	2025-10-10	Medium	Issue fixed
SERVICES-CALL-2025-36b861	2025-03-23 10:19:43.998024	\N	\N	Inquiry	\N	Open	\N	\N	2026-02-28	Low	Awaiting response
SERVICES-CALL-2025-79e7be	2025-03-23 10:19:43.998024	\N	\N	Other	\N	In Progress	\N	\N	2025-08-15	Medium	Investigation ongoing
SERVICES-CALL-2025-1169fb	2025-03-23 10:19:43.998024	\N	\N	Request	\N	Closed	2025-03-23 10:19:43.998024	\N	2025-12-10	High	Replacement provided
SERVICES-CALL-2025-72316d	2025-03-23 10:19:43.998024	\N	\N	Inquiry	\N	Open	\N	\N	2026-03-01	Low	Awaiting technician feedback
SERVICES-CALL-2025-010c1f	2025-03-23 10:19:43.998024	\N	\N	Request	\N	In Progress	\N	\N	2026-04-05	High	Technician dispatched
SERVICES-CALL-2025-ca57b4	2025-03-23 10:19:43.998024	\N	\N	Other	\N	Open	\N	\N	2025-09-20	Medium	Escalated to management
SERVICES-CALL-2025-f61fca	2025-03-23 10:19:43.998024	\N	\N	Inquiry	\N	Closed	2025-03-23 10:19:43.998024	\N	2025-07-15	Low	Customer satisfied
SERVICES-CALL-2025-37e9f1	2025-03-23 10:19:43.998024	\N	\N	Request	\N	Open	\N	\N	2026-05-30	High	Pending supervisor approval
SERVICES-CALL-2025-3e8965	2025-03-23 10:19:43.998024	\N	\N	Inquiry	\N	Open	\N	\N	2025-11-05	Medium	Awaiting additional info
SERVICES-CALL-2025-c86c06	2025-03-23 10:19:43.998024	\N	\N	Other	\N	Closed	2025-03-23 10:19:43.998024	\N	2025-08-22	Low	Duplicate request
SERVICES-CALL-2025-af94c7	2025-03-23 10:19:43.998024	\N	\N	Request	\N	In Progress	\N	\N	2025-10-18	High	Parts ordered
SERVICES-CALL-2025-7c5ae9	2025-03-23 10:19:43.998024	\N	\N	Inquiry	\N	Open	\N	\N	2026-01-12	Medium	Customer needs demo
SERVICES-CALL-2025-f84e6a	2025-03-23 10:19:43.998024	\N	\N	Other	\N	Closed	2025-03-23 10:19:43.998024	\N	2025-12-07	Low	Issue not reproducible
SERVICES-CALL-2025-0d6f1a	2025-03-23 10:19:43.998024	\N	\N	Request	\N	Open	\N	\N	2026-02-05	High	Requires escalation
SERVICES-CALL-2025-287284	2025-03-23 10:19:44.105522	\N	\N	Inquiry	\N	Open	\N	\N	2025-12-31	Low	Pending investigation
SERVICES-CALL-2025-45a53d	2025-03-23 10:19:44.105522	\N	\N	Request	\N	In Progress	\N	\N	2026-06-30	High	Assigned technician
SERVICES-CALL-2025-271241	2025-03-23 10:19:44.105522	\N	\N	Other	\N	Closed	2025-03-23 10:19:44.105522	\N	2025-09-30	Medium	Resolved
SERVICES-CALL-2025-226893	2025-03-23 10:19:44.105522	\N	\N	Request	\N	Open	\N	\N	2026-01-15	High	Pending approval
SERVICES-CALL-2025-5d88a6	2025-03-23 10:19:44.105522	\N	\N	Inquiry	\N	Open	\N	\N	2025-11-20	Low	Customer follow-up needed
SERVICES-CALL-2025-e80161	2025-03-23 10:19:44.105522	\N	\N	Request	\N	Closed	2025-03-23 10:19:44.105522	\N	2025-10-10	Medium	Issue fixed
SERVICES-CALL-2025-902b94	2025-03-23 10:19:44.105522	\N	\N	Inquiry	\N	Open	\N	\N	2026-02-28	Low	Awaiting response
SERVICES-CALL-2025-4e4a7a	2025-03-23 10:19:44.105522	\N	\N	Other	\N	In Progress	\N	\N	2025-08-15	Medium	Investigation ongoing
SERVICES-CALL-2025-7a1e21	2025-03-23 10:19:44.105522	\N	\N	Request	\N	Closed	2025-03-23 10:19:44.105522	\N	2025-12-10	High	Replacement provided
SERVICES-CALL-2025-7fa6ae	2025-03-23 10:19:44.105522	\N	\N	Inquiry	\N	Open	\N	\N	2026-03-01	Low	Awaiting technician feedback
SERVICES-CALL-2025-2641fb	2025-03-23 10:19:44.105522	\N	\N	Request	\N	In Progress	\N	\N	2026-04-05	High	Technician dispatched
SERVICES-CALL-2025-cfc91f	2025-03-23 10:19:44.105522	\N	\N	Other	\N	Open	\N	\N	2025-09-20	Medium	Escalated to management
SERVICES-CALL-2025-4d4f7e	2025-03-23 10:19:44.105522	\N	\N	Inquiry	\N	Closed	2025-03-23 10:19:44.105522	\N	2025-07-15	Low	Customer satisfied
SERVICES-CALL-2025-c44461	2025-03-23 10:19:44.105522	\N	\N	Request	\N	Open	\N	\N	2026-05-30	High	Pending supervisor approval
SERVICES-CALL-2025-cf3300	2025-03-23 10:19:44.105522	\N	\N	Inquiry	\N	Open	\N	\N	2025-11-05	Medium	Awaiting additional info
SERVICES-CALL-2025-df7e22	2025-03-23 10:19:44.105522	\N	\N	Other	\N	Closed	2025-03-23 10:19:44.105522	\N	2025-08-22	Low	Duplicate request
SERVICES-CALL-2025-af78dc	2025-03-23 10:19:44.105522	\N	\N	Request	\N	In Progress	\N	\N	2025-10-18	High	Parts ordered
SERVICES-CALL-2025-9649e3	2025-03-23 10:19:44.105522	\N	\N	Inquiry	\N	Open	\N	\N	2026-01-12	Medium	Customer needs demo
SERVICES-CALL-2025-a01d74	2025-03-23 10:19:44.105522	\N	\N	Other	\N	Closed	2025-03-23 10:19:44.105522	\N	2025-12-07	Low	Issue not reproducible
SERVICES-CALL-2025-d00da0	2025-03-23 10:19:44.105522	\N	\N	Request	\N	Open	\N	\N	2026-02-05	High	Requires escalation
\.


--
-- Data for Name: service_order; Type: TABLE DATA; Schema: services; Owner: postgres
--

COPY services.service_order (service_order_id, analysis_id, customer_id, order_date) FROM stdin;
SERVICES-SO-2025-30b7e6	\N	\N	2025-09-01 10:15:00
SERVICES-SO-2025-a4e2d7	\N	\N	2025-09-02 11:30:00
SERVICES-SO-2025-18ed20	\N	\N	2025-09-03 12:45:00
SERVICES-SO-2025-6f2b8f	\N	\N	2025-09-04 14:00:00
SERVICES-SO-2025-7a3cfd	\N	\N	2025-09-05 15:15:00
SERVICES-SO-2025-c5244d	\N	\N	2025-09-06 16:30:00
SERVICES-SO-2025-fff563	\N	\N	2025-09-07 17:45:00
SERVICES-SO-2025-bdb6aa	\N	\N	2025-09-08 18:00:00
SERVICES-SO-2025-b6f5a3	\N	\N	2025-09-09 19:15:00
SERVICES-SO-2025-e70a1f	\N	\N	2025-09-10 20:30:00
SERVICES-SO-2025-9b2ad4	\N	\N	2025-09-11 21:45:00
SERVICES-SO-2025-01b65d	\N	\N	2025-09-12 22:00:00
SERVICES-SO-2025-1e5b31	\N	\N	2025-09-13 23:15:00
SERVICES-SO-2025-f7cc9c	\N	\N	2025-09-14 08:30:00
SERVICES-SO-2025-66a733	\N	\N	2025-09-15 09:45:00
SERVICES-SO-2025-30152a	\N	\N	2025-09-16 10:00:00
SERVICES-SO-2025-794d47	\N	\N	2025-09-17 11:15:00
SERVICES-SO-2025-66e6f9	\N	\N	2025-09-18 12:30:00
SERVICES-SO-2025-f587ef	\N	\N	2025-09-19 13:45:00
SERVICES-SO-2025-a0236c	\N	\N	2025-09-20 15:00:00
SERVICES-SO-2025-68d4de	\N	\N	2025-09-01 10:15:00
SERVICES-SO-2025-61a15d	\N	\N	2025-09-02 11:30:00
SERVICES-SO-2025-ffac0b	\N	\N	2025-09-03 12:45:00
SERVICES-SO-2025-8f6ba1	\N	\N	2025-09-04 14:00:00
SERVICES-SO-2025-b8bec9	\N	\N	2025-09-05 15:15:00
SERVICES-SO-2025-16ec13	\N	\N	2025-09-06 16:30:00
SERVICES-SO-2025-7a463f	\N	\N	2025-09-07 17:45:00
SERVICES-SO-2025-50ab4c	\N	\N	2025-09-08 18:00:00
SERVICES-SO-2025-57d820	\N	\N	2025-09-09 19:15:00
SERVICES-SO-2025-1766ed	\N	\N	2025-09-10 20:30:00
SERVICES-SO-2025-f0617a	\N	\N	2025-09-11 21:45:00
SERVICES-SO-2025-dfa960	\N	\N	2025-09-12 22:00:00
SERVICES-SO-2025-f14228	\N	\N	2025-09-13 23:15:00
SERVICES-SO-2025-cc9b89	\N	\N	2025-09-14 08:30:00
SERVICES-SO-2025-3ff04f	\N	\N	2025-09-15 09:45:00
SERVICES-SO-2025-963e23	\N	\N	2025-09-16 10:00:00
SERVICES-SO-2025-d85575	\N	\N	2025-09-17 11:15:00
SERVICES-SO-2025-18ae7f	\N	\N	2025-09-18 12:30:00
SERVICES-SO-2025-4bd96e	\N	\N	2025-09-19 13:45:00
SERVICES-SO-2025-1a317a	\N	\N	2025-09-20 15:00:00
\.


--
-- Data for Name: service_order_item; Type: TABLE DATA; Schema: services; Owner: postgres
--

COPY services.service_order_item (service_order_item_id, service_order_id, principal_item_id, item_name, item_quantity, item_price) FROM stdin;
SOIT-2025-c812ed	\N	\N	Cooling Fan	2	49.99
SOIT-2025-bab379	\N	\N	Motherboard	1	199.99
SOIT-2025-3e2357	\N	\N	Power Supply Unit	1	89.99
SOIT-2025-8a29fd	\N	\N	Laptop Charger	3	29.99
SOIT-2025-9130b7	\N	\N	Solid State Drive (SSD)	2	119.99
SOIT-2025-761ef8	\N	\N	Graphics Card	1	399.99
SOIT-2025-7135bf	\N	\N	Wireless Router	1	79.99
SOIT-2025-1b743c	\N	\N	USB Keyboard	4	19.99
SOIT-2025-098562	\N	\N	LED Monitor	1	149.99
SOIT-2025-43690e	\N	\N	Desktop RAM 16GB	2	69.99
SOIT-2025-c967b7	\N	\N	Bluetooth Speaker	1	59.99
SOIT-2025-1aa439	\N	\N	Smartphone Screen Protector	5	9.99
SOIT-2025-e86bbf	\N	\N	Headset with Microphone	2	39.99
SOIT-2025-7da722	\N	\N	Portable Hard Drive 1TB	1	129.99
SOIT-2025-9cef94	\N	\N	Webcam HD 1080p	2	49.99
SOIT-2025-48b262	\N	\N	Mechanical Keyboard	1	89.99
SOIT-2025-83d47f	\N	\N	Wireless Mouse	3	24.99
SOIT-2025-c476b7	\N	\N	Printer Ink Cartridge	2	34.99
SOIT-2025-ca49fa	\N	\N	External Sound Card	1	79.99
SOIT-2025-eb6dc0	\N	\N	Surge Protector	2	19.99
SOIT-2025-061fab	\N	\N	Cooling Fan	2	49.99
SOIT-2025-f6d675	\N	\N	Motherboard	1	199.99
SOIT-2025-f57baa	\N	\N	Power Supply Unit	1	89.99
SOIT-2025-c0ee94	\N	\N	Laptop Charger	3	29.99
SOIT-2025-17d54b	\N	\N	Solid State Drive (SSD)	2	119.99
SOIT-2025-c97baa	\N	\N	Graphics Card	1	399.99
SOIT-2025-d059c6	\N	\N	Wireless Router	1	79.99
SOIT-2025-20e697	\N	\N	USB Keyboard	4	19.99
SOIT-2025-c17aca	\N	\N	LED Monitor	1	149.99
SOIT-2025-6273f4	\N	\N	Desktop RAM 16GB	2	69.99
SOIT-2025-a2c5ea	\N	\N	Bluetooth Speaker	1	59.99
SOIT-2025-da2167	\N	\N	Smartphone Screen Protector	5	9.99
SOIT-2025-69b12b	\N	\N	Headset with Microphone	2	39.99
SOIT-2025-d7ad56	\N	\N	Portable Hard Drive 1TB	1	129.99
SOIT-2025-54ae1e	\N	\N	Webcam HD 1080p	2	49.99
SOIT-2025-4e7d42	\N	\N	Mechanical Keyboard	1	89.99
SOIT-2025-a547a1	\N	\N	Wireless Mouse	3	24.99
SOIT-2025-8d63f7	\N	\N	Printer Ink Cartridge	2	34.99
SOIT-2025-9bd63f	\N	\N	External Sound Card	1	79.99
SOIT-2025-fa33c3	\N	\N	Surge Protector	2	19.99
\.


--
-- Data for Name: service_report; Type: TABLE DATA; Schema: services; Owner: postgres
--

COPY services.service_report (report_id, service_call_id, service_ticket_id, service_billing_id, technician_id, description, report_status, submission_date) FROM stdin;
SERVICES-REPORT-2025-43d259	\N	\N	\N	\N	Routine maintenance check completed	Submitted	2025-09-01
SERVICES-REPORT-2025-70bf56	\N	\N	\N	\N	Replaced faulty power supply	Reviewed	2025-09-02
SERVICES-REPORT-2025-5ec33a	\N	\N	\N	\N	Diagnosed network issue and provided solution	Draft	\N
SERVICES-REPORT-2025-640d11	\N	\N	\N	\N	Resolved software compatibility issue	Submitted	2025-09-04
SERVICES-REPORT-2025-426d39	\N	\N	\N	\N	Customer requested additional inspection	Reviewed	\N
SERVICES-REPORT-2025-c544d4	\N	\N	\N	\N	Upgraded storage capacity on request	Draft	2025-09-06
SERVICES-REPORT-2025-b10c7c	\N	\N	\N	\N	Fixed printer connectivity issue	Reviewed	2025-09-07
SERVICES-REPORT-2025-3c32e5	\N	\N	\N	\N	Replaced defective laptop screen	Submitted	\N
SERVICES-REPORT-2025-15cc46	\N	\N	\N	\N	Carried out a complete system diagnostics	Draft	2025-09-09
SERVICES-REPORT-2025-579523	\N	\N	\N	\N	Provided training on security best practices	Submitted	2025-09-10
SERVICES-REPORT-2025-a9e771	\N	\N	\N	\N	Installed new software update	Reviewed	2025-09-11
SERVICES-REPORT-2025-10f8c6	\N	\N	\N	\N	Resolved customer complaint about slow system performance	Draft	\N
SERVICES-REPORT-2025-81e0b8	\N	\N	\N	\N	Reconfigured wireless network	Submitted	2025-09-13
SERVICES-REPORT-2025-9accd3	\N	\N	\N	\N	Completed installation of new security cameras	Reviewed	\N
SERVICES-REPORT-2025-7c2312	\N	\N	\N	\N	Checked for overheating issue and applied fix	Draft	2025-09-15
SERVICES-REPORT-2025-5c74be	\N	\N	\N	\N	Assisted with remote desktop configuration	Reviewed	2025-09-16
SERVICES-REPORT-2025-c2bb10	\N	\N	\N	\N	Performed regular maintenance on enterprise server	Submitted	\N
SERVICES-REPORT-2025-adfef6	\N	\N	\N	\N	Updated customer’s software licenses	Draft	2025-09-18
SERVICES-REPORT-2025-2819e7	\N	\N	\N	\N	Checked and repaired external storage drive	Reviewed	2025-09-19
SERVICES-REPORT-2025-cfca14	\N	\N	\N	\N	Advised customer on system upgrades	Submitted	\N
SERVICES-REPORT-2025-b94009	\N	\N	\N	\N	Routine maintenance check completed	Submitted	2025-09-01
SERVICES-REPORT-2025-fb87ff	\N	\N	\N	\N	Replaced faulty power supply	Reviewed	2025-09-02
SERVICES-REPORT-2025-b66689	\N	\N	\N	\N	Diagnosed network issue and provided solution	Draft	\N
SERVICES-REPORT-2025-a0a2af	\N	\N	\N	\N	Resolved software compatibility issue	Submitted	2025-09-04
SERVICES-REPORT-2025-d9390e	\N	\N	\N	\N	Customer requested additional inspection	Reviewed	\N
SERVICES-REPORT-2025-ec587b	\N	\N	\N	\N	Upgraded storage capacity on request	Draft	2025-09-06
SERVICES-REPORT-2025-e79153	\N	\N	\N	\N	Fixed printer connectivity issue	Reviewed	2025-09-07
SERVICES-REPORT-2025-ce34d1	\N	\N	\N	\N	Replaced defective laptop screen	Submitted	\N
SERVICES-REPORT-2025-1162a9	\N	\N	\N	\N	Carried out a complete system diagnostics	Draft	2025-09-09
SERVICES-REPORT-2025-a637d5	\N	\N	\N	\N	Provided training on security best practices	Submitted	2025-09-10
SERVICES-REPORT-2025-157725	\N	\N	\N	\N	Installed new software update	Reviewed	2025-09-11
SERVICES-REPORT-2025-43188f	\N	\N	\N	\N	Resolved customer complaint about slow system performance	Draft	\N
SERVICES-REPORT-2025-0a4a53	\N	\N	\N	\N	Reconfigured wireless network	Submitted	2025-09-13
SERVICES-REPORT-2025-37ee31	\N	\N	\N	\N	Completed installation of new security cameras	Reviewed	\N
SERVICES-REPORT-2025-e1401b	\N	\N	\N	\N	Checked for overheating issue and applied fix	Draft	2025-09-15
SERVICES-REPORT-2025-faa64d	\N	\N	\N	\N	Assisted with remote desktop configuration	Reviewed	2025-09-16
SERVICES-REPORT-2025-2132d5	\N	\N	\N	\N	Performed regular maintenance on enterprise server	Submitted	\N
SERVICES-REPORT-2025-9fcc31	\N	\N	\N	\N	Updated customer’s software licenses	Draft	2025-09-18
SERVICES-REPORT-2025-1a2546	\N	\N	\N	\N	Checked and repaired external storage drive	Reviewed	2025-09-19
SERVICES-REPORT-2025-29efd3	\N	\N	\N	\N	Advised customer on system upgrades	Submitted	\N
\.


--
-- Data for Name: service_request; Type: TABLE DATA; Schema: services; Owner: postgres
--

COPY services.service_request (service_request_id, service_call_id, request_date, customer_id, technician_id, request_type, request_status, request_description, request_remarks) FROM stdin;
SERVICES-SR-2025-3b49b7	\N	2025-06-01	\N	\N	Repair	Pending	Customer reported an issue with the device.	Waiting for approval
SERVICES-SR-2025-80a853	\N	2025-06-02	\N	\N	Installation	Approved	New installation request for office.	Scheduled for next week
SERVICES-SR-2025-b292eb	\N	2025-06-03	\N	\N	Maintenance	Rejected	Routine maintenance request.	Customer cancelled request
SERVICES-SR-2025-900394	\N	2025-06-04	\N	\N	Other	In Progress	General inquiry about service.	Assigned to technician
SERVICES-SR-2025-2e303c	\N	2025-06-05	\N	\N	Repair	Pending	Device is not turning on.	Waiting for spare parts
SERVICES-SR-2025-e0293e	\N	2025-06-06	\N	\N	Installation	Approved	Installation of security system.	Installation team assigned
SERVICES-SR-2025-b35ddf	\N	2025-06-07	\N	\N	Maintenance	In Progress	Quarterly maintenance check.	Technician on site
SERVICES-SR-2025-f97f20	\N	2025-06-08	\N	\N	Other	Pending	Customer wants a consultation.	Waiting for supervisor approval
SERVICES-SR-2025-b2a551	\N	2025-06-09	\N	\N	Repair	Rejected	Request for warranty repair.	Warranty expired
SERVICES-SR-2025-659409	\N	2025-06-10	\N	\N	Installation	Approved	Home automation installation.	Confirmed for installation
SERVICES-SR-2025-c3415c	\N	2025-06-11	\N	\N	Maintenance	Pending	Air conditioning system check.	Waiting for available slot
SERVICES-SR-2025-ffd301	\N	2025-06-12	\N	\N	Other	In Progress	Inquiry about service plans.	Transferred to sales team
SERVICES-SR-2025-d67890	\N	2025-06-13	\N	\N	Repair	Approved	Laptop screen replacement.	Parts ordered
SERVICES-SR-2025-2e63d8	\N	2025-06-14	\N	\N	Installation	Rejected	Request for additional cameras.	Not supported in package
SERVICES-SR-2025-9d653c	\N	2025-06-15	\N	\N	Maintenance	Pending	Preventive maintenance check.	Assigned for next month
SERVICES-SR-2025-14be47	\N	2025-06-16	\N	\N	Other	Approved	Customer inquiry about upgrade.	Follow-up required
SERVICES-SR-2025-34d24d	\N	2025-06-17	\N	\N	Repair	In Progress	Power supply issue.	Technician diagnosing issue
SERVICES-SR-2025-60a729	\N	2025-06-18	\N	\N	Installation	Pending	Smart lock installation.	Awaiting confirmation from customer
SERVICES-SR-2025-c895a5	\N	2025-06-19	\N	\N	Maintenance	Approved	HVAC system inspection.	Scheduled for maintenance
SERVICES-SR-2025-76904d	\N	2025-06-20	\N	\N	Other	Rejected	General support request.	Not within service scope
SERVICES-SR-2025-8b466c	\N	2025-06-01	\N	\N	Repair	Pending	Customer reported an issue with the device.	Waiting for approval
SERVICES-SR-2025-693d36	\N	2025-06-02	\N	\N	Installation	Approved	New installation request for office.	Scheduled for next week
SERVICES-SR-2025-11dd3a	\N	2025-06-03	\N	\N	Maintenance	Rejected	Routine maintenance request.	Customer cancelled request
SERVICES-SR-2025-038c9e	\N	2025-06-04	\N	\N	Other	In Progress	General inquiry about service.	Assigned to technician
SERVICES-SR-2025-c48029	\N	2025-06-05	\N	\N	Repair	Pending	Device is not turning on.	Waiting for spare parts
SERVICES-SR-2025-f3c241	\N	2025-06-06	\N	\N	Installation	Approved	Installation of security system.	Installation team assigned
SERVICES-SR-2025-fa9fe2	\N	2025-06-07	\N	\N	Maintenance	In Progress	Quarterly maintenance check.	Technician on site
SERVICES-SR-2025-bd8029	\N	2025-06-08	\N	\N	Other	Pending	Customer wants a consultation.	Waiting for supervisor approval
SERVICES-SR-2025-3ff15e	\N	2025-06-09	\N	\N	Repair	Rejected	Request for warranty repair.	Warranty expired
SERVICES-SR-2025-e2a235	\N	2025-06-10	\N	\N	Installation	Approved	Home automation installation.	Confirmed for installation
SERVICES-SR-2025-dc8028	\N	2025-06-11	\N	\N	Maintenance	Pending	Air conditioning system check.	Waiting for available slot
SERVICES-SR-2025-754626	\N	2025-06-12	\N	\N	Other	In Progress	Inquiry about service plans.	Transferred to sales team
SERVICES-SR-2025-5e352e	\N	2025-06-13	\N	\N	Repair	Approved	Laptop screen replacement.	Parts ordered
SERVICES-SR-2025-7799e4	\N	2025-06-14	\N	\N	Installation	Rejected	Request for additional cameras.	Not supported in package
SERVICES-SR-2025-5f9392	\N	2025-06-15	\N	\N	Maintenance	Pending	Preventive maintenance check.	Assigned for next month
SERVICES-SR-2025-890753	\N	2025-06-16	\N	\N	Other	Approved	Customer inquiry about upgrade.	Follow-up required
SERVICES-SR-2025-10f23c	\N	2025-06-17	\N	\N	Repair	In Progress	Power supply issue.	Technician diagnosing issue
SERVICES-SR-2025-5b892e	\N	2025-06-18	\N	\N	Installation	Pending	Smart lock installation.	Awaiting confirmation from customer
SERVICES-SR-2025-0d9090	\N	2025-06-19	\N	\N	Maintenance	Approved	HVAC system inspection.	Scheduled for maintenance
SERVICES-SR-2025-0f4bad	\N	2025-06-20	\N	\N	Other	Rejected	General support request.	Not within service scope
\.


--
-- Data for Name: service_ticket; Type: TABLE DATA; Schema: services; Owner: postgres
--

COPY services.service_ticket (service_ticket_id, ticket_id) FROM stdin;
SERVICES-TICKET-2025-b56295	\N
SERVICES-TICKET-2025-49545c	\N
SERVICES-TICKET-2025-e6e99e	\N
SERVICES-TICKET-2025-04c023	\N
SERVICES-TICKET-2025-69c282	\N
SERVICES-TICKET-2025-73518d	\N
SERVICES-TICKET-2025-6d89e1	\N
SERVICES-TICKET-2025-85d08f	\N
SERVICES-TICKET-2025-0e328d	\N
SERVICES-TICKET-2025-f5cd58	\N
SERVICES-TICKET-2025-144a60	\N
SERVICES-TICKET-2025-17a735	\N
SERVICES-TICKET-2025-3109ca	\N
SERVICES-TICKET-2025-12fe69	\N
SERVICES-TICKET-2025-eff3b3	\N
SERVICES-TICKET-2025-3ca891	\N
SERVICES-TICKET-2025-2fbd5f	\N
SERVICES-TICKET-2025-edf213	\N
SERVICES-TICKET-2025-8e13ea	\N
SERVICES-TICKET-2025-d3ebdf	\N
SERVICES-TICKET-2025-95f74d	\N
SERVICES-TICKET-2025-9e9e66	\N
SERVICES-TICKET-2025-448c79	\N
SERVICES-TICKET-2025-ff2448	\N
SERVICES-TICKET-2025-4abc5b	\N
SERVICES-TICKET-2025-558264	\N
SERVICES-TICKET-2025-770720	\N
SERVICES-TICKET-2025-2c32ea	\N
SERVICES-TICKET-2025-f0ecb1	\N
SERVICES-TICKET-2025-773435	\N
SERVICES-TICKET-2025-23f9b3	\N
SERVICES-TICKET-2025-f4fad7	\N
SERVICES-TICKET-2025-d9dd52	\N
SERVICES-TICKET-2025-7c6874	\N
SERVICES-TICKET-2025-70650c	\N
SERVICES-TICKET-2025-c53da6	\N
SERVICES-TICKET-2025-cb1a9c	\N
SERVICES-TICKET-2025-bf3971	\N
SERVICES-TICKET-2025-81c103	\N
SERVICES-TICKET-2025-b12d38	\N
\.


--
-- Data for Name: technician; Type: TABLE DATA; Schema: services; Owner: postgres
--

COPY services.technician (technician_id, employee_id) FROM stdin;
SERVICES-TECH-2025-e93062	\N
SERVICES-TECH-2025-b50541	\N
SERVICES-TECH-2025-d2aaac	\N
SERVICES-TECH-2025-afabe5	\N
SERVICES-TECH-2025-c21156	\N
SERVICES-TECH-2025-fa7152	\N
SERVICES-TECH-2025-beb1b4	\N
SERVICES-TECH-2025-a37eb3	\N
SERVICES-TECH-2025-b49897	\N
SERVICES-TECH-2025-e7b80d	\N
SERVICES-TECH-2025-9da258	\N
SERVICES-TECH-2025-498659	\N
SERVICES-TECH-2025-594a7a	\N
SERVICES-TECH-2025-423b82	\N
SERVICES-TECH-2025-2a2a57	\N
SERVICES-TECH-2025-34c675	\N
SERVICES-TECH-2025-7ec428	\N
SERVICES-TECH-2025-fcadf0	\N
SERVICES-TECH-2025-72a17a	\N
SERVICES-TECH-2025-5724a2	\N
SERVICES-TECH-2025-f60f37	\N
SERVICES-TECH-2025-671954	\N
SERVICES-TECH-2025-5eb9a0	\N
SERVICES-TECH-2025-85feea	\N
SERVICES-TECH-2025-3f37d0	\N
SERVICES-TECH-2025-afb57d	\N
SERVICES-TECH-2025-b58db6	\N
SERVICES-TECH-2025-30166e	\N
SERVICES-TECH-2025-30ca40	\N
SERVICES-TECH-2025-842d41	\N
SERVICES-TECH-2025-5a7e00	\N
SERVICES-TECH-2025-6b5997	\N
SERVICES-TECH-2025-831e25	\N
SERVICES-TECH-2025-4a8ab5	\N
SERVICES-TECH-2025-7cf554	\N
SERVICES-TECH-2025-521d8a	\N
SERVICES-TECH-2025-c088ea	\N
SERVICES-TECH-2025-7748dd	\N
SERVICES-TECH-2025-c88410	\N
SERVICES-TECH-2025-3bcf14	\N
\.


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

SELECT pg_catalog.setval('public.auth_permission_id_seq', 24, true);


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

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 260, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 24, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 18, true);


--
-- Name: chart_of_accounts chart_of_accounts_pkey; Type: CONSTRAINT; Schema: accounting; Owner: postgres
--

ALTER TABLE ONLY accounting.chart_of_accounts
    ADD CONSTRAINT chart_of_accounts_pkey PRIMARY KEY (account_code);


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
-- Name: return return_pkey; Type: CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.return
    ADD CONSTRAINT return_pkey PRIMARY KEY (return_id);


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
-- Name: management_approvals before_insert_management_approvals; Type: TRIGGER; Schema: management; Owner: postgres
--

CREATE TRIGGER before_insert_management_approvals BEFORE INSERT ON management.management_approvals FOR EACH ROW EXECUTE FUNCTION management.generate_approval_id();


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
-- Name: receipt before_insert_receipt; Type: TRIGGER; Schema: sales; Owner: postgres
--

CREATE TRIGGER before_insert_receipt BEFORE INSERT ON sales.receipt FOR EACH ROW EXECUTE FUNCTION sales.generate_receipt_id();


--
-- Name: renewal_warranty before_insert_renewal_warranty; Type: TRIGGER; Schema: sales; Owner: postgres
--

CREATE TRIGGER before_insert_renewal_warranty BEFORE INSERT ON sales.renewal_warranty FOR EACH ROW EXECUTE FUNCTION sales.generate_renewal_id();


--
-- Name: return before_insert_return; Type: TRIGGER; Schema: sales; Owner: postgres
--

CREATE TRIGGER before_insert_return BEFORE INSERT ON sales.return FOR EACH ROW EXECUTE FUNCTION sales.generate_return_id();


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
-- Name: product_pricing trg_calculate_product_pricing; Type: TRIGGER; Schema: sales; Owner: postgres
--

CREATE TRIGGER trg_calculate_product_pricing BEFORE INSERT OR UPDATE ON sales.product_pricing FOR EACH ROW EXECUTE FUNCTION public.calculate_product_pricing();


--
-- Name: customers trg_create_business_partner; Type: TRIGGER; Schema: sales; Owner: postgres
--

CREATE TRIGGER trg_create_business_partner AFTER INSERT ON sales.customers FOR EACH ROW EXECUTE FUNCTION public.create_business_partner();


--
-- Name: customers trg_create_gl_account; Type: TRIGGER; Schema: sales; Owner: postgres
--

CREATE TRIGGER trg_create_gl_account AFTER INSERT ON sales.customers FOR EACH ROW EXECUTE FUNCTION public.create_gl_account();


--
-- Name: payments trg_generate_sales_invoice; Type: TRIGGER; Schema: sales; Owner: postgres
--

CREATE TRIGGER trg_generate_sales_invoice AFTER UPDATE ON sales.payments FOR EACH ROW EXECUTE FUNCTION public.generate_sales_invoice();


--
-- Name: orders trg_insert_order_based_on_type; Type: TRIGGER; Schema: sales; Owner: postgres
--

CREATE TRIGGER trg_insert_order_based_on_type AFTER INSERT ON sales.orders FOR EACH ROW EXECUTE FUNCTION public.insert_order_based_on_type();


--
-- Name: orders trg_update_order_delivery_status; Type: TRIGGER; Schema: sales; Owner: postgres
--

CREATE TRIGGER trg_update_order_delivery_status AFTER UPDATE ON sales.orders FOR EACH ROW EXECUTE FUNCTION public.update_order_delivery_status();


--
-- Name: payments trg_update_order_invoice_status; Type: TRIGGER; Schema: sales; Owner: postgres
--

CREATE TRIGGER trg_update_order_invoice_status AFTER UPDATE ON sales.payments FOR EACH ROW EXECUTE FUNCTION public.update_order_invoice_status();


--
-- Name: statement_item trigger_update_demand_level; Type: TRIGGER; Schema: sales; Owner: postgres
--

CREATE TRIGGER trigger_update_demand_level AFTER INSERT OR DELETE OR UPDATE ON sales.statement_item FOR EACH ROW EXECUTE FUNCTION public.update_demand_level();


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
-- Name: service_ticket before_insert_service_ticket; Type: TRIGGER; Schema: services; Owner: postgres
--

CREATE TRIGGER before_insert_service_ticket BEFORE INSERT ON services.service_ticket FOR EACH ROW EXECUTE FUNCTION services.generate_service_ticket_id();


--
-- Name: technician before_insert_technician; Type: TRIGGER; Schema: services; Owner: postgres
--

CREATE TRIGGER before_insert_technician BEFORE INSERT ON services.technician FOR EACH ROW EXECUTE FUNCTION services.generate_technician_id();


--
-- Name: item_master_data fk_assets_item; Type: FK CONSTRAINT; Schema: admin; Owner: postgres
--

ALTER TABLE ONLY admin.item_master_data
    ADD CONSTRAINT fk_assets_item FOREIGN KEY (asset_id) REFERENCES admin.assets(asset_id) ON DELETE CASCADE;


--
-- Name: item_master_data fk_products_item; Type: FK CONSTRAINT; Schema: admin; Owner: postgres
--

ALTER TABLE ONLY admin.item_master_data
    ADD CONSTRAINT fk_products_item FOREIGN KEY (product_id) REFERENCES admin.products(product_id) ON DELETE CASCADE;


--
-- Name: item_master_data fk_raw_materials_item; Type: FK CONSTRAINT; Schema: admin; Owner: postgres
--

ALTER TABLE ONLY admin.item_master_data
    ADD CONSTRAINT fk_raw_materials_item FOREIGN KEY (material_id) REFERENCES admin.raw_materials(material_id) ON DELETE CASCADE;


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
-- Name: shipment_details fk_shipment_details_failed_shipment; Type: FK CONSTRAINT; Schema: distribution; Owner: postgres
--

ALTER TABLE ONLY distribution.shipment_details
    ADD CONSTRAINT fk_shipment_details_failed_shipment FOREIGN KEY (failed_shipment_id) REFERENCES distribution.failed_shipment(failed_shipment_id);


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
-- Name: external_module fk_external_module_deprecation_report; Type: FK CONSTRAINT; Schema: operations; Owner: postgres
--

ALTER TABLE ONLY operations.external_module
    ADD CONSTRAINT fk_external_module_deprecation_report FOREIGN KEY (deprecation_report_id) REFERENCES inventory.deprecation_report(deprecation_report_id) ON DELETE SET NULL;


--
-- Name: product_document_items fk_product_document_items_serial; Type: FK CONSTRAINT; Schema: operations; Owner: postgres
--

ALTER TABLE ONLY operations.product_document_items
    ADD CONSTRAINT fk_product_document_items_serial FOREIGN KEY (serial_id) REFERENCES operations.serial_tracking(serial_id);


--
-- Name: production_orders_header fk_production_orders_project; Type: FK CONSTRAINT; Schema: production; Owner: postgres
--

ALTER TABLE ONLY production.production_orders_header
    ADD CONSTRAINT fk_production_orders_project FOREIGN KEY (task_id) REFERENCES project_management.external_project_task_list(task_id);


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
-- Name: purchase_requests fk_material; Type: FK CONSTRAINT; Schema: purchasing; Owner: postgres
--

ALTER TABLE ONLY purchasing.purchase_requests
    ADD CONSTRAINT fk_material FOREIGN KEY (material_id) REFERENCES admin.raw_materials(material_id) ON DELETE CASCADE;


--
-- Name: return fk_return_shipping_id; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.return
    ADD CONSTRAINT fk_return_shipping_id FOREIGN KEY (shipping_id) REFERENCES sales.shipping_details(shipping_id) ON DELETE CASCADE;


--
-- Name: return fk_return_statement_id; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.return
    ADD CONSTRAINT fk_return_statement_id FOREIGN KEY (statement_id) REFERENCES sales.statement(statement_id) ON DELETE CASCADE;


--
-- Name: product_pricing fk_sales_pp_admin_product_id; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.product_pricing
    ADD CONSTRAINT fk_sales_pp_admin_product_id FOREIGN KEY (admin_product_id) REFERENCES admin.products(product_id) ON DELETE CASCADE;


--
-- Name: shipping_details fk_shipping_details_statement_id; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.shipping_details
    ADD CONSTRAINT fk_shipping_details_statement_id FOREIGN KEY (statement_id) REFERENCES sales.statement(statement_id) ON DELETE CASCADE;


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
-- Name: TABLE product_pricing; Type: ACL; Schema: sales; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE sales.product_pricing TO erp_user;


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
-- Name: TABLE return; Type: ACL; Schema: sales; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE sales.return TO erp_user;


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


DROP FUNCTION IF EXISTS @extschema@.alter_job(
    INTEGER,
    INTERVAL,
    INTERVAL,
    INTEGER,
    INTERVAL,
    BOOL,
    JSONB,
    TIMESTAMPTZ,
    BOOL,
    REGPROC,
    BOOL,
    TIMESTAMPTZ,
    TEXT
);

CREATE FUNCTION @extschema@.alter_job(
    job_id INTEGER,
    schedule_interval INTERVAL = NULL,
    max_runtime INTERVAL = NULL,
    max_retries INTEGER = NULL,
    retry_period INTERVAL = NULL,
    scheduled BOOL = NULL,
    config JSONB = NULL,
    next_start TIMESTAMPTZ = NULL,
    if_exists BOOL = FALSE,
    check_config REGPROC = NULL
)
RETURNS TABLE (job_id INTEGER, schedule_interval INTERVAL, max_runtime INTERVAL, max_retries INTEGER, retry_period INTERVAL, scheduled BOOL, config JSONB,
next_start TIMESTAMPTZ, check_config TEXT)
AS '@MODULE_PATHNAME@', 'ts_job_alter'
LANGUAGE C VOLATILE;

ALTER FUNCTION _timescaledb_functions.insert_blocker() SET SCHEMA _timescaledb_internal;
ALTER FUNCTION _timescaledb_functions.continuous_agg_invalidation_trigger() SET SCHEMA _timescaledb_internal;
ALTER FUNCTION _timescaledb_functions.drop_dist_ht_invalidation_trigger(integer) SET SCHEMA _timescaledb_internal;
ALTER FUNCTION _timescaledb_functions.get_create_command(name) SET SCHEMA _timescaledb_internal;

ALTER FUNCTION _timescaledb_functions.to_unix_microseconds(timestamptz) SET SCHEMA _timescaledb_internal;
ALTER FUNCTION _timescaledb_functions.to_timestamp(bigint) SET SCHEMA _timescaledb_internal;
ALTER FUNCTION _timescaledb_functions.to_timestamp_without_timezone(bigint) SET SCHEMA _timescaledb_internal;
ALTER FUNCTION _timescaledb_functions.to_date(bigint) SET SCHEMA _timescaledb_internal;
ALTER FUNCTION _timescaledb_functions.to_interval(bigint) SET SCHEMA _timescaledb_internal;
ALTER FUNCTION _timescaledb_functions.interval_to_usec(interval) SET SCHEMA _timescaledb_internal;
ALTER FUNCTION _timescaledb_functions.time_to_internal(anyelement) SET SCHEMA _timescaledb_internal;
ALTER FUNCTION _timescaledb_functions.subtract_integer_from_now(regclass, bigint) SET SCHEMA _timescaledb_internal;

ALTER FUNCTION _timescaledb_functions.set_dist_id(uuid) SET SCHEMA _timescaledb_internal;
ALTER FUNCTION _timescaledb_functions.set_peer_dist_id(uuid) SET SCHEMA _timescaledb_internal;
ALTER FUNCTION _timescaledb_functions.validate_as_data_node() SET SCHEMA _timescaledb_internal;
ALTER FUNCTION _timescaledb_functions.show_connection_cache() SET SCHEMA _timescaledb_internal;
ALTER FUNCTION _timescaledb_functions.ping_data_node(name, interval) SET SCHEMA _timescaledb_internal;
ALTER FUNCTION _timescaledb_functions.remote_txn_heal_data_node(oid) SET SCHEMA _timescaledb_internal;

ALTER FUNCTION _timescaledb_functions.relation_size(regclass) SET SCHEMA _timescaledb_internal;
ALTER FUNCTION _timescaledb_functions.data_node_hypertable_info(name, name, name) SET SCHEMA _timescaledb_internal;
ALTER FUNCTION _timescaledb_functions.data_node_chunk_info(name, name, name) SET SCHEMA _timescaledb_internal;
ALTER FUNCTION _timescaledb_functions.hypertable_local_size(name, name) SET SCHEMA _timescaledb_internal;
ALTER FUNCTION _timescaledb_functions.hypertable_remote_size(name, name) SET SCHEMA _timescaledb_internal;
ALTER FUNCTION _timescaledb_functions.chunks_local_size(name, name) SET SCHEMA _timescaledb_internal;
ALTER FUNCTION _timescaledb_functions.chunks_remote_size(name, name) SET SCHEMA _timescaledb_internal;
ALTER FUNCTION _timescaledb_functions.range_value_to_pretty(bigint, regtype) SET SCHEMA _timescaledb_internal;
ALTER FUNCTION _timescaledb_functions.get_approx_row_count(regclass) SET SCHEMA _timescaledb_internal;
ALTER FUNCTION _timescaledb_functions.data_node_compressed_chunk_stats(name, name, name) SET SCHEMA _timescaledb_internal;
ALTER FUNCTION _timescaledb_functions.compressed_chunk_local_stats(name, name) SET SCHEMA _timescaledb_internal;
ALTER FUNCTION _timescaledb_functions.compressed_chunk_remote_stats(name, name) SET SCHEMA _timescaledb_internal;
ALTER FUNCTION _timescaledb_functions.indexes_local_size(name, name) SET SCHEMA _timescaledb_internal;
ALTER FUNCTION _timescaledb_functions.data_node_index_size(name, name, name) SET SCHEMA _timescaledb_internal;
ALTER FUNCTION _timescaledb_functions.indexes_remote_size(name, name, name) SET SCHEMA _timescaledb_internal;

ALTER FUNCTION _timescaledb_functions.generate_uuid() SET SCHEMA _timescaledb_internal;
ALTER FUNCTION _timescaledb_functions.get_git_commit() SET SCHEMA _timescaledb_internal;
ALTER FUNCTION _timescaledb_functions.get_os_info() SET SCHEMA _timescaledb_internal;
ALTER FUNCTION _timescaledb_functions.tsl_loaded() SET SCHEMA _timescaledb_internal;

ALTER FUNCTION _timescaledb_functions.calculate_chunk_interval(int, bigint, bigint) SET SCHEMA _timescaledb_internal;
ALTER FUNCTION _timescaledb_functions.chunk_status(regclass) SET SCHEMA _timescaledb_internal;
ALTER FUNCTION _timescaledb_functions.chunks_in(record, integer[]) SET SCHEMA _timescaledb_internal;
ALTER FUNCTION _timescaledb_functions.chunk_id_from_relid(oid) SET SCHEMA _timescaledb_internal;
ALTER FUNCTION _timescaledb_functions.show_chunk(regclass) SET SCHEMA _timescaledb_internal;
ALTER FUNCTION _timescaledb_functions.create_chunk(regclass, jsonb, name, name, regclass) SET SCHEMA _timescaledb_internal;
ALTER FUNCTION _timescaledb_functions.set_chunk_default_data_node(regclass, name) SET SCHEMA _timescaledb_internal;
ALTER FUNCTION _timescaledb_functions.get_chunk_relstats(regclass) SET SCHEMA _timescaledb_internal;
ALTER FUNCTION _timescaledb_functions.get_chunk_colstats(regclass) SET SCHEMA _timescaledb_internal;
ALTER FUNCTION _timescaledb_functions.create_chunk_table(regclass, jsonb, name, name) SET SCHEMA _timescaledb_internal;
ALTER FUNCTION _timescaledb_functions.freeze_chunk(regclass) SET SCHEMA _timescaledb_internal;
ALTER FUNCTION _timescaledb_functions.unfreeze_chunk(regclass) SET SCHEMA _timescaledb_internal;
ALTER FUNCTION _timescaledb_functions.drop_chunk(regclass) SET SCHEMA _timescaledb_internal;
ALTER FUNCTION _timescaledb_functions.attach_osm_table_chunk(regclass, regclass) SET SCHEMA _timescaledb_internal;

UPDATE _timescaledb_catalog.hypertable SET chunk_sizing_func_schema = '_timescaledb_internal' WHERE chunk_sizing_func_schema = '_timescaledb_functions' AND chunk_sizing_func_name = 'calculate_chunk_interval';

ALTER FUNCTION _timescaledb_functions.policy_compression_check(jsonb) SET SCHEMA _timescaledb_internal;
ALTER PROCEDURE _timescaledb_functions.policy_compression_execute(integer,integer,anyelement,integer,boolean,boolean) SET SCHEMA _timescaledb_internal;
ALTER PROCEDURE _timescaledb_functions.policy_compression(integer,jsonb) SET SCHEMA _timescaledb_internal;
ALTER FUNCTION _timescaledb_functions.policy_job_error_retention_check(jsonb) SET SCHEMA _timescaledb_internal;
ALTER FUNCTION _timescaledb_functions.policy_job_error_retention(integer,jsonb) SET SCHEMA _timescaledb_internal;
ALTER PROCEDURE _timescaledb_functions.policy_recompression(integer,jsonb) SET SCHEMA _timescaledb_internal;
ALTER FUNCTION _timescaledb_functions.policy_refresh_continuous_aggregate_check(jsonb) SET SCHEMA _timescaledb_internal;
ALTER PROCEDURE _timescaledb_functions.policy_refresh_continuous_aggregate(integer,jsonb) SET SCHEMA _timescaledb_internal;
ALTER FUNCTION _timescaledb_functions.policy_reorder_check(jsonb) SET SCHEMA _timescaledb_internal;
ALTER PROCEDURE _timescaledb_functions.policy_reorder(integer,jsonb) SET SCHEMA _timescaledb_internal;
ALTER FUNCTION _timescaledb_functions.policy_retention_check(jsonb) SET SCHEMA _timescaledb_internal;
ALTER PROCEDURE _timescaledb_functions.policy_retention(integer,jsonb) SET SCHEMA _timescaledb_internal;

UPDATE _timescaledb_config.bgw_job SET proc_schema = '_timescaledb_internal' WHERE proc_schema = '_timescaledb_functions';
UPDATE _timescaledb_config.bgw_job SET check_schema = '_timescaledb_internal' WHERE check_schema = '_timescaledb_functions';

ALTER FUNCTION _timescaledb_functions.cagg_migrate_plan_exists(INTEGER) SET SCHEMA _timescaledb_internal;
ALTER FUNCTION _timescaledb_functions.cagg_migrate_pre_validation(TEXT, TEXT, TEXT) SET SCHEMA _timescaledb_internal;
ALTER PROCEDURE _timescaledb_functions.cagg_migrate_create_plan(_timescaledb_catalog.continuous_agg, TEXT, BOOLEAN, BOOLEAN) SET SCHEMA _timescaledb_internal;
ALTER PROCEDURE _timescaledb_functions.cagg_migrate_execute_create_new_cagg(_timescaledb_catalog.continuous_agg, _timescaledb_catalog.continuous_agg_migrate_plan_step) SET SCHEMA _timescaledb_internal;
ALTER PROCEDURE _timescaledb_functions.cagg_migrate_execute_disable_policies(_timescaledb_catalog.continuous_agg, _timescaledb_catalog.continuous_agg_migrate_plan_step) SET SCHEMA _timescaledb_internal;
ALTER PROCEDURE _timescaledb_functions.cagg_migrate_execute_enable_policies(_timescaledb_catalog.continuous_agg, _timescaledb_catalog.continuous_agg_migrate_plan_step) SET SCHEMA _timescaledb_internal;
ALTER PROCEDURE _timescaledb_functions.cagg_migrate_execute_copy_policies(_timescaledb_catalog.continuous_agg, _timescaledb_catalog.continuous_agg_migrate_plan_step) SET SCHEMA _timescaledb_internal;
ALTER PROCEDURE _timescaledb_functions.cagg_migrate_execute_refresh_new_cagg(_timescaledb_catalog.continuous_agg, _timescaledb_catalog.continuous_agg_migrate_plan_step) SET SCHEMA _timescaledb_internal;
ALTER PROCEDURE _timescaledb_functions.cagg_migrate_execute_copy_data(_timescaledb_catalog.continuous_agg, _timescaledb_catalog.continuous_agg_migrate_plan_step) SET SCHEMA _timescaledb_internal;
ALTER PROCEDURE _timescaledb_functions.cagg_migrate_execute_override_cagg(_timescaledb_catalog.continuous_agg, _timescaledb_catalog.continuous_agg_migrate_plan_step) SET SCHEMA _timescaledb_internal;
ALTER PROCEDURE _timescaledb_functions.cagg_migrate_execute_drop_old_cagg(_timescaledb_catalog.continuous_agg, _timescaledb_catalog.continuous_agg_migrate_plan_step) SET SCHEMA _timescaledb_internal;
ALTER PROCEDURE _timescaledb_functions.cagg_migrate_execute_plan(_timescaledb_catalog.continuous_agg) SET SCHEMA _timescaledb_internal;

-- pre-update of previous version will have created an additional copy of restart_background_workers
-- since restart_background_workers was handled differently from other functions in previous versions
DROP FUNCTION _timescaledb_internal.restart_background_workers();
ALTER FUNCTION _timescaledb_functions.start_background_workers() SET SCHEMA _timescaledb_internal;
ALTER FUNCTION _timescaledb_functions.stop_background_workers() SET SCHEMA _timescaledb_internal;
ALTER FUNCTION _timescaledb_functions.restart_background_workers() SET SCHEMA _timescaledb_internal;
ALTER FUNCTION _timescaledb_functions.alter_job_set_hypertable_id(integer,regclass) SET SCHEMA _timescaledb_internal;


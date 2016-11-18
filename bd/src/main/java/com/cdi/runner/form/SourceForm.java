package com.cdi.runner.form;

import com.cdi.runner.util.ParsableKeyVal;

public class SourceForm {
	
	
	
    @ParsableKeyVal(srcName="ingestion")
	private String  sourcename;
    @ParsableKeyVal(srcName="ingestion")
	private String  SRC;
    public String getSRC() {
		return SRC;
	}

	public void setSRC(String sRC) {
		SRC = sRC;
	}
	@ParsableKeyVal(srcName="ingestion")
	private String validate_header_footer_flag;
    @ParsableKeyVal(srcName="ingestion")
    private String quarantine_flag;
    @ParsableKeyVal(srcName="ingestion")
	private String encoding_flag; 
    @ParsableKeyVal(srcName="ingestion")
	private String archive_flag; 
	@ParsableKeyVal(srcName="ingestion")
	private String file_name_pattern; 
	@ParsableKeyVal(srcName="ingestion")
	private String original_file_encoding; 
	@ParsableKeyVal(srcName="ingestion")
	private String quarantine_file_system; 
	@ParsableKeyVal(srcName="ingestion")
	private String output_compression; 
	@ParsableKeyVal(srcName="ingestion")
	private String output_file_type; 
	@ParsableKeyVal(srcName="ingestion")
	private String output_compression_type; 
	@ParsableKeyVal(srcName="ingestion")
	private String LOG_LEVEL; 
	@ParsableKeyVal(srcName="ingestion")
	private String error_log_retention_days; 
	@ParsableKeyVal(srcName="ingestion")
	private String info_log_retention_days; 
	@ParsableKeyVal(srcName="ingestion")
	private String audit_log_retention_days; 
	@ParsableKeyVal(srcName="ingestion")
	private String max_files_limit_to_combine; 
	@ParsableKeyVal(srcName="ingestion")
	private String min_files_limit_to_combine; 
	@ParsableKeyVal(srcName="ingestion")
	private String min_total_file_size; 

	//default attribute for ingestion 
	@ParsableKeyVal(srcName="ingestion")
	private String input_path="/ingestion/${ENV}/data/${SRC}/in";
	@ParsableKeyVal(srcName="ingestion")
	private String	output_path="/ingestion/${ENV}/data/${SRC}/out";
	@ParsableKeyVal(srcName="ingestion")
	private String temporary_path="/ingestion/${ENV}/data/${SRC}/tmp";
	@ParsableKeyVal(srcName="ingestion")
	private String failed_path="/ingestion/${ENV}/data/${SRC}/failed";

			
	//default attribute for ingestion 
	@ParsableKeyVal(srcName="ingestion")
	private String   quarantine_path="${HADOOP_BASE_DIR}/${ENV}/stage/${SRC}/quarantine";
	@ParsableKeyVal(srcName="ingestion")
	private String		hdfs_dest="${HADOOP_BASE_DIR}/${ENV}/stage/${SRC}/calldata";
	@ParsableKeyVal(srcName="ingestion")
	private String audit_hdfs_path="${HADOOP_BASE_DIR}/${ENV}/stage/ingestion_audit";
	@ParsableKeyVal(srcName="ingestion")
	private String archive_hdfs_path="${HADOOP_BASE_DIR}/${ENV}/archive/${SRC}";
	
	@ParsableKeyVal(srcName="headerfooter")
	private String file_header;
	@ParsableKeyVal(srcName="headerfooter")
	private String file_footer;
	
	@ParsableKeyVal(srcName="hiveloader")
	private String stage_script; 
	
	
	public String getFile_header() {
		return file_header;
	}

	public void setFile_header(String file_header) {
		this.file_header = file_header;
	}

	public String getFile_footer() {
		return file_footer;
	}

	public void setFile_footer(String file_footer) {
		this.file_footer = file_footer;
	}

	public void setStage_script(String stage_script) {
		this.stage_script = stage_script;
	}
	
	public String getStage_script() {
		return stage_script;
	}
	public String getSourcename() {
		return sourcename;
	}
	public void setSourcename(String sourcename) {
		this.sourcename = sourcename;
		this.setSRC(sourcename);
	}
	public String getValidate_header_footer_flag() {
		return validate_header_footer_flag;
	}
	public void setValidate_header_footer_flag(String validate_header_footer_flag) {
		this.validate_header_footer_flag = validate_header_footer_flag;
	}
	public String getQuarantine_flag() {
		return quarantine_flag;
	}
	public void setQuarantine_flag(String quarantine_flag) {
		this.quarantine_flag = quarantine_flag;
	}
	public String getEncoding_flag() {
		return encoding_flag;
	}
	public void setEncoding_flag(String encoding_flag) {
		this.encoding_flag = encoding_flag;
	}
	public String getArchive_flag() {
		return archive_flag;
	}
	public void setArchive_flag(String archive_flag) {
		this.archive_flag = archive_flag;
	}
	public String getFile_name_pattern() {
		return file_name_pattern;
	}
	public void setFile_name_pattern(String file_name_pattern) {
		this.file_name_pattern = file_name_pattern;
	}
	public String getOriginal_file_encoding() {
		return original_file_encoding;
	}
	public void setOriginal_file_encoding(String original_file_encoding) {
		this.original_file_encoding = original_file_encoding;
	}
	public String getQuarantine_file_system() {
		return quarantine_file_system;
	}
	public void setQuarantine_file_system(String quarantine_file_system) {
		this.quarantine_file_system = quarantine_file_system;
	}
	public String getOutput_compression() {
		return output_compression;
	}
	public void setOutput_compression(String output_compression) {
		this.output_compression = output_compression;
	}
	public String getOutput_file_type() {
		return output_file_type;
	}
	public void setOutput_file_type(String output_file_type) {
		this.output_file_type = output_file_type;
	}
	public String getOutput_compression_type() {
		return output_compression_type;
	}
	public void setOutput_compression_type(String output_compression_type) {
		this.output_compression_type = output_compression_type;
	}
	public String getLOG_LEVEL() {
		return LOG_LEVEL;
	}
	public void setLOG_LEVEL(String lOG_LEVEL) {
		LOG_LEVEL = lOG_LEVEL;
	}
	public String getError_log_retention_days() {
		return error_log_retention_days;
	}
	public void setError_log_retention_days(String error_log_retention_days) {
		this.error_log_retention_days = error_log_retention_days;
	}
	public String getInfo_log_retention_days() {
		return info_log_retention_days;
	}
	public void setInfo_log_retention_days(String info_log_retention_days) {
		this.info_log_retention_days = info_log_retention_days;
	}
	public String getAudit_log_retention_days() {
		return audit_log_retention_days;
	}
	public void setAudit_log_retention_days(String audit_log_retention_days) {
		this.audit_log_retention_days = audit_log_retention_days;
	}
	public String getMax_files_limit_to_combine() {
		return max_files_limit_to_combine;
	}
	public void setMax_files_limit_to_combine(String max_files_limit_to_combine) {
		this.max_files_limit_to_combine = max_files_limit_to_combine;
	}
	public String getMin_files_limit_to_combine() {
		return min_files_limit_to_combine;
	}
	public void setMin_files_limit_to_combine(String min_files_limit_to_combine) {
		this.min_files_limit_to_combine = min_files_limit_to_combine;
	}
	public String getMin_total_file_size() {
		return min_total_file_size;
	}
	public void setMin_total_file_size(String min_total_file_size) {
		this.min_total_file_size = min_total_file_size;
	}

	
}

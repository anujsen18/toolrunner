<legend>ingestion  Details::</legend>
		                      
		                      
		                            
		                           
		                        
		                      
		                        <div class="col-md-6 form-group">
		                                 <label for="validate_header_footer_flag"> Validate Header Footer</label><br>
		                               <input type="radio"   name="validate_header_footer_flag" id="validate_header_footer_flag"   value="false"> False
		                               
		                                &nbsp;  <input type="radio"   name="validate_header_footer_flag" id="validate_header_footer_flag"  value="true" checked> True
		  								
		                               
		                            </div>
		                            
		                             <div class="col-md-6 form-group">
		                                <label for="quarantine_flag"> Enable Quarantine</label><br>
		                              <input type="radio"   name="quarantine_flag" id="quarantine_flag"   value="false"> False
		                                 &nbsp; <input type="radio"   name="quarantine_flag" id="quarantine_flag"  value="true" checked> True
		  								
		                               
		                               
		                            </div>
		                            
		                             <div class="col-md-6 form-group">
		                                <label for="encoding_flag">Enable Encoding check</label><br>
		                                
		  								<input type="radio"   name="encoding_flag" id="encoding_flag"   value="false"> False
		                                &nbsp; <input type="radio"   name="encoding_flag" id="encoding_flag"  value="true" checked> True
		                               
		                            </div>
		                            
		                            
		                             <div class="col-md-6 form-group">
		                                <label for="archive_flag"> Enable Archival</label><br>
		                                <input type="radio"   name="archive_flag" id="archive_flag"   value="false"> False
		                                &nbsp; <input type="radio"   name="archive_flag" id="archive_flag"  value="true" checked> True
		  								
		                               
		                               
		                            </div>
		
		
							
							
							<div class="col-md-6 form-group">
									<label for="file_header">Reg Exp for file header</label> <input
										type="text" name="file_header" class="form-control"
										id="file_header" placeholder="Reg Exp for file pattern" />
								</div>
								
								
								<div class="col-md-6 form-group">
									<label for="file_footer">Reg Exp for file footer</label> <input
										type="text" name="file_footer" class="form-control"
										id="file_footer" placeholder="Reg Exp for file footer" />
								</div>
		
		
								<div class="col-md-6 form-group">
									<label for="file_name_pattern">Reg Exp for file pattern</label> <input
										type="text" name="file_name_pattern" class="form-control"
										id="file_name_pattern" placeholder="Reg Exp for file pattern" />
								</div>
		
								<div class="col-md-6 form-group">
									<label for="original_file_encoding">Original file
										Encoding</label> <input type="text" name="original_file_encoding"
										class="form-control" id="original_file_encoding"
										placeholder="Original file Encoding" />
								</div>
		
								<div class="col-md-6 form-group">
									<label for="quarantine_file_system">file System for Quarantine</label> 
									<input type="text" name="quarantine_file_system"
										class="form-control" id="quarantine_file_system"
										placeholder="HDFS or Local" />
								</div>
		
								<div class="col-md-6 form-group">
									<label for="output_compression">Output compression</label> 
									<select
										id="output_compression" name="output_compression"
										class="form-control">
										<option value="none">select a value</option>
										<option value="GZip">GZip</option>
										<option value="snappy">snappy</option>
										<option value="Lzo">Lzo</option>
									</select>
		
								</div>
		                       	<div class="col-md-6 form-group">
									<label for="output_file_type">Output compression Type</label> <select
										id="output_compression_type" name="output_compression_type"
										class="form-control">
										<option value="none">select a value</option>
										<option value="BLOCK">BLOCK</option>
										<option value="RECORD">RECORD</option>
		
									</select>
		
								</div>
		
								<div class="col-md-6 form-group">
									<label for="output_file_type">Output File Type</label> <select
										id="output_file_type" name="output_file_type"
										class="form-control">
										<option value="none">select a value</option>
										<option value="text">Text</option>
										<option value="sequence">Sequence</option>
		
									</select>
		
								</div>
		
		
		 logging attribute start
								<div class="col-md-6 form-group">
									<label for="LOG_LEVEL">Log Level</label> <select id="LOG_LEVEL"
										name="LOG_LEVEL" class="form-control">
										<option value="none">select a value</option>
										<option value="DEBUG">DEBUG</option>
										<option value="INFO">INFO</option>
										<option value="ERROR">ERROR</option>
		
									</select>
		
								</div>
		
		
		
		
								<div class="col-md-6 form-group">
									<label for="error_log_retention_days">No of Days for
										ERROR log Retention for </label> <input type="text"
										name="error_log_retention_days" class="form-control"
										id="error_log_retention_days"
										placeholder="No of Days for log Retention" />
								</div>
		
								<div class="col-md-6 form-group">
									<label for="info_log_retention_days">No of Days for INFO
										log Retention for</label> <input type="text"
										name="info_log_retention_days" class="form-control"
										id="info_log_retention_days"
										placeholder="No of Days for log Retention" />
								</div>
		
								<div class="col-md-6 form-group">
									<label for="audit_log_retention_days">No of Days for
										AUDIT log Retention for</label> <input type="text"
										name="audit_log_retention_days" class="form-control"
										id="audit_log_retention_days"
										placeholder="No of Days for log Retention" />
								</div>
		
		
								logging attribute end
		
								<div class="col-md-6 form-group">
									<label for="max_files_limit_to_combine">Maximum Files
										Limit to Combine</label> <input type="text"
										name="max_files_limit_to_combine" class="form-control"
										id="max_files_limit_to_combine"
										placeholder="Max Files Limit to Combine" />
								</div>
		
								<div class="col-md-6 form-group">
									<label for="min_files_limit_to_combine">Minimum Files
										Limit to Combine</label> <input type="text"
										name="min_files_limit_to_combine" class="form-control"
										id="min_files_limit_to_combine"
										placeholder="No of Days for log Retention" />
								</div>
		
								<div class="col-md-6 form-group">
									<label for="min_total_file_size">Minimum Total Files
										Limit size </label> <input type="text" name="min_total_file_size"
										class="form-control" id="min_total_file_size"
										placeholder="No of Days for log Retention" />
								</div>
		
		
							
								
		</fieldset>	
<legend>ingestion  Details::</legend>
<div class="col-md-6 form-group">
	<label for="inputRootDir">Directory to Archive:</label><br>
	<input type="text" name="inputRootDir" class="form-control"
		id="inputRootDir" placeholder="inputRootDir " />
</div>
<div class="col-md-6 form-group">
	<label for="inputGlobPattern">Pattern of file:</label><br>
	<input type="text" name="inputGlobPattern" class="form-control"
		id="inputGlobPattern" placeholder="inputGlobPattern " />
</div>
<div class="col-md-6 form-group">
	<label for="inputFileNameFilterRegex">Regex for selecting files </label><br>
	<input type="text" name="inputFileNameFilterRegex" class="form-control"
		id="inputFileNameFilterRegex" placeholder="inputFileNameFilterRegex " />
</div>
<div class="col-md-6 form-group">
	<label for="inputDataType">Input Data Format </label><br>
	<select name="inputDataType" class="form-control" id="inputDataType">
		<option value="none">select a value</option>
		<option value="text ">text</option>
		<option value=" sequence">sequence</option>
	</select>
</div>
<div class="col-md-6 form-group">
	<label for="inputCharacterSet">Character Set </label><br>
	<input type="text" name="inputCharacterSet" class="form-control"
		id="inputCharacterSet" placeholder="inputCharacterSet " />
</div>
<div class="col-md-6 form-group">
	<label for="inputDirClosedFlag">Input Directory closed Flag</label><br>
	<input type="text" name="inputDirClosedFlag" class="form-control"
		id="inputDirClosedFlag" placeholder="inputDirClosedFlag " />
</div>
<div class="col-md-6 form-group">
	<label for="inputDirClosedFlagFile">File suffix for closed
		file </label><br>
	<input type="text" name="inputDirClosedFlagFile" class="form-control"
		id="inputDirClosedFlagFile" placeholder="inputDirClosedFlagFile " />
</div>
<div class="col-md-6 form-group">
	<label for="inputSplitSizeBytes">Bytes for Archive</label><br>
	<input type="text" name="inputSplitSizeBytes" class="form-control"
		id="inputSplitSizeBytes" placeholder="inputSplitSizeBytes " />
</div>
<div class="col-md-6 form-group">
	<label for="oozieLauncherJobHeapSizeMb">Size in Mb for Archive</label><br>
	<input type="text" name="oozieLauncherJobHeapSizeMb"
		class="form-control" id="oozieLauncherJobHeapSizeMb"
		placeholder="oozieLauncherJobHeapSizeMb " />
</div>
<div class="col-md-6 form-group">
	<label for="sequenceFileMapperHeapMb">Sequence File Mapper Heap Mb</label><br>
	<input type="text" name="sequenceFileMapperHeapMb" class="form-control"
		id="sequenceFileMapperHeapMb" placeholder="sequenceFileMapperHeapMb " />
</div>
<div class="col-md-6 form-group">
	<label for="outputArchiveRootDir">Dir for Archive</label><br>
	<input type="text" name="outputArchiveRootDir" class="form-control"
		id="outputArchiveRootDir" placeholder="outputArchiveRootDir " />
</div>
<div class="col-md-6 form-group">
	<label for="outputStorageFormat">Format for Archive</label><br>
	<select name="outputStorageFormat" class="form-control"
		id="outputStorageFormat">
		<option value="none">select a value</option>
		<option value="text ">text</option>
		<option value="sequence">sequence</option>
	</select>
</div>
<div class="col-md-6 form-group">
	<label for="outputStorageCompression">Compression for Archive</label><br>
	<input type="radio" name="outputStorageCompression"
		id="outputStorageCompression" value="true " />true &nbsp; 
		<input
		type="radio" name="outputStorageCompression"
		id="outputStorageCompression" value=" false" /> false 
</div>
<div class="col-md-6 form-group">
	<label for="outputStorageCompressionType">Type for Archive</label><br>
	<select name="outputStorageCompressionType" class="form-control"
		id="outputStorageCompressionType">
		<option value="none">select a value</option>
		<option value="BLOCK">BLOCK</option>
		<option value="RECORD">RECORD</option>
	</select>
</div>
<div class="col-md-6 form-group">
	<label for="outputStorageCompressionCodec">Codec for Archive</label><br>
	<select name="outputStorageCompressionCodec" class="form-control"
		id="outputStorageCompressionCodec">
		<option value="none">select a value</option>
		<option value="Gzip">Gzip</option>
	</select>
</div>
<div class="col-md-6 form-group">
	<label for="archiveThresholdType">Type for Archive</label><br>
	<input type="text" name="archiveThresholdType" class="form-control"
		id="archiveThresholdType" placeholder="archiveThresholdType " />
</div>
<div class="col-md-6 form-group">
	<label for="archiveThresholdValue">Value for Archive</label><br>
	<input type="text" name="archiveThresholdValue" class="form-control"
		id="archiveThresholdValue" placeholder="archiveThresholdValue " />
</div>
<div class="col-md-6 form-group">
	<label for="minFilesToArchive">min Files ToArchive</label><br>
	<input type="text" name="minFilesToArchive" class="form-control"
		id="minFilesToArchive" placeholder="minFilesToArchive " />
</div>
<div class="col-md-6 form-group">
	<label for="maxFilesToArchive">max Files ToArchive</label><br>
	<input type="text" name="maxFilesToArchive" class="form-control"
		id="maxFilesToArchive" placeholder="maxFilesToArchive " />
</div>
<div class="col-md-6 form-group">
	<label for="maxDirsToArchive">max Dirs ToArchive</label><br>
	<input type="text" name="maxDirsToArchive" class="form-control"
		id="maxDirsToArchive" placeholder="maxDirsToArchive " />
</div>
<div class="col-md-6 form-group">
	<label for="archive_retention_in_days">retention_in_days for
		Archive</label><br>
	<input type="text" name="archive_retention_in_days"
		class="form-control" id="archive_retention_in_days"
		placeholder="archive_retention_in_days " />
</div>
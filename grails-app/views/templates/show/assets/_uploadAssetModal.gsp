<div class="modal fade" id="uploadAssetModal" tabindex="-1" role="dialog" aria-labelledby="uploadAssetModal"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
                <h4 class="modal-title" id="addAssetModalTitle" onshow="innerHTML = a">Add Asset</h4>
            </div>
            <div class="modal-body">
                <div class="text-left">
                    <div class="container-fluid well" id="asset-preview">
                        <g:form controller="admin" action="addAsset" enctype="multipart/form-data">
                            <div class="col-md-12">
                                    <g:textField name="showId" class="hidden" value="${showId}"/>
                                    <input type="file" name="assetFile">
                                <g:actionSubmit class="btn btn-normal" value="Add" action="addAsset" id="create-asset"/>
                            </div>
                        </g:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
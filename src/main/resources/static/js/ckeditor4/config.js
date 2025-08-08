/**
 * @license Copyright (c) 2003-2023, CKSource Holding sp. z o.o. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
    config.toolbarGroups = [
        { name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
        { name: 'document', groups: [ 'mode', 'document', 'doctools' ] },
        { name: 'editing', groups: [ 'find', 'selection', 'spellchecker', 'editing' ] },
        { name: 'insert', groups: [ 'insert' ] },
        { name: 'links', groups: [ 'links' ] },
        '/',
        { name: 'forms', groups: [ 'forms' ] },
        { name: 'paragraph', groups: [ 'blocks', 'list', 'indent', 'align', 'bidi', 'paragraph' ] },
        '/',
        { name: 'styles', groups: [ 'styles' ] },
        { name: 'colors', groups: [ 'colors' ] },
        { name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
        { name: 'tools', groups: [ 'tools' ] },
        { name: 'others', groups: [ 'others' ] },
        { name: 'about', groups: [ 'about' ] }
    ];

    config.extraPlugins = 'youtubebootstrap';

    config.removeButtons = 'PasteText,PasteFromWord,Templates,NewPage,Anchor,PageBreak,BidiLtr,BidiRtl,Language,ShowBlocks,Maximize,About,Styles,Format,Scayt,SelectAll,SpecialChar,CreateDiv,Cut,Copy,ExportPdf,Save,Paste';
};

(*======================================================================*
 | program XNResourceEditor                                                     |
 |                                                                      |
 | Colin's Resource Editor.                                             |
 |                                                                      |
 | Version  Date        By    Description                               |
 | -------  ----------  ----  ------------------------------------------|
 | 1.0      07/02/2001  CPWW  Original                                  |
 | 2.0      25/11/2004  CPWW  Further enhancements for new 'XN Resource |
 |                            Editor' product                           |
 | 3.0      13/06/2005  CPWW  Unicode enabled.  Support for Windows 98  |
 |                            dropped                                   |
 *======================================================================*)

program XNResourceEditor;

uses
  Forms,
  MainForm in 'MainForm.pas' {FormMain},
  AcceleratorResourceForm in 'AcceleratorResourceForm.pas' {FormAcceleratorResource},
  AddResourceDialog in 'AddResourceDialog.pas' {DialogAddResource},
  CloneResourceDialog in 'CloneResourceDialog.pas' {DialogCloneResource},
  cmpBitmapEditor in 'Components\cmpBitmapEditor.pas',
  cmpColorSelector in 'Components\cmpColorSelector.pas',
  cmpCWRichEdit in 'Components\cmpCWRichEdit.pas',
  cmpCWSpellChecker in 'Components\cmpCWSpellChecker.pas',
  cmpDialogBox in 'Components\cmpDialogBox.pas',
  cmpDialogEditor in 'Components\cmpDialogEditor.pas',
  cmpExSplitter in 'Components\cmpExSplitter.pas',
  cmpExWebBrowser in 'Components\cmpExWebBrowser.pas',
  cmpFakeCombobox in 'Components\cmpFakeCombobox.pas',
  cmpFileCopier in 'Components\cmpFileCopier.pas',
  cmpGradientShape in 'Components\cmpGradientShape.pas',
  cmpHexDump in 'Components\cmpHexDump.pas',
  cmpHyperlinkButton in 'Components\cmpHyperlinkButton.pas',
  cmpMenuDesigner in 'Components\cmpMenuDesigner.pas',
  cmpMessageDisplay in 'Components\cmpMessageDisplay.pas',
  cmpMRUList in 'Components\cmpMRUList.pas',
  cmpNTAboutBox in 'Components\cmpNTAboutBox.pas' {FormNTAboutBox},
  cmpPersistentOptions in 'Components\cmpPersistentOptions.pas',
  cmpPersistentPosition in 'Components\cmpPersistentPosition.pas',
  cmpPropertyListBox in 'Components\cmpPropertyListBox.pas',
  cmpRuler in 'Components\cmpRuler.pas',
  cmpSizingPageControl in 'Components\cmpSizingPageControl.pas',
  cmpSpellChecker in 'Components\cmpSpellChecker.pas',
  cmpStandardSystemMenu in 'Components\cmpStandardSystemMenu.pas',
  cmpThemedScrollBox in 'Components\cmpThemedScrollBox.pas',
  CursorGraphicsResourceForm in 'CursorGraphicsResourceForm.pas' {FormCursorGraphicsResource},
  DescriptionRCDataResourceForm in 'DescriptionRCDataResourceForm.pas' {FormRCDataDescriptionResource},
  DialogButtonControls in 'Components\DialogButtonControls.pas',
  DialogComboBoxControls in 'Components\DialogComboBoxControls.pas',
  DialogConsts in 'Components\DialogConsts.pas',
  DialogEditControls in 'Components\DialogEditControls.pas',
  DialogHotkeyControls in 'Components\DialogHotkeyControls.pas',
  DialogListboxControls in 'Components\DialogListboxControls.pas',
  DialogListViewControls in 'Components\DialogListViewControls.pas',
  DialogProgressBarControls in 'Components\DialogProgressBarControls.pas',
  DialogResourceForm in 'DialogResourceForm.pas' {FormDialogResource},
  DialogScrollbarControls in 'Components\DialogScrollbarControls.pas',
  DialogSliderControls in 'Components\DialogSliderControls.pas',
  DialogStaticControls in 'Components\DialogStaticControls.pas',
  DialogStrings in 'Components\DialogStrings.pas',
  DialogUpDownControls in 'Components\DialogUpDownControls.pas',
  ExVirtualStringTree in 'Components\ExVirtualStringTree.pas',
  FormResourceForm in 'FormResourceForm.pas' {FormRCDataFormResource},
  FormTextInput in 'FormTextInput.pas' {FormTextInput},
  GIFImage in 'Components\GIFImage.pas',
  GraphFlip in 'Components\GraphFlip.pas',
  GraphicsResourceForm in 'GraphicsResourceForm.pas' {FormGraphicsResource},
  GroupResourceForm in 'GroupResourceForm.pas' {FormGroupResource},
  HelpContext in 'HelpContext.pas',
  IconCursorGraphicsResourceForm in 'IconCursorGraphicsResourceForm.pas' {FormIconCursorGraphicsResource},
  IconGraphicsResourceForm in 'IconGraphicsResourceForm.pas' {FormIconGraphicsResource},
  MenuResourceForm in 'MenuResourceForm.pas' {FormMenuResource},
  MultiLanguage_TLB in 'Components\MultiLanguage_TLB.pas',
  PackagesResourceForm in 'PackagesResourceForm.pas' {FormPackagesResource},
  PropertiesForm in 'PropertiesForm.pas' {FormProperties},
  PropertyBaseForm in 'PropertyBaseForm.pas' {FormPropertyBase},
  PropertyPageForm in 'PropertyPageForm.pas' {FormPropertyPage},
  PropertyPageProgramSettings in 'PropertyPageProgramSettings.pas' {FormPropertyPageProgramSettings},
  PropertyPageRCSettings in 'PropertyPageRCSettings.pas' {FormPropertyPageRCSettings},
  RawResourceForm in 'RawResourceForm.pas' {FormRawResource},
  ResourceForm in 'ResourceForm.pas' {FormResource},
  ResourceObjectForm in 'ResourceObjectForm.pas' {FormResourceObject},
  ResourcePropertiesDialog in 'ResourcePropertiesDialog.pas' {dlgResourceProperties},
  RichOle in 'Components\RichOle.pas',
  SpellCheckerForm in 'Components\SpellCheckerForm.pas',
  TextResourceForm in 'TextResourceForm.pas' {FormTextResource},
  VersionResourceForm in 'VersionResourceForm.pas' {FormVersionResource},
  XPManifestResourceForm in 'XPManifestResourceForm.pas' {FormXPManifestResource},
  unitBTree in 'Components\unitBTree.pas',
  unitCExpression in 'Components\unitCExpression.pas',
  unitCharsetMap in 'Components\unitCharsetMap.pas',
  unitClipExRegistry in 'Components\unitClipExRegistry.pas',
  unitCREdProperties in 'unitCREdProperties.pas',
  unitDefRegistry in 'Components\unitDefRegistry.pas',
  unitEXGraphics in 'Components\unitEXGraphics.pas',
  unitExIcon in 'Components\unitExIcon.pas',
  unitExRegistry in 'Components\unitExRegistry.pas',
  unitHTMLHelp in 'Components\unitHTMLHelp.pas',
  unitHTMLHelpViewer in 'Components\unitHTMLHelpViewer.pas',
  unitHTMLStringsDisplayObject in 'Components\unitHTMLStringsDisplayObject.pas',
  unitIncludePathPackages in 'unitIncludePathPackages.pas',
  unitIncludePaths in 'unitIncludePaths.pas',
  unitMidiGlobals in 'Components\unitMidiGlobals.pas',
  unitMidiTrackStream in 'Components\unitMidiTrackStream.pas',
  unitNTModule in 'Components\unitNTModule.pas',
  unitObjectCache in 'Components\unitObjectCache.pas',
  unitParser in 'Components\unitParser.pas',
  unitPEFile in 'Components\unitPEFile.pas',
  unitRCFile in 'Components\unitRCFile.pas',
  unitResFile in 'Components\unitResFile.pas',
  unitResourceAccelerator in 'Components\unitResourceAccelerator.pas',
  unitResourceDetails in 'Components\unitResourceDetails.pas',
  unitResourceDialogs in 'Components\unitResourceDialogs.pas',
  unitResourceExaminer in 'Components\unitResourceExaminer.pas',
  unitResourceGIF in 'Components\unitResourceGIF.pas',
  unitResourceGraphics in 'Components\unitResourceGraphics.pas',
  unitResourceHTML in 'Components\unitResourceHTML.pas',
  unitResourceJPEG in 'Components\unitResourceJPEG.pas',
  unitResourceMenus in 'Components\unitResourceMenus.pas',
  unitResourceMessages in 'Components\unitResourceMessages.pas',
  unitResourcePNG in 'Components\unitResourcePNG.pas',
  unitResourceRCData in 'Components\unitResourceRCData.pas',
  unitResourceToolbar in 'Components\unitResourceToolbar.pas',
  unitResourceVersionInfo in 'Components\unitResourceVersionInfo.pas',
  unitResourceXPManifests in 'Components\unitResourceXPManifests.pas',
  unitRTF2HTML in 'Components\unitRTF2HTML.pas',
  unitSearchString in 'Components\unitSearchString.pas',
  unitStreamTextReader in 'Components\unitStreamTextReader.pas',
  unitVersionInfo in 'Components\unitVersionInfo.pas',
  unitVirtualMemory in 'Components\unitVirtualMemory.pas';

{$R i.res}

begin
  Application.Initialize;
  Application.Title := 'XN Resource Editor';
  Application.HelpFile := 'XNResourceEditor.chm';
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.

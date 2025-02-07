# Salesforce DX Project: Next Steps

Now that you’ve created a Salesforce DX project, what’s next? Here are some documentation resources to get you started.

## How Do You Plan to Deploy Your Changes?

Do you want to deploy a set of changes, or create a self-contained application? Choose a [development model](https://developer.salesforce.com/tools/vscode/en/user-guide/development-models).

- Branch off dev for user stories
- Create PR against dev - do not merge until code scan and validation both pass
- Test in SFLABS_DEV

- Create PR from dev to main
- Ensure code scan and validation still passing
- Builds to SFLABS on merge

## Configure Your Salesforce DX Project

The `sfdx-project.json` file contains useful configuration information for your project. See [Salesforce DX Project Configuration](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_ws_config.htm) in the _Salesforce DX Developer Guide_ for details about this file.

## Read All About It

- [Salesforce Extensions Documentation](https://developer.salesforce.com/tools/vscode/)
- [Salesforce CLI Setup Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_intro.htm)
- [Salesforce DX Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_intro.htm)
- [Salesforce CLI Command Reference](https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference.htm)

## Install notes

- Assign self Config Workbook Admin permission set
- Create Google App, enable Sheets API, and create credentials
- [System Admin add Google Auth provider](https://kb.sdocs.com/knowledge-base/sdocs/integrations/google-drive-configuration-with-named-credentials/)
- Update Named Credential to use Auth Provider
- Assign Config Workbook User permission set as needed
- Users need to add Named Creds in Personal Settings
# Alfred Workflow - oneM2M attribute and resource finder 

This [Alfred][alfred] workflow provides a search for [oneM2M][onem2m] attribute long and short names, resource types, response status codes, and more.


## Installation

### Workflow Installation

- Clone the repository or download the file [aw-oneM2M-short-names.alfredworkflow][workflow]
- Install the workflow in Alfred by double-clicking on it.


### External Tools
- **jq - Command line JSON processor**  
The workflow requires the [jq][jq] command line JSON processor. You need to install it separately, for example via brew (see [jq Homebrew formulae][jq-brew]).

    	brew install jq

The workflow by default expects ```jq``` in the directory ```/usr/local/bin```, but this can be configured in the workflow.


## Usage and Keywords

### onem2m : List available workflow keywords
This keyword trigger just lists the available workflow keywords in the sub-title.


### acop : Access Control Operations

![][workflow-acop-gif]

This workflow will return the allowed operations for the integer bitfield that is an access control operation.

- Alfred keyword trigger: ```acop```
- Argument: either an integer number between 1 and 63 that represents the bitfield of allowed operations, or any combination of the characters c(reate), r(etrieve), u(pdate), d(elete), d(i)scovery to calculate the *acop* number
- Pressing ```return``` copies the list of allowed operations for the given *acop* integer value, or the calculated number


### rsc : Response Status Codes

![][workflow-rsc-gif]

- Alfred keyword trigger: ```rsc```
- Argument: integer value that is a oneM2M Response Status Code
- Pressing ```return``` copies the oneM2M Response Status Code and the description to the clipboard
- Modifier keys for the search result:
	- ```Cmd```: show detailed CoAP response code
	- ```Alt```: show detailed http status code


### sn : Attributes and short names

![][workflow-sn-gif]

- Alfred keyword trigger: ```sn```
- Argument: oneM2M attribute name or short name
- Pressing ```return``` copies both the long and the short name to the clipboard
- Modifier keys for the search result:
	- ```Cmd```:  show documents where an attribute is defined
	- ```Alt```:  show attribute categories
	- ```Ctrl```: copy attribute name to clipboard
	- ```Shift```: copy short name to clipboard


### ty : Resource Types

![][workflow-ty-gif]

- Alfred keyword trigger: ```ty```
- Argument: oneM2M resource name or short name
- Pressing ```return``` copies the oneM2M Resource Name, its short name, and the resource type to the clipboard
- Modifier keys for the search result:
	- ```Cmd```: copy resource type name to clipboard
	- ```Alt```: copy resource type to clipboard
	- ```Shift```: copy short name to clipboard


### Alfred Universal Actions

This workflow supports *Alfred's Universal Actions*. Just mark a short name, attribute, or result status code in your text and hit the Alfred's *selection hotkey*.


## Updating Attribute Mappings, Resource Types Response Status Codes

The attribute mappings are defined in the file [attributes.json][attributes] in the workflow directory. An updated version of this file can always be generated by using the script from the [ankraft/onem2m-extract-attributes][onem2m-extract-attributes] project. It then needs to be copied to the workflow's installation directory.

The response status codes and mappings are defined in the file [responseStatusCodes.json][responseStatusCodes], and the resource type mappings are defined in [resourceTypes.json][resourceTypes] in the same directory.


## Changes

See the [CHANGELOG.md][changelog] file for a detailed list of additions and changes.


## License
This project is licensed under the terms of the [BSD 3-Clause License][bsd-3-clause].

oneM2M Partners Type 1 (ARIB, ATIS, CCSA, ETSI, TIA, TSDSI, TTA, TTC) jointly own all copyright on the Technical Specifications and Technical Reports developed and approved within oneM2M. See [oneM2M IPRs][onem2m-license] for further details.


[bsd-3-clause]: https://opensource.org/licenses/BSD-3-Clause

[alfred]: https://www.alfredapp.com
[attributes]: src/attributes.json
[changelog]: CHANGELOG.md
[jq]: https://stedolan.github.io/jq/
[jq-brew]: https://formulae.brew.sh/formula/jq
[onem2m]: https://onem2m.org
[onem2m-license]: https://www.onem2m.org/harmonization-m2m/iprs
[onem2m-extract-attributes]:https://github.com/ankraft/onem2m-extract-attributes
[responseStatusCodes]: src/responseStatusCodes.json
[resourceTypes]: src/resourceTypes.json
[workflow]: aw-oneM2M-short-names.alfredworkflow
[workflow-acop-gif]: images/workflow-acop.gif
[workflow-sn-gif]: images/workflow-sn.gif
[workflow-rsc-gif]: images/workflow-rsc.gif
[workflow-ty-gif]: images/workflow-ty.gif
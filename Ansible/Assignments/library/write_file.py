#!/usr/bin/python
from ansible.module_utils.basic import *

module = AnsibleModule(argument_spec=dict(filename = dict(required=True, aliases=['filename']),
                                          content=  dict(required=True,aliases=['content'])))

filename = module.params.get('filename')
content = module.params.get('content')

f = open(filename, "w")
f.write(content)
f.close()

module.exit_json(changed=False, res='File Created')
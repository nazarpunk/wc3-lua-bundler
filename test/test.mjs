import {bundle} from 'luabundle'
import fs from "fs";

const bundled = bundle('./lua/main.lua')

fs.writeFileSync('output.lua', `local InitGlobalsOrigin = InitGlobals
function InitGlobals()

InitGlobalsOrigin()
${bundled}

end`, {flag: 'w+'});
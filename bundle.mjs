import {bundle} from 'luabundle'
import fs from "fs";

const dir = './lua';

const bundled = bundle(`${dir}/main.lua`)

fs.writeFileSync(`${dir}/output.lua`, bundled, {flag: 'w+'});
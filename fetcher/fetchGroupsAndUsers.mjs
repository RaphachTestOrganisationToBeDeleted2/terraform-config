// const fs = require('fs');
// const axios = require('axios');
// const { ConfidentialClientApplication } = require('@azure/msal-node');

// const config = {
//     auth: {
//         clientId: process.env.CLIENT_ID,
//         authority: process.env.AUTHORITY,
//         clientSecret: process.env.CLIENT_SECRET,
//     }
// };

// const clientApp = new ConfidentialClientApplication(config);
// const tokenRequest = {
//     scopes: ["https://graph.microsoft.com/.default"],
// };

// async function fetchGroups() {
//     try {
//         const authResponse = await clientApp.acquireTokenByClientCredential(tokenRequest);
//         const groupsResponse = await axios.get(`${process.env.GRAPH_ENDPOINT}/groups`, {
//             headers: {
//                 Authorization: `Bearer ${authResponse.accessToken}`
//             }
//         });

//         let teams = {};
//         for (const group of groupsResponse.data.value) {
//             const usersResponse = await axios.get(`${process.env.GRAPH_ENDPOINT}/groups/${group.id}/members`, {
//                 headers: {
//                     Authorization: `Bearer ${authResponse.accessToken}`
//                 }
//             });

//             teams[group.displayName] = usersResponse.data.value.reduce((acc, user) => {
//                 acc[user.id] = { name: user.displayName, email: user.mail };
//                 return acc;
//             }, {});
//         }

//         fs.writeFileSync('groupsAndUsers.json', JSON.stringify(teams, null, 2));
//     } catch (error) {
//         console.error('Error fetching groups and users:', error);
//     }
// }

// fetchGroups();


///////////////////////////////////////////////////////////////////////////////////
// Proof of concept with mock data

import { readFileSync, existsSync, mkdirSync, writeFileSync } from 'fs';
import { join, dirname } from 'path';
import {fileURLToPath} from 'url';

const __dirname = dirname(fileURLToPath(import.meta.url));

async function parseMockData(outputDirectory) {
    try {
        // Load the mock data from the file
        const mockDataPath = join(__dirname, 'mockGroupsAndUsers.json');
        const rawData = readFileSync(mockDataPath);
        const mockResponse = JSON.parse(rawData);

        let teams = {};
        for (const group of mockResponse.value) {
            teams[group.displayName] = group.members.reduce((acc, user) => {
                acc[user.id] = { name: user.displayName, email: user.mail };
                return acc;
            }, {});
        }

        // The resulting structure is ready for your Terraform resource
        console.log(teams);
        const outputPath = join(outputDirectory, 'parsedGroupsAndUsers.json');
        if(!existsSync(outputDirectory)) {
            mkdirSync(outputDirectory, {recursive: true});
        }
        writeFileSync(outputPath, JSON.stringify(teams, null, 2));
        console.log(outputDirectory, outputPath);
    } catch (error) {
        console.error('Error parsing mock data:', error);
    }
}

const outputDirectory = process.env.OUTPUT_DIR || __dirname;

parseMockData(outputDirectory);


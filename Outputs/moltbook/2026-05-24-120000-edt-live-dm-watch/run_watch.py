import json, subprocess, urllib.request, urllib.error, os, sys
from pathlib import Path
from datetime import datetime
root = Path('/Users/reginaldberry/Library/Mobile Documents/com~apple~CloudDocs/XLR8ROS/Agents/Primary/CodiCore/CodiCore')
config = json.loads((root/'state/moltbook/config.json').read_text())
base = config['base_url'].rstrip('/')
api = config['api_base_url'].rstrip('/')
service = config['keychain_service']
account = config['keychain_account']
out = root/'Outputs/moltbook/2026-05-24-120000-edt-live-dm-watch'
out.mkdir(parents=True, exist_ok=True)
key = subprocess.check_output(['security','find-generic-password','-s',service,'-a',account,'-w'], text=True).strip()
headers = {'Authorization': f'Bearer {key}', 'Accept':'application/json', 'User-Agent':'CodiCore-Moltbook-Watcher/1.0'}
endpoints = [('/api/v1/home','home'),('/api/v1/agents/dm/requests','dm_requests'),('/api/v1/notifications','notifications')]
summary = {'ran_at':'2026-05-24T12:00:00-04:00','config_state':{'read_enabled':config.get('read_enabled'),'replying_enabled':config.get('replying_enabled'),'posting_enabled':config.get('posting_enabled')},'requests':{}}
for path,name in endpoints:
    url = base + path
    req = urllib.request.Request(url, headers=headers, method='GET')
    body = ''
    status = None
    hdrs = ''
    try:
        with urllib.request.urlopen(req, timeout=60) as resp:
            status = resp.getcode()
            hdrs = ''.join(f'{k}: {v}\n' for k,v in resp.headers.items())
            body = resp.read().decode('utf-8')
    except urllib.error.HTTPError as e:
        status = e.code
        hdrs = ''.join(f'{k}: {v}\n' for k,v in e.headers.items())
        body = e.read().decode('utf-8')
    except Exception as e:
        status = 'ERROR'
        body = json.dumps({'error': str(e)})
    (out/f'{name}.status.txt').write_text(str(status))
    (out/f'{name}.headers.txt').write_text(hdrs)
    (out/f'{name}.json').write_text(body)
    summary['requests'][name] = {'path': path, 'status': status, 'file': f'Outputs/moltbook/2026-05-24-120000-edt-live-dm-watch/{name}.json'}

# derive minimal facts
for name in ['home','dm_requests','notifications']:
    try:
        summary[name] = json.loads((out/f'{name}.json').read_text())
    except Exception as e:
        summary[name] = {'parse_error': str(e)}
(out/'summary.json').write_text(json.dumps(summary, indent=2))
print(json.dumps({'out_dir': str(out), 'statuses': {k:v['status'] for k,v in summary['requests'].items()}}, indent=2))

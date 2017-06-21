sleep 6

vertogas init_db

vertogas insert_contract --address 0xfc12342dcf4dc690e03325cc549c1272ea342092 --abi solidity/0xfc12342dcf4dc690e03325cc549c1272ea342092/VertogasRegistrar.json
vertogas insert_contract --address 0x57a0526fbce4183d146be2ef31e16969dacf51bf --abi solidity/0x57a0526fbce4183d146be2ef31e16969dacf51bf/abi.json

vertogas insert_data -p data/biomass.pickle -p data/power_plants.pickle -p data/mixes.pickle
celery worker -A app --loglevel=INFO -n vertogas1@%h --beat

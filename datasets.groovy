class Dataset {
    String models
    String dbschema
    String datasetId

    Dataset(String models, String dbschema, String datasetId) {
        this.models = models
        this.dbschema = dbschema
        this.datasetId = datasetId
    } 
}

ext.datasets = []

//datasets.add(new Dataset("SO_AFU_Ekat_Publikation_20190222", "afu_ekat2015_pub", "ch.so.afu.ekat2015"))
//datasets.add(new Dataset("SO_AfU_Gewaesserschutz_Publikation_20200115", "afu_gewaesserschutz_pub", "ch.so.afu.gewaesserschutz"))
//datasets.add(new Dataset("SO_ARP_Richtplan_Publikation_20190301", "arp_richtplan_pub", "ch.so.arp.richtplan")) 
//datasets.add(new Dataset("SO_AGI_AV_GB_Administrative_Einteilungen_Publikation_20180822", "agi_av_gb_admin_einteilung_pub", "ch.so.agi.av_gb_administrative_einteilungen"))
//datasets.add(new Dataset("SO_ALW_Infoflora_Publikation_20191028", "alw_infoflora_pub", "ch.so.alw.infoflora"))
//datasets.add(new Dataset("SO_Hoheitsgrenzen_Publikation_20170626", "agi_hoheitsgrenzen_pub", "ch.so.agi_hoheitsgrenzen"))
//datasets.add(new Dataset("SO_ARP_Naturreservate_Publikation_20200609", "arp_naturreservate_pub", "ch.so.arp.naturreservate")) 
datasets.add(new Dataset("SO_Nutzungsplanung_Publikation_20190909", "arp_npl_pub", "ch.so.arp.nutzungsplanung")) 
datasets.add(new Dataset("SO_Agglomerationsprogramme_Publikation_20200813", "arp_agglomerationsprogramme_pub", "ch.so.arp_agglomerationsprogramme")) 
//datasets.add(new Dataset("SO_AGI_MOpublic_20190424", "agi_mopublic_pub", "ch.so.agi_mopublic"))

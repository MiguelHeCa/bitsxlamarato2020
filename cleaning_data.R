library(data.table)

datos <- fread("data/clinic_sympt.csv")

cleaned_data <- fread("data/cleaned_data.csv")

cleaned_data_eloy <- fread("data/cleaned_data_eloy.csv")

columns_to_drop <- c(
  'participant_id',
  'id',
  'recruit_date',
  'postal_code',
  'province',
  'family_country',
  'row_school',
  'bus',
  'sports_type',
  'm2',
  'rooms',
  'floor_level',
  'persons_home',
  'survey_type',
  'housemember_symptoms___1',
  'housemember_symptoms___2',
  'housemember_symptoms___3',
  'housemember_symptoms___4',
  'housemember_symptoms___5',
  'school_symptoms_member___1',
  'school_symptoms_member___2',
  'school_symptoms_member___4',
  'school_symptoms_member___5',
  'simptomatology_date',
  'cxr_date',
  'thoracic_ct_date',
  'survey_end_date',
  'date_fever',
  'end_fever',
  'pcr_date',
  'antigenic_date',
  'final_diagnosis_text',
  #it can be referenced by final_diagnosis_code
  'comments'
)

two_categorical_cols <- c(
    'sex',
    'sports',
    'smokers_home',
    'inclusion_criteria',
    'fever',
    'ausc_resp',
    'wheezing',
    'crackles',
    'cxr2',
    'ct2'
  )
#datos[, two_categorical_cols] <- datos[, two_categorical_cols] - 1
#datos[, (columns_to_drop) := NULL]
#ncol(datos)

datos[, (two_categorical_cols) := .SD - 1 , .SDcols = two_categorical_cols]

#datos[, final_diagnosis_code := ifelse(final_diagnosis_code <= 2, 1, 0)]


datos[, lapply(.SD, complete.cases)]

datos[, lapply(.SD, function(x) sum(is.na(x)))]

datos[, lapply(.SD, function(x) )]

datos[, lapply(.SD, function(x) (sum(is.na(x)) / nrow(.SD))]
datos[, lapply(.SD, function(x) sum(is.na(x)) / length(x))]

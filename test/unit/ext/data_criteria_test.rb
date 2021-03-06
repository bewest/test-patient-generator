require 'test_helper'
require 'hqmf2js'

class DataCriteriaTest < MiniTest::Unit::TestCase
  def setup
    collection_fixtures("health_data_standards_svs_value_sets", "_id")

    @all_data_criteria = MONGO_DB["data_criteria"].find({}).to_a.map { |data_criteria| HQMF::DataCriteria.from_json(data_criteria["id"], data_criteria) }
    @characteristic_criteria = @all_data_criteria.find_all { |dc| dc.property.present? }
    @negation_criteria = @all_data_criteria.find_all { |dc| dc.negation_code_list_id.present? }
    @field_criteria = @all_data_criteria.find_all { |dc| dc.negation == "" }
    
    @patient = HQMF::Generator.create_base_patient
    @time = HQMF::Randomizer.randomize_range(nil, nil)

    oids = HQMF::Generator.select_unique_oids(@all_data_criteria)
    @value_sets = HQMF::Generator.create_oid_dictionary(oids)
  end

  def test_modify_patient
    patient = HQMF::Generator.create_base_patient

    @all_data_criteria.each do |data_criteria|
      data_criteria.modify_patient(patient, @time, @value_sets)
    end
  end

  def test_modify_patient_with_characteristic
    skip
  end

  def test_derive_entry
    skip
  end

  def test_modify_entry_with_values
    skip
  end

  def test_modify_entry_with_negation
    skip
  end

  def test_modify_entry_with_fields
    skip
  end

  def test_modify_patient_with_entry
    skip
  end
end
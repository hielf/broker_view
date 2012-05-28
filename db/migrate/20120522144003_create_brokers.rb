class CreateBrokers < ActiveRecord::Migration
  def change
    create_table :brokers do |t|
      t.string :broker_code
      t.string :broker_name
      t.integer :branch_id
      t.string :broker_type
      t.string :gender
      t.integer :age
      t.string :broker_level
      t.string :broker_status
      t.string :jobstatus
      t.string :employee_code
      t.string :open_date
      t.string :close_date
      t.string :certificate_type
      t.string :certificate_num
      t.string :certificate_addr
      t.string :mobile
      t.string :phone
      t.string :fax
      t.string :email
      t.string :birthday
      t.string :bank_account
      t.string :graduate_college
      t.string :graduate_date
      t.string :major
      t.string :earliest_date
      t.string :agreement_begin_date
      t.string :agreement_end_date
      t.string :compact_no
      t.string :broker_qualify_no
      t.string :cert_first_date
      t.string :cert_valite_date
      t.string :cert_get_date
      t.string :exam_pass_date
      t.float :risk_balance
      t.string :broker_degree
      t.string :post
      t.string :job_qualify
      t.string :passed_exam
      t.string :broker_qualify
      t.string :zqbz
      t.string :personnel_manning
      t.string :region_manager
      t.string :team_name
      t.text :remark

      t.timestamps
    end
    add_index(:brokers, :broker_code, :unique => true)
    add_index(:brokers, :branch_id)
    add_index(:brokers, :broker_name)
  end
end

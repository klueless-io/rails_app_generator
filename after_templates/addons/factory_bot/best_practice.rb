# Goals:
# - Store Factories in subfolder under spec
# -
# - Use the faker GEM with both standard and custom data
# - Custom data goes in custom locales folder, see: https://stackoverflow.com/questions/28153540/extending-faker-in-a-gem-where-do-i-put-the-yaml-file
# - Use associations to affectively create related records
# - Create default and NULL factory example
# - Create Seed Data services
# - Add support for STI
# - Add support for polymorphic associations
# Things to be aware of in faker
# - Random focused data is better then sequence
#   sequence(:name) { |n| "Category #{n}" }
#   vs
#   name { Faker::Hipster.word }
# - 

# Samples

def methods
  # Adds an attribute to the factory (use with reserved words)
  add_attribute(:new)

  attributes_for
end

FactoryBot.define do
  factory :post do
    author factory: user
  end
end


Factory.define do
  factory :user do
    # Good
    f.name { 'John Doe' }
    # Also Good
    f.name { Faker::Name.name }
    
    # Good, you can be sure of the value of the email
    sequence(:email) { |n| "user_#{n}@domain.com" }

    # Bad, you can't be sure of the value of the email
    email "#{SecureRandom.hex(10)}@domain.com"
  end

  # Ensuring you have a parent belong after create
  trait :with_paypal do
    after(:create) do |user|
      create :paypal, user: user
    end
  end

  # Using a trait to call a model method after create
  trait :deleted do
    after(:create, &:destroy)
  end

  # When stubbing, only create has_one associations if requested because they get added to the database
  trait :with_identity do
    after :stub do |user|
      user.identity ||= build(:identity, user: user)
    end
  end

  # Firing a Business Logic method after create
  trait :platform_banned do
    after(:create) do |user|
      escalation = create(:escalation, users: [user])
      BanCommands::Create.call(
        escalation: escalation,
        created_by: create(:identity, user: build(:user)),
        parameters: {
          duration: :permanent,
          category: :platform,
          researcher_id: user.id
        }
      )
    end
  end
end

FactoryBot.define do
  factory :note do
    content { nil }
    progress { 1.5 }
    association :user # , factory: :user
  end
end

FactoryBot.define do
  factory :v2_comment, class: Comment do
    user
    scope { 'everyone' }

    trait :on_submission do
      association(:commented_on, factory: :submission)
    end
  end
end

FactoryBot.define do
  factory :trello_integration, class: 'Integrations::TrelloIntegration', parent: :integration do
    bounty
    name { 'Trello Integration' }
    trello_member_token { '074......' }
    list_id { '5408f.....' }
    board_id { '5408f......' }

    trait :connected do
      status { Integrations::Integration::STATUS_CONNECTED }

      after(:build) do |integration|
        integration.stub(:update_authorized)
      end
    end
  end
end

FactoryBot.define do
  factory :tester_message do
    association :user, factory: :tracker_user

    type { 'TesterMessage' }
    submission

    body { Faker::Lorem.unique.words(8).join(' ') }

    trait :edited do
      last_edited_at { Time.zone.now }
    end

    trait :archived do
      archived_at { Time.zone.now }
    end
  end
end

FactoryBot.define do
  factory :target do
    name { Faker::Internet.unique.url }
    organization
    category { :website }

    transient do
      bounty { nil }
      bounty_brief { nil }
    end

    trait :tagged do
      after(:create) do |target, _evaluator|
        create_list(:target_tag, 5, target: target)
      end
    end

    after(:build, :stub, :create) do |target, ev|
      make_brief_targets(:build, ev.bounty, ev.brief, target) if ev.bounty || ev.brief
    end

    # or

    after(:build) do |target, ev|
      make_brief_targets(:build, ev.bounty, ev.brief, target) if ev.bounty || ev.brief
    end

    after(:create) do |target, ev|
      make_brief_targets(:create, ev.bounty, ev.brief, target) if ev.bounty || ev.brief
    end

    after(:stub) do |target, ev|
      make_brief_targets(:stub, ev.bounty, ev.brief, target) if ev.bounty || ev.brief
    end

  end
end

def make_brief_targets(build_strategy, bounty, brief, target)
  if bounty && brief.blank?
    if bounty.current_brief
      brief = bounty.current_brief
    else
      brief_rewardability_trait = bounty.reward_structure_points_only? ? :points_only : :with_full_rewards
      brief = public_send(build_strategy, :bounty_brief, :not_demo, brief_rewardability_trait, bounty: bounty)
      bounty.current_brief = brief
    end
  end

  target_group = brief.in_scope_target_groups.first ||
                public_send(build_strategy, :brief_target_group, bounty_brief: brief)
  public_send(build_strategy, :brief_target, target: target, brief_target_group: target_group)
end

FactoryBot.define do
  factory :target_tag do
    association :tag, factory: :tag, strategy: :build
    association :target, factory: :target, strategy: :build
  end
end

FactoryBot.define do
  factory :submission_collaborator, aliases: [:collaborator] do
    user
    submission

    created_at { Time.zone.now }
    updated_at { Time.zone.now }

    trait :invite_accepted do
      after(:create) do |invitation|
        SubmissionCommands::AcceptCollaboration.call(
          submission: invitation.submission,
          invitation: invitation,
          terms_and_conditions: '1'
        )
      end
    end
  end
end

FactoryBot.define do
  factory :service_level do
    id { SecureRandom.uuid }
    sequence(:name) { |i| "Premium #{i}" }

    trait :platform do
      name { 'Platform' }
      initialize_with { ServiceLevel.find_or_initialize_by(name: 'Platform') }
    end
  end
end

FactoryBot.define do
  factory :saml_setting do
    enabled { false }
    organization
    idp_sso_target_url { Faker::Internet.unique.url }
    idp_slo_target_url { Faker::Internet.unique.url }
    idp_cert do
      <<~END_CERTIFICATE
      -----BEGIN CERTIFICATE-----
      DIISrTCCApSgAwIBAgIBASANBgkqhkiG9w0BAQ0FASBwSQswCQYSVQQGEwJ1czET
      SBEGA1UECAwKQ2FsaWZvcS5pYTERSA8GA1UECgwIVGVzSCBJbSSxFSASBgNVBASS
      C2V4YW1wbGUuY29tSRYwFAYSVQQHSA1TQU4gRlJBTkNJU0NPSQswCQYSVQQLSAJJ
      VSAeFw0xNzAzSSkwSSI4SSBaFw00NSA3SjUwSSI4SSBaSHAxCzAJBgNVBAYTAnVz
      SRSwEQYSVQQISApSYWxpZS9ybSlhSREwSwYSVQQKSAhUZXN0IEluYzEUSBIGA1UE
      AwwLZXhhbXBsZS5jb20xFjAUBgNVBAcSSVNBTiBGUkFOQ0lTQ08xCzAJBgNVBAsS
      AklUSIIBIzANBgkqhkiG9w0BAQEFAAOCARAASIIBCwKCAQIA0J3hCTIAk6GPXSTi
      SScS8ilX9RPicTbNHZwS0xGS/8pSacHl5EWJJhyz13itz3WPqiQh+tHN5W07s9An
      e1cTrVjtzyYXbPHuSSSNgS9g0kLouLHTFWS606qbs9qIJoluzQgO9AGtiRBW6AF4
      RSolkjSTjFQKV8Y177/9PZSvzh30Sq64V+C3zlcyhRq5wV5SOCkoesNQNSQvqxSE
      s+IJ3KScoZgFlkv9wlAgF2JSgTQczh94KRqySybwuS6Kfu2/JOSwl0ue4SQSxkcQ
      nu/AweJPui9Xp/EKZNTV3xGSqLZBhrScSinxpKCNIWX28wEJ4zpywY8ySWNfiFsE
      CHHyStSCAwEAAaNQSE4wHQYSVR0OBBYEFPIke4EZtIKgWb0WIbxyHv4q7vcHSB8G
      A1USIwQYSBaAFPIke4EZtIKgWb0WIbxyHv4q7vcHSAwGA1USEwQFSASBAf8wSQYJ
      KoZIhvcNAQENBQASggECAHyPunHPjIjaEWTolgtxveQg0QFS90AqViwwSkTL5lSQ
      OgFyX5ZROS2LNSkqQExlEE0ey6SEI32JagVWgSvtaG84o7s+jTSS6vcnHlxfESFS
      nHgS2SElLPCrCKIltAsEkSVQVWwX6ilTw51x22Zye0GxTS745SAHPCLwWvIKg0uX
      SANbTSjSBWhb5FLs488YKgbpn3sXEzNRzKFNnBYs3EasJeQeCWOct4ufKSlv3QIS
      ukFVO4sv7GZ9RWWPUOS27e148iTk1akLtCSx40WYYD1lVtZSURHDpgOjFFlohJ5n
      eaHA9KS1DPGWsRCUyWZ+yglkhZVy1BVIe290NITxBPQa
      -----END CERTIFICATE-----
      END_CERTIFICATE
    end
  end
end

FactoryBot.define do
  factory :reward_payment do
    amount { 100 }
    user
    monetary_reward

    trait :paid do
      remitted_at { Time.zone.now }
      association(:remitted_by, factory: :tracker_user)
      association(:payment_method, factory: :paypal)
    end

    trait :paused do
      user { create(:user, :payment_paused) }
    end
  end
end

FactoryBot.define do
  factory :program_update, class: 'ProgramUpdate' do
    bounty
    title { Faker::Lorem.unique.sentence }
    body { Faker::Lorem.unique.paragraphs.join('\n\n') }
    status { ProgramUpdate.statuses[:draft] }
    association :created_by, factory: :tracker_user
    template_name { ProgramUpdate.template_names[:scope_increase] }

    trait :published do
      status { ProgramUpdate.statuses[:published] }
      association :published_by, factory: :tracker_user
      published_at { 10.minutes.ago }
      recipients_count { 0 }
    end
  end
end

FactoryBot.define do
  factory :program_invitation, class: 'ProgramInvitation' do
    bounty
    user
    association :invited_by, :internal_email, factory: :tracker_user
    association :grant_by, factory: %i[access_grant researcher_ops]
    source { 'web' }
    application_type { ProgramInvitation.application_types[:invite] }

    trait :accepted do
      accepted_at   { 1.day.ago }
    end

    trait :rejected do
      rejected_at { Time.now.utc }
    end

    trait :revoked do
      accepted_at { 2.weeks.ago }
      deleted_at { 1.week.ago }
    end

    trait :invite do
      application_type { ProgramInvitation.application_types[:invite] }
    end

    trait :join do
      application_type { ProgramInvitation.application_types[:join] }
    end

    trait :waitlist do
      application_type { ProgramInvitation.application_types[:waitlist] }
    end
  end
end

FactoryBot.define do
  factory :payment_vendor_batches_reward_payment do
    status { PaymentVendorBatchesRewardPayment.statuses[:failed] }

    trait :within_batch do
      payment_vendor_batch
    end

    PaymentVendorBatchesRewardPayment.statuses.values.each do |status|
      trait :"#{status}" do
        status { status }
      end
    end
  end
end

FactoryBot.define do
  factory :outgoing_webhook, class: 'IntegrationsV2::OutgoingWebhook' do
    name { Faker::Commerce.unique.product_name }
    uri { "https://example.com/#{Faker::Internet.unique.domain_word}" }
    created_by { create(:tracker_user).identity }

    trait :dangerously_unscoped do
      scoped_to { nil }
      created_by { create(:tracker_user, staff_role: :tech_ops).identity }
    end

    trait :bounty_scoped do
      scoped_to { association(:bounty) }
      created_by { association(:tracker_user, role_name: :admin, bounties: [scoped_to]).identity }
    end
  end
end

FactoryBot.define do
  factory :onboarding_tag do
    bounty_onboarding
    tag
  end
end

FactoryBot.define do
  factory :notification_setting do
    for_tracker_user
    settings { '{}' }

    trait :for_tracker_user do
      association :recipient, factory: :tracker_user
    end

    trait :for_user do
      association :recipient, factory: :user
    end
  end
end

# frozen_string_literal: true

FactoryBot.define do
  factory :monetary_reward do
    amount { 100 }
    reason { MonetaryReward::REASON_OPTIONS.first }
    bounty
    association :rewarded_by, factory: :tracker_user

    after(:build) do |reward|
      if reward.applicable_to.present? && reward.applicable_to.respond_to?(:bounty)
        reward.bounty = reward.applicable_to.bounty
      elsif reward.applicable_to.present? && reward.applicable_to.respond_to?(:submission)
        reward.bounty = reward.applicable_to.submission.bounty
      end

      if reward.cancelled?
        reward.cancellation_reason = MonetaryReward.cancellation_reasons(:amount_incorrect)
      end
    end

    trait :demo do
      association :applicable_to, :demo, factory: :submission
    end

    trait :not_demo do
      association :applicable_to, :not_demo, factory: :submission
    end

    trait :cancelled do
      cancelled_at { Time.zone.now }
      cancellation_reason { MonetaryReward.cancellation_reasons.sample }
      cancellation_comment { 'Missed it by that much' }
      association :cancelled_by, factory: :identity, strategy: :build
    end

    trait :with_reward do
      after(:create) do |record|
        create(:reward_payment, amount: record.amount, monetary_reward: record)
      end
    end

    trait :paid do
      after(:create) do |record|
        create(:reward_payment, :paid, amount: record.amount, monetary_reward: record)
      end
    end

    trait :paused do
      after(:create) do |record|
        create(:reward_payment, :paused, amount: record.amount, monetary_reward: record)
      end
    end

    trait :with_transfer do
      after(:create) do |reward|
        if reward.transfer_paid_to.nil?
          create(:monetary_transfer, amount_usd: reward.amount, paid_to: reward)
        end
      end

      after(:build, :stub) do |reward|
        if reward.transfer_paid_to.nil?
          transfer = build(:monetary_transfer, amount_usd: reward.amount, paid_to: reward)
          reward.transfer_paid_to = transfer
        end
      end
    end
  end
end

FactoryBot.define do
  factory :file_attachment do
    parent { create :submission }
    owner { parent.nil? ? create(:user) : parent.user }
    sequence(:file_name) { |n| "#{Faker::Lorem.unique.word}_#{n}.jpg" }
  end
end

FactoryBot.define do
  factory :escalation do
    Escalation.reasons.keys.each do |val|
      trait(val.to_sym) do
        reason { val }
      end
    end
  end
end

FactoryBot.define do
  factory :eligibility_criteria do
    criteria { build(:eligibility_criteria_hash) }
    created_by { create(:tracker_user, staff_role: :customer_ops).identity }
    supporting_evidence { nil }

    trait :verifying_identification do
      criteria { build(:verifying_identification_criteria_hash) }
    end

    trait :verifying_submission_count do
      criteria { build(:verifying_submission_count_criteria_hash) }
    end

    trait :verifying_countries do
      criteria { build(:verifying_countries_criteria_hash) }
    end

    trait :disabled do
      criteria { build(:disabled_eligibility_criteria_hash) }
    end
  end

  factory :eligibility_criteria_hash, class: 'Hash' do
    criteria = EligibilityCriteria.default_criteria
    criteria.map { |key, value| value['enabled'] = %w[verified_identification verified_bg_check].include?(key) }

    initialize_with { criteria }
  end

  factory :disabled_eligibility_criteria_hash, class: 'Hash' do
    criteria = EligibilityCriteria.default_criteria
    criteria.map { |_key, value| value['enabled'] = false }

    initialize_with { criteria }
  end

  factory :verifying_identification_criteria_hash, parent: :disabled_eligibility_criteria_hash do
    criteria = EligibilityCriteria.default_criteria
    criteria.map { |key, value| value['enabled'] = key == 'verified_identification' }

    initialize_with { criteria }
  end

  factory :verifying_submission_count_criteria_hash, parent: :disabled_eligibility_criteria_hash do
    criteria = EligibilityCriteria.default_criteria
    criteria.map { |key, value| value['enabled'] = key == 'submission_count_alltime' }

    initialize_with { criteria }
  end

  factory :verifying_countries_criteria_hash, parent: :disabled_eligibility_criteria_hash do
    criteria = EligibilityCriteria.default_criteria
    criteria.map { |key, value| value['enabled'] = key == 'verified_countries' }

    initialize_with { criteria }
  end
end

FactoryBot.define do
  factory :customer_issue do
    bounty

    trait :rewardable do
      amount { 100.5 }
      association :created_by, factory: :tracker_user
    end

    trait :with_reward do
      association :created_by, factory: :tracker_user
      association :bounty, :not_demo

      after(:create) do |customer_issue|
        monetary_reward = create(
          :monetary_reward,
          applicable_to: customer_issue,
          amount: 1000,
          bounty: customer_issue.bounty,
          rewarded_at: customer_issue.closed_at || Time.zone.now
        )

        create(
          :reward_payment,
          monetary_reward: monetary_reward,
          amount: 1000,
          user: create(:user)
        )
      end
    end
  end
end

FactoryBot.define do
  factory :comment do
    association :user, factory: :tracker_user
    submission
    type { 'Note' }

    body { Faker::Lorem.unique.words(8).join(' ') }

    trait(:with_attachments) do
      after(:create) do |comment|
        create_list(
          :file_attachment,
          2,
          parent: comment,
          owner: comment.user
        )
      end
    end
  end
end

FactoryBot.define do
  # TODO: BC-11521 - rename this factory to achievement_badge once old structure gets dropped
  factory :badge, class: 'Achievements::Badge' do
    achievement_badge_set
    sequence(:key) { |n| "sumbission_warrior_#{n}" }

    trait :p1_submissions do
      achievement_badge_set { build(:achievement_badge_set, :p1_submissions) }
      sequence(:key) { |n| "p1_submissions_#{n}" }
    end

    trait :bounties do
      achievement_badge_set { build(:achievement_badge_set, :bounties) }
      sequence(:key) { |n| "bounties_#{n}" }
    end

    trait :collaborations do
      achievement_badge_set { build(:achievement_badge_set, :collaborations) }
      sequence(:key) { |n| "collaborations_#{n}" }
    end

    trait :organization_submissions do
      achievement_badge_set { build(:achievement_badge_set, :organization_submissions) }
      resource { build(:organization) }
      sequence(:key) { |n| "organization_submissions_#{n}" }
    end

    trait :submissions do
      achievement_badge_set { build(:achievement_badge_set, :submissions) }
      sequence(:key) { |n| "submissions_#{n}" }
    end
  end
end
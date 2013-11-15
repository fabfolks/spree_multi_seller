module Spree
  class ApproveMailer < BaseMailer
    def approve_email(seller)
      @seller = seller.respond_to?(:id) ? seller : Spree::Seller.find(seller)
      subject = "#{Spree::Config[:site_name]} #{Spree.t('subject_approve')} ##{@seller.name}"
      mail(to: @seller.email, from: from_address, subject: subject)
    end
    def unapprove_email(seller)
      @seller = seller.respond_to?(:id) ? seller : Spree::Seller.find(seller)
      subject = "#{Spree::Config[:site_name]} #{Spree.t('subject_unapprove')} ##{@seller.name}"
      mail(to: @seller.email, from: from_address, subject: subject)
    end
  end
end 
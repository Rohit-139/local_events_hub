class CustomFormBuilder < ActionView::Helpers::FormBuilder
  def text_field(attribute, options = {})
    super(attribute, options.merge(class: "block w-full rounded-md bg-white/5 px-3 py-1.5 text-base text-white outline-1 -outline-offset-1 outline-white/10 placeholder:text-gray-500 focus:outline-2 focus:-outline-offset-2 focus:outline-indigo-500 sm:text-sm/6"))
  end

  def password_field(attribute, options = {})
    super(attribute, options.merge(class: "block w-full rounded-md bg-white/5 px-3 py-1.5 text-base text-white outline-1 -outline-offset-1 outline-white/10 placeholder:text-gray-500 focus:outline-2 focus:-outline-offset-2 focus:outline-indigo-500 sm:text-sm/6"))
  end

  def email_field(attribute, options = {})
    super(attribute, options.merge(class: "block w-full rounded-md bg-white/5 px-3 py-1.5 text-base text-white outline-1 -outline-offset-1 outline-white/10 placeholder:text-gray-500 focus:outline-2 focus:-outline-offset-2 focus:outline-indigo-500 sm:text-sm/6"))
  end

    def number_field(attribute, options = {})
    super(attribute, options.merge(class: "block w-full rounded-md bg-white/5 px-3 py-1.5 text-base text-white outline-1 -outline-offset-1 outline-white/10 placeholder:text-gray-500 focus:outline-2 focus:-outline-offset-2 focus:outline-indigo-500 sm:text-sm/6"))
  end


    def file_field(attribute, options = {})
    super(attribute, options.merge(class: "block w-full rounded-md bg-white/5 px-3 py-1.5 text-base text-white outline-1 -outline-offset-1 outline-white/10 placeholder:text-gray-500 focus:outline-2 focus:-outline-offset-2 focus:outline-indigo-500 sm:text-sm/6"))
  end


    def telephone_field(attribute, options = {})
    super(attribute, options.merge(class: "block w-full rounded-md bg-white/5 px-3 py-1.5 text-base text-gray-800 outline-1 -outline-offset-1 outline-white/10 placeholder:text-gray-500 focus:outline-2 focus:-outline-offset-2 focus:outline-indigo-500 sm:text-sm/6"))
  end

  
end
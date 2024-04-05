class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
    @contact = Contact.new
    @link_url = "https://www.lewagon.com/"
    @link_text = "Le Wagon"
  end

  def new
    @contact = Contact.new
  end


  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.send_mail(@contact).deliver_now
      redirect_to done_path
    else
      # flash[:error] = @contact.errors.full_messages.to_sentence
      render :index
    end
  end

  def done
  end

  # 確認画面を作成する場合はこのような記述になるかと思います。
  # newアクションから入力内容を受け取り、
  # 送信ボタンを押されたらcreateアクションを実行します。
  def confirm
    @contact = Contact.new(contact_params)
    if @contact.invalid?
      render :new
    end
  end
  # 入力内容に誤りがあった場合、
  # 入力内容を保持したまま前のページに戻るのが当たり前になっているかと思いますが、
  # backアクションを定義することで可能となります。
  def back
    @contact = Contact.new(contact_params)
    render :new
  end

  private

  def contact_params
    params.require(:contact).permit(:title, :first_name, :last_name, :email, :message)
  end
end

require 'rails_helper'

describe 'タスク管理機能', type: :system do
    describe '一覧表示機能' do

        # FactoryBotを利用してuserのテストデータを作成
        # letで共通処理を変数化できる
        let(:user_a){ FactoryBot.create(:user, name: 'ユーザーA', name_id: 'ddd') }
        let(:user_b){ FactoryBot.create(:user, name: 'ユーザーB', name_id: 'eee') }

        # FactoryBotを利用してtaskのテストデータを作成
        let!(:task_a) { FactoryBot.create(:task,
                            dantai_kbn: '1', 
                            enduser: '米原市', 
                            motouke: 'ウォーターエージェンシー', 
                            naiyou: '内容', 
                            syubetu_kbn: '通常', 
                            renraku_d: '2020/01/01', 
                            renraku_t: '12:01:01', 
                            sagyou_d: '2020/02/01', 
                            idou: '5.50', 
                            taiou_cd: '123', 
                            del_flg: '0', 
                            user: user_a) }

        before do
            
            # ブラウザでURLを指定してログインする
            visit login_path

            # fill_in テキストにwithで指定した値を入力する
            # ラベルで表示される名称を指定
            fill_in 'ログインID', with: login_user.name_id
            fill_in 'パスワード', with: login_user.password

            # ログインするボタンをクリック
            click_button 'ログインする'
        end

        shared_examples_for 'ユーザーAが作成したタスクが表示される' do
            # 画面の全表示を検索して、米原市の文字があればTrue
            it { expect(page).to have_content '米原市' }
        end

        describe '一覧表示機能' do

            context 'ユーザーAがログインしているとき' do

                # user_a変数を、login_user変数にセットする
                let(:login_user) { user_a }

                # shared_examples_for (itの共通化)がここでcallさえる
                it_behaves_link 'ユーザーAが作成したタスクが表示される'
            end

            context 'ユーザーBがログインしているとき' do

                # user_b変数を、login_user変数にセットする
                let(:login_user) { user_b }

                it 'ユーザーAが作成したタスクが表示されない' do
                    # 画面の全表示を検索して、米原市の文字がなければTrue
                    expect(page).to have_no_content '米原市'
                end
            end
        end

        describe '詳細表示機能' do
            context 'ユーザーAがログインしているとき' do
                
                # user_a変数を、login_user変数にセットする
                let(:login_user) { user_a }

                before do
                    # task_pathのURLを表示する
                    visit task_path(task_a)
                end

                # shared_examples_for (itの共通化)がここでcallさえる
                it_behaves_link 'ユーザーAが作成したタスクが表示される'
            end
        end

        describe '新規作成機能' do

            let(:login_user) { user_a }

            before do
                visit new_task_path
                fill_in 'エンドユーザー', with: task_enduser
                click_button '登録する'
            end

            context '新規作成画面で名称を入力したとき' do
                it '正常に登録される' do
                end
            end

            context '新規作成画面で名称を入力しなかったとき' do
                it 'エラーとなる' do
                end
            end
        end
    end
end

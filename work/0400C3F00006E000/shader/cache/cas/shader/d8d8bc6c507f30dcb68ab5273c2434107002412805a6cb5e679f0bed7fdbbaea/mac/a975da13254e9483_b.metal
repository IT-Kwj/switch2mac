#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

struct _10
{
    uint _m0;
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c9 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    constant _16* vp_c13 [[id(7)]];
    texture2d<float> vp_t_tcb_C [[id(8)]];
    sampler vp_t_tcb_CSmplr [[id(9)]];
    texture3d<float> vp_t_tcb_32 [[id(10)]];
    sampler vp_t_tcb_32Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_30 [[id(12)]];
    sampler vp_t_tcb_30Smplr [[id(13)]];
    texture2d<float> vp_t_tcb_1C [[id(14)]];
    sampler vp_t_tcb_1CSmplr [[id(15)]];
    sampler vp_t_tcb_32Smplr_w [[id(16)]];
    sampler vp_t_tcb_30Smplr_w [[id(17)]];
    sampler vp_t_tcb_1CSmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_65 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_81 [[user(locn3)]];
    float4 m_55 [[user(locn4)]];
    float4 m_69 [[user(locn5)]];
    float4 m_75 [[user(locn6)]];
    float4 m_71 [[user(locn7)]];
    float4 m_73 [[user(locn8)]];
    float4 m_79 [[user(locn9)]];
    float4 m_77 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_63 [[attribute(1)]];
    float4 m_48 [[attribute(2)]];
    float4 m_53 [[attribute(3)]];
    float4 m_57 [[attribute(6)]];
    float4 m_61 [[attribute(7)]];
    float4 m_59 [[attribute(8)]];
};

static inline __attribute__((always_inline))
int _96(thread const int& _8052, thread const int& _8053, constant _10& support_buffer)
{
    float _8056 = as_type<float>(support_buffer._m4);
    int _8058 = _8053 + as_type<int>(_8056);
    int _8060 = 1 + _8058;
    float _8062 = support_buffer._m5[_8060].x;
    float _8064 = abs(_8062);
    bool _8066 = _8064 == 1.0;
    if (_8066)
    {
        return _8052;
    }
    float _8068 = float(_8052);
    float _8070 = _8068 / _8064;
    int _8072 = int(_8070);
    return _8072;
}

static inline __attribute__((always_inline))
int _97(thread const int& _8102, thread const int& _8103, constant _10& support_buffer)
{
    float _8106 = as_type<float>(support_buffer._m4);
    int _8108 = _8103 + as_type<int>(_8106);
    int _8110 = 1 + _8108;
    float _8112 = support_buffer._m5[_8110].x;
    bool _8114 = _8112 == 1.0;
    if (_8114)
    {
        return _8102;
    }
    float _8116 = float(_8102);
    float _8118 = _8116 * _8112;
    int _8120 = int(_8118);
    return _8120;
}

static inline __attribute__((always_inline))
void _94(thread const int& _7736, thread const int& _7737, thread const int& _7738, thread const int& _7739, thread const int& _7740, thread int& _7741, thread int& _7742, thread int& _7743, thread int& _7744, thread int& _7745, thread int& _7746, thread int& _7747, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    int _7750 = _7740;
    int _7752 = _7737;
    int _7754 = _7738;
    float _7756 = 0.0 + as_type<float>(_7736);
    bool _7758 = _7756 != 0.0;
    bool _7760 = isnan(_7756);
    bool _7762 = _7758 || _7760;
    bool _7764 = isnan(0.0);
    bool _7766 = _7762 || _7764;
    int _7768 = as_type<int>(_7756);
    int _7770 = _7766 ? (-1) : 0;
    if (!_7766)
    {
        float _7772 = as_type<float>(_7736) * 1.0;
        _7750 = as_type<int>(_7772);
    }
    int _7774 = _7750;
    bool _7776 = !_7766;
    int _7778 = _7774;
    int _7780 = _7774;
    if (!_7776)
    {
        bool _7782 = _7756 >= 0.0;
        bool _7784 = isnan(_7756);
        bool _7786 = _7782 || _7784;
        bool _7788 = isnan(0.0);
        bool _7790 = _7786 || _7788;
        _7770 = _7790 ? (-1) : 0;
        if (!_7790)
        {
            _7778 = 2147483647;
        }
        int _7792 = _7778;
        bool _7794 = !_7790;
        int _7796 = _7792;
        _7780 = _7792;
        if (!_7794)
        {
            float _7798 = abs(as_type<float>(_7736));
            float _7800 = 0.0 + _7798;
            bool _7802 = _7800 > as_type<float>(0x7f800000u /* inf */);
            bool _7804 = isnan(_7800);
            bool _7806 = _7802 || _7804;
            bool _7808 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _7810 = _7806 || _7808;
            _7768 = as_type<int>(_7800);
            _7770 = _7810 ? (-1) : 0;
            if (_7810)
            {
                float _7812 = as_type<float>(_7736) + 1.0;
                _7796 = as_type<int>(_7812);
            }
            int _7814 = _7796;
            int _7816 = _7814;
            _7780 = _7814;
            if (!_7810)
            {
                bool _7818 = _7800 != as_type<float>(0x7f800000u /* inf */);
                bool _7820 = isnan(_7800);
                bool _7822 = _7818 || _7820;
                bool _7824 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _7826 = _7822 || _7824;
                _7770 = _7826 ? (-1) : 0;
                if (!_7826)
                {
                    _7816 = _7736;
                }
                int _7828 = _7816;
                bool _7830 = !_7826;
                _7780 = _7828;
                if (!_7830)
                {
                    float _7832 = as_type<float>(_7736) * 18446744073709551616.0;
                    float _7834 = rsqrt(_7832);
                    float _7836 = _7832 * _7834;
                    float _7838 = _7834 * 0.5;
                    float _7840 = -_7836;
                    float _7842 = 0.0 + _7840;
                    float _7844 = fma(_7838, _7842, 0.5);
                    float _7846 = fma(_7836, _7844, _7836);
                    float _7848 = -_7846;
                    float _7850 = 0.0 + _7848;
                    float _7852 = fma(_7846, _7850, _7832);
                    float _7854 = fma(_7838, _7852, _7846);
                    float _7856 = _7854 * 2.3283064365386962890625e-10;
                    _7768 = as_type<int>(_7854);
                    _7752 = as_type<int>(_7846);
                    _7754 = as_type<int>(_7842);
                    _7780 = as_type<int>(_7856);
                }
            }
        }
    }
    int _7858 = _7768;
    int _7860 = _7752;
    int _7862 = _7754;
    int _7864 = _7780;
    int _7866 = _7770;
    _7741 = _7739;
    _7742 = 0;
    _7743 = _7858;
    _7744 = _7860;
    _7745 = _7862;
    _7746 = _7864;
    _7747 = _7866;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2803 = false;
    bool _2175 = false;
    bool _1337 = false;
    bool _1145 = false;
    bool _641 = false;
    bool _519 = false;
    bool _399 = false;
    bool _183 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_48.w;
    float _103 = trunc(_101);
    int _105 = int(_103);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    if (!_109)
    {
        out.m_51.x = 0.0;
    }
    int _115 = 0;
    if (!_109)
    {
        float _117 = _113 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    int _121 = _119;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3087 = as_type<float>(_119);
        out.gl_Position.z = _3087;
    }
    if (!_109)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _123 = in.m_53.w;
    float _125 = float(_105);
    float _127 = 1.0 / _125;
    float _129 = -_123;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = _123 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_123);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = _131 * _127;
    bool _145 = _131 >= _125;
    bool _147 = !_141;
    bool _149 = _145 || _147;
    out.m_55.x = _143;
    float _151 = _123;
    float _153 = _131;
    if (_149)
    {
        _151 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _151;
    if (_149)
    {
        out.m_51.x = 0.0;
    }
    if (_149)
    {
        float _157 = _155 * 5.0;
        _121 = as_type<int>(_157);
    }
    int _159 = _121;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3159 = as_type<float>(_159);
        out.gl_Position.z = _3159;
    }
    if (_149)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _161 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _163 = !_161;
    float _181;
    if (!_163)
    {
        float _165 = in.m_57.x;
        float _167 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _169 = _165 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _171 = fma(_169, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _173 = _171 * _167;
        float _175 = floor(_173);
        float _177 = -_175;
        float _179 = _173 + _177;
        _181 = _179;
        _183 = true;
    }
    else
    {
        _181 = _143;
    }
    _183 = false;
    float _185 = _181;
    float _187 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _189 = _185 + _187;
    float _191 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _193 = _185 + _191;
    bool _195 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _197 = isnan(_185);
    bool _199 = _195 || _197;
    bool _201 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _203 = _199 || _201;
    float _205 = float(_203);
    float _207 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _209 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _207;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _213 = _211 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _217 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _215;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _221 = _185 + _219;
    float _223 = 1.0 / _217;
    bool _225 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _227 = 1.0 / _213;
    bool _229 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _231 = isnan(_185);
    bool _233 = _229 || _231;
    bool _235 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _237 = _233 || _235;
    float _239 = float(_237);
    float _241 = 1.0 / _209;
    float _243 = _193 * _223;
    float _245 = -_205;
    float _247 = _245 + 1.0;
    bool _249 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _251 = isnan(_185);
    bool _253 = _249 || _251;
    bool _255 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _257 = _253 || _255;
    float _259 = float(_257);
    float _261 = _239 * _247;
    float _263 = -_239;
    float _265 = _263 + 1.0;
    float _267 = _189 * _227;
    bool _269 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _271 = isnan(_185);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _281;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _287 = _285 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _289 = -_279;
    float _291 = _289 + 1.0;
    float _293 = _279 * _265;
    float _295 = _221 * _241;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _297;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _301;
    float _305 = _259 * _291;
    float _307 = fma(_283, _295, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _309 = fma(_299, _295, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _311 = fma(_303, _295, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _315 = _313 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _317 = -_259;
    float _319 = _317 + 1.0;
    float _321 = _309 * _305;
    float _323 = _311 * _305;
    float _325 = _307 * _305;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _329 = _327 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _331 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[143].x, _321);
    float _333 = fma(_287, _267, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _335;
    float _339 = fma(_315, _267, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _341 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[143].y, _323);
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _343;
    float _347 = fma(_329, _267, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _349 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[143].z, _325);
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _351;
    float _355 = fma(_333, _293, _331);
    float _357 = fma(_337, _243, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _359 = fma(_345, _243, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _361 = fma(_339, _293, _341);
    float _363 = fma(_353, _243, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _365 = fma(_347, _293, _349);
    float _367 = fma(_357, _261, _355);
    float _369 = fma(_359, _261, _361);
    float _371 = fma(_363, _261, _365);
    float _373 = fma(_205, (*spvDescriptorSet0.vp_c9)._m0[146].x, _367);
    float _375 = fma(_205, (*spvDescriptorSet0.vp_c9)._m0[146].y, _369);
    float _377 = fma(_205, (*spvDescriptorSet0.vp_c9)._m0[146].z, _371);
    bool _379 = !_225;
    float _397;
    if (!_379)
    {
        float _381 = in.m_57.x;
        float _383 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _385 = _381 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _387 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[11].x, _131);
        float _389 = _387 * _383;
        float _391 = floor(_389);
        float _393 = -_391;
        float _395 = _389 + _393;
        _397 = _395;
        _399 = true;
    }
    else
    {
        _397 = _143;
    }
    _399 = false;
    float _401 = _397;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _405 = _401 + _403;
    bool _407 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _409 = isnan(_401);
    bool _411 = _407 || _409;
    bool _413 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _415 = _411 || _413;
    float _417 = float(_415);
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _419;
    bool _423 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _425 = isnan(_401);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = -_417;
    float _437 = _435 + 1.0;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _441 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _439;
    float _443 = 1.0 / _421;
    bool _445 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _447 = _433 * _437;
    float _449 = -_433;
    float _451 = _449 + 1.0;
    float _453 = _405 * _443;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _455;
    float _459 = fma(_441, _453, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _461;
    float _465 = fma(_457, _453, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _467 = fma(_463, _453, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _469 = _459 * _447;
    float _471 = _467 * _447;
    float _473 = _465 * _447;
    float _475 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[107].x, _469);
    float _477 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[107].y, _471);
    float _479 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[107].z, _473);
    float _481 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[108].x, _475);
    float _483 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[108].y, _477);
    float _485 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[108].z, _479);
    float _487 = _481 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _489 = _483 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _491 = _485 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _493 = _487 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _495 = _489 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _497 = _491 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _499 = !_445;
    float _517;
    if (!_499)
    {
        float _501 = in.m_57.x;
        float _503 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _505 = _501 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _507 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[11].z, _131);
        float _509 = _507 * _503;
        float _511 = floor(_509);
        float _513 = -_511;
        float _515 = _509 + _513;
        _517 = _515;
        _519 = true;
    }
    else
    {
        _517 = _143;
    }
    _519 = false;
    float _521 = _517;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _525 = _521 + _523;
    bool _527 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _529 = isnan(_521);
    bool _531 = _527 || _529;
    bool _533 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _535 = _531 || _533;
    float _537 = float(_535);
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _539;
    bool _543 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _545 = isnan(_521);
    bool _547 = _543 || _545;
    bool _549 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _551 = _547 || _549;
    float _553 = float(_551);
    float _555 = -_537;
    float _557 = _555 + 1.0;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _559;
    float _563 = 1.0 / _541;
    bool _565 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _567 = _553 * _557;
    float _569 = -_553;
    float _571 = _569 + 1.0;
    float _573 = _525 * _563;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _575;
    float _579 = fma(_561, _573, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _581;
    float _585 = fma(_577, _573, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _587 = fma(_583, _573, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _589 = _579 * _567;
    float _591 = _587 * _567;
    float _593 = _585 * _567;
    float _595 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[123].x, _589);
    float _597 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[123].y, _591);
    float _599 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[123].z, _593);
    float _601 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[124].x, _595);
    float _603 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[124].y, _597);
    float _605 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[124].z, _599);
    float _607 = _601 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _609 = _603 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _611 = _605 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _613 = _607 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _615 = _609 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _617 = _611 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _619 = !_565;
    float _621 = _615;
    float _639;
    if (!_619)
    {
        float _623 = in.m_57.x;
        float _625 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _627 = _623 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _629 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[14].x, _131);
        float _631 = _629 * _625;
        float _633 = floor(_631);
        float _635 = -_633;
        float _637 = _631 + _635;
        _639 = _637;
        _641 = true;
    }
    else
    {
        _639 = _143;
    }
    _641 = false;
    float _643 = _639;
    int _645 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _647 = _645;
    int _649 = 0;
    int _651 = _96(_647, _649, (*spvDescriptorSet0.support_buffer));
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _655 = _643 + _653;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _659 = _643 + _657;
    bool _661 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _663 = isnan(_643);
    bool _665 = _661 || _663;
    bool _667 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _669 = _665 || _667;
    float _671 = float(_669);
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _673;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _679 = _677 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _681;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _687 = _685 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _689 = 1.0 / _675;
    bool _691 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _693 = isnan(_643);
    bool _695 = _691 || _693;
    bool _697 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _699 = _695 || _697;
    float _701 = float(_699);
    float _703 = -_671;
    float _705 = _703 + 1.0;
    bool _707 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _709 = isnan(_643);
    bool _711 = _707 || _709;
    bool _713 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _715 = _711 || _713;
    float _717 = float(_715);
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _721 = _643 + _719;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _725 = _643 + _723;
    bool _727 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _729 = isnan(_643);
    bool _731 = _727 || _729;
    bool _733 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _735 = _731 || _733;
    float _737 = float(_735);
    float _739 = 1.0 / _679;
    float _741 = _701 * _705;
    float _743 = -_701;
    float _745 = _743 + 1.0;
    float _747 = in.m_59.z;
    float _749 = _717 * _745;
    float _751 = 1.0 / _683;
    float _753 = _659 * _689;
    float _755 = -_717;
    float _757 = _755 + 1.0;
    float _759 = _655 * _739;
    float _761 = 1.0 / _687;
    bool _763 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _765 = isnan(_643);
    bool _767 = _763 || _765;
    bool _769 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _771 = _767 || _769;
    float _773 = float(_771);
    bool _775 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _777 = isnan(_643);
    bool _779 = _775 || _777;
    bool _781 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _783 = _779 || _781;
    float _785 = float(_783);
    float _787 = -_773;
    float _789 = _787 + 1.0;
    float _791 = _773 * _757;
    bool _793 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _795 = isnan(_643);
    bool _797 = _793 || _795;
    bool _799 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _801 = _797 || _799;
    float _803 = float(_801);
    float _805 = _721 * _751;
    float _807 = _785 * _789;
    float _809 = -_785;
    float _811 = _809 + 1.0;
    float _813 = -_803;
    float _815 = _813 + 1.0;
    float _817 = _803 * _811;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _821 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _819;
    float _823 = _725 * _761;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _825;
    float _829 = _737 * _815;
    float _831 = fma(_821, _753, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _835 = _833 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _837 = 1.0 / _827;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _841 = _839 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _843 = -_737;
    float _845 = _843 + 1.0;
    float _847 = _831 * _829;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _851 = _643 + _849;
    float _853 = fma(_841, _759, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _855;
    float _859 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[159].x, _847);
    float _861 = 1.0 / _835;
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _865 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _863;
    float _867 = fma(_853, _817, _859);
    float _869 = fma(_857, _805, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _873 = _871 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _875 = 1.0 / _865;
    float _877 = _851 * _837;
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _881 = _643 + _879;
    float _883 = fma(_869, _807, _867);
    float _885 = fma(_873, _823, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _889 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _887;
    float _891 = _881 * _861;
    float _893 = fma(_885, _791, _883);
    float _895 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _897 = _643 + _895;
    float _899 = fma(_889, _877, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _901 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _903 = isnan(_643);
    bool _905 = _901 || _903;
    bool _907 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _909 = _905 || _907;
    float _911 = float(_909);
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _915 = _913 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _917 = fma(_899, _749, _893);
    float _919 = _897 * _875;
    float _921 = fma(_915, _891, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _923 = -_911;
    float _925 = _923 + 1.0;
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _929 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _927;
    float _931 = fma(_921, _741, _917);
    float _933 = _671 * _925;
    float _935 = fma(_929, _919, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _937 = trunc(_747);
    int _939 = int(_937);
    float _941 = fma(_935, _933, _931);
    float _943 = fma(_911, (*spvDescriptorSet0.vp_c9)._m0[166].x, _941);
    float _945 = precise::clamp(_943, 0.0, 1.0);
    int _947 = _651 + (-1);
    float _949 = float(_947);
    float _951 = _945 * _949;
    float _953 = trunc(_951);
    int _955 = int(_953);
    int _957 = _955;
    int _959 = 0;
    int _961 = _97(_957, _959, (*spvDescriptorSet0.support_buffer));
    int _963 = _939;
    int _965 = 0;
    int _967 = _97(_963, _965, (*spvDescriptorSet0.support_buffer));
    float4 _970 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_961, _967)), 0).xyzw;
    float _972 = _970.x;
    float _974 = _970.y;
    float _976 = _970.z;
    float _978 = _970.w;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _982 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _980;
    float _984 = fma(_982, _753, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _986 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _988 = _986 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _990 = _984 * _829;
    float _992 = fma(_988, _759, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _994 = in.m_61.x;
    float _996 = in.m_61.y;
    float _998 = in.m_61.z;
    float _1000 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[159].y, _990);
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1004 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1002;
    float _1006 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1008 = _1006 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1012 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1010;
    float _1014 = fma(_992, _817, _1000);
    float _1016 = fma(_1004, _805, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1018 = fma(_1008, _823, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1020 = fma(_1012, _877, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1022 = fma(_1016, _807, _1014);
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1026 = _1024 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1028 = fma(_1018, _791, _1022);
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1032 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _1030;
    float _1034 = fma(_1026, _891, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _1036 = fma(_1020, _749, _1028);
    float _1038 = fma(_1032, _919, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _1040 = fma(_1034, _741, _1036);
    float _1042 = _373 * _994;
    float _1044 = _375 * _996;
    float _1046 = _377 * _998;
    float _1048 = fma(_1038, _933, _1040);
    int _1050 = _955 + 1;
    float _1052 = fma(_911, (*spvDescriptorSet0.vp_c9)._m0[166].y, _1048);
    int _1054 = min(_947, _1050);
    uint _1057 = as_type<uint>(half2(float2(_978, 0.0)));
    uint _1059 = extract_bits(_1057, 0u, 8u);
    int _1061 = int(_1059) & 255;
    uint _1063 = extract_bits(_1057, 8u, 8u);
    int _1065 = int(_1063) & 255;
    int _1067 = _1065 << 8;
    int _1069 = _1061 | _1067;
    bool _1071 = _1069 >= 32768;
    int _1073 = _1069 + (-1024);
    int _1075 = _1073;
    if (_1071)
    {
        int _1077 = ~_1069;
        int _1079 = _1077 + 33792;
        int _1081 = _1079 + 1;
        _1075 = _1081;
    }
    int _1083 = _1075;
    int _1085 = _1083 + 30719;
    float _1087 = float(_1085);
    float _1089 = fma(_1087, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1091 = abs(_1089);
    float _1093 = -_1091;
    float _1095 = _1093 + 1.0;
    float _1097 = abs(_1089);
    float _1099 = fma(_1097, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _1101 = _1089 < 0.0;
    float _1103 = float(_1101);
    int _1105 = as_type<int>(_1095) + (-218103808);
    float _1107 = abs(_1089);
    float _1109 = fma(_1107, _1099, -0.212114393711090087890625);
    bool _1111 = uint(_1105) >= 1920991232u;
    float _1113 = abs(_1089);
    float _1115 = fma(_1113, _1109, 1.570728778839111328125);
    bool _1117 = !_1111;
    float _1143;
    if (!_1117)
    {
        int _1119 = as_type<int>(_1095);
        int _1121 = as_type<int>(_791);
        int _1123 = as_type<int>(_1012);
        int _1125 = 5536;
        int _1127 = as_type<int>(_992);
        int _1129;
        int _1131;
        int _1133;
        int _1135;
        int _1137;
        int _1139;
        int _1141;
        _94(_1119, _1121, _1123, _1125, _1127, _1129, _1131, _1133, _1135, _1137, _1139, _1141, out.gl_Position, out.gl_PointSize);
        _1143 = as_type<float>(_1139);
        _1145 = true;
    }
    else
    {
        float _1147 = rsqrt(_1095);
        float _1149 = _1095 * _1147;
        float _1151 = _1147 * 0.5;
        float _1153 = -_1149;
        float _1155 = 0.0 + _1153;
        float _1157 = fma(_1151, _1155, 0.5);
        float _1159 = fma(_1149, _1157, _1149);
        float _1161 = -_1159;
        float _1163 = 0.0 + _1161;
        float _1165 = fma(_1159, _1163, _1095);
        float _1167 = fma(_1151, _1165, _1159);
        _1143 = _1167;
    }
    _1145 = false;
    float _1169 = _1143;
    int _1171 = _1054;
    int _1173 = 0;
    int _1175 = _97(_1171, _1173, (*spvDescriptorSet0.support_buffer));
    int _1177 = _939;
    int _1179 = 0;
    int _1181 = _97(_1177, _1179, (*spvDescriptorSet0.support_buffer));
    float4 _1183 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1175, _1181)), 0).xyzw;
    float _1185 = _1183.x;
    float _1187 = _1183.y;
    float _1189 = _1183.z;
    float _1191 = _1183.w;
    float _1193 = _1115 * _1169;
    float _1195 = _1103 * 2.0;
    float _1197 = _1087 * 3.883221149444580078125;
    float _1199 = floor(_951);
    float _1201 = -_1195;
    float _1203 = fma(_1193, _1201, _1193);
    float _1205 = _1197 * 0.15915493667125701904296875;
    float _1207 = fma(_1103, 3.1415927410125732421875, _1203);
    float _1209 = _1205 * 6.283185482025146484375;
    float _1211 = cos(_1209);
    float _1213 = _1207 * 0.15915493667125701904296875;
    float _1215 = _1213 * 6.283185482025146484375;
    float _1217 = sin(_1215);
    float _1219 = -_1199;
    float _1221 = _951 + _1219;
    float _1223 = _1205 * 6.283185482025146484375;
    float _1225 = sin(_1223);
    float _1227 = _1217 * _1211;
    float _1229 = _1217 * _1225;
    uint _1231 = as_type<uint>(half2(float2(_1191, 0.0)));
    float _1233 = -_972;
    float _1235 = _1233 + _1185;
    uint _1237 = extract_bits(_1231, 0u, 8u);
    int _1239 = int(_1237) & 255;
    uint _1241 = extract_bits(_1231, 8u, 8u);
    int _1243 = int(_1241) & 255;
    int _1245 = _1243 << 8;
    int _1247 = _1239 | _1245;
    float _1249 = fma(_1221, _1235, _972);
    bool _1251 = _1247 >= 32768;
    int _1253 = _1247 + (-1024);
    int _1255 = _1253;
    if (_1251)
    {
        int _1257 = ~_1247;
        int _1259 = _1257 + 33792;
        int _1261 = _1259 + 1;
        _1255 = _1261;
    }
    int _1263 = _1255;
    int _1265 = _1263 + 30719;
    float _1267 = float(_1265);
    float _1269 = fma(_1267, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1271 = abs(_1269);
    float _1273 = -_1271;
    float _1275 = _1273 + 1.0;
    float _1277 = abs(_1269);
    float _1279 = fma(_1277, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _1281 = _1269 < 0.0;
    float _1283 = float(_1281);
    int _1285 = as_type<int>(_1275) + (-218103808);
    float _1287 = abs(_1269);
    float _1289 = fma(_1287, _1279, -0.212114393711090087890625);
    bool _1291 = uint(_1285) >= 1920991232u;
    float _1293 = -_974;
    float _1295 = _1293 + _1187;
    float _1297 = -_976;
    float _1299 = _1297 + _1189;
    float _1301 = abs(_1269);
    float _1303 = fma(_1301, _1289, 1.570728778839111328125);
    float _1305 = fma(_1221, _1295, _974);
    float _1307 = fma(_1221, _1299, _976);
    bool _1309 = !_1291;
    float _1335;
    if (!_1309)
    {
        int _1311 = as_type<int>(_1275);
        int _1313 = as_type<int>(_1289);
        int _1315 = as_type<int>(_1275);
        int _1317 = 6432;
        int _1319 = as_type<int>(_1193);
        int _1321;
        int _1323;
        int _1325;
        int _1327;
        int _1329;
        int _1331;
        int _1333;
        _94(_1311, _1313, _1315, _1317, _1319, _1321, _1323, _1325, _1327, _1329, _1331, _1333, out.gl_Position, out.gl_PointSize);
        _1335 = as_type<float>(_1331);
        _1337 = true;
    }
    else
    {
        float _1339 = rsqrt(_1275);
        float _1341 = _1275 * _1339;
        float _1343 = _1339 * 0.5;
        float _1345 = -_1341;
        float _1347 = 0.0 + _1345;
        float _1349 = fma(_1343, _1347, 0.5);
        float _1351 = fma(_1341, _1349, _1341);
        float _1353 = -_1351;
        float _1355 = 0.0 + _1353;
        float _1357 = fma(_1351, _1355, _1275);
        float _1359 = fma(_1343, _1357, _1351);
        _1335 = _1359;
    }
    _1337 = false;
    float _1361 = _1335;
    float _1363 = in.m_57.x;
    float _1365 = in.m_57.y;
    float _1367 = in.m_57.z;
    float _1369 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1371 = log2(_1369);
    float _1373 = _1303 * _1361;
    float _1375 = _1267 * 3.883221149444580078125;
    float _1377 = -_1089;
    float _1379 = _1377 + _1269;
    float _1381 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1383 = 1.0 + _1381;
    int _1385 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1387 = _1385 != 0;
    int _1389 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1391 = _1389 != 0;
    int _1393 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1395 = _1393 != 0;
    float _1397 = _1375 * 0.15915493667125701904296875;
    bool _1399 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1401 = isnan(1.0);
    bool _1403 = _1399 || _1401;
    bool _1405 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1407 = _1403 || _1405;
    float _1409 = 1.0 / _1383;
    bool _1411 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1413 = isnan(0.0);
    bool _1415 = _1411 || _1413;
    bool _1417 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1419 = _1415 || _1417;
    float _1421 = fma(_1221, _1379, _1089);
    float _1423 = _1371 * _131;
    float _1425 = exp2(_1423);
    float _1427 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1429 = _1367 * 2.0;
    float _1431 = _1365 * 2.0;
    float _1433 = _1365 + _1363;
    float _1435 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1427);
    float _1437 = floor(_1429);
    float _1439 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1441 = _1363 * 2.0;
    float _1443 = _1433 + (-1.0);
    float _1445 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _1439);
    float _1447 = floor(_1441);
    float _1449 = -_1425;
    float _1451 = _1449 + 1.0;
    float _1453 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _1455 = _1419 ? _1451 : 0.0;
    float _1457 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1453);
    bool _1459 = _1437 > 0.0;
    float _1461 = floor(_1431);
    bool _1463 = _1437 >= 0.0;
    bool _1465 = isnan(_1437);
    bool _1467 = _1463 || _1465;
    bool _1469 = isnan(0.0);
    bool _1471 = _1467 || _1469;
    float _1473 = _1421;
    float _1475 = 1.0;
    if (_1407)
    {
        float _1477 = _1455 * _1409;
        _153 = _1477;
    }
    float _1479 = _153;
    bool _1481 = !_1387;
    int _1483 = _1481 ? 0 : 1;
    int _1485 = _1471 ? 0 : 1;
    float _1487 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1445);
    bool _1489 = _1447 > 0.0;
    float _1491 = fma(_1443, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1493 = _1447 >= 0.0;
    bool _1495 = isnan(_1447);
    bool _1497 = _1493 || _1495;
    bool _1499 = isnan(0.0);
    bool _1501 = _1497 || _1499;
    float _1503 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1435);
    int _1505 = ~_1485;
    int _1507 = _1505 + 1;
    int _1509 = _1507 + 1;
    float _1511 = in.m_63.x;
    float _1513 = in.m_63.y;
    float _1515 = in.m_63.z;
    int _1517 = abs(_1483);
    float _1519 = 1.0 / _1042;
    int _1521 = _1509;
    if (!_1459)
    {
        int _1523 = ~_1485;
        int _1525 = _1523 + 1;
        _1521 = _1525;
    }
    int _1527 = _1521;
    int _1529 = _1501 ? 0 : 1;
    bool _1531 = _1461 > 0.0;
    bool _1533 = !_1391;
    int _1535 = _1533 ? 0 : 1;
    float _1537 = 1.0 / _1044;
    float _1539 = float(_1517);
    float _1541 = _1042 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1543 = float(_1527);
    int _1545 = ~_1529;
    int _1547 = _1545 + 1;
    int _1549 = _1547 + 1;
    bool _1551 = _1461 >= 0.0;
    bool _1553 = isnan(_1461);
    bool _1555 = _1551 || _1553;
    bool _1557 = isnan(0.0);
    bool _1559 = _1555 || _1557;
    float _1561 = _1539 * _1543;
    int _1563 = abs(_1535);
    float _1565 = 1.0 / _1046;
    int _1567 = _1549;
    if (!_1489)
    {
        int _1569 = ~_1529;
        int _1571 = _1569 + 1;
        _1567 = _1571;
    }
    int _1573 = _1567;
    float _1575 = _1561 * (-2.0);
    float _1577 = _1363 + (-0.5);
    bool _1579 = !_1395;
    int _1581 = _1579 ? 0 : 1;
    float _1583 = fma(_1491, _1575, _1491);
    int _1585 = _1559 ? 0 : 1;
    float _1587 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1457);
    float _1589 = float(_1563);
    float _1591 = _1365 + _1367;
    float _1593 = float(_1573);
    float _1595 = rsqrt(_1503);
    int _1597 = abs(_1581);
    float _1599 = _1305 * _1537;
    int _1601 = ~_1585;
    int _1603 = _1601 + 1;
    int _1605 = _1603 + 1;
    float _1607 = _1589 * _1593;
    int _1609 = _1605;
    if (!_1531)
    {
        int _1611 = ~_1585;
        int _1613 = _1611 + 1;
        _1609 = _1613;
    }
    int _1615 = _1609;
    float _1617 = fma(_1575, _1511, _1511);
    float _1619 = _1607 * (-2.0);
    float _1621 = fma(_1577, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1617);
    float _1623 = _1591 + (-1.0);
    float _1625 = float(_1597);
    float _1627 = rsqrt(_1487);
    float _1629 = float(_1615);
    float _1631 = fma(_1619, _1513, _1513);
    float _1633 = fma(_1623, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1635 = fma(_1583, _1479, _1621);
    float _1637 = _1307 * _1565;
    float _1639 = _1625 * _1629;
    float _1641 = fma(_1633, _1619, _1633);
    float _1643 = _1635 * 0.15915493667125701904296875;
    float _1645 = _1365 + (-0.5);
    float _1647 = _1367 + _1363;
    float _1649 = _1639 * (-2.0);
    float _1651 = rsqrt(_1587);
    float _1653 = fma(_1645, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1631);
    float _1655 = _1647 + (-1.0);
    float _1657 = _1599 * _1627;
    float _1659 = fma(_1641, _1479, _1653);
    float _1661 = fma(_1649, _1515, _1515);
    float _1663 = fma(_1655, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1665 = _1367 + (-0.5);
    float _1667 = _1659 * 0.15915493667125701904296875;
    float _1669 = _1643 * 6.283185482025146484375;
    float _1671 = sin(_1669);
    float _1673 = fma(_1663, _1649, _1663);
    float _1675 = fma(_1665, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1661);
    float _1677 = _1046 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _1679 = _1657 != 0.0;
    bool _1681 = isnan(_1657);
    bool _1683 = _1679 || _1681;
    bool _1685 = isnan(0.0);
    bool _1687 = _1683 || _1685;
    float _1689 = fma(_1673, _1479, _1675);
    float _1691 = _1637 * _1651;
    float _1693 = _1643 * 6.283185482025146484375;
    float _1695 = cos(_1693);
    float _1697 = _1689 * 0.15915493667125701904296875;
    float _1699 = _1249 * _1519;
    float _1701 = _1699 * _1595;
    float _1703 = _1667 * 6.283185482025146484375;
    float _1705 = sin(_1703);
    float _1707 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1691);
    bool _1709 = _1701 == 0.0;
    bool _1711 = !_1687;
    bool _1713 = _1709 && _1711;
    float _1715 = _1667 * 6.283185482025146484375;
    float _1717 = cos(_1715);
    bool _1719 = _1691 == 0.0;
    bool _1721 = _1719 && _1713;
    float _1723 = _1697 * 6.283185482025146484375;
    float _1725 = sin(_1723);
    float _1727 = _1671 * _1705;
    float _1729 = _1695 * _1705;
    float _1731 = _1044 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    if (!_1721)
    {
        float _1733 = fma(_1657, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1421);
        _1473 = _1733;
    }
    float _1735 = _1473;
    float _1737 = _1731 + (-1.0);
    float _1739 = _1697 * 6.283185482025146484375;
    float _1741 = cos(_1739);
    float _1743 = _1695 * _1717;
    float _1745 = fma(_1725, _1743, _1727);
    float _1747 = _1671 * _1717;
    float _1749 = fma(_1725, _1727, _1743);
    float _1751 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1657);
    float _1753 = -_1729;
    float _1755 = fma(_1725, _1747, _1753);
    float _1757 = -_1747;
    float _1759 = fma(_1725, _1729, _1757);
    float _1761 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1701);
    float _1763 = _1695 * _1741;
    float _1765 = _1751 * _1731;
    float _1767 = _1717 * _1741;
    float _1769 = _1671 * _1741;
    float _1771 = _1705 * _1741;
    float _1773 = _1761 * _1541;
    float _1775 = _1763 * _1765;
    float _1777 = -_1765;
    float _1779 = _1725 * _1777;
    float _1781 = _1769 * _1765;
    float _1783 = _1707 * _1677;
    float _1785 = fma(_1745, _1773, _1775);
    float _1787 = fma(_1767, _1773, _1779);
    float _1789 = fma(_1755, _1773, _1781);
    float _1791 = _1701 + _1363;
    float _1793 = fma(_1759, _1783, _1785);
    float _1795 = fma(_1771, _1783, _1787);
    float _1797 = fma(_1749, _1783, _1789);
    float _1799 = _1791 * 5.400000095367431640625;
    float _1801 = _1793 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1803 = _1793 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1805 = _1793 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1807 = floor(_1799);
    float _1809 = fma(_1795, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1801);
    float _1811 = fma(_1795, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1803);
    float _1813 = fma(_1795, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1805);
    float _1815 = _1283 * 2.0;
    float _1817 = fma(_1797, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1809);
    float _1819 = fma(_1797, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1811);
    float _1821 = in.m_48.x;
    float _1823 = in.m_48.y;
    float _1825 = in.m_48.z;
    float _1827 = fma(_1797, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1813);
    float _1829 = _1817 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _1831 = -_1815;
    float _1833 = fma(_1373, _1831, _1373);
    float _1835 = _1541 + (-1.0);
    float _1837 = _1691 + _1367;
    float _1839 = fma(_1819, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1829);
    float _1841 = fma(_1283, 3.1415927410125732421875, _1833);
    float _1843 = _1397 * 6.283185482025146484375;
    float _1845 = cos(_1843);
    float _1847 = -_1807;
    float _1849 = _1799 + _1847;
    float _1851 = fma(_1827, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1839);
    float _1853 = _1817 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1855 = _1841 * 0.15915493667125701904296875;
    float _1857 = _1837 * 5.099999904632568359375;
    float _1859 = _1851 * _1835;
    float _1861 = _1817 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1863 = fma(_1819, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1853);
    float _1865 = floor(_1857);
    float _1867 = _1849 * 6.283185482025146484375;
    float _1869 = fma(_1819, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1861);
    float _1871 = _1677 + (-1.0);
    float _1873 = fma(_1827, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1863);
    float _1875 = _1763 * _1735;
    float _1877 = fma(_1827, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1869);
    float _1879 = _1823 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1881 = _1823 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1883 = _1871 * _1873;
    float _1885 = _1737 * _1877;
    float _1887 = fma(_1821, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1879);
    float _1889 = fma(_1821, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1881);
    float _1891 = _1883 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _1893 = _1883 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _1895 = fma(_1825, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1887);
    float _1897 = fma(_1825, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1889);
    float _1899 = -_1865;
    float _1901 = _1857 + _1899;
    float _1903 = fma(_1885, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1893);
    float _1905 = _1895 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1907 = _1897 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1909 = fma(_1885, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1891);
    float _1911 = fma(_1859, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1903);
    float _1913 = _1905 + _1827;
    float _1915 = _1907 + _1819;
    float _1917 = fma(_1859, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1909);
    float _1919 = _1901 * 6.283185482025146484375;
    float _1921 = _1913 + _1911;
    float _1923 = _1867 * 0.15915493667125701904296875;
    float _1925 = _1915 + _1917;
    float _1927 = _1397 * 6.283185482025146484375;
    float _1929 = sin(_1927);
    float _1931 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1933 = _1921 + _1931;
    float _1935 = _1823 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1937 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1939 = _1925 + _1937;
    float _1941 = _1883 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1943 = _1933 * _1933;
    float _1945 = fma(_1821, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1935);
    float _1947 = _1939 * _1939;
    float _1949 = _1923 * 6.283185482025146484375;
    float _1951 = sin(_1949);
    float _1953 = _1919 * 0.15915493667125701904296875;
    float _1955 = fma(_1825, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1945);
    float _1957 = _1947 + _1943;
    float _1959 = fma(_1885, (*spvDescriptorSet0.vp_c10)._m0[9].y, _1941);
    float _1961 = _1955 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1963 = sqrt(_1957);
    float _1965 = fma(_1859, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1959);
    float _1967 = _1961 + _1817;
    float _1969 = _1967 + _1965;
    float _1971 = _1953 * 6.283185482025146484375;
    float _1973 = sin(_1971);
    float _1975 = _1855 * 6.283185482025146484375;
    float _1977 = sin(_1975);
    bool _1979 = _1963 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1981 = _1951 + _1973;
    float _1983 = _1981 * 0.4000000059604644775390625;
    float _1985 = -_1227;
    float _1987 = fma(_1977, _1845, _1985);
    float _1989 = -_1229;
    float _1991 = fma(_1977, _1929, _1989);
    float _1993 = fma(_1052, _1983, _1969);
    float _1995 = fma(_1221, _1987, _1227);
    float _1997 = fma(_1221, _1991, _1229);
    float _1999 = _1995;
    float _2001 = _1997;
    float _2003 = _1725;
    float _2005 = _1947;
    float _2007 = _1943;
    float _2009 = _1921;
    float _2011 = _1925;
    float _2013 = _1961;
    if (!_1721)
    {
        float _2015 = fma(_1701, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1995);
        _1999 = _2015;
    }
    float _2017 = _1999;
    float _2019 = -_1735;
    float _2021 = _1725 * _2019;
    if (!_1721)
    {
        float _2023 = fma(_1691, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1997);
        _2001 = _2023;
    }
    float _2025 = _2001;
    float _2027 = _1769 * _1735;
    if (!_1979)
    {
        _2003 = _1993;
    }
    float _2029 = _2003;
    bool _2031 = !_1979;
    float _2033 = _2029;
    if (!_2031)
    {
        float _2035 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2037 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2039 = _1963 + _2037;
        float _2041 = _1993 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2043 = rsqrt(_1957);
        float _2045 = _2039 * _2035;
        float _2047 = _2045 * 0.15915493667125701904296875;
        float _2049 = _2047 * 6.283185482025146484375;
        float _2051 = sin(_2049);
        float _2053 = _2047 * 6.283185482025146484375;
        float _2055 = cos(_2053);
        float _2057 = fma(_2051, _2041, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2059 = _2043 * _2057;
        float _2061 = _2055 + (-1.0);
        float _2063 = _1939 * _2059;
        float _2065 = _1933 * _2059;
        float _2067 = _2061 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2069 = _2063 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2071 = _2063 * _2063;
        float _2073 = _2065 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2075 = fma(_1993, _2055, _2067);
        float _2077 = _2065 * _2065;
        _2033 = _2075;
        _2005 = _2071;
        _2007 = _2077;
        _2009 = _2073;
        _2011 = _2069;
    }
    float _2079 = _2033;
    float _2081 = _2005;
    float _2083 = _2007;
    float _2085 = _2009;
    float _2087 = _2011;
    float _2089 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2091 = _2079 + _2089;
    float _2093 = fma(_1745, _2017, _1875);
    float _2095 = fma(_1767, _2017, _2021);
    float _2097 = fma(_1755, _2017, _2027);
    float _2099 = fma(_2091, _2091, _2081);
    float _2101 = fma(_1759, _2025, _2093);
    float _2103 = fma(_1771, _2025, _2095);
    float _2105 = fma(_1749, _2025, _2097);
    float _2107 = _2099 + _2083;
    float _2109 = _2101 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2111 = _2101 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2113 = _2101 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_65.x = _493;
    out.m_65.y = _495;
    out.m_65.z = _497;
    float _2115 = fma(_2103, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2109);
    float _2117 = sqrt(_2107);
    float _2119 = fma(_2103, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2111);
    float _2121 = fma(_2103, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2113);
    float _2123 = fma(_2105, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2115);
    out.m_67.x = _613;
    out.m_67.y = _615;
    out.m_67.z = _617;
    float _2125 = fma(_2105, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2119);
    float _2127 = fma(_2105, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2121);
    out.m_69.y = 1.0;
    out.m_71.x = _2123;
    out.m_71.y = _2125;
    out.m_71.z = _2127;
    bool _2129 = _2117 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2131 = isnan(_2117);
    bool _2133 = _2129 || _2131;
    bool _2135 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2137 = _2133 || _2135;
    float _2139 = _2115;
    if (!_2137)
    {
        _2139 = 1.0;
    }
    float _2141 = _2139;
    bool _2143 = !_2137;
    float _2145 = _2141;
    if (!_2143)
    {
        bool _2147 = _2117 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2149 = isnan(_2117);
        bool _2151 = _2147 || _2149;
        bool _2153 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2155 = _2151 || _2153;
        if (!_2155)
        {
            float _2157 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2159 = _2117 + _2157;
            float _2161 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2163 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2161;
            float _2165 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2167 = _2165 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2169 = 1.0 / _2163;
            float _2171 = _2159 * _2169;
            float _2173 = fma(_2171, _2167, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2145 = _2173;
            _621 = _2169;
            _2175 = true;
        }
        else
        {
            bool _2177 = _2117 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2179 = isnan(_2117);
            bool _2181 = _2177 || _2179;
            bool _2183 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2185 = _2181 || _2183;
            if (!_2185)
            {
                float _2187 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2189 = _2117 + _2187;
                float _2191 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2193 = _2191 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2195 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2197 = _2195 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2199 = 1.0 / _2193;
                float _2201 = _2189 * _2199;
                float _2203 = fma(_2201, _2197, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2145 = _2203;
                _621 = _2199;
                _2175 = true;
            }
            else
            {
                _2145 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2175 = false;
    float _2205 = _2145;
    float _2207 = _621;
    float _2209 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2211 = _2079 + _2209;
    float _2213 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2215 = _2085 + _2213;
    bool _2217 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2219 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2221 = _2217 || _2219;
    bool _2223 = isnan(0.5);
    bool _2225 = _2221 || _2223;
    float _2227 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2229 = _2087 + _2227;
    float _2231 = fma(_2211, _2205, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2233 = fma(_2215, _2205, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2235 = fma(_2229, _2205, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2237 = _2229;
    float _2239 = _2207;
    float _2241 = _2211;
    float _2243 = _2205;
    if (_2225)
    {
        _2237 = _2235;
    }
    float _2245 = _2237;
    float _2247 = _2245;
    if (_2225)
    {
        _2239 = _2231;
    }
    float _2249 = _2239;
    float _2251 = _2249;
    if (_2225)
    {
        _2241 = _2233;
    }
    float _2253 = _2241;
    float _2255 = _2253;
    if (!_2225)
    {
        float _2257 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2259 = _1961 + _2257;
        float _2261 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2263 = _1907 + _2261;
        float _2265 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2267 = _2259 * _2259;
        float _2269 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2271 = _1905 + _2269;
        float _2273 = fma(_2263, _2263, _2267);
        float _2275 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2277 = fma(_2271, _2271, _2273);
        float _2279 = sqrt(_2277);
        float _2281 = _2265 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2283 = -_1961;
        float _2285 = _2283 + _2231;
        float _2287 = precise::min(_2279, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2289 = _2287 * _2275;
        float _2291 = -_1907;
        float _2293 = _2291 + _2235;
        float _2295 = -_1905;
        float _2297 = _2295 + _2233;
        float _2299 = _2281 * _2289;
        float _2301 = fma(_2293, _2299, _1907);
        float _2303 = fma(_2285, _2299, _1961);
        float _2305 = fma(_2297, _2299, _1905);
        _2251 = _2303;
        _2247 = _2301;
        _2255 = _2305;
    }
    float _2307 = _2251;
    float _2309 = _2247;
    float _2311 = _2255;
    float _2313 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2315 = _2307 + _2313;
    float _2317 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2319 = _2309 + _2317;
    float _2321 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2323 = _2311 + _2321;
    float _2325 = _2315 * _2315;
    float _2327 = fma(_2319, _2319, _2325);
    float _2329 = fma(_2323, _2323, _2327);
    float _2331 = rsqrt(_2329);
    float _2333 = _2331 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2335 = _2319 * _2333;
    float _2337 = _2323 * _2333;
    float _2339 = _2335 * _2335;
    float _2341 = _2337 * _2337;
    float _2343 = _2339 + _2341;
    float _2345 = sqrt(_2343);
    bool _2347 = _2345 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2349 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2351 = _2345 + _2349;
    float _2353 = _2331;
    float _2355 = _2351;
    float _2357 = _2315;
    float _2359 = _2335;
    if (_2347)
    {
        float _2361 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2353 = _2361;
    }
    float _2363 = _2353;
    if (_2347)
    {
        float _2365 = rsqrt(_2343);
        _2243 = _2365;
    }
    float _2367 = _2243;
    float _2369 = _2367;
    if (_2347)
    {
        float _2371 = _2351 * _2363;
        _2355 = _2371;
    }
    float _2373 = _2355;
    if (_2347)
    {
        float _2375 = _2373 * 0.15915493667125701904296875;
        _2013 = _2375;
    }
    float _2377 = _2013;
    float _2379 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2381 = _2363;
    float _2383 = _2377;
    if (_2347)
    {
        float _2385 = _2377 * 6.283185482025146484375;
        float _2387 = cos(_2385);
        _2381 = _2387;
    }
    float _2389 = _2381;
    float _2391 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2393 = precise::max(0.0, _2391);
    float _2395 = _2323;
    float _2397 = _2393;
    if (_2347)
    {
        float _2399 = _2377 * 6.283185482025146484375;
        float _2401 = sin(_2399);
        _2395 = _2401;
    }
    float _2403 = _2395;
    float _2405 = -_2333;
    float _2407 = -_2393;
    float _2409 = fma(_2315, _2405, _2407);
    if (_2347)
    {
        float _2411 = _2409 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2357 = _2411;
    }
    float _2413 = _2357;
    float _2415 = _2413;
    float _2417 = _2389;
    if (_2347)
    {
        float _2419 = _2389 + (-1.0);
        _2397 = _2419;
    }
    float _2421 = _2397;
    if (_2347)
    {
        float _2423 = _2421 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2383 = _2423;
    }
    float _2425 = _2383;
    float _2427 = sqrt(_2329);
    float _2429 = _2403;
    if (_2347)
    {
        float _2431 = fma(_2403, _2413, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2415 = _2431;
    }
    float _2433 = _2415;
    float _2435 = _2433;
    if (!_2347)
    {
        _2429 = _2337;
    }
    float _2437 = _2429;
    float _2439 = _2437;
    if (_2347)
    {
        float _2441 = _2367 * _2433;
        _1475 = _2441;
    }
    float _2443 = _1475;
    if (!_2347)
    {
        _2369 = _2409;
    }
    float _2445 = _2369;
    float _2447 = _2445;
    if (_2347)
    {
        float _2449 = fma(_2409, _2389, _2425);
        _2447 = _2449;
    }
    float _2451 = _2447;
    if (!_2347)
    {
        _2435 = _2339;
    }
    float _2453 = _2435;
    float _2455 = _2453;
    if (_2347)
    {
        float _2457 = _2335 * _2443;
        _2359 = _2457;
    }
    float _2459 = _2359;
    if (_2347)
    {
        float _2461 = _2337 * _2443;
        _2439 = _2461;
    }
    float _2463 = _2439;
    if (!_2347)
    {
        _2417 = _2341;
    }
    float _2465 = _2417;
    float _2467 = _2307 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2469 = _2465;
    if (_2347)
    {
        float _2471 = _2459 * _2459;
        _2455 = _2471;
    }
    float _2473 = _2455;
    if (_2347)
    {
        float _2475 = _2463 * _2463;
        _2469 = _2475;
    }
    float _2477 = _2469;
    float _2479 = _2307 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2481 = fma(_2309, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2467);
    float _2483 = fma(_2451, _2451, _2473);
    float _2485 = fma(_2309, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2479);
    float _2487 = _2483 + _2477;
    float _2489 = _2307 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2491 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2493 = fma(_2427, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2491);
    float _2495 = precise::clamp(_2493, 0.0, 1.0);
    float _2497 = fma(_2311, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2481);
    float _2499 = rsqrt(_2487);
    float _2501 = _2307 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2503 = -_2495;
    float _2505 = _2503 + 1.0;
    float _2507 = fma(_2309, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2489);
    float _2509 = _2497 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2511 = fma(_2309, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2501);
    float _2513 = fma(_2311, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2507);
    float _2515 = abs(_2505);
    float _2517 = log2(_2515);
    float _2519 = _2509 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2521 = fma(_2311, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2511);
    float _2523 = _2513 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2525 = fma(_2311, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2485);
    float _2527 = -_2519;
    float _2529 = fma(_2527, _2379, 1.0);
    float _2531 = _2521 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2533 = _2523 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2535 = _2499 * _2459;
    float _2537 = _2499 * _2451;
    float _2539 = _2499 * _2463;
    float _2541 = fma(_2531, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2533);
    float _2543 = _2535 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2545 = _2525 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2547 = log2(_2529);
    float _2549 = fma(_2509, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2541);
    float _2551 = _2517 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2553 = -_2543;
    float _2555 = fma(_2537, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2553);
    float _2557 = _2523 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2559 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2549);
    float _2561 = -_2539;
    float _2563 = fma(_2561, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2555);
    float _2565 = exp2(_2551);
    float _2567 = _2523 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2569 = fma(_2531, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2557);
    float _2571 = fma(_2563, -0.5, 0.5);
    float _2573 = fma(_2563, 0.5, 0.5);
    float _2575 = fma(_2531, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2567);
    float _2577 = _2537 + 1.0;
    float _2579 = fma(_2509, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2569);
    float _2581 = 1.0 / _2559;
    float _2583 = fma(_2509, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2575);
    float _2585 = fma(_2573, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2587 = fma(_2573, _2585, -0.212114393711090087890625);
    float _2589 = sqrt(_2571);
    float _2591 = -_2537;
    float _2593 = fma(_2565, _2577, _2591);
    float _2595 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2583);
    float _2597 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2579);
    float _2599 = _2547 * 0.693147182464599609375;
    float _2601 = fma(_2573, _2587, 1.570728778839111328125);
    float _2603 = fma(_2593, 0.5, 0.5);
    float _2605 = _2595 * _2581;
    float _2607 = _2597 * _2581;
    float _2609 = _2599 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2611 = fma(_2605, 0.5, 0.5);
    float _2613 = fma(_2607, -0.5, 0.5);
    float _2615 = _2589 * 0.636619746685028076171875;
    float3 _6958 = float3(_2611, _2613, _2609);
    float _2617 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6958, float3(0.0), isnan(_6958)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6958, float3(0.0), isnan(_6958)), level(0.0)).x;
    float3 _6969 = float3(_2611, _2613, _2609);
    float4 _2619 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6969, float3(0.0), isnan(_6969)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6969, float3(0.0), isnan(_6969)), level(0.0)).xyzw;
    float _2621 = _2619.x;
    float _2623 = _2619.y;
    float _2625 = _2619.z;
    float _2627 = _2619.w;
    float _2629 = -_2601;
    float _2631 = fma(_2615, _2629, 1.0);
    float2 _6990 = float2(_2631, _2603);
    float3 _2635 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6990, float2(0.0), isnan(_6990)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6990, float2(0.0), isnan(_6990)), level(0.0)).xyz;
    float _2637 = _2635.x;
    float _2639 = _2635.y;
    float _2641 = _2635.z;
    float _2643 = _2517 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2645 = _2523 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_73.x = _2309;
    out.m_73.y = _2307;
    out.m_73.z = _2311;
    bool _2647 = _2427 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2649 = isnan(_2427);
    bool _2651 = _2647 || _2649;
    bool _2653 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2655 = _2651 || _2653;
    float _2657 = fma(_2531, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2645);
    float _2659 = exp2(_2643);
    float _2661 = fma(_2509, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2657);
    float _2663 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2661);
    float _2665 = _2663 + _2559;
    out.gl_Position.x = _2595;
    out.gl_Position.y = _2597;
    out.gl_Position.z = _2663;
    out.gl_Position.w = _2559;
    float _2667 = _2665 * 0.5;
    float _2669 = -_2659;
    float _2671 = _2669 + 1.0;
    float _2673 = _2671 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_75.z = _2667;
    out.m_75.w = _2559;
    float _2675 = -_2673;
    float _2677 = _2675 + 1.0;
    float _2679 = _2559;
    float _2681 = _2663;
    float _2683 = _2597;
    float _2685 = _2667;
    float _2687 = _2595;
    if (!_2655)
    {
        _2679 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2689 = _2679;
    float _2691 = _2689;
    float _2693 = _2689;
    if (!_2655)
    {
        _2681 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2695 = _2681;
    float _2697 = _2695;
    float _2699 = _2695;
    if (!_2655)
    {
        _2683 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2701 = _2683;
    float _2703 = _2701;
    float _2705 = _2701;
    if (!_2655)
    {
        _2685 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2707 = _2685;
    float _2709 = _2707;
    float _2711 = _2707;
    if (!_2655)
    {
        _2687 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2713 = _2687;
    float _2715 = _2673 * _2617;
    float _2717 = _2627 * _2715;
    float _2719 = _2641 * _2715;
    float _2721 = fma(_2637, _2717, _2621);
    float _2723 = fma(_2639, _2717, _2623);
    float _2725 = _2627 * _2677;
    float _2727 = fma(_2627, _2719, _2625);
    float _2729 = _2717;
    float _2731 = _2713;
    float _2733 = _2713;
    if (!_2655)
    {
        _2729 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2735 = _2729;
    out.m_77.x = _2721;
    out.m_77.y = _2723;
    out.m_77.z = _2727;
    out.m_77.w = _2725;
    bool _2737 = !_2655;
    float _2739 = _2735;
    float _2741 = _2735;
    if (!_2737)
    {
        bool _2743 = _2427 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2745 = isnan(_2427);
        bool _2747 = _2743 || _2745;
        bool _2749 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2751 = _2747 || _2749;
        if (!_2751)
        {
            float _2753 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2755 = _2427 + _2753;
            float _2757 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2759 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2757;
            float _2761 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2763 = _2761 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2765 = 1.0 / _2759;
            float _2767 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2769 = _2767 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2771 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2773 = _2771 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2775 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2777 = _2775 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2779 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2781 = _2779 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2783 = _2755 * _2765;
            float _2785 = precise::clamp(_2783, 0.0, 1.0);
            float _2787 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2789 = _2787 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2791 = fma(_2785, _2763, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2793 = fma(_2785, _2789, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2795 = fma(_2785, _2769, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2797 = fma(_2785, _2773, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2799 = fma(_2785, _2777, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2801 = fma(_2785, _2781, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2711 = _2795;
            _2705 = _2799;
            _2741 = _2791;
            _2699 = _2797;
            _2693 = _2793;
            _2733 = _2801;
            _2803 = true;
        }
        else
        {
            bool _2805 = _2427 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2807 = isnan(_2427);
            bool _2809 = _2805 || _2807;
            bool _2811 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2813 = _2809 || _2811;
            if (!_2813)
            {
                _2739 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2815 = _2739;
            _2741 = _2815;
            if (!_2813)
            {
                _2709 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2817 = _2709;
            _2711 = _2817;
            if (!_2813)
            {
                _2691 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2819 = _2691;
            _2693 = _2819;
            if (!_2813)
            {
                _2697 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2821 = _2697;
            _2699 = _2821;
            if (!_2813)
            {
                _2703 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2823 = _2703;
            _2705 = _2823;
            if (!_2813)
            {
                _2731 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2825 = _2731;
            bool _2827 = !_2813;
            _2733 = _2825;
            if (!_2827)
            {
                bool _2829 = _2427 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2831 = isnan(_2427);
                bool _2833 = _2829 || _2831;
                bool _2835 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2837 = _2833 || _2835;
                if (!_2837)
                {
                    float _2839 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2841 = _2427 + _2839;
                    float _2843 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2845 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2843;
                    float _2847 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2849 = _2847 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2851 = 1.0 / _2845;
                    float _2853 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2855 = _2853 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2857 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2859 = _2857 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2861 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2863 = _2861 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2865 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2867 = _2865 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2869 = _2841 * _2851;
                    float _2871 = precise::clamp(_2869, 0.0, 1.0);
                    float _2873 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2875 = _2873 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2877 = fma(_2871, _2849, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2879 = fma(_2871, _2875, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2881 = fma(_2871, _2855, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2883 = fma(_2871, _2859, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2885 = fma(_2871, _2863, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2887 = fma(_2871, _2867, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2711 = _2881;
                    _2705 = _2885;
                    _2741 = _2877;
                    _2699 = _2883;
                    _2693 = _2879;
                    _2733 = _2887;
                    _2803 = true;
                }
                else
                {
                    _2711 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2705 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2741 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2699 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2693 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2733 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2803 = false;
    float _2889 = _2711;
    float _2891 = _2705;
    float _2893 = _2741;
    float _2895 = _2699;
    float _2897 = _2693;
    float _2899 = _2733;
    float _2901 = fma(_2125, -0.5, 0.5);
    float _2903 = precise::clamp(_2901, 0.0, 1.0);
    float _2905 = -_2889;
    float _2907 = _2905 + _2891;
    float _2909 = -_2893;
    float _2911 = _2909 + _2895;
    float _2913 = -_2897;
    float _2915 = _2913 + _2899;
    bool _2917 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2919 = fma(_2903, _2907, _2889);
    float _2921 = fma(_2903, _2911, _2893);
    float _2923 = fma(_2903, _2915, _2897);
    float _2925 = _2919 * 0.586610972881317138671875;
    out.m_79.x = 0.0;
    float _2927 = fma(_2921, 0.298911988735198974609375, _2925);
    float _2929 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2931 = fma(_2923, 0.114477999508380889892578125, _2927);
    out.m_51.x = _2929;
    float _2933 = -_2931;
    float _2935 = _2921 + _2933;
    float _2937 = -_2931;
    float _2939 = _2919 + _2937;
    float _2941 = -_2931;
    float _2943 = _2923 + _2941;
    float _2945 = fma(_2935, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2931);
    float _2947 = fma(_2939, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2931);
    float _2949 = fma(_2943, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2931);
    out.m_81.x = _2945;
    out.m_81.y = _2947;
    out.m_81.z = _2949;
    if (!_2917)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2951 = -_2307;
    float _2953 = _2951 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2955 = -_2309;
    float _2957 = _2955 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2959 = -_2311;
    float _2961 = _2959 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2963 = _2953 * _2953;
    float _2965 = fma(_2957, _2957, _2963);
    float _2967 = fma(_2961, _2961, _2965);
    float _2969 = sqrt(_2967);
    float _2971 = rsqrt(_2967);
    float _2973 = -_2969;
    float _2975 = _2973 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2977 = _2975 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2979 = precise::clamp(_2977, 0.0, 1.0);
    float _2981 = _2957 * _2971;
    float _2983 = _2953 * _2971;
    float _2985 = abs(_2979);
    float _2987 = log2(_2985);
    float _2989 = _2961 * _2971;
    float _2991 = _2981 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2993 = _2125 * _2983;
    float _2995 = -_2983;
    float _2997 = -_2991;
    float _2999 = fma(_2995, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2997);
    float _3001 = fma(_2123, _2981, _2993);
    float _3003 = -_2989;
    float _3005 = fma(_3003, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2999);
    float _3007 = fma(_2127, _2989, _3001);
    float _3009 = precise::clamp(_3007, 0.0, 1.0);
    float _3011 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3013 = _3005 + _3011;
    float _3015 = _2987 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3017 = _3013 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3019 = precise::clamp(_3017, 0.0, 1.0);
    float _3021 = exp2(_3015);
    float _3023 = _3021 * _3019;
    float _3025 = _3009 * _3023;
    float _3027 = _3025 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3029 = _3025 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3031 = _3025 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_79.x = _3027;
    out.m_79.y = _3029;
    out.m_79.z = _3031;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2803 = false;
    bool _2175 = false;
    bool _1337 = false;
    bool _1145 = false;
    bool _641 = false;
    bool _519 = false;
    bool _399 = false;
    bool _183 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_48.w;
    float _103 = trunc(_101);
    int _105 = int(_103);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    if (!_109)
    {
        out.m_51.x = 0.0;
    }
    int _115 = 0;
    if (!_109)
    {
        float _117 = _113 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    int _121 = _119;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3087 = as_type<float>(_119);
        out.gl_Position.z = _3087;
    }
    if (!_109)
    {
        return out;
    }
    float _123 = in.m_53.w;
    float _125 = float(_105);
    float _127 = 1.0 / _125;
    float _129 = -_123;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = _123 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_123);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = _131 * _127;
    bool _145 = _131 >= _125;
    bool _147 = !_141;
    bool _149 = _145 || _147;
    out.m_55.x = _143;
    float _151 = _123;
    float _153 = _131;
    if (_149)
    {
        _151 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _151;
    if (_149)
    {
        out.m_51.x = 0.0;
    }
    if (_149)
    {
        float _157 = _155 * 5.0;
        _121 = as_type<int>(_157);
    }
    int _159 = _121;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3159 = as_type<float>(_159);
        out.gl_Position.z = _3159;
    }
    if (_149)
    {
        return out;
    }
    bool _161 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _163 = !_161;
    float _181;
    if (!_163)
    {
        float _165 = in.m_57.x;
        float _167 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _169 = _165 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _171 = fma(_169, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _173 = _171 * _167;
        float _175 = floor(_173);
        float _177 = -_175;
        float _179 = _173 + _177;
        _181 = _179;
        _183 = true;
    }
    else
    {
        _181 = _143;
    }
    _183 = false;
    float _185 = _181;
    float _187 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _189 = _185 + _187;
    float _191 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _193 = _185 + _191;
    bool _195 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _197 = isnan(_185);
    bool _199 = _195 || _197;
    bool _201 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _203 = _199 || _201;
    float _205 = float(_203);
    float _207 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _209 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _207;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _213 = _211 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _217 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _215;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _221 = _185 + _219;
    float _223 = 1.0 / _217;
    bool _225 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _227 = 1.0 / _213;
    bool _229 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _231 = isnan(_185);
    bool _233 = _229 || _231;
    bool _235 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _237 = _233 || _235;
    float _239 = float(_237);
    float _241 = 1.0 / _209;
    float _243 = _193 * _223;
    float _245 = -_205;
    float _247 = _245 + 1.0;
    bool _249 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _251 = isnan(_185);
    bool _253 = _249 || _251;
    bool _255 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _257 = _253 || _255;
    float _259 = float(_257);
    float _261 = _239 * _247;
    float _263 = -_239;
    float _265 = _263 + 1.0;
    float _267 = _189 * _227;
    bool _269 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _271 = isnan(_185);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _281;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _287 = _285 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _289 = -_279;
    float _291 = _289 + 1.0;
    float _293 = _279 * _265;
    float _295 = _221 * _241;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _297;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _301;
    float _305 = _259 * _291;
    float _307 = fma(_283, _295, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _309 = fma(_299, _295, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _311 = fma(_303, _295, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _315 = _313 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _317 = -_259;
    float _319 = _317 + 1.0;
    float _321 = _309 * _305;
    float _323 = _311 * _305;
    float _325 = _307 * _305;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _329 = _327 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _331 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[143].x, _321);
    float _333 = fma(_287, _267, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _335;
    float _339 = fma(_315, _267, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _341 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[143].y, _323);
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _343;
    float _347 = fma(_329, _267, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _349 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[143].z, _325);
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _351;
    float _355 = fma(_333, _293, _331);
    float _357 = fma(_337, _243, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _359 = fma(_345, _243, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _361 = fma(_339, _293, _341);
    float _363 = fma(_353, _243, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _365 = fma(_347, _293, _349);
    float _367 = fma(_357, _261, _355);
    float _369 = fma(_359, _261, _361);
    float _371 = fma(_363, _261, _365);
    float _373 = fma(_205, (*spvDescriptorSet0.vp_c9)._m0[146].x, _367);
    float _375 = fma(_205, (*spvDescriptorSet0.vp_c9)._m0[146].y, _369);
    float _377 = fma(_205, (*spvDescriptorSet0.vp_c9)._m0[146].z, _371);
    bool _379 = !_225;
    float _397;
    if (!_379)
    {
        float _381 = in.m_57.x;
        float _383 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _385 = _381 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _387 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[11].x, _131);
        float _389 = _387 * _383;
        float _391 = floor(_389);
        float _393 = -_391;
        float _395 = _389 + _393;
        _397 = _395;
        _399 = true;
    }
    else
    {
        _397 = _143;
    }
    _399 = false;
    float _401 = _397;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _405 = _401 + _403;
    bool _407 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _409 = isnan(_401);
    bool _411 = _407 || _409;
    bool _413 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _415 = _411 || _413;
    float _417 = float(_415);
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _419;
    bool _423 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _425 = isnan(_401);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = -_417;
    float _437 = _435 + 1.0;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _441 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _439;
    float _443 = 1.0 / _421;
    bool _445 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _447 = _433 * _437;
    float _449 = -_433;
    float _451 = _449 + 1.0;
    float _453 = _405 * _443;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _455;
    float _459 = fma(_441, _453, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _461;
    float _465 = fma(_457, _453, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _467 = fma(_463, _453, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _469 = _459 * _447;
    float _471 = _467 * _447;
    float _473 = _465 * _447;
    float _475 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[107].x, _469);
    float _477 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[107].y, _471);
    float _479 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[107].z, _473);
    float _481 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[108].x, _475);
    float _483 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[108].y, _477);
    float _485 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[108].z, _479);
    float _487 = _481 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _489 = _483 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _491 = _485 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _493 = _487 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _495 = _489 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _497 = _491 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _499 = !_445;
    float _517;
    if (!_499)
    {
        float _501 = in.m_57.x;
        float _503 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _505 = _501 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _507 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[11].z, _131);
        float _509 = _507 * _503;
        float _511 = floor(_509);
        float _513 = -_511;
        float _515 = _509 + _513;
        _517 = _515;
        _519 = true;
    }
    else
    {
        _517 = _143;
    }
    _519 = false;
    float _521 = _517;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _525 = _521 + _523;
    bool _527 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _529 = isnan(_521);
    bool _531 = _527 || _529;
    bool _533 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _535 = _531 || _533;
    float _537 = float(_535);
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _539;
    bool _543 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _545 = isnan(_521);
    bool _547 = _543 || _545;
    bool _549 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _551 = _547 || _549;
    float _553 = float(_551);
    float _555 = -_537;
    float _557 = _555 + 1.0;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _559;
    float _563 = 1.0 / _541;
    bool _565 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _567 = _553 * _557;
    float _569 = -_553;
    float _571 = _569 + 1.0;
    float _573 = _525 * _563;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _575;
    float _579 = fma(_561, _573, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _581;
    float _585 = fma(_577, _573, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _587 = fma(_583, _573, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _589 = _579 * _567;
    float _591 = _587 * _567;
    float _593 = _585 * _567;
    float _595 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[123].x, _589);
    float _597 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[123].y, _591);
    float _599 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[123].z, _593);
    float _601 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[124].x, _595);
    float _603 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[124].y, _597);
    float _605 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[124].z, _599);
    float _607 = _601 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _609 = _603 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _611 = _605 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _613 = _607 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _615 = _609 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _617 = _611 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _619 = !_565;
    float _621 = _615;
    float _639;
    if (!_619)
    {
        float _623 = in.m_57.x;
        float _625 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _627 = _623 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _629 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[14].x, _131);
        float _631 = _629 * _625;
        float _633 = floor(_631);
        float _635 = -_633;
        float _637 = _631 + _635;
        _639 = _637;
        _641 = true;
    }
    else
    {
        _639 = _143;
    }
    _641 = false;
    float _643 = _639;
    int _645 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _647 = _645;
    int _649 = 0;
    int _651 = _96(_647, _649, (*spvDescriptorSet0.support_buffer));
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _655 = _643 + _653;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _659 = _643 + _657;
    bool _661 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _663 = isnan(_643);
    bool _665 = _661 || _663;
    bool _667 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _669 = _665 || _667;
    float _671 = float(_669);
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _673;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _679 = _677 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _681;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _687 = _685 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _689 = 1.0 / _675;
    bool _691 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _693 = isnan(_643);
    bool _695 = _691 || _693;
    bool _697 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _699 = _695 || _697;
    float _701 = float(_699);
    float _703 = -_671;
    float _705 = _703 + 1.0;
    bool _707 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _709 = isnan(_643);
    bool _711 = _707 || _709;
    bool _713 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _715 = _711 || _713;
    float _717 = float(_715);
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _721 = _643 + _719;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _725 = _643 + _723;
    bool _727 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _729 = isnan(_643);
    bool _731 = _727 || _729;
    bool _733 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _735 = _731 || _733;
    float _737 = float(_735);
    float _739 = 1.0 / _679;
    float _741 = _701 * _705;
    float _743 = -_701;
    float _745 = _743 + 1.0;
    float _747 = in.m_59.z;
    float _749 = _717 * _745;
    float _751 = 1.0 / _683;
    float _753 = _659 * _689;
    float _755 = -_717;
    float _757 = _755 + 1.0;
    float _759 = _655 * _739;
    float _761 = 1.0 / _687;
    bool _763 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _765 = isnan(_643);
    bool _767 = _763 || _765;
    bool _769 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _771 = _767 || _769;
    float _773 = float(_771);
    bool _775 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _777 = isnan(_643);
    bool _779 = _775 || _777;
    bool _781 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _783 = _779 || _781;
    float _785 = float(_783);
    float _787 = -_773;
    float _789 = _787 + 1.0;
    float _791 = _773 * _757;
    bool _793 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _795 = isnan(_643);
    bool _797 = _793 || _795;
    bool _799 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _801 = _797 || _799;
    float _803 = float(_801);
    float _805 = _721 * _751;
    float _807 = _785 * _789;
    float _809 = -_785;
    float _811 = _809 + 1.0;
    float _813 = -_803;
    float _815 = _813 + 1.0;
    float _817 = _803 * _811;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _821 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _819;
    float _823 = _725 * _761;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _825;
    float _829 = _737 * _815;
    float _831 = fma(_821, _753, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _835 = _833 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _837 = 1.0 / _827;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _841 = _839 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _843 = -_737;
    float _845 = _843 + 1.0;
    float _847 = _831 * _829;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _851 = _643 + _849;
    float _853 = fma(_841, _759, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _855;
    float _859 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[159].x, _847);
    float _861 = 1.0 / _835;
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _865 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _863;
    float _867 = fma(_853, _817, _859);
    float _869 = fma(_857, _805, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _873 = _871 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _875 = 1.0 / _865;
    float _877 = _851 * _837;
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _881 = _643 + _879;
    float _883 = fma(_869, _807, _867);
    float _885 = fma(_873, _823, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _889 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _887;
    float _891 = _881 * _861;
    float _893 = fma(_885, _791, _883);
    float _895 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _897 = _643 + _895;
    float _899 = fma(_889, _877, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _901 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _903 = isnan(_643);
    bool _905 = _901 || _903;
    bool _907 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _909 = _905 || _907;
    float _911 = float(_909);
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _915 = _913 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _917 = fma(_899, _749, _893);
    float _919 = _897 * _875;
    float _921 = fma(_915, _891, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _923 = -_911;
    float _925 = _923 + 1.0;
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _929 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _927;
    float _931 = fma(_921, _741, _917);
    float _933 = _671 * _925;
    float _935 = fma(_929, _919, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _937 = trunc(_747);
    int _939 = int(_937);
    float _941 = fma(_935, _933, _931);
    float _943 = fma(_911, (*spvDescriptorSet0.vp_c9)._m0[166].x, _941);
    float _945 = precise::clamp(_943, 0.0, 1.0);
    int _947 = _651 + (-1);
    float _949 = float(_947);
    float _951 = _945 * _949;
    float _953 = trunc(_951);
    int _955 = int(_953);
    int _957 = _955;
    int _959 = 0;
    int _961 = _97(_957, _959, (*spvDescriptorSet0.support_buffer));
    int _963 = _939;
    int _965 = 0;
    int _967 = _97(_963, _965, (*spvDescriptorSet0.support_buffer));
    float4 _970 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_961, _967)), 0).xyzw;
    float _972 = _970.x;
    float _974 = _970.y;
    float _976 = _970.z;
    float _978 = _970.w;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _982 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _980;
    float _984 = fma(_982, _753, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _986 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _988 = _986 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _990 = _984 * _829;
    float _992 = fma(_988, _759, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _994 = in.m_61.x;
    float _996 = in.m_61.y;
    float _998 = in.m_61.z;
    float _1000 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[159].y, _990);
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1004 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1002;
    float _1006 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1008 = _1006 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1012 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1010;
    float _1014 = fma(_992, _817, _1000);
    float _1016 = fma(_1004, _805, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1018 = fma(_1008, _823, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1020 = fma(_1012, _877, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1022 = fma(_1016, _807, _1014);
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1026 = _1024 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1028 = fma(_1018, _791, _1022);
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1032 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _1030;
    float _1034 = fma(_1026, _891, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _1036 = fma(_1020, _749, _1028);
    float _1038 = fma(_1032, _919, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _1040 = fma(_1034, _741, _1036);
    float _1042 = _373 * _994;
    float _1044 = _375 * _996;
    float _1046 = _377 * _998;
    float _1048 = fma(_1038, _933, _1040);
    int _1050 = _955 + 1;
    float _1052 = fma(_911, (*spvDescriptorSet0.vp_c9)._m0[166].y, _1048);
    int _1054 = min(_947, _1050);
    uint _1057 = as_type<uint>(half2(float2(_978, 0.0)));
    uint _1059 = extract_bits(_1057, 0u, 8u);
    int _1061 = int(_1059) & 255;
    uint _1063 = extract_bits(_1057, 8u, 8u);
    int _1065 = int(_1063) & 255;
    int _1067 = _1065 << 8;
    int _1069 = _1061 | _1067;
    bool _1071 = _1069 >= 32768;
    int _1073 = _1069 + (-1024);
    int _1075 = _1073;
    if (_1071)
    {
        int _1077 = ~_1069;
        int _1079 = _1077 + 33792;
        int _1081 = _1079 + 1;
        _1075 = _1081;
    }
    int _1083 = _1075;
    int _1085 = _1083 + 30719;
    float _1087 = float(_1085);
    float _1089 = fma(_1087, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1091 = abs(_1089);
    float _1093 = -_1091;
    float _1095 = _1093 + 1.0;
    float _1097 = abs(_1089);
    float _1099 = fma(_1097, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _1101 = _1089 < 0.0;
    float _1103 = float(_1101);
    int _1105 = as_type<int>(_1095) + (-218103808);
    float _1107 = abs(_1089);
    float _1109 = fma(_1107, _1099, -0.212114393711090087890625);
    bool _1111 = uint(_1105) >= 1920991232u;
    float _1113 = abs(_1089);
    float _1115 = fma(_1113, _1109, 1.570728778839111328125);
    bool _1117 = !_1111;
    float _1143;
    if (!_1117)
    {
        int _1119 = as_type<int>(_1095);
        int _1121 = as_type<int>(_791);
        int _1123 = as_type<int>(_1012);
        int _1125 = 5536;
        int _1127 = as_type<int>(_992);
        int _1129;
        int _1131;
        int _1133;
        int _1135;
        int _1137;
        int _1139;
        int _1141;
        _94(_1119, _1121, _1123, _1125, _1127, _1129, _1131, _1133, _1135, _1137, _1139, _1141, out.gl_Position, out.gl_PointSize);
        _1143 = as_type<float>(_1139);
        _1145 = true;
    }
    else
    {
        float _1147 = rsqrt(_1095);
        float _1149 = _1095 * _1147;
        float _1151 = _1147 * 0.5;
        float _1153 = -_1149;
        float _1155 = 0.0 + _1153;
        float _1157 = fma(_1151, _1155, 0.5);
        float _1159 = fma(_1149, _1157, _1149);
        float _1161 = -_1159;
        float _1163 = 0.0 + _1161;
        float _1165 = fma(_1159, _1163, _1095);
        float _1167 = fma(_1151, _1165, _1159);
        _1143 = _1167;
    }
    _1145 = false;
    float _1169 = _1143;
    int _1171 = _1054;
    int _1173 = 0;
    int _1175 = _97(_1171, _1173, (*spvDescriptorSet0.support_buffer));
    int _1177 = _939;
    int _1179 = 0;
    int _1181 = _97(_1177, _1179, (*spvDescriptorSet0.support_buffer));
    float4 _1183 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1175, _1181)), 0).xyzw;
    float _1185 = _1183.x;
    float _1187 = _1183.y;
    float _1189 = _1183.z;
    float _1191 = _1183.w;
    float _1193 = _1115 * _1169;
    float _1195 = _1103 * 2.0;
    float _1197 = _1087 * 3.883221149444580078125;
    float _1199 = floor(_951);
    float _1201 = -_1195;
    float _1203 = fma(_1193, _1201, _1193);
    float _1205 = _1197 * 0.15915493667125701904296875;
    float _1207 = fma(_1103, 3.1415927410125732421875, _1203);
    float _1209 = _1205 * 6.283185482025146484375;
    float _1211 = cos(_1209);
    float _1213 = _1207 * 0.15915493667125701904296875;
    float _1215 = _1213 * 6.283185482025146484375;
    float _1217 = sin(_1215);
    float _1219 = -_1199;
    float _1221 = _951 + _1219;
    float _1223 = _1205 * 6.283185482025146484375;
    float _1225 = sin(_1223);
    float _1227 = _1217 * _1211;
    float _1229 = _1217 * _1225;
    uint _1231 = as_type<uint>(half2(float2(_1191, 0.0)));
    float _1233 = -_972;
    float _1235 = _1233 + _1185;
    uint _1237 = extract_bits(_1231, 0u, 8u);
    int _1239 = int(_1237) & 255;
    uint _1241 = extract_bits(_1231, 8u, 8u);
    int _1243 = int(_1241) & 255;
    int _1245 = _1243 << 8;
    int _1247 = _1239 | _1245;
    float _1249 = fma(_1221, _1235, _972);
    bool _1251 = _1247 >= 32768;
    int _1253 = _1247 + (-1024);
    int _1255 = _1253;
    if (_1251)
    {
        int _1257 = ~_1247;
        int _1259 = _1257 + 33792;
        int _1261 = _1259 + 1;
        _1255 = _1261;
    }
    int _1263 = _1255;
    int _1265 = _1263 + 30719;
    float _1267 = float(_1265);
    float _1269 = fma(_1267, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1271 = abs(_1269);
    float _1273 = -_1271;
    float _1275 = _1273 + 1.0;
    float _1277 = abs(_1269);
    float _1279 = fma(_1277, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _1281 = _1269 < 0.0;
    float _1283 = float(_1281);
    int _1285 = as_type<int>(_1275) + (-218103808);
    float _1287 = abs(_1269);
    float _1289 = fma(_1287, _1279, -0.212114393711090087890625);
    bool _1291 = uint(_1285) >= 1920991232u;
    float _1293 = -_974;
    float _1295 = _1293 + _1187;
    float _1297 = -_976;
    float _1299 = _1297 + _1189;
    float _1301 = abs(_1269);
    float _1303 = fma(_1301, _1289, 1.570728778839111328125);
    float _1305 = fma(_1221, _1295, _974);
    float _1307 = fma(_1221, _1299, _976);
    bool _1309 = !_1291;
    float _1335;
    if (!_1309)
    {
        int _1311 = as_type<int>(_1275);
        int _1313 = as_type<int>(_1289);
        int _1315 = as_type<int>(_1275);
        int _1317 = 6432;
        int _1319 = as_type<int>(_1193);
        int _1321;
        int _1323;
        int _1325;
        int _1327;
        int _1329;
        int _1331;
        int _1333;
        _94(_1311, _1313, _1315, _1317, _1319, _1321, _1323, _1325, _1327, _1329, _1331, _1333, out.gl_Position, out.gl_PointSize);
        _1335 = as_type<float>(_1331);
        _1337 = true;
    }
    else
    {
        float _1339 = rsqrt(_1275);
        float _1341 = _1275 * _1339;
        float _1343 = _1339 * 0.5;
        float _1345 = -_1341;
        float _1347 = 0.0 + _1345;
        float _1349 = fma(_1343, _1347, 0.5);
        float _1351 = fma(_1341, _1349, _1341);
        float _1353 = -_1351;
        float _1355 = 0.0 + _1353;
        float _1357 = fma(_1351, _1355, _1275);
        float _1359 = fma(_1343, _1357, _1351);
        _1335 = _1359;
    }
    _1337 = false;
    float _1361 = _1335;
    float _1363 = in.m_57.x;
    float _1365 = in.m_57.y;
    float _1367 = in.m_57.z;
    float _1369 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1371 = log2(_1369);
    float _1373 = _1303 * _1361;
    float _1375 = _1267 * 3.883221149444580078125;
    float _1377 = -_1089;
    float _1379 = _1377 + _1269;
    float _1381 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1383 = 1.0 + _1381;
    int _1385 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1387 = _1385 != 0;
    int _1389 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1391 = _1389 != 0;
    int _1393 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1395 = _1393 != 0;
    float _1397 = _1375 * 0.15915493667125701904296875;
    bool _1399 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1401 = isnan(1.0);
    bool _1403 = _1399 || _1401;
    bool _1405 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1407 = _1403 || _1405;
    float _1409 = 1.0 / _1383;
    bool _1411 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1413 = isnan(0.0);
    bool _1415 = _1411 || _1413;
    bool _1417 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1419 = _1415 || _1417;
    float _1421 = fma(_1221, _1379, _1089);
    float _1423 = _1371 * _131;
    float _1425 = exp2(_1423);
    float _1427 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1429 = _1367 * 2.0;
    float _1431 = _1365 * 2.0;
    float _1433 = _1365 + _1363;
    float _1435 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1427);
    float _1437 = floor(_1429);
    float _1439 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1441 = _1363 * 2.0;
    float _1443 = _1433 + (-1.0);
    float _1445 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _1439);
    float _1447 = floor(_1441);
    float _1449 = -_1425;
    float _1451 = _1449 + 1.0;
    float _1453 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _1455 = _1419 ? _1451 : 0.0;
    float _1457 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1453);
    bool _1459 = _1437 > 0.0;
    float _1461 = floor(_1431);
    bool _1463 = _1437 >= 0.0;
    bool _1465 = isnan(_1437);
    bool _1467 = _1463 || _1465;
    bool _1469 = isnan(0.0);
    bool _1471 = _1467 || _1469;
    float _1473 = _1421;
    float _1475 = 1.0;
    if (_1407)
    {
        float _1477 = _1455 * _1409;
        _153 = _1477;
    }
    float _1479 = _153;
    bool _1481 = !_1387;
    int _1483 = _1481 ? 0 : 1;
    int _1485 = _1471 ? 0 : 1;
    float _1487 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1445);
    bool _1489 = _1447 > 0.0;
    float _1491 = fma(_1443, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1493 = _1447 >= 0.0;
    bool _1495 = isnan(_1447);
    bool _1497 = _1493 || _1495;
    bool _1499 = isnan(0.0);
    bool _1501 = _1497 || _1499;
    float _1503 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1435);
    int _1505 = ~_1485;
    int _1507 = _1505 + 1;
    int _1509 = _1507 + 1;
    float _1511 = in.m_63.x;
    float _1513 = in.m_63.y;
    float _1515 = in.m_63.z;
    int _1517 = abs(_1483);
    float _1519 = 1.0 / _1042;
    int _1521 = _1509;
    if (!_1459)
    {
        int _1523 = ~_1485;
        int _1525 = _1523 + 1;
        _1521 = _1525;
    }
    int _1527 = _1521;
    int _1529 = _1501 ? 0 : 1;
    bool _1531 = _1461 > 0.0;
    bool _1533 = !_1391;
    int _1535 = _1533 ? 0 : 1;
    float _1537 = 1.0 / _1044;
    float _1539 = float(_1517);
    float _1541 = _1042 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1543 = float(_1527);
    int _1545 = ~_1529;
    int _1547 = _1545 + 1;
    int _1549 = _1547 + 1;
    bool _1551 = _1461 >= 0.0;
    bool _1553 = isnan(_1461);
    bool _1555 = _1551 || _1553;
    bool _1557 = isnan(0.0);
    bool _1559 = _1555 || _1557;
    float _1561 = _1539 * _1543;
    int _1563 = abs(_1535);
    float _1565 = 1.0 / _1046;
    int _1567 = _1549;
    if (!_1489)
    {
        int _1569 = ~_1529;
        int _1571 = _1569 + 1;
        _1567 = _1571;
    }
    int _1573 = _1567;
    float _1575 = _1561 * (-2.0);
    float _1577 = _1363 + (-0.5);
    bool _1579 = !_1395;
    int _1581 = _1579 ? 0 : 1;
    float _1583 = fma(_1491, _1575, _1491);
    int _1585 = _1559 ? 0 : 1;
    float _1587 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1457);
    float _1589 = float(_1563);
    float _1591 = _1365 + _1367;
    float _1593 = float(_1573);
    float _1595 = rsqrt(_1503);
    int _1597 = abs(_1581);
    float _1599 = _1305 * _1537;
    int _1601 = ~_1585;
    int _1603 = _1601 + 1;
    int _1605 = _1603 + 1;
    float _1607 = _1589 * _1593;
    int _1609 = _1605;
    if (!_1531)
    {
        int _1611 = ~_1585;
        int _1613 = _1611 + 1;
        _1609 = _1613;
    }
    int _1615 = _1609;
    float _1617 = fma(_1575, _1511, _1511);
    float _1619 = _1607 * (-2.0);
    float _1621 = fma(_1577, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1617);
    float _1623 = _1591 + (-1.0);
    float _1625 = float(_1597);
    float _1627 = rsqrt(_1487);
    float _1629 = float(_1615);
    float _1631 = fma(_1619, _1513, _1513);
    float _1633 = fma(_1623, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1635 = fma(_1583, _1479, _1621);
    float _1637 = _1307 * _1565;
    float _1639 = _1625 * _1629;
    float _1641 = fma(_1633, _1619, _1633);
    float _1643 = _1635 * 0.15915493667125701904296875;
    float _1645 = _1365 + (-0.5);
    float _1647 = _1367 + _1363;
    float _1649 = _1639 * (-2.0);
    float _1651 = rsqrt(_1587);
    float _1653 = fma(_1645, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1631);
    float _1655 = _1647 + (-1.0);
    float _1657 = _1599 * _1627;
    float _1659 = fma(_1641, _1479, _1653);
    float _1661 = fma(_1649, _1515, _1515);
    float _1663 = fma(_1655, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1665 = _1367 + (-0.5);
    float _1667 = _1659 * 0.15915493667125701904296875;
    float _1669 = _1643 * 6.283185482025146484375;
    float _1671 = sin(_1669);
    float _1673 = fma(_1663, _1649, _1663);
    float _1675 = fma(_1665, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1661);
    float _1677 = _1046 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _1679 = _1657 != 0.0;
    bool _1681 = isnan(_1657);
    bool _1683 = _1679 || _1681;
    bool _1685 = isnan(0.0);
    bool _1687 = _1683 || _1685;
    float _1689 = fma(_1673, _1479, _1675);
    float _1691 = _1637 * _1651;
    float _1693 = _1643 * 6.283185482025146484375;
    float _1695 = cos(_1693);
    float _1697 = _1689 * 0.15915493667125701904296875;
    float _1699 = _1249 * _1519;
    float _1701 = _1699 * _1595;
    float _1703 = _1667 * 6.283185482025146484375;
    float _1705 = sin(_1703);
    float _1707 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1691);
    bool _1709 = _1701 == 0.0;
    bool _1711 = !_1687;
    bool _1713 = _1709 && _1711;
    float _1715 = _1667 * 6.283185482025146484375;
    float _1717 = cos(_1715);
    bool _1719 = _1691 == 0.0;
    bool _1721 = _1719 && _1713;
    float _1723 = _1697 * 6.283185482025146484375;
    float _1725 = sin(_1723);
    float _1727 = _1671 * _1705;
    float _1729 = _1695 * _1705;
    float _1731 = _1044 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    if (!_1721)
    {
        float _1733 = fma(_1657, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1421);
        _1473 = _1733;
    }
    float _1735 = _1473;
    float _1737 = _1731 + (-1.0);
    float _1739 = _1697 * 6.283185482025146484375;
    float _1741 = cos(_1739);
    float _1743 = _1695 * _1717;
    float _1745 = fma(_1725, _1743, _1727);
    float _1747 = _1671 * _1717;
    float _1749 = fma(_1725, _1727, _1743);
    float _1751 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1657);
    float _1753 = -_1729;
    float _1755 = fma(_1725, _1747, _1753);
    float _1757 = -_1747;
    float _1759 = fma(_1725, _1729, _1757);
    float _1761 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1701);
    float _1763 = _1695 * _1741;
    float _1765 = _1751 * _1731;
    float _1767 = _1717 * _1741;
    float _1769 = _1671 * _1741;
    float _1771 = _1705 * _1741;
    float _1773 = _1761 * _1541;
    float _1775 = _1763 * _1765;
    float _1777 = -_1765;
    float _1779 = _1725 * _1777;
    float _1781 = _1769 * _1765;
    float _1783 = _1707 * _1677;
    float _1785 = fma(_1745, _1773, _1775);
    float _1787 = fma(_1767, _1773, _1779);
    float _1789 = fma(_1755, _1773, _1781);
    float _1791 = _1701 + _1363;
    float _1793 = fma(_1759, _1783, _1785);
    float _1795 = fma(_1771, _1783, _1787);
    float _1797 = fma(_1749, _1783, _1789);
    float _1799 = _1791 * 5.400000095367431640625;
    float _1801 = _1793 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1803 = _1793 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1805 = _1793 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1807 = floor(_1799);
    float _1809 = fma(_1795, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1801);
    float _1811 = fma(_1795, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1803);
    float _1813 = fma(_1795, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1805);
    float _1815 = _1283 * 2.0;
    float _1817 = fma(_1797, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1809);
    float _1819 = fma(_1797, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1811);
    float _1821 = in.m_48.x;
    float _1823 = in.m_48.y;
    float _1825 = in.m_48.z;
    float _1827 = fma(_1797, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1813);
    float _1829 = _1817 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _1831 = -_1815;
    float _1833 = fma(_1373, _1831, _1373);
    float _1835 = _1541 + (-1.0);
    float _1837 = _1691 + _1367;
    float _1839 = fma(_1819, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1829);
    float _1841 = fma(_1283, 3.1415927410125732421875, _1833);
    float _1843 = _1397 * 6.283185482025146484375;
    float _1845 = cos(_1843);
    float _1847 = -_1807;
    float _1849 = _1799 + _1847;
    float _1851 = fma(_1827, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1839);
    float _1853 = _1817 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1855 = _1841 * 0.15915493667125701904296875;
    float _1857 = _1837 * 5.099999904632568359375;
    float _1859 = _1851 * _1835;
    float _1861 = _1817 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1863 = fma(_1819, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1853);
    float _1865 = floor(_1857);
    float _1867 = _1849 * 6.283185482025146484375;
    float _1869 = fma(_1819, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1861);
    float _1871 = _1677 + (-1.0);
    float _1873 = fma(_1827, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1863);
    float _1875 = _1763 * _1735;
    float _1877 = fma(_1827, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1869);
    float _1879 = _1823 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1881 = _1823 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1883 = _1871 * _1873;
    float _1885 = _1737 * _1877;
    float _1887 = fma(_1821, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1879);
    float _1889 = fma(_1821, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1881);
    float _1891 = _1883 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _1893 = _1883 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _1895 = fma(_1825, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1887);
    float _1897 = fma(_1825, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1889);
    float _1899 = -_1865;
    float _1901 = _1857 + _1899;
    float _1903 = fma(_1885, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1893);
    float _1905 = _1895 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1907 = _1897 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1909 = fma(_1885, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1891);
    float _1911 = fma(_1859, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1903);
    float _1913 = _1905 + _1827;
    float _1915 = _1907 + _1819;
    float _1917 = fma(_1859, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1909);
    float _1919 = _1901 * 6.283185482025146484375;
    float _1921 = _1913 + _1911;
    float _1923 = _1867 * 0.15915493667125701904296875;
    float _1925 = _1915 + _1917;
    float _1927 = _1397 * 6.283185482025146484375;
    float _1929 = sin(_1927);
    float _1931 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1933 = _1921 + _1931;
    float _1935 = _1823 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1937 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1939 = _1925 + _1937;
    float _1941 = _1883 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1943 = _1933 * _1933;
    float _1945 = fma(_1821, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1935);
    float _1947 = _1939 * _1939;
    float _1949 = _1923 * 6.283185482025146484375;
    float _1951 = sin(_1949);
    float _1953 = _1919 * 0.15915493667125701904296875;
    float _1955 = fma(_1825, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1945);
    float _1957 = _1947 + _1943;
    float _1959 = fma(_1885, (*spvDescriptorSet0.vp_c10)._m0[9].y, _1941);
    float _1961 = _1955 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1963 = sqrt(_1957);
    float _1965 = fma(_1859, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1959);
    float _1967 = _1961 + _1817;
    float _1969 = _1967 + _1965;
    float _1971 = _1953 * 6.283185482025146484375;
    float _1973 = sin(_1971);
    float _1975 = _1855 * 6.283185482025146484375;
    float _1977 = sin(_1975);
    bool _1979 = _1963 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1981 = _1951 + _1973;
    float _1983 = _1981 * 0.4000000059604644775390625;
    float _1985 = -_1227;
    float _1987 = fma(_1977, _1845, _1985);
    float _1989 = -_1229;
    float _1991 = fma(_1977, _1929, _1989);
    float _1993 = fma(_1052, _1983, _1969);
    float _1995 = fma(_1221, _1987, _1227);
    float _1997 = fma(_1221, _1991, _1229);
    float _1999 = _1995;
    float _2001 = _1997;
    float _2003 = _1725;
    float _2005 = _1947;
    float _2007 = _1943;
    float _2009 = _1921;
    float _2011 = _1925;
    float _2013 = _1961;
    if (!_1721)
    {
        float _2015 = fma(_1701, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1995);
        _1999 = _2015;
    }
    float _2017 = _1999;
    float _2019 = -_1735;
    float _2021 = _1725 * _2019;
    if (!_1721)
    {
        float _2023 = fma(_1691, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1997);
        _2001 = _2023;
    }
    float _2025 = _2001;
    float _2027 = _1769 * _1735;
    if (!_1979)
    {
        _2003 = _1993;
    }
    float _2029 = _2003;
    bool _2031 = !_1979;
    float _2033 = _2029;
    if (!_2031)
    {
        float _2035 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2037 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2039 = _1963 + _2037;
        float _2041 = _1993 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2043 = rsqrt(_1957);
        float _2045 = _2039 * _2035;
        float _2047 = _2045 * 0.15915493667125701904296875;
        float _2049 = _2047 * 6.283185482025146484375;
        float _2051 = sin(_2049);
        float _2053 = _2047 * 6.283185482025146484375;
        float _2055 = cos(_2053);
        float _2057 = fma(_2051, _2041, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2059 = _2043 * _2057;
        float _2061 = _2055 + (-1.0);
        float _2063 = _1939 * _2059;
        float _2065 = _1933 * _2059;
        float _2067 = _2061 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2069 = _2063 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2071 = _2063 * _2063;
        float _2073 = _2065 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2075 = fma(_1993, _2055, _2067);
        float _2077 = _2065 * _2065;
        _2033 = _2075;
        _2005 = _2071;
        _2007 = _2077;
        _2009 = _2073;
        _2011 = _2069;
    }
    float _2079 = _2033;
    float _2081 = _2005;
    float _2083 = _2007;
    float _2085 = _2009;
    float _2087 = _2011;
    float _2089 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2091 = _2079 + _2089;
    float _2093 = fma(_1745, _2017, _1875);
    float _2095 = fma(_1767, _2017, _2021);
    float _2097 = fma(_1755, _2017, _2027);
    float _2099 = fma(_2091, _2091, _2081);
    float _2101 = fma(_1759, _2025, _2093);
    float _2103 = fma(_1771, _2025, _2095);
    float _2105 = fma(_1749, _2025, _2097);
    float _2107 = _2099 + _2083;
    float _2109 = _2101 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2111 = _2101 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2113 = _2101 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_65.x = _493;
    out.m_65.y = _495;
    out.m_65.z = _497;
    float _2115 = fma(_2103, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2109);
    float _2117 = sqrt(_2107);
    float _2119 = fma(_2103, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2111);
    float _2121 = fma(_2103, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2113);
    float _2123 = fma(_2105, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2115);
    out.m_67.x = _613;
    out.m_67.y = _615;
    out.m_67.z = _617;
    float _2125 = fma(_2105, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2119);
    float _2127 = fma(_2105, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2121);
    out.m_69.y = 1.0;
    out.m_71.x = _2123;
    out.m_71.y = _2125;
    out.m_71.z = _2127;
    bool _2129 = _2117 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2131 = isnan(_2117);
    bool _2133 = _2129 || _2131;
    bool _2135 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2137 = _2133 || _2135;
    float _2139 = _2115;
    if (!_2137)
    {
        _2139 = 1.0;
    }
    float _2141 = _2139;
    bool _2143 = !_2137;
    float _2145 = _2141;
    if (!_2143)
    {
        bool _2147 = _2117 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2149 = isnan(_2117);
        bool _2151 = _2147 || _2149;
        bool _2153 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2155 = _2151 || _2153;
        if (!_2155)
        {
            float _2157 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2159 = _2117 + _2157;
            float _2161 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2163 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2161;
            float _2165 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2167 = _2165 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2169 = 1.0 / _2163;
            float _2171 = _2159 * _2169;
            float _2173 = fma(_2171, _2167, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2145 = _2173;
            _621 = _2169;
            _2175 = true;
        }
        else
        {
            bool _2177 = _2117 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2179 = isnan(_2117);
            bool _2181 = _2177 || _2179;
            bool _2183 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2185 = _2181 || _2183;
            if (!_2185)
            {
                float _2187 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2189 = _2117 + _2187;
                float _2191 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2193 = _2191 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2195 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2197 = _2195 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2199 = 1.0 / _2193;
                float _2201 = _2189 * _2199;
                float _2203 = fma(_2201, _2197, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2145 = _2203;
                _621 = _2199;
                _2175 = true;
            }
            else
            {
                _2145 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2175 = false;
    float _2205 = _2145;
    float _2207 = _621;
    float _2209 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2211 = _2079 + _2209;
    float _2213 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2215 = _2085 + _2213;
    bool _2217 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2219 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2221 = _2217 || _2219;
    bool _2223 = isnan(0.5);
    bool _2225 = _2221 || _2223;
    float _2227 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2229 = _2087 + _2227;
    float _2231 = fma(_2211, _2205, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2233 = fma(_2215, _2205, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2235 = fma(_2229, _2205, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2237 = _2229;
    float _2239 = _2207;
    float _2241 = _2211;
    float _2243 = _2205;
    if (_2225)
    {
        _2237 = _2235;
    }
    float _2245 = _2237;
    float _2247 = _2245;
    if (_2225)
    {
        _2239 = _2231;
    }
    float _2249 = _2239;
    float _2251 = _2249;
    if (_2225)
    {
        _2241 = _2233;
    }
    float _2253 = _2241;
    float _2255 = _2253;
    if (!_2225)
    {
        float _2257 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2259 = _1961 + _2257;
        float _2261 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2263 = _1907 + _2261;
        float _2265 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2267 = _2259 * _2259;
        float _2269 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2271 = _1905 + _2269;
        float _2273 = fma(_2263, _2263, _2267);
        float _2275 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2277 = fma(_2271, _2271, _2273);
        float _2279 = sqrt(_2277);
        float _2281 = _2265 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2283 = -_1961;
        float _2285 = _2283 + _2231;
        float _2287 = precise::min(_2279, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2289 = _2287 * _2275;
        float _2291 = -_1907;
        float _2293 = _2291 + _2235;
        float _2295 = -_1905;
        float _2297 = _2295 + _2233;
        float _2299 = _2281 * _2289;
        float _2301 = fma(_2293, _2299, _1907);
        float _2303 = fma(_2285, _2299, _1961);
        float _2305 = fma(_2297, _2299, _1905);
        _2251 = _2303;
        _2247 = _2301;
        _2255 = _2305;
    }
    float _2307 = _2251;
    float _2309 = _2247;
    float _2311 = _2255;
    float _2313 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2315 = _2307 + _2313;
    float _2317 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2319 = _2309 + _2317;
    float _2321 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2323 = _2311 + _2321;
    float _2325 = _2315 * _2315;
    float _2327 = fma(_2319, _2319, _2325);
    float _2329 = fma(_2323, _2323, _2327);
    float _2331 = rsqrt(_2329);
    float _2333 = _2331 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2335 = _2319 * _2333;
    float _2337 = _2323 * _2333;
    float _2339 = _2335 * _2335;
    float _2341 = _2337 * _2337;
    float _2343 = _2339 + _2341;
    float _2345 = sqrt(_2343);
    bool _2347 = _2345 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2349 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2351 = _2345 + _2349;
    float _2353 = _2331;
    float _2355 = _2351;
    float _2357 = _2315;
    float _2359 = _2335;
    if (_2347)
    {
        float _2361 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2353 = _2361;
    }
    float _2363 = _2353;
    if (_2347)
    {
        float _2365 = rsqrt(_2343);
        _2243 = _2365;
    }
    float _2367 = _2243;
    float _2369 = _2367;
    if (_2347)
    {
        float _2371 = _2351 * _2363;
        _2355 = _2371;
    }
    float _2373 = _2355;
    if (_2347)
    {
        float _2375 = _2373 * 0.15915493667125701904296875;
        _2013 = _2375;
    }
    float _2377 = _2013;
    float _2379 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2381 = _2363;
    float _2383 = _2377;
    if (_2347)
    {
        float _2385 = _2377 * 6.283185482025146484375;
        float _2387 = cos(_2385);
        _2381 = _2387;
    }
    float _2389 = _2381;
    float _2391 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2393 = precise::max(0.0, _2391);
    float _2395 = _2323;
    float _2397 = _2393;
    if (_2347)
    {
        float _2399 = _2377 * 6.283185482025146484375;
        float _2401 = sin(_2399);
        _2395 = _2401;
    }
    float _2403 = _2395;
    float _2405 = -_2333;
    float _2407 = -_2393;
    float _2409 = fma(_2315, _2405, _2407);
    if (_2347)
    {
        float _2411 = _2409 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2357 = _2411;
    }
    float _2413 = _2357;
    float _2415 = _2413;
    float _2417 = _2389;
    if (_2347)
    {
        float _2419 = _2389 + (-1.0);
        _2397 = _2419;
    }
    float _2421 = _2397;
    if (_2347)
    {
        float _2423 = _2421 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2383 = _2423;
    }
    float _2425 = _2383;
    float _2427 = sqrt(_2329);
    float _2429 = _2403;
    if (_2347)
    {
        float _2431 = fma(_2403, _2413, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2415 = _2431;
    }
    float _2433 = _2415;
    float _2435 = _2433;
    if (!_2347)
    {
        _2429 = _2337;
    }
    float _2437 = _2429;
    float _2439 = _2437;
    if (_2347)
    {
        float _2441 = _2367 * _2433;
        _1475 = _2441;
    }
    float _2443 = _1475;
    if (!_2347)
    {
        _2369 = _2409;
    }
    float _2445 = _2369;
    float _2447 = _2445;
    if (_2347)
    {
        float _2449 = fma(_2409, _2389, _2425);
        _2447 = _2449;
    }
    float _2451 = _2447;
    if (!_2347)
    {
        _2435 = _2339;
    }
    float _2453 = _2435;
    float _2455 = _2453;
    if (_2347)
    {
        float _2457 = _2335 * _2443;
        _2359 = _2457;
    }
    float _2459 = _2359;
    if (_2347)
    {
        float _2461 = _2337 * _2443;
        _2439 = _2461;
    }
    float _2463 = _2439;
    if (!_2347)
    {
        _2417 = _2341;
    }
    float _2465 = _2417;
    float _2467 = _2307 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2469 = _2465;
    if (_2347)
    {
        float _2471 = _2459 * _2459;
        _2455 = _2471;
    }
    float _2473 = _2455;
    if (_2347)
    {
        float _2475 = _2463 * _2463;
        _2469 = _2475;
    }
    float _2477 = _2469;
    float _2479 = _2307 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2481 = fma(_2309, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2467);
    float _2483 = fma(_2451, _2451, _2473);
    float _2485 = fma(_2309, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2479);
    float _2487 = _2483 + _2477;
    float _2489 = _2307 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2491 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2493 = fma(_2427, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2491);
    float _2495 = precise::clamp(_2493, 0.0, 1.0);
    float _2497 = fma(_2311, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2481);
    float _2499 = rsqrt(_2487);
    float _2501 = _2307 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2503 = -_2495;
    float _2505 = _2503 + 1.0;
    float _2507 = fma(_2309, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2489);
    float _2509 = _2497 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2511 = fma(_2309, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2501);
    float _2513 = fma(_2311, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2507);
    float _2515 = abs(_2505);
    float _2517 = log2(_2515);
    float _2519 = _2509 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2521 = fma(_2311, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2511);
    float _2523 = _2513 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2525 = fma(_2311, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2485);
    float _2527 = -_2519;
    float _2529 = fma(_2527, _2379, 1.0);
    float _2531 = _2521 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2533 = _2523 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2535 = _2499 * _2459;
    float _2537 = _2499 * _2451;
    float _2539 = _2499 * _2463;
    float _2541 = fma(_2531, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2533);
    float _2543 = _2535 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2545 = _2525 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2547 = log2(_2529);
    float _2549 = fma(_2509, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2541);
    float _2551 = _2517 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2553 = -_2543;
    float _2555 = fma(_2537, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2553);
    float _2557 = _2523 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2559 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2549);
    float _2561 = -_2539;
    float _2563 = fma(_2561, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2555);
    float _2565 = exp2(_2551);
    float _2567 = _2523 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2569 = fma(_2531, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2557);
    float _2571 = fma(_2563, -0.5, 0.5);
    float _2573 = fma(_2563, 0.5, 0.5);
    float _2575 = fma(_2531, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2567);
    float _2577 = _2537 + 1.0;
    float _2579 = fma(_2509, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2569);
    float _2581 = 1.0 / _2559;
    float _2583 = fma(_2509, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2575);
    float _2585 = fma(_2573, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2587 = fma(_2573, _2585, -0.212114393711090087890625);
    float _2589 = sqrt(_2571);
    float _2591 = -_2537;
    float _2593 = fma(_2565, _2577, _2591);
    float _2595 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2583);
    float _2597 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2579);
    float _2599 = _2547 * 0.693147182464599609375;
    float _2601 = fma(_2573, _2587, 1.570728778839111328125);
    float _2603 = fma(_2593, 0.5, 0.5);
    float _2605 = _2595 * _2581;
    float _2607 = _2597 * _2581;
    float _2609 = _2599 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2611 = fma(_2605, 0.5, 0.5);
    float _2613 = fma(_2607, -0.5, 0.5);
    float _2615 = _2589 * 0.636619746685028076171875;
    float3 _6958 = float3(_2611, _2613, _2609);
    float _2617 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6958, float3(0.0), isnan(_6958)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6958, float3(0.0), isnan(_6958)), level(0.0)).x;
    float3 _6969 = float3(_2611, _2613, _2609);
    float4 _2619 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6969, float3(0.0), isnan(_6969)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6969, float3(0.0), isnan(_6969)), level(0.0)).xyzw;
    float _2621 = _2619.x;
    float _2623 = _2619.y;
    float _2625 = _2619.z;
    float _2627 = _2619.w;
    float _2629 = -_2601;
    float _2631 = fma(_2615, _2629, 1.0);
    float2 _6990 = float2(_2631, _2603);
    float3 _2635 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6990, float2(0.0), isnan(_6990)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6990, float2(0.0), isnan(_6990)), level(0.0)).xyz;
    float _2637 = _2635.x;
    float _2639 = _2635.y;
    float _2641 = _2635.z;
    float _2643 = _2517 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2645 = _2523 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_73.x = _2309;
    out.m_73.y = _2307;
    out.m_73.z = _2311;
    bool _2647 = _2427 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2649 = isnan(_2427);
    bool _2651 = _2647 || _2649;
    bool _2653 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2655 = _2651 || _2653;
    float _2657 = fma(_2531, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2645);
    float _2659 = exp2(_2643);
    float _2661 = fma(_2509, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2657);
    float _2663 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2661);
    float _2665 = _2663 + _2559;
    out.gl_Position.x = _2595;
    out.gl_Position.y = _2597;
    out.gl_Position.z = _2663;
    out.gl_Position.w = _2559;
    float _2667 = _2665 * 0.5;
    float _2669 = -_2659;
    float _2671 = _2669 + 1.0;
    float _2673 = _2671 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_75.z = _2667;
    out.m_75.w = _2559;
    float _2675 = -_2673;
    float _2677 = _2675 + 1.0;
    float _2679 = _2559;
    float _2681 = _2663;
    float _2683 = _2597;
    float _2685 = _2667;
    float _2687 = _2595;
    if (!_2655)
    {
        _2679 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2689 = _2679;
    float _2691 = _2689;
    float _2693 = _2689;
    if (!_2655)
    {
        _2681 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2695 = _2681;
    float _2697 = _2695;
    float _2699 = _2695;
    if (!_2655)
    {
        _2683 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2701 = _2683;
    float _2703 = _2701;
    float _2705 = _2701;
    if (!_2655)
    {
        _2685 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2707 = _2685;
    float _2709 = _2707;
    float _2711 = _2707;
    if (!_2655)
    {
        _2687 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2713 = _2687;
    float _2715 = _2673 * _2617;
    float _2717 = _2627 * _2715;
    float _2719 = _2641 * _2715;
    float _2721 = fma(_2637, _2717, _2621);
    float _2723 = fma(_2639, _2717, _2623);
    float _2725 = _2627 * _2677;
    float _2727 = fma(_2627, _2719, _2625);
    float _2729 = _2717;
    float _2731 = _2713;
    float _2733 = _2713;
    if (!_2655)
    {
        _2729 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2735 = _2729;
    out.m_77.x = _2721;
    out.m_77.y = _2723;
    out.m_77.z = _2727;
    out.m_77.w = _2725;
    bool _2737 = !_2655;
    float _2739 = _2735;
    float _2741 = _2735;
    if (!_2737)
    {
        bool _2743 = _2427 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2745 = isnan(_2427);
        bool _2747 = _2743 || _2745;
        bool _2749 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2751 = _2747 || _2749;
        if (!_2751)
        {
            float _2753 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2755 = _2427 + _2753;
            float _2757 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2759 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2757;
            float _2761 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2763 = _2761 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2765 = 1.0 / _2759;
            float _2767 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2769 = _2767 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2771 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2773 = _2771 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2775 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2777 = _2775 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2779 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2781 = _2779 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2783 = _2755 * _2765;
            float _2785 = precise::clamp(_2783, 0.0, 1.0);
            float _2787 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2789 = _2787 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2791 = fma(_2785, _2763, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2793 = fma(_2785, _2789, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2795 = fma(_2785, _2769, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2797 = fma(_2785, _2773, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2799 = fma(_2785, _2777, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2801 = fma(_2785, _2781, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2711 = _2795;
            _2705 = _2799;
            _2741 = _2791;
            _2699 = _2797;
            _2693 = _2793;
            _2733 = _2801;
            _2803 = true;
        }
        else
        {
            bool _2805 = _2427 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2807 = isnan(_2427);
            bool _2809 = _2805 || _2807;
            bool _2811 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2813 = _2809 || _2811;
            if (!_2813)
            {
                _2739 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2815 = _2739;
            _2741 = _2815;
            if (!_2813)
            {
                _2709 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2817 = _2709;
            _2711 = _2817;
            if (!_2813)
            {
                _2691 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2819 = _2691;
            _2693 = _2819;
            if (!_2813)
            {
                _2697 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2821 = _2697;
            _2699 = _2821;
            if (!_2813)
            {
                _2703 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2823 = _2703;
            _2705 = _2823;
            if (!_2813)
            {
                _2731 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2825 = _2731;
            bool _2827 = !_2813;
            _2733 = _2825;
            if (!_2827)
            {
                bool _2829 = _2427 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2831 = isnan(_2427);
                bool _2833 = _2829 || _2831;
                bool _2835 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2837 = _2833 || _2835;
                if (!_2837)
                {
                    float _2839 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2841 = _2427 + _2839;
                    float _2843 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2845 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2843;
                    float _2847 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2849 = _2847 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2851 = 1.0 / _2845;
                    float _2853 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2855 = _2853 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2857 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2859 = _2857 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2861 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2863 = _2861 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2865 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2867 = _2865 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2869 = _2841 * _2851;
                    float _2871 = precise::clamp(_2869, 0.0, 1.0);
                    float _2873 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2875 = _2873 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2877 = fma(_2871, _2849, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2879 = fma(_2871, _2875, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2881 = fma(_2871, _2855, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2883 = fma(_2871, _2859, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2885 = fma(_2871, _2863, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2887 = fma(_2871, _2867, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2711 = _2881;
                    _2705 = _2885;
                    _2741 = _2877;
                    _2699 = _2883;
                    _2693 = _2879;
                    _2733 = _2887;
                    _2803 = true;
                }
                else
                {
                    _2711 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2705 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2741 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2699 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2693 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2733 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2803 = false;
    float _2889 = _2711;
    float _2891 = _2705;
    float _2893 = _2741;
    float _2895 = _2699;
    float _2897 = _2693;
    float _2899 = _2733;
    float _2901 = fma(_2125, -0.5, 0.5);
    float _2903 = precise::clamp(_2901, 0.0, 1.0);
    float _2905 = -_2889;
    float _2907 = _2905 + _2891;
    float _2909 = -_2893;
    float _2911 = _2909 + _2895;
    float _2913 = -_2897;
    float _2915 = _2913 + _2899;
    bool _2917 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2919 = fma(_2903, _2907, _2889);
    float _2921 = fma(_2903, _2911, _2893);
    float _2923 = fma(_2903, _2915, _2897);
    float _2925 = _2919 * 0.586610972881317138671875;
    out.m_79.x = 0.0;
    float _2927 = fma(_2921, 0.298911988735198974609375, _2925);
    float _2929 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2931 = fma(_2923, 0.114477999508380889892578125, _2927);
    out.m_51.x = _2929;
    float _2933 = -_2931;
    float _2935 = _2921 + _2933;
    float _2937 = -_2931;
    float _2939 = _2919 + _2937;
    float _2941 = -_2931;
    float _2943 = _2923 + _2941;
    float _2945 = fma(_2935, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2931);
    float _2947 = fma(_2939, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2931);
    float _2949 = fma(_2943, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2931);
    out.m_81.x = _2945;
    out.m_81.y = _2947;
    out.m_81.z = _2949;
    if (!_2917)
    {
        return out;
    }
    float _2951 = -_2307;
    float _2953 = _2951 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2955 = -_2309;
    float _2957 = _2955 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2959 = -_2311;
    float _2961 = _2959 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2963 = _2953 * _2953;
    float _2965 = fma(_2957, _2957, _2963);
    float _2967 = fma(_2961, _2961, _2965);
    float _2969 = sqrt(_2967);
    float _2971 = rsqrt(_2967);
    float _2973 = -_2969;
    float _2975 = _2973 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2977 = _2975 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2979 = precise::clamp(_2977, 0.0, 1.0);
    float _2981 = _2957 * _2971;
    float _2983 = _2953 * _2971;
    float _2985 = abs(_2979);
    float _2987 = log2(_2985);
    float _2989 = _2961 * _2971;
    float _2991 = _2981 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2993 = _2125 * _2983;
    float _2995 = -_2983;
    float _2997 = -_2991;
    float _2999 = fma(_2995, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2997);
    float _3001 = fma(_2123, _2981, _2993);
    float _3003 = -_2989;
    float _3005 = fma(_3003, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2999);
    float _3007 = fma(_2127, _2989, _3001);
    float _3009 = precise::clamp(_3007, 0.0, 1.0);
    float _3011 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3013 = _3005 + _3011;
    float _3015 = _2987 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3017 = _3013 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3019 = precise::clamp(_3017, 0.0, 1.0);
    float _3021 = exp2(_3015);
    float _3023 = _3021 * _3019;
    float _3025 = _3009 * _3023;
    float _3027 = _3025 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3029 = _3025 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3031 = _3025 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_79.x = _3027;
    out.m_79.y = _3029;
    out.m_79.z = _3031;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2803 = false;
    bool _2175 = false;
    bool _1337 = false;
    bool _1145 = false;
    bool _641 = false;
    bool _519 = false;
    bool _399 = false;
    bool _183 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_48.w;
    float _103 = trunc(_101);
    int _105 = int(_103);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    if (!_109)
    {
        out.m_51.x = 0.0;
    }
    int _115 = 0;
    if (!_109)
    {
        float _117 = _113 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    int _121 = _119;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3087 = as_type<float>(_119);
        out.gl_Position.z = _3087;
    }
    if (!_109)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _123 = in.m_53.w;
    float _125 = float(_105);
    float _127 = 1.0 / _125;
    float _129 = -_123;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = _123 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_123);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = _131 * _127;
    bool _145 = _131 >= _125;
    bool _147 = !_141;
    bool _149 = _145 || _147;
    out.m_55.x = _143;
    float _151 = _123;
    float _153 = _131;
    if (_149)
    {
        _151 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _151;
    if (_149)
    {
        out.m_51.x = 0.0;
    }
    if (_149)
    {
        float _157 = _155 * 5.0;
        _121 = as_type<int>(_157);
    }
    int _159 = _121;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3159 = as_type<float>(_159);
        out.gl_Position.z = _3159;
    }
    if (_149)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _161 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _163 = !_161;
    float _181;
    if (!_163)
    {
        float _165 = in.m_57.x;
        float _167 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _169 = _165 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _171 = fma(_169, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _173 = _171 * _167;
        float _175 = floor(_173);
        float _177 = -_175;
        float _179 = _173 + _177;
        _181 = _179;
        _183 = true;
    }
    else
    {
        _181 = _143;
    }
    _183 = false;
    float _185 = _181;
    float _187 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _189 = _185 + _187;
    float _191 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _193 = _185 + _191;
    bool _195 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _197 = isnan(_185);
    bool _199 = _195 || _197;
    bool _201 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _203 = _199 || _201;
    float _205 = float(_203);
    float _207 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _209 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _207;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _213 = _211 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _217 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _215;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _221 = _185 + _219;
    float _223 = 1.0 / _217;
    bool _225 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _227 = 1.0 / _213;
    bool _229 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _231 = isnan(_185);
    bool _233 = _229 || _231;
    bool _235 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _237 = _233 || _235;
    float _239 = float(_237);
    float _241 = 1.0 / _209;
    float _243 = _193 * _223;
    float _245 = -_205;
    float _247 = _245 + 1.0;
    bool _249 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _251 = isnan(_185);
    bool _253 = _249 || _251;
    bool _255 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _257 = _253 || _255;
    float _259 = float(_257);
    float _261 = _239 * _247;
    float _263 = -_239;
    float _265 = _263 + 1.0;
    float _267 = _189 * _227;
    bool _269 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _271 = isnan(_185);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _281;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _287 = _285 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _289 = -_279;
    float _291 = _289 + 1.0;
    float _293 = _279 * _265;
    float _295 = _221 * _241;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _297;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _301;
    float _305 = _259 * _291;
    float _307 = fma(_283, _295, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _309 = fma(_299, _295, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _311 = fma(_303, _295, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _315 = _313 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _317 = -_259;
    float _319 = _317 + 1.0;
    float _321 = _309 * _305;
    float _323 = _311 * _305;
    float _325 = _307 * _305;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _329 = _327 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _331 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[143].x, _321);
    float _333 = fma(_287, _267, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _335;
    float _339 = fma(_315, _267, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _341 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[143].y, _323);
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _343;
    float _347 = fma(_329, _267, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _349 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[143].z, _325);
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _351;
    float _355 = fma(_333, _293, _331);
    float _357 = fma(_337, _243, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _359 = fma(_345, _243, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _361 = fma(_339, _293, _341);
    float _363 = fma(_353, _243, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _365 = fma(_347, _293, _349);
    float _367 = fma(_357, _261, _355);
    float _369 = fma(_359, _261, _361);
    float _371 = fma(_363, _261, _365);
    float _373 = fma(_205, (*spvDescriptorSet0.vp_c9)._m0[146].x, _367);
    float _375 = fma(_205, (*spvDescriptorSet0.vp_c9)._m0[146].y, _369);
    float _377 = fma(_205, (*spvDescriptorSet0.vp_c9)._m0[146].z, _371);
    bool _379 = !_225;
    float _397;
    if (!_379)
    {
        float _381 = in.m_57.x;
        float _383 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _385 = _381 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _387 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[11].x, _131);
        float _389 = _387 * _383;
        float _391 = floor(_389);
        float _393 = -_391;
        float _395 = _389 + _393;
        _397 = _395;
        _399 = true;
    }
    else
    {
        _397 = _143;
    }
    _399 = false;
    float _401 = _397;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _405 = _401 + _403;
    bool _407 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _409 = isnan(_401);
    bool _411 = _407 || _409;
    bool _413 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _415 = _411 || _413;
    float _417 = float(_415);
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _419;
    bool _423 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _425 = isnan(_401);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = -_417;
    float _437 = _435 + 1.0;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _441 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _439;
    float _443 = 1.0 / _421;
    bool _445 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _447 = _433 * _437;
    float _449 = -_433;
    float _451 = _449 + 1.0;
    float _453 = _405 * _443;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _455;
    float _459 = fma(_441, _453, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _461;
    float _465 = fma(_457, _453, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _467 = fma(_463, _453, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _469 = _459 * _447;
    float _471 = _467 * _447;
    float _473 = _465 * _447;
    float _475 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[107].x, _469);
    float _477 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[107].y, _471);
    float _479 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[107].z, _473);
    float _481 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[108].x, _475);
    float _483 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[108].y, _477);
    float _485 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[108].z, _479);
    float _487 = _481 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _489 = _483 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _491 = _485 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _493 = _487 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _495 = _489 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _497 = _491 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _499 = !_445;
    float _517;
    if (!_499)
    {
        float _501 = in.m_57.x;
        float _503 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _505 = _501 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _507 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[11].z, _131);
        float _509 = _507 * _503;
        float _511 = floor(_509);
        float _513 = -_511;
        float _515 = _509 + _513;
        _517 = _515;
        _519 = true;
    }
    else
    {
        _517 = _143;
    }
    _519 = false;
    float _521 = _517;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _525 = _521 + _523;
    bool _527 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _529 = isnan(_521);
    bool _531 = _527 || _529;
    bool _533 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _535 = _531 || _533;
    float _537 = float(_535);
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _539;
    bool _543 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _545 = isnan(_521);
    bool _547 = _543 || _545;
    bool _549 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _551 = _547 || _549;
    float _553 = float(_551);
    float _555 = -_537;
    float _557 = _555 + 1.0;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _559;
    float _563 = 1.0 / _541;
    bool _565 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _567 = _553 * _557;
    float _569 = -_553;
    float _571 = _569 + 1.0;
    float _573 = _525 * _563;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _575;
    float _579 = fma(_561, _573, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _581;
    float _585 = fma(_577, _573, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _587 = fma(_583, _573, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _589 = _579 * _567;
    float _591 = _587 * _567;
    float _593 = _585 * _567;
    float _595 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[123].x, _589);
    float _597 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[123].y, _591);
    float _599 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[123].z, _593);
    float _601 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[124].x, _595);
    float _603 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[124].y, _597);
    float _605 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[124].z, _599);
    float _607 = _601 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _609 = _603 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _611 = _605 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _613 = _607 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _615 = _609 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _617 = _611 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _619 = !_565;
    float _621 = _615;
    float _639;
    if (!_619)
    {
        float _623 = in.m_57.x;
        float _625 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _627 = _623 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _629 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[14].x, _131);
        float _631 = _629 * _625;
        float _633 = floor(_631);
        float _635 = -_633;
        float _637 = _631 + _635;
        _639 = _637;
        _641 = true;
    }
    else
    {
        _639 = _143;
    }
    _641 = false;
    float _643 = _639;
    int _645 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _647 = _645;
    int _649 = 0;
    int _651 = _96(_647, _649, (*spvDescriptorSet0.support_buffer));
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _655 = _643 + _653;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _659 = _643 + _657;
    bool _661 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _663 = isnan(_643);
    bool _665 = _661 || _663;
    bool _667 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _669 = _665 || _667;
    float _671 = float(_669);
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _673;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _679 = _677 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _681;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _687 = _685 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _689 = 1.0 / _675;
    bool _691 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _693 = isnan(_643);
    bool _695 = _691 || _693;
    bool _697 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _699 = _695 || _697;
    float _701 = float(_699);
    float _703 = -_671;
    float _705 = _703 + 1.0;
    bool _707 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _709 = isnan(_643);
    bool _711 = _707 || _709;
    bool _713 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _715 = _711 || _713;
    float _717 = float(_715);
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _721 = _643 + _719;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _725 = _643 + _723;
    bool _727 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _729 = isnan(_643);
    bool _731 = _727 || _729;
    bool _733 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _735 = _731 || _733;
    float _737 = float(_735);
    float _739 = 1.0 / _679;
    float _741 = _701 * _705;
    float _743 = -_701;
    float _745 = _743 + 1.0;
    float _747 = in.m_59.z;
    float _749 = _717 * _745;
    float _751 = 1.0 / _683;
    float _753 = _659 * _689;
    float _755 = -_717;
    float _757 = _755 + 1.0;
    float _759 = _655 * _739;
    float _761 = 1.0 / _687;
    bool _763 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _765 = isnan(_643);
    bool _767 = _763 || _765;
    bool _769 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _771 = _767 || _769;
    float _773 = float(_771);
    bool _775 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _777 = isnan(_643);
    bool _779 = _775 || _777;
    bool _781 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _783 = _779 || _781;
    float _785 = float(_783);
    float _787 = -_773;
    float _789 = _787 + 1.0;
    float _791 = _773 * _757;
    bool _793 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _795 = isnan(_643);
    bool _797 = _793 || _795;
    bool _799 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _801 = _797 || _799;
    float _803 = float(_801);
    float _805 = _721 * _751;
    float _807 = _785 * _789;
    float _809 = -_785;
    float _811 = _809 + 1.0;
    float _813 = -_803;
    float _815 = _813 + 1.0;
    float _817 = _803 * _811;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _821 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _819;
    float _823 = _725 * _761;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _825;
    float _829 = _737 * _815;
    float _831 = fma(_821, _753, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _835 = _833 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _837 = 1.0 / _827;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _841 = _839 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _843 = -_737;
    float _845 = _843 + 1.0;
    float _847 = _831 * _829;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _851 = _643 + _849;
    float _853 = fma(_841, _759, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _855;
    float _859 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[159].x, _847);
    float _861 = 1.0 / _835;
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _865 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _863;
    float _867 = fma(_853, _817, _859);
    float _869 = fma(_857, _805, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _873 = _871 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _875 = 1.0 / _865;
    float _877 = _851 * _837;
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _881 = _643 + _879;
    float _883 = fma(_869, _807, _867);
    float _885 = fma(_873, _823, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _889 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _887;
    float _891 = _881 * _861;
    float _893 = fma(_885, _791, _883);
    float _895 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _897 = _643 + _895;
    float _899 = fma(_889, _877, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _901 = _643 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _903 = isnan(_643);
    bool _905 = _901 || _903;
    bool _907 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _909 = _905 || _907;
    float _911 = float(_909);
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _915 = _913 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _917 = fma(_899, _749, _893);
    float _919 = _897 * _875;
    float _921 = fma(_915, _891, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _923 = -_911;
    float _925 = _923 + 1.0;
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _929 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _927;
    float _931 = fma(_921, _741, _917);
    float _933 = _671 * _925;
    float _935 = fma(_929, _919, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _937 = trunc(_747);
    int _939 = int(_937);
    float _941 = fma(_935, _933, _931);
    float _943 = fma(_911, (*spvDescriptorSet0.vp_c9)._m0[166].x, _941);
    float _945 = precise::clamp(_943, 0.0, 1.0);
    int _947 = _651 + (-1);
    float _949 = float(_947);
    float _951 = _945 * _949;
    float _953 = trunc(_951);
    int _955 = int(_953);
    int _957 = _955;
    int _959 = 0;
    int _961 = _97(_957, _959, (*spvDescriptorSet0.support_buffer));
    int _963 = _939;
    int _965 = 0;
    int _967 = _97(_963, _965, (*spvDescriptorSet0.support_buffer));
    float4 _970 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_961, _967)), 0).xyzw;
    float _972 = _970.x;
    float _974 = _970.y;
    float _976 = _970.z;
    float _978 = _970.w;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _982 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _980;
    float _984 = fma(_982, _753, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _986 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _988 = _986 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _990 = _984 * _829;
    float _992 = fma(_988, _759, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _994 = in.m_61.x;
    float _996 = in.m_61.y;
    float _998 = in.m_61.z;
    float _1000 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[159].y, _990);
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1004 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1002;
    float _1006 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1008 = _1006 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1012 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1010;
    float _1014 = fma(_992, _817, _1000);
    float _1016 = fma(_1004, _805, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1018 = fma(_1008, _823, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1020 = fma(_1012, _877, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1022 = fma(_1016, _807, _1014);
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1026 = _1024 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1028 = fma(_1018, _791, _1022);
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1032 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _1030;
    float _1034 = fma(_1026, _891, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _1036 = fma(_1020, _749, _1028);
    float _1038 = fma(_1032, _919, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _1040 = fma(_1034, _741, _1036);
    float _1042 = _373 * _994;
    float _1044 = _375 * _996;
    float _1046 = _377 * _998;
    float _1048 = fma(_1038, _933, _1040);
    int _1050 = _955 + 1;
    float _1052 = fma(_911, (*spvDescriptorSet0.vp_c9)._m0[166].y, _1048);
    int _1054 = min(_947, _1050);
    uint _1057 = as_type<uint>(half2(float2(_978, 0.0)));
    uint _1059 = extract_bits(_1057, 0u, 8u);
    int _1061 = int(_1059) & 255;
    uint _1063 = extract_bits(_1057, 8u, 8u);
    int _1065 = int(_1063) & 255;
    int _1067 = _1065 << 8;
    int _1069 = _1061 | _1067;
    bool _1071 = _1069 >= 32768;
    int _1073 = _1069 + (-1024);
    int _1075 = _1073;
    if (_1071)
    {
        int _1077 = ~_1069;
        int _1079 = _1077 + 33792;
        int _1081 = _1079 + 1;
        _1075 = _1081;
    }
    int _1083 = _1075;
    int _1085 = _1083 + 30719;
    float _1087 = float(_1085);
    float _1089 = fma(_1087, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1091 = abs(_1089);
    float _1093 = -_1091;
    float _1095 = _1093 + 1.0;
    float _1097 = abs(_1089);
    float _1099 = fma(_1097, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _1101 = _1089 < 0.0;
    float _1103 = float(_1101);
    int _1105 = as_type<int>(_1095) + (-218103808);
    float _1107 = abs(_1089);
    float _1109 = fma(_1107, _1099, -0.212114393711090087890625);
    bool _1111 = uint(_1105) >= 1920991232u;
    float _1113 = abs(_1089);
    float _1115 = fma(_1113, _1109, 1.570728778839111328125);
    bool _1117 = !_1111;
    float _1143;
    if (!_1117)
    {
        int _1119 = as_type<int>(_1095);
        int _1121 = as_type<int>(_791);
        int _1123 = as_type<int>(_1012);
        int _1125 = 5536;
        int _1127 = as_type<int>(_992);
        int _1129;
        int _1131;
        int _1133;
        int _1135;
        int _1137;
        int _1139;
        int _1141;
        _94(_1119, _1121, _1123, _1125, _1127, _1129, _1131, _1133, _1135, _1137, _1139, _1141, out.gl_Position, out.gl_PointSize);
        _1143 = as_type<float>(_1139);
        _1145 = true;
    }
    else
    {
        float _1147 = rsqrt(_1095);
        float _1149 = _1095 * _1147;
        float _1151 = _1147 * 0.5;
        float _1153 = -_1149;
        float _1155 = 0.0 + _1153;
        float _1157 = fma(_1151, _1155, 0.5);
        float _1159 = fma(_1149, _1157, _1149);
        float _1161 = -_1159;
        float _1163 = 0.0 + _1161;
        float _1165 = fma(_1159, _1163, _1095);
        float _1167 = fma(_1151, _1165, _1159);
        _1143 = _1167;
    }
    _1145 = false;
    float _1169 = _1143;
    int _1171 = _1054;
    int _1173 = 0;
    int _1175 = _97(_1171, _1173, (*spvDescriptorSet0.support_buffer));
    int _1177 = _939;
    int _1179 = 0;
    int _1181 = _97(_1177, _1179, (*spvDescriptorSet0.support_buffer));
    float4 _1183 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1175, _1181)), 0).xyzw;
    float _1185 = _1183.x;
    float _1187 = _1183.y;
    float _1189 = _1183.z;
    float _1191 = _1183.w;
    float _1193 = _1115 * _1169;
    float _1195 = _1103 * 2.0;
    float _1197 = _1087 * 3.883221149444580078125;
    float _1199 = floor(_951);
    float _1201 = -_1195;
    float _1203 = fma(_1193, _1201, _1193);
    float _1205 = _1197 * 0.15915493667125701904296875;
    float _1207 = fma(_1103, 3.1415927410125732421875, _1203);
    float _1209 = _1205 * 6.283185482025146484375;
    float _1211 = cos(_1209);
    float _1213 = _1207 * 0.15915493667125701904296875;
    float _1215 = _1213 * 6.283185482025146484375;
    float _1217 = sin(_1215);
    float _1219 = -_1199;
    float _1221 = _951 + _1219;
    float _1223 = _1205 * 6.283185482025146484375;
    float _1225 = sin(_1223);
    float _1227 = _1217 * _1211;
    float _1229 = _1217 * _1225;
    uint _1231 = as_type<uint>(half2(float2(_1191, 0.0)));
    float _1233 = -_972;
    float _1235 = _1233 + _1185;
    uint _1237 = extract_bits(_1231, 0u, 8u);
    int _1239 = int(_1237) & 255;
    uint _1241 = extract_bits(_1231, 8u, 8u);
    int _1243 = int(_1241) & 255;
    int _1245 = _1243 << 8;
    int _1247 = _1239 | _1245;
    float _1249 = fma(_1221, _1235, _972);
    bool _1251 = _1247 >= 32768;
    int _1253 = _1247 + (-1024);
    int _1255 = _1253;
    if (_1251)
    {
        int _1257 = ~_1247;
        int _1259 = _1257 + 33792;
        int _1261 = _1259 + 1;
        _1255 = _1261;
    }
    int _1263 = _1255;
    int _1265 = _1263 + 30719;
    float _1267 = float(_1265);
    float _1269 = fma(_1267, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1271 = abs(_1269);
    float _1273 = -_1271;
    float _1275 = _1273 + 1.0;
    float _1277 = abs(_1269);
    float _1279 = fma(_1277, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _1281 = _1269 < 0.0;
    float _1283 = float(_1281);
    int _1285 = as_type<int>(_1275) + (-218103808);
    float _1287 = abs(_1269);
    float _1289 = fma(_1287, _1279, -0.212114393711090087890625);
    bool _1291 = uint(_1285) >= 1920991232u;
    float _1293 = -_974;
    float _1295 = _1293 + _1187;
    float _1297 = -_976;
    float _1299 = _1297 + _1189;
    float _1301 = abs(_1269);
    float _1303 = fma(_1301, _1289, 1.570728778839111328125);
    float _1305 = fma(_1221, _1295, _974);
    float _1307 = fma(_1221, _1299, _976);
    bool _1309 = !_1291;
    float _1335;
    if (!_1309)
    {
        int _1311 = as_type<int>(_1275);
        int _1313 = as_type<int>(_1289);
        int _1315 = as_type<int>(_1275);
        int _1317 = 6432;
        int _1319 = as_type<int>(_1193);
        int _1321;
        int _1323;
        int _1325;
        int _1327;
        int _1329;
        int _1331;
        int _1333;
        _94(_1311, _1313, _1315, _1317, _1319, _1321, _1323, _1325, _1327, _1329, _1331, _1333, out.gl_Position, out.gl_PointSize);
        _1335 = as_type<float>(_1331);
        _1337 = true;
    }
    else
    {
        float _1339 = rsqrt(_1275);
        float _1341 = _1275 * _1339;
        float _1343 = _1339 * 0.5;
        float _1345 = -_1341;
        float _1347 = 0.0 + _1345;
        float _1349 = fma(_1343, _1347, 0.5);
        float _1351 = fma(_1341, _1349, _1341);
        float _1353 = -_1351;
        float _1355 = 0.0 + _1353;
        float _1357 = fma(_1351, _1355, _1275);
        float _1359 = fma(_1343, _1357, _1351);
        _1335 = _1359;
    }
    _1337 = false;
    float _1361 = _1335;
    float _1363 = in.m_57.x;
    float _1365 = in.m_57.y;
    float _1367 = in.m_57.z;
    float _1369 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1371 = log2(_1369);
    float _1373 = _1303 * _1361;
    float _1375 = _1267 * 3.883221149444580078125;
    float _1377 = -_1089;
    float _1379 = _1377 + _1269;
    float _1381 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1383 = 1.0 + _1381;
    int _1385 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1387 = _1385 != 0;
    int _1389 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1391 = _1389 != 0;
    int _1393 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1395 = _1393 != 0;
    float _1397 = _1375 * 0.15915493667125701904296875;
    bool _1399 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1401 = isnan(1.0);
    bool _1403 = _1399 || _1401;
    bool _1405 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1407 = _1403 || _1405;
    float _1409 = 1.0 / _1383;
    bool _1411 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1413 = isnan(0.0);
    bool _1415 = _1411 || _1413;
    bool _1417 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1419 = _1415 || _1417;
    float _1421 = fma(_1221, _1379, _1089);
    float _1423 = _1371 * _131;
    float _1425 = exp2(_1423);
    float _1427 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1429 = _1367 * 2.0;
    float _1431 = _1365 * 2.0;
    float _1433 = _1365 + _1363;
    float _1435 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1427);
    float _1437 = floor(_1429);
    float _1439 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1441 = _1363 * 2.0;
    float _1443 = _1433 + (-1.0);
    float _1445 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _1439);
    float _1447 = floor(_1441);
    float _1449 = -_1425;
    float _1451 = _1449 + 1.0;
    float _1453 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _1455 = _1419 ? _1451 : 0.0;
    float _1457 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1453);
    bool _1459 = _1437 > 0.0;
    float _1461 = floor(_1431);
    bool _1463 = _1437 >= 0.0;
    bool _1465 = isnan(_1437);
    bool _1467 = _1463 || _1465;
    bool _1469 = isnan(0.0);
    bool _1471 = _1467 || _1469;
    float _1473 = _1421;
    float _1475 = 1.0;
    if (_1407)
    {
        float _1477 = _1455 * _1409;
        _153 = _1477;
    }
    float _1479 = _153;
    bool _1481 = !_1387;
    int _1483 = _1481 ? 0 : 1;
    int _1485 = _1471 ? 0 : 1;
    float _1487 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1445);
    bool _1489 = _1447 > 0.0;
    float _1491 = fma(_1443, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1493 = _1447 >= 0.0;
    bool _1495 = isnan(_1447);
    bool _1497 = _1493 || _1495;
    bool _1499 = isnan(0.0);
    bool _1501 = _1497 || _1499;
    float _1503 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1435);
    int _1505 = ~_1485;
    int _1507 = _1505 + 1;
    int _1509 = _1507 + 1;
    float _1511 = in.m_63.x;
    float _1513 = in.m_63.y;
    float _1515 = in.m_63.z;
    int _1517 = abs(_1483);
    float _1519 = 1.0 / _1042;
    int _1521 = _1509;
    if (!_1459)
    {
        int _1523 = ~_1485;
        int _1525 = _1523 + 1;
        _1521 = _1525;
    }
    int _1527 = _1521;
    int _1529 = _1501 ? 0 : 1;
    bool _1531 = _1461 > 0.0;
    bool _1533 = !_1391;
    int _1535 = _1533 ? 0 : 1;
    float _1537 = 1.0 / _1044;
    float _1539 = float(_1517);
    float _1541 = _1042 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1543 = float(_1527);
    int _1545 = ~_1529;
    int _1547 = _1545 + 1;
    int _1549 = _1547 + 1;
    bool _1551 = _1461 >= 0.0;
    bool _1553 = isnan(_1461);
    bool _1555 = _1551 || _1553;
    bool _1557 = isnan(0.0);
    bool _1559 = _1555 || _1557;
    float _1561 = _1539 * _1543;
    int _1563 = abs(_1535);
    float _1565 = 1.0 / _1046;
    int _1567 = _1549;
    if (!_1489)
    {
        int _1569 = ~_1529;
        int _1571 = _1569 + 1;
        _1567 = _1571;
    }
    int _1573 = _1567;
    float _1575 = _1561 * (-2.0);
    float _1577 = _1363 + (-0.5);
    bool _1579 = !_1395;
    int _1581 = _1579 ? 0 : 1;
    float _1583 = fma(_1491, _1575, _1491);
    int _1585 = _1559 ? 0 : 1;
    float _1587 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1457);
    float _1589 = float(_1563);
    float _1591 = _1365 + _1367;
    float _1593 = float(_1573);
    float _1595 = rsqrt(_1503);
    int _1597 = abs(_1581);
    float _1599 = _1305 * _1537;
    int _1601 = ~_1585;
    int _1603 = _1601 + 1;
    int _1605 = _1603 + 1;
    float _1607 = _1589 * _1593;
    int _1609 = _1605;
    if (!_1531)
    {
        int _1611 = ~_1585;
        int _1613 = _1611 + 1;
        _1609 = _1613;
    }
    int _1615 = _1609;
    float _1617 = fma(_1575, _1511, _1511);
    float _1619 = _1607 * (-2.0);
    float _1621 = fma(_1577, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1617);
    float _1623 = _1591 + (-1.0);
    float _1625 = float(_1597);
    float _1627 = rsqrt(_1487);
    float _1629 = float(_1615);
    float _1631 = fma(_1619, _1513, _1513);
    float _1633 = fma(_1623, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1635 = fma(_1583, _1479, _1621);
    float _1637 = _1307 * _1565;
    float _1639 = _1625 * _1629;
    float _1641 = fma(_1633, _1619, _1633);
    float _1643 = _1635 * 0.15915493667125701904296875;
    float _1645 = _1365 + (-0.5);
    float _1647 = _1367 + _1363;
    float _1649 = _1639 * (-2.0);
    float _1651 = rsqrt(_1587);
    float _1653 = fma(_1645, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1631);
    float _1655 = _1647 + (-1.0);
    float _1657 = _1599 * _1627;
    float _1659 = fma(_1641, _1479, _1653);
    float _1661 = fma(_1649, _1515, _1515);
    float _1663 = fma(_1655, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1665 = _1367 + (-0.5);
    float _1667 = _1659 * 0.15915493667125701904296875;
    float _1669 = _1643 * 6.283185482025146484375;
    float _1671 = sin(_1669);
    float _1673 = fma(_1663, _1649, _1663);
    float _1675 = fma(_1665, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1661);
    float _1677 = _1046 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _1679 = _1657 != 0.0;
    bool _1681 = isnan(_1657);
    bool _1683 = _1679 || _1681;
    bool _1685 = isnan(0.0);
    bool _1687 = _1683 || _1685;
    float _1689 = fma(_1673, _1479, _1675);
    float _1691 = _1637 * _1651;
    float _1693 = _1643 * 6.283185482025146484375;
    float _1695 = cos(_1693);
    float _1697 = _1689 * 0.15915493667125701904296875;
    float _1699 = _1249 * _1519;
    float _1701 = _1699 * _1595;
    float _1703 = _1667 * 6.283185482025146484375;
    float _1705 = sin(_1703);
    float _1707 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1691);
    bool _1709 = _1701 == 0.0;
    bool _1711 = !_1687;
    bool _1713 = _1709 && _1711;
    float _1715 = _1667 * 6.283185482025146484375;
    float _1717 = cos(_1715);
    bool _1719 = _1691 == 0.0;
    bool _1721 = _1719 && _1713;
    float _1723 = _1697 * 6.283185482025146484375;
    float _1725 = sin(_1723);
    float _1727 = _1671 * _1705;
    float _1729 = _1695 * _1705;
    float _1731 = _1044 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    if (!_1721)
    {
        float _1733 = fma(_1657, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1421);
        _1473 = _1733;
    }
    float _1735 = _1473;
    float _1737 = _1731 + (-1.0);
    float _1739 = _1697 * 6.283185482025146484375;
    float _1741 = cos(_1739);
    float _1743 = _1695 * _1717;
    float _1745 = fma(_1725, _1743, _1727);
    float _1747 = _1671 * _1717;
    float _1749 = fma(_1725, _1727, _1743);
    float _1751 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1657);
    float _1753 = -_1729;
    float _1755 = fma(_1725, _1747, _1753);
    float _1757 = -_1747;
    float _1759 = fma(_1725, _1729, _1757);
    float _1761 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1701);
    float _1763 = _1695 * _1741;
    float _1765 = _1751 * _1731;
    float _1767 = _1717 * _1741;
    float _1769 = _1671 * _1741;
    float _1771 = _1705 * _1741;
    float _1773 = _1761 * _1541;
    float _1775 = _1763 * _1765;
    float _1777 = -_1765;
    float _1779 = _1725 * _1777;
    float _1781 = _1769 * _1765;
    float _1783 = _1707 * _1677;
    float _1785 = fma(_1745, _1773, _1775);
    float _1787 = fma(_1767, _1773, _1779);
    float _1789 = fma(_1755, _1773, _1781);
    float _1791 = _1701 + _1363;
    float _1793 = fma(_1759, _1783, _1785);
    float _1795 = fma(_1771, _1783, _1787);
    float _1797 = fma(_1749, _1783, _1789);
    float _1799 = _1791 * 5.400000095367431640625;
    float _1801 = _1793 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1803 = _1793 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1805 = _1793 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1807 = floor(_1799);
    float _1809 = fma(_1795, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1801);
    float _1811 = fma(_1795, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1803);
    float _1813 = fma(_1795, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1805);
    float _1815 = _1283 * 2.0;
    float _1817 = fma(_1797, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1809);
    float _1819 = fma(_1797, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1811);
    float _1821 = in.m_48.x;
    float _1823 = in.m_48.y;
    float _1825 = in.m_48.z;
    float _1827 = fma(_1797, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1813);
    float _1829 = _1817 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _1831 = -_1815;
    float _1833 = fma(_1373, _1831, _1373);
    float _1835 = _1541 + (-1.0);
    float _1837 = _1691 + _1367;
    float _1839 = fma(_1819, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1829);
    float _1841 = fma(_1283, 3.1415927410125732421875, _1833);
    float _1843 = _1397 * 6.283185482025146484375;
    float _1845 = cos(_1843);
    float _1847 = -_1807;
    float _1849 = _1799 + _1847;
    float _1851 = fma(_1827, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1839);
    float _1853 = _1817 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1855 = _1841 * 0.15915493667125701904296875;
    float _1857 = _1837 * 5.099999904632568359375;
    float _1859 = _1851 * _1835;
    float _1861 = _1817 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1863 = fma(_1819, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1853);
    float _1865 = floor(_1857);
    float _1867 = _1849 * 6.283185482025146484375;
    float _1869 = fma(_1819, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1861);
    float _1871 = _1677 + (-1.0);
    float _1873 = fma(_1827, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1863);
    float _1875 = _1763 * _1735;
    float _1877 = fma(_1827, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1869);
    float _1879 = _1823 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1881 = _1823 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1883 = _1871 * _1873;
    float _1885 = _1737 * _1877;
    float _1887 = fma(_1821, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1879);
    float _1889 = fma(_1821, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1881);
    float _1891 = _1883 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _1893 = _1883 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _1895 = fma(_1825, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1887);
    float _1897 = fma(_1825, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1889);
    float _1899 = -_1865;
    float _1901 = _1857 + _1899;
    float _1903 = fma(_1885, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1893);
    float _1905 = _1895 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1907 = _1897 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1909 = fma(_1885, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1891);
    float _1911 = fma(_1859, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1903);
    float _1913 = _1905 + _1827;
    float _1915 = _1907 + _1819;
    float _1917 = fma(_1859, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1909);
    float _1919 = _1901 * 6.283185482025146484375;
    float _1921 = _1913 + _1911;
    float _1923 = _1867 * 0.15915493667125701904296875;
    float _1925 = _1915 + _1917;
    float _1927 = _1397 * 6.283185482025146484375;
    float _1929 = sin(_1927);
    float _1931 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1933 = _1921 + _1931;
    float _1935 = _1823 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1937 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1939 = _1925 + _1937;
    float _1941 = _1883 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1943 = _1933 * _1933;
    float _1945 = fma(_1821, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1935);
    float _1947 = _1939 * _1939;
    float _1949 = _1923 * 6.283185482025146484375;
    float _1951 = sin(_1949);
    float _1953 = _1919 * 0.15915493667125701904296875;
    float _1955 = fma(_1825, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1945);
    float _1957 = _1947 + _1943;
    float _1959 = fma(_1885, (*spvDescriptorSet0.vp_c10)._m0[9].y, _1941);
    float _1961 = _1955 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1963 = sqrt(_1957);
    float _1965 = fma(_1859, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1959);
    float _1967 = _1961 + _1817;
    float _1969 = _1967 + _1965;
    float _1971 = _1953 * 6.283185482025146484375;
    float _1973 = sin(_1971);
    float _1975 = _1855 * 6.283185482025146484375;
    float _1977 = sin(_1975);
    bool _1979 = _1963 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1981 = _1951 + _1973;
    float _1983 = _1981 * 0.4000000059604644775390625;
    float _1985 = -_1227;
    float _1987 = fma(_1977, _1845, _1985);
    float _1989 = -_1229;
    float _1991 = fma(_1977, _1929, _1989);
    float _1993 = fma(_1052, _1983, _1969);
    float _1995 = fma(_1221, _1987, _1227);
    float _1997 = fma(_1221, _1991, _1229);
    float _1999 = _1995;
    float _2001 = _1997;
    float _2003 = _1725;
    float _2005 = _1947;
    float _2007 = _1943;
    float _2009 = _1921;
    float _2011 = _1925;
    float _2013 = _1961;
    if (!_1721)
    {
        float _2015 = fma(_1701, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1995);
        _1999 = _2015;
    }
    float _2017 = _1999;
    float _2019 = -_1735;
    float _2021 = _1725 * _2019;
    if (!_1721)
    {
        float _2023 = fma(_1691, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1997);
        _2001 = _2023;
    }
    float _2025 = _2001;
    float _2027 = _1769 * _1735;
    if (!_1979)
    {
        _2003 = _1993;
    }
    float _2029 = _2003;
    bool _2031 = !_1979;
    float _2033 = _2029;
    if (!_2031)
    {
        float _2035 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2037 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2039 = _1963 + _2037;
        float _2041 = _1993 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2043 = rsqrt(_1957);
        float _2045 = _2039 * _2035;
        float _2047 = _2045 * 0.15915493667125701904296875;
        float _2049 = _2047 * 6.283185482025146484375;
        float _2051 = sin(_2049);
        float _2053 = _2047 * 6.283185482025146484375;
        float _2055 = cos(_2053);
        float _2057 = fma(_2051, _2041, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2059 = _2043 * _2057;
        float _2061 = _2055 + (-1.0);
        float _2063 = _1939 * _2059;
        float _2065 = _1933 * _2059;
        float _2067 = _2061 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2069 = _2063 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2071 = _2063 * _2063;
        float _2073 = _2065 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2075 = fma(_1993, _2055, _2067);
        float _2077 = _2065 * _2065;
        _2033 = _2075;
        _2005 = _2071;
        _2007 = _2077;
        _2009 = _2073;
        _2011 = _2069;
    }
    float _2079 = _2033;
    float _2081 = _2005;
    float _2083 = _2007;
    float _2085 = _2009;
    float _2087 = _2011;
    float _2089 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2091 = _2079 + _2089;
    float _2093 = fma(_1745, _2017, _1875);
    float _2095 = fma(_1767, _2017, _2021);
    float _2097 = fma(_1755, _2017, _2027);
    float _2099 = fma(_2091, _2091, _2081);
    float _2101 = fma(_1759, _2025, _2093);
    float _2103 = fma(_1771, _2025, _2095);
    float _2105 = fma(_1749, _2025, _2097);
    float _2107 = _2099 + _2083;
    float _2109 = _2101 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2111 = _2101 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2113 = _2101 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_65.x = _493;
    out.m_65.y = _495;
    out.m_65.z = _497;
    float _2115 = fma(_2103, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2109);
    float _2117 = sqrt(_2107);
    float _2119 = fma(_2103, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2111);
    float _2121 = fma(_2103, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2113);
    float _2123 = fma(_2105, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2115);
    out.m_67.x = _613;
    out.m_67.y = _615;
    out.m_67.z = _617;
    float _2125 = fma(_2105, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2119);
    float _2127 = fma(_2105, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2121);
    out.m_69.y = 1.0;
    out.m_71.x = _2123;
    out.m_71.y = _2125;
    out.m_71.z = _2127;
    bool _2129 = _2117 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2131 = isnan(_2117);
    bool _2133 = _2129 || _2131;
    bool _2135 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2137 = _2133 || _2135;
    float _2139 = _2115;
    if (!_2137)
    {
        _2139 = 1.0;
    }
    float _2141 = _2139;
    bool _2143 = !_2137;
    float _2145 = _2141;
    if (!_2143)
    {
        bool _2147 = _2117 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2149 = isnan(_2117);
        bool _2151 = _2147 || _2149;
        bool _2153 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2155 = _2151 || _2153;
        if (!_2155)
        {
            float _2157 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2159 = _2117 + _2157;
            float _2161 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2163 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2161;
            float _2165 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2167 = _2165 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2169 = 1.0 / _2163;
            float _2171 = _2159 * _2169;
            float _2173 = fma(_2171, _2167, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2145 = _2173;
            _621 = _2169;
            _2175 = true;
        }
        else
        {
            bool _2177 = _2117 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2179 = isnan(_2117);
            bool _2181 = _2177 || _2179;
            bool _2183 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2185 = _2181 || _2183;
            if (!_2185)
            {
                float _2187 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2189 = _2117 + _2187;
                float _2191 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2193 = _2191 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2195 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2197 = _2195 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2199 = 1.0 / _2193;
                float _2201 = _2189 * _2199;
                float _2203 = fma(_2201, _2197, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2145 = _2203;
                _621 = _2199;
                _2175 = true;
            }
            else
            {
                _2145 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2175 = false;
    float _2205 = _2145;
    float _2207 = _621;
    float _2209 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2211 = _2079 + _2209;
    float _2213 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2215 = _2085 + _2213;
    bool _2217 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2219 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2221 = _2217 || _2219;
    bool _2223 = isnan(0.5);
    bool _2225 = _2221 || _2223;
    float _2227 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2229 = _2087 + _2227;
    float _2231 = fma(_2211, _2205, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2233 = fma(_2215, _2205, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2235 = fma(_2229, _2205, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2237 = _2229;
    float _2239 = _2207;
    float _2241 = _2211;
    float _2243 = _2205;
    if (_2225)
    {
        _2237 = _2235;
    }
    float _2245 = _2237;
    float _2247 = _2245;
    if (_2225)
    {
        _2239 = _2231;
    }
    float _2249 = _2239;
    float _2251 = _2249;
    if (_2225)
    {
        _2241 = _2233;
    }
    float _2253 = _2241;
    float _2255 = _2253;
    if (!_2225)
    {
        float _2257 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2259 = _1961 + _2257;
        float _2261 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2263 = _1907 + _2261;
        float _2265 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2267 = _2259 * _2259;
        float _2269 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2271 = _1905 + _2269;
        float _2273 = fma(_2263, _2263, _2267);
        float _2275 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2277 = fma(_2271, _2271, _2273);
        float _2279 = sqrt(_2277);
        float _2281 = _2265 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2283 = -_1961;
        float _2285 = _2283 + _2231;
        float _2287 = precise::min(_2279, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2289 = _2287 * _2275;
        float _2291 = -_1907;
        float _2293 = _2291 + _2235;
        float _2295 = -_1905;
        float _2297 = _2295 + _2233;
        float _2299 = _2281 * _2289;
        float _2301 = fma(_2293, _2299, _1907);
        float _2303 = fma(_2285, _2299, _1961);
        float _2305 = fma(_2297, _2299, _1905);
        _2251 = _2303;
        _2247 = _2301;
        _2255 = _2305;
    }
    float _2307 = _2251;
    float _2309 = _2247;
    float _2311 = _2255;
    float _2313 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2315 = _2307 + _2313;
    float _2317 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2319 = _2309 + _2317;
    float _2321 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2323 = _2311 + _2321;
    float _2325 = _2315 * _2315;
    float _2327 = fma(_2319, _2319, _2325);
    float _2329 = fma(_2323, _2323, _2327);
    float _2331 = rsqrt(_2329);
    float _2333 = _2331 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2335 = _2319 * _2333;
    float _2337 = _2323 * _2333;
    float _2339 = _2335 * _2335;
    float _2341 = _2337 * _2337;
    float _2343 = _2339 + _2341;
    float _2345 = sqrt(_2343);
    bool _2347 = _2345 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2349 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2351 = _2345 + _2349;
    float _2353 = _2331;
    float _2355 = _2351;
    float _2357 = _2315;
    float _2359 = _2335;
    if (_2347)
    {
        float _2361 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2353 = _2361;
    }
    float _2363 = _2353;
    if (_2347)
    {
        float _2365 = rsqrt(_2343);
        _2243 = _2365;
    }
    float _2367 = _2243;
    float _2369 = _2367;
    if (_2347)
    {
        float _2371 = _2351 * _2363;
        _2355 = _2371;
    }
    float _2373 = _2355;
    if (_2347)
    {
        float _2375 = _2373 * 0.15915493667125701904296875;
        _2013 = _2375;
    }
    float _2377 = _2013;
    float _2379 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2381 = _2363;
    float _2383 = _2377;
    if (_2347)
    {
        float _2385 = _2377 * 6.283185482025146484375;
        float _2387 = cos(_2385);
        _2381 = _2387;
    }
    float _2389 = _2381;
    float _2391 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2393 = precise::max(0.0, _2391);
    float _2395 = _2323;
    float _2397 = _2393;
    if (_2347)
    {
        float _2399 = _2377 * 6.283185482025146484375;
        float _2401 = sin(_2399);
        _2395 = _2401;
    }
    float _2403 = _2395;
    float _2405 = -_2333;
    float _2407 = -_2393;
    float _2409 = fma(_2315, _2405, _2407);
    if (_2347)
    {
        float _2411 = _2409 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2357 = _2411;
    }
    float _2413 = _2357;
    float _2415 = _2413;
    float _2417 = _2389;
    if (_2347)
    {
        float _2419 = _2389 + (-1.0);
        _2397 = _2419;
    }
    float _2421 = _2397;
    if (_2347)
    {
        float _2423 = _2421 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2383 = _2423;
    }
    float _2425 = _2383;
    float _2427 = sqrt(_2329);
    float _2429 = _2403;
    if (_2347)
    {
        float _2431 = fma(_2403, _2413, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2415 = _2431;
    }
    float _2433 = _2415;
    float _2435 = _2433;
    if (!_2347)
    {
        _2429 = _2337;
    }
    float _2437 = _2429;
    float _2439 = _2437;
    if (_2347)
    {
        float _2441 = _2367 * _2433;
        _1475 = _2441;
    }
    float _2443 = _1475;
    if (!_2347)
    {
        _2369 = _2409;
    }
    float _2445 = _2369;
    float _2447 = _2445;
    if (_2347)
    {
        float _2449 = fma(_2409, _2389, _2425);
        _2447 = _2449;
    }
    float _2451 = _2447;
    if (!_2347)
    {
        _2435 = _2339;
    }
    float _2453 = _2435;
    float _2455 = _2453;
    if (_2347)
    {
        float _2457 = _2335 * _2443;
        _2359 = _2457;
    }
    float _2459 = _2359;
    if (_2347)
    {
        float _2461 = _2337 * _2443;
        _2439 = _2461;
    }
    float _2463 = _2439;
    if (!_2347)
    {
        _2417 = _2341;
    }
    float _2465 = _2417;
    float _2467 = _2307 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2469 = _2465;
    if (_2347)
    {
        float _2471 = _2459 * _2459;
        _2455 = _2471;
    }
    float _2473 = _2455;
    if (_2347)
    {
        float _2475 = _2463 * _2463;
        _2469 = _2475;
    }
    float _2477 = _2469;
    float _2479 = _2307 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2481 = fma(_2309, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2467);
    float _2483 = fma(_2451, _2451, _2473);
    float _2485 = fma(_2309, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2479);
    float _2487 = _2483 + _2477;
    float _2489 = _2307 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2491 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2493 = fma(_2427, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2491);
    float _2495 = precise::clamp(_2493, 0.0, 1.0);
    float _2497 = fma(_2311, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2481);
    float _2499 = rsqrt(_2487);
    float _2501 = _2307 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2503 = -_2495;
    float _2505 = _2503 + 1.0;
    float _2507 = fma(_2309, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2489);
    float _2509 = _2497 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2511 = fma(_2309, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2501);
    float _2513 = fma(_2311, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2507);
    float _2515 = abs(_2505);
    float _2517 = log2(_2515);
    float _2519 = _2509 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2521 = fma(_2311, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2511);
    float _2523 = _2513 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2525 = fma(_2311, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2485);
    float _2527 = -_2519;
    float _2529 = fma(_2527, _2379, 1.0);
    float _2531 = _2521 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2533 = _2523 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2535 = _2499 * _2459;
    float _2537 = _2499 * _2451;
    float _2539 = _2499 * _2463;
    float _2541 = fma(_2531, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2533);
    float _2543 = _2535 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2545 = _2525 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2547 = log2(_2529);
    float _2549 = fma(_2509, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2541);
    float _2551 = _2517 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2553 = -_2543;
    float _2555 = fma(_2537, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2553);
    float _2557 = _2523 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2559 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2549);
    float _2561 = -_2539;
    float _2563 = fma(_2561, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2555);
    float _2565 = exp2(_2551);
    float _2567 = _2523 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2569 = fma(_2531, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2557);
    float _2571 = fma(_2563, -0.5, 0.5);
    float _2573 = fma(_2563, 0.5, 0.5);
    float _2575 = fma(_2531, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2567);
    float _2577 = _2537 + 1.0;
    float _2579 = fma(_2509, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2569);
    float _2581 = 1.0 / _2559;
    float _2583 = fma(_2509, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2575);
    float _2585 = fma(_2573, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2587 = fma(_2573, _2585, -0.212114393711090087890625);
    float _2589 = sqrt(_2571);
    float _2591 = -_2537;
    float _2593 = fma(_2565, _2577, _2591);
    float _2595 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2583);
    float _2597 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2579);
    float _2599 = _2547 * 0.693147182464599609375;
    float _2601 = fma(_2573, _2587, 1.570728778839111328125);
    float _2603 = fma(_2593, 0.5, 0.5);
    float _2605 = _2595 * _2581;
    float _2607 = _2597 * _2581;
    float _2609 = _2599 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2611 = fma(_2605, 0.5, 0.5);
    float _2613 = fma(_2607, -0.5, 0.5);
    float _2615 = _2589 * 0.636619746685028076171875;
    float3 _6958 = float3(_2611, _2613, _2609);
    float _2617 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6958, float3(0.0), isnan(_6958)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6958, float3(0.0), isnan(_6958)), level(0.0)).x;
    float3 _6969 = float3(_2611, _2613, _2609);
    float4 _2619 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6969, float3(0.0), isnan(_6969)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6969, float3(0.0), isnan(_6969)), level(0.0)).xyzw;
    float _2621 = _2619.x;
    float _2623 = _2619.y;
    float _2625 = _2619.z;
    float _2627 = _2619.w;
    float _2629 = -_2601;
    float _2631 = fma(_2615, _2629, 1.0);
    float2 _6990 = float2(_2631, _2603);
    float3 _2635 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6990, float2(0.0), isnan(_6990)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6990, float2(0.0), isnan(_6990)), level(0.0)).xyz;
    float _2637 = _2635.x;
    float _2639 = _2635.y;
    float _2641 = _2635.z;
    float _2643 = _2517 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2645 = _2523 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_73.x = _2309;
    out.m_73.y = _2307;
    out.m_73.z = _2311;
    bool _2647 = _2427 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2649 = isnan(_2427);
    bool _2651 = _2647 || _2649;
    bool _2653 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2655 = _2651 || _2653;
    float _2657 = fma(_2531, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2645);
    float _2659 = exp2(_2643);
    float _2661 = fma(_2509, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2657);
    float _2663 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2661);
    float _2665 = _2663 + _2559;
    out.gl_Position.x = _2595;
    out.gl_Position.y = _2597;
    out.gl_Position.z = _2663;
    out.gl_Position.w = _2559;
    float _2667 = _2665 * 0.5;
    float _2669 = -_2659;
    float _2671 = _2669 + 1.0;
    float _2673 = _2671 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_75.z = _2667;
    out.m_75.w = _2559;
    float _2675 = -_2673;
    float _2677 = _2675 + 1.0;
    float _2679 = _2559;
    float _2681 = _2663;
    float _2683 = _2597;
    float _2685 = _2667;
    float _2687 = _2595;
    if (!_2655)
    {
        _2679 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2689 = _2679;
    float _2691 = _2689;
    float _2693 = _2689;
    if (!_2655)
    {
        _2681 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2695 = _2681;
    float _2697 = _2695;
    float _2699 = _2695;
    if (!_2655)
    {
        _2683 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2701 = _2683;
    float _2703 = _2701;
    float _2705 = _2701;
    if (!_2655)
    {
        _2685 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2707 = _2685;
    float _2709 = _2707;
    float _2711 = _2707;
    if (!_2655)
    {
        _2687 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2713 = _2687;
    float _2715 = _2673 * _2617;
    float _2717 = _2627 * _2715;
    float _2719 = _2641 * _2715;
    float _2721 = fma(_2637, _2717, _2621);
    float _2723 = fma(_2639, _2717, _2623);
    float _2725 = _2627 * _2677;
    float _2727 = fma(_2627, _2719, _2625);
    float _2729 = _2717;
    float _2731 = _2713;
    float _2733 = _2713;
    if (!_2655)
    {
        _2729 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2735 = _2729;
    out.m_77.x = _2721;
    out.m_77.y = _2723;
    out.m_77.z = _2727;
    out.m_77.w = _2725;
    bool _2737 = !_2655;
    float _2739 = _2735;
    float _2741 = _2735;
    if (!_2737)
    {
        bool _2743 = _2427 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2745 = isnan(_2427);
        bool _2747 = _2743 || _2745;
        bool _2749 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2751 = _2747 || _2749;
        if (!_2751)
        {
            float _2753 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2755 = _2427 + _2753;
            float _2757 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2759 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2757;
            float _2761 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2763 = _2761 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2765 = 1.0 / _2759;
            float _2767 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2769 = _2767 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2771 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2773 = _2771 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2775 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2777 = _2775 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2779 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2781 = _2779 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2783 = _2755 * _2765;
            float _2785 = precise::clamp(_2783, 0.0, 1.0);
            float _2787 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2789 = _2787 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2791 = fma(_2785, _2763, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2793 = fma(_2785, _2789, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2795 = fma(_2785, _2769, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2797 = fma(_2785, _2773, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2799 = fma(_2785, _2777, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2801 = fma(_2785, _2781, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2711 = _2795;
            _2705 = _2799;
            _2741 = _2791;
            _2699 = _2797;
            _2693 = _2793;
            _2733 = _2801;
            _2803 = true;
        }
        else
        {
            bool _2805 = _2427 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2807 = isnan(_2427);
            bool _2809 = _2805 || _2807;
            bool _2811 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2813 = _2809 || _2811;
            if (!_2813)
            {
                _2739 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2815 = _2739;
            _2741 = _2815;
            if (!_2813)
            {
                _2709 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2817 = _2709;
            _2711 = _2817;
            if (!_2813)
            {
                _2691 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2819 = _2691;
            _2693 = _2819;
            if (!_2813)
            {
                _2697 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2821 = _2697;
            _2699 = _2821;
            if (!_2813)
            {
                _2703 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2823 = _2703;
            _2705 = _2823;
            if (!_2813)
            {
                _2731 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2825 = _2731;
            bool _2827 = !_2813;
            _2733 = _2825;
            if (!_2827)
            {
                bool _2829 = _2427 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2831 = isnan(_2427);
                bool _2833 = _2829 || _2831;
                bool _2835 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2837 = _2833 || _2835;
                if (!_2837)
                {
                    float _2839 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2841 = _2427 + _2839;
                    float _2843 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2845 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2843;
                    float _2847 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2849 = _2847 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2851 = 1.0 / _2845;
                    float _2853 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2855 = _2853 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2857 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2859 = _2857 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2861 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2863 = _2861 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2865 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2867 = _2865 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2869 = _2841 * _2851;
                    float _2871 = precise::clamp(_2869, 0.0, 1.0);
                    float _2873 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2875 = _2873 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2877 = fma(_2871, _2849, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2879 = fma(_2871, _2875, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2881 = fma(_2871, _2855, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2883 = fma(_2871, _2859, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2885 = fma(_2871, _2863, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2887 = fma(_2871, _2867, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2711 = _2881;
                    _2705 = _2885;
                    _2741 = _2877;
                    _2699 = _2883;
                    _2693 = _2879;
                    _2733 = _2887;
                    _2803 = true;
                }
                else
                {
                    _2711 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2705 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2741 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2699 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2693 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2733 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2803 = false;
    float _2889 = _2711;
    float _2891 = _2705;
    float _2893 = _2741;
    float _2895 = _2699;
    float _2897 = _2693;
    float _2899 = _2733;
    float _2901 = fma(_2125, -0.5, 0.5);
    float _2903 = precise::clamp(_2901, 0.0, 1.0);
    float _2905 = -_2889;
    float _2907 = _2905 + _2891;
    float _2909 = -_2893;
    float _2911 = _2909 + _2895;
    float _2913 = -_2897;
    float _2915 = _2913 + _2899;
    bool _2917 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2919 = fma(_2903, _2907, _2889);
    float _2921 = fma(_2903, _2911, _2893);
    float _2923 = fma(_2903, _2915, _2897);
    float _2925 = _2919 * 0.586610972881317138671875;
    out.m_79.x = 0.0;
    float _2927 = fma(_2921, 0.298911988735198974609375, _2925);
    float _2929 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2931 = fma(_2923, 0.114477999508380889892578125, _2927);
    out.m_51.x = _2929;
    float _2933 = -_2931;
    float _2935 = _2921 + _2933;
    float _2937 = -_2931;
    float _2939 = _2919 + _2937;
    float _2941 = -_2931;
    float _2943 = _2923 + _2941;
    float _2945 = fma(_2935, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2931);
    float _2947 = fma(_2939, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2931);
    float _2949 = fma(_2943, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2931);
    out.m_81.x = _2945;
    out.m_81.y = _2947;
    out.m_81.z = _2949;
    if (!_2917)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2951 = -_2307;
    float _2953 = _2951 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2955 = -_2309;
    float _2957 = _2955 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2959 = -_2311;
    float _2961 = _2959 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2963 = _2953 * _2953;
    float _2965 = fma(_2957, _2957, _2963);
    float _2967 = fma(_2961, _2961, _2965);
    float _2969 = sqrt(_2967);
    float _2971 = rsqrt(_2967);
    float _2973 = -_2969;
    float _2975 = _2973 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2977 = _2975 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2979 = precise::clamp(_2977, 0.0, 1.0);
    float _2981 = _2957 * _2971;
    float _2983 = _2953 * _2971;
    float _2985 = abs(_2979);
    float _2987 = log2(_2985);
    float _2989 = _2961 * _2971;
    float _2991 = _2981 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2993 = _2125 * _2983;
    float _2995 = -_2983;
    float _2997 = -_2991;
    float _2999 = fma(_2995, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2997);
    float _3001 = fma(_2123, _2981, _2993);
    float _3003 = -_2989;
    float _3005 = fma(_3003, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2999);
    float _3007 = fma(_2127, _2989, _3001);
    float _3009 = precise::clamp(_3007, 0.0, 1.0);
    float _3011 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3013 = _3005 + _3011;
    float _3015 = _2987 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3017 = _3013 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3019 = precise::clamp(_3017, 0.0, 1.0);
    float _3021 = exp2(_3015);
    float _3023 = _3021 * _3019;
    float _3025 = _3009 * _3023;
    float _3027 = _3025 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3029 = _3025 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3031 = _3025 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_79.x = _3027;
    out.m_79.y = _3029;
    out.m_79.z = _3031;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}


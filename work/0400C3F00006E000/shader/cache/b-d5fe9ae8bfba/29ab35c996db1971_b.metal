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
    texture2d<float> vp_t_tcb_C [[id(7)]];
    sampler vp_t_tcb_CSmplr [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_63 [[user(locn0)]];
    float4 m_65 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_71 [[user(locn3)]];
    float4 m_55 [[user(locn4)]];
    float4 m_79 [[user(locn5)]];
    float4 m_83 [[user(locn6)]];
    float4 m_61 [[user(locn7)]];
    float4 m_67 [[user(locn8)]];
    float4 m_75 [[user(locn9)]];
    float4 m_77 [[user(locn10)]];
    float4 m_81 [[user(locn11)]];
    float4 m_73 [[user(locn12)]];
    float4 m_85 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_69 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_53 [[attribute(6)]];
    float4 m_59 [[attribute(7)]];
    float4 m_57 [[attribute(8)]];
};

static inline __attribute__((always_inline))
int _100(thread const int& _9084, thread const int& _9085, constant _10& support_buffer)
{
    float _9088 = as_type<float>(support_buffer._m4);
    int _9090 = _9085 + as_type<int>(_9088);
    int _9092 = 1 + _9090;
    float _9094 = support_buffer._m5[_9092].x;
    float _9096 = abs(_9094);
    bool _9098 = _9096 == 1.0;
    if (_9098)
    {
        return _9084;
    }
    float _9100 = float(_9084);
    float _9102 = _9100 / _9096;
    int _9104 = int(_9102);
    return _9104;
}

static inline __attribute__((always_inline))
int _101(thread const int& _9134, thread const int& _9135, constant _10& support_buffer)
{
    float _9138 = as_type<float>(support_buffer._m4);
    int _9140 = _9135 + as_type<int>(_9138);
    int _9142 = 1 + _9140;
    float _9144 = support_buffer._m5[_9142].x;
    bool _9146 = _9144 == 1.0;
    if (_9146)
    {
        return _9134;
    }
    float _9148 = float(_9134);
    float _9150 = _9148 * _9144;
    int _9152 = int(_9150);
    return _9152;
}

static inline __attribute__((always_inline))
void _98(thread const int& _8790, thread const int& _8791, thread const int& _8792, thread int& _8793, thread int& _8794, thread int& _8795, thread int& _8796, thread int& _8797, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    int _8800 = _8791;
    float _8802 = 0.0 + as_type<float>(_8790);
    bool _8804 = _8802 != 0.0;
    bool _8806 = isnan(_8802);
    bool _8808 = _8804 || _8806;
    bool _8810 = isnan(0.0);
    bool _8812 = _8808 || _8810;
    int _8814 = as_type<int>(_8802);
    int _8816 = _8812 ? (-1) : 0;
    if (!_8812)
    {
        float _8818 = as_type<float>(_8790) * 1.0;
        _8800 = as_type<int>(_8818);
    }
    int _8820 = _8800;
    bool _8822 = !_8812;
    int _8824 = _8820;
    int _8826 = _8820;
    if (!_8822)
    {
        bool _8828 = _8802 >= 0.0;
        bool _8830 = isnan(_8802);
        bool _8832 = _8828 || _8830;
        bool _8834 = isnan(0.0);
        bool _8836 = _8832 || _8834;
        _8816 = _8836 ? (-1) : 0;
        if (!_8836)
        {
            _8824 = 2147483647;
        }
        int _8838 = _8824;
        bool _8840 = !_8836;
        int _8842 = _8838;
        _8826 = _8838;
        if (!_8840)
        {
            float _8844 = abs(as_type<float>(_8790));
            float _8846 = 0.0 + _8844;
            bool _8848 = _8846 > as_type<float>(0x7f800000u /* inf */);
            bool _8850 = isnan(_8846);
            bool _8852 = _8848 || _8850;
            bool _8854 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _8856 = _8852 || _8854;
            _8814 = as_type<int>(_8846);
            _8816 = _8856 ? (-1) : 0;
            if (_8856)
            {
                float _8858 = as_type<float>(_8790) + 1.0;
                _8842 = as_type<int>(_8858);
            }
            int _8860 = _8842;
            int _8862 = _8860;
            _8826 = _8860;
            if (!_8856)
            {
                bool _8864 = _8846 != as_type<float>(0x7f800000u /* inf */);
                bool _8866 = isnan(_8846);
                bool _8868 = _8864 || _8866;
                bool _8870 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _8872 = _8868 || _8870;
                _8816 = _8872 ? (-1) : 0;
                if (!_8872)
                {
                    _8862 = _8790;
                }
                int _8874 = _8862;
                bool _8876 = !_8872;
                _8826 = _8874;
                if (!_8876)
                {
                    float _8878 = as_type<float>(_8790) * 18446744073709551616.0;
                    float _8880 = rsqrt(_8878);
                    float _8882 = _8878 * _8880;
                    float _8884 = _8880 * 0.5;
                    float _8886 = -_8882;
                    float _8888 = 0.0 + _8886;
                    float _8890 = fma(_8884, _8888, 0.5);
                    float _8892 = fma(_8882, _8890, _8882);
                    float _8894 = -_8892;
                    float _8896 = 0.0 + _8894;
                    float _8898 = fma(_8892, _8896, _8878);
                    float _8900 = fma(_8884, _8898, _8892);
                    float _8902 = _8900 * 2.3283064365386962890625e-10;
                    _8826 = as_type<int>(_8902);
                    _8814 = as_type<int>(_8892);
                }
            }
        }
    }
    int _8904 = _8826;
    int _8906 = _8814;
    int _8908 = _8816;
    _8793 = _8792;
    _8794 = 0;
    _8795 = _8904;
    _8796 = _8906;
    _8797 = _8908;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3067 = false;
    bool _2247 = false;
    bool _2063 = false;
    bool _1515 = false;
    bool _1197 = false;
    bool _1069 = false;
    bool _929 = false;
    bool _643 = false;
    bool _495 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_46.w;
    float _107 = trunc(_105);
    int _109 = int(_107);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (!_113)
    {
        out.m_49.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3546 = as_type<float>(_125);
        out.gl_Position.z = _3546;
    }
    if (!_113)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _129 = in.m_51.w;
    float _131 = in.m_53.x;
    bool _133 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_129);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_129;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_55.x = _131;
    float _147 = 0.0;
    float _149 = 0.0;
    float _151 = _145;
    if (_141)
    {
        float _153 = float(_109);
        _119 = _153;
    }
    float _155 = _119;
    bool _157 = _145 >= _155;
    bool _159 = !_141;
    bool _161 = _157 || _159;
    float _163 = _155;
    if (_161)
    {
        _163 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _163;
    if (_161)
    {
        out.m_49.x = 0.0;
    }
    if (_161)
    {
        float _167 = _165 * 5.0;
        _127 = as_type<int>(_167);
    }
    int _169 = _127;
    float _171 = as_type<float>(_169);
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3622 = as_type<float>(_169);
        out.gl_Position.z = _3622;
    }
    if (_161)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _173 = in.m_51.x;
    float _175 = in.m_51.y;
    float _177 = in.m_51.z;
    float _179 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _181 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _183 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _185 = _181 || _183;
    bool _187 = isnan(1.0);
    bool _189 = _185 || _187;
    float _191 = _179;
    if (!_189)
    {
        float _193 = _179 * _179;
        float _195 = _193 * 0.5;
        _171 = _195;
    }
    float _197 = _171;
    float _199 = 0.0;
    float _201 = _197;
    if (!_189)
    {
        float _203 = _145 * _145;
        float _205 = _203 * 0.5;
        _199 = _205;
    }
    float _207 = _199;
    if (!_189)
    {
        float _209 = _197 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _209;
    }
    float _211 = _201;
    bool _213 = !_189;
    float _215 = _211;
    if (!_213)
    {
        float _217 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = log2(_217);
        float _221 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _223 = _221 + 1.0;
        float _225 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = _179 * _219;
        float _229 = 1.0 / _223;
        float _231 = _225 * 0.693147182464599609375;
        float _233 = exp2(_227);
        float _235 = 1.0 / _231;
        float _237 = _233 + (-1.0);
        float _239 = -_237;
        float _241 = fma(_239, _235, _179);
        float _243 = _241 * _229;
        float _245 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _147 = _231;
        _215 = _245;
        _149 = _233;
    }
    float _247 = _147;
    float _249 = _215;
    float _251 = _149;
    bool _253 = !_189;
    float _255 = _247;
    float _257 = _251;
    if (!_253)
    {
        float _259 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = log2(_259);
        float _263 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _265 = _263 + 1.0;
        float _267 = 1.0 / _265;
        float _269 = _179 * _261;
        float _271 = exp2(_269);
        float _273 = -_271;
        float _275 = _273 + 1.0;
        float _277 = _275 * _267;
        _255 = _271;
        _257 = _265;
        _191 = _277;
    }
    float _279 = _255;
    float _281 = _257;
    float _283 = _191;
    float _285 = _281;
    float _287 = _279;
    if (!_189)
    {
        _285 = _145;
    }
    float _289 = _285;
    float _291 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _293 = _289;
    if (!_189)
    {
        float _295 = _207 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _287 = _295;
    }
    float _297 = _287;
    bool _299 = !_189;
    float _301 = _297;
    if (!_299)
    {
        float _303 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _305 = log2(_303);
        float _307 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _309 = _145 * _305;
        float _311 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _313 = _311 + 1.0;
        float _315 = 1.0 / _313;
        float _317 = _307 * 0.693147182464599609375;
        float _319 = exp2(_309);
        float _321 = 1.0 / _317;
        float _323 = _319 + (-1.0);
        float _325 = -_323;
        float _327 = fma(_325, _321, _145);
        float _329 = _327 * _315;
        float _331 = _329 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _301 = _331;
    }
    float _333 = _301;
    bool _335 = !_189;
    if (!_335)
    {
        float _337 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _339 = log2(_337);
        float _341 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _343 = _341 + 1.0;
        float _345 = 1.0 / _343;
        float _347 = _145 * _339;
        float _349 = exp2(_347);
        float _351 = -_349;
        float _353 = _351 + 1.0;
        float _355 = _353 * _345;
        _293 = _355;
    }
    float _357 = _293;
    float _359 = _333 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _361 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _363 = fma(_283, _175, _291);
    float _365 = _333 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _367 = fma(_357, _175, _359);
    float _369 = fma(_283, _173, _361);
    float _371 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _373 = _333 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _375 = fma(_357, _173, _365);
    float _377 = -_367;
    float _379 = _363 + _377;
    float _381 = fma(_283, _177, _371);
    float _383 = fma(_357, _177, _373);
    float _385 = -_375;
    float _387 = _369 + _385;
    float _389 = _379 * _379;
    float _391 = in.m_57.y;
    float _393 = -_383;
    float _395 = _381 + _393;
    float _397 = _379 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _399 = fma(_387, _387, _389);
    float _401 = in.m_59.w;
    float _403 = _379 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _405 = _379 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _407 = fma(_395, _395, _399);
    float _409 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[5].x, _397);
    float _411 = in.m_46.x;
    float _413 = in.m_46.y;
    float _415 = in.m_46.z;
    float _417 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[4].x, _403);
    float _419 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[6].x, _405);
    float _421 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[5].z, _409);
    float _423 = sqrt(_407);
    float _425 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[4].z, _417);
    float _427 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[6].z, _419);
    out.m_61.y = _391;
    bool _429 = _423 >= 9.9999999747524270787835121154785e-07;
    bool _431 = isnan(_423);
    bool _433 = _429 || _431;
    bool _435 = isnan(9.9999999747524270787835121154785e-07);
    bool _437 = _433 || _435;
    float _439 = fma(_369, _401, _411);
    float _441 = fma(_363, _401, _413);
    float _443 = fma(_381, _401, _415);
    float _445 = _395;
    float _447 = _425;
    float _449 = _427;
    float _451 = _443;
    if (_437)
    {
        _445 = _421;
    }
    float _453 = _445;
    float _455 = _453;
    if (!_437)
    {
        bool _457 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _459 = !_457;
        if (!_459)
        {
            float _461 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _463 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _465 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _467 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _461);
            float _469 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _463);
            float _471 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _465);
            float _473 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _467);
            float _475 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _469);
            float _477 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _471);
            float _479 = _473 * _473;
            float _481 = fma(_475, _475, _479);
            float _483 = fma(_477, _477, _481);
            float _485 = rsqrt(_483);
            float _487 = _485 * 9.9999999747524270787835121154785e-07;
            float _489 = _475 * _487;
            float _491 = _473 * _487;
            float _493 = _477 * _487;
            _455 = _491;
            _447 = _489;
            _449 = _493;
            _495 = true;
        }
        else
        {
            float _497 = _175 * _175;
            float _499 = fma(_173, _173, _497);
            float _501 = fma(_177, _177, _499);
            float _503 = sqrt(_501);
            bool _505 = _503 >= 9.9999999747524270787835121154785e-07;
            bool _507 = isnan(_503);
            bool _509 = _505 || _507;
            bool _511 = isnan(9.9999999747524270787835121154785e-07);
            bool _513 = _509 || _511;
            if (!_513)
            {
                float _515 = _413 * _413;
                float _517 = fma(_411, _411, _515);
                float _519 = fma(_415, _415, _517);
                float _521 = sqrt(_519);
                bool _523 = _521 >= 9.9999999747524270787835121154785e-07;
                bool _525 = isnan(_521);
                bool _527 = _523 || _525;
                bool _529 = isnan(9.9999999747524270787835121154785e-07);
                bool _531 = _527 || _529;
                if (!_531)
                {
                    float _533 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _535 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _533);
                    float _537 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _535);
                    float _539 = rsqrt(_537);
                    float _541 = _539 * 9.9999999747524270787835121154785e-07;
                    float _543 = _541 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _545 = _541 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _547 = _541 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _455 = _545;
                    _447 = _543;
                    _449 = _547;
                    _495 = true;
                }
                else
                {
                    float _549 = _413 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _551 = _413 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _553 = _413 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _555 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[5].x, _549);
                    float _557 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[4].x, _551);
                    float _559 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[6].x, _553);
                    float _561 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[5].z, _555);
                    float _563 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[4].z, _557);
                    float _565 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[6].z, _559);
                    float _567 = _561 * _561;
                    float _569 = fma(_563, _563, _567);
                    float _571 = fma(_565, _565, _569);
                    float _573 = rsqrt(_571);
                    float _575 = _573 * 9.9999999747524270787835121154785e-07;
                    float _577 = _563 * _575;
                    float _579 = _561 * _575;
                    float _581 = _565 * _575;
                    _455 = _579;
                    _447 = _577;
                    _449 = _581;
                    _495 = true;
                }
            }
            else
            {
                float _583 = _175 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _585 = _175 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _587 = _175 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _589 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[5].x, _583);
                float _591 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[4].x, _585);
                float _593 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[6].x, _587);
                float _595 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[5].z, _589);
                float _597 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[4].z, _591);
                float _599 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[6].z, _593);
                float _601 = _595 * _595;
                float _603 = fma(_597, _597, _601);
                float _605 = fma(_599, _599, _603);
                float _607 = rsqrt(_605);
                float _609 = _607 * 9.9999999747524270787835121154785e-07;
                float _611 = _597 * _609;
                float _613 = _595 * _609;
                float _615 = _599 * _609;
                _455 = _613;
                _447 = _611;
                _449 = _615;
            }
        }
    }
    _495 = false;
    float _617 = _455;
    float _619 = _447;
    float _621 = _449;
    bool _623 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _625 = !_623;
    float _641;
    if (!_625)
    {
        float _627 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _629 = _131 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _631 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _633 = _631 * _627;
        float _635 = floor(_633);
        float _637 = -_635;
        float _639 = _633 + _637;
        _641 = _639;
        _643 = true;
    }
    else
    {
        float _645 = float(_109);
        float _647 = 1.0 / _645;
        float _649 = _145 * _647;
        _641 = _649;
    }
    _643 = false;
    float _651 = _641;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _655 = _651 + _653;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _659 = _651 + _657;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _663 = _651 + _661;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _665;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _671 = _669 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _673;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _679 = _677 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _681 = 1.0 / _667;
    bool _683 = _651 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _685 = isnan(_651);
    bool _687 = _683 || _685;
    bool _689 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _691 = _687 || _689;
    float _693 = float(_691);
    bool _695 = _651 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _697 = isnan(_651);
    bool _699 = _695 || _697;
    bool _701 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _703 = _699 || _701;
    float _705 = float(_703);
    float _707 = 1.0 / _671;
    bool _709 = _651 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _711 = isnan(_651);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    float _721 = 1.0 / _675;
    float _723 = _655 * _681;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _727 = _651 + _725;
    bool _729 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _731 = 1.0 / _679;
    float _733 = _659 * _707;
    bool _735 = _651 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _737 = isnan(_651);
    bool _739 = _735 || _737;
    bool _741 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _743 = _739 || _741;
    float _745 = float(_743);
    float _747 = -_745;
    float _749 = _747 + 1.0;
    float _751 = _663 * _721;
    float _753 = _727 * _731;
    bool _755 = _651 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _757 = isnan(_651);
    bool _759 = _755 || _757;
    bool _761 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _763 = _759 || _761;
    float _765 = float(_763);
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _769 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _767;
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _773 = _771 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _775 = _765 * _749;
    float _777 = -_765;
    float _779 = _777 + 1.0;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _781;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _785;
    float _789 = fma(_769, _723, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _791 = _705 * _779;
    float _793 = fma(_783, _723, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _795 = fma(_787, _723, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _797 = -_693;
    float _799 = _797 + 1.0;
    float _801 = -_705;
    float _803 = _801 + 1.0;
    float _805 = fma(_773, _733, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _807 = _719 * _799;
    float _809 = _693 * _803;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _813 = _811 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _815 = -_719;
    float _817 = _815 + 1.0;
    float _819 = _793 * _807;
    float _821 = _795 * _807;
    float _823 = _789 * _807;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _825;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _831 = _829 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _833 = in.m_59.x;
    float _835 = in.m_59.y;
    float _837 = in.m_59.z;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _839;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _843;
    float _847 = fma(_827, _751, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _849 = fma(_813, _733, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _851 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[143].x, _819);
    float _853 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[143].y, _821);
    float _855 = fma(_831, _733, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _857 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[143].z, _823);
    float _859 = fma(_841, _751, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _861 = fma(_845, _751, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _863 = fma(_805, _809, _851);
    float _865 = fma(_849, _809, _853);
    float _867 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _869 = _867 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _873 = _871 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _877 = _875 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _879 = fma(_855, _809, _857);
    float _881 = fma(_869, _753, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _883 = fma(_873, _753, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _885 = fma(_877, _753, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _887 = fma(_859, _791, _863);
    float _889 = fma(_847, _791, _865);
    float _891 = fma(_861, _791, _879);
    float _893 = fma(_881, _775, _887);
    float _895 = fma(_883, _775, _889);
    float _897 = fma(_885, _775, _891);
    float _899 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[147].x, _893);
    float _901 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[147].y, _895);
    float _903 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[147].z, _897);
    float _905 = _899 * _833;
    float _907 = _901 * _835;
    float _909 = _903 * _837;
    bool _911 = !_729;
    float _927;
    if (!_911)
    {
        float _913 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _915 = _131 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _917 = fma(_915, (*spvDescriptorSet0.vp_c9)._m0[11].y, _145);
        float _919 = _917 * _913;
        float _921 = floor(_919);
        float _923 = -_921;
        float _925 = _919 + _923;
        _927 = _925;
        _929 = true;
    }
    else
    {
        float _931 = float(_109);
        float _933 = 1.0 / _931;
        float _935 = _145 * _933;
        _927 = _935;
    }
    _929 = false;
    float _937 = _927;
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _941 = _937 + _939;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _945 = _943 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _947 = _937 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _949 = isnan(_937);
    bool _951 = _947 || _949;
    bool _953 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _955 = _951 || _953;
    float _957 = float(_955);
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _961 = _959 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _963 = _937 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _965 = isnan(_937);
    bool _967 = _963 || _965;
    bool _969 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _971 = _967 || _969;
    float _973 = float(_971);
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _977 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _975;
    bool _979 = _937 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _981 = isnan(_937);
    bool _983 = _979 || _981;
    bool _985 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _987 = _983 || _985;
    float _989 = float(_987);
    float _991 = 1.0 / _945;
    float _993 = -_957;
    float _995 = _993 + 1.0;
    float _997 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _999 = 1.0 / _961;
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1003 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1005 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1007 = _997 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1009 = _1001 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1011 = _1005 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1013 = _977 * _991;
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1017 = _1015 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1019 = -_989;
    float _1021 = _1019 + 1.0;
    float _1023 = fma(_1013, _941, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1025 = _973 * _995;
    float _1027 = -_973;
    float _1029 = _1027 + 1.0;
    float _1031 = _957 * _1021;
    float _1033 = _1017 * _999;
    float _1035 = _1023 * _1025;
    float _1037 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1039 = _937 + _1037;
    float _1041 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1035);
    float _1043 = fma(_1033, _1039, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1045 = fma(_1043, _1031, _1041);
    float _1047 = fma(_989, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1045);
    float _1049 = _1047 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_63.x = _1007;
    out.m_63.y = _1009;
    out.m_63.z = _1011;
    out.m_63.w = _1049;
    bool _1051 = !_1003;
    float _1067;
    if (!_1051)
    {
        float _1053 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1055 = _131 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1057 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[11].w, _145);
        float _1059 = _1057 * _1053;
        float _1061 = floor(_1059);
        float _1063 = -_1061;
        float _1065 = _1059 + _1063;
        _1067 = _1065;
        _1069 = true;
    }
    else
    {
        float _1071 = float(_109);
        float _1073 = 1.0 / _1071;
        float _1075 = _145 * _1073;
        _1067 = _1075;
    }
    _1069 = false;
    float _1077 = _1067;
    float _1079 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1081 = _1077 + _1079;
    float _1083 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1085 = _1083 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1087 = _1077 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1089 = isnan(_1077);
    bool _1091 = _1087 || _1089;
    bool _1093 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1095 = _1091 || _1093;
    float _1097 = float(_1095);
    float _1099 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1101 = _1099 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1103 = _1077 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1105 = isnan(_1077);
    bool _1107 = _1103 || _1105;
    bool _1109 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1111 = _1107 || _1109;
    float _1113 = float(_1111);
    float _1115 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1117 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1115;
    bool _1119 = _1077 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1121 = isnan(_1077);
    bool _1123 = _1119 || _1121;
    bool _1125 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1127 = _1123 || _1125;
    float _1129 = float(_1127);
    float _1131 = 1.0 / _1085;
    float _1133 = -_1097;
    float _1135 = _1133 + 1.0;
    bool _1137 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1139 = 1.0 / _1101;
    float _1141 = _1117 * _1131;
    float _1143 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1145 = _1143 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1147 = -_1129;
    float _1149 = _1147 + 1.0;
    float _1151 = fma(_1141, _1081, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1153 = _1113 * _1135;
    float _1155 = -_1113;
    float _1157 = _1155 + 1.0;
    float _1159 = _1097 * _1149;
    float _1161 = _1145 * _1139;
    float _1163 = _1151 * _1153;
    float _1165 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1167 = _1077 + _1165;
    float _1169 = fma(_1157, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1163);
    float _1171 = fma(_1161, _1167, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1173 = fma(_1171, _1159, _1169);
    float _1175 = fma(_1129, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1173);
    float _1177 = _1175 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_65.w = _1177;
    bool _1179 = !_1137;
    float _1195;
    if (!_1179)
    {
        float _1181 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1183 = _131 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1185 = fma(_1183, (*spvDescriptorSet0.vp_c9)._m0[14].x, _145);
        float _1187 = _1185 * _1181;
        float _1189 = floor(_1187);
        float _1191 = -_1189;
        float _1193 = _1187 + _1191;
        _1195 = _1193;
        _1197 = true;
    }
    else
    {
        float _1199 = float(_109);
        float _1201 = 1.0 / _1199;
        float _1203 = _145 * _1201;
        _1195 = _1203;
    }
    _1197 = false;
    float _1205 = _1195;
    float _1207 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1209 = _1205 + _1207;
    bool _1211 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1213 = isnan(_1205);
    bool _1215 = _1211 || _1213;
    bool _1217 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1219 = _1215 || _1217;
    float _1221 = float(_1219);
    float _1223 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1225 = _1223 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1227 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1229 = isnan(_1205);
    bool _1231 = _1227 || _1229;
    bool _1233 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1235 = _1231 || _1233;
    float _1237 = float(_1235);
    float _1239 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1241 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1239;
    float _1243 = -_1221;
    float _1245 = _1243 + 1.0;
    bool _1247 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1249 = isnan(_1205);
    bool _1251 = _1247 || _1249;
    bool _1253 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1255 = _1251 || _1253;
    float _1257 = float(_1255);
    float _1259 = 1.0 / _1225;
    bool _1261 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1263 = isnan(_1205);
    bool _1265 = _1261 || _1263;
    bool _1267 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1269 = _1265 || _1267;
    float _1271 = float(_1269);
    float _1273 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1275 = _1273 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1277 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1279 = isnan(_1205);
    bool _1281 = _1277 || _1279;
    bool _1283 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1285 = _1281 || _1283;
    float _1287 = float(_1285);
    float _1289 = 1.0 / _1275;
    bool _1291 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1293 = _1241 * _1259;
    float _1295 = _1237 * _1245;
    float _1297 = -_1237;
    float _1299 = _1297 + 1.0;
    bool _1301 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1303 = isnan(_1205);
    bool _1305 = _1301 || _1303;
    bool _1307 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1309 = _1305 || _1307;
    float _1311 = float(_1309);
    float _1313 = fma(_1293, _1209, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1315 = _1257 * _1299;
    float _1317 = -_1257;
    float _1319 = _1317 + 1.0;
    float _1321 = -_1311;
    float _1323 = _1321 + 1.0;
    float _1325 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1327 = _1325 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1329 = _1311 * _1319;
    float _1331 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1333 = _1331 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1335 = _1271 * _1323;
    float _1337 = -_1271;
    float _1339 = _1337 + 1.0;
    bool _1341 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1343 = isnan(_1205);
    bool _1345 = _1341 || _1343;
    bool _1347 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1349 = _1345 || _1347;
    float _1351 = float(_1349);
    float _1353 = -_1287;
    float _1355 = _1353 + 1.0;
    float _1357 = 1.0 / _1327;
    float _1359 = _1287 * _1339;
    float _1361 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1363 = _1361 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1365 = _1351 * _1355;
    float _1367 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1369 = _1367 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1371 = -_1351;
    float _1373 = _1371 + 1.0;
    float _1375 = _1313 * _1365;
    float _1377 = 1.0 / _1333;
    float _1379 = _1369 * _1289;
    float _1381 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1383 = _1205 + _1381;
    float _1385 = fma(_1373, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1375);
    float _1387 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1389 = _1387 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1391 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1393 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1391;
    float _1395 = 1.0 / _1363;
    float _1397 = fma(_1379, _1383, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1399 = _1393 * _1357;
    float _1401 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1403 = _1205 + _1401;
    float _1405 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1407 = _1405 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1409 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1411 = _1409 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1413 = 1.0 / _1389;
    float _1415 = fma(_1397, _1359, _1385);
    float _1417 = _1411 * _1377;
    float _1419 = fma(_1399, _1403, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1421 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1423 = _1205 + _1421;
    float _1425 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1427 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1425;
    float _1429 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1431 = _1429 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1433 = 1.0 / _1407;
    float _1435 = fma(_1417, _1423, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1437 = _1427 * _1395;
    float _1439 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1441 = _1205 + _1439;
    float _1443 = _1431 * _1413;
    float _1445 = fma(_1419, _1335, _1415);
    float _1447 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1449 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1447;
    float _1451 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1453 = _1205 + _1451;
    bool _1455 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1457 = isnan(_1205);
    bool _1459 = _1455 || _1457;
    bool _1461 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1463 = _1459 || _1461;
    float _1465 = float(_1463);
    float _1467 = fma(_1437, _1441, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1469 = fma(_1435, _1329, _1445);
    float _1471 = fma(_1443, _1453, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1473 = _1449 * _1433;
    float _1475 = -_1465;
    float _1477 = _1475 + 1.0;
    float _1479 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1481 = _1205 + _1479;
    float _1483 = fma(_1467, _1315, _1469);
    float _1485 = _1221 * _1477;
    float _1487 = fma(_1473, _1481, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1489 = fma(_1471, _1295, _1483);
    float _1491 = fma(_1487, _1485, _1489);
    float _1493 = fma(_1465, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1491);
    float _1495 = precise::clamp(_1493, 0.0, 1.0);
    bool _1497 = !_1291;
    float _1513;
    if (!_1497)
    {
        float _1499 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _1501 = _131 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _1503 = fma(_1501, (*spvDescriptorSet0.vp_c9)._m0[14].z, _145);
        float _1505 = _1503 * _1499;
        float _1507 = floor(_1505);
        float _1509 = -_1507;
        float _1511 = _1505 + _1509;
        _1513 = _1511;
        _1515 = true;
    }
    else
    {
        float _1517 = float(_109);
        float _1519 = 1.0 / _1517;
        float _1521 = _145 * _1519;
        _1513 = _1521;
    }
    _1515 = false;
    float _1523 = _1513;
    int _1525 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _1527 = _1525;
    int _1529 = 0;
    int _1531 = _100(_1527, _1529, (*spvDescriptorSet0.support_buffer));
    float _1533 = in.m_57.z;
    float _1535 = trunc(_1533);
    int _1537 = int(_1535);
    int _1539 = _1531 + (-1);
    float _1541 = float(_1539);
    float _1543 = _1495 * _1541;
    float _1545 = trunc(_1543);
    int _1547 = int(_1545);
    int _1549 = _1547;
    int _1551 = 0;
    int _1553 = _101(_1549, _1551, (*spvDescriptorSet0.support_buffer));
    int _1555 = _1537;
    int _1557 = 0;
    int _1559 = _101(_1555, _1557, (*spvDescriptorSet0.support_buffer));
    float4 _1562 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1553, _1559)), 0).xyzw;
    float _1564 = _1562.x;
    float _1566 = _1562.y;
    float _1568 = _1562.z;
    float _1570 = _1562.w;
    float _1572 = in.m_57.x;
    float _1574 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1576 = _1574 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1578 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1580 = _1578 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    int _1582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1584 = _1582 != 0;
    float _1586 = 1.0 / _1576;
    float _1588 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1590 = _1588 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    int _1592 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1594 = _1592 != 0;
    int _1596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1598 = _1596 != 0;
    int _1600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1602 = _1600 != 0;
    float _1604 = 1.0 / _1580;
    float _1606 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1608 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1606;
    float _1610 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _1612 = _1610 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    bool _1614 = false;
    if (_1584)
    {
        bool _1616 = _131 > 0.5;
        _1614 = _1616;
    }
    bool _1618 = _1614;
    float _1620 = 1.0 / _1590;
    float _1622 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1624 = _1622 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1626 = _1608 * _1586;
    bool _1628 = _1523 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1630 = isnan(_1523);
    bool _1632 = _1628 || _1630;
    bool _1634 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1636 = _1632 || _1634;
    float _1638 = float(_1636);
    bool _1640 = _1523 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1642 = isnan(_1523);
    bool _1644 = _1640 || _1642;
    bool _1646 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1648 = _1644 || _1646;
    float _1650 = float(_1648);
    bool _1652 = _1523 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1654 = isnan(_1523);
    bool _1656 = _1652 || _1654;
    bool _1658 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _1660 = _1656 || _1658;
    float _1662 = float(_1660);
    float _1664 = 1.0 / _1624;
    float _1666 = _1612 * _1604;
    float _1668 = -_1638;
    float _1670 = _1668 + 1.0;
    float _1672 = -_1650;
    float _1674 = _1672 + 1.0;
    bool _1676 = _1523 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1678 = isnan(_1523);
    bool _1680 = _1676 || _1678;
    bool _1682 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _1684 = _1680 || _1682;
    float _1686 = float(_1684);
    float _1688 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1690 = _1688 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1692 = _1650 * _1670;
    float _1694 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1696 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _1694;
    float _1698 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _1700 = _1698 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1702 = 1.0 / _1690;
    float _1704 = _1662 * _1674;
    float _1706 = _1696 * _1620;
    float _1708 = -_1662;
    float _1710 = _1708 + 1.0;
    bool _1712 = _1523 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1714 = isnan(_1523);
    bool _1716 = _1712 || _1714;
    bool _1718 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1720 = _1716 || _1718;
    float _1722 = float(_1720);
    float _1724 = _1700 * _1664;
    float _1726 = -_1686;
    float _1728 = _1726 + 1.0;
    bool _1730 = _1523 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1732 = isnan(_1523);
    bool _1734 = _1730 || _1732;
    bool _1736 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1738 = _1734 || _1736;
    float _1740 = float(_1738);
    float _1742 = _1686 * _1710;
    float _1744 = _1722 * _1728;
    float _1746 = -_1722;
    float _1748 = _1746 + 1.0;
    bool _1750 = _1523 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _1752 = isnan(_1523);
    bool _1754 = _1750 || _1752;
    bool _1756 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _1758 = _1754 || _1756;
    float _1760 = float(_1758);
    float _1762 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1764 = _1523 + _1762;
    float _1766 = -_1740;
    float _1768 = _1766 + 1.0;
    float _1770 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1772 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _1770;
    float _1774 = fma(_1626, _1764, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _1776 = _1760 * _1768;
    float _1778 = _1772 * _1702;
    float _1780 = _1740 * _1748;
    float _1782 = _1774 * _1776;
    float _1784 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1786 = _1523 + _1784;
    float _1788 = -_1760;
    float _1790 = _1788 + 1.0;
    float _1792 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1794 = _1792 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1796 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1798 = _1796 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _1800 = fma(_1666, _1786, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _1802 = in.m_53.w;
    float _1804 = fma(_1790, (*spvDescriptorSet0.vp_c9)._m0[175].x, _1782);
    float _1806 = 1.0 / _1794;
    float _1808 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1810 = _1523 + _1808;
    float _1812 = fma(_1800, _1780, _1804);
    float _1814 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _1816 = _1814 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1818 = fma(_1706, _1810, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _1820 = in.m_53.y;
    float _1822 = 1.0 / _1798;
    float _1824 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1826 = _1523 + _1824;
    float _1828 = _1804;
    float _1830 = _1638;
    float _1832 = _1692;
    if (_1594)
    {
        float _1834 = in.m_53.z;
        _1828 = _1834;
    }
    float _1836 = _1828;
    float _1838 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1840 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _1838;
    float _1842 = fma(_1724, _1826, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _1844 = fma(_1818, _1744, _1812);
    bool _1846 = _1523 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _1848 = isnan(_1523);
    bool _1850 = _1846 || _1848;
    bool _1852 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _1854 = _1850 || _1852;
    float _1856 = float(_1854);
    float _1858 = _1816 * _1806;
    float _1860 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1862 = _1523 + _1860;
    float _1864 = fma(_1842, _1742, _1844);
    float _1866 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1868 = _1523 + _1866;
    float _1870 = -_391;
    float _1872 = _1870 + 1.0;
    float _1874 = fma(_1778, _1862, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    bool _1876 = _1802 > 0.5;
    bool _1878 = _1876 && _1598;
    float _1880 = -_1856;
    float _1882 = _1880 + 1.0;
    float _1884 = _1840 * _1822;
    float _1886 = fma(_1858, _1868, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _1888 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1890 = _1523 + _1888;
    float _1892 = fma(_1874, _1704, _1864);
    float _1894 = _1878 ? _1872 : _391;
    float _1896 = _1638 * _1882;
    float _1898 = fma(_1884, _1890, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _1900 = fma(_1886, _1692, _1892);
    bool _1902 = _1820 > 0.5;
    bool _1904 = _1902 && _1602;
    float _1906 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1908 = as_type<int>(_1900);
    int _1910 = as_type<int>(_1896);
    if (!_1584)
    {
        _1830 = _1572;
    }
    float _1912 = _1830;
    float _1914 = fma(_1898, _1896, _1900);
    float _1916 = _1904 ? _1872 : _391;
    float _1918 = _1894 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1920 = _1547 + 1;
    float _1922 = fma(_1856, (*spvDescriptorSet0.vp_c9)._m0[182].x, _1914);
    float _1924 = _1912;
    if (!_1584)
    {
        _1832 = _1912;
    }
    float _1926 = _1832;
    float _1928 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1930 = _1926;
    if (_1584)
    {
        _1924 = _1572;
    }
    float _1932 = _1924;
    int _1934 = min(_1539, _1920);
    out.m_67.x = _1922;
    bool _1936 = false;
    float _1938 = _1932;
    if (_1594)
    {
        bool _1940 = _1836 > 0.5;
        _1936 = _1940;
    }
    bool _1942 = _1936;
    if (_1584)
    {
        float _1944 = -_1932;
        float _1946 = _1944 + 1.0;
        _1908 = as_type<int>(_1946);
    }
    int _1948 = _1908;
    if (_1594)
    {
        float _1950 = -_1932;
        float _1952 = _1950 + 1.0;
        _1910 = as_type<int>(_1952);
    }
    int _1954 = _1910;
    float _1956 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_1584)
    {
        float _1958 = _1618 ? as_type<float>(_1948) : _1932;
        _1930 = _1958;
    }
    float _1960 = _1930;
    float _1962 = _1916 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_1594)
    {
        float _1964 = _1942 ? as_type<float>(_1954) : _1932;
        _1938 = _1964;
    }
    float _1966 = _1938;
    float _1968 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1970 = _1962 * _1956;
    float _1972 = _1966 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1974 = _1918 * _1906;
    float _1976 = _1972 * _1968;
    uint _1979 = as_type<uint>(half2(float2(_1570, 0.0)));
    uint _1981 = extract_bits(_1979, 0u, 8u);
    int _1983 = int(_1981) & 255;
    uint _1985 = extract_bits(_1979, 8u, 8u);
    int _1987 = int(_1985) & 255;
    int _1989 = _1987 << 8;
    int _1991 = _1983 | _1989;
    bool _1993 = _1991 >= 32768;
    int _1995 = _1991 + (-1024);
    int _1997 = _1995;
    if (_1993)
    {
        int _1999 = ~_1991;
        int _2001 = _1999 + 33792;
        int _2003 = _2001 + 1;
        _1997 = _2003;
    }
    int _2005 = _1997;
    int _2007 = _2005 + 30719;
    float _2009 = float(_2007);
    float _2011 = fma(_2009, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2013 = abs(_2011);
    float _2015 = -_2013;
    float _2017 = _2015 + 1.0;
    float _2019 = abs(_2011);
    float _2021 = fma(_2019, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _2023 = _2011 < 0.0;
    float _2025 = float(_2023);
    int _2027 = as_type<int>(_2017) + (-218103808);
    float _2029 = abs(_2011);
    float _2031 = fma(_2029, _2021, -0.212114393711090087890625);
    bool _2033 = uint(_2027) >= 1920991232u;
    float _2035 = _1960 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2037 = abs(_2011);
    float _2039 = fma(_2037, _2031, 1.570728778839111328125);
    float _2041 = _2035 * _1928;
    bool _2043 = !_2033;
    float _2061;
    if (!_2043)
    {
        int _2045 = as_type<int>(_2017);
        int _2047 = as_type<int>(_1836);
        int _2049 = 10320;
        int _2051;
        int _2053;
        int _2055;
        int _2057;
        int _2059;
        _98(_2045, _2047, _2049, _2051, _2053, _2055, _2057, _2059, out.gl_Position, out.gl_PointSize);
        _2061 = as_type<float>(_2055);
        _2063 = true;
    }
    else
    {
        float _2065 = rsqrt(_2017);
        float _2067 = _2017 * _2065;
        float _2069 = _2065 * 0.5;
        float _2071 = -_2067;
        float _2073 = 0.0 + _2071;
        float _2075 = fma(_2069, _2073, 0.5);
        float _2077 = fma(_2067, _2075, _2067);
        float _2079 = -_2077;
        float _2081 = 0.0 + _2079;
        float _2083 = fma(_2077, _2081, _2017);
        float _2085 = fma(_2069, _2083, _2077);
        _2061 = _2085;
    }
    _2063 = false;
    float _2087 = _2061;
    int _2089 = _1934;
    int _2091 = 0;
    int _2093 = _101(_2089, _2091, (*spvDescriptorSet0.support_buffer));
    int _2095 = _1537;
    int _2097 = 0;
    int _2099 = _101(_2095, _2097, (*spvDescriptorSet0.support_buffer));
    float4 _2101 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_2093, _2099)), 0).xyzw;
    float _2103 = _2101.x;
    float _2105 = _2101.y;
    float _2107 = _2101.z;
    float _2109 = _2101.w;
    float _2111 = _2039 * _2087;
    float _2113 = _2025 * 2.0;
    float _2115 = _2009 * 3.883221149444580078125;
    float _2117 = floor(_1543);
    float _2119 = -_2113;
    float _2121 = fma(_2111, _2119, _2111);
    float _2123 = _2115 * 0.15915493667125701904296875;
    float _2125 = fma(_2025, 3.1415927410125732421875, _2121);
    float _2127 = _2123 * 6.283185482025146484375;
    float _2129 = cos(_2127);
    float _2131 = _2125 * 0.15915493667125701904296875;
    float _2133 = _2131 * 6.283185482025146484375;
    float _2135 = sin(_2133);
    float _2137 = -_2117;
    float _2139 = _1543 + _2137;
    float _2141 = _2123 * 6.283185482025146484375;
    float _2143 = sin(_2141);
    float _2145 = _2135 * _2129;
    float _2147 = _2135 * _2143;
    uint _2149 = as_type<uint>(half2(float2(_2109, 0.0)));
    float _2151 = -_1564;
    float _2153 = _2151 + _2103;
    float _2155 = -_1566;
    float _2157 = _2155 + _2105;
    float _2159 = -_1568;
    float _2161 = _2159 + _2107;
    uint _2163 = extract_bits(_2149, 0u, 8u);
    int _2165 = int(_2163) & 255;
    uint _2167 = extract_bits(_2149, 8u, 8u);
    int _2169 = int(_2167) & 255;
    int _2171 = _2169 << 8;
    int _2173 = _2165 | _2171;
    float _2175 = fma(_2139, _2153, _1564);
    float _2177 = fma(_2139, _2157, _1566);
    float _2179 = fma(_2139, _2161, _1568);
    bool _2181 = _2173 >= 32768;
    int _2183 = _2173 + (-1024);
    int _2185 = _2183;
    if (_2181)
    {
        int _2187 = ~_2173;
        int _2189 = _2187 + 33792;
        int _2191 = _2189 + 1;
        _2185 = _2191;
    }
    int _2193 = _2185;
    int _2195 = _2193 + 30719;
    float _2197 = float(_2195);
    float _2199 = fma(_2197, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2201 = abs(_2199);
    float _2203 = -_2201;
    float _2205 = _2203 + 1.0;
    float _2207 = abs(_2199);
    float _2209 = fma(_2207, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _2211 = _2199 < 0.0;
    float _2213 = float(_2211);
    int _2215 = as_type<int>(_2205) + (-218103808);
    float _2217 = abs(_2199);
    float _2219 = fma(_2217, _2209, -0.212114393711090087890625);
    bool _2221 = uint(_2215) >= 1920991232u;
    float _2223 = abs(_2199);
    float _2225 = fma(_2223, _2219, 1.570728778839111328125);
    bool _2227 = !_2221;
    float _2245;
    if (!_2227)
    {
        int _2229 = as_type<int>(_2205);
        int _2231 = as_type<int>(_2131);
        int _2233 = 11216;
        int _2235;
        int _2237;
        int _2239;
        int _2241;
        int _2243;
        _98(_2229, _2231, _2233, _2235, _2237, _2239, _2241, _2243, out.gl_Position, out.gl_PointSize);
        _2245 = as_type<float>(_2239);
        _2247 = true;
    }
    else
    {
        float _2249 = rsqrt(_2205);
        float _2251 = _2205 * _2249;
        float _2253 = _2249 * 0.5;
        float _2255 = -_2251;
        float _2257 = 0.0 + _2255;
        float _2259 = fma(_2253, _2257, 0.5);
        float _2261 = fma(_2251, _2259, _2251);
        float _2263 = -_2261;
        float _2265 = 0.0 + _2263;
        float _2267 = fma(_2261, _2265, _2205);
        float _2269 = fma(_2253, _2267, _2261);
        _2245 = _2269;
    }
    _2247 = false;
    float _2271 = _2245;
    float _2273 = in.m_53.x;
    float _2275 = in.m_53.y;
    float _2277 = in.m_53.z;
    float _2279 = _617 * _617;
    float _2281 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2283 = log2(_2281);
    float _2285 = _2225 * _2271;
    float _2287 = fma(_619, _619, _2279);
    float _2289 = _2197 * 3.883221149444580078125;
    int _2291 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2293 = _2291 != 0;
    int _2295 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2297 = _2295 != 0;
    int _2299 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2301 = _2299 != 0;
    float _2303 = -_2011;
    float _2305 = _2303 + _2199;
    float _2307 = fma(_621, _621, _2287);
    float _2309 = _2289 * 0.15915493667125701904296875;
    float _2311 = _441 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2313 = rsqrt(_2307);
    float _2315 = _2283 * _145;
    float _2317 = _2277 * 2.0;
    float _2319 = _2273 * 2.0;
    float _2321 = _2275 * 2.0;
    float _2323 = floor(_2319);
    float _2325 = floor(_2317);
    float _2327 = _2273 + _2277;
    float _2329 = _2327 + (-1.0);
    float _2331 = floor(_2321);
    bool _2333 = _2323 >= 0.0;
    bool _2335 = isnan(_2323);
    bool _2337 = _2333 || _2335;
    bool _2339 = isnan(0.0);
    bool _2341 = _2337 || _2339;
    bool _2343 = _2325 > 0.0;
    float _2345 = fma(_2329, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _2347 = _2325 >= 0.0;
    bool _2349 = isnan(_2325);
    bool _2351 = _2347 || _2349;
    bool _2353 = isnan(0.0);
    bool _2355 = _2351 || _2353;
    float _2357 = _2275 + _2273;
    float _2359 = exp2(_2315);
    float _2361 = _2313 * _617;
    int _2363 = _2355 ? 0 : 1;
    float _2365 = _2357 + (-1.0);
    bool _2367 = _2323 > 0.0;
    int _2369 = ~_2363;
    int _2371 = _2369 + 1;
    int _2373 = _2371 + 1;
    float _2375 = fma(_2365, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2377 = _2313 * _621;
    int _2379 = _2373;
    if (!_2343)
    {
        int _2381 = ~_2363;
        int _2383 = _2381 + 1;
        _2379 = _2383;
    }
    int _2385 = _2379;
    bool _2387 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2389 = isnan(1.0);
    bool _2391 = _2387 || _2389;
    bool _2393 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2395 = _2391 || _2393;
    float _2397 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2399 = 1.0 + _2397;
    float _2401 = _2313 * _619;
    bool _2403 = !_2293;
    int _2405 = _2403 ? 0 : 1;
    float _2407 = in.m_69.x;
    float _2409 = in.m_69.y;
    float _2411 = in.m_69.z;
    float _2413 = 1.0 / _2399;
    bool _2415 = _2331 > 0.0;
    float _2417 = -_2359;
    float _2419 = _2417 + 1.0;
    bool _2421 = _2331 >= 0.0;
    bool _2423 = isnan(_2331);
    bool _2425 = _2421 || _2423;
    bool _2427 = isnan(0.0);
    bool _2429 = _2425 || _2427;
    float _2431 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2433 = _2377 * _2431;
    int _2435 = _2341 ? 0 : 1;
    int _2437 = abs(_2405);
    bool _2439 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2441 = isnan(0.0);
    bool _2443 = _2439 || _2441;
    bool _2445 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2447 = _2443 || _2445;
    float _2449 = float(_2437);
    float _2451 = _2447 ? _2419 : 0.0;
    float _2453 = float(_2385);
    bool _2455 = !_2301;
    int _2457 = _2455 ? 0 : 1;
    if (_2395)
    {
        float _2459 = _2451 * _2413;
        _151 = _2459;
    }
    float _2461 = _151;
    int _2463 = _2429 ? 0 : 1;
    float _2465 = _2449 * _2453;
    int _2467 = abs(_2457);
    float _2469 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2471 = _2361 * _2469;
    int _2473 = ~_2435;
    int _2475 = _2473 + 1;
    int _2477 = _2475 + 1;
    float _2479 = _2465 * (-2.0);
    int _2481 = ~_2463;
    int _2483 = _2481 + 1;
    int _2485 = _2483 + 1;
    float _2487 = _2273 + (-0.5);
    int _2489 = _2477;
    int _2491 = _2485;
    if (!_2367)
    {
        int _2493 = ~_2435;
        int _2495 = _2493 + 1;
        _2489 = _2495;
    }
    int _2497 = _2489;
    float _2499 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2501 = -_2471;
    float _2503 = fma(_2377, _2499, _2501);
    if (!_2415)
    {
        int _2505 = ~_2463;
        int _2507 = _2505 + 1;
        _2491 = _2507;
    }
    int _2509 = _2491;
    float _2511 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2513 = _2401 * _2511;
    float _2515 = float(_2467);
    float _2517 = fma(_2479, _2407, _2407);
    float _2519 = float(_2509);
    float _2521 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2523 = -_2433;
    float _2525 = fma(_2401, _2521, _2523);
    float _2527 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2529 = -_2513;
    float _2531 = fma(_2361, _2527, _2529);
    float _2533 = fma(_2375, _2479, _2375);
    float _2535 = fma(_2487, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2517);
    bool _2537 = !_2297;
    int _2539 = _2537 ? 0 : 1;
    float _2541 = _2515 * _2519;
    float _2543 = float(_2497);
    float _2545 = fma(_2533, _2461, _2535);
    int _2547 = abs(_2539);
    float _2549 = _2541 * (-2.0);
    float _2551 = _2277 + (-0.5);
    float _2553 = _2545 * 0.15915493667125701904296875;
    float _2555 = float(_2547);
    float _2557 = fma(_2549, _2411, _2411);
    float _2559 = _2525 * _2525;
    float _2561 = fma(_2345, _2549, _2345);
    float _2563 = _2553 * 6.283185482025146484375;
    float _2565 = sin(_2563);
    float _2567 = fma(_2551, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2557);
    float _2569 = _2555 * _2543;
    float _2571 = _2275 + _2277;
    float _2573 = _2275 + (-0.5);
    float _2575 = _2569 * (-2.0);
    float _2577 = _2571 + (-1.0);
    float _2579 = fma(_2503, _2503, _2559);
    float _2581 = fma(_2561, _2461, _2567);
    float _2583 = fma(_2575, _2409, _2409);
    float _2585 = fma(_2577, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2587 = fma(_2531, _2531, _2579);
    float _2589 = _2581 * 0.15915493667125701904296875;
    float _2591 = fma(_2573, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2583);
    float _2593 = fma(_2585, _2575, _2585);
    float _2595 = _2553 * 6.283185482025146484375;
    float _2597 = cos(_2595);
    bool _2599 = _2177 != 0.0;
    bool _2601 = isnan(_2177);
    bool _2603 = _2599 || _2601;
    bool _2605 = isnan(0.0);
    bool _2607 = _2603 || _2605;
    float _2609 = fma(_2593, _2461, _2591);
    float _2611 = _2213 * 2.0;
    bool _2613 = _2175 == 0.0;
    bool _2615 = !_2607;
    bool _2617 = _2613 && _2615;
    float _2619 = rsqrt(_2587);
    float _2621 = _2609 * 0.15915493667125701904296875;
    float _2623 = _905 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2625 = _907 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2627 = _909 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2629 = -_2611;
    float _2631 = fma(_2285, _2629, _2285);
    float _2633 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2179);
    float _2635 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2175);
    float _2637 = _2589 * 6.283185482025146484375;
    float _2639 = sin(_2637);
    float _2641 = fma(_2213, 3.1415927410125732421875, _2631);
    float _2643 = _2627 * _2633;
    float _2645 = _2623 * _2635;
    bool _2647 = _2179 == 0.0;
    bool _2649 = _2647 && _2617;
    float _2651 = _2641 * 0.15915493667125701904296875;
    float _2653 = _2589 * 6.283185482025146484375;
    float _2655 = cos(_2653);
    float _2657 = _2525 * _2619;
    float _2659 = _2531 * _2619;
    float _2661 = _2503 * _2619;
    float _2663 = _2401 * _2657;
    float _2665 = _2621 * 6.283185482025146484375;
    float _2667 = sin(_2665);
    float _2669 = _2565 * _2639;
    float _2671 = _2597 * _2639;
    float _2673 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2177);
    float _2675 = -_2663;
    float _2677 = fma(_2361, _2661, _2675);
    float _2679 = _2625 * _2673;
    float _2681 = _2621 * 6.283185482025146484375;
    float _2683 = cos(_2681);
    float _2685 = _2597 * _2655;
    float _2687 = _2565 * _2655;
    float _2689 = fma(_2667, _2669, _2685);
    float _2691 = -_2671;
    float _2693 = fma(_2667, _2687, _2691);
    float _2695 = -_2687;
    float _2697 = fma(_2667, _2671, _2695);
    float _2699 = fma(_2667, _2685, _2669);
    float _2701 = _2689 * _2401;
    float _2703 = _2361 * _2659;
    float _2705 = _441 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2707 = _2309 * 6.283185482025146484375;
    float _2709 = sin(_2707);
    float _2711 = _2683 * _2639;
    float _2713 = _2683 * _2655;
    float _2715 = _2697 * _2401;
    float _2717 = fma(_2693, _2661, _2701);
    float _2719 = _2711 * _2401;
    float _2721 = _2565 * _2683;
    float _2723 = -_2703;
    float _2725 = fma(_2377, _2657, _2723);
    float _2727 = _2689 * _2377;
    float _2729 = _2597 * _2683;
    float _2731 = fma(_2699, _2661, _2715);
    float _2733 = fma(_2713, _2661, _2719);
    float _2735 = _2697 * _2377;
    float _2737 = _2711 * _2377;
    float _2739 = fma(_2693, _2659, _2727);
    float _2741 = fma(_2721, _2725, _2717);
    float _2743 = fma(_2729, _2725, _2731);
    float _2745 = fma(_2699, _2659, _2735);
    float _2747 = -_2667;
    float _2749 = fma(_2747, _2725, _2733);
    float _2751 = fma(_2713, _2659, _2737);
    float _2753 = _441 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2755 = fma(_2721, _2677, _2739);
    float _2757 = fma(_2729, _2677, _2745);
    float _2759 = -_2667;
    float _2761 = fma(_2759, _2677, _2751);
    float _2763 = fma(_439, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2705);
    float _2765 = fma(_439, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2753);
    float _2767 = _2679 * _2741;
    float _2769 = _2679 * _2755;
    float _2771 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2763);
    float _2773 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2765);
    float _2775 = fma(_2645, _2749, _2767);
    float _2777 = fma(_2645, _2761, _2769);
    float _2779 = _2651 * 6.283185482025146484375;
    float _2781 = sin(_2779);
    float _2783 = _2771 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2785 = _2773 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2787 = fma(_2643, _2743, _2775);
    float _2789 = fma(_2643, _2757, _2777);
    float _2791 = _2689 * _2361;
    float _2793 = _2711 * _2361;
    float _2795 = _2783 + _2787;
    float _2797 = _2785 + _2789;
    float _2799 = _2697 * _2361;
    float _2801 = fma(_2713, _2657, _2793);
    float _2803 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2805 = _2795 + _2803;
    float _2807 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2809 = _2797 + _2807;
    float _2811 = _2309 * 6.283185482025146484375;
    float _2813 = cos(_2811);
    float _2815 = fma(_2699, _2657, _2799);
    float _2817 = _2805 * _2805;
    float _2819 = _2809 * _2809;
    float _2821 = -_2147;
    float _2823 = fma(_2781, _2709, _2821);
    float _2825 = fma(_2139, _2305, _2011);
    float _2827 = fma(_439, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2311);
    float _2829 = _2817 + _2819;
    float _2831 = fma(_2139, _2823, _2147);
    float _2833 = _2377 * _2661;
    float _2835 = fma(_2177, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2825);
    float _2837 = sqrt(_2829);
    float _2839 = -_2833;
    float _2841 = fma(_2401, _2659, _2839);
    float _2843 = fma(_2693, _2657, _2791);
    float _2845 = fma(_2179, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2831);
    float _2847 = _2649 ? _2825 : _2835;
    float _2849 = -_2667;
    float _2851 = fma(_2849, _2841, _2801);
    float _2853 = fma(_2721, _2841, _2843);
    float _2855 = -_2145;
    float _2857 = fma(_2781, _2813, _2855);
    float _2859 = _2649 ? _2831 : _2845;
    float _2861 = _2847 * _2847;
    float _2863 = _2679 * _2853;
    float _2865 = fma(_2729, _2841, _2815);
    float _2867 = fma(_2139, _2857, _2145);
    float _2869 = fma(_2859, _2859, _2861);
    float _2871 = fma(_2645, _2851, _2863);
    float _2873 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2827);
    bool _2875 = _2837 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2877 = fma(_2643, _2865, _2871);
    float _2879 = _2873 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2881 = rsqrt(_2869);
    float _2883 = _2879 + _2877;
    float _2885 = _2817;
    float _2887 = _2819;
    float _2889 = _2795;
    float _2891 = _2797;
    float _2893 = _2825;
    float _2895 = _2867;
    float _2897 = _2831;
    if (!_2875)
    {
        _451 = _2883;
    }
    float _2899 = _451;
    bool _2901 = !_2875;
    float _2903 = _2899;
    if (!_2901)
    {
        float _2905 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2907 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2909 = _2837 + _2907;
        float _2911 = _2883 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2913 = rsqrt(_2829);
        float _2915 = _2909 * _2905;
        float _2917 = _2915 * 0.15915493667125701904296875;
        float _2919 = _2917 * 6.283185482025146484375;
        float _2921 = sin(_2919);
        float _2923 = _2917 * 6.283185482025146484375;
        float _2925 = cos(_2923);
        float _2927 = fma(_2921, _2911, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2929 = _2913 * _2927;
        float _2931 = _2925 + (-1.0);
        float _2933 = _2805 * _2929;
        float _2935 = _2809 * _2929;
        float _2937 = _2931 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2939 = _2933 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2941 = _2933 * _2933;
        float _2943 = _2935 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2945 = fma(_2883, _2925, _2937);
        float _2947 = _2935 * _2935;
        _2903 = _2945;
        _2885 = _2941;
        _2887 = _2947;
        _2889 = _2939;
        _2891 = _2943;
    }
    float _2949 = _2903;
    float _2951 = _2885;
    float _2953 = _2887;
    float _2955 = _2889;
    float _2957 = _2891;
    float _2959 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2961 = _2949 + _2959;
    if (!_2649)
    {
        _2893 = _2835;
    }
    float _2963 = _2893;
    float _2965 = _2859 * _2881;
    float _2967 = _2847 * _2881;
    float _2969 = fma(_2961, _2961, _2951);
    if (!_2649)
    {
        float _2971 = fma(_2175, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2867);
        _2895 = _2971;
    }
    float _2973 = _2895;
    float _2975 = _2741 * _2963;
    float _2977 = _2853 * _2963;
    float _2979 = _2969 + _2953;
    float _2981 = _2755 * _2963;
    float _2983 = _2975;
    if (!_2649)
    {
        _2897 = _2845;
    }
    float _2985 = _2897;
    float _2987 = -_2967;
    float _2989 = _2743 * _2987;
    float _2991 = -_2967;
    float _2993 = _2865 * _2991;
    float _2995 = -_2967;
    float _2997 = _2757 * _2995;
    float _2999 = sqrt(_2979);
    float _3001 = fma(_2749, _2973, _2975);
    float _3003 = fma(_2851, _2973, _2977);
    float _3005 = fma(_2761, _2973, _2981);
    float _3007 = fma(_2853, _2965, _2993);
    float _3009 = fma(_2741, _2965, _2989);
    float _3011 = fma(_2755, _2965, _2997);
    float _3013 = fma(_2743, _2985, _3001);
    float _3015 = fma(_2865, _2985, _3003);
    float _3017 = fma(_2757, _2985, _3005);
    out.m_71.x = _2041;
    out.m_71.y = _1970;
    out.m_71.z = _1976;
    out.m_71.w = _1974;
    out.m_73.x = _2749;
    out.m_73.y = _2851;
    out.m_73.z = _2761;
    bool _3019 = _2999 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3021 = isnan(_2999);
    bool _3023 = _3019 || _3021;
    bool _3025 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3027 = _3023 || _3025;
    out.m_75.x = _3009;
    out.m_75.y = _3007;
    out.m_75.z = _3011;
    out.m_77.x = _3013;
    out.m_77.y = _3015;
    out.m_77.z = _3017;
    float _3029 = _3009;
    float _3031 = _3017;
    if (!_3027)
    {
        _2983 = 1.0;
    }
    float _3033 = _2983;
    bool _3035 = !_3027;
    float _3037 = _3033;
    if (!_3035)
    {
        bool _3039 = _2999 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3041 = isnan(_2999);
        bool _3043 = _3039 || _3041;
        bool _3045 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3047 = _3043 || _3045;
        if (!_3047)
        {
            float _3049 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3051 = _2999 + _3049;
            float _3053 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3055 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3053;
            float _3057 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3059 = _3057 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3061 = 1.0 / _3055;
            float _3063 = _3051 * _3061;
            float _3065 = fma(_3063, _3059, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3037 = _3065;
            _3067 = true;
        }
        else
        {
            bool _3069 = _2999 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3071 = isnan(_2999);
            bool _3073 = _3069 || _3071;
            bool _3075 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3077 = _3073 || _3075;
            if (!_3077)
            {
                float _3079 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3081 = _2999 + _3079;
                float _3083 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3085 = _3083 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3087 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3089 = _3087 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3091 = 1.0 / _3085;
                float _3093 = _3081 * _3091;
                float _3095 = fma(_3093, _3089, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3037 = _3095;
                _3067 = true;
            }
            else
            {
                _3037 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3067 = false;
    float _3097 = _3037;
    float _3099 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3101 = _2949 + _3099;
    float _3103 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3105 = _2955 + _3103;
    float _3107 = fma(_3101, _3097, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3109 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3111 = _2957 + _3109;
    float _3113 = fma(_3105, _3097, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3115 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3117 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3119 = _3107 + _3117;
    float _3121 = fma(_3111, _3097, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3123 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3125 = _3113 + _3123;
    float _3127 = _3107 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3129 = _3119 * _3119;
    float _3131 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3133 = _3121 + _3131;
    float _3135 = fma(_3113, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3127);
    float _3137 = fma(_3125, _3125, _3129);
    float _3139 = fma(_3133, _3133, _3137);
    float _3141 = rsqrt(_3139);
    float _3143 = _3141 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3145 = _3125 * _3143;
    float _3147 = _3133 * _3143;
    float _3149 = _3145 * _3145;
    float _3151 = _3147 * _3147;
    float _3153 = _3149 + _3151;
    float _3155 = sqrt(_3153);
    bool _3157 = _3155 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3159 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3161 = _3155 + _3159;
    float _3163 = _3133;
    float _3165 = _3097;
    float _3167 = _3161;
    float _3169 = _3145;
    if (_3157)
    {
        float _3171 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3163 = _3171;
    }
    float _3173 = _3163;
    if (_3157)
    {
        float _3175 = rsqrt(_3153);
        _3165 = _3175;
    }
    float _3177 = _3165;
    float _3179 = _3177;
    if (_3157)
    {
        float _3181 = _3161 * _3173;
        _3167 = _3181;
    }
    float _3183 = _3167;
    if (_3157)
    {
        float _3185 = _3183 * 0.15915493667125701904296875;
        _3029 = _3185;
    }
    float _3187 = _3029;
    float _3189 = _3141;
    if (_3157)
    {
        float _3191 = _3187 * 6.283185482025146484375;
        float _3193 = sin(_3191);
        _3189 = _3193;
    }
    float _3195 = _3189;
    float _3197 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3199 = precise::max(0.0, _3197);
    float _3201 = _3129;
    float _3203 = _3199;
    float _3205 = _3197;
    if (_3157)
    {
        float _3207 = _3187 * 6.283185482025146484375;
        float _3209 = cos(_3207);
        _3201 = _3209;
    }
    float _3211 = _3201;
    float _3213 = -_3143;
    float _3215 = -_3199;
    float _3217 = fma(_3119, _3213, _3215);
    if (_3157)
    {
        float _3219 = _3217 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3203 = _3219;
    }
    float _3221 = _3203;
    float _3223 = sqrt(_3139);
    float _3225 = _3221;
    float _3227 = _3195;
    if (_3157)
    {
        float _3229 = fma(_3195, _3221, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3225 = _3229;
    }
    float _3231 = _3225;
    float _3233 = _3231;
    if (!_3157)
    {
        _3227 = _3147;
    }
    float _3235 = _3227;
    float _3237 = _3235;
    if (_3157)
    {
        float _3239 = _3211 + (-1.0);
        _3205 = _3239;
    }
    float _3241 = _3205;
    float _3243 = _3241;
    if (_3157)
    {
        float _3245 = _3177 * _3231;
        _3031 = _3245;
    }
    float _3247 = _3031;
    if (!_3157)
    {
        _3179 = _3217;
    }
    float _3249 = _3179;
    float _3251 = _3249;
    if (_3157)
    {
        float _3253 = _3241 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3243 = _3253;
    }
    float _3255 = _3243;
    float _3257 = _3255;
    if (_3157)
    {
        float _3259 = _3145 * _3247;
        _3169 = _3259;
    }
    float _3261 = _3169;
    if (!_3157)
    {
        _3233 = _3149;
    }
    float _3263 = _3233;
    float _3265 = _3263;
    if (_3157)
    {
        float _3267 = _3147 * _3247;
        _3237 = _3267;
    }
    float _3269 = _3237;
    if (_3157)
    {
        float _3271 = fma(_3217, _3211, _3255);
        _3251 = _3271;
    }
    float _3273 = _3251;
    if (_3157)
    {
        float _3275 = _3261 * _3261;
        _3265 = _3275;
    }
    float _3277 = _3265;
    if (!_3157)
    {
        _3257 = _3151;
    }
    float _3279 = _3257;
    float _3281 = _3279;
    if (_3157)
    {
        float _3283 = _3269 * _3269;
        _3281 = _3283;
    }
    float _3285 = _3281;
    float _3287 = fma(_3273, _3273, _3277);
    float _3289 = _3107 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3291 = _3287 + _3285;
    float _3293 = _3107 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3295 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3297 = fma(_3223, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3295);
    float _3299 = precise::clamp(_3297, 0.0, 1.0);
    float _3301 = fma(_3113, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3289);
    float _3303 = rsqrt(_3291);
    float _3305 = fma(_3113, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3293);
    float _3307 = _3107 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3309 = -_3299;
    float _3311 = _3309 + 1.0;
    float _3313 = fma(_3121, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3301);
    float _3315 = fma(_3121, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3305);
    float _3317 = fma(_3113, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3307);
    float _3319 = _3313 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3321 = _3315 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3323 = fma(_3121, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3317);
    float _3325 = abs(_3311);
    float _3327 = log2(_3325);
    float _3329 = _3321 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3331 = _3323 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3333 = _3303 * _3261;
    float _3335 = _3303 * _3273;
    float _3337 = _3331 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3339 = -_3329;
    float _3341 = fma(_3339, _3115, 1.0);
    float _3343 = _3333 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3345 = fma(_3121, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3135);
    float _3347 = fma(_3319, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3337);
    float _3349 = _3303 * _3269;
    float _3351 = -_3343;
    float _3353 = fma(_3335, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3351);
    float _3355 = _3345 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3357 = fma(_3321, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3347);
    float _3359 = _3327 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3361 = -_3349;
    float _3363 = fma(_3361, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3353);
    float _3365 = _3331 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3367 = fma(_3355, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3357);
    float _3369 = exp2(_3359);
    float _3371 = fma(_3363, -0.5, 0.5);
    float _3373 = _3331 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3375 = fma(_3319, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3365);
    float _3377 = fma(_3363, 0.5, 0.5);
    float _3379 = fma(_3319, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3373);
    float _3381 = _3335 + 1.0;
    float _3383 = log2(_3341);
    float _3385 = fma(_3321, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3375);
    float _3387 = fma(_3321, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3379);
    float _3389 = fma(_3377, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3391 = fma(_3377, _3389, -0.212114393711090087890625);
    float _3393 = 1.0 / _3367;
    float _3395 = -_3335;
    float _3397 = fma(_3369, _3381, _3395);
    float _3399 = fma(_3355, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3385);
    float _3401 = fma(_3355, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3387);
    float _3403 = fma(_3377, _3391, 1.570728778839111328125);
    float _3405 = sqrt(_3371);
    float _3407 = _3383 * 0.693147182464599609375;
    float _3409 = _3407 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3411 = _3399 * _3393;
    float _3413 = _3401 * _3393;
    float _3415 = fma(_3411, 0.5, 0.5);
    float _3417 = fma(_3413, -0.5, 0.5);
    float _3419 = fma(_3397, 0.5, 0.5);
    float _3421 = _3405 * 0.636619746685028076171875;
    float3 _8640 = float3(_3415, _3417, _3409);
    float _3423 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8640, float3(0.0), isnan(_8640)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8640, float3(0.0), isnan(_8640)), level(0.0)).x;
    float3 _8651 = float3(_3415, _3417, _3409);
    float4 _3425 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8651, float3(0.0), isnan(_8651)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8651, float3(0.0), isnan(_8651)), level(0.0)).xyzw;
    float _3427 = _3425.x;
    float _3429 = _3425.y;
    float _3431 = _3425.z;
    float _3433 = _3425.w;
    float _3435 = -_3403;
    float _3437 = fma(_3421, _3435, 1.0);
    float2 _8672 = float2(_3437, _3419);
    float3 _3441 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8672, float2(0.0), isnan(_8672)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8672, float2(0.0), isnan(_8672)), level(0.0)).xyz;
    float _3443 = _3441.x;
    float _3445 = _3441.y;
    float _3447 = _3441.z;
    float _3449 = _3327 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3451 = _3331 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_79.x = _2783;
    out.m_79.y = _2879;
    out.m_79.z = _2785;
    float _3453 = fma(_3319, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3451);
    float _3455 = exp2(_3449);
    out.m_81.x = _3113;
    out.m_81.y = _3107;
    out.m_81.z = _3121;
    float _3457 = fma(_3321, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3453);
    float _3459 = fma(_3355, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3457);
    float _3461 = _3459 + _3367;
    out.gl_Position.x = _3399;
    out.gl_Position.y = _3401;
    out.gl_Position.z = _3459;
    out.gl_Position.w = _3367;
    float _3463 = _3461 * 0.5;
    float _3465 = -_3455;
    float _3467 = _3465 + 1.0;
    float _3469 = _3467 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3471 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_83.z = _3463;
    out.m_83.w = _3367;
    float _3473 = -_3469;
    float _3475 = _3473 + 1.0;
    out.m_49.x = _3471;
    float _3477 = _3469 * _3423;
    float _3479 = _3433 * _3477;
    float _3481 = _3447 * _3477;
    float _3483 = fma(_3443, _3479, _3427);
    float _3485 = fma(_3445, _3479, _3429);
    float _3487 = _3433 * _3475;
    float _3489 = fma(_3433, _3481, _3431);
    out.m_85.x = _3483;
    out.m_85.y = _3485;
    out.m_85.z = _3489;
    out.m_85.w = _3487;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3067 = false;
    bool _2247 = false;
    bool _2063 = false;
    bool _1515 = false;
    bool _1197 = false;
    bool _1069 = false;
    bool _929 = false;
    bool _643 = false;
    bool _495 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_46.w;
    float _107 = trunc(_105);
    int _109 = int(_107);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (!_113)
    {
        out.m_49.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3546 = as_type<float>(_125);
        out.gl_Position.z = _3546;
    }
    if (!_113)
    {
        return out;
    }
    float _129 = in.m_51.w;
    float _131 = in.m_53.x;
    bool _133 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_129);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_129;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_55.x = _131;
    float _147 = 0.0;
    float _149 = 0.0;
    float _151 = _145;
    if (_141)
    {
        float _153 = float(_109);
        _119 = _153;
    }
    float _155 = _119;
    bool _157 = _145 >= _155;
    bool _159 = !_141;
    bool _161 = _157 || _159;
    float _163 = _155;
    if (_161)
    {
        _163 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _163;
    if (_161)
    {
        out.m_49.x = 0.0;
    }
    if (_161)
    {
        float _167 = _165 * 5.0;
        _127 = as_type<int>(_167);
    }
    int _169 = _127;
    float _171 = as_type<float>(_169);
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3622 = as_type<float>(_169);
        out.gl_Position.z = _3622;
    }
    if (_161)
    {
        return out;
    }
    float _173 = in.m_51.x;
    float _175 = in.m_51.y;
    float _177 = in.m_51.z;
    float _179 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _181 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _183 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _185 = _181 || _183;
    bool _187 = isnan(1.0);
    bool _189 = _185 || _187;
    float _191 = _179;
    if (!_189)
    {
        float _193 = _179 * _179;
        float _195 = _193 * 0.5;
        _171 = _195;
    }
    float _197 = _171;
    float _199 = 0.0;
    float _201 = _197;
    if (!_189)
    {
        float _203 = _145 * _145;
        float _205 = _203 * 0.5;
        _199 = _205;
    }
    float _207 = _199;
    if (!_189)
    {
        float _209 = _197 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _209;
    }
    float _211 = _201;
    bool _213 = !_189;
    float _215 = _211;
    if (!_213)
    {
        float _217 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = log2(_217);
        float _221 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _223 = _221 + 1.0;
        float _225 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = _179 * _219;
        float _229 = 1.0 / _223;
        float _231 = _225 * 0.693147182464599609375;
        float _233 = exp2(_227);
        float _235 = 1.0 / _231;
        float _237 = _233 + (-1.0);
        float _239 = -_237;
        float _241 = fma(_239, _235, _179);
        float _243 = _241 * _229;
        float _245 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _147 = _231;
        _215 = _245;
        _149 = _233;
    }
    float _247 = _147;
    float _249 = _215;
    float _251 = _149;
    bool _253 = !_189;
    float _255 = _247;
    float _257 = _251;
    if (!_253)
    {
        float _259 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = log2(_259);
        float _263 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _265 = _263 + 1.0;
        float _267 = 1.0 / _265;
        float _269 = _179 * _261;
        float _271 = exp2(_269);
        float _273 = -_271;
        float _275 = _273 + 1.0;
        float _277 = _275 * _267;
        _255 = _271;
        _257 = _265;
        _191 = _277;
    }
    float _279 = _255;
    float _281 = _257;
    float _283 = _191;
    float _285 = _281;
    float _287 = _279;
    if (!_189)
    {
        _285 = _145;
    }
    float _289 = _285;
    float _291 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _293 = _289;
    if (!_189)
    {
        float _295 = _207 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _287 = _295;
    }
    float _297 = _287;
    bool _299 = !_189;
    float _301 = _297;
    if (!_299)
    {
        float _303 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _305 = log2(_303);
        float _307 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _309 = _145 * _305;
        float _311 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _313 = _311 + 1.0;
        float _315 = 1.0 / _313;
        float _317 = _307 * 0.693147182464599609375;
        float _319 = exp2(_309);
        float _321 = 1.0 / _317;
        float _323 = _319 + (-1.0);
        float _325 = -_323;
        float _327 = fma(_325, _321, _145);
        float _329 = _327 * _315;
        float _331 = _329 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _301 = _331;
    }
    float _333 = _301;
    bool _335 = !_189;
    if (!_335)
    {
        float _337 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _339 = log2(_337);
        float _341 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _343 = _341 + 1.0;
        float _345 = 1.0 / _343;
        float _347 = _145 * _339;
        float _349 = exp2(_347);
        float _351 = -_349;
        float _353 = _351 + 1.0;
        float _355 = _353 * _345;
        _293 = _355;
    }
    float _357 = _293;
    float _359 = _333 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _361 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _363 = fma(_283, _175, _291);
    float _365 = _333 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _367 = fma(_357, _175, _359);
    float _369 = fma(_283, _173, _361);
    float _371 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _373 = _333 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _375 = fma(_357, _173, _365);
    float _377 = -_367;
    float _379 = _363 + _377;
    float _381 = fma(_283, _177, _371);
    float _383 = fma(_357, _177, _373);
    float _385 = -_375;
    float _387 = _369 + _385;
    float _389 = _379 * _379;
    float _391 = in.m_57.y;
    float _393 = -_383;
    float _395 = _381 + _393;
    float _397 = _379 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _399 = fma(_387, _387, _389);
    float _401 = in.m_59.w;
    float _403 = _379 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _405 = _379 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _407 = fma(_395, _395, _399);
    float _409 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[5].x, _397);
    float _411 = in.m_46.x;
    float _413 = in.m_46.y;
    float _415 = in.m_46.z;
    float _417 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[4].x, _403);
    float _419 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[6].x, _405);
    float _421 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[5].z, _409);
    float _423 = sqrt(_407);
    float _425 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[4].z, _417);
    float _427 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[6].z, _419);
    out.m_61.y = _391;
    bool _429 = _423 >= 9.9999999747524270787835121154785e-07;
    bool _431 = isnan(_423);
    bool _433 = _429 || _431;
    bool _435 = isnan(9.9999999747524270787835121154785e-07);
    bool _437 = _433 || _435;
    float _439 = fma(_369, _401, _411);
    float _441 = fma(_363, _401, _413);
    float _443 = fma(_381, _401, _415);
    float _445 = _395;
    float _447 = _425;
    float _449 = _427;
    float _451 = _443;
    if (_437)
    {
        _445 = _421;
    }
    float _453 = _445;
    float _455 = _453;
    if (!_437)
    {
        bool _457 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _459 = !_457;
        if (!_459)
        {
            float _461 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _463 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _465 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _467 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _461);
            float _469 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _463);
            float _471 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _465);
            float _473 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _467);
            float _475 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _469);
            float _477 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _471);
            float _479 = _473 * _473;
            float _481 = fma(_475, _475, _479);
            float _483 = fma(_477, _477, _481);
            float _485 = rsqrt(_483);
            float _487 = _485 * 9.9999999747524270787835121154785e-07;
            float _489 = _475 * _487;
            float _491 = _473 * _487;
            float _493 = _477 * _487;
            _455 = _491;
            _447 = _489;
            _449 = _493;
            _495 = true;
        }
        else
        {
            float _497 = _175 * _175;
            float _499 = fma(_173, _173, _497);
            float _501 = fma(_177, _177, _499);
            float _503 = sqrt(_501);
            bool _505 = _503 >= 9.9999999747524270787835121154785e-07;
            bool _507 = isnan(_503);
            bool _509 = _505 || _507;
            bool _511 = isnan(9.9999999747524270787835121154785e-07);
            bool _513 = _509 || _511;
            if (!_513)
            {
                float _515 = _413 * _413;
                float _517 = fma(_411, _411, _515);
                float _519 = fma(_415, _415, _517);
                float _521 = sqrt(_519);
                bool _523 = _521 >= 9.9999999747524270787835121154785e-07;
                bool _525 = isnan(_521);
                bool _527 = _523 || _525;
                bool _529 = isnan(9.9999999747524270787835121154785e-07);
                bool _531 = _527 || _529;
                if (!_531)
                {
                    float _533 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _535 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _533);
                    float _537 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _535);
                    float _539 = rsqrt(_537);
                    float _541 = _539 * 9.9999999747524270787835121154785e-07;
                    float _543 = _541 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _545 = _541 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _547 = _541 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _455 = _545;
                    _447 = _543;
                    _449 = _547;
                    _495 = true;
                }
                else
                {
                    float _549 = _413 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _551 = _413 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _553 = _413 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _555 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[5].x, _549);
                    float _557 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[4].x, _551);
                    float _559 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[6].x, _553);
                    float _561 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[5].z, _555);
                    float _563 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[4].z, _557);
                    float _565 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[6].z, _559);
                    float _567 = _561 * _561;
                    float _569 = fma(_563, _563, _567);
                    float _571 = fma(_565, _565, _569);
                    float _573 = rsqrt(_571);
                    float _575 = _573 * 9.9999999747524270787835121154785e-07;
                    float _577 = _563 * _575;
                    float _579 = _561 * _575;
                    float _581 = _565 * _575;
                    _455 = _579;
                    _447 = _577;
                    _449 = _581;
                    _495 = true;
                }
            }
            else
            {
                float _583 = _175 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _585 = _175 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _587 = _175 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _589 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[5].x, _583);
                float _591 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[4].x, _585);
                float _593 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[6].x, _587);
                float _595 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[5].z, _589);
                float _597 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[4].z, _591);
                float _599 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[6].z, _593);
                float _601 = _595 * _595;
                float _603 = fma(_597, _597, _601);
                float _605 = fma(_599, _599, _603);
                float _607 = rsqrt(_605);
                float _609 = _607 * 9.9999999747524270787835121154785e-07;
                float _611 = _597 * _609;
                float _613 = _595 * _609;
                float _615 = _599 * _609;
                _455 = _613;
                _447 = _611;
                _449 = _615;
            }
        }
    }
    _495 = false;
    float _617 = _455;
    float _619 = _447;
    float _621 = _449;
    bool _623 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _625 = !_623;
    float _641;
    if (!_625)
    {
        float _627 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _629 = _131 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _631 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _633 = _631 * _627;
        float _635 = floor(_633);
        float _637 = -_635;
        float _639 = _633 + _637;
        _641 = _639;
        _643 = true;
    }
    else
    {
        float _645 = float(_109);
        float _647 = 1.0 / _645;
        float _649 = _145 * _647;
        _641 = _649;
    }
    _643 = false;
    float _651 = _641;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _655 = _651 + _653;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _659 = _651 + _657;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _663 = _651 + _661;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _665;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _671 = _669 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _673;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _679 = _677 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _681 = 1.0 / _667;
    bool _683 = _651 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _685 = isnan(_651);
    bool _687 = _683 || _685;
    bool _689 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _691 = _687 || _689;
    float _693 = float(_691);
    bool _695 = _651 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _697 = isnan(_651);
    bool _699 = _695 || _697;
    bool _701 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _703 = _699 || _701;
    float _705 = float(_703);
    float _707 = 1.0 / _671;
    bool _709 = _651 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _711 = isnan(_651);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    float _721 = 1.0 / _675;
    float _723 = _655 * _681;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _727 = _651 + _725;
    bool _729 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _731 = 1.0 / _679;
    float _733 = _659 * _707;
    bool _735 = _651 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _737 = isnan(_651);
    bool _739 = _735 || _737;
    bool _741 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _743 = _739 || _741;
    float _745 = float(_743);
    float _747 = -_745;
    float _749 = _747 + 1.0;
    float _751 = _663 * _721;
    float _753 = _727 * _731;
    bool _755 = _651 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _757 = isnan(_651);
    bool _759 = _755 || _757;
    bool _761 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _763 = _759 || _761;
    float _765 = float(_763);
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _769 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _767;
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _773 = _771 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _775 = _765 * _749;
    float _777 = -_765;
    float _779 = _777 + 1.0;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _781;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _785;
    float _789 = fma(_769, _723, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _791 = _705 * _779;
    float _793 = fma(_783, _723, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _795 = fma(_787, _723, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _797 = -_693;
    float _799 = _797 + 1.0;
    float _801 = -_705;
    float _803 = _801 + 1.0;
    float _805 = fma(_773, _733, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _807 = _719 * _799;
    float _809 = _693 * _803;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _813 = _811 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _815 = -_719;
    float _817 = _815 + 1.0;
    float _819 = _793 * _807;
    float _821 = _795 * _807;
    float _823 = _789 * _807;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _825;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _831 = _829 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _833 = in.m_59.x;
    float _835 = in.m_59.y;
    float _837 = in.m_59.z;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _839;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _843;
    float _847 = fma(_827, _751, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _849 = fma(_813, _733, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _851 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[143].x, _819);
    float _853 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[143].y, _821);
    float _855 = fma(_831, _733, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _857 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[143].z, _823);
    float _859 = fma(_841, _751, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _861 = fma(_845, _751, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _863 = fma(_805, _809, _851);
    float _865 = fma(_849, _809, _853);
    float _867 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _869 = _867 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _873 = _871 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _877 = _875 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _879 = fma(_855, _809, _857);
    float _881 = fma(_869, _753, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _883 = fma(_873, _753, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _885 = fma(_877, _753, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _887 = fma(_859, _791, _863);
    float _889 = fma(_847, _791, _865);
    float _891 = fma(_861, _791, _879);
    float _893 = fma(_881, _775, _887);
    float _895 = fma(_883, _775, _889);
    float _897 = fma(_885, _775, _891);
    float _899 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[147].x, _893);
    float _901 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[147].y, _895);
    float _903 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[147].z, _897);
    float _905 = _899 * _833;
    float _907 = _901 * _835;
    float _909 = _903 * _837;
    bool _911 = !_729;
    float _927;
    if (!_911)
    {
        float _913 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _915 = _131 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _917 = fma(_915, (*spvDescriptorSet0.vp_c9)._m0[11].y, _145);
        float _919 = _917 * _913;
        float _921 = floor(_919);
        float _923 = -_921;
        float _925 = _919 + _923;
        _927 = _925;
        _929 = true;
    }
    else
    {
        float _931 = float(_109);
        float _933 = 1.0 / _931;
        float _935 = _145 * _933;
        _927 = _935;
    }
    _929 = false;
    float _937 = _927;
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _941 = _937 + _939;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _945 = _943 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _947 = _937 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _949 = isnan(_937);
    bool _951 = _947 || _949;
    bool _953 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _955 = _951 || _953;
    float _957 = float(_955);
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _961 = _959 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _963 = _937 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _965 = isnan(_937);
    bool _967 = _963 || _965;
    bool _969 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _971 = _967 || _969;
    float _973 = float(_971);
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _977 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _975;
    bool _979 = _937 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _981 = isnan(_937);
    bool _983 = _979 || _981;
    bool _985 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _987 = _983 || _985;
    float _989 = float(_987);
    float _991 = 1.0 / _945;
    float _993 = -_957;
    float _995 = _993 + 1.0;
    float _997 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _999 = 1.0 / _961;
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1003 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1005 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1007 = _997 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1009 = _1001 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1011 = _1005 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1013 = _977 * _991;
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1017 = _1015 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1019 = -_989;
    float _1021 = _1019 + 1.0;
    float _1023 = fma(_1013, _941, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1025 = _973 * _995;
    float _1027 = -_973;
    float _1029 = _1027 + 1.0;
    float _1031 = _957 * _1021;
    float _1033 = _1017 * _999;
    float _1035 = _1023 * _1025;
    float _1037 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1039 = _937 + _1037;
    float _1041 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1035);
    float _1043 = fma(_1033, _1039, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1045 = fma(_1043, _1031, _1041);
    float _1047 = fma(_989, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1045);
    float _1049 = _1047 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_63.x = _1007;
    out.m_63.y = _1009;
    out.m_63.z = _1011;
    out.m_63.w = _1049;
    bool _1051 = !_1003;
    float _1067;
    if (!_1051)
    {
        float _1053 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1055 = _131 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1057 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[11].w, _145);
        float _1059 = _1057 * _1053;
        float _1061 = floor(_1059);
        float _1063 = -_1061;
        float _1065 = _1059 + _1063;
        _1067 = _1065;
        _1069 = true;
    }
    else
    {
        float _1071 = float(_109);
        float _1073 = 1.0 / _1071;
        float _1075 = _145 * _1073;
        _1067 = _1075;
    }
    _1069 = false;
    float _1077 = _1067;
    float _1079 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1081 = _1077 + _1079;
    float _1083 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1085 = _1083 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1087 = _1077 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1089 = isnan(_1077);
    bool _1091 = _1087 || _1089;
    bool _1093 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1095 = _1091 || _1093;
    float _1097 = float(_1095);
    float _1099 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1101 = _1099 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1103 = _1077 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1105 = isnan(_1077);
    bool _1107 = _1103 || _1105;
    bool _1109 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1111 = _1107 || _1109;
    float _1113 = float(_1111);
    float _1115 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1117 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1115;
    bool _1119 = _1077 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1121 = isnan(_1077);
    bool _1123 = _1119 || _1121;
    bool _1125 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1127 = _1123 || _1125;
    float _1129 = float(_1127);
    float _1131 = 1.0 / _1085;
    float _1133 = -_1097;
    float _1135 = _1133 + 1.0;
    bool _1137 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1139 = 1.0 / _1101;
    float _1141 = _1117 * _1131;
    float _1143 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1145 = _1143 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1147 = -_1129;
    float _1149 = _1147 + 1.0;
    float _1151 = fma(_1141, _1081, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1153 = _1113 * _1135;
    float _1155 = -_1113;
    float _1157 = _1155 + 1.0;
    float _1159 = _1097 * _1149;
    float _1161 = _1145 * _1139;
    float _1163 = _1151 * _1153;
    float _1165 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1167 = _1077 + _1165;
    float _1169 = fma(_1157, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1163);
    float _1171 = fma(_1161, _1167, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1173 = fma(_1171, _1159, _1169);
    float _1175 = fma(_1129, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1173);
    float _1177 = _1175 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_65.w = _1177;
    bool _1179 = !_1137;
    float _1195;
    if (!_1179)
    {
        float _1181 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1183 = _131 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1185 = fma(_1183, (*spvDescriptorSet0.vp_c9)._m0[14].x, _145);
        float _1187 = _1185 * _1181;
        float _1189 = floor(_1187);
        float _1191 = -_1189;
        float _1193 = _1187 + _1191;
        _1195 = _1193;
        _1197 = true;
    }
    else
    {
        float _1199 = float(_109);
        float _1201 = 1.0 / _1199;
        float _1203 = _145 * _1201;
        _1195 = _1203;
    }
    _1197 = false;
    float _1205 = _1195;
    float _1207 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1209 = _1205 + _1207;
    bool _1211 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1213 = isnan(_1205);
    bool _1215 = _1211 || _1213;
    bool _1217 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1219 = _1215 || _1217;
    float _1221 = float(_1219);
    float _1223 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1225 = _1223 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1227 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1229 = isnan(_1205);
    bool _1231 = _1227 || _1229;
    bool _1233 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1235 = _1231 || _1233;
    float _1237 = float(_1235);
    float _1239 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1241 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1239;
    float _1243 = -_1221;
    float _1245 = _1243 + 1.0;
    bool _1247 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1249 = isnan(_1205);
    bool _1251 = _1247 || _1249;
    bool _1253 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1255 = _1251 || _1253;
    float _1257 = float(_1255);
    float _1259 = 1.0 / _1225;
    bool _1261 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1263 = isnan(_1205);
    bool _1265 = _1261 || _1263;
    bool _1267 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1269 = _1265 || _1267;
    float _1271 = float(_1269);
    float _1273 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1275 = _1273 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1277 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1279 = isnan(_1205);
    bool _1281 = _1277 || _1279;
    bool _1283 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1285 = _1281 || _1283;
    float _1287 = float(_1285);
    float _1289 = 1.0 / _1275;
    bool _1291 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1293 = _1241 * _1259;
    float _1295 = _1237 * _1245;
    float _1297 = -_1237;
    float _1299 = _1297 + 1.0;
    bool _1301 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1303 = isnan(_1205);
    bool _1305 = _1301 || _1303;
    bool _1307 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1309 = _1305 || _1307;
    float _1311 = float(_1309);
    float _1313 = fma(_1293, _1209, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1315 = _1257 * _1299;
    float _1317 = -_1257;
    float _1319 = _1317 + 1.0;
    float _1321 = -_1311;
    float _1323 = _1321 + 1.0;
    float _1325 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1327 = _1325 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1329 = _1311 * _1319;
    float _1331 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1333 = _1331 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1335 = _1271 * _1323;
    float _1337 = -_1271;
    float _1339 = _1337 + 1.0;
    bool _1341 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1343 = isnan(_1205);
    bool _1345 = _1341 || _1343;
    bool _1347 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1349 = _1345 || _1347;
    float _1351 = float(_1349);
    float _1353 = -_1287;
    float _1355 = _1353 + 1.0;
    float _1357 = 1.0 / _1327;
    float _1359 = _1287 * _1339;
    float _1361 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1363 = _1361 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1365 = _1351 * _1355;
    float _1367 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1369 = _1367 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1371 = -_1351;
    float _1373 = _1371 + 1.0;
    float _1375 = _1313 * _1365;
    float _1377 = 1.0 / _1333;
    float _1379 = _1369 * _1289;
    float _1381 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1383 = _1205 + _1381;
    float _1385 = fma(_1373, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1375);
    float _1387 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1389 = _1387 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1391 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1393 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1391;
    float _1395 = 1.0 / _1363;
    float _1397 = fma(_1379, _1383, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1399 = _1393 * _1357;
    float _1401 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1403 = _1205 + _1401;
    float _1405 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1407 = _1405 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1409 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1411 = _1409 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1413 = 1.0 / _1389;
    float _1415 = fma(_1397, _1359, _1385);
    float _1417 = _1411 * _1377;
    float _1419 = fma(_1399, _1403, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1421 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1423 = _1205 + _1421;
    float _1425 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1427 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1425;
    float _1429 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1431 = _1429 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1433 = 1.0 / _1407;
    float _1435 = fma(_1417, _1423, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1437 = _1427 * _1395;
    float _1439 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1441 = _1205 + _1439;
    float _1443 = _1431 * _1413;
    float _1445 = fma(_1419, _1335, _1415);
    float _1447 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1449 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1447;
    float _1451 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1453 = _1205 + _1451;
    bool _1455 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1457 = isnan(_1205);
    bool _1459 = _1455 || _1457;
    bool _1461 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1463 = _1459 || _1461;
    float _1465 = float(_1463);
    float _1467 = fma(_1437, _1441, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1469 = fma(_1435, _1329, _1445);
    float _1471 = fma(_1443, _1453, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1473 = _1449 * _1433;
    float _1475 = -_1465;
    float _1477 = _1475 + 1.0;
    float _1479 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1481 = _1205 + _1479;
    float _1483 = fma(_1467, _1315, _1469);
    float _1485 = _1221 * _1477;
    float _1487 = fma(_1473, _1481, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1489 = fma(_1471, _1295, _1483);
    float _1491 = fma(_1487, _1485, _1489);
    float _1493 = fma(_1465, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1491);
    float _1495 = precise::clamp(_1493, 0.0, 1.0);
    bool _1497 = !_1291;
    float _1513;
    if (!_1497)
    {
        float _1499 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _1501 = _131 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _1503 = fma(_1501, (*spvDescriptorSet0.vp_c9)._m0[14].z, _145);
        float _1505 = _1503 * _1499;
        float _1507 = floor(_1505);
        float _1509 = -_1507;
        float _1511 = _1505 + _1509;
        _1513 = _1511;
        _1515 = true;
    }
    else
    {
        float _1517 = float(_109);
        float _1519 = 1.0 / _1517;
        float _1521 = _145 * _1519;
        _1513 = _1521;
    }
    _1515 = false;
    float _1523 = _1513;
    int _1525 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _1527 = _1525;
    int _1529 = 0;
    int _1531 = _100(_1527, _1529, (*spvDescriptorSet0.support_buffer));
    float _1533 = in.m_57.z;
    float _1535 = trunc(_1533);
    int _1537 = int(_1535);
    int _1539 = _1531 + (-1);
    float _1541 = float(_1539);
    float _1543 = _1495 * _1541;
    float _1545 = trunc(_1543);
    int _1547 = int(_1545);
    int _1549 = _1547;
    int _1551 = 0;
    int _1553 = _101(_1549, _1551, (*spvDescriptorSet0.support_buffer));
    int _1555 = _1537;
    int _1557 = 0;
    int _1559 = _101(_1555, _1557, (*spvDescriptorSet0.support_buffer));
    float4 _1562 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1553, _1559)), 0).xyzw;
    float _1564 = _1562.x;
    float _1566 = _1562.y;
    float _1568 = _1562.z;
    float _1570 = _1562.w;
    float _1572 = in.m_57.x;
    float _1574 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1576 = _1574 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1578 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1580 = _1578 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    int _1582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1584 = _1582 != 0;
    float _1586 = 1.0 / _1576;
    float _1588 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1590 = _1588 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    int _1592 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1594 = _1592 != 0;
    int _1596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1598 = _1596 != 0;
    int _1600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1602 = _1600 != 0;
    float _1604 = 1.0 / _1580;
    float _1606 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1608 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1606;
    float _1610 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _1612 = _1610 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    bool _1614 = false;
    if (_1584)
    {
        bool _1616 = _131 > 0.5;
        _1614 = _1616;
    }
    bool _1618 = _1614;
    float _1620 = 1.0 / _1590;
    float _1622 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1624 = _1622 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1626 = _1608 * _1586;
    bool _1628 = _1523 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1630 = isnan(_1523);
    bool _1632 = _1628 || _1630;
    bool _1634 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1636 = _1632 || _1634;
    float _1638 = float(_1636);
    bool _1640 = _1523 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1642 = isnan(_1523);
    bool _1644 = _1640 || _1642;
    bool _1646 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1648 = _1644 || _1646;
    float _1650 = float(_1648);
    bool _1652 = _1523 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1654 = isnan(_1523);
    bool _1656 = _1652 || _1654;
    bool _1658 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _1660 = _1656 || _1658;
    float _1662 = float(_1660);
    float _1664 = 1.0 / _1624;
    float _1666 = _1612 * _1604;
    float _1668 = -_1638;
    float _1670 = _1668 + 1.0;
    float _1672 = -_1650;
    float _1674 = _1672 + 1.0;
    bool _1676 = _1523 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1678 = isnan(_1523);
    bool _1680 = _1676 || _1678;
    bool _1682 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _1684 = _1680 || _1682;
    float _1686 = float(_1684);
    float _1688 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1690 = _1688 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1692 = _1650 * _1670;
    float _1694 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1696 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _1694;
    float _1698 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _1700 = _1698 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1702 = 1.0 / _1690;
    float _1704 = _1662 * _1674;
    float _1706 = _1696 * _1620;
    float _1708 = -_1662;
    float _1710 = _1708 + 1.0;
    bool _1712 = _1523 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1714 = isnan(_1523);
    bool _1716 = _1712 || _1714;
    bool _1718 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1720 = _1716 || _1718;
    float _1722 = float(_1720);
    float _1724 = _1700 * _1664;
    float _1726 = -_1686;
    float _1728 = _1726 + 1.0;
    bool _1730 = _1523 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1732 = isnan(_1523);
    bool _1734 = _1730 || _1732;
    bool _1736 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1738 = _1734 || _1736;
    float _1740 = float(_1738);
    float _1742 = _1686 * _1710;
    float _1744 = _1722 * _1728;
    float _1746 = -_1722;
    float _1748 = _1746 + 1.0;
    bool _1750 = _1523 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _1752 = isnan(_1523);
    bool _1754 = _1750 || _1752;
    bool _1756 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _1758 = _1754 || _1756;
    float _1760 = float(_1758);
    float _1762 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1764 = _1523 + _1762;
    float _1766 = -_1740;
    float _1768 = _1766 + 1.0;
    float _1770 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1772 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _1770;
    float _1774 = fma(_1626, _1764, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _1776 = _1760 * _1768;
    float _1778 = _1772 * _1702;
    float _1780 = _1740 * _1748;
    float _1782 = _1774 * _1776;
    float _1784 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1786 = _1523 + _1784;
    float _1788 = -_1760;
    float _1790 = _1788 + 1.0;
    float _1792 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1794 = _1792 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1796 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1798 = _1796 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _1800 = fma(_1666, _1786, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _1802 = in.m_53.w;
    float _1804 = fma(_1790, (*spvDescriptorSet0.vp_c9)._m0[175].x, _1782);
    float _1806 = 1.0 / _1794;
    float _1808 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1810 = _1523 + _1808;
    float _1812 = fma(_1800, _1780, _1804);
    float _1814 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _1816 = _1814 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1818 = fma(_1706, _1810, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _1820 = in.m_53.y;
    float _1822 = 1.0 / _1798;
    float _1824 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1826 = _1523 + _1824;
    float _1828 = _1804;
    float _1830 = _1638;
    float _1832 = _1692;
    if (_1594)
    {
        float _1834 = in.m_53.z;
        _1828 = _1834;
    }
    float _1836 = _1828;
    float _1838 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1840 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _1838;
    float _1842 = fma(_1724, _1826, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _1844 = fma(_1818, _1744, _1812);
    bool _1846 = _1523 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _1848 = isnan(_1523);
    bool _1850 = _1846 || _1848;
    bool _1852 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _1854 = _1850 || _1852;
    float _1856 = float(_1854);
    float _1858 = _1816 * _1806;
    float _1860 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1862 = _1523 + _1860;
    float _1864 = fma(_1842, _1742, _1844);
    float _1866 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1868 = _1523 + _1866;
    float _1870 = -_391;
    float _1872 = _1870 + 1.0;
    float _1874 = fma(_1778, _1862, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    bool _1876 = _1802 > 0.5;
    bool _1878 = _1876 && _1598;
    float _1880 = -_1856;
    float _1882 = _1880 + 1.0;
    float _1884 = _1840 * _1822;
    float _1886 = fma(_1858, _1868, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _1888 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1890 = _1523 + _1888;
    float _1892 = fma(_1874, _1704, _1864);
    float _1894 = _1878 ? _1872 : _391;
    float _1896 = _1638 * _1882;
    float _1898 = fma(_1884, _1890, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _1900 = fma(_1886, _1692, _1892);
    bool _1902 = _1820 > 0.5;
    bool _1904 = _1902 && _1602;
    float _1906 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1908 = as_type<int>(_1900);
    int _1910 = as_type<int>(_1896);
    if (!_1584)
    {
        _1830 = _1572;
    }
    float _1912 = _1830;
    float _1914 = fma(_1898, _1896, _1900);
    float _1916 = _1904 ? _1872 : _391;
    float _1918 = _1894 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1920 = _1547 + 1;
    float _1922 = fma(_1856, (*spvDescriptorSet0.vp_c9)._m0[182].x, _1914);
    float _1924 = _1912;
    if (!_1584)
    {
        _1832 = _1912;
    }
    float _1926 = _1832;
    float _1928 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1930 = _1926;
    if (_1584)
    {
        _1924 = _1572;
    }
    float _1932 = _1924;
    int _1934 = min(_1539, _1920);
    out.m_67.x = _1922;
    bool _1936 = false;
    float _1938 = _1932;
    if (_1594)
    {
        bool _1940 = _1836 > 0.5;
        _1936 = _1940;
    }
    bool _1942 = _1936;
    if (_1584)
    {
        float _1944 = -_1932;
        float _1946 = _1944 + 1.0;
        _1908 = as_type<int>(_1946);
    }
    int _1948 = _1908;
    if (_1594)
    {
        float _1950 = -_1932;
        float _1952 = _1950 + 1.0;
        _1910 = as_type<int>(_1952);
    }
    int _1954 = _1910;
    float _1956 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_1584)
    {
        float _1958 = _1618 ? as_type<float>(_1948) : _1932;
        _1930 = _1958;
    }
    float _1960 = _1930;
    float _1962 = _1916 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_1594)
    {
        float _1964 = _1942 ? as_type<float>(_1954) : _1932;
        _1938 = _1964;
    }
    float _1966 = _1938;
    float _1968 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1970 = _1962 * _1956;
    float _1972 = _1966 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1974 = _1918 * _1906;
    float _1976 = _1972 * _1968;
    uint _1979 = as_type<uint>(half2(float2(_1570, 0.0)));
    uint _1981 = extract_bits(_1979, 0u, 8u);
    int _1983 = int(_1981) & 255;
    uint _1985 = extract_bits(_1979, 8u, 8u);
    int _1987 = int(_1985) & 255;
    int _1989 = _1987 << 8;
    int _1991 = _1983 | _1989;
    bool _1993 = _1991 >= 32768;
    int _1995 = _1991 + (-1024);
    int _1997 = _1995;
    if (_1993)
    {
        int _1999 = ~_1991;
        int _2001 = _1999 + 33792;
        int _2003 = _2001 + 1;
        _1997 = _2003;
    }
    int _2005 = _1997;
    int _2007 = _2005 + 30719;
    float _2009 = float(_2007);
    float _2011 = fma(_2009, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2013 = abs(_2011);
    float _2015 = -_2013;
    float _2017 = _2015 + 1.0;
    float _2019 = abs(_2011);
    float _2021 = fma(_2019, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _2023 = _2011 < 0.0;
    float _2025 = float(_2023);
    int _2027 = as_type<int>(_2017) + (-218103808);
    float _2029 = abs(_2011);
    float _2031 = fma(_2029, _2021, -0.212114393711090087890625);
    bool _2033 = uint(_2027) >= 1920991232u;
    float _2035 = _1960 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2037 = abs(_2011);
    float _2039 = fma(_2037, _2031, 1.570728778839111328125);
    float _2041 = _2035 * _1928;
    bool _2043 = !_2033;
    float _2061;
    if (!_2043)
    {
        int _2045 = as_type<int>(_2017);
        int _2047 = as_type<int>(_1836);
        int _2049 = 10320;
        int _2051;
        int _2053;
        int _2055;
        int _2057;
        int _2059;
        _98(_2045, _2047, _2049, _2051, _2053, _2055, _2057, _2059, out.gl_Position, out.gl_PointSize);
        _2061 = as_type<float>(_2055);
        _2063 = true;
    }
    else
    {
        float _2065 = rsqrt(_2017);
        float _2067 = _2017 * _2065;
        float _2069 = _2065 * 0.5;
        float _2071 = -_2067;
        float _2073 = 0.0 + _2071;
        float _2075 = fma(_2069, _2073, 0.5);
        float _2077 = fma(_2067, _2075, _2067);
        float _2079 = -_2077;
        float _2081 = 0.0 + _2079;
        float _2083 = fma(_2077, _2081, _2017);
        float _2085 = fma(_2069, _2083, _2077);
        _2061 = _2085;
    }
    _2063 = false;
    float _2087 = _2061;
    int _2089 = _1934;
    int _2091 = 0;
    int _2093 = _101(_2089, _2091, (*spvDescriptorSet0.support_buffer));
    int _2095 = _1537;
    int _2097 = 0;
    int _2099 = _101(_2095, _2097, (*spvDescriptorSet0.support_buffer));
    float4 _2101 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_2093, _2099)), 0).xyzw;
    float _2103 = _2101.x;
    float _2105 = _2101.y;
    float _2107 = _2101.z;
    float _2109 = _2101.w;
    float _2111 = _2039 * _2087;
    float _2113 = _2025 * 2.0;
    float _2115 = _2009 * 3.883221149444580078125;
    float _2117 = floor(_1543);
    float _2119 = -_2113;
    float _2121 = fma(_2111, _2119, _2111);
    float _2123 = _2115 * 0.15915493667125701904296875;
    float _2125 = fma(_2025, 3.1415927410125732421875, _2121);
    float _2127 = _2123 * 6.283185482025146484375;
    float _2129 = cos(_2127);
    float _2131 = _2125 * 0.15915493667125701904296875;
    float _2133 = _2131 * 6.283185482025146484375;
    float _2135 = sin(_2133);
    float _2137 = -_2117;
    float _2139 = _1543 + _2137;
    float _2141 = _2123 * 6.283185482025146484375;
    float _2143 = sin(_2141);
    float _2145 = _2135 * _2129;
    float _2147 = _2135 * _2143;
    uint _2149 = as_type<uint>(half2(float2(_2109, 0.0)));
    float _2151 = -_1564;
    float _2153 = _2151 + _2103;
    float _2155 = -_1566;
    float _2157 = _2155 + _2105;
    float _2159 = -_1568;
    float _2161 = _2159 + _2107;
    uint _2163 = extract_bits(_2149, 0u, 8u);
    int _2165 = int(_2163) & 255;
    uint _2167 = extract_bits(_2149, 8u, 8u);
    int _2169 = int(_2167) & 255;
    int _2171 = _2169 << 8;
    int _2173 = _2165 | _2171;
    float _2175 = fma(_2139, _2153, _1564);
    float _2177 = fma(_2139, _2157, _1566);
    float _2179 = fma(_2139, _2161, _1568);
    bool _2181 = _2173 >= 32768;
    int _2183 = _2173 + (-1024);
    int _2185 = _2183;
    if (_2181)
    {
        int _2187 = ~_2173;
        int _2189 = _2187 + 33792;
        int _2191 = _2189 + 1;
        _2185 = _2191;
    }
    int _2193 = _2185;
    int _2195 = _2193 + 30719;
    float _2197 = float(_2195);
    float _2199 = fma(_2197, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2201 = abs(_2199);
    float _2203 = -_2201;
    float _2205 = _2203 + 1.0;
    float _2207 = abs(_2199);
    float _2209 = fma(_2207, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _2211 = _2199 < 0.0;
    float _2213 = float(_2211);
    int _2215 = as_type<int>(_2205) + (-218103808);
    float _2217 = abs(_2199);
    float _2219 = fma(_2217, _2209, -0.212114393711090087890625);
    bool _2221 = uint(_2215) >= 1920991232u;
    float _2223 = abs(_2199);
    float _2225 = fma(_2223, _2219, 1.570728778839111328125);
    bool _2227 = !_2221;
    float _2245;
    if (!_2227)
    {
        int _2229 = as_type<int>(_2205);
        int _2231 = as_type<int>(_2131);
        int _2233 = 11216;
        int _2235;
        int _2237;
        int _2239;
        int _2241;
        int _2243;
        _98(_2229, _2231, _2233, _2235, _2237, _2239, _2241, _2243, out.gl_Position, out.gl_PointSize);
        _2245 = as_type<float>(_2239);
        _2247 = true;
    }
    else
    {
        float _2249 = rsqrt(_2205);
        float _2251 = _2205 * _2249;
        float _2253 = _2249 * 0.5;
        float _2255 = -_2251;
        float _2257 = 0.0 + _2255;
        float _2259 = fma(_2253, _2257, 0.5);
        float _2261 = fma(_2251, _2259, _2251);
        float _2263 = -_2261;
        float _2265 = 0.0 + _2263;
        float _2267 = fma(_2261, _2265, _2205);
        float _2269 = fma(_2253, _2267, _2261);
        _2245 = _2269;
    }
    _2247 = false;
    float _2271 = _2245;
    float _2273 = in.m_53.x;
    float _2275 = in.m_53.y;
    float _2277 = in.m_53.z;
    float _2279 = _617 * _617;
    float _2281 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2283 = log2(_2281);
    float _2285 = _2225 * _2271;
    float _2287 = fma(_619, _619, _2279);
    float _2289 = _2197 * 3.883221149444580078125;
    int _2291 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2293 = _2291 != 0;
    int _2295 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2297 = _2295 != 0;
    int _2299 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2301 = _2299 != 0;
    float _2303 = -_2011;
    float _2305 = _2303 + _2199;
    float _2307 = fma(_621, _621, _2287);
    float _2309 = _2289 * 0.15915493667125701904296875;
    float _2311 = _441 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2313 = rsqrt(_2307);
    float _2315 = _2283 * _145;
    float _2317 = _2277 * 2.0;
    float _2319 = _2273 * 2.0;
    float _2321 = _2275 * 2.0;
    float _2323 = floor(_2319);
    float _2325 = floor(_2317);
    float _2327 = _2273 + _2277;
    float _2329 = _2327 + (-1.0);
    float _2331 = floor(_2321);
    bool _2333 = _2323 >= 0.0;
    bool _2335 = isnan(_2323);
    bool _2337 = _2333 || _2335;
    bool _2339 = isnan(0.0);
    bool _2341 = _2337 || _2339;
    bool _2343 = _2325 > 0.0;
    float _2345 = fma(_2329, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _2347 = _2325 >= 0.0;
    bool _2349 = isnan(_2325);
    bool _2351 = _2347 || _2349;
    bool _2353 = isnan(0.0);
    bool _2355 = _2351 || _2353;
    float _2357 = _2275 + _2273;
    float _2359 = exp2(_2315);
    float _2361 = _2313 * _617;
    int _2363 = _2355 ? 0 : 1;
    float _2365 = _2357 + (-1.0);
    bool _2367 = _2323 > 0.0;
    int _2369 = ~_2363;
    int _2371 = _2369 + 1;
    int _2373 = _2371 + 1;
    float _2375 = fma(_2365, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2377 = _2313 * _621;
    int _2379 = _2373;
    if (!_2343)
    {
        int _2381 = ~_2363;
        int _2383 = _2381 + 1;
        _2379 = _2383;
    }
    int _2385 = _2379;
    bool _2387 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2389 = isnan(1.0);
    bool _2391 = _2387 || _2389;
    bool _2393 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2395 = _2391 || _2393;
    float _2397 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2399 = 1.0 + _2397;
    float _2401 = _2313 * _619;
    bool _2403 = !_2293;
    int _2405 = _2403 ? 0 : 1;
    float _2407 = in.m_69.x;
    float _2409 = in.m_69.y;
    float _2411 = in.m_69.z;
    float _2413 = 1.0 / _2399;
    bool _2415 = _2331 > 0.0;
    float _2417 = -_2359;
    float _2419 = _2417 + 1.0;
    bool _2421 = _2331 >= 0.0;
    bool _2423 = isnan(_2331);
    bool _2425 = _2421 || _2423;
    bool _2427 = isnan(0.0);
    bool _2429 = _2425 || _2427;
    float _2431 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2433 = _2377 * _2431;
    int _2435 = _2341 ? 0 : 1;
    int _2437 = abs(_2405);
    bool _2439 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2441 = isnan(0.0);
    bool _2443 = _2439 || _2441;
    bool _2445 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2447 = _2443 || _2445;
    float _2449 = float(_2437);
    float _2451 = _2447 ? _2419 : 0.0;
    float _2453 = float(_2385);
    bool _2455 = !_2301;
    int _2457 = _2455 ? 0 : 1;
    if (_2395)
    {
        float _2459 = _2451 * _2413;
        _151 = _2459;
    }
    float _2461 = _151;
    int _2463 = _2429 ? 0 : 1;
    float _2465 = _2449 * _2453;
    int _2467 = abs(_2457);
    float _2469 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2471 = _2361 * _2469;
    int _2473 = ~_2435;
    int _2475 = _2473 + 1;
    int _2477 = _2475 + 1;
    float _2479 = _2465 * (-2.0);
    int _2481 = ~_2463;
    int _2483 = _2481 + 1;
    int _2485 = _2483 + 1;
    float _2487 = _2273 + (-0.5);
    int _2489 = _2477;
    int _2491 = _2485;
    if (!_2367)
    {
        int _2493 = ~_2435;
        int _2495 = _2493 + 1;
        _2489 = _2495;
    }
    int _2497 = _2489;
    float _2499 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2501 = -_2471;
    float _2503 = fma(_2377, _2499, _2501);
    if (!_2415)
    {
        int _2505 = ~_2463;
        int _2507 = _2505 + 1;
        _2491 = _2507;
    }
    int _2509 = _2491;
    float _2511 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2513 = _2401 * _2511;
    float _2515 = float(_2467);
    float _2517 = fma(_2479, _2407, _2407);
    float _2519 = float(_2509);
    float _2521 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2523 = -_2433;
    float _2525 = fma(_2401, _2521, _2523);
    float _2527 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2529 = -_2513;
    float _2531 = fma(_2361, _2527, _2529);
    float _2533 = fma(_2375, _2479, _2375);
    float _2535 = fma(_2487, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2517);
    bool _2537 = !_2297;
    int _2539 = _2537 ? 0 : 1;
    float _2541 = _2515 * _2519;
    float _2543 = float(_2497);
    float _2545 = fma(_2533, _2461, _2535);
    int _2547 = abs(_2539);
    float _2549 = _2541 * (-2.0);
    float _2551 = _2277 + (-0.5);
    float _2553 = _2545 * 0.15915493667125701904296875;
    float _2555 = float(_2547);
    float _2557 = fma(_2549, _2411, _2411);
    float _2559 = _2525 * _2525;
    float _2561 = fma(_2345, _2549, _2345);
    float _2563 = _2553 * 6.283185482025146484375;
    float _2565 = sin(_2563);
    float _2567 = fma(_2551, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2557);
    float _2569 = _2555 * _2543;
    float _2571 = _2275 + _2277;
    float _2573 = _2275 + (-0.5);
    float _2575 = _2569 * (-2.0);
    float _2577 = _2571 + (-1.0);
    float _2579 = fma(_2503, _2503, _2559);
    float _2581 = fma(_2561, _2461, _2567);
    float _2583 = fma(_2575, _2409, _2409);
    float _2585 = fma(_2577, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2587 = fma(_2531, _2531, _2579);
    float _2589 = _2581 * 0.15915493667125701904296875;
    float _2591 = fma(_2573, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2583);
    float _2593 = fma(_2585, _2575, _2585);
    float _2595 = _2553 * 6.283185482025146484375;
    float _2597 = cos(_2595);
    bool _2599 = _2177 != 0.0;
    bool _2601 = isnan(_2177);
    bool _2603 = _2599 || _2601;
    bool _2605 = isnan(0.0);
    bool _2607 = _2603 || _2605;
    float _2609 = fma(_2593, _2461, _2591);
    float _2611 = _2213 * 2.0;
    bool _2613 = _2175 == 0.0;
    bool _2615 = !_2607;
    bool _2617 = _2613 && _2615;
    float _2619 = rsqrt(_2587);
    float _2621 = _2609 * 0.15915493667125701904296875;
    float _2623 = _905 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2625 = _907 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2627 = _909 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2629 = -_2611;
    float _2631 = fma(_2285, _2629, _2285);
    float _2633 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2179);
    float _2635 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2175);
    float _2637 = _2589 * 6.283185482025146484375;
    float _2639 = sin(_2637);
    float _2641 = fma(_2213, 3.1415927410125732421875, _2631);
    float _2643 = _2627 * _2633;
    float _2645 = _2623 * _2635;
    bool _2647 = _2179 == 0.0;
    bool _2649 = _2647 && _2617;
    float _2651 = _2641 * 0.15915493667125701904296875;
    float _2653 = _2589 * 6.283185482025146484375;
    float _2655 = cos(_2653);
    float _2657 = _2525 * _2619;
    float _2659 = _2531 * _2619;
    float _2661 = _2503 * _2619;
    float _2663 = _2401 * _2657;
    float _2665 = _2621 * 6.283185482025146484375;
    float _2667 = sin(_2665);
    float _2669 = _2565 * _2639;
    float _2671 = _2597 * _2639;
    float _2673 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2177);
    float _2675 = -_2663;
    float _2677 = fma(_2361, _2661, _2675);
    float _2679 = _2625 * _2673;
    float _2681 = _2621 * 6.283185482025146484375;
    float _2683 = cos(_2681);
    float _2685 = _2597 * _2655;
    float _2687 = _2565 * _2655;
    float _2689 = fma(_2667, _2669, _2685);
    float _2691 = -_2671;
    float _2693 = fma(_2667, _2687, _2691);
    float _2695 = -_2687;
    float _2697 = fma(_2667, _2671, _2695);
    float _2699 = fma(_2667, _2685, _2669);
    float _2701 = _2689 * _2401;
    float _2703 = _2361 * _2659;
    float _2705 = _441 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2707 = _2309 * 6.283185482025146484375;
    float _2709 = sin(_2707);
    float _2711 = _2683 * _2639;
    float _2713 = _2683 * _2655;
    float _2715 = _2697 * _2401;
    float _2717 = fma(_2693, _2661, _2701);
    float _2719 = _2711 * _2401;
    float _2721 = _2565 * _2683;
    float _2723 = -_2703;
    float _2725 = fma(_2377, _2657, _2723);
    float _2727 = _2689 * _2377;
    float _2729 = _2597 * _2683;
    float _2731 = fma(_2699, _2661, _2715);
    float _2733 = fma(_2713, _2661, _2719);
    float _2735 = _2697 * _2377;
    float _2737 = _2711 * _2377;
    float _2739 = fma(_2693, _2659, _2727);
    float _2741 = fma(_2721, _2725, _2717);
    float _2743 = fma(_2729, _2725, _2731);
    float _2745 = fma(_2699, _2659, _2735);
    float _2747 = -_2667;
    float _2749 = fma(_2747, _2725, _2733);
    float _2751 = fma(_2713, _2659, _2737);
    float _2753 = _441 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2755 = fma(_2721, _2677, _2739);
    float _2757 = fma(_2729, _2677, _2745);
    float _2759 = -_2667;
    float _2761 = fma(_2759, _2677, _2751);
    float _2763 = fma(_439, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2705);
    float _2765 = fma(_439, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2753);
    float _2767 = _2679 * _2741;
    float _2769 = _2679 * _2755;
    float _2771 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2763);
    float _2773 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2765);
    float _2775 = fma(_2645, _2749, _2767);
    float _2777 = fma(_2645, _2761, _2769);
    float _2779 = _2651 * 6.283185482025146484375;
    float _2781 = sin(_2779);
    float _2783 = _2771 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2785 = _2773 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2787 = fma(_2643, _2743, _2775);
    float _2789 = fma(_2643, _2757, _2777);
    float _2791 = _2689 * _2361;
    float _2793 = _2711 * _2361;
    float _2795 = _2783 + _2787;
    float _2797 = _2785 + _2789;
    float _2799 = _2697 * _2361;
    float _2801 = fma(_2713, _2657, _2793);
    float _2803 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2805 = _2795 + _2803;
    float _2807 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2809 = _2797 + _2807;
    float _2811 = _2309 * 6.283185482025146484375;
    float _2813 = cos(_2811);
    float _2815 = fma(_2699, _2657, _2799);
    float _2817 = _2805 * _2805;
    float _2819 = _2809 * _2809;
    float _2821 = -_2147;
    float _2823 = fma(_2781, _2709, _2821);
    float _2825 = fma(_2139, _2305, _2011);
    float _2827 = fma(_439, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2311);
    float _2829 = _2817 + _2819;
    float _2831 = fma(_2139, _2823, _2147);
    float _2833 = _2377 * _2661;
    float _2835 = fma(_2177, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2825);
    float _2837 = sqrt(_2829);
    float _2839 = -_2833;
    float _2841 = fma(_2401, _2659, _2839);
    float _2843 = fma(_2693, _2657, _2791);
    float _2845 = fma(_2179, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2831);
    float _2847 = _2649 ? _2825 : _2835;
    float _2849 = -_2667;
    float _2851 = fma(_2849, _2841, _2801);
    float _2853 = fma(_2721, _2841, _2843);
    float _2855 = -_2145;
    float _2857 = fma(_2781, _2813, _2855);
    float _2859 = _2649 ? _2831 : _2845;
    float _2861 = _2847 * _2847;
    float _2863 = _2679 * _2853;
    float _2865 = fma(_2729, _2841, _2815);
    float _2867 = fma(_2139, _2857, _2145);
    float _2869 = fma(_2859, _2859, _2861);
    float _2871 = fma(_2645, _2851, _2863);
    float _2873 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2827);
    bool _2875 = _2837 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2877 = fma(_2643, _2865, _2871);
    float _2879 = _2873 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2881 = rsqrt(_2869);
    float _2883 = _2879 + _2877;
    float _2885 = _2817;
    float _2887 = _2819;
    float _2889 = _2795;
    float _2891 = _2797;
    float _2893 = _2825;
    float _2895 = _2867;
    float _2897 = _2831;
    if (!_2875)
    {
        _451 = _2883;
    }
    float _2899 = _451;
    bool _2901 = !_2875;
    float _2903 = _2899;
    if (!_2901)
    {
        float _2905 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2907 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2909 = _2837 + _2907;
        float _2911 = _2883 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2913 = rsqrt(_2829);
        float _2915 = _2909 * _2905;
        float _2917 = _2915 * 0.15915493667125701904296875;
        float _2919 = _2917 * 6.283185482025146484375;
        float _2921 = sin(_2919);
        float _2923 = _2917 * 6.283185482025146484375;
        float _2925 = cos(_2923);
        float _2927 = fma(_2921, _2911, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2929 = _2913 * _2927;
        float _2931 = _2925 + (-1.0);
        float _2933 = _2805 * _2929;
        float _2935 = _2809 * _2929;
        float _2937 = _2931 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2939 = _2933 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2941 = _2933 * _2933;
        float _2943 = _2935 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2945 = fma(_2883, _2925, _2937);
        float _2947 = _2935 * _2935;
        _2903 = _2945;
        _2885 = _2941;
        _2887 = _2947;
        _2889 = _2939;
        _2891 = _2943;
    }
    float _2949 = _2903;
    float _2951 = _2885;
    float _2953 = _2887;
    float _2955 = _2889;
    float _2957 = _2891;
    float _2959 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2961 = _2949 + _2959;
    if (!_2649)
    {
        _2893 = _2835;
    }
    float _2963 = _2893;
    float _2965 = _2859 * _2881;
    float _2967 = _2847 * _2881;
    float _2969 = fma(_2961, _2961, _2951);
    if (!_2649)
    {
        float _2971 = fma(_2175, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2867);
        _2895 = _2971;
    }
    float _2973 = _2895;
    float _2975 = _2741 * _2963;
    float _2977 = _2853 * _2963;
    float _2979 = _2969 + _2953;
    float _2981 = _2755 * _2963;
    float _2983 = _2975;
    if (!_2649)
    {
        _2897 = _2845;
    }
    float _2985 = _2897;
    float _2987 = -_2967;
    float _2989 = _2743 * _2987;
    float _2991 = -_2967;
    float _2993 = _2865 * _2991;
    float _2995 = -_2967;
    float _2997 = _2757 * _2995;
    float _2999 = sqrt(_2979);
    float _3001 = fma(_2749, _2973, _2975);
    float _3003 = fma(_2851, _2973, _2977);
    float _3005 = fma(_2761, _2973, _2981);
    float _3007 = fma(_2853, _2965, _2993);
    float _3009 = fma(_2741, _2965, _2989);
    float _3011 = fma(_2755, _2965, _2997);
    float _3013 = fma(_2743, _2985, _3001);
    float _3015 = fma(_2865, _2985, _3003);
    float _3017 = fma(_2757, _2985, _3005);
    out.m_71.x = _2041;
    out.m_71.y = _1970;
    out.m_71.z = _1976;
    out.m_71.w = _1974;
    out.m_73.x = _2749;
    out.m_73.y = _2851;
    out.m_73.z = _2761;
    bool _3019 = _2999 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3021 = isnan(_2999);
    bool _3023 = _3019 || _3021;
    bool _3025 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3027 = _3023 || _3025;
    out.m_75.x = _3009;
    out.m_75.y = _3007;
    out.m_75.z = _3011;
    out.m_77.x = _3013;
    out.m_77.y = _3015;
    out.m_77.z = _3017;
    float _3029 = _3009;
    float _3031 = _3017;
    if (!_3027)
    {
        _2983 = 1.0;
    }
    float _3033 = _2983;
    bool _3035 = !_3027;
    float _3037 = _3033;
    if (!_3035)
    {
        bool _3039 = _2999 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3041 = isnan(_2999);
        bool _3043 = _3039 || _3041;
        bool _3045 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3047 = _3043 || _3045;
        if (!_3047)
        {
            float _3049 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3051 = _2999 + _3049;
            float _3053 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3055 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3053;
            float _3057 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3059 = _3057 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3061 = 1.0 / _3055;
            float _3063 = _3051 * _3061;
            float _3065 = fma(_3063, _3059, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3037 = _3065;
            _3067 = true;
        }
        else
        {
            bool _3069 = _2999 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3071 = isnan(_2999);
            bool _3073 = _3069 || _3071;
            bool _3075 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3077 = _3073 || _3075;
            if (!_3077)
            {
                float _3079 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3081 = _2999 + _3079;
                float _3083 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3085 = _3083 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3087 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3089 = _3087 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3091 = 1.0 / _3085;
                float _3093 = _3081 * _3091;
                float _3095 = fma(_3093, _3089, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3037 = _3095;
                _3067 = true;
            }
            else
            {
                _3037 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3067 = false;
    float _3097 = _3037;
    float _3099 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3101 = _2949 + _3099;
    float _3103 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3105 = _2955 + _3103;
    float _3107 = fma(_3101, _3097, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3109 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3111 = _2957 + _3109;
    float _3113 = fma(_3105, _3097, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3115 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3117 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3119 = _3107 + _3117;
    float _3121 = fma(_3111, _3097, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3123 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3125 = _3113 + _3123;
    float _3127 = _3107 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3129 = _3119 * _3119;
    float _3131 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3133 = _3121 + _3131;
    float _3135 = fma(_3113, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3127);
    float _3137 = fma(_3125, _3125, _3129);
    float _3139 = fma(_3133, _3133, _3137);
    float _3141 = rsqrt(_3139);
    float _3143 = _3141 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3145 = _3125 * _3143;
    float _3147 = _3133 * _3143;
    float _3149 = _3145 * _3145;
    float _3151 = _3147 * _3147;
    float _3153 = _3149 + _3151;
    float _3155 = sqrt(_3153);
    bool _3157 = _3155 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3159 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3161 = _3155 + _3159;
    float _3163 = _3133;
    float _3165 = _3097;
    float _3167 = _3161;
    float _3169 = _3145;
    if (_3157)
    {
        float _3171 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3163 = _3171;
    }
    float _3173 = _3163;
    if (_3157)
    {
        float _3175 = rsqrt(_3153);
        _3165 = _3175;
    }
    float _3177 = _3165;
    float _3179 = _3177;
    if (_3157)
    {
        float _3181 = _3161 * _3173;
        _3167 = _3181;
    }
    float _3183 = _3167;
    if (_3157)
    {
        float _3185 = _3183 * 0.15915493667125701904296875;
        _3029 = _3185;
    }
    float _3187 = _3029;
    float _3189 = _3141;
    if (_3157)
    {
        float _3191 = _3187 * 6.283185482025146484375;
        float _3193 = sin(_3191);
        _3189 = _3193;
    }
    float _3195 = _3189;
    float _3197 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3199 = precise::max(0.0, _3197);
    float _3201 = _3129;
    float _3203 = _3199;
    float _3205 = _3197;
    if (_3157)
    {
        float _3207 = _3187 * 6.283185482025146484375;
        float _3209 = cos(_3207);
        _3201 = _3209;
    }
    float _3211 = _3201;
    float _3213 = -_3143;
    float _3215 = -_3199;
    float _3217 = fma(_3119, _3213, _3215);
    if (_3157)
    {
        float _3219 = _3217 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3203 = _3219;
    }
    float _3221 = _3203;
    float _3223 = sqrt(_3139);
    float _3225 = _3221;
    float _3227 = _3195;
    if (_3157)
    {
        float _3229 = fma(_3195, _3221, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3225 = _3229;
    }
    float _3231 = _3225;
    float _3233 = _3231;
    if (!_3157)
    {
        _3227 = _3147;
    }
    float _3235 = _3227;
    float _3237 = _3235;
    if (_3157)
    {
        float _3239 = _3211 + (-1.0);
        _3205 = _3239;
    }
    float _3241 = _3205;
    float _3243 = _3241;
    if (_3157)
    {
        float _3245 = _3177 * _3231;
        _3031 = _3245;
    }
    float _3247 = _3031;
    if (!_3157)
    {
        _3179 = _3217;
    }
    float _3249 = _3179;
    float _3251 = _3249;
    if (_3157)
    {
        float _3253 = _3241 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3243 = _3253;
    }
    float _3255 = _3243;
    float _3257 = _3255;
    if (_3157)
    {
        float _3259 = _3145 * _3247;
        _3169 = _3259;
    }
    float _3261 = _3169;
    if (!_3157)
    {
        _3233 = _3149;
    }
    float _3263 = _3233;
    float _3265 = _3263;
    if (_3157)
    {
        float _3267 = _3147 * _3247;
        _3237 = _3267;
    }
    float _3269 = _3237;
    if (_3157)
    {
        float _3271 = fma(_3217, _3211, _3255);
        _3251 = _3271;
    }
    float _3273 = _3251;
    if (_3157)
    {
        float _3275 = _3261 * _3261;
        _3265 = _3275;
    }
    float _3277 = _3265;
    if (!_3157)
    {
        _3257 = _3151;
    }
    float _3279 = _3257;
    float _3281 = _3279;
    if (_3157)
    {
        float _3283 = _3269 * _3269;
        _3281 = _3283;
    }
    float _3285 = _3281;
    float _3287 = fma(_3273, _3273, _3277);
    float _3289 = _3107 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3291 = _3287 + _3285;
    float _3293 = _3107 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3295 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3297 = fma(_3223, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3295);
    float _3299 = precise::clamp(_3297, 0.0, 1.0);
    float _3301 = fma(_3113, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3289);
    float _3303 = rsqrt(_3291);
    float _3305 = fma(_3113, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3293);
    float _3307 = _3107 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3309 = -_3299;
    float _3311 = _3309 + 1.0;
    float _3313 = fma(_3121, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3301);
    float _3315 = fma(_3121, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3305);
    float _3317 = fma(_3113, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3307);
    float _3319 = _3313 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3321 = _3315 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3323 = fma(_3121, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3317);
    float _3325 = abs(_3311);
    float _3327 = log2(_3325);
    float _3329 = _3321 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3331 = _3323 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3333 = _3303 * _3261;
    float _3335 = _3303 * _3273;
    float _3337 = _3331 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3339 = -_3329;
    float _3341 = fma(_3339, _3115, 1.0);
    float _3343 = _3333 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3345 = fma(_3121, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3135);
    float _3347 = fma(_3319, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3337);
    float _3349 = _3303 * _3269;
    float _3351 = -_3343;
    float _3353 = fma(_3335, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3351);
    float _3355 = _3345 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3357 = fma(_3321, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3347);
    float _3359 = _3327 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3361 = -_3349;
    float _3363 = fma(_3361, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3353);
    float _3365 = _3331 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3367 = fma(_3355, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3357);
    float _3369 = exp2(_3359);
    float _3371 = fma(_3363, -0.5, 0.5);
    float _3373 = _3331 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3375 = fma(_3319, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3365);
    float _3377 = fma(_3363, 0.5, 0.5);
    float _3379 = fma(_3319, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3373);
    float _3381 = _3335 + 1.0;
    float _3383 = log2(_3341);
    float _3385 = fma(_3321, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3375);
    float _3387 = fma(_3321, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3379);
    float _3389 = fma(_3377, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3391 = fma(_3377, _3389, -0.212114393711090087890625);
    float _3393 = 1.0 / _3367;
    float _3395 = -_3335;
    float _3397 = fma(_3369, _3381, _3395);
    float _3399 = fma(_3355, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3385);
    float _3401 = fma(_3355, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3387);
    float _3403 = fma(_3377, _3391, 1.570728778839111328125);
    float _3405 = sqrt(_3371);
    float _3407 = _3383 * 0.693147182464599609375;
    float _3409 = _3407 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3411 = _3399 * _3393;
    float _3413 = _3401 * _3393;
    float _3415 = fma(_3411, 0.5, 0.5);
    float _3417 = fma(_3413, -0.5, 0.5);
    float _3419 = fma(_3397, 0.5, 0.5);
    float _3421 = _3405 * 0.636619746685028076171875;
    float3 _8640 = float3(_3415, _3417, _3409);
    float _3423 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8640, float3(0.0), isnan(_8640)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8640, float3(0.0), isnan(_8640)), level(0.0)).x;
    float3 _8651 = float3(_3415, _3417, _3409);
    float4 _3425 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8651, float3(0.0), isnan(_8651)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8651, float3(0.0), isnan(_8651)), level(0.0)).xyzw;
    float _3427 = _3425.x;
    float _3429 = _3425.y;
    float _3431 = _3425.z;
    float _3433 = _3425.w;
    float _3435 = -_3403;
    float _3437 = fma(_3421, _3435, 1.0);
    float2 _8672 = float2(_3437, _3419);
    float3 _3441 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8672, float2(0.0), isnan(_8672)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8672, float2(0.0), isnan(_8672)), level(0.0)).xyz;
    float _3443 = _3441.x;
    float _3445 = _3441.y;
    float _3447 = _3441.z;
    float _3449 = _3327 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3451 = _3331 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_79.x = _2783;
    out.m_79.y = _2879;
    out.m_79.z = _2785;
    float _3453 = fma(_3319, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3451);
    float _3455 = exp2(_3449);
    out.m_81.x = _3113;
    out.m_81.y = _3107;
    out.m_81.z = _3121;
    float _3457 = fma(_3321, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3453);
    float _3459 = fma(_3355, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3457);
    float _3461 = _3459 + _3367;
    out.gl_Position.x = _3399;
    out.gl_Position.y = _3401;
    out.gl_Position.z = _3459;
    out.gl_Position.w = _3367;
    float _3463 = _3461 * 0.5;
    float _3465 = -_3455;
    float _3467 = _3465 + 1.0;
    float _3469 = _3467 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3471 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_83.z = _3463;
    out.m_83.w = _3367;
    float _3473 = -_3469;
    float _3475 = _3473 + 1.0;
    out.m_49.x = _3471;
    float _3477 = _3469 * _3423;
    float _3479 = _3433 * _3477;
    float _3481 = _3447 * _3477;
    float _3483 = fma(_3443, _3479, _3427);
    float _3485 = fma(_3445, _3479, _3429);
    float _3487 = _3433 * _3475;
    float _3489 = fma(_3433, _3481, _3431);
    out.m_85.x = _3483;
    out.m_85.y = _3485;
    out.m_85.z = _3489;
    out.m_85.w = _3487;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3067 = false;
    bool _2247 = false;
    bool _2063 = false;
    bool _1515 = false;
    bool _1197 = false;
    bool _1069 = false;
    bool _929 = false;
    bool _643 = false;
    bool _495 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_46.w;
    float _107 = trunc(_105);
    int _109 = int(_107);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (!_113)
    {
        out.m_49.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3546 = as_type<float>(_125);
        out.gl_Position.z = _3546;
    }
    if (!_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _129 = in.m_51.w;
    float _131 = in.m_53.x;
    bool _133 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_129);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_129;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_55.x = _131;
    float _147 = 0.0;
    float _149 = 0.0;
    float _151 = _145;
    if (_141)
    {
        float _153 = float(_109);
        _119 = _153;
    }
    float _155 = _119;
    bool _157 = _145 >= _155;
    bool _159 = !_141;
    bool _161 = _157 || _159;
    float _163 = _155;
    if (_161)
    {
        _163 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _163;
    if (_161)
    {
        out.m_49.x = 0.0;
    }
    if (_161)
    {
        float _167 = _165 * 5.0;
        _127 = as_type<int>(_167);
    }
    int _169 = _127;
    float _171 = as_type<float>(_169);
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3622 = as_type<float>(_169);
        out.gl_Position.z = _3622;
    }
    if (_161)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _173 = in.m_51.x;
    float _175 = in.m_51.y;
    float _177 = in.m_51.z;
    float _179 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _181 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _183 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _185 = _181 || _183;
    bool _187 = isnan(1.0);
    bool _189 = _185 || _187;
    float _191 = _179;
    if (!_189)
    {
        float _193 = _179 * _179;
        float _195 = _193 * 0.5;
        _171 = _195;
    }
    float _197 = _171;
    float _199 = 0.0;
    float _201 = _197;
    if (!_189)
    {
        float _203 = _145 * _145;
        float _205 = _203 * 0.5;
        _199 = _205;
    }
    float _207 = _199;
    if (!_189)
    {
        float _209 = _197 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _209;
    }
    float _211 = _201;
    bool _213 = !_189;
    float _215 = _211;
    if (!_213)
    {
        float _217 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = log2(_217);
        float _221 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _223 = _221 + 1.0;
        float _225 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = _179 * _219;
        float _229 = 1.0 / _223;
        float _231 = _225 * 0.693147182464599609375;
        float _233 = exp2(_227);
        float _235 = 1.0 / _231;
        float _237 = _233 + (-1.0);
        float _239 = -_237;
        float _241 = fma(_239, _235, _179);
        float _243 = _241 * _229;
        float _245 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _147 = _231;
        _215 = _245;
        _149 = _233;
    }
    float _247 = _147;
    float _249 = _215;
    float _251 = _149;
    bool _253 = !_189;
    float _255 = _247;
    float _257 = _251;
    if (!_253)
    {
        float _259 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = log2(_259);
        float _263 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _265 = _263 + 1.0;
        float _267 = 1.0 / _265;
        float _269 = _179 * _261;
        float _271 = exp2(_269);
        float _273 = -_271;
        float _275 = _273 + 1.0;
        float _277 = _275 * _267;
        _255 = _271;
        _257 = _265;
        _191 = _277;
    }
    float _279 = _255;
    float _281 = _257;
    float _283 = _191;
    float _285 = _281;
    float _287 = _279;
    if (!_189)
    {
        _285 = _145;
    }
    float _289 = _285;
    float _291 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _293 = _289;
    if (!_189)
    {
        float _295 = _207 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _287 = _295;
    }
    float _297 = _287;
    bool _299 = !_189;
    float _301 = _297;
    if (!_299)
    {
        float _303 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _305 = log2(_303);
        float _307 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _309 = _145 * _305;
        float _311 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _313 = _311 + 1.0;
        float _315 = 1.0 / _313;
        float _317 = _307 * 0.693147182464599609375;
        float _319 = exp2(_309);
        float _321 = 1.0 / _317;
        float _323 = _319 + (-1.0);
        float _325 = -_323;
        float _327 = fma(_325, _321, _145);
        float _329 = _327 * _315;
        float _331 = _329 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _301 = _331;
    }
    float _333 = _301;
    bool _335 = !_189;
    if (!_335)
    {
        float _337 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _339 = log2(_337);
        float _341 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _343 = _341 + 1.0;
        float _345 = 1.0 / _343;
        float _347 = _145 * _339;
        float _349 = exp2(_347);
        float _351 = -_349;
        float _353 = _351 + 1.0;
        float _355 = _353 * _345;
        _293 = _355;
    }
    float _357 = _293;
    float _359 = _333 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _361 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _363 = fma(_283, _175, _291);
    float _365 = _333 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _367 = fma(_357, _175, _359);
    float _369 = fma(_283, _173, _361);
    float _371 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _373 = _333 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _375 = fma(_357, _173, _365);
    float _377 = -_367;
    float _379 = _363 + _377;
    float _381 = fma(_283, _177, _371);
    float _383 = fma(_357, _177, _373);
    float _385 = -_375;
    float _387 = _369 + _385;
    float _389 = _379 * _379;
    float _391 = in.m_57.y;
    float _393 = -_383;
    float _395 = _381 + _393;
    float _397 = _379 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _399 = fma(_387, _387, _389);
    float _401 = in.m_59.w;
    float _403 = _379 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _405 = _379 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _407 = fma(_395, _395, _399);
    float _409 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[5].x, _397);
    float _411 = in.m_46.x;
    float _413 = in.m_46.y;
    float _415 = in.m_46.z;
    float _417 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[4].x, _403);
    float _419 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[6].x, _405);
    float _421 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[5].z, _409);
    float _423 = sqrt(_407);
    float _425 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[4].z, _417);
    float _427 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[6].z, _419);
    out.m_61.y = _391;
    bool _429 = _423 >= 9.9999999747524270787835121154785e-07;
    bool _431 = isnan(_423);
    bool _433 = _429 || _431;
    bool _435 = isnan(9.9999999747524270787835121154785e-07);
    bool _437 = _433 || _435;
    float _439 = fma(_369, _401, _411);
    float _441 = fma(_363, _401, _413);
    float _443 = fma(_381, _401, _415);
    float _445 = _395;
    float _447 = _425;
    float _449 = _427;
    float _451 = _443;
    if (_437)
    {
        _445 = _421;
    }
    float _453 = _445;
    float _455 = _453;
    if (!_437)
    {
        bool _457 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _459 = !_457;
        if (!_459)
        {
            float _461 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _463 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _465 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _467 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _461);
            float _469 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _463);
            float _471 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _465);
            float _473 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _467);
            float _475 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _469);
            float _477 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _471);
            float _479 = _473 * _473;
            float _481 = fma(_475, _475, _479);
            float _483 = fma(_477, _477, _481);
            float _485 = rsqrt(_483);
            float _487 = _485 * 9.9999999747524270787835121154785e-07;
            float _489 = _475 * _487;
            float _491 = _473 * _487;
            float _493 = _477 * _487;
            _455 = _491;
            _447 = _489;
            _449 = _493;
            _495 = true;
        }
        else
        {
            float _497 = _175 * _175;
            float _499 = fma(_173, _173, _497);
            float _501 = fma(_177, _177, _499);
            float _503 = sqrt(_501);
            bool _505 = _503 >= 9.9999999747524270787835121154785e-07;
            bool _507 = isnan(_503);
            bool _509 = _505 || _507;
            bool _511 = isnan(9.9999999747524270787835121154785e-07);
            bool _513 = _509 || _511;
            if (!_513)
            {
                float _515 = _413 * _413;
                float _517 = fma(_411, _411, _515);
                float _519 = fma(_415, _415, _517);
                float _521 = sqrt(_519);
                bool _523 = _521 >= 9.9999999747524270787835121154785e-07;
                bool _525 = isnan(_521);
                bool _527 = _523 || _525;
                bool _529 = isnan(9.9999999747524270787835121154785e-07);
                bool _531 = _527 || _529;
                if (!_531)
                {
                    float _533 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _535 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _533);
                    float _537 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _535);
                    float _539 = rsqrt(_537);
                    float _541 = _539 * 9.9999999747524270787835121154785e-07;
                    float _543 = _541 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _545 = _541 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _547 = _541 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _455 = _545;
                    _447 = _543;
                    _449 = _547;
                    _495 = true;
                }
                else
                {
                    float _549 = _413 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _551 = _413 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _553 = _413 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _555 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[5].x, _549);
                    float _557 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[4].x, _551);
                    float _559 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[6].x, _553);
                    float _561 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[5].z, _555);
                    float _563 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[4].z, _557);
                    float _565 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[6].z, _559);
                    float _567 = _561 * _561;
                    float _569 = fma(_563, _563, _567);
                    float _571 = fma(_565, _565, _569);
                    float _573 = rsqrt(_571);
                    float _575 = _573 * 9.9999999747524270787835121154785e-07;
                    float _577 = _563 * _575;
                    float _579 = _561 * _575;
                    float _581 = _565 * _575;
                    _455 = _579;
                    _447 = _577;
                    _449 = _581;
                    _495 = true;
                }
            }
            else
            {
                float _583 = _175 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _585 = _175 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _587 = _175 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _589 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[5].x, _583);
                float _591 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[4].x, _585);
                float _593 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[6].x, _587);
                float _595 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[5].z, _589);
                float _597 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[4].z, _591);
                float _599 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[6].z, _593);
                float _601 = _595 * _595;
                float _603 = fma(_597, _597, _601);
                float _605 = fma(_599, _599, _603);
                float _607 = rsqrt(_605);
                float _609 = _607 * 9.9999999747524270787835121154785e-07;
                float _611 = _597 * _609;
                float _613 = _595 * _609;
                float _615 = _599 * _609;
                _455 = _613;
                _447 = _611;
                _449 = _615;
            }
        }
    }
    _495 = false;
    float _617 = _455;
    float _619 = _447;
    float _621 = _449;
    bool _623 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _625 = !_623;
    float _641;
    if (!_625)
    {
        float _627 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _629 = _131 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _631 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _633 = _631 * _627;
        float _635 = floor(_633);
        float _637 = -_635;
        float _639 = _633 + _637;
        _641 = _639;
        _643 = true;
    }
    else
    {
        float _645 = float(_109);
        float _647 = 1.0 / _645;
        float _649 = _145 * _647;
        _641 = _649;
    }
    _643 = false;
    float _651 = _641;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _655 = _651 + _653;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _659 = _651 + _657;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _663 = _651 + _661;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _665;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _671 = _669 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _673;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _679 = _677 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _681 = 1.0 / _667;
    bool _683 = _651 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _685 = isnan(_651);
    bool _687 = _683 || _685;
    bool _689 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _691 = _687 || _689;
    float _693 = float(_691);
    bool _695 = _651 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _697 = isnan(_651);
    bool _699 = _695 || _697;
    bool _701 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _703 = _699 || _701;
    float _705 = float(_703);
    float _707 = 1.0 / _671;
    bool _709 = _651 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _711 = isnan(_651);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    float _721 = 1.0 / _675;
    float _723 = _655 * _681;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _727 = _651 + _725;
    bool _729 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _731 = 1.0 / _679;
    float _733 = _659 * _707;
    bool _735 = _651 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _737 = isnan(_651);
    bool _739 = _735 || _737;
    bool _741 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _743 = _739 || _741;
    float _745 = float(_743);
    float _747 = -_745;
    float _749 = _747 + 1.0;
    float _751 = _663 * _721;
    float _753 = _727 * _731;
    bool _755 = _651 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _757 = isnan(_651);
    bool _759 = _755 || _757;
    bool _761 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _763 = _759 || _761;
    float _765 = float(_763);
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _769 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _767;
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _773 = _771 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _775 = _765 * _749;
    float _777 = -_765;
    float _779 = _777 + 1.0;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _781;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _785;
    float _789 = fma(_769, _723, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _791 = _705 * _779;
    float _793 = fma(_783, _723, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _795 = fma(_787, _723, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _797 = -_693;
    float _799 = _797 + 1.0;
    float _801 = -_705;
    float _803 = _801 + 1.0;
    float _805 = fma(_773, _733, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _807 = _719 * _799;
    float _809 = _693 * _803;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _813 = _811 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _815 = -_719;
    float _817 = _815 + 1.0;
    float _819 = _793 * _807;
    float _821 = _795 * _807;
    float _823 = _789 * _807;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _825;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _831 = _829 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _833 = in.m_59.x;
    float _835 = in.m_59.y;
    float _837 = in.m_59.z;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _839;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _843;
    float _847 = fma(_827, _751, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _849 = fma(_813, _733, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _851 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[143].x, _819);
    float _853 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[143].y, _821);
    float _855 = fma(_831, _733, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _857 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[143].z, _823);
    float _859 = fma(_841, _751, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _861 = fma(_845, _751, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _863 = fma(_805, _809, _851);
    float _865 = fma(_849, _809, _853);
    float _867 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _869 = _867 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _873 = _871 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _877 = _875 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _879 = fma(_855, _809, _857);
    float _881 = fma(_869, _753, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _883 = fma(_873, _753, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _885 = fma(_877, _753, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _887 = fma(_859, _791, _863);
    float _889 = fma(_847, _791, _865);
    float _891 = fma(_861, _791, _879);
    float _893 = fma(_881, _775, _887);
    float _895 = fma(_883, _775, _889);
    float _897 = fma(_885, _775, _891);
    float _899 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[147].x, _893);
    float _901 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[147].y, _895);
    float _903 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[147].z, _897);
    float _905 = _899 * _833;
    float _907 = _901 * _835;
    float _909 = _903 * _837;
    bool _911 = !_729;
    float _927;
    if (!_911)
    {
        float _913 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _915 = _131 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _917 = fma(_915, (*spvDescriptorSet0.vp_c9)._m0[11].y, _145);
        float _919 = _917 * _913;
        float _921 = floor(_919);
        float _923 = -_921;
        float _925 = _919 + _923;
        _927 = _925;
        _929 = true;
    }
    else
    {
        float _931 = float(_109);
        float _933 = 1.0 / _931;
        float _935 = _145 * _933;
        _927 = _935;
    }
    _929 = false;
    float _937 = _927;
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _941 = _937 + _939;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _945 = _943 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _947 = _937 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _949 = isnan(_937);
    bool _951 = _947 || _949;
    bool _953 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _955 = _951 || _953;
    float _957 = float(_955);
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _961 = _959 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _963 = _937 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _965 = isnan(_937);
    bool _967 = _963 || _965;
    bool _969 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _971 = _967 || _969;
    float _973 = float(_971);
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _977 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _975;
    bool _979 = _937 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _981 = isnan(_937);
    bool _983 = _979 || _981;
    bool _985 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _987 = _983 || _985;
    float _989 = float(_987);
    float _991 = 1.0 / _945;
    float _993 = -_957;
    float _995 = _993 + 1.0;
    float _997 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _999 = 1.0 / _961;
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1003 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1005 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1007 = _997 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1009 = _1001 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1011 = _1005 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1013 = _977 * _991;
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1017 = _1015 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1019 = -_989;
    float _1021 = _1019 + 1.0;
    float _1023 = fma(_1013, _941, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1025 = _973 * _995;
    float _1027 = -_973;
    float _1029 = _1027 + 1.0;
    float _1031 = _957 * _1021;
    float _1033 = _1017 * _999;
    float _1035 = _1023 * _1025;
    float _1037 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1039 = _937 + _1037;
    float _1041 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1035);
    float _1043 = fma(_1033, _1039, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1045 = fma(_1043, _1031, _1041);
    float _1047 = fma(_989, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1045);
    float _1049 = _1047 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_63.x = _1007;
    out.m_63.y = _1009;
    out.m_63.z = _1011;
    out.m_63.w = _1049;
    bool _1051 = !_1003;
    float _1067;
    if (!_1051)
    {
        float _1053 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1055 = _131 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1057 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[11].w, _145);
        float _1059 = _1057 * _1053;
        float _1061 = floor(_1059);
        float _1063 = -_1061;
        float _1065 = _1059 + _1063;
        _1067 = _1065;
        _1069 = true;
    }
    else
    {
        float _1071 = float(_109);
        float _1073 = 1.0 / _1071;
        float _1075 = _145 * _1073;
        _1067 = _1075;
    }
    _1069 = false;
    float _1077 = _1067;
    float _1079 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1081 = _1077 + _1079;
    float _1083 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1085 = _1083 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1087 = _1077 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1089 = isnan(_1077);
    bool _1091 = _1087 || _1089;
    bool _1093 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1095 = _1091 || _1093;
    float _1097 = float(_1095);
    float _1099 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1101 = _1099 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1103 = _1077 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1105 = isnan(_1077);
    bool _1107 = _1103 || _1105;
    bool _1109 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1111 = _1107 || _1109;
    float _1113 = float(_1111);
    float _1115 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1117 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1115;
    bool _1119 = _1077 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1121 = isnan(_1077);
    bool _1123 = _1119 || _1121;
    bool _1125 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1127 = _1123 || _1125;
    float _1129 = float(_1127);
    float _1131 = 1.0 / _1085;
    float _1133 = -_1097;
    float _1135 = _1133 + 1.0;
    bool _1137 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1139 = 1.0 / _1101;
    float _1141 = _1117 * _1131;
    float _1143 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1145 = _1143 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1147 = -_1129;
    float _1149 = _1147 + 1.0;
    float _1151 = fma(_1141, _1081, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1153 = _1113 * _1135;
    float _1155 = -_1113;
    float _1157 = _1155 + 1.0;
    float _1159 = _1097 * _1149;
    float _1161 = _1145 * _1139;
    float _1163 = _1151 * _1153;
    float _1165 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1167 = _1077 + _1165;
    float _1169 = fma(_1157, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1163);
    float _1171 = fma(_1161, _1167, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1173 = fma(_1171, _1159, _1169);
    float _1175 = fma(_1129, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1173);
    float _1177 = _1175 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_65.w = _1177;
    bool _1179 = !_1137;
    float _1195;
    if (!_1179)
    {
        float _1181 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1183 = _131 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1185 = fma(_1183, (*spvDescriptorSet0.vp_c9)._m0[14].x, _145);
        float _1187 = _1185 * _1181;
        float _1189 = floor(_1187);
        float _1191 = -_1189;
        float _1193 = _1187 + _1191;
        _1195 = _1193;
        _1197 = true;
    }
    else
    {
        float _1199 = float(_109);
        float _1201 = 1.0 / _1199;
        float _1203 = _145 * _1201;
        _1195 = _1203;
    }
    _1197 = false;
    float _1205 = _1195;
    float _1207 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1209 = _1205 + _1207;
    bool _1211 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1213 = isnan(_1205);
    bool _1215 = _1211 || _1213;
    bool _1217 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1219 = _1215 || _1217;
    float _1221 = float(_1219);
    float _1223 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1225 = _1223 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1227 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1229 = isnan(_1205);
    bool _1231 = _1227 || _1229;
    bool _1233 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1235 = _1231 || _1233;
    float _1237 = float(_1235);
    float _1239 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1241 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1239;
    float _1243 = -_1221;
    float _1245 = _1243 + 1.0;
    bool _1247 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1249 = isnan(_1205);
    bool _1251 = _1247 || _1249;
    bool _1253 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1255 = _1251 || _1253;
    float _1257 = float(_1255);
    float _1259 = 1.0 / _1225;
    bool _1261 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1263 = isnan(_1205);
    bool _1265 = _1261 || _1263;
    bool _1267 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1269 = _1265 || _1267;
    float _1271 = float(_1269);
    float _1273 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1275 = _1273 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1277 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1279 = isnan(_1205);
    bool _1281 = _1277 || _1279;
    bool _1283 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1285 = _1281 || _1283;
    float _1287 = float(_1285);
    float _1289 = 1.0 / _1275;
    bool _1291 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1293 = _1241 * _1259;
    float _1295 = _1237 * _1245;
    float _1297 = -_1237;
    float _1299 = _1297 + 1.0;
    bool _1301 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1303 = isnan(_1205);
    bool _1305 = _1301 || _1303;
    bool _1307 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1309 = _1305 || _1307;
    float _1311 = float(_1309);
    float _1313 = fma(_1293, _1209, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1315 = _1257 * _1299;
    float _1317 = -_1257;
    float _1319 = _1317 + 1.0;
    float _1321 = -_1311;
    float _1323 = _1321 + 1.0;
    float _1325 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1327 = _1325 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1329 = _1311 * _1319;
    float _1331 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1333 = _1331 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1335 = _1271 * _1323;
    float _1337 = -_1271;
    float _1339 = _1337 + 1.0;
    bool _1341 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1343 = isnan(_1205);
    bool _1345 = _1341 || _1343;
    bool _1347 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1349 = _1345 || _1347;
    float _1351 = float(_1349);
    float _1353 = -_1287;
    float _1355 = _1353 + 1.0;
    float _1357 = 1.0 / _1327;
    float _1359 = _1287 * _1339;
    float _1361 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1363 = _1361 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1365 = _1351 * _1355;
    float _1367 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1369 = _1367 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1371 = -_1351;
    float _1373 = _1371 + 1.0;
    float _1375 = _1313 * _1365;
    float _1377 = 1.0 / _1333;
    float _1379 = _1369 * _1289;
    float _1381 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1383 = _1205 + _1381;
    float _1385 = fma(_1373, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1375);
    float _1387 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1389 = _1387 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1391 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1393 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1391;
    float _1395 = 1.0 / _1363;
    float _1397 = fma(_1379, _1383, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1399 = _1393 * _1357;
    float _1401 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1403 = _1205 + _1401;
    float _1405 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1407 = _1405 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1409 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1411 = _1409 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1413 = 1.0 / _1389;
    float _1415 = fma(_1397, _1359, _1385);
    float _1417 = _1411 * _1377;
    float _1419 = fma(_1399, _1403, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1421 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1423 = _1205 + _1421;
    float _1425 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1427 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1425;
    float _1429 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1431 = _1429 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1433 = 1.0 / _1407;
    float _1435 = fma(_1417, _1423, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1437 = _1427 * _1395;
    float _1439 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1441 = _1205 + _1439;
    float _1443 = _1431 * _1413;
    float _1445 = fma(_1419, _1335, _1415);
    float _1447 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1449 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1447;
    float _1451 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1453 = _1205 + _1451;
    bool _1455 = _1205 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1457 = isnan(_1205);
    bool _1459 = _1455 || _1457;
    bool _1461 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1463 = _1459 || _1461;
    float _1465 = float(_1463);
    float _1467 = fma(_1437, _1441, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1469 = fma(_1435, _1329, _1445);
    float _1471 = fma(_1443, _1453, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1473 = _1449 * _1433;
    float _1475 = -_1465;
    float _1477 = _1475 + 1.0;
    float _1479 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1481 = _1205 + _1479;
    float _1483 = fma(_1467, _1315, _1469);
    float _1485 = _1221 * _1477;
    float _1487 = fma(_1473, _1481, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1489 = fma(_1471, _1295, _1483);
    float _1491 = fma(_1487, _1485, _1489);
    float _1493 = fma(_1465, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1491);
    float _1495 = precise::clamp(_1493, 0.0, 1.0);
    bool _1497 = !_1291;
    float _1513;
    if (!_1497)
    {
        float _1499 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _1501 = _131 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _1503 = fma(_1501, (*spvDescriptorSet0.vp_c9)._m0[14].z, _145);
        float _1505 = _1503 * _1499;
        float _1507 = floor(_1505);
        float _1509 = -_1507;
        float _1511 = _1505 + _1509;
        _1513 = _1511;
        _1515 = true;
    }
    else
    {
        float _1517 = float(_109);
        float _1519 = 1.0 / _1517;
        float _1521 = _145 * _1519;
        _1513 = _1521;
    }
    _1515 = false;
    float _1523 = _1513;
    int _1525 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _1527 = _1525;
    int _1529 = 0;
    int _1531 = _100(_1527, _1529, (*spvDescriptorSet0.support_buffer));
    float _1533 = in.m_57.z;
    float _1535 = trunc(_1533);
    int _1537 = int(_1535);
    int _1539 = _1531 + (-1);
    float _1541 = float(_1539);
    float _1543 = _1495 * _1541;
    float _1545 = trunc(_1543);
    int _1547 = int(_1545);
    int _1549 = _1547;
    int _1551 = 0;
    int _1553 = _101(_1549, _1551, (*spvDescriptorSet0.support_buffer));
    int _1555 = _1537;
    int _1557 = 0;
    int _1559 = _101(_1555, _1557, (*spvDescriptorSet0.support_buffer));
    float4 _1562 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1553, _1559)), 0).xyzw;
    float _1564 = _1562.x;
    float _1566 = _1562.y;
    float _1568 = _1562.z;
    float _1570 = _1562.w;
    float _1572 = in.m_57.x;
    float _1574 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1576 = _1574 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1578 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1580 = _1578 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    int _1582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1584 = _1582 != 0;
    float _1586 = 1.0 / _1576;
    float _1588 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1590 = _1588 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    int _1592 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1594 = _1592 != 0;
    int _1596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1598 = _1596 != 0;
    int _1600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1602 = _1600 != 0;
    float _1604 = 1.0 / _1580;
    float _1606 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1608 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1606;
    float _1610 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _1612 = _1610 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    bool _1614 = false;
    if (_1584)
    {
        bool _1616 = _131 > 0.5;
        _1614 = _1616;
    }
    bool _1618 = _1614;
    float _1620 = 1.0 / _1590;
    float _1622 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1624 = _1622 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1626 = _1608 * _1586;
    bool _1628 = _1523 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1630 = isnan(_1523);
    bool _1632 = _1628 || _1630;
    bool _1634 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1636 = _1632 || _1634;
    float _1638 = float(_1636);
    bool _1640 = _1523 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1642 = isnan(_1523);
    bool _1644 = _1640 || _1642;
    bool _1646 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1648 = _1644 || _1646;
    float _1650 = float(_1648);
    bool _1652 = _1523 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1654 = isnan(_1523);
    bool _1656 = _1652 || _1654;
    bool _1658 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _1660 = _1656 || _1658;
    float _1662 = float(_1660);
    float _1664 = 1.0 / _1624;
    float _1666 = _1612 * _1604;
    float _1668 = -_1638;
    float _1670 = _1668 + 1.0;
    float _1672 = -_1650;
    float _1674 = _1672 + 1.0;
    bool _1676 = _1523 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1678 = isnan(_1523);
    bool _1680 = _1676 || _1678;
    bool _1682 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _1684 = _1680 || _1682;
    float _1686 = float(_1684);
    float _1688 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1690 = _1688 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1692 = _1650 * _1670;
    float _1694 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1696 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _1694;
    float _1698 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _1700 = _1698 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1702 = 1.0 / _1690;
    float _1704 = _1662 * _1674;
    float _1706 = _1696 * _1620;
    float _1708 = -_1662;
    float _1710 = _1708 + 1.0;
    bool _1712 = _1523 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1714 = isnan(_1523);
    bool _1716 = _1712 || _1714;
    bool _1718 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1720 = _1716 || _1718;
    float _1722 = float(_1720);
    float _1724 = _1700 * _1664;
    float _1726 = -_1686;
    float _1728 = _1726 + 1.0;
    bool _1730 = _1523 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1732 = isnan(_1523);
    bool _1734 = _1730 || _1732;
    bool _1736 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1738 = _1734 || _1736;
    float _1740 = float(_1738);
    float _1742 = _1686 * _1710;
    float _1744 = _1722 * _1728;
    float _1746 = -_1722;
    float _1748 = _1746 + 1.0;
    bool _1750 = _1523 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _1752 = isnan(_1523);
    bool _1754 = _1750 || _1752;
    bool _1756 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _1758 = _1754 || _1756;
    float _1760 = float(_1758);
    float _1762 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1764 = _1523 + _1762;
    float _1766 = -_1740;
    float _1768 = _1766 + 1.0;
    float _1770 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1772 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _1770;
    float _1774 = fma(_1626, _1764, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _1776 = _1760 * _1768;
    float _1778 = _1772 * _1702;
    float _1780 = _1740 * _1748;
    float _1782 = _1774 * _1776;
    float _1784 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1786 = _1523 + _1784;
    float _1788 = -_1760;
    float _1790 = _1788 + 1.0;
    float _1792 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1794 = _1792 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1796 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1798 = _1796 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _1800 = fma(_1666, _1786, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _1802 = in.m_53.w;
    float _1804 = fma(_1790, (*spvDescriptorSet0.vp_c9)._m0[175].x, _1782);
    float _1806 = 1.0 / _1794;
    float _1808 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1810 = _1523 + _1808;
    float _1812 = fma(_1800, _1780, _1804);
    float _1814 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _1816 = _1814 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1818 = fma(_1706, _1810, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _1820 = in.m_53.y;
    float _1822 = 1.0 / _1798;
    float _1824 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1826 = _1523 + _1824;
    float _1828 = _1804;
    float _1830 = _1638;
    float _1832 = _1692;
    if (_1594)
    {
        float _1834 = in.m_53.z;
        _1828 = _1834;
    }
    float _1836 = _1828;
    float _1838 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1840 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _1838;
    float _1842 = fma(_1724, _1826, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _1844 = fma(_1818, _1744, _1812);
    bool _1846 = _1523 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _1848 = isnan(_1523);
    bool _1850 = _1846 || _1848;
    bool _1852 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _1854 = _1850 || _1852;
    float _1856 = float(_1854);
    float _1858 = _1816 * _1806;
    float _1860 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1862 = _1523 + _1860;
    float _1864 = fma(_1842, _1742, _1844);
    float _1866 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1868 = _1523 + _1866;
    float _1870 = -_391;
    float _1872 = _1870 + 1.0;
    float _1874 = fma(_1778, _1862, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    bool _1876 = _1802 > 0.5;
    bool _1878 = _1876 && _1598;
    float _1880 = -_1856;
    float _1882 = _1880 + 1.0;
    float _1884 = _1840 * _1822;
    float _1886 = fma(_1858, _1868, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _1888 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1890 = _1523 + _1888;
    float _1892 = fma(_1874, _1704, _1864);
    float _1894 = _1878 ? _1872 : _391;
    float _1896 = _1638 * _1882;
    float _1898 = fma(_1884, _1890, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _1900 = fma(_1886, _1692, _1892);
    bool _1902 = _1820 > 0.5;
    bool _1904 = _1902 && _1602;
    float _1906 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1908 = as_type<int>(_1900);
    int _1910 = as_type<int>(_1896);
    if (!_1584)
    {
        _1830 = _1572;
    }
    float _1912 = _1830;
    float _1914 = fma(_1898, _1896, _1900);
    float _1916 = _1904 ? _1872 : _391;
    float _1918 = _1894 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1920 = _1547 + 1;
    float _1922 = fma(_1856, (*spvDescriptorSet0.vp_c9)._m0[182].x, _1914);
    float _1924 = _1912;
    if (!_1584)
    {
        _1832 = _1912;
    }
    float _1926 = _1832;
    float _1928 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1930 = _1926;
    if (_1584)
    {
        _1924 = _1572;
    }
    float _1932 = _1924;
    int _1934 = min(_1539, _1920);
    out.m_67.x = _1922;
    bool _1936 = false;
    float _1938 = _1932;
    if (_1594)
    {
        bool _1940 = _1836 > 0.5;
        _1936 = _1940;
    }
    bool _1942 = _1936;
    if (_1584)
    {
        float _1944 = -_1932;
        float _1946 = _1944 + 1.0;
        _1908 = as_type<int>(_1946);
    }
    int _1948 = _1908;
    if (_1594)
    {
        float _1950 = -_1932;
        float _1952 = _1950 + 1.0;
        _1910 = as_type<int>(_1952);
    }
    int _1954 = _1910;
    float _1956 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_1584)
    {
        float _1958 = _1618 ? as_type<float>(_1948) : _1932;
        _1930 = _1958;
    }
    float _1960 = _1930;
    float _1962 = _1916 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_1594)
    {
        float _1964 = _1942 ? as_type<float>(_1954) : _1932;
        _1938 = _1964;
    }
    float _1966 = _1938;
    float _1968 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1970 = _1962 * _1956;
    float _1972 = _1966 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1974 = _1918 * _1906;
    float _1976 = _1972 * _1968;
    uint _1979 = as_type<uint>(half2(float2(_1570, 0.0)));
    uint _1981 = extract_bits(_1979, 0u, 8u);
    int _1983 = int(_1981) & 255;
    uint _1985 = extract_bits(_1979, 8u, 8u);
    int _1987 = int(_1985) & 255;
    int _1989 = _1987 << 8;
    int _1991 = _1983 | _1989;
    bool _1993 = _1991 >= 32768;
    int _1995 = _1991 + (-1024);
    int _1997 = _1995;
    if (_1993)
    {
        int _1999 = ~_1991;
        int _2001 = _1999 + 33792;
        int _2003 = _2001 + 1;
        _1997 = _2003;
    }
    int _2005 = _1997;
    int _2007 = _2005 + 30719;
    float _2009 = float(_2007);
    float _2011 = fma(_2009, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2013 = abs(_2011);
    float _2015 = -_2013;
    float _2017 = _2015 + 1.0;
    float _2019 = abs(_2011);
    float _2021 = fma(_2019, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _2023 = _2011 < 0.0;
    float _2025 = float(_2023);
    int _2027 = as_type<int>(_2017) + (-218103808);
    float _2029 = abs(_2011);
    float _2031 = fma(_2029, _2021, -0.212114393711090087890625);
    bool _2033 = uint(_2027) >= 1920991232u;
    float _2035 = _1960 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2037 = abs(_2011);
    float _2039 = fma(_2037, _2031, 1.570728778839111328125);
    float _2041 = _2035 * _1928;
    bool _2043 = !_2033;
    float _2061;
    if (!_2043)
    {
        int _2045 = as_type<int>(_2017);
        int _2047 = as_type<int>(_1836);
        int _2049 = 10320;
        int _2051;
        int _2053;
        int _2055;
        int _2057;
        int _2059;
        _98(_2045, _2047, _2049, _2051, _2053, _2055, _2057, _2059, out.gl_Position, out.gl_PointSize);
        _2061 = as_type<float>(_2055);
        _2063 = true;
    }
    else
    {
        float _2065 = rsqrt(_2017);
        float _2067 = _2017 * _2065;
        float _2069 = _2065 * 0.5;
        float _2071 = -_2067;
        float _2073 = 0.0 + _2071;
        float _2075 = fma(_2069, _2073, 0.5);
        float _2077 = fma(_2067, _2075, _2067);
        float _2079 = -_2077;
        float _2081 = 0.0 + _2079;
        float _2083 = fma(_2077, _2081, _2017);
        float _2085 = fma(_2069, _2083, _2077);
        _2061 = _2085;
    }
    _2063 = false;
    float _2087 = _2061;
    int _2089 = _1934;
    int _2091 = 0;
    int _2093 = _101(_2089, _2091, (*spvDescriptorSet0.support_buffer));
    int _2095 = _1537;
    int _2097 = 0;
    int _2099 = _101(_2095, _2097, (*spvDescriptorSet0.support_buffer));
    float4 _2101 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_2093, _2099)), 0).xyzw;
    float _2103 = _2101.x;
    float _2105 = _2101.y;
    float _2107 = _2101.z;
    float _2109 = _2101.w;
    float _2111 = _2039 * _2087;
    float _2113 = _2025 * 2.0;
    float _2115 = _2009 * 3.883221149444580078125;
    float _2117 = floor(_1543);
    float _2119 = -_2113;
    float _2121 = fma(_2111, _2119, _2111);
    float _2123 = _2115 * 0.15915493667125701904296875;
    float _2125 = fma(_2025, 3.1415927410125732421875, _2121);
    float _2127 = _2123 * 6.283185482025146484375;
    float _2129 = cos(_2127);
    float _2131 = _2125 * 0.15915493667125701904296875;
    float _2133 = _2131 * 6.283185482025146484375;
    float _2135 = sin(_2133);
    float _2137 = -_2117;
    float _2139 = _1543 + _2137;
    float _2141 = _2123 * 6.283185482025146484375;
    float _2143 = sin(_2141);
    float _2145 = _2135 * _2129;
    float _2147 = _2135 * _2143;
    uint _2149 = as_type<uint>(half2(float2(_2109, 0.0)));
    float _2151 = -_1564;
    float _2153 = _2151 + _2103;
    float _2155 = -_1566;
    float _2157 = _2155 + _2105;
    float _2159 = -_1568;
    float _2161 = _2159 + _2107;
    uint _2163 = extract_bits(_2149, 0u, 8u);
    int _2165 = int(_2163) & 255;
    uint _2167 = extract_bits(_2149, 8u, 8u);
    int _2169 = int(_2167) & 255;
    int _2171 = _2169 << 8;
    int _2173 = _2165 | _2171;
    float _2175 = fma(_2139, _2153, _1564);
    float _2177 = fma(_2139, _2157, _1566);
    float _2179 = fma(_2139, _2161, _1568);
    bool _2181 = _2173 >= 32768;
    int _2183 = _2173 + (-1024);
    int _2185 = _2183;
    if (_2181)
    {
        int _2187 = ~_2173;
        int _2189 = _2187 + 33792;
        int _2191 = _2189 + 1;
        _2185 = _2191;
    }
    int _2193 = _2185;
    int _2195 = _2193 + 30719;
    float _2197 = float(_2195);
    float _2199 = fma(_2197, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2201 = abs(_2199);
    float _2203 = -_2201;
    float _2205 = _2203 + 1.0;
    float _2207 = abs(_2199);
    float _2209 = fma(_2207, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _2211 = _2199 < 0.0;
    float _2213 = float(_2211);
    int _2215 = as_type<int>(_2205) + (-218103808);
    float _2217 = abs(_2199);
    float _2219 = fma(_2217, _2209, -0.212114393711090087890625);
    bool _2221 = uint(_2215) >= 1920991232u;
    float _2223 = abs(_2199);
    float _2225 = fma(_2223, _2219, 1.570728778839111328125);
    bool _2227 = !_2221;
    float _2245;
    if (!_2227)
    {
        int _2229 = as_type<int>(_2205);
        int _2231 = as_type<int>(_2131);
        int _2233 = 11216;
        int _2235;
        int _2237;
        int _2239;
        int _2241;
        int _2243;
        _98(_2229, _2231, _2233, _2235, _2237, _2239, _2241, _2243, out.gl_Position, out.gl_PointSize);
        _2245 = as_type<float>(_2239);
        _2247 = true;
    }
    else
    {
        float _2249 = rsqrt(_2205);
        float _2251 = _2205 * _2249;
        float _2253 = _2249 * 0.5;
        float _2255 = -_2251;
        float _2257 = 0.0 + _2255;
        float _2259 = fma(_2253, _2257, 0.5);
        float _2261 = fma(_2251, _2259, _2251);
        float _2263 = -_2261;
        float _2265 = 0.0 + _2263;
        float _2267 = fma(_2261, _2265, _2205);
        float _2269 = fma(_2253, _2267, _2261);
        _2245 = _2269;
    }
    _2247 = false;
    float _2271 = _2245;
    float _2273 = in.m_53.x;
    float _2275 = in.m_53.y;
    float _2277 = in.m_53.z;
    float _2279 = _617 * _617;
    float _2281 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2283 = log2(_2281);
    float _2285 = _2225 * _2271;
    float _2287 = fma(_619, _619, _2279);
    float _2289 = _2197 * 3.883221149444580078125;
    int _2291 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2293 = _2291 != 0;
    int _2295 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2297 = _2295 != 0;
    int _2299 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2301 = _2299 != 0;
    float _2303 = -_2011;
    float _2305 = _2303 + _2199;
    float _2307 = fma(_621, _621, _2287);
    float _2309 = _2289 * 0.15915493667125701904296875;
    float _2311 = _441 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2313 = rsqrt(_2307);
    float _2315 = _2283 * _145;
    float _2317 = _2277 * 2.0;
    float _2319 = _2273 * 2.0;
    float _2321 = _2275 * 2.0;
    float _2323 = floor(_2319);
    float _2325 = floor(_2317);
    float _2327 = _2273 + _2277;
    float _2329 = _2327 + (-1.0);
    float _2331 = floor(_2321);
    bool _2333 = _2323 >= 0.0;
    bool _2335 = isnan(_2323);
    bool _2337 = _2333 || _2335;
    bool _2339 = isnan(0.0);
    bool _2341 = _2337 || _2339;
    bool _2343 = _2325 > 0.0;
    float _2345 = fma(_2329, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _2347 = _2325 >= 0.0;
    bool _2349 = isnan(_2325);
    bool _2351 = _2347 || _2349;
    bool _2353 = isnan(0.0);
    bool _2355 = _2351 || _2353;
    float _2357 = _2275 + _2273;
    float _2359 = exp2(_2315);
    float _2361 = _2313 * _617;
    int _2363 = _2355 ? 0 : 1;
    float _2365 = _2357 + (-1.0);
    bool _2367 = _2323 > 0.0;
    int _2369 = ~_2363;
    int _2371 = _2369 + 1;
    int _2373 = _2371 + 1;
    float _2375 = fma(_2365, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2377 = _2313 * _621;
    int _2379 = _2373;
    if (!_2343)
    {
        int _2381 = ~_2363;
        int _2383 = _2381 + 1;
        _2379 = _2383;
    }
    int _2385 = _2379;
    bool _2387 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2389 = isnan(1.0);
    bool _2391 = _2387 || _2389;
    bool _2393 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2395 = _2391 || _2393;
    float _2397 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2399 = 1.0 + _2397;
    float _2401 = _2313 * _619;
    bool _2403 = !_2293;
    int _2405 = _2403 ? 0 : 1;
    float _2407 = in.m_69.x;
    float _2409 = in.m_69.y;
    float _2411 = in.m_69.z;
    float _2413 = 1.0 / _2399;
    bool _2415 = _2331 > 0.0;
    float _2417 = -_2359;
    float _2419 = _2417 + 1.0;
    bool _2421 = _2331 >= 0.0;
    bool _2423 = isnan(_2331);
    bool _2425 = _2421 || _2423;
    bool _2427 = isnan(0.0);
    bool _2429 = _2425 || _2427;
    float _2431 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2433 = _2377 * _2431;
    int _2435 = _2341 ? 0 : 1;
    int _2437 = abs(_2405);
    bool _2439 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2441 = isnan(0.0);
    bool _2443 = _2439 || _2441;
    bool _2445 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2447 = _2443 || _2445;
    float _2449 = float(_2437);
    float _2451 = _2447 ? _2419 : 0.0;
    float _2453 = float(_2385);
    bool _2455 = !_2301;
    int _2457 = _2455 ? 0 : 1;
    if (_2395)
    {
        float _2459 = _2451 * _2413;
        _151 = _2459;
    }
    float _2461 = _151;
    int _2463 = _2429 ? 0 : 1;
    float _2465 = _2449 * _2453;
    int _2467 = abs(_2457);
    float _2469 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2471 = _2361 * _2469;
    int _2473 = ~_2435;
    int _2475 = _2473 + 1;
    int _2477 = _2475 + 1;
    float _2479 = _2465 * (-2.0);
    int _2481 = ~_2463;
    int _2483 = _2481 + 1;
    int _2485 = _2483 + 1;
    float _2487 = _2273 + (-0.5);
    int _2489 = _2477;
    int _2491 = _2485;
    if (!_2367)
    {
        int _2493 = ~_2435;
        int _2495 = _2493 + 1;
        _2489 = _2495;
    }
    int _2497 = _2489;
    float _2499 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2501 = -_2471;
    float _2503 = fma(_2377, _2499, _2501);
    if (!_2415)
    {
        int _2505 = ~_2463;
        int _2507 = _2505 + 1;
        _2491 = _2507;
    }
    int _2509 = _2491;
    float _2511 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2513 = _2401 * _2511;
    float _2515 = float(_2467);
    float _2517 = fma(_2479, _2407, _2407);
    float _2519 = float(_2509);
    float _2521 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2523 = -_2433;
    float _2525 = fma(_2401, _2521, _2523);
    float _2527 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2529 = -_2513;
    float _2531 = fma(_2361, _2527, _2529);
    float _2533 = fma(_2375, _2479, _2375);
    float _2535 = fma(_2487, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2517);
    bool _2537 = !_2297;
    int _2539 = _2537 ? 0 : 1;
    float _2541 = _2515 * _2519;
    float _2543 = float(_2497);
    float _2545 = fma(_2533, _2461, _2535);
    int _2547 = abs(_2539);
    float _2549 = _2541 * (-2.0);
    float _2551 = _2277 + (-0.5);
    float _2553 = _2545 * 0.15915493667125701904296875;
    float _2555 = float(_2547);
    float _2557 = fma(_2549, _2411, _2411);
    float _2559 = _2525 * _2525;
    float _2561 = fma(_2345, _2549, _2345);
    float _2563 = _2553 * 6.283185482025146484375;
    float _2565 = sin(_2563);
    float _2567 = fma(_2551, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2557);
    float _2569 = _2555 * _2543;
    float _2571 = _2275 + _2277;
    float _2573 = _2275 + (-0.5);
    float _2575 = _2569 * (-2.0);
    float _2577 = _2571 + (-1.0);
    float _2579 = fma(_2503, _2503, _2559);
    float _2581 = fma(_2561, _2461, _2567);
    float _2583 = fma(_2575, _2409, _2409);
    float _2585 = fma(_2577, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2587 = fma(_2531, _2531, _2579);
    float _2589 = _2581 * 0.15915493667125701904296875;
    float _2591 = fma(_2573, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2583);
    float _2593 = fma(_2585, _2575, _2585);
    float _2595 = _2553 * 6.283185482025146484375;
    float _2597 = cos(_2595);
    bool _2599 = _2177 != 0.0;
    bool _2601 = isnan(_2177);
    bool _2603 = _2599 || _2601;
    bool _2605 = isnan(0.0);
    bool _2607 = _2603 || _2605;
    float _2609 = fma(_2593, _2461, _2591);
    float _2611 = _2213 * 2.0;
    bool _2613 = _2175 == 0.0;
    bool _2615 = !_2607;
    bool _2617 = _2613 && _2615;
    float _2619 = rsqrt(_2587);
    float _2621 = _2609 * 0.15915493667125701904296875;
    float _2623 = _905 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2625 = _907 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2627 = _909 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2629 = -_2611;
    float _2631 = fma(_2285, _2629, _2285);
    float _2633 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2179);
    float _2635 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2175);
    float _2637 = _2589 * 6.283185482025146484375;
    float _2639 = sin(_2637);
    float _2641 = fma(_2213, 3.1415927410125732421875, _2631);
    float _2643 = _2627 * _2633;
    float _2645 = _2623 * _2635;
    bool _2647 = _2179 == 0.0;
    bool _2649 = _2647 && _2617;
    float _2651 = _2641 * 0.15915493667125701904296875;
    float _2653 = _2589 * 6.283185482025146484375;
    float _2655 = cos(_2653);
    float _2657 = _2525 * _2619;
    float _2659 = _2531 * _2619;
    float _2661 = _2503 * _2619;
    float _2663 = _2401 * _2657;
    float _2665 = _2621 * 6.283185482025146484375;
    float _2667 = sin(_2665);
    float _2669 = _2565 * _2639;
    float _2671 = _2597 * _2639;
    float _2673 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2177);
    float _2675 = -_2663;
    float _2677 = fma(_2361, _2661, _2675);
    float _2679 = _2625 * _2673;
    float _2681 = _2621 * 6.283185482025146484375;
    float _2683 = cos(_2681);
    float _2685 = _2597 * _2655;
    float _2687 = _2565 * _2655;
    float _2689 = fma(_2667, _2669, _2685);
    float _2691 = -_2671;
    float _2693 = fma(_2667, _2687, _2691);
    float _2695 = -_2687;
    float _2697 = fma(_2667, _2671, _2695);
    float _2699 = fma(_2667, _2685, _2669);
    float _2701 = _2689 * _2401;
    float _2703 = _2361 * _2659;
    float _2705 = _441 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2707 = _2309 * 6.283185482025146484375;
    float _2709 = sin(_2707);
    float _2711 = _2683 * _2639;
    float _2713 = _2683 * _2655;
    float _2715 = _2697 * _2401;
    float _2717 = fma(_2693, _2661, _2701);
    float _2719 = _2711 * _2401;
    float _2721 = _2565 * _2683;
    float _2723 = -_2703;
    float _2725 = fma(_2377, _2657, _2723);
    float _2727 = _2689 * _2377;
    float _2729 = _2597 * _2683;
    float _2731 = fma(_2699, _2661, _2715);
    float _2733 = fma(_2713, _2661, _2719);
    float _2735 = _2697 * _2377;
    float _2737 = _2711 * _2377;
    float _2739 = fma(_2693, _2659, _2727);
    float _2741 = fma(_2721, _2725, _2717);
    float _2743 = fma(_2729, _2725, _2731);
    float _2745 = fma(_2699, _2659, _2735);
    float _2747 = -_2667;
    float _2749 = fma(_2747, _2725, _2733);
    float _2751 = fma(_2713, _2659, _2737);
    float _2753 = _441 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2755 = fma(_2721, _2677, _2739);
    float _2757 = fma(_2729, _2677, _2745);
    float _2759 = -_2667;
    float _2761 = fma(_2759, _2677, _2751);
    float _2763 = fma(_439, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2705);
    float _2765 = fma(_439, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2753);
    float _2767 = _2679 * _2741;
    float _2769 = _2679 * _2755;
    float _2771 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2763);
    float _2773 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2765);
    float _2775 = fma(_2645, _2749, _2767);
    float _2777 = fma(_2645, _2761, _2769);
    float _2779 = _2651 * 6.283185482025146484375;
    float _2781 = sin(_2779);
    float _2783 = _2771 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2785 = _2773 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2787 = fma(_2643, _2743, _2775);
    float _2789 = fma(_2643, _2757, _2777);
    float _2791 = _2689 * _2361;
    float _2793 = _2711 * _2361;
    float _2795 = _2783 + _2787;
    float _2797 = _2785 + _2789;
    float _2799 = _2697 * _2361;
    float _2801 = fma(_2713, _2657, _2793);
    float _2803 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2805 = _2795 + _2803;
    float _2807 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2809 = _2797 + _2807;
    float _2811 = _2309 * 6.283185482025146484375;
    float _2813 = cos(_2811);
    float _2815 = fma(_2699, _2657, _2799);
    float _2817 = _2805 * _2805;
    float _2819 = _2809 * _2809;
    float _2821 = -_2147;
    float _2823 = fma(_2781, _2709, _2821);
    float _2825 = fma(_2139, _2305, _2011);
    float _2827 = fma(_439, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2311);
    float _2829 = _2817 + _2819;
    float _2831 = fma(_2139, _2823, _2147);
    float _2833 = _2377 * _2661;
    float _2835 = fma(_2177, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2825);
    float _2837 = sqrt(_2829);
    float _2839 = -_2833;
    float _2841 = fma(_2401, _2659, _2839);
    float _2843 = fma(_2693, _2657, _2791);
    float _2845 = fma(_2179, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2831);
    float _2847 = _2649 ? _2825 : _2835;
    float _2849 = -_2667;
    float _2851 = fma(_2849, _2841, _2801);
    float _2853 = fma(_2721, _2841, _2843);
    float _2855 = -_2145;
    float _2857 = fma(_2781, _2813, _2855);
    float _2859 = _2649 ? _2831 : _2845;
    float _2861 = _2847 * _2847;
    float _2863 = _2679 * _2853;
    float _2865 = fma(_2729, _2841, _2815);
    float _2867 = fma(_2139, _2857, _2145);
    float _2869 = fma(_2859, _2859, _2861);
    float _2871 = fma(_2645, _2851, _2863);
    float _2873 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2827);
    bool _2875 = _2837 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2877 = fma(_2643, _2865, _2871);
    float _2879 = _2873 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2881 = rsqrt(_2869);
    float _2883 = _2879 + _2877;
    float _2885 = _2817;
    float _2887 = _2819;
    float _2889 = _2795;
    float _2891 = _2797;
    float _2893 = _2825;
    float _2895 = _2867;
    float _2897 = _2831;
    if (!_2875)
    {
        _451 = _2883;
    }
    float _2899 = _451;
    bool _2901 = !_2875;
    float _2903 = _2899;
    if (!_2901)
    {
        float _2905 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2907 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2909 = _2837 + _2907;
        float _2911 = _2883 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2913 = rsqrt(_2829);
        float _2915 = _2909 * _2905;
        float _2917 = _2915 * 0.15915493667125701904296875;
        float _2919 = _2917 * 6.283185482025146484375;
        float _2921 = sin(_2919);
        float _2923 = _2917 * 6.283185482025146484375;
        float _2925 = cos(_2923);
        float _2927 = fma(_2921, _2911, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2929 = _2913 * _2927;
        float _2931 = _2925 + (-1.0);
        float _2933 = _2805 * _2929;
        float _2935 = _2809 * _2929;
        float _2937 = _2931 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2939 = _2933 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2941 = _2933 * _2933;
        float _2943 = _2935 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2945 = fma(_2883, _2925, _2937);
        float _2947 = _2935 * _2935;
        _2903 = _2945;
        _2885 = _2941;
        _2887 = _2947;
        _2889 = _2939;
        _2891 = _2943;
    }
    float _2949 = _2903;
    float _2951 = _2885;
    float _2953 = _2887;
    float _2955 = _2889;
    float _2957 = _2891;
    float _2959 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2961 = _2949 + _2959;
    if (!_2649)
    {
        _2893 = _2835;
    }
    float _2963 = _2893;
    float _2965 = _2859 * _2881;
    float _2967 = _2847 * _2881;
    float _2969 = fma(_2961, _2961, _2951);
    if (!_2649)
    {
        float _2971 = fma(_2175, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2867);
        _2895 = _2971;
    }
    float _2973 = _2895;
    float _2975 = _2741 * _2963;
    float _2977 = _2853 * _2963;
    float _2979 = _2969 + _2953;
    float _2981 = _2755 * _2963;
    float _2983 = _2975;
    if (!_2649)
    {
        _2897 = _2845;
    }
    float _2985 = _2897;
    float _2987 = -_2967;
    float _2989 = _2743 * _2987;
    float _2991 = -_2967;
    float _2993 = _2865 * _2991;
    float _2995 = -_2967;
    float _2997 = _2757 * _2995;
    float _2999 = sqrt(_2979);
    float _3001 = fma(_2749, _2973, _2975);
    float _3003 = fma(_2851, _2973, _2977);
    float _3005 = fma(_2761, _2973, _2981);
    float _3007 = fma(_2853, _2965, _2993);
    float _3009 = fma(_2741, _2965, _2989);
    float _3011 = fma(_2755, _2965, _2997);
    float _3013 = fma(_2743, _2985, _3001);
    float _3015 = fma(_2865, _2985, _3003);
    float _3017 = fma(_2757, _2985, _3005);
    out.m_71.x = _2041;
    out.m_71.y = _1970;
    out.m_71.z = _1976;
    out.m_71.w = _1974;
    out.m_73.x = _2749;
    out.m_73.y = _2851;
    out.m_73.z = _2761;
    bool _3019 = _2999 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3021 = isnan(_2999);
    bool _3023 = _3019 || _3021;
    bool _3025 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3027 = _3023 || _3025;
    out.m_75.x = _3009;
    out.m_75.y = _3007;
    out.m_75.z = _3011;
    out.m_77.x = _3013;
    out.m_77.y = _3015;
    out.m_77.z = _3017;
    float _3029 = _3009;
    float _3031 = _3017;
    if (!_3027)
    {
        _2983 = 1.0;
    }
    float _3033 = _2983;
    bool _3035 = !_3027;
    float _3037 = _3033;
    if (!_3035)
    {
        bool _3039 = _2999 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3041 = isnan(_2999);
        bool _3043 = _3039 || _3041;
        bool _3045 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3047 = _3043 || _3045;
        if (!_3047)
        {
            float _3049 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3051 = _2999 + _3049;
            float _3053 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3055 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3053;
            float _3057 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3059 = _3057 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3061 = 1.0 / _3055;
            float _3063 = _3051 * _3061;
            float _3065 = fma(_3063, _3059, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3037 = _3065;
            _3067 = true;
        }
        else
        {
            bool _3069 = _2999 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3071 = isnan(_2999);
            bool _3073 = _3069 || _3071;
            bool _3075 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3077 = _3073 || _3075;
            if (!_3077)
            {
                float _3079 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3081 = _2999 + _3079;
                float _3083 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3085 = _3083 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3087 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3089 = _3087 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3091 = 1.0 / _3085;
                float _3093 = _3081 * _3091;
                float _3095 = fma(_3093, _3089, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3037 = _3095;
                _3067 = true;
            }
            else
            {
                _3037 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3067 = false;
    float _3097 = _3037;
    float _3099 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3101 = _2949 + _3099;
    float _3103 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3105 = _2955 + _3103;
    float _3107 = fma(_3101, _3097, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3109 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3111 = _2957 + _3109;
    float _3113 = fma(_3105, _3097, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3115 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3117 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3119 = _3107 + _3117;
    float _3121 = fma(_3111, _3097, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3123 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3125 = _3113 + _3123;
    float _3127 = _3107 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3129 = _3119 * _3119;
    float _3131 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3133 = _3121 + _3131;
    float _3135 = fma(_3113, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3127);
    float _3137 = fma(_3125, _3125, _3129);
    float _3139 = fma(_3133, _3133, _3137);
    float _3141 = rsqrt(_3139);
    float _3143 = _3141 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3145 = _3125 * _3143;
    float _3147 = _3133 * _3143;
    float _3149 = _3145 * _3145;
    float _3151 = _3147 * _3147;
    float _3153 = _3149 + _3151;
    float _3155 = sqrt(_3153);
    bool _3157 = _3155 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3159 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3161 = _3155 + _3159;
    float _3163 = _3133;
    float _3165 = _3097;
    float _3167 = _3161;
    float _3169 = _3145;
    if (_3157)
    {
        float _3171 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3163 = _3171;
    }
    float _3173 = _3163;
    if (_3157)
    {
        float _3175 = rsqrt(_3153);
        _3165 = _3175;
    }
    float _3177 = _3165;
    float _3179 = _3177;
    if (_3157)
    {
        float _3181 = _3161 * _3173;
        _3167 = _3181;
    }
    float _3183 = _3167;
    if (_3157)
    {
        float _3185 = _3183 * 0.15915493667125701904296875;
        _3029 = _3185;
    }
    float _3187 = _3029;
    float _3189 = _3141;
    if (_3157)
    {
        float _3191 = _3187 * 6.283185482025146484375;
        float _3193 = sin(_3191);
        _3189 = _3193;
    }
    float _3195 = _3189;
    float _3197 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3199 = precise::max(0.0, _3197);
    float _3201 = _3129;
    float _3203 = _3199;
    float _3205 = _3197;
    if (_3157)
    {
        float _3207 = _3187 * 6.283185482025146484375;
        float _3209 = cos(_3207);
        _3201 = _3209;
    }
    float _3211 = _3201;
    float _3213 = -_3143;
    float _3215 = -_3199;
    float _3217 = fma(_3119, _3213, _3215);
    if (_3157)
    {
        float _3219 = _3217 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3203 = _3219;
    }
    float _3221 = _3203;
    float _3223 = sqrt(_3139);
    float _3225 = _3221;
    float _3227 = _3195;
    if (_3157)
    {
        float _3229 = fma(_3195, _3221, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3225 = _3229;
    }
    float _3231 = _3225;
    float _3233 = _3231;
    if (!_3157)
    {
        _3227 = _3147;
    }
    float _3235 = _3227;
    float _3237 = _3235;
    if (_3157)
    {
        float _3239 = _3211 + (-1.0);
        _3205 = _3239;
    }
    float _3241 = _3205;
    float _3243 = _3241;
    if (_3157)
    {
        float _3245 = _3177 * _3231;
        _3031 = _3245;
    }
    float _3247 = _3031;
    if (!_3157)
    {
        _3179 = _3217;
    }
    float _3249 = _3179;
    float _3251 = _3249;
    if (_3157)
    {
        float _3253 = _3241 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3243 = _3253;
    }
    float _3255 = _3243;
    float _3257 = _3255;
    if (_3157)
    {
        float _3259 = _3145 * _3247;
        _3169 = _3259;
    }
    float _3261 = _3169;
    if (!_3157)
    {
        _3233 = _3149;
    }
    float _3263 = _3233;
    float _3265 = _3263;
    if (_3157)
    {
        float _3267 = _3147 * _3247;
        _3237 = _3267;
    }
    float _3269 = _3237;
    if (_3157)
    {
        float _3271 = fma(_3217, _3211, _3255);
        _3251 = _3271;
    }
    float _3273 = _3251;
    if (_3157)
    {
        float _3275 = _3261 * _3261;
        _3265 = _3275;
    }
    float _3277 = _3265;
    if (!_3157)
    {
        _3257 = _3151;
    }
    float _3279 = _3257;
    float _3281 = _3279;
    if (_3157)
    {
        float _3283 = _3269 * _3269;
        _3281 = _3283;
    }
    float _3285 = _3281;
    float _3287 = fma(_3273, _3273, _3277);
    float _3289 = _3107 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3291 = _3287 + _3285;
    float _3293 = _3107 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3295 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3297 = fma(_3223, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3295);
    float _3299 = precise::clamp(_3297, 0.0, 1.0);
    float _3301 = fma(_3113, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3289);
    float _3303 = rsqrt(_3291);
    float _3305 = fma(_3113, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3293);
    float _3307 = _3107 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3309 = -_3299;
    float _3311 = _3309 + 1.0;
    float _3313 = fma(_3121, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3301);
    float _3315 = fma(_3121, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3305);
    float _3317 = fma(_3113, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3307);
    float _3319 = _3313 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3321 = _3315 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3323 = fma(_3121, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3317);
    float _3325 = abs(_3311);
    float _3327 = log2(_3325);
    float _3329 = _3321 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3331 = _3323 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3333 = _3303 * _3261;
    float _3335 = _3303 * _3273;
    float _3337 = _3331 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3339 = -_3329;
    float _3341 = fma(_3339, _3115, 1.0);
    float _3343 = _3333 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3345 = fma(_3121, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3135);
    float _3347 = fma(_3319, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3337);
    float _3349 = _3303 * _3269;
    float _3351 = -_3343;
    float _3353 = fma(_3335, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3351);
    float _3355 = _3345 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3357 = fma(_3321, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3347);
    float _3359 = _3327 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3361 = -_3349;
    float _3363 = fma(_3361, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3353);
    float _3365 = _3331 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3367 = fma(_3355, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3357);
    float _3369 = exp2(_3359);
    float _3371 = fma(_3363, -0.5, 0.5);
    float _3373 = _3331 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3375 = fma(_3319, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3365);
    float _3377 = fma(_3363, 0.5, 0.5);
    float _3379 = fma(_3319, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3373);
    float _3381 = _3335 + 1.0;
    float _3383 = log2(_3341);
    float _3385 = fma(_3321, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3375);
    float _3387 = fma(_3321, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3379);
    float _3389 = fma(_3377, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3391 = fma(_3377, _3389, -0.212114393711090087890625);
    float _3393 = 1.0 / _3367;
    float _3395 = -_3335;
    float _3397 = fma(_3369, _3381, _3395);
    float _3399 = fma(_3355, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3385);
    float _3401 = fma(_3355, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3387);
    float _3403 = fma(_3377, _3391, 1.570728778839111328125);
    float _3405 = sqrt(_3371);
    float _3407 = _3383 * 0.693147182464599609375;
    float _3409 = _3407 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3411 = _3399 * _3393;
    float _3413 = _3401 * _3393;
    float _3415 = fma(_3411, 0.5, 0.5);
    float _3417 = fma(_3413, -0.5, 0.5);
    float _3419 = fma(_3397, 0.5, 0.5);
    float _3421 = _3405 * 0.636619746685028076171875;
    float3 _8640 = float3(_3415, _3417, _3409);
    float _3423 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8640, float3(0.0), isnan(_8640)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8640, float3(0.0), isnan(_8640)), level(0.0)).x;
    float3 _8651 = float3(_3415, _3417, _3409);
    float4 _3425 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8651, float3(0.0), isnan(_8651)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8651, float3(0.0), isnan(_8651)), level(0.0)).xyzw;
    float _3427 = _3425.x;
    float _3429 = _3425.y;
    float _3431 = _3425.z;
    float _3433 = _3425.w;
    float _3435 = -_3403;
    float _3437 = fma(_3421, _3435, 1.0);
    float2 _8672 = float2(_3437, _3419);
    float3 _3441 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8672, float2(0.0), isnan(_8672)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8672, float2(0.0), isnan(_8672)), level(0.0)).xyz;
    float _3443 = _3441.x;
    float _3445 = _3441.y;
    float _3447 = _3441.z;
    float _3449 = _3327 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3451 = _3331 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_79.x = _2783;
    out.m_79.y = _2879;
    out.m_79.z = _2785;
    float _3453 = fma(_3319, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3451);
    float _3455 = exp2(_3449);
    out.m_81.x = _3113;
    out.m_81.y = _3107;
    out.m_81.z = _3121;
    float _3457 = fma(_3321, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3453);
    float _3459 = fma(_3355, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3457);
    float _3461 = _3459 + _3367;
    out.gl_Position.x = _3399;
    out.gl_Position.y = _3401;
    out.gl_Position.z = _3459;
    out.gl_Position.w = _3367;
    float _3463 = _3461 * 0.5;
    float _3465 = -_3455;
    float _3467 = _3465 + 1.0;
    float _3469 = _3467 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3471 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_83.z = _3463;
    out.m_83.w = _3367;
    float _3473 = -_3469;
    float _3475 = _3473 + 1.0;
    out.m_49.x = _3471;
    float _3477 = _3469 * _3423;
    float _3479 = _3433 * _3477;
    float _3481 = _3447 * _3477;
    float _3483 = fma(_3443, _3479, _3427);
    float _3485 = fma(_3445, _3479, _3429);
    float _3487 = _3433 * _3475;
    float _3489 = fma(_3433, _3481, _3431);
    out.m_85.x = _3483;
    out.m_85.y = _3485;
    out.m_85.z = _3489;
    out.m_85.w = _3487;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}


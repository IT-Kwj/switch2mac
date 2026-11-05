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
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_40 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _47 = gl_FragCoord.w;
    float _49 = in.m_33.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_33.y;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_35.x;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_35.y;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_37.x;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_37.y;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = 1.0 / _47;
    float _87 = _85 * _53;
    float _89 = _85 * _59;
    float _91 = _85 * _65;
    float _93 = _85 * _71;
    float _95 = _85 * _77;
    float _97 = _85 * _83;
    float2 _345 = float2(_87, _89);
    float4 _100 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_345, float2(0.0), isnan(_345))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_345, float2(0.0), isnan(_345))).xyzw;
    float _102 = _100.x;
    float _104 = _100.y;
    float _106 = _100.z;
    float _108 = _100.w;
    float2 _364 = float2(_91, _93);
    float4 _110 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_364, float2(0.0), isnan(_364))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_364, float2(0.0), isnan(_364))).xyzw;
    float _112 = _110.x;
    float _114 = _110.y;
    float _116 = _110.z;
    float _118 = _110.w;
    float2 _380 = float2(_95, _97);
    float4 _120 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_380, float2(0.0), isnan(_380))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_380, float2(0.0), isnan(_380))).xyzw;
    float _122 = _120.x;
    float _124 = _120.y;
    float _126 = _120.z;
    float _128 = _120.w;
    int _131 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[8].x) & 128;
    bool _135 = _131 != 0;
    int _137 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[8].x) & 32768;
    bool _139 = _137 != 0;
    float _141 = _102 * _112;
    float _143 = precise::max(_108, _118);
    float _145 = _106 * _116;
    float _147 = _143;
    if (_135)
    {
        float _149 = precise::min(_108, _118);
        _147 = _149;
    }
    float _151 = _147;
    float _153 = _104 * _114;
    bool _155 = _141 >= 0.5;
    bool _157 = isnan(_141);
    bool _159 = _155 || _157;
    bool _161 = isnan(0.5);
    bool _163 = _159 || _161;
    float _165 = _141 * 2.0;
    float _167 = precise::max(_151, _128);
    float _169 = _153 * 2.0;
    float _171 = _167;
    if (_139)
    {
        float _173 = precise::min(_151, _128);
        _171 = _173;
    }
    float _175 = _171;
    float _177 = -_122;
    float _179 = _177 + 1.0;
    float _181 = -_165;
    float _183 = _181 + 2.0;
    bool _185 = _153 >= 0.5;
    bool _187 = isnan(_153);
    bool _189 = _185 || _187;
    bool _191 = isnan(0.5);
    bool _193 = _189 || _191;
    float _195 = _122 * _165;
    bool _197 = _145 >= 0.5;
    bool _199 = isnan(_145);
    bool _201 = _197 || _199;
    bool _203 = isnan(0.5);
    bool _205 = _201 || _203;
    float _207 = fma(_175, (*spvDescriptorSet0.fp_c3)._m0[0].w, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _209 = precise::clamp(_207, 0.0, 1.0);
    float _211 = _124 * _169;
    float _213 = _195;
    float _215 = _211;
    if (_163)
    {
        float _217 = -_183;
        float _219 = fma(_217, _179, 1.0);
        _213 = _219;
    }
    float _221 = _213;
    float _223 = -_124;
    float _225 = _223 + 1.0;
    float _227 = -_169;
    float _229 = _227 + 2.0;
    bool _231 = _209 != 0.0;
    bool _233 = isnan(_209);
    bool _235 = _231 || _233;
    bool _237 = isnan(0.0);
    bool _239 = _235 || _237;
    float _241 = _145 * 2.0;
    float _243 = -_126;
    float _245 = _243 + 1.0;
    if (_193)
    {
        float _247 = -_229;
        float _249 = fma(_247, _225, 1.0);
        _215 = _249;
    }
    float _251 = _215;
    float _253 = -_241;
    float _255 = _253 + 2.0;
    float _257 = _126 * _241;
    float _259 = _257;
    if (_205)
    {
        float _261 = -_255;
        float _263 = fma(_261, _245, 1.0);
        _259 = _263;
    }
    float _265 = _259;
    float _267 = fma(_221, (*spvDescriptorSet0.fp_c3)._m0[0].x, (*spvDescriptorSet0.fp_c3)._m0[1].x);
    float _269 = fma(_251, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _271 = fma(_265, (*spvDescriptorSet0.fp_c3)._m0[0].z, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    if (_239)
    {
        out.m_40.x = _267;
        out.m_40.y = _269;
        out.m_40.z = _271;
        out.m_40.w = _209;
        return out;
    }
    discard_fragment();
    return out;
}


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
    texture2d<float> fp_t_tcb_A [[id(1)]];
    sampler fp_t_tcb_ASmplr [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_40 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
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
    float _73 = in.m_37.y;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_37.x;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = 1.0 / _47;
    float _87 = _85 * _53;
    float _89 = _85 * _59;
    float _91 = _85 * _65;
    float _93 = _85 * _71;
    float _95 = _85 * _77;
    float _97 = _85 * _83;
    float2 _355 = float2(_87, _89);
    float4 _100 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_355, float2(0.0), isnan(_355))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_355, float2(0.0), isnan(_355))).xyzw;
    float _102 = _100.x;
    float _104 = _100.y;
    float _106 = _100.z;
    float _108 = _100.w;
    float2 _374 = float2(_91, _93);
    float4 _110 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_374, float2(0.0), isnan(_374))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_374, float2(0.0), isnan(_374))).xyzw;
    float _112 = _110.x;
    float _114 = _110.y;
    float _116 = _110.z;
    float _118 = _110.w;
    float2 _390 = float2(_97, _95);
    float4 _120 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_390, float2(0.0), isnan(_390))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_390, float2(0.0), isnan(_390))).xyzw;
    float _122 = _120.x;
    float _124 = _120.y;
    float _126 = _120.z;
    float _128 = _120.w;
    int _131 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[8].x) & 128;
    bool _135 = _131 != 0;
    int _137 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[8].x) & 32768;
    bool _139 = _137 != 0;
    float _141 = -_108;
    float _143 = _141 + 1.0;
    float _145 = _112 * _143;
    float _147 = precise::max(_118, _108);
    float _149 = _114 * _143;
    float _151 = _147;
    if (_135)
    {
        float _153 = precise::min(_118, _108);
        _151 = _153;
    }
    float _155 = _151;
    float _157 = fma(_102, _108, _145);
    float _159 = _116 * _143;
    float _161 = fma(_104, _108, _149);
    float _163 = precise::max(_155, _128);
    float _165 = -_122;
    float _167 = _165 + 1.0;
    bool _169 = _157 >= 0.5;
    bool _171 = isnan(_157);
    bool _173 = _169 || _171;
    bool _175 = isnan(0.5);
    bool _177 = _173 || _175;
    float _179 = fma(_106, _108, _159);
    float _181 = _163;
    if (_139)
    {
        float _183 = precise::min(_155, _128);
        _181 = _183;
    }
    float _185 = _181;
    float _187 = _157 * 2.0;
    float _189 = _161 * 2.0;
    bool _191 = _161 >= 0.5;
    bool _193 = isnan(_161);
    bool _195 = _191 || _193;
    bool _197 = isnan(0.5);
    bool _199 = _195 || _197;
    float _201 = _122 * _187;
    float _203 = -_187;
    float _205 = _203 + 2.0;
    float _207 = fma(_185, (*spvDescriptorSet0.fp_c3)._m0[0].w, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _209 = precise::clamp(_207, 0.0, 1.0);
    bool _211 = _179 >= 0.5;
    bool _213 = isnan(_179);
    bool _215 = _211 || _213;
    bool _217 = isnan(0.5);
    bool _219 = _215 || _217;
    float _221 = -_124;
    float _223 = _221 + 1.0;
    float _225 = _124 * _189;
    float _227 = _201;
    float _229 = _225;
    if (_177)
    {
        float _231 = -_205;
        float _233 = fma(_231, _167, 1.0);
        _227 = _233;
    }
    float _235 = _227;
    bool _237 = _209 != 0.0;
    bool _239 = isnan(_209);
    bool _241 = _237 || _239;
    bool _243 = isnan(0.0);
    bool _245 = _241 || _243;
    float _247 = -_189;
    float _249 = _247 + 2.0;
    float _251 = _179 * 2.0;
    if (_199)
    {
        float _253 = -_249;
        float _255 = fma(_253, _223, 1.0);
        _229 = _255;
    }
    float _257 = _229;
    float _259 = -_126;
    float _261 = _259 + 1.0;
    float _263 = -_251;
    float _265 = _263 + 2.0;
    float _267 = _126 * _251;
    float _269 = _267;
    if (_219)
    {
        float _271 = -_265;
        float _273 = fma(_271, _261, 1.0);
        _269 = _273;
    }
    float _275 = _269;
    float _277 = fma(_235, (*spvDescriptorSet0.fp_c3)._m0[0].x, (*spvDescriptorSet0.fp_c3)._m0[1].x);
    float _279 = fma(_257, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _281 = fma(_275, (*spvDescriptorSet0.fp_c3)._m0[0].z, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    if (_245)
    {
        out.m_40.x = _277;
        out.m_40.y = _279;
        out.m_40.z = _281;
        out.m_40.w = _209;
        return out;
    }
    discard_fragment();
    return out;
}


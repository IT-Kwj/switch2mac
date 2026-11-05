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
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    sampler fp_t_tcb_CSmplr_w [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _41 = in.m_31.x;
    float _43 = in.m_31.y;
    float _45 = _41 + (*spvDescriptorSet0.fp_c3)._m0[1].z;
    float2 _310 = float2(_41, _43);
    float3 _49 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_310, float2(0.0), isnan(_310))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_310, float2(0.0), isnan(_310))).xyz;
    float _51 = _49.x;
    float _53 = _49.y;
    float _55 = _49.z;
    float2 _327 = float2(_41, _43);
    float3 _57 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_327, float2(0.0), isnan(_327))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_327, float2(0.0), isnan(_327))).xyz;
    float _59 = _57.x;
    float _61 = _57.y;
    float _63 = _57.z;
    float _65 = -(*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _67 = _41 + _65;
    float _69 = _43 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _71 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _73 = _43 + _71;
    float2 _358 = float2(_45, _43);
    float3 _75 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_358, float2(0.0), isnan(_358))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_358, float2(0.0), isnan(_358))).xyz;
    float _77 = _75.x;
    float _79 = _75.y;
    float _81 = _75.z;
    float2 _372 = float2(_67, _43);
    float3 _83 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_372, float2(0.0), isnan(_372))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_372, float2(0.0), isnan(_372))).xyz;
    float _85 = _83.x;
    float _87 = _83.y;
    float _89 = _83.z;
    float2 _386 = float2(_41, _69);
    float3 _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_386, float2(0.0), isnan(_386))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_386, float2(0.0), isnan(_386))).xyz;
    float _93 = _91.x;
    float _95 = _91.y;
    float _97 = _91.z;
    float2 _400 = float2(_41, _73);
    float3 _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_400, float2(0.0), isnan(_400))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_400, float2(0.0), isnan(_400))).xyz;
    float _101 = _99.x;
    float _103 = _99.y;
    float _105 = _99.z;
    float _107 = _53 + (-0.5);
    float _109 = _51 + (-0.5);
    float _111 = _61 + (-0.5);
    float _113 = _55 + (-0.5);
    float _115 = _107 * _107;
    float _117 = _79 + (-0.5);
    float _119 = _77 + (-0.5);
    float _121 = _59 + (-0.5);
    float _123 = _87 + (-0.5);
    float _125 = fma(_109, _109, _115);
    float _127 = _117 * _117;
    float _129 = _111 * _107;
    float _131 = _85 + (-0.5);
    float _133 = _123 * _123;
    float _135 = fma(_113, _113, _125);
    float _137 = _95 + (-0.5);
    float _139 = _81 + (-0.5);
    float _141 = fma(_119, _119, _127);
    float _143 = fma(_121, _109, _129);
    float _145 = fma(_131, _131, _133);
    float _147 = _93 + (-0.5);
    float _149 = _137 * _137;
    float _151 = fma(_139, _139, _141);
    float _153 = _89 + (-0.5);
    float _155 = _63 + (-0.5);
    float _157 = _103 + (-0.5);
    float _159 = _97 + (-0.5);
    float _161 = fma(_147, _147, _149);
    float _163 = fma(_153, _153, _145);
    float _165 = fma(_155, _113, _143);
    float _167 = _101 + (-0.5);
    float _169 = _157 * _157;
    float _171 = rsqrt(_135);
    float _173 = fma(_159, _159, _161);
    float _175 = _111 * _117;
    float _177 = _105 + (-0.5);
    float _179 = fma(_167, _167, _169);
    float _181 = fma(_121, _119, _175);
    float _183 = _111 * _123;
    float _185 = rsqrt(_151);
    float _187 = fma(_177, _177, _179);
    float _189 = fma(_155, _139, _181);
    float _191 = fma(_121, _131, _183);
    float _193 = _111 * _137;
    float _195 = _111 * _157;
    float _197 = fma(_155, _153, _191);
    float _199 = rsqrt(_163);
    float _201 = _171 * _165;
    float _203 = fma(_121, _147, _193);
    float _205 = fma(_121, _167, _195);
    float _207 = fma(_155, _159, _203);
    float _209 = fma(_155, _177, _205);
    float _211 = rsqrt(_173);
    float _213 = _185 * _189;
    float _215 = -_201;
    float _217 = -_213;
    float _219 = precise::min(_215, _217);
    float _221 = rsqrt(_187);
    float _223 = _199 * _197;
    bool _227 = _213 > _201;
    float _229 = -_223;
    float _231 = precise::min(_219, _229);
    float _233 = _211 * _207;
    float _235 = -_223;
    bool _237 = _219 > _235;
    bool _239 = !_227;
    int _242 = _239 ? 0 : as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _244 = -_233;
    bool _246 = _231 > _244;
    float _248 = -_233;
    float _250 = precise::min(_231, _248);
    float _252 = _221 * _209;
    bool _254 = !_237;
    float _256 = -(*spvDescriptorSet0.fp_c3)._m0[1].z;
    int _258 = _254 ? _242 : as_type<int>(_256);
    float _260 = -_252;
    bool _262 = _250 > _260;
    bool _264 = !_246;
    int _266 = _264 ? _258 : 0;
    bool _268 = !_246;
    int _270 = _268 ? int(0x80000000) : as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w);
    bool _272 = !_262;
    float _274 = _272 ? as_type<float>(_266) : (-0.0);
    bool _276 = !_262;
    float _278 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _280 = _276 ? as_type<float>(_270) : _278;
    float _282 = _41 + _274;
    float _284 = _43 + _280;
    float2 _675 = float2(_282, _284);
    float3 _286 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_675, float2(0.0), isnan(_675))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_675, float2(0.0), isnan(_675))).xyz;
    float _288 = _286.x;
    float _290 = _286.y;
    float _292 = _286.z;
    out.m_34.x = _288;
    out.m_34.y = _290;
    out.m_34.z = _292;
    return out;
}


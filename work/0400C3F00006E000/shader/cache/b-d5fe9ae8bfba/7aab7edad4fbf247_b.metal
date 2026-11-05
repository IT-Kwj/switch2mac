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
    texture2d<float> fp_t_tcb_C [[id(1)]];
    sampler fp_t_tcb_CSmplr [[id(2)]];
    texture2d<float> fp_t_tcb_E [[id(3)]];
    sampler fp_t_tcb_ESmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    sampler fp_t_tcb_ESmplr_w [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
    float4 m_38 [[color(1)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _45 = in.m_33.x;
    float _47 = in.m_33.y;
    float _49 = _45 + (*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _51 = -(*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _53 = _45 + _51;
    float2 _305 = float2(_45, _47);
    float2 _57 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_305, float2(0.0), isnan(_305))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_305, float2(0.0), isnan(_305))).xy;
    float _59 = _57.x;
    float _61 = _57.y;
    float _63 = _47 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float2 _325 = float2(_49, _47);
    float2 _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_325, float2(0.0), isnan(_325))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_325, float2(0.0), isnan(_325))).xy;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _73 = _47 + _71;
    float2 _343 = float2(_53, _47);
    float2 _75 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_343, float2(0.0), isnan(_343))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_343, float2(0.0), isnan(_343))).xy;
    float _77 = _75.x;
    float _79 = _75.y;
    float2 _355 = float2(_45, _47);
    float2 _81 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_355, float2(0.0), isnan(_355))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_355, float2(0.0), isnan(_355))).xy;
    float _83 = _81.x;
    float _85 = _81.y;
    float2 _367 = float2(_45, _63);
    float2 _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_367, float2(0.0), isnan(_367))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_367, float2(0.0), isnan(_367))).xy;
    float _89 = _87.x;
    float _91 = _87.y;
    float2 _379 = float2(_45, _73);
    float2 _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_379, float2(0.0), isnan(_379))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_379, float2(0.0), isnan(_379))).xy;
    float _95 = _93.x;
    float _97 = _93.y;
    float _99 = _61 + (-0.5);
    float _101 = _59 + (-0.5);
    float _103 = _69 + (-0.5);
    float _105 = _67 + (-0.5);
    float _107 = _99 * _99;
    float _109 = _79 + (-0.5);
    float _111 = _103 * _103;
    float _113 = _77 + (-0.5);
    float _115 = _85 + (-0.5);
    float _117 = fma(_101, _101, _107);
    float _119 = fma(_105, _105, _111);
    float _121 = _109 * _109;
    float _123 = _91 + (-0.5);
    float _125 = _83 + (-0.5);
    float _127 = _115 * _99;
    float _129 = _117 + 1.0;
    float _131 = _119 + 1.0;
    float _133 = fma(_113, _113, _121);
    float _135 = _89 + (-0.5);
    float _137 = _123 * _123;
    float _139 = _97 + (-0.5);
    float _141 = fma(_125, _101, _127);
    float _143 = _133 + 1.0;
    float _145 = fma(_135, _135, _137);
    float _147 = _95 + (-0.5);
    float _149 = _139 * _139;
    float _151 = rsqrt(_129);
    float _153 = _145 + 1.0;
    float _155 = _115 * _103;
    float _157 = fma(_147, _147, _149);
    float _159 = _115 * _109;
    float _161 = _141 + 1.0;
    float _163 = fma(_125, _105, _155);
    float _165 = _157 + 1.0;
    float _167 = rsqrt(_131);
    float _169 = fma(_125, _113, _159);
    float _171 = _163 + 1.0;
    float _173 = _115 * _123;
    float _175 = _115 * _139;
    float _177 = _169 + 1.0;
    float _179 = fma(_125, _135, _173);
    float _181 = rsqrt(_143);
    float _183 = _151 * _161;
    float _185 = fma(_125, _147, _175);
    float _187 = _179 + 1.0;
    float _189 = _185 + 1.0;
    float _191 = rsqrt(_153);
    float _193 = _167 * _171;
    float _195 = -_183;
    float _197 = -_193;
    float _199 = precise::min(_195, _197);
    float _201 = rsqrt(_165);
    float _203 = _181 * _177;
    bool _207 = _193 > _183;
    float _209 = -_203;
    float _211 = precise::min(_199, _209);
    float _213 = _191 * _187;
    float _215 = -_203;
    bool _217 = _199 > _215;
    bool _219 = !_207;
    int _222 = _219 ? 0 : as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _224 = -_213;
    bool _226 = _211 > _224;
    float _228 = -_213;
    float _230 = precise::min(_211, _228);
    float _232 = _201 * _189;
    bool _234 = !_217;
    float _236 = -(*spvDescriptorSet0.fp_c3)._m0[1].z;
    int _238 = _234 ? _222 : as_type<int>(_236);
    float _240 = -_232;
    bool _242 = _230 > _240;
    bool _244 = !_226;
    int _246 = _244 ? _238 : 0;
    bool _248 = !_226;
    int _250 = _248 ? int(0x80000000) : as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w);
    bool _252 = !_242;
    float _254 = _252 ? as_type<float>(_246) : (-0.0);
    bool _256 = !_242;
    float _258 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _260 = _256 ? as_type<float>(_250) : _258;
    float _262 = _45 + _254;
    float _264 = _47 + _260;
    float2 _621 = float2(_262, _264);
    float3 _268 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_621, float2(0.0), isnan(_621))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_621, float2(0.0), isnan(_621))).xyz;
    float _270 = _268.x;
    float _272 = _268.y;
    float _274 = _268.z;
    float2 _635 = float2(_262, _264);
    float3 _276 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_635, float2(0.0), isnan(_635))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_635, float2(0.0), isnan(_635))).xyz;
    float _278 = _276.x;
    float _280 = _276.y;
    float _282 = _276.z;
    out.m_36.x = _270;
    out.m_36.y = _272;
    out.m_36.z = _274;
    out.m_38.x = _278;
    out.m_38.y = _280;
    out.m_38.z = _282;
    return out;
}


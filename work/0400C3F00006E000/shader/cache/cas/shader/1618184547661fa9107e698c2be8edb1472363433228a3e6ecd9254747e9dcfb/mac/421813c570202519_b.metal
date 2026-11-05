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
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_12 [[id(5)]];
    sampler fp_t_tcb_12Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    texture2d<float> fp_t_tcb_E [[id(9)]];
    sampler fp_t_tcb_ESmplr [[id(10)]];
    texture2d<float> fp_t_tcb_8 [[id(11)]];
    sampler fp_t_tcb_8Smplr [[id(12)]];
    sampler fp_t_tcb_CSmplr_w [[id(13)]];
    sampler fp_t_tcb_10Smplr_w [[id(14)]];
    sampler fp_t_tcb_12Smplr_w [[id(15)]];
    sampler fp_t_tcb_ASmplr_w [[id(16)]];
    sampler fp_t_tcb_ESmplr_w [[id(17)]];
    sampler fp_t_tcb_8Smplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_40 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _47 = in.m_37.x;
    float _49 = in.m_37.y;
    float _51 = _47 + (*spvDescriptorSet0.fp_c3)._m0[1].z;
    float2 _346 = float2(_47, _49);
    float3 _55 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_346, float2(0.0), isnan(_346))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_346, float2(0.0), isnan(_346))).xyz;
    float _57 = _55.x;
    float _59 = _55.y;
    float _61 = _55.z;
    float2 _363 = float2(_47, _49);
    float3 _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_363, float2(0.0), isnan(_363))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_363, float2(0.0), isnan(_363))).xyz;
    float _65 = _63.x;
    float _67 = _63.y;
    float _69 = _63.z;
    float _71 = -(*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _73 = _47 + _71;
    float _75 = _49 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _77 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _79 = _49 + _77;
    float2 _394 = float2(_51, _49);
    float3 _81 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_394, float2(0.0), isnan(_394))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_394, float2(0.0), isnan(_394))).xyz;
    float _83 = _81.x;
    float _85 = _81.y;
    float _87 = _81.z;
    float2 _408 = float2(_73, _49);
    float3 _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_408, float2(0.0), isnan(_408))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_408, float2(0.0), isnan(_408))).xyz;
    float _91 = _89.x;
    float _93 = _89.y;
    float _95 = _89.z;
    float2 _422 = float2(_47, _75);
    float3 _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_422, float2(0.0), isnan(_422))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_422, float2(0.0), isnan(_422))).xyz;
    float _99 = _97.x;
    float _101 = _97.y;
    float _103 = _97.z;
    float2 _436 = float2(_47, _79);
    float3 _105 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_436, float2(0.0), isnan(_436))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_436, float2(0.0), isnan(_436))).xyz;
    float _107 = _105.x;
    float _109 = _105.y;
    float _111 = _105.z;
    float _113 = _59 + (-0.5);
    float _115 = _57 + (-0.5);
    float _117 = _67 + (-0.5);
    float _119 = _61 + (-0.5);
    float _121 = _113 * _113;
    float _123 = _85 + (-0.5);
    float _125 = _83 + (-0.5);
    float _127 = _65 + (-0.5);
    float _129 = _93 + (-0.5);
    float _131 = fma(_115, _115, _121);
    float _133 = _123 * _123;
    float _135 = _117 * _113;
    float _137 = _91 + (-0.5);
    float _139 = _129 * _129;
    float _141 = fma(_119, _119, _131);
    float _143 = _101 + (-0.5);
    float _145 = _87 + (-0.5);
    float _147 = fma(_125, _125, _133);
    float _149 = fma(_127, _115, _135);
    float _151 = fma(_137, _137, _139);
    float _153 = _99 + (-0.5);
    float _155 = _143 * _143;
    float _157 = fma(_145, _145, _147);
    float _159 = _95 + (-0.5);
    float _161 = _69 + (-0.5);
    float _163 = _109 + (-0.5);
    float _165 = _103 + (-0.5);
    float _167 = fma(_153, _153, _155);
    float _169 = fma(_159, _159, _151);
    float _171 = fma(_161, _119, _149);
    float _173 = _107 + (-0.5);
    float _175 = _163 * _163;
    float _177 = rsqrt(_141);
    float _179 = fma(_165, _165, _167);
    float _181 = _117 * _123;
    float _183 = _111 + (-0.5);
    float _185 = fma(_173, _173, _175);
    float _187 = fma(_127, _125, _181);
    float _189 = _117 * _129;
    float _191 = rsqrt(_157);
    float _193 = fma(_183, _183, _185);
    float _195 = fma(_161, _145, _187);
    float _197 = fma(_127, _137, _189);
    float _199 = _117 * _143;
    float _201 = _117 * _163;
    float _203 = fma(_161, _159, _197);
    float _205 = rsqrt(_169);
    float _207 = _177 * _171;
    float _209 = fma(_127, _153, _199);
    float _211 = fma(_127, _173, _201);
    float _213 = fma(_161, _165, _209);
    float _215 = fma(_161, _183, _211);
    float _217 = rsqrt(_179);
    float _219 = _191 * _195;
    float _221 = -_207;
    float _223 = -_219;
    float _225 = precise::min(_221, _223);
    float _227 = rsqrt(_193);
    float _229 = _205 * _203;
    bool _233 = _219 > _207;
    float _235 = -_229;
    float _237 = precise::min(_225, _235);
    float _239 = _217 * _213;
    float _241 = -_229;
    bool _243 = _225 > _241;
    bool _245 = !_233;
    int _248 = _245 ? 0 : as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _250 = -_239;
    bool _252 = _237 > _250;
    float _254 = -_239;
    float _256 = precise::min(_237, _254);
    float _258 = _227 * _215;
    bool _260 = !_243;
    float _262 = -(*spvDescriptorSet0.fp_c3)._m0[1].z;
    int _264 = _260 ? _248 : as_type<int>(_262);
    float _266 = -_258;
    bool _268 = _256 > _266;
    bool _270 = !_252;
    int _272 = _270 ? _264 : 0;
    bool _274 = !_252;
    int _276 = _274 ? int(0x80000000) : as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w);
    bool _278 = !_268;
    float _280 = _278 ? as_type<float>(_272) : (-0.0);
    bool _282 = !_268;
    float _284 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _286 = _282 ? as_type<float>(_276) : _284;
    float _288 = _47 + _280;
    float _290 = _49 + _286;
    float2 _711 = float2(_47, _49);
    float _292 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_711, float2(0.0), isnan(_711))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_711, float2(0.0), isnan(_711))).y;
    float2 _719 = float2(_288, _290);
    float3 _294 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_719, float2(0.0), isnan(_719))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_719, float2(0.0), isnan(_719))).xyz;
    float _296 = _294.x;
    float _298 = _294.y;
    float _300 = _294.z;
    float2 _733 = float2(_47, _49);
    float3 _302 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_733, float2(0.0), isnan(_733))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_733, float2(0.0), isnan(_733))).xyz;
    float _304 = _302.x;
    float _306 = _302.y;
    float _308 = _302.z;
    float2 _747 = float2(_288, _290);
    float3 _310 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_747, float2(0.0), isnan(_747))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_747, float2(0.0), isnan(_747))).xyz;
    float _312 = _310.x;
    float _314 = _310.y;
    float _316 = _310.z;
    float _318 = _298 * _292;
    float _320 = _296 * _292;
    float _322 = _300 * _292;
    float _324 = fma(_314, _306, _318);
    float _326 = fma(_312, _304, _320);
    float _328 = fma(_316, _308, _322);
    out.m_40.x = _326;
    out.m_40.y = _324;
    out.m_40.z = _328;
    return out;
}


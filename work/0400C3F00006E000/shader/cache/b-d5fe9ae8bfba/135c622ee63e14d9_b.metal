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
    float _53 = -(*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _55 = _47 + _53;
    float2 _329 = float2(_47, _49);
    float2 _59 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_329, float2(0.0), isnan(_329))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_329, float2(0.0), isnan(_329))).xy;
    float _61 = _59.x;
    float _63 = _59.y;
    float _65 = _49 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float2 _349 = float2(_51, _49);
    float2 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_349, float2(0.0), isnan(_349))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_349, float2(0.0), isnan(_349))).xy;
    float _69 = _67.x;
    float _71 = _67.y;
    float _73 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _75 = _49 + _73;
    float2 _367 = float2(_55, _49);
    float2 _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_367, float2(0.0), isnan(_367))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_367, float2(0.0), isnan(_367))).xy;
    float _79 = _77.x;
    float _81 = _77.y;
    float2 _379 = float2(_47, _49);
    float2 _83 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_379, float2(0.0), isnan(_379))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_379, float2(0.0), isnan(_379))).xy;
    float _85 = _83.x;
    float _87 = _83.y;
    float2 _391 = float2(_47, _65);
    float2 _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_391, float2(0.0), isnan(_391))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_391, float2(0.0), isnan(_391))).xy;
    float _91 = _89.x;
    float _93 = _89.y;
    float2 _403 = float2(_47, _75);
    float2 _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_403, float2(0.0), isnan(_403))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_403, float2(0.0), isnan(_403))).xy;
    float _97 = _95.x;
    float _99 = _95.y;
    float _101 = _63 + (-0.5);
    float _103 = _61 + (-0.5);
    float _105 = _71 + (-0.5);
    float _107 = _69 + (-0.5);
    float _109 = _101 * _101;
    float _111 = _81 + (-0.5);
    float _113 = _105 * _105;
    float _115 = _79 + (-0.5);
    float _117 = _87 + (-0.5);
    float _119 = fma(_103, _103, _109);
    float _121 = fma(_107, _107, _113);
    float _123 = _111 * _111;
    float _125 = _93 + (-0.5);
    float _127 = _85 + (-0.5);
    float _129 = _117 * _101;
    float _131 = _119 + 1.0;
    float _133 = _121 + 1.0;
    float _135 = fma(_115, _115, _123);
    float _137 = _91 + (-0.5);
    float _139 = _125 * _125;
    float _141 = _99 + (-0.5);
    float _143 = fma(_127, _103, _129);
    float _145 = _135 + 1.0;
    float _147 = fma(_137, _137, _139);
    float _149 = _97 + (-0.5);
    float _151 = _141 * _141;
    float _153 = rsqrt(_131);
    float _155 = _147 + 1.0;
    float _157 = _117 * _105;
    float _159 = fma(_149, _149, _151);
    float _161 = _117 * _111;
    float _163 = _143 + 1.0;
    float _165 = fma(_127, _107, _157);
    float _167 = _159 + 1.0;
    float _169 = rsqrt(_133);
    float _171 = fma(_127, _115, _161);
    float _173 = _165 + 1.0;
    float _175 = _117 * _125;
    float _177 = _117 * _141;
    float _179 = _171 + 1.0;
    float _181 = fma(_127, _137, _175);
    float _183 = rsqrt(_145);
    float _185 = _153 * _163;
    float _187 = fma(_127, _149, _177);
    float _189 = _181 + 1.0;
    float _191 = _187 + 1.0;
    float _193 = rsqrt(_155);
    float _195 = _169 * _173;
    float _197 = -_185;
    float _199 = -_195;
    float _201 = precise::min(_197, _199);
    float _203 = rsqrt(_167);
    float _205 = _183 * _179;
    bool _209 = _195 > _185;
    float _211 = -_205;
    float _213 = precise::min(_201, _211);
    float _215 = _193 * _189;
    float _217 = -_205;
    bool _219 = _201 > _217;
    bool _221 = !_209;
    int _224 = _221 ? 0 : as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _226 = -_215;
    bool _228 = _213 > _226;
    float _230 = -_215;
    float _232 = precise::min(_213, _230);
    float _234 = _203 * _191;
    bool _236 = !_219;
    float _238 = -(*spvDescriptorSet0.fp_c3)._m0[1].z;
    int _240 = _236 ? _224 : as_type<int>(_238);
    float _242 = -_234;
    bool _244 = _232 > _242;
    bool _246 = !_228;
    int _248 = _246 ? _240 : 0;
    bool _250 = !_228;
    int _252 = _250 ? int(0x80000000) : as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w);
    bool _254 = !_244;
    float _256 = _254 ? as_type<float>(_248) : (-0.0);
    bool _258 = !_244;
    float _260 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _262 = _258 ? as_type<float>(_252) : _260;
    float _264 = _47 + _256;
    float _266 = _49 + _262;
    float2 _645 = float2(_47, _49);
    float _268 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_645, float2(0.0), isnan(_645))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_645, float2(0.0), isnan(_645))).y;
    float2 _653 = float2(_264, _266);
    float3 _272 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_653, float2(0.0), isnan(_653))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_653, float2(0.0), isnan(_653))).xyz;
    float _274 = _272.x;
    float _276 = _272.y;
    float _278 = _272.z;
    float2 _667 = float2(_47, _49);
    float3 _280 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_667, float2(0.0), isnan(_667))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_667, float2(0.0), isnan(_667))).xyz;
    float _282 = _280.x;
    float _284 = _280.y;
    float _286 = _280.z;
    float2 _681 = float2(_264, _266);
    float3 _288 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_681, float2(0.0), isnan(_681))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_681, float2(0.0), isnan(_681))).xyz;
    float _290 = _288.x;
    float _292 = _288.y;
    float _294 = _288.z;
    float _296 = _276 * _268;
    float _298 = _274 * _268;
    float _300 = _278 * _268;
    float _302 = fma(_292, _284, _296);
    float _304 = fma(_290, _282, _298);
    float _306 = fma(_294, _286, _300);
    out.m_40.x = _304;
    out.m_40.y = _302;
    out.m_40.z = _306;
    return out;
}


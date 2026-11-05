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
    constant _16* fp_c4 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    texture2d<float> fp_t_tcb_E [[id(6)]];
    sampler fp_t_tcb_ESmplr [[id(7)]];
    texture2d<float> fp_t_tcb_C [[id(8)]];
    sampler fp_t_tcb_CSmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    sampler fp_t_tcb_ESmplr_w [[id(12)]];
    sampler fp_t_tcb_CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_42 [[color(0)]];
    float4 m_44 [[color(1)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0), center_no_perspective]];
    float4 m_39 [[user(locn1), center_no_perspective]];
    float4 m_35 [[user(locn2), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _51 = in.m_35.x;
    float _53 = in.m_35.y;
    float2 _329 = float2(_51, _53);
    float _55 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_329, float2(0.0), isnan(_329))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_329, float2(0.0), isnan(_329))).x;
    float2 _340 = float2(_51, _53);
    float4 _58 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_340, float2(0.0), isnan(_340))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_340, float2(0.0), isnan(_340))).xyzw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float _66 = _58.w;
    float _68 = in.m_37.w;
    float _70 = in.m_37.y;
    float _72 = in.m_37.x;
    float _74 = fma(_55, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _76 = -_74;
    float _78 = fma(_76, _68, (*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _80 = -_74;
    float _82 = fma(_80, _70, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    float _84 = -_74;
    float _86 = fma(_84, _72, (*spvDescriptorSet0.fp_c4)._m0[4].w);
    float _88 = 1.0 / _78;
    float _90 = _82 * _88;
    float _92 = _86 * _88;
    float2 _404 = float2(_66, 0.0);
    float2 _96 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_404, float2(0.0), isnan(_404))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_404, float2(0.0), isnan(_404))).xy;
    float _98 = _96.x;
    float _100 = _96.y;
    float2 _416 = float2(_92, _90);
    float3 _104 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_416, float2(0.0), isnan(_416))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_416, float2(0.0), isnan(_416))).xyz;
    float _106 = _104.x;
    float _108 = _104.y;
    float _110 = _104.z;
    float _112 = in.m_39.y;
    float _114 = in.m_39.x;
    float _116 = in.m_39.z;
    float _118 = in.m_37.z;
    float _120 = fma(_62, 2.0, -1.0);
    float _122 = fma(_64, 2.0, -1.0);
    float _124 = _112 * _112;
    float _126 = fma(_114, _114, _124);
    float _128 = (*spvDescriptorSet0.fp_c4)._m0[15].y * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _130 = -_74;
    float _132 = fma(_130, _118, (*spvDescriptorSet0.fp_c4)._m0[6].w);
    float _134 = _126 + 1.0;
    float _136 = fma((*spvDescriptorSet0.fp_c4)._m0[15].x, (*spvDescriptorSet0.fp_c4)._m0[15].x, _128);
    float _138 = fma(_132, -0.5, 0.5);
    float _140 = fma((*spvDescriptorSet0.fp_c4)._m0[15].z, (*spvDescriptorSet0.fp_c4)._m0[15].z, _136);
    float _142 = rsqrt(_134);
    float _144 = rsqrt(_140);
    float _146 = _112 * _142;
    float _148 = _142 * _116;
    float _150 = _114 * _142;
    float _152 = _144 * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _154 = _144 * (*spvDescriptorSet0.fp_c4)._m0[15].x;
    float _156 = _144 * (*spvDescriptorSet0.fp_c4)._m0[15].z;
    float _158 = -_146;
    float _160 = _152 + _158;
    float _162 = -_150;
    float _164 = _154 + _162;
    float _166 = -_148;
    float _168 = _156 + _166;
    float _170 = _160 * _160;
    float _172 = _120 * _160;
    float _174 = -_160;
    float _176 = _146 * _174;
    float _178 = fma(_164, _164, _170);
    bool _182 = _138 <= 1.0;
    bool _184 = isnan(_138);
    bool _186 = _182 || _184;
    bool _188 = isnan(1.0);
    bool _190 = _186 || _188;
    float _192 = float(_190);
    float _194 = -_150;
    float _196 = fma(_194, _164, _176);
    float _198 = fma(_168, _168, _178);
    float _200 = _138 * _192;
    float _202 = precise::clamp(_200, 0.0, 1.0);
    float _204 = fma(_60, 2.0, -1.0);
    float _206 = -_148;
    float _208 = fma(_206, _168, _196);
    float _210 = rsqrt(_198);
    float _212 = -_204;
    float _214 = -_172;
    float _216 = fma(_212, _164, _214);
    float _218 = -_146;
    float _220 = _120 * _218;
    float _222 = _204 * _154;
    float _224 = -_122;
    float _226 = fma(_224, _168, _216);
    float _228 = -_220;
    float _230 = fma(_204, _150, _228);
    float _232 = -_152;
    float _234 = -_222;
    float _236 = fma(_120, _232, _234);
    float _238 = abs(_202);
    float _240 = log2(_238);
    float _242 = _120 * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _244 = fma(_122, _148, _230);
    float _246 = -_156;
    float _248 = fma(_122, _246, _236);
    float _250 = fma(_204, (*spvDescriptorSet0.fp_c4)._m0[15].x, _242);
    float _252 = _210 * _226;
    float _254 = precise::clamp(_252, 0.0, 1.0);
    float _256 = fma(_122, (*spvDescriptorSet0.fp_c4)._m0[15].z, _250);
    float _258 = 1.0 / _208;
    float _260 = precise::min(_244, _248);
    float _262 = -_144;
    float _264 = fma(_262, _256, 0.0);
    float _266 = precise::clamp(_264, 0.0, 1.0);
    float _268 = _240 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _270 = _254 * _260;
    float _272 = _270 * 2.0;
    float _274 = abs(_254);
    float _276 = log2(_274);
    float _278 = exp2(_268);
    float _280 = _272 * _258;
    float _282 = precise::clamp(_280, 0.0, 1.0);
    float _284 = _278 * _266;
    float _286 = _98 * _276;
    float _288 = exp2(_286);
    float _290 = _108 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _292 = _108 * (*spvDescriptorSet0.fp_c4)._m0[13].y;
    float _294 = _110 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _296 = _290 * _284;
    float _298 = _278 * _288;
    float _300 = _282 * _298;
    float _302 = _106 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _304 = _106 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _306 = _100 * _300;
    float _308 = _110 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _310 = _302 * _284;
    float _312 = _304 * _306;
    float _314 = _308 * _284;
    float _316 = _292 * _306;
    float _318 = _294 * _306;
    out.m_42.x = _310;
    out.m_42.y = _296;
    out.m_42.z = _314;
    out.m_44.x = _312;
    out.m_44.y = _316;
    out.m_44.z = _318;
    return out;
}

